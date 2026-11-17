Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2091.1794939638964462226
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 10:20:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=b8YFbtdV;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e09aa5264so27504f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794939637; x=1795544437; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zGcn3MD3jb7aoD7trwZIn8XpeKeOb5rzH8PEH5DCxoM=;
        b=b8YFbtdVHXrIUfToPypLoH8O4pXHZLZa46BmQ1skbUjsCBmBgzOceo03P7Htct8owC
         yFg1OaIYp2vpPSeruQ5kzMi2MYZ/ZkPzv1UVQdkob/AUfSw5f9uur5puK/Byka0J0aX+
         T2z3GVguOdvB8IJlnsHvImaQUyz79LmuJki9FRXHpMrXHXWZd7W464bppwdImKRDVUha
         Bd5xUVs0OU8RNSujNkLjciVXro3wFeAp4u0ahtOZFeFP9yB/hMHXUiEZhHkmvqMwJ4B+
         4OI5YUZ+uT5kFeIUlj9P+72FTORWwDneNcpvqIJR6dODlkGmmDiqt67GVarL+Gf0r87R
         qO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939637; x=1795544437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zGcn3MD3jb7aoD7trwZIn8XpeKeOb5rzH8PEH5DCxoM=;
        b=EmV+KbJX/6sc54iu8I0dB/nN9FITkeCSkjY4XHGcpOafja6Z2hNvZfT3TnaZv1s8lt
         2MqztZ35j6b6ileIAEQYPpqLunHFDCQBSDioBUXznDgi89Led3KDmosLk7zwrV7QDmNx
         54KwDEMsMAWMtiPQRpP81CefiawAub1/aZRYaxA8YBroOg5jniwkE+Mf1oLjeKzcI5bi
         Srn3WMvGmBAjIjQc4zUt3V0wiUJv8FH9JU/rLy6sA5mhTsapJfMa8E+bID/VGL2yyUeq
         NUnaX8MH1PLpS1tEUisy4PW0h7m6w/G1sS/DkW5DjnlBajW0uxloSBIdWSi+NyjqvRVs
         zVcA==
X-Gm-Message-State: APuU4Z+pDGsDy8s4ILWvaMSTkIWctzLWjk8FG1D5uBTKx93l2EcMcFIg
	svSrj5NLBwmnGEi+5rTNfHzn7e7erwYUPBfSomrd7MzZalUFNQa/u1KCEtPLrE3UflMJZu2MWcT
	wGUOwOPc=
X-Gm-Gg: AZFdTZdibRTl8LlDo4zAN3dvaNuN46MAJToHuvduWtF8bEvLPo2TxCrUV4AiqloCnh5
	cfaxR2AtU4+SHlv3MYBRXf+fNm25CUPfPgELx1X35hfHYPme1U+D1SI1uNY+Ks6tfUpv1DUcHqb
	5hUYd5eOe9H6PvrUvfOmIsGm62LBPzhEakSIzgdZA9ERdkOsicvIgOq3Q8dVOyJtV3bFxuz11FO
	iPMjRkj2qTbDS9m/Eb7BBepB1fDj/gUHitX442kD8TurlhTuxH4ItzFppCAA9KqHSyAbb0dTGsw
	6h6/JOriECP9hRtDxnBmuzkMUfnpDXebxBhUaGcF0KQ29szisK0argIqRnN6FnJHebtjCtBAvWZ
	YShcoVxirfkAqZ6rcbAcwdOi3fyl5oclc7Rx4/nzbS1iyN8RJGFqgW4ZTArxOQjfbKDx8RpEFcZ
	B8wDjRFYwW9Q5dhtY2W1BgpCGh7YcunFY1aH/VtctatZh6MXQgsCpkr8NmdZEFlWDK3foIJXrHj
	zIGFAD5MGxh95471lpqO+iIB7I3+JzA9re/dKU1Z5veZjjlnVr0vMunlyeo2jWDSISxp9O5aTUd
	DqN4NOd9d2q6mUKoH1auGnokAmeQ2T2nmaWNRZU3BcAmjvRX4vDKOfrVpHstdkMHZGLV672AwEx
	fNRo41Od/plVODrQE3VnwvpRLHfOb
X-Received: by 2002:a05:6000:240d:b0:4a6:4687:233e with SMTP id ffacd0b85a97d-4a6468725f3mr425322f8f.7.1794939637061;
        Tue, 17 Nov 2026 10:20:37 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm114337f8f.15.2026.11.17.10.20.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:20:36 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 07/17] curl: fix CVE-2026-87864
Date: Tue, 17 Nov 2026 19:20:07 +0100
Message-ID: <0c75c23237210e083fd5a6995616a4e5769d2b27.1794939400.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794939400.git.yoann.congal@smile.fr>
References: <cover.1794939400.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 18:20:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250474
Content-Type: text/plain; charset="utf-8"

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-87864.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-87864

Upstream fix:
  https://github.com/curl/curl/commit/3b547de301342b347fb3c6ea6ae797

Tested with ptest:
Before: PASSED: 1006, FAILED: 0, SKIPPED: 0, ABORTED: 0
After: PASSED: 1006, FAILED: 0, SKIPPED: 0, ABORTED: 0

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-87864.patch            | 52 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87864.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-87864.patch b/meta/recipes-support/curl/curl/CVE-2026-87864.patch
new file mode 100644
index 00000000000..01efc71c4ae
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-87864.patch
@@ -0,0 +1,52 @@
+From ca1b787c594b2f1b2fc7227b75d2166551aca32d Mon Sep 17 00:00:00 2001
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
+index 0546595f89..f37568fb20 100644
+--- a/lib/imap.c
++++ b/lib/imap.c
+@@ -884,7 +884,6 @@ static CURLcode imap_perform_append(struct Curl_easy *data,
+       result = Curl_creader_set_mime(data, postp);
+     if(result)
+       return result;
+-    data->state.infilesize = Curl_creader_client_length(data);
+   }
+   else
+ #endif
+@@ -894,9 +893,15 @@ static CURLcode imap_perform_append(struct Curl_easy *data,
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
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 4c0ce6beb35..b6e05f66e42 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -40,6 +40,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-9546-02.patch \
            file://CVE-2026-82208.patch \
            file://CVE-2026-80230.patch \
+           file://CVE-2026-87864.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
