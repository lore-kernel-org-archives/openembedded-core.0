Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92.1795101873672880397
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=FfZ0a1Wv;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so15166915e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 07:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795101872; x=1795706672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jRsMAggkf/pqVAmUmAb/NZRmwTmj5NI3h159AIJpvfE=;
        b=FfZ0a1Wv9/JHR1xD14VnXaRqJc1Dcn2jZlXjx8Ng2mBiRVpQXzbrWRqFe7srvVV469
         uBvR6FLozeu19AdRirBrFiFMPiQzO2hYmeVRD6gIYkoscKUc8Doc0BRJ/svggIpwrYtL
         o6eXm2xCxu9tCsITL+Py4I9asfptNQzI3Cd8roPYnOjxzYroGGf5OIUYau4j7PNF4ruw
         +ezHNzVfXiwvFB8S6z6F5nhkW+aHLDVWXA/F9UzkK77Fu5xSGQpd8nsIAAOl1QUlGU5B
         kwXd5GCsyOUjY26Ejpz6eyYKVtSq4pRE7KoLjYyrrEqz3mSuC18/uel+zJ/5IvizOLyF
         aHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101872; x=1795706672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jRsMAggkf/pqVAmUmAb/NZRmwTmj5NI3h159AIJpvfE=;
        b=OvV67h9iDjQtmOkhzTD1ZkwLrM3blafMiEUAP/QwbYG2h1PaYRDro7lpRr/b5NdKM1
         3Oj2SXDo0gCUG7mtaGXmJaA9ffCjkmrkDFFk/cqTnqK4sNuXXsurnpKQGzaRt13CJOyy
         276x2TkOLI4tca7gs3rNMBuvLcDxixdM5sz4QrWiDHyVX7ZIp+asQ3bq0Sm+T681/r+K
         Iu5bT1ms7W2/O3bJq6mxJLKujd/I6dNVE6Hm6aLMPfuwwdqDUUbuLHtAY/mTbupwF7Fy
         tPgDSCPrnaDKjQXEAUmu3hethHVmJ5KkDvVYK03FUA9H4RBg0vJuV36USdWSrGYa+IDS
         cwrw==
X-Gm-Message-State: APuU4Z9oV7Jqj+3spC+PrRKO/3z9c5WVx1c03CNjV8qTpbTHPMTlEWL5
	FUIRXNgW3i9WGoV5j9Lmj3rLA+ThAJ0gQq6K3OI6vIJgJHCKFAixjmKvLEcmO83INcuze7ejNF7
	L2mzW7MM=
X-Gm-Gg: AYBFou0NSs6/9Ba8UYwRnHQCzj3lQtRV7oVKGVYZDL7VyXbE9e4SNTZnqXNiNieutz1
	HSkzb37h2/giK5zCtUpcx5cYNYZQpXMToXd3ep1+d0C4HppNklTDvWpsaaEXHQUfa66ocW++6d8
	eEcq52ikepQgLZ6ALZF6cqTuVzcr2BSYeXEFo9dPa2dW8eyX+qYoL8QxyNKcVf3iqCH0CZd2gG7
	hg5Ivx0wGZFzRuuRvZYvRt6TrBeBYGziHU4WHXOfq1aUxNrv9A8VN0SCONcaS79lhiv4EqZcv4Z
	JbD66/AguVU1S3BC7ijVsjb7F2Jmq+2uTpGaDHUZVWoJraWbQH91ZyC2lfSkyXTPAw4h2Im0kaz
	IQhlFCklTZhUONqKjUpuSEWtArY7nlLteRBfoRYSgHojFNRX8fy3kYKFbOvJWx8d0piJz3R24u8
	PRIpFq/Ek1cRYOSbvyonDAtIWlmvqALD3YeEffQGYYDE1tGLoe3CQww3I/RCMpBFYHRzr6r3Ph/
	d15qxCjWqh3yLKInFPvGCvr5IgGM7Sd7BSRkFelRtotrIp33xIryT+zfgYC8hkz1kSLDZQ/1KUK
	KwrJeOITzu0lfcAanT8gBqkBaf+niLJDqmEFEPVjmPJxVBdCLsJ3R3GyWvnJMTs+eVcUNMZkdqY
	OvkPZyHapx3xFiJWHIj83pOpb1Os3422SrGfFr+zRrGQcPnUfTX8+IrM=
