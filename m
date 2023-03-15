Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23BCC61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 11:09:49 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.5027.1678878583225296744
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 04:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VevdsrkQ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678878581; i=@fujitsu.com;
	bh=I+agVcQV7d+CW/u00p1cRRbrYii2I8Ck1oqbw9f64AE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=VevdsrkQDHHEZ8KG+WKIsq4nO3QvZdaox+/nl2q49i/wMI1NAnbjmez89/DlzqWfY
	 sQMYdS8wDaG40El8G299GkRns+a7pYaQYHqyw1gYP3T4tOjzR9TICj5i5IiRuqM8ZA
	 onOeqfUDIorT3+mLH9AnwuAO8uYqj9DVdR5bXdg+FIoHDZm3s7vlis18jPkw9NdJUH
	 fMgZdyqHg0vbK39B1LteST+cYR4J1L4WKrS99TJ3vHj4ZL785BZVI0qvvsoRRFv1aH
	 rW8dgP/r/fFOlBWZGrKVGQKxnUL9hQfxO4mF4Zx2lhP9F204phFS9PoN+qKH1BOPa/
	 6+6sc3/ZEcMFA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8OxWbdkuWC
  KwdWf6hZ3fr5jt7g3fwGbA5PHuY0rGD06fl9nDGCKYs3MS8qvSGDN+LN/B2vBUq6KacfWMjYw
  buPsYuTiEBLYwCixbvdhFghnMZPExxPLmCGcPYwSR+fdAspwcrAJSEncuP+frYuRg0NEQE/i6
  j9RkDCzgKNE8/z7bCC2sICbxKsPK1lBbBYBVYmm+ysYQWxeASeJ81P3sIPYEgIKElMevmcGsT
  kFnCUe/XrGBGILAdV8WDGXBaJeUOLkzCcsEPMlJA6+eMEM0asoMftyMwuEXSHROP0QE4StJnH
  13CbmCYyCs5C0z0LSvoCRaRWjWXFqUVlqka6xXlJRZnpGSW5iZo5eYpVuol5qqW5eflFJhq6h
  XmJ5sV5qcbFecWVuck6KXl5qySZGYECnFCcK7WD81vtX7xCjJAeTkijvnzUCKUJ8SfkplRmJx
  RnxRaU5qcWHGGU4OJQkePmWCKYICRalpqdWpGXmAKMLJi3BwaMkwhtRD5TmLS5IzC3OTIdInW
  JUlBLnbV8KlBAASWSU5sG1wSL6EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3mUgU3gy80r
  gpr8CWswEtJh3ngDI4pJEhJRUA1P7b7nF695ts12bOFckfqL8r4uHmLw5V17ov7Ba8+WN+O/i
  jIGdS97YzXeL/TRzE2e69z5hgxld9bPfdudaSb/25HLMku7/HBJtuUv4hSaDNnPpv90lVzZGb
  3Ha2zPzjfKTC2f37n7q03Ju3W0vG5aj+433PX16w9jH4YAky3b+rdGZlc9e2bzRmruLo6H471
  E9Vff/73cEuG/T3v70k912s9jrp+UWndhzjp2voEv98ta8WN78X8+WrjiY+tVL6sEE0Rtlt3X
  TUoK7buR2X/ar449Zq7W1/VLgE0WJ6Hf3tBaEv5KYk7JpmcUJxkNbFDjmah74embmnJrvm6Wc
  3QQNutL3LH3udz1gMsMX1UlflFiKMxINtZiLihMBObahNWMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-728.messagelabs.com!1678878580!34841!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10899 invoked from network); 15 Mar 2023 11:09:40 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-6.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 11:09:40 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 0DF637C;
	Wed, 15 Mar 2023 11:09:40 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 01A1273;
	Wed, 15 Mar 2023 11:09:40 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 11:09:38 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Upgrade Helper <uh@not.set>, Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-poetry-core: upgrade 1.5.1 -> 1.5.2
Date: Wed, 15 Mar 2023 19:09:03 +0800
Message-ID: <1678878545-19387-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678878545-19387-1-git-send-email-wangmy@fujitsu.com>
References: <1678878545-19387-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 11:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178537

From: Upgrade Helper <uh@not.set>

Fixed
=======
 Fix an issue where wheels built on Windows could contain duplicate entries in the RECORD file (#555).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-poetry-core_1.5.1.bb => python3-poetry-core_1.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_1.5.1.bb => python3-poetry-core_1.5.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.5.1.bb b/meta/recipes-devtools/python/python3-poetry-core_1.5.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-poetry-core_1.5.1.bb
rename to meta/recipes-devtools/python/python3-poetry-core_1.5.2.bb
index 952ffef99d..738b978690 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.5.1.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.5.2.bb
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/typing_extensions.LICENSE;md5=f16b323917992e0f8a6f0071bc9913e2 \
 "
 
-SRC_URI[sha256sum] = "41887261358863f25831fa0ad1fe7e451fc32d1c81fcf7710ba5174cc0047c6d"
+SRC_URI[sha256sum] = "c6556c3b1ec5b8668e6ef5a4494726bc41d31907339425e194e78a6178436c14"
 
 inherit python_poetry_core pypi
 PYPI_ARCHIVE_NAME = "poetry_core-${PV}.${PYPI_PACKAGE_EXT}"
-- 
2.34.1


