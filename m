Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.174.1792511566537557912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 08:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FcW1czrn;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: oo.hehir@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso27597585e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 08:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792511564; x=1793116364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLLPerXjp384NHn3HEGO4Yb8D89+ITkj2PrTMpah6bg=;
        b=FcW1czrn2zql/yTo+gWujxazkF9qJBe3bfrbN7kaRgTD1PkvY5JK70xPP1xSk/N4ZF
         AD/NPSsSLAgOU2xHMKC4umt9cROQekmw4dPXFxKMm4cxjJFZDSYcOCjsh8/LAamTZ1Q1
         JbXfptQPauZmccTH7tPej0sqAZJYQ5AnJR3gdN3ooLCaIKjZpVqceNznD8+0uV0HnMn5
         u54v/VSsxPsjfltyksJRja9nQOWLmLdUPKM4W51sD6JAmX73HX1/fuxO7kzWUtORIq+5
         S923g/adNtBVlwuQpecyn3qeJu3qnTLuEKPzuzZSw7WZOGHHbZO5qip/F10EpPT9DNz8
         inFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792511564; x=1793116364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oLLPerXjp384NHn3HEGO4Yb8D89+ITkj2PrTMpah6bg=;
        b=Tzymuj3+BfAIPaJzdOW4wCak6OjjUOxnomRGi8bbLi/3392Z8qVT8UzvrUFX9GoV+L
         gS4NkguY/jzqymH0fFNGuHls682ouptsXyxkb46pXe6YOMJrfkHFmOFpnI/nE80Qb7m1
         lV9LHqCq9nUn/7SpNi7cVm06lC8PughS4pRNXS130j4C+JPIZisp4zz4knGppCvVHzem
         8DIMGKbq7oJ2+SR1uKi1VHnCcBRvKY/U73NnPHDVYMRzEplghGmCF3YomhNXOFmudEUJ
         2YOBBNLHad+PgKDtDtUxWvJw9AFf9z+opklUmXgPc59BB9EHIVWfqiiyr3tBuiiWD/NK
         HbsA==
X-Gm-Message-State: AFq9FYKPtKO/BIyq0iS3OAyPlTG0akM4rY0liHYCGEJsb5uhTw/8Z58D
	MX7w79qZjjUoLqcuTUikmfk3aPgE7asblcFxFv/wW8qD7bGvfLXlyoaSinF8Df0ZnWOz1g==
X-Gm-Gg: AYBFou0ObtxeGGIQxqZRNFLjoDQFvtEBgO3eSQwOyOiuCD19JJJdHewyxVvb8xry6ot
	TqZKT3rU1cKIzt7HVW62KJTbr+UkpD6HkgZ1njyU4FiVy+lMx6b3nckxaWR6RQJJC7FuvlPFaZu
	kY+ys9f4nH7K/JeKG3W6nr5/6DMVferx655cxC4S+Dh8qrv/oRW1aO1rv/yvBfC7BzgPJvmCNZb
	HUBasADbSxdF6KMd0hBxCx/cNjWSMriNl0p08C6IMg7605Mxq76S7eL6w9TVI+nT1As3riH53q0
	E3xlbEX2eoSFsMI9cEUTOT/OB9ZrCJJi3qdyD00qKrd27B20GhtVA/+aw0u+FoEZHS6BepUF1Yz
	8OHSQW/nFAfeVOFJmDR3vKgeejBED/nJ+L07EGDlIdBSxi1P3WrSRUxntMca6RcHiNtcszaMuO4
	MXOnriQQV/cQ6JWff/ThTfOZSvM/GQl+O/LNZwM6k4VSJQvDwTN6yy6i0KvGc2hOwFoYfWcW3ua
	F695ZZKONB69B/ZGtqgTCzXljmjraUS
X-Received: by 2002:a05:600c:540f:b0:4a1:97c6:d2e8 with SMTP id 5b1f17b1804b1-4a1d7633b35mr238458275e9.32.1792511564486;
        Tue, 20 Oct 2026 08:52:44 -0700 (PDT)
Return-Path: <oo.hehir@gmail.com>
Received: from hp-z640.fritz.box ([51.37.195.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33ad3fsm307375725e9.5.2026.10.20.08.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:52:43 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
X-Google-Original-From: OOHehir <40183643+OOHehir@users.noreply.github.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	tgamblin@baylibre.com,
	mathieu.dubois-briand@bootlin.com,
	ross.burton@arm.com,
	OOHehir <oo.hehir@gmail.com>
Subject: [PATCH v3 1/3] tcl, tcl8: set override-specific ptest skips in SKIPPED_TESTS
Date: Tue, 20 Oct 2026 16:52:36 +0100
Message-ID: <20261020155238.1923076-2-40183643+OOHehir@users.noreply.github.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016204547.2328847-1-oo.hehir@gmail.com>
References: <20261016204547.2328847-1-oo.hehir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248316
Content-Type: text/plain; charset="utf-8"

From: OOHehir <oo.hehir@gmail.com>

On musl, the sed meant to add the unixInit-3 skip once added it after every
SKIP="$SKIP line in run-ptest, & a skip set inside a case arm left run-ptest
with a syntax error. Write SKIPPED_TESTS into run-ptest's empty SKIP="" instead,
as python3 does; the common skips stay in run-ptest.

Suggested-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: OOHehir <oo.hehir@gmail.com>
---
 meta/recipes-devtools/tcltk/tcl_9.1.0.bb    | 11 ++++++-----
 meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb | 11 ++++++-----
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_9.1.0.bb b/meta/recipes-devtools/tcltk/tcl_9.1.0.bb
index 6e8a97c729..483722c0e3 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.1.0.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.1.0.bb
@@ -78,14 +78,15 @@ do_compile_ptest() {
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
index 2094c9935a..07f3ad4592 100644
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
-- 
2.43.0

