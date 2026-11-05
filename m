Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30070.1793868237704355636
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=KXVsihnN;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48dee593f18so1232820f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868236; x=1794473036; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZkQ67vqUCak5e2D0zcq+ItUlF6pp2eQOahqC4+StSi0=;
        b=KXVsihnNJQQ8d5TNSXdwPNgPqGXt0atf8lVDDJvNs22a0SobPa1m0X9OiaKMXe7+ny
         3k06x6NR8swyRzqt8qbaSok7EZ07+0qVMtCs7Cpa2Sjfxzx+GUgUAwJQU5WLNkVswSV2
         GovCq/XENixDhTJPXuTiGLw5vBfNNnTaZS39Nl6vjpGkOAjRMElD4bEXc5ZV/9D20wzF
         qLGwmotMYlt8e3X9dhSuotOZ1SC18WCkkVDTGvO3flzznQasxXIhVVQdHUKZbjJChgBU
         wDHc13GGj2mRyuUYOuhGfDMLzYGB0SOcqc+vPzPTObPsjhmgNv55PwNfrXWDK5nc+8vu
         BujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868236; x=1794473036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZkQ67vqUCak5e2D0zcq+ItUlF6pp2eQOahqC4+StSi0=;
        b=V4GrYfEfJtp26jzUVKrgYERTRHjDNCsCiE1m/DlTetNYD08aD/jOsmz0Rfaf+jUK4U
         dRoxadsFPXMbP63FQifSQPTz7y2irXVB9tRpoanwclACf3QArndFg2i4tT63soeq+DQ3
         5Qo6ox/WEehRorQJKZlT9frbcpdHnMkFbzsElIl3Rtcvug9gb0O+OtrLjboarISZKLea
         1UJk40x3F8h+M6cVNQ5bwEoaDp/ktbPVlh4ahba1GmpsnY2d/pqi8iYSLzsJeHo0bOII
         e2dH7Hmi2d9SJZkCIwrY5/TfcvPOsCi9/QFlZBZYa2JvreX1/IKx8IEkxZqw1pdmtjC6
         4Srw==
X-Gm-Message-State: APuU4Z8zvSBh1lUNB2NWTNukxF4subKtV6Tejd0WFlMgDj+ES3NtVfP8
	dQ2I3BR0NV3+7iEM4XjBbsKB7thTghosYIPQIVQfp5vsVqrPxCqrqNaKKpnWkiQNXb2CvjE+Cdl
	fUmKKPZ8=
X-Gm-Gg: AYBFou2hhZvMhKwpgn0ygSYKXyOp/+FxujfAVjYEswT2YhDYR3UY/L8ErNWwSXDSZRv
	kzdRF86K0nAPfyhhJBLvuGh/ToiuQ0xyxu5TsdUxWiMyfCvofZrIlz7VOPBLwZWWJm8DAmqmP17
	50JI9jBpqD8WUF49CRXzW0TPk5JhGZbFtlzbo3nI/wSxEgxpKjiaBPEoMbik2wt5F8dHCH6RcPz
	sGJwrSEtWyWjdiPVUo6w+hMs9QwxmRsRRJ2Wup+0GtLlJ+9FTDBkwbI2lDEGkgoUnJyRlRaslhQ
	+uJBgjlSr7WSILBLiFqmAJSWsU5ceTwfv0X+qPo/WEvdvQ6TmPfr54oxOrX1tzphK/UljJ4ynAu
	BCnxputlLbbsS3mWmCE4cEPEybSoWNCYnFo9Zlzg5x4cwxnwtGLpci2UcRNMlkBrF8WurFOh33h
	IJDQWPc1+H8t9ibFAKw6yWnzmC2HKDnE8ekxybP6GyvRbKV9X1zlJEE23s7GAI36qjPd84Oce/N
	19AMm42Q0WxQwhM1I9OJWt7u32vupfL6Ok1t2Gn/WtTsw/+teAYlTJjnbKKTtjdKsM4wTkpqeap
	KHr4nSJR8GEFu5l0jp20rdn4Cnw7k1EJ1Sf35wHMvcKRgaPOQy/CIgo8WDiaV/r0DD1bcERtuu4
	AdSo/osbMl3W8mfWM2zfsp2onujiO
X-Received: by 2002:a05:6000:2889:b0:48e:f10:ceb8 with SMTP id ffacd0b85a97d-48e6e2e769amr37837149f8f.11.1793868235795;
        Thu, 05 Nov 2026 00:43:55 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:55 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 32/60] strace: skip qual_fault-syscall.test on riscv64
Date: Thu,  5 Nov 2026 09:42:51 +0100
Message-ID: <df74c0f170a34bb09f7e4b4cd49782641cc495c0.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249491
Content-Type: text/plain; charset="utf-8"

From: Owen O'Hehir <oo.hehir@gmail.com>

On qemuriscv64, the strace ptest goes 283 s without output while
qual_fault-syscall.test finishes. That is 63% of the 450 s ptest-runner
limit, leaving little margin on a loaded autobuilder, so skip it there
before strace is re-enabled for riscv64.

The longest gaps between outputs in core-image-ptest-strace on
qemuriscv64 (make -j4, every output line timestamped), with the test
that ended each:

- qual_fault-syscall.test (283 s)
- filtering_syscall-syntax.test (139 s)
- trace_creds.gen.test (90 s)
- strace--tips-full.test (65 s)

The rest are under 50 s.

strace is not machine-specific, so the skip is keyed on riscv64, as the
gnutls skips in cc848c403a are. It therefore also applies to riscv64
hardware, where the test passes (VisionFive 2).

Signed-off-by: OOHehir <oo.hehir@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 208fca4fae70204b8a9594201d08e7d8b65af5d9)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/strace/strace_7.2.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-devtools/strace/strace_7.2.bb b/meta/recipes-devtools/strace/strace_7.2.bb
index 451ffa6f886..3f7aaab3e6c 100644
--- a/meta/recipes-devtools/strace/strace_7.2.bb
+++ b/meta/recipes-devtools/strace/strace_7.2.bb
@@ -57,6 +57,18 @@ do_install_ptest() {
 	    -i ${D}/${PTEST_PATH}/${TESTDIR}/Makefile
 }
 
+# Too long without output for ptest-runner on qemuriscv64. Keyed on riscv64, as
+# strace is not machine-specific, so also skipped on riscv64 hardware.
+STRACE_PTEST_SKIP ?= ""
+STRACE_PTEST_SKIP:riscv64 = "qual_fault-syscall"
+
+do_install_ptest:append() {
+	for t in ${STRACE_PTEST_SKIP}; do
+		sed -i -e '1a . "${srcdir=.}/init.sh"\nskip_ "Too slow under QEMU on riscv64"' \
+		    ${D}${PTEST_PATH}/${TESTDIR}/$t.test
+	done
+}
+
 RDEPENDS:${PN}-ptest += "make coreutils grep gawk sed locale-base-en-us"
 
 BBCLASSEXTEND = "native"
