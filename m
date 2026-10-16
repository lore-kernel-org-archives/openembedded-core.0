Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D80CECCF2CA
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:10:54 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4278.1792184095690669149
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 13:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bOdtXySh;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: oo.hehir@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be4fea434bso311676e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 13:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792184093; x=1792788893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZs+df9WjLnPfAu38kah++G8g0/TprFbxx3NOhghDNo=;
        b=bOdtXyShRRCmTwFlkvH+kOAN4FDRBB2fNcsymc/MlFJ2Tk6UjYK/kHf19Ad1HQtDFg
         XiTOJpn2T+8CXyGc+kjhX2zhgCJp+2RoNfvtcj2aRMXu7Z6P7GfFkvbZH3fb456Q/LvY
         HzlL7qAbSXz+YVzPOSmicsmp01Jxe0FVpPiq/L0CQhRghLOcmXF7L77LqADpJR6oC1lL
         Sh4GmoFDUiWA0m7VXpZWszcm6pCkqjfSI70ELXOlUJwUb//CYsxOBZhtLC8KmuRLtv2A
         XNJO5NsTFCqs97ldBV0o3Z5oTYQgn7Nr1b67uNmv5mTRSrzRs0CCcQuCLKbFPAFdU4A8
         HJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792184093; x=1792788893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EZs+df9WjLnPfAu38kah++G8g0/TprFbxx3NOhghDNo=;
        b=eiPNDpcFfJYy5ZwaHZViGS/iN756/t/WKQxh0ppdrTKXST5ZLmU2CHD9NIfzct6jve
         D/wSx4BW2O6zbVyPDnQOV7155oCIJBhIM8SigUq2/H9zPjMRi/l7GE9hnsJGujpStbfb
         S/BnOCW3M6BWqJ9VCut+M6/O0KdDaEtiAe75RQfXKIloJzVvWa9/ubL+FhIIZWKwLBL4
         Z4fpPDHvwnnNfUPHRF1/fpEi1PZ/hRDkLQGMF6DZNYR0e2qYRQCyFHPJzI+48YSeighO
         Iob5UArpP3BM58xtLvYcfswJORbVcPKwfkazEft+VsfhpeAtbmyusullL+Z7QYZwhPnH
         01Tg==
X-Gm-Message-State: AFq9FYLZyv0u6iq191ypcqNohJGQkBQiUXkCVf19t06TixsalBd2MNOw
	EE97Ly1LRKTR2gIxes4+MUnNuur6PD4dnc8y2o1rle7FPhV4i7wxuPa/orLLOg==
X-Gm-Gg: AYBFou17pq+G/mkWBavzJeeOJMSTz/G5TYnKu/w+NSXb+84lpT7QvHOdG41hvhWoH2V
	nz4oXeiZ6YgAn9jTCXT9+zhXrNGJpiYHWgcjbbGwzs1bwgWrMkTK90Biq4yF5auHiFz38Y/aOJJ
	sGtQRQeJ69e6Qf01ZEMnz/2ufwdfaBTZJUJdSQzy5fc53UlEOv3yZ1uK4MQd0U2P7agl1QwHFxI
	nGz9vTK3Q0ZVzUDjImpx0Lr8zMkyvnKT9FUviVRS4tSkw2ilSqme4omvG/37BHunDsIPAYhvskt
	ZL1Kl45aIxEO/aHN/LrTd1O7gSr0hVAHAM4cTErz5NuMnpEShNE8pCbRS7n7iZ72qmmylv0v4kL
	jOUG0ExN0XL+exRdhjsceurPHms/KByD0R2LyyempO6Sv9QiFIFjcTdpuGCfurkfOnW158ilnXI
	itLgd7rNKQ+MB7/8Jwqm3A1bKqfvJ04Go/hbjWpE6DQhjVWMbRsLvYoEmfabpZgD1z0LW8Q84Qm
	sA=
X-Received: by 2002:a05:600c:1d04:b0:4a1:7f96:9b42 with SMTP id 5b1f17b1804b1-4a1d76121a2mr21520675e9.15.1792183655465;
        Fri, 16 Oct 2026 13:47:35 -0700 (PDT)
Received: from hp-z640.fritz.box ([51.37.221.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d3e2e602sm51205765e9.5.2026.10.16.13.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 13:47:34 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	tgamblin@baylibre.com,
	OOHehir <oo.hehir@gmail.com>
Subject: [PATCH 1/7] strace: skip qual_fault-syscall.test on riscv64
Date: Fri, 16 Oct 2026 21:45:30 +0100
Message-ID: <20261016204547.2328847-2-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016204547.2328847-1-oo.hehir@gmail.com>
References: <20261016204547.2328847-1-oo.hehir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248046

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
---
 meta/recipes-devtools/strace/strace_7.2.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-devtools/strace/strace_7.2.bb b/meta/recipes-devtools/strace/strace_7.2.bb
index 451ffa6f88..2d6dcb8c75 100644
--- a/meta/recipes-devtools/strace/strace_7.2.bb
+++ b/meta/recipes-devtools/strace/strace_7.2.bb
@@ -57,6 +57,19 @@ do_install_ptest() {
 	    -i ${D}/${PTEST_PATH}/${TESTDIR}/Makefile
 }
 
+# Tests that go too long without output under QEMU for the qemuriscv64 ptest
+# runs. strace is not machine-specific, so this also skips them on riscv64
+# hardware.
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
-- 
2.43.0


