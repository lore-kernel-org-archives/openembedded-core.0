Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29833.1793868245564491808
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=TMh8XEJg;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491846221ffso247175f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868244; x=1794473044; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oXSUoCBbd+Wz8ftr6We4YDkDYWE5Au93XbR0EbrSniE=;
        b=TMh8XEJgGupaqfeXcqzLPFUKzKRyljM8Kuzccs+kDY5BSa3zc2ZdG47c/+fxYLH5mV
         XOnSJClkUQPjH+ssmtmM9A33eN9F4o+MQKPZXyyllZimbsjyRwWnE5e2oWuYhogt0qbL
         GgZy4UO+cqOIBpxLneSDX+bW9k0Ebe66VKueLJKOic7q5nkUj2sBRT+AAo6Dp+Irbchz
         KA/V4PIU7inoNeHouOCwC2oZKQCihuroIVh6X6D0L4+7DL5az8tsflNMgKl6BUErWqKj
         vMxaKlQVMkERJuHmt3XpYto1pprOSzZl7hvql+zfNu3Ssw0HwB/FdCeCauiHIDmEPti8
         PgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868244; x=1794473044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oXSUoCBbd+Wz8ftr6We4YDkDYWE5Au93XbR0EbrSniE=;
        b=ERw24J0oZCSX+UOoX5oy67z6ityVNeCGU4BuUpaLCtUCq0s1pXwOxjzgaKowIhP0ug
         Nqy4RScwlZYfpFGuy2HR0iRgk7ANMoJEHUEVSF5pCiWJWclYA2tJcbY7iFj8uP7HYCso
         QZvdjoajDljndovIsH5ki7C6X6eOSRVu2gRxg+3yJJlACJBYyxB5HotVxWA9jsiABfOb
         UCPrlPOViAQL122kgjKqXNdmtrBfJ261ARfSm5DScUEkJ8yeB/NGjnL0NlOH41Ky/sf+
         nh5OCCf5T+HA+UmqyOKCSNQwKVc6nWUW7++1GMUBfLxoO41bjbYQxgkOKjsDOPSm2x8n
         ISXA==
X-Gm-Message-State: APuU4Z854F0EBU/5VJfLpHCDgsDafnIEZMyXGqrwx0rzbxZhOUVQWQLv
	7ld9x6/a0at+9ND2cwTwElvyG19NiQu5HHfSoxrDNzfNWe2AeTm6y/nvJ8n6NO5vkRGBtcbXUzl
	UJtnxZBM=
X-Gm-Gg: AYBFou2DAYn7ywBLzh8QkCA1qChoT9tCCwx0X9/vcCcjWOnt/z1ZJfpe5yPyIlyYAAQ
	J1qoTfR43NSmRK7VeL4iSqtDfUCyhkoL60KA1Jceo+xaVvmOzeRLYaCw52i7Pczqbt9y9jZUDRR
	L+K/uRHgAdLv0b0kc4geBeXpR8DNFZMPcQ5+PvqfRlFjJpzJ/ZlDkl/Tfnv4GGHRQay63eGY4R4
	4sb+dusFmKMwKaSUuxxMEYkzkEHUyXsKNNmQc2S9d9E9gQsSV+HL2P9efZr0W+tJ1Ko1QvYPHsO
	F2bxKlxmE7OzSbkLSBCF6ygk+Q1Nxh9IFPYxdB25W33uXf4zI5/COF7Jo6aMTqhahhkM71f7ikN
	oQAOZwfrRY4l9WjsBIavlcHI2cbUDhOyhQoP3ZbzPgBdNblnSzgU9pXIJOTIuKt5wK9p+/wmcgL
	eJ0tvnfZgXaoMH6TKAQoPBhZlE8K5S1bq7TQtz46WLpA291YEUGv2NlAaFLcliHa7mZsfmNicTp
	1kJiuJJW3WSoSc92za/Ienk/YJ10Lc0nEEuwrtrTck7TcXoKFqVrLvMMvVXrYhiG6U0HL27uK0Z
	5ybkyxSSOBjZeuWsk10XuRHEvp3RDM5OBTHW4uskVFQYxiANtBuaJkHD0vjpLKD4urW8Fw6z6Fk
	Ec2BwfcZur/84brcySj+z/XxME9fd
X-Received: by 2002:a05:6000:2488:b0:487:27f9:840 with SMTP id ffacd0b85a97d-48e6e50d953mr38631182f8f.53.1793868243813;
        Thu, 05 Nov 2026 00:44:03 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.44.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:44:03 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 48/60] tcl, tcl8: skip binary-40.3 on RISC-V
Date: Thu,  5 Nov 2026 09:43:07 +0100
Message-ID: <e81fc5a178332fe571abe38647c6b8d0c2128427.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249507
Content-Type: text/plain; charset="utf-8"

From: OOHehir <oo.hehir@gmail.com>

binary-40.3 expects a negative float NaN to stay negative when widened to
double. RISC-V returns the positive canonical NaN instead, as the ISA requires,
so the test always fails there. Reported upstream on the matching MIPS ticket.

Signed-off-by: OOHehir <oo.hehir@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0fc94c72e57c7b16fd427caf394fdcf4c623d6a2)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/tcltk/tcl_9.0.4.bb    | 4 ++++
 meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.4.bb b/meta/recipes-devtools/tcltk/tcl_9.0.4.bb
index 5166ef25112..e23bf3826b8 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.4.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.4.bb
@@ -79,6 +79,10 @@ do_compile_ptest() {
 SKIPPED_TESTS = ""
 # Assumes locales other than provided by musl-locales
 SKIPPED_TESTS:append:libc-musl = " unixInit-3*"
+# RISC-V widens a negative float NaN to the positive canonical NaN, so the
+# sign check fails: https://core.tcl-lang.org/tcl/tktview/bf029ced86
+SKIPPED_TESTS:append:riscv32 = " binary-40.3"
+SKIPPED_TESTS:append:riscv64 = " binary-40.3"
 
 do_install_ptest() {
 	cp ${B}/tcltest ${D}${PTEST_PATH}
diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
index 07f3ad4592d..5e296cc7e6d 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb
@@ -83,6 +83,10 @@ do_compile_ptest() {
 SKIPPED_TESTS = ""
 # Assumes locales other than provided by musl-locales
 SKIPPED_TESTS:append:libc-musl = " unixInit-3*"
+# RISC-V widens a negative float NaN to the positive canonical NaN, so the
+# sign check fails: https://core.tcl-lang.org/tcl/tktview/bf029ced86
+SKIPPED_TESTS:append:riscv32 = " binary-40.3"
+SKIPPED_TESTS:append:riscv64 = " binary-40.3"
 
 do_install_ptest() {
 	cp ${B}/tcltest ${D}${PTEST_PATH}
