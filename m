Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29832.1793868245168627884
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=WQ1Erk3b;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e10a70540so967813f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868243; x=1794473043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y5NabnRNijO9A1Xgtz9zUCqMOaZOv7lIU7BNgWrU9JI=;
        b=WQ1Erk3b4IpEHaSZXXF+O3dEC0OsJj/yVs8ufDvRDqS7/vJHAt7DE4fnadFoinWZBM
         g169BbgdeQFT1FLmDGudoWwwKl2XIWOx+0bQrjxBF7MDcxmJr2zI89kb+b8q5Fg8DbSz
         SAkwl5DobCPPhvdpbp8M+WllFB8U1tEse/eDYee8GqXjkzd5pZ9+sR6uRoUeJ96ibKAv
         zM1F9E0p0SRS9DcZhSrfEbl/9IImw9d0w3Hea24zNPgSXyvFw5/eKDQoVcEUSdanfkxF
         YkV58wObY3E6MfpAw/HXhukNdBju1eLs8++AfdtGWThcIVa+Fl3XeMpSNeWngNdX2ffJ
         Pnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868243; x=1794473043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Y5NabnRNijO9A1Xgtz9zUCqMOaZOv7lIU7BNgWrU9JI=;
        b=eI7fcOlswkhRLwf5pKKHWIrHEpmhPzM7E+Qv1q2RKbT/37qYiFQQDlCEQ1y4dpPb5K
         rHxDfgrYvRTq8dQsM/r2M4fTR6umfOIP8X672xJMEdW9AV7VGcUvmJt8/DUgrGpvn1Zk
         +5KiNizmg4KBLiCVJtZQZrN5ZIMeYmLr/u36VHWNLAA2rGBFflfGhNidHT4OXGGI8Su1
         xOXC9t7mYIpUrjJrSQ+QXMvNFQUptri5yPOz46yROA7t/QFZcRQNeTES6iQaPpPiNinB
         4/k21X+DfAolUsS/SjzkPBmqNHVLCVHzQ2xNxvr7vApEneLn+wCHQR55/vNbraIRu0KC
         9WOw==
X-Gm-Message-State: APuU4Z/NZ0w22K7hiKu6l9+ixiymrn+Qm/1qncuxJF48LmnwJsmv+mOC
	pBeJevTExWa2JAFo0ERAvnMEAkisgcNnTDK5fTZEq/aDCtVPtRPz6BtWiRpxH5jdFo9md6fGb3J
	OP5k3PE8=
X-Gm-Gg: AYBFou1zSo8OwmgVgiW1CnIS4IGqR5uunT4lzbMjAECZk353IZPN0fL4ISi7n+Doda6
	4F8620lHwPOyyWYIDbzA9G5+c4NfAcG4hYAdTIOglaOCU7GViRlpwaaXANUk2+h4y+b3mnyT+jV
	7zucRdUNIZ8FK2+UczTXErekJboG2km6D1B96G0fUHfaM8BFo0mbqPtKauFLgOq4Z+NHC7v/+tM
	d+u3wV3X7DU3VhwAGt6pkjkNUI4hpEFjIMuqHACj/XJ9jZDX/d0+2lcrx2aeFcIe+ldiK0xnyZb
	k0F5eaMyXuyXokyLlVvmOs0ogT8CUU3WNbFCAeqPPt7Np/zU3CeaqnEMUiycQz1VQZbXYFsmhWV
	24i0uci70sqQ+iNTbJqOfm7TvvziaiSmU9N8Z2nRpVZMQHzrTlYlz1sATztY4reojIRJADZQWH3
	t1PM0T0lXRzIcOzgHMIU2A3xDrA0N+2a+YByCLvnTNYcC9kvZLZByXPejQg6muNKfGPxoNRtQzZ
	ZEcSGK0AAt94JObYb6eMRxoe0aWXSfCRRzuZ2+mYQGxqgn+rYRllCvqooiO+sUS+YUOqYz2wfZT
	/OMugjEC7lipAZBMNlxkm5m43CVPM0cRa+cbw7SrhdwX8W+pufAwiDNNrnN8720gQnvHD2oeo+e
	zIlu9+jXXNT8Tji0keL4vyCmukiej
