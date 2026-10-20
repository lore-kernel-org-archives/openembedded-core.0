Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.217.1792511565283532189
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 08:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=o3NwLnni;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: oo.hehir@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso37458885e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 08:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792511563; x=1793116363; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9e62Thsdq952dh7TntIGGyPGStFygXu/c1wuPhSCqc=;
        b=o3NwLnniJXD47IxyPJFgoKGPFcwSFj3RDGVXhv9Erd7MmIo6b52ECW4EejDq0K9bCQ
         9A7/LaaysIRz/6YDbOt7tDJgPXXyeEj+fysPWWJx6BH07VHllvzypWYUoXz/HPPp738+
         oaykNNRISkankVo6v5xHlFXpFIhCOnRADcdlYJjZfby8zJ0Z1eM1RAxwICYiPQSNTJtH
         PvvxbW77970ycegSx232CvOSzGznhrvCAMTMd96XNx/tPS/jMk8Ll4LzN2q6DwF0LRD/
         H6K1wLvkoSM6QwiXg8rBQ11uILRHMpkpxYaRJoq5ew9fMijdhZ1WZ+l5BdbmLG2LJ1+O
         dnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792511563; x=1793116363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r9e62Thsdq952dh7TntIGGyPGStFygXu/c1wuPhSCqc=;
        b=uHqaZ+Tj99sWLTex89SkqzRy/Cq8TZ+zZ1BNcv+RDUYDYbjiL26tu7+AGgiNH68owK
         eJPoLRUDPhq9J0SG4jt8ZYa960VPNxpfRughdiIEjUy+dyH2cHj98ik5XiblToX+tmxP
         4xCwIXw6lPZ/wWQSB02akJx7dljWRTmajEXZoJSQ9r86h/ot+hPyCj/0hMWq8WERvzQN
         Nn/4Om7ix9cqBwkWfooIFkpqtQxKR5jrJZEVXJypJvZoTv7qURQHxpqkvDIIBaz/Oa2r
         emvYYgikuKKofmHjmGo4YIJohNQf7vnnw1io3yjqFwiKfdGLieJxIfwWcrmCcfvfbiXD
         616Q==
X-Gm-Message-State: AFq9FYKdP2fIQoKfvhl0VnVN4oCj0rrJNdc1/zSXwV5HrFC3XACAF0JC
	M5YuquYZM4hT4n4JOJtMjpzyEaWy0YnndDDYF2jSmOQdR6kk+E/xqaDVNh52lgLYNaLOVg==
X-Gm-Gg: AYBFou2c9dp4LcwgI9p92ewFmOnXIgQbn3HXIJHxIOOHEF6hRj2lIwgKo3wXC0ByXNs
	z+/DcVAVpazJN9dYZc1owpFM+9Sbf3WwLgflWo+O+Iv5K2gA6jXoHsT/800MY9bgF3/t8iAThsn
	T0L+UtUibImomidjswUmmpfgEz5W6yRujG6eQk+Fo7/l2YD+X1qNC3eVIv2oy6qNzHZdc+cb32o
	VJi99nL7zKo/JtD6TU6BWMYAG+cM919i/ApaZYYzCAe24p7p7OIdHNurQzVo7yVcQp0F6PSreGu
	l6x5C6VIzkYdV7CrTQDeGqci+wmItcBD1jYf68BKNkoyhJnUD446ACUt6vOgJPkTMTII+ulDqgY
	9nXxhm0l8OACPBm9tIcuzl5RZouHXsdJIu1P5cy+qIIUL9HObmXOK6tLYghhO9rpBxcsumPXpvD
	cS5/+XQXXSShwUf3kWlQSATByxxYcP7YuyOd+yWoZeZWBNIoEpdcSZWRBPFZkZuI0yETvPNDtvs
	edtZqLXuoydjCiDMoEq/btX7tFAf5ul
X-Received: by 2002:a05:600c:3b82:b0:4a1:f625:2108 with SMTP id 5b1f17b1804b1-4a1f625225amr56819665e9.33.1792511563086;
        Tue, 20 Oct 2026 08:52:43 -0700 (PDT)
Return-Path: <oo.hehir@gmail.com>
Received: from hp-z640.fritz.box ([51.37.195.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33ad3fsm307375725e9.5.2026.10.20.08.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:52:42 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
X-Google-Original-From: OOHehir <40183643+OOHehir@users.noreply.github.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	tgamblin@baylibre.com,
	mathieu.dubois-briand@bootlin.com,
	ross.burton@arm.com,
	OOHehir <oo.hehir@gmail.com>
Subject: [PATCH v3 0/3] riscv64 ptest fixes
Date: Tue, 20 Oct 2026 16:52:35 +0100
Message-ID: <20261020155238.1923076-1-40183643+OOHehir@users.noreply.github.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016204547.2328847-1-oo.hehir@gmail.com>
References: <20261016204547.2328847-1-oo.hehir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248315
Content-Type: text/plain; charset="utf-8"

From: OOHehir <oo.hehir@gmail.com>

Changes in v3:
- v2 patches 1-4 & 8 are in master; this resend carries only the tcl patches.
- Patch 1 replaces v2's anchored sed, as Ross Burton suggested: the recipes set
  SKIPPED_TESTS, which do_install_ptest writes into run-ptest's empty SKIP="",
  as python3 does. The musl unixInit-3 skip moves there.
- Patch 2 sets SKIPPED_TESTS:append:riscv32 & :riscv64 in place of v2's case
  on uname -m.
- Patch 3 is unchanged.

Patch 2 skips binary-40.3, which expects a negative float NaN to stay negative
when widened to double. RISC-V returns the positive canonical NaN, as the ISA
requires. Reported on an existing MIPS ticket:
https://core.tcl-lang.org/tcl/tktview/bf029ced86

Testing: tcl & tcl8 built to do_install_ptest_base for qemuriscv32 (glibc),
qemuriscv64 (glibc & musl) & qemux86-64 (musl); each installed run-ptest passes
dash/busybox -n & checkbashisms, with SKIP set to:

  qemuriscv32 glibc   " binary-40.3"
  qemuriscv64 glibc   " binary-40.3"
  qemuriscv64 musl    " unixInit-3* binary-40.3"
  qemux86-64 musl     " unixInit-3*"

core-image-ptest-tcl8 testimage, ptest-runner -t 450 (slirp, 4 vCPUs):

  qemuriscv64   152 pass, 0 fail, 614 s
  qemuriscv32   152 pass, 0 fail, 686 s

Not in this series: tcl8's tcl_package_preprocess mixes tab & space
indentation & passes tclConfig.sh to sed twice. I can send a cleanup if that is
wanted.

v2: https://lists.openembedded.org/g/openembedded-core/message/248079

OOHehir (3):
  tcl, tcl8: set override-specific ptest skips in SKIPPED_TESTS
  tcl, tcl8: skip binary-40.3 on RISC-V
  ptest-packagelists.inc: re-enable tcl8 for riscv64

 meta/conf/distro/include/ptest-packagelists.inc |  4 ++--
 meta/recipes-devtools/tcltk/tcl_9.1.0.bb        | 15 ++++++++++-----
 meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb     | 15 ++++++++++-----
 3 files changed, 22 insertions(+), 12 deletions(-)

-- 
2.43.0