X-Received: by 2002:a05:600c:8904:b0:4bb:6f77:1e35 with SMTP id 5b1f17b1804b1-4bb7daa7fe1mr95723195e9.21.1795101871760;
        Thu, 19 Nov 2026 07:24:31 -0800 (PST)
Return-Path: <fabien.thomas@smile.fr>
Received: from FRSMI25-GIGUE ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm4222275e9.5.2026.11.19.07.24.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:24:31 -0800 (PST)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/19] curl: fix CVE-2026-87864
Date: Thu, 19 Nov 2026 16:22:42 +0100
Message-ID: <bcaed97fea01e7f07d903e15e836eb65234678b1.1795101267.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795101267.git.fabien.thomas@smile.fr>
References: <cover.1795101267.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 15:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250699
Content-Type: text/plain; charset="utf-8"

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-87864.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-87864

Upstream fix:
  https://github.com/curl/curl/commit/3b547de301342b347fb3c6ea6ae797

Tested with ptest:
Before: PASSED: 857, FAILED: 0, SKIPPED: 0, ABORTED: 0
After: PASSED: 857, FAILED: 0, SKIPPED: 0, ABORTED: 0

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../curl/curl/CVE-2026-87864.patch            | 52 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87864.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-87864.patch b/meta/recipes-support/curl/curl/CVE-2026-87864.patch
new file mode 100644
index 0000000000..9ddfb6054c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-87864.patch
@@ -0,0 +1,52 @@
+From 409f23eaf6c3a4573fa68db155010b4c9054601e Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Thu, 27 Aug 2026 09:47:53 +0200
+Subject: [PATCH] imap: APPEND CRLF fix
+
+Deny an APPEND operation with CRLF conversion requested as we are unable
+to predict the final upload size and APPEND requires us to announce it
+before starting the upload.
+
+The check for unknown sizes had already been there, but the crlf
+conversion that renders a known size unknown was not accounted for.
+
+Closes #22702
+
+CVE: CVE-2026-87864
+Upstream-Status: Backport [https://github.com/curl/curl/commit/3b547de301342b347fb3c6ea6ae797]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/imap.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/lib/imap.c b/lib/imap.c
+index 0e013e740a..6e4194b0cf 100644
+--- a/lib/imap.c
++++ b/lib/imap.c
+@@ -790,7 +790,6 @@ static CURLcode imap_perform_append(struct Curl_easy *data)
+       result = Curl_creader_set_mime(data, &data->set.mimepost);
+     if(result)
+       return result;
+-    data->state.infilesize = Curl_creader_client_length(data);
+   }
+   else
+ #endif
+@@ -800,9 +799,15 @@ static CURLcode imap_perform_append(struct Curl_easy *data)
+       return result;
+   }
+ 
+-  /* Check we know the size of the upload */
++  /* Check we know the size of the upload. This takes all readers
++   * into account. Especially crlf conversions which make the size
++   * unpredictable, e.g. -1. */
++  data->state.infilesize = Curl_creader_total_length(data);
+   if(data->state.infilesize < 0) {
+-    failf(data, "Cannot APPEND with unknown input file size");
++    if(data->set.crlf)
++      failf(data, "Cannot APPEND with CRLF conversion making size unknown");
++    else
++      failf(data, "Cannot APPEND with unknown input file size");
+     return CURLE_UPLOAD_FAILED;
+   }
+ 
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index d1df661b1a..076c8756f5 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -48,6 +48,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-86409.patch \
            file://CVE-2026-92388-1.patch \
            file://CVE-2026-92388-2.patch \
+           file://CVE-2026-87864.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
