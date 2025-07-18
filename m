Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 331CAC83F3B
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 05:43:20 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.14357.1752817393473314981
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 22:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kkNBtnQ4;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-748e378ba4fso2154621b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 22:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752817393; x=1753422193; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUzUwXZxMnAw6ZGQvbUMkxsEBkSSl12NS7FURPsqau4=;
        b=kkNBtnQ4MwW6yJdIhqZfSMzeIEGHFTCSnQL8vzyybvn5FjYtrlC5nuRVOyNRFD3wAn
         JRYSVzvo4SZbPqiImu0yLQRG74f2d7mld6i/Y/zptSbQrEEzDjKG5qLIt5GSDIeRhbGA
         o24Ovsy8bJEaYQrFBjaumVajOZoHFHooeZ93j3ik1xrZgTltn1nZQB+jLQ7GLEObM2xD
         +XpXhGXgqOcvZcse4KvMoLBsjj3QCwNYNHU409qyHpt+ao6o44Lnmwsbfi40juWyIaif
         taGlurFbqh540LI/3Ggp/UTYxhDC6TjdZ7TPhQUNH2jGLfH8pKdIaAH4FTpOleyi9GQz
         dFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752817393; x=1753422193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUzUwXZxMnAw6ZGQvbUMkxsEBkSSl12NS7FURPsqau4=;
        b=f4z1Dl2TAzf0SjHBnpvUV0fVmMkBjsl9vvUeBxMA7Du8pV4IxsbwbBzTNltrqH/KTL
         UumZpgdJ1Pib/ZYJ+ljh2DWNuCEwVqFEuwNHBiGBNtHD+Ezs7qFICvrGig3O4ct02sB5
         F7ncg3/e61So5g25oUhLzWb9V2A7cL0BxWGWQOySBeO+nb/Vf/7+FDwDul3faF8SNkUt
         HABJIhe2knX64lRDbVgtHOWCjSeR411xZ438B3iBZRIqs4m5eOaiuLrQcPKtQA/mE4dE
         a0wjJIEteotn3psLjPCa+3f4i0VAPou1WexmAGrWsy2mb2RGbohPLt4+G+7Wi2LD7/J5
         Ldgw==
X-Gm-Message-State: AOJu0Yx4g2I3zsh9c+IB8ucPzLZP8s+iqyejo+k47PA+qNEcjAbr/2WK
	F+ZS6cOsaHBMEMPu5JH4Fo24DkvVzzIncjauaHIN0xHKndeFUyYoaWshEqMW4fc5eVc=
X-Gm-Gg: ASbGnctk0WtNIxAfGg0fNccZ3kMkbpWo2KGw4cwOgZsvsbcxSFQBIOaHIQEmC90B/ei
	l9gxmTUFK4nTcox4gfiFJSIiabhtm+j7S7ZFKWvWHo+PVwkeud/PFHo8IBJwhUKOlqUHjBDfc7Q
	4RmnOcALhnvKErAraZ9wLahO+Z5Ti4xFu6cnVI6J9Bzi13PlhWw/SFDTbrXdV+ujm3IZbQNdzTZ
	6uDLThljtsAW/iQK/oeVgKkD8a3JiDHUaEmyHo1GrzIq9Z2nymyYzPoZ4/GQBiyNk8O3Mr4Lh7b
	Oxoc6tABhZpSIQFkU5X4aOUVBVE53SljWWpULnKnibkcqYzVmNntVte45v+crqeOEVU+YASOPD4
	VRWqQMJcDAjQ1HA==
X-Google-Smtp-Source: AGHT+IHtwtWms458CZCleBc5J7SDozJpWlO5cDGEuzYaSx21rK79ixjCkMvqzq/3CMV2qs8lKd8FJg==
X-Received: by 2002:a05:6a00:35c5:b0:758:72b9:e5da with SMTP id d2e1a72fcca58-75872b9e66fmr6282422b3a.17.1752817392449;
        Thu, 17 Jul 2025 22:43:12 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::519c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e2444sm496817b3a.25.2025.07.17.22.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 22:43:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 4/4] clang.bbclass: Add clang specific ldflags and dependencies
Date: Thu, 17 Jul 2025 22:43:06 -0700
Message-ID: <20250718054306.1997726-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718054306.1997726-1-raj.khem@gmail.com>
References: <20250718054306.1997726-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 05:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220575

* Add rpath defaults for nativesdk recipes to let nativesdk packages use
  SDK sysroot correctly

* Add clang-cross to sysroot via POPULATESYSROOTDEPS to get llvm tools
  e.g. llvm-strip, llvm-nm etc when they are used at default STRIP/NM etc.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Drop adding -Qunused-options, these should be added to recipes who need it

 meta/classes/toolchain/clang.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/toolchain/clang.bbclass b/meta/classes/toolchain/clang.bbclass
index d7b8a3657c6..221653e145d 100644
--- a/meta/classes/toolchain/clang.bbclass
+++ b/meta/classes/toolchain/clang.bbclass
@@ -33,5 +33,9 @@ TUNE_CCARGS += "${@bb.utils.contains("DISTRO_FEATURES", "usrmerge", " --dyld-pre
 
 LDFLAGS:append:class-nativesdk:x86-64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-x86-64.so.2"
 LDFLAGS:append:class-nativesdk:aarch64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-aarch64.so.1"
+LDFLAGS:append:class-nativesdk = " -Wl,-rpath-link,${STAGING_LIBDIR}/.. -Wl,-rpath,${libdir}/.."
+
+# do_populate_sysroot needs STRIP
+POPULATESYSROOTDEPS:append:class-target = " ${MLPREFIX}clang-cross-${TARGET_ARCH}:do_populate_sysroot"
 
 TCOVERRIDE = "toolchain-clang"

