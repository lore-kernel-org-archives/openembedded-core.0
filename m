Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC63CD3430
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 11:23:48 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12539.1777893823795992209
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2026 04:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WovtB1yr;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: nmjain23@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b7d3ecc10dso35736225ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 04:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777893823; x=1778498623; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VQ39/S3U8dcmYfNbKqGBq7CIM0tDngI+tjKYlAUq0D4=;
        b=WovtB1yrymeBQ6KeqtO+x/I9U0hgrvUYW7DylPKKBuUa1pfKtUIEU0wAu15W1lJIv7
         lF2XSVICU+Wm9lryNM1zNMrgYKz7YjAWdFV3RX9TNdCq2CK6LajhhtxJwYYEMJjwCJge
         QJ5OBjMgUcaKg7liAJ/vIt36unSRfnY8JW/tVxDuDW8HLLBDNQZuJWwvaC1r65LmppVQ
         VRYApJ4Vazup0P3FW81M1r5ohkP7IzedJ5MiJ6S4y/10Z5RpZtYUPy6M41HePiXPIGLQ
         LXP5SELOT4xfP1JpCoDu51YTaXR//gdekC7ZVQK/wnxk8ClBU1812E0ifhgldqO/d8EI
         OM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777893823; x=1778498623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQ39/S3U8dcmYfNbKqGBq7CIM0tDngI+tjKYlAUq0D4=;
        b=ZaMHNJ0+S95sL2ovKjZS1Swg3vqqEiFEDaSdf3xcTe5DpSy+vL2jl5BESb9H2J23xz
         /2svlpqOHn0psTr4cWtIiZHbe5Nfj+n5H/RNPKOXhVRSacrCWguPpzn5KlAweB887XJd
         wYMVg8UN459SAx3QUq2e9R+HvhxSmVDKZq40il3dxWNtls4my1lnkm+Z5FhsJ4A2iwNg
         RyqpKFNTP8RmGXcVYbqLD69kokbdJn1AQyURM6dOgbQTTY9GXxobihz8XVF+vf7QCgWx
         8id8k2TjTihGNGKD2grc9biGHpu9JeanWcD2nO9A9AkCSDAARM+lLUU46J6DAD4IPpi4
         cpmQ==
X-Gm-Message-State: AOJu0YwuA0D2/ARgCNK2IBIDuzS3JCDowVXd/VLmc5VdcGyzphVxfzWm
	aBAhRt52/aGdrame/QIbeiuQLyFa7/UgwcjAEy5G7LF1NPJJQ0yeNTcAg+ZkoA==
X-Gm-Gg: AeBDieuizoCBeu2O4buAclCmlN+wP3U0OhWDUitqSTLSqy9Utah0LM7iXk5yKCa/0+O
	LbgycoYj84YUUCpWLSzDANUy7B5ZNZpLezHJnzP/eCea+AKSxAtIULGE1cQDLhP6bhrlxryzD6U
	dgcpcJTb5O/cX94a51s6WErDO3paCcBmeiK1NDVzG1tcFheOKVtiToT7e93JUuZtAWLlV7adn58
	gaMgY5d2G/oNMZgHO4vLjhx+/PzRsId1TI3xIIrJo9rHfsuMm/0I001ZK/CoYMuY1zqo+tBggRX
	+y0Il7yQ2LNuWI73h4/mJzZa9pQ7hlyY4/hmI2mPMn+qMeQEtPE9L9NKrKtXL+7oALvcSrCZAHt
	3i7VgDEgdmQyF5Ha5vabeD+2Rd7mfpY/8zPIjwDg2xq5Mztmvkz+NWMSg7i334o6DBBkC1FSk9z
	3adD4wEofXXASTTdcaD2TDSsQOQ27wh28Wa33RNXQ7ZHtmggikC5Ahex3IUBQi8z8A371acTA=
X-Received: by 2002:a17:902:fc87:b0:2ae:b9cd:d2ce with SMTP id d9443c01a7336-2b9f25fc690mr90790865ad.27.1777893822777;
        Mon, 04 May 2026 04:23:42 -0700 (PDT)
