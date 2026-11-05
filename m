Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30061.1793868229296866274
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=klF25IsQ;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dee593f18so1232697f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868227; x=1794473027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PK0P14qDX94DJbEHR7uLPn8tn1IKbHxt4EGjYlQMddw=;
        b=klF25IsQaMAF7wbo6/NGLXgsMITk11KD2MExRVpySyqVyjYJLD5wNlZlNyDfBGRpip
         8XMm8vtpQNbNIzbuUoWKJUmm1FjOxt1ZMrpYKBKTH0MHis1vIsc/EDuMLJeKlJ2jsqf9
         VCDsItGqeLm9U5H02gIvFITrb0AAGehIg+gxzzPRCeilNUPygudVVfsAgUbbu9BFQQMb
         F82etqaqPeLSHVtW2h32URaymyZf20XhLI+aUEQVyUL+DiUHP9PFfPJgf8uf/QpclLLY
         h5fu3dG9nyFYCE4vlro9wEg9wEf0WMLmesTpjzQD7vRyLlpwQBd1QgRoz+lWNz0x14mz
         +ThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868227; x=1794473027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PK0P14qDX94DJbEHR7uLPn8tn1IKbHxt4EGjYlQMddw=;
        b=HdWgdpa2eb+jj0blDOsF8tzQE/Rk431K9EBJb4Vag/GYN3bOtW+EL76ETdPOhK6zJI
         6k8l+Ep45c1yiRPnG2XvLGTnkuEmbYvYUGZxyUtf/IhDYL1RipQpWpCVvItNhxi8pkRY
         efxmaGxA9j6JQ2r3de4U+dj/nl2CvLgzsaunJKBzYY4bXABoWTOmaWoa3A1wuzFXSPW/
         UbGdFFdIsEzHZSBRW2zaCq0Xx5Upil52aSgdUdiDCbX3FiYnB5l7xWuWOOlAkqpA1tUW
         CCZubmKxE0kCnD0UYzSDotq02WZtV2HH6kOgpGEx2nret9JO/u93pNU6jIAdlztZfIkJ
         lKHg==
X-Gm-Message-State: APuU4Z9zmRDLs2zQC5bkbtDGjgONiJRX4D4q7q+AxK0efYpjGoPcIovl
	Xz+OYeRFwIuqstLAYx1cg/nfLt3Bh6uMXpu9JvjA7RsxlqHM2jDZVDY4A2ddw79JQvXQuIi2Rp8
	s9khKIjY=
X-Gm-Gg: AYBFou2vEyDEsBmN7X99g1lrX6BNOax3BmuUeIf4bE/9y0LQv8uLen2GXIAzK/f68QU
	Isoj//meujvQ81yu4+kB4AJvkIc0X8zRNW48RwVMTN+1+7kaZe4cmRZjg8f21tgt/fNWgq4IZ4+
	Pb1nbPm1Kg/HMBChsP7ramFkY6eSJKgzhK+pfBXNLaVIXupkEVBdzMoBNHT9NmxZ0EDlsd6Dfug
	JbF/DODVZyATzrSJoudHbR1tHdVGd4X8X67+O1ecd99C+xMUYLN6SrtQp/FGS1BE/0IM8fKjkag
	OmDD2Ab8rxFbwU1EuAtUhvn2fgAsdRwsFsSaKsAGD6j3bBKhSTDGAeN9TDxGv/oWmNE6QGhwPGD
	51U8lk48tTp/Wl7eKaHnYyAegEI24hBxECsCK7Lxyz8NluNe4LT911jmbtqi//ArerugkZajFZv
	vQBTDQhCBI5cqayHeN3HnUvxomNhfrC4vb5xVoB4v6Q7+uKN1VRhd8+psSesnBhz9EN8K/11N7Z
	97xQfdr1b+Ej0C81I6DSsPgbxyGRgjeCEAxdlDlIhoR+yWt8AA1Yf/dyD8bY0JeZtRZvoDvKiPc
	B6lETcZed9EGLS8uB8A5TuLDRyD8ScF8pAqkObKr8diDBj/WnpIeMg1uQkla2RA2iStkYygzlA1
	NTO+wrxgEZcXSwS3F54bHPxA+eY7w
X-Received: by 2002:a05:6000:4915:b0:490:c1d3:374e with SMTP id ffacd0b85a97d-490c1d337bbmr4788248f8f.25.1793868227484;
        Thu, 05 Nov 2026 00:43:47 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:47 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 19/60] python3: skip test.test_readline.TestHistoryManipulation on musl
Date: Thu,  5 Nov 2026 09:42:38 +0100
Message-ID: <51a7140562a14248b1d23360d60c72e213a2663a.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249478
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

Fixes to the editline integration have sadly introduced regressions on
musl:

FAIL: test_append_limited_history (test.test_readline.TestHistoryManipulation.test_append_limited_history)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/usr/lib/python3.14/test/test_readline.py", line 208, in test_append_limited_history
    self.assertEqual(readline.get_history_item(1), "second line")
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AssertionError: '_HiStOrY_V2_' != 'second line'
- _HiStOrY_V2_
+ second line

======================================================================
FAIL: test_write_read_append (test.test_readline.TestHistoryManipulation.test_write_read_append)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/usr/lib/python3.14/test/test_readline.py", line 101, in test_write_read_append
    self.assertEqual(readline.get_current_history_length(), 3)
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AssertionError: 4 != 3

A ticket has been filed upstream so skip the tests for now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7ba31b6a42f884964d2cff04235a930f757b9e4b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3_3.14.10.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.10.bb b/meta/recipes-devtools/python/python3_3.14.10.bb
index 3dd0962ad91..db1211c0c10 100644
--- a/meta/recipes-devtools/python/python3_3.14.10.bb
+++ b/meta/recipes-devtools/python/python3_3.14.10.bb
@@ -365,6 +365,11 @@ SKIPPED_TESTS:append:libc-musl = " \
     --ignore test.test_multiprocessing_fork.test_processes.WithProcessesTestProcess.test_interrupt \
 "
 
+# https://github.com/python/cpython/issues/159424
+SKIPPED_TESTS:append:libc-musl = " \
+    --ignore test.test_readline.TestHistoryManipulation.test_append_limited_history \
+    --ignore test.test_readline.TestHistoryManipulation.test_write_read_append \
+"
 
 do_install_ptest:append () {
     sed -i -e "s|SKIPPED_TESTS=|SKIPPED_TESTS=\"${SKIPPED_TESTS}\"|" ${D}${PTEST_PATH}/run-ptest