X-Received: by 2002:a05:6000:430d:b0:490:da85:7aee with SMTP id ffacd0b85a97d-490da857cbemr5022719f8f.24.1793868243304;
        Thu, 05 Nov 2026 00:44:03 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.44.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:44:03 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 47/60] tcl, tcl8: set override-specific ptest skips in SKIPPED_TESTS
Date: Thu,  5 Nov 2026 09:43:06 +0100
Message-ID: <fbad0ddd1166278df6bbdac603412e3d880f4842.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249506
Content-Type: text/plain; charset="utf-8"

From: OOHehir <oo.hehir@gmail.com>

On musl, the sed meant to add the unixInit-3 skip once added it after every
SKIP="$SKIP line in run-ptest, & a skip set inside a case arm left run-ptest
with a syntax error. Write SKIPPED_TESTS into run-ptest's empty SKIP="" instead,
as python3 does; the common skips stay in run-ptest.

Suggested-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: OOHehir <oo.hehir@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e175045bf914c2502314825ad555975452deb054)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/tcltk/tcl_9.0.4.bb    | 11 ++++++-----
 meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb | 11 ++++++-----
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.4.bb b/meta/recipes-devtools/tcltk/tcl_9.0.4.bb
index 97ba82d5fa1..5166ef25112 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.4.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.4.bb
@@ -75,14 +75,15 @@ do_compile_ptest() {
 	oe_runmake tcltest
 }
 
+# Override-specific skips; do_install_ptest needs the empty SKIP="" in run-ptest
+SKIPPED_TESTS = ""
+# Assumes locales other than provided by musl-locales
+SKIPPED_TESTS:append:libc-musl = " unixInit-3*"
+
 do_install_ptest() {
 	cp ${B}/tcltest ${D}${PTEST_PATH}
 	cp -r ${S}/tests ${D}${PTEST_PATH}
-}
-
-do_install_ptest:append:libc-musl () {
-	# Assumes locales other than provided by musl-locales
-	sed -i '/SKIP="$SKIP.*$/a # unixInit-3* is suppressed due to hardcoded locale assumptions\nSKIP="$SKIP unixInit-3\\\*"' ${D}${PTEST_PATH}/run-ptest
+	sed -i -e 's|^SKIP=""$|SKIP="${SKIPPED_TESTS}"|' ${D}${PTEST_PATH}/run-ptest
 }
 
 # Fix some paths that might be used by Tcl extensions
diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
index 2094c9935ab..07f3ad4592d 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
@@ -79,14 +79,15 @@ do_compile_ptest() {
 	oe_runmake tcltest
 }
 
+# Override-specific skips; do_install_ptest needs the empty SKIP="" in run-ptest
+SKIPPED_TESTS = ""
+# Assumes locales other than provided by musl-locales
+SKIPPED_TESTS:append:libc-musl = " unixInit-3*"
+
 do_install_ptest() {
 	cp ${B}/tcltest ${D}${PTEST_PATH}
 	cp -r ${S}/tests ${D}${PTEST_PATH}
-}
-
-do_install_ptest:append:libc-musl () {
-	# Assumes locales other than provided by musl-locales
-	sed -i '/SKIP="$SKIP.*$/a # unixInit-3* is suppressed due to hardcoded locale assumptions\nSKIP="$SKIP unixInit-3\\\*"' ${D}${PTEST_PATH}/run-ptest
+	sed -i -e 's|^SKIP=""$|SKIP="${SKIPPED_TESTS}"|' ${D}${PTEST_PATH}/run-ptest
 }
 
 # Fix some paths that might be used by Tcl extensions
