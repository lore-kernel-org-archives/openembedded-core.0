Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.10559.1628177729010636397
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mHPeDpPJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id u25so7884145oiv.5
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3QtWrBYLr0jxuKYYua1r3B3N6MoEFeYproSPRSrkiDU=;
        b=mHPeDpPJwiJlX+2njrdQa1hy9vRgOdHasuRsvbySWlefZHkQUALzBAeZJgNC8/9goP
         /vDKP96klv+1mHet7S4VhtNzcsHkrmNb/0X0kdd2mmw9897qrdHXgnrWMs2Hz+i7aHEq
         VJpqQea99WKpV5N4Yhhebun4n1eE3Fa9X3nOMHyEh23vVN3jWpWia2NMycFTaPRh+uMr
         qS3aJLQNPl7+j0MQQhkd7qNH8aiJPSpNLeLQZbbRAZC4BnjyGi60kb75k5w4kpzhERlQ
         0906n/A9AU0a/1PUwfTUdusPsrFbnT9rWDdsFhW+HvP0bwnClgb3Rgi4LjUv3hWnzb57
         QNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3QtWrBYLr0jxuKYYua1r3B3N6MoEFeYproSPRSrkiDU=;
        b=LabRamcK/7r0M6TqFUMRx5pseriLQgM1iuQD9FIpM87fwb/7SBXzg7xFbwj0bGFjHg
         1NkMExnnLixZAuEWcz0/kd3u4Bm6Iz8rxo++CfnPw29RF+b0omx5q09Nm6lq3qh8D6fv
         NxHdmIRS3JBokgUC68Byv0a00BNpXbm0fyv69jejAhF1C/dY89r3RpuMuSAfpjamH1U0
         f8gE8yg76x64dGPK49jD0TLlNE2qt9aov4lpvVOW1VaA5iJ+4C1jFbP4xKj4r6DiF9no
         szkf96avvTCdrhMumibQcH1IljouZQpcmIJ0byawA9gm+HWX+OX9vq9XIHaEg9weA2jI
         rsvw==
X-Gm-Message-State: AOAM5302fHz+hARaBZN6WJrLLPC//wxViX1pu3rhptrtaPt0BzpELMq8
	IPgamEQC9nKOGiM0ZjZU8fG9nebuUWiGgFVx
X-Google-Smtp-Source: ABdhPJyxzHJFOcTfIE5oH53Ibow0mtUMHubYBfbXD+Q+d3elhyAsAE86NGKJWEMkX6FB/Vxh7GpChQ==
X-Received: by 2002:a05:6808:8e6:: with SMTP id d6mr1145747oic.2.1628177727907;
        Thu, 05 Aug 2021 08:35:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.35.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:35:27 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/33] curl: Fix for CVE-2021-22898
Date: Thu,  5 Aug 2021 05:33:43 -1000
Message-Id: <ba99fce9354555e556158a0af8ec809ae00cb62b.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Neetika Singh <Neetika.Singh@kpit.com>

Applied trivial patch for cve issue CVE-2021-22898

Link: https://github.com/curl/curl/commit/39ce47f219b09c380b81f89fe54ac586c8db6bde

Signed-off-by: Neetika.Singh <Neetika.Singh@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2021-22898.patch            | 26 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22898.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2021-22898.patch b/meta/recipes-support/curl/curl/CVE-2021-22898.patch
new file mode 100644
index 0000000000..0800e10175
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22898.patch
@@ -0,0 +1,26 @@
+From 39ce47f219b09c380b81f89fe54ac586c8db6bde Mon Sep 17 00:00:00 2001
+From: Harry Sintonen <sintonen@iki.fi>
+Date: Fri, 7 May 2021 13:09:57 +0200
+Subject: [PATCH] telnet: check sscanf() for correct number of matches
+
+CVE: CVE-2021-22898
+Upstream-Status: Backport
+Link: https://github.com/curl/curl/commit/39ce47f219b09c380b81f89fe54ac586c8db6bde
+Bug: https://curl.se/docs/CVE-2021-22898.html
+---
+ lib/telnet.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/telnet.c b/lib/telnet.c
+index 26e0658ba9cc..fdd137fb0c04 100644
+--- a/lib/telnet.c
++++ b/lib/telnet.c
+@@ -922,7 +922,7 @@ static void suboption(struct Curl_easy *data)
+         size_t tmplen = (strlen(v->data) + 1);
+         /* Add the variable only if it fits */
+         if(len + tmplen < (int)sizeof(temp)-6) {
+-          if(sscanf(v->data, "%127[^,],%127s", varname, varval)) {
++          if(sscanf(v->data, "%127[^,],%127s", varname, varval) == 2) {
+             msnprintf((char *)&temp[len], sizeof(temp) - len,
+                       "%c%s%c%s", CURL_NEW_ENV_VAR, varname,
+                       CURL_NEW_ENV_VALUE, varval);
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 13ab29cf69..9b510bcf9f 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2020-8286.patch \
            file://CVE-2021-22876.patch \
            file://CVE-2021-22890.patch \
+           file://CVE-2021-22898.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.25.1