Received: from LL-3450LLL.kpit.com ([103.133.67.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae58906sm100381995ad.74.2026.05.04.04.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 04:23:42 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <namanj1@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: sana.kazi@bmwtechworks.in
Subject: [meta][scarthgap][PATCH] python3-urllib3: fix CVE-2025-50182
Date: Mon,  4 May 2026 16:53:21 +0530
Message-Id: <20260504112321.1912618-1-namanj1@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 11:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236448

From: Yogita Urade <yogita.urade@windriver.com>

urllib3 is a user-friendly HTTP client library for Python. Prior
to 2.5.0, urllib3 does not control redirects in browsers and
Node.js. urllib3 supports being used in a Pyodide runtime utilizing
the JavaScript Fetch API or falling back on XMLHttpRequest. This
means Python libraries can be used to make HTTP requests from a
browser or Node.js. Additionally, urllib3 provides a mechanism to
control redirects, but the retries and redirect parameters are
ignored with Pyodide; the runtime itself determines redirect
behavior. This issue has been patched in version 2.5.0.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-50182

Upstream patch:
https://github.com/urllib3/urllib3/commit/7eb4a2aafe49a279c29b6d1f0ed0f42e9736194f

(From OE-Core rev: 082b865d9814e7e7aca4466551a035199aa8b563)

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 0372024fe7ab2cea5eddf686f9bee0f8f07a2000)
Signed-off-by: Sana Kazi <sana.kazi@bmwtechworks.in>
---
 .../python3-urllib3/CVE-2025-50182.patch      | 112 ++++++++++++++++++
 .../python/python3-urllib3_2.2.2.bb           |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch

diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch
new file mode 100644
index 0000000000..3c0efec119
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2025-50182.patch
@@ -0,0 +1,112 @@
+From 7eb4a2aafe49a279c29b6d1f0ed0f42e9736194f Mon Sep 17 00:00:00 2001
+From: Illia Volochii <illia.volochii@gmail.com>
+Date: Wed, 18 Jun 2025 16:30:35 +0300
+Subject: [PATCH] Merge commit from fork
+
+CVE: CVE-2025-50182
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/7eb4a2aafe49a279c29b6d1f0ed0f42e9736194f]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ docs/reference/contrib/emscripten.rst      |  2 +-
+ src/urllib3/contrib/emscripten/fetch.py    | 20 ++++++++++
+ test/contrib/emscripten/test_emscripten.py | 46 ++++++++++++++++++++++
+ 3 files changed, 67 insertions(+), 1 deletion(-)
+
+diff --git a/docs/reference/contrib/emscripten.rst b/docs/reference/contrib/emscripten.rst
+index a8f1cda..4670757 100644
+--- a/docs/reference/contrib/emscripten.rst
++++ b/docs/reference/contrib/emscripten.rst
+@@ -68,7 +68,7 @@ Features which are usable with Emscripte
+ * Timeouts
+ * Retries
+ * Streaming (with Web Workers and Cross-Origin Isolation)
+-* Redirects (determined by browser/runtime, not restrictable with urllib3)
++* Redirects (urllib3 controls redirects in Node.js but not in browsers where behavior is determined by runtime)
+ * Decompressing response bodies
+
+ Features which don't work with Emscripten:
+diff --git a/src/urllib3/contrib/emscripten/fetch.py b/src/urllib3/contrib/emscripten/fetch.py
+index a514306..6695821 100644
+--- a/src/urllib3/contrib/emscripten/fetch.py
++++ b/src/urllib3/contrib/emscripten/fetch.py
+@@ -403,6 +403,21 @@ def send_request(request: EmscriptenRequ
+             raise _RequestError(err.message, request=request)
+
+
++def _is_node_js() -> bool:
++    """
++    Check if we are in Node.js.
++
++    :return: True if we are in Node.js.
++    :rtype: bool
++    """
++    return (
++        hasattr(js, "process")
++        and hasattr(js.process, "release")
++        # According to the Node.js documentation, the release name is always "node".
++        and js.process.release.name == "node"
++    )
++
++
+ def streaming_ready() -> bool | None:
+     if _fetcher:
+         return _fetcher.streaming_ready
+diff --git a/test/contrib/emscripten/test_emscripten.py b/test/contrib/emscripten/test_emscripten.py
+index 5eaa674..fbf89fc 100644
+--- a/test/contrib/emscripten/test_emscripten.py
++++ b/test/contrib/emscripten/test_emscripten.py
+@@ -964,6 +964,51 @@ def test_redirects(
+         selenium_coverage, testserver_http.http_host, testserver_http.http_port
+     )
+
++@pytest.mark.with_jspi
++def test_disabled_redirects(
++    selenium_coverage: typing.Any, testserver_http: PyodideServerInfo
++) -> None:
++    """
++    Test that urllib3 can control redirects in Node.js.
++    """
++
++    @run_in_pyodide  # type: ignore[misc]
++    def pyodide_test(selenium_coverage: typing.Any, host: str, port: int) -> None:
++        import pytest
++
++        from urllib3 import PoolManager, request
++        from urllib3.contrib.emscripten.fetch import _is_node_js
++        from urllib3.exceptions import MaxRetryError
++
++        if not _is_node_js():
++            pytest.skip("urllib3 does not control redirects in browsers.")
++
++        redirect_url = f"http://{host}:{port}/redirect"
++
++        with PoolManager(retries=0) as http:
++            with pytest.raises(MaxRetryError):
++                http.request("GET", redirect_url)
++
++            response = http.request("GET", redirect_url, redirect=False)
++            assert response.status == 303
++
++        with PoolManager(retries=False) as http:
++            response = http.request("GET", redirect_url)
++            assert response.status == 303
++
++        with pytest.raises(MaxRetryError):
++            request("GET", redirect_url, retries=0)
++
++        response = request("GET", redirect_url, redirect=False)
++        assert response.status == 303
++
++        response = request("GET", redirect_url, retries=0, redirect=False)
++        assert response.status == 303
++
++    pyodide_test(
++        selenium_coverage, testserver_http.http_host, testserver_http.http_port
++    )
++
+
+ @install_urllib3_wheel()
+ def test_insecure_requests_warning(
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
index f6ac8f89ca..19c51b68a7 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb
@@ -12,6 +12,7 @@ SRC_URI += " \
     file://CVE-2025-66418.patch \
     file://CVE-2025-66471.patch \
     file://CVE-2026-21441.patch \
+    file://CVE-2025-50182.patch \
 "
 
 RDEPENDS:${PN} += "\
-- 
2.34.1


