Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC50CA0FE4
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 06:45:39 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.3229.1755758735738052473
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 23:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aSeOJznw;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b471737b347so396541a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 23:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755758735; x=1756363535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvukKaa2LAogSdBzY30Zp9BmoJJwEMw34HMlwv+eSCI=;
        b=aSeOJznw8ZpfYR2daxNuBLTCzWYp9yPv47u8e+Qq0poCIxwOTFIOBjUwBLMuasbL54
         d3KImcrZjkvVdVsQ2KDc2p/VQmjGM5hMb1Ed7CTyb1kAX7FPx6qmieSRHtccY0Vmfrak
         n1Ou2r8QfudqDJF0wW4atalCuoK2wGR4BT2LfRZROwY0ppc6pJL9lzZU1BCgav+4fndF
         3opbNeWBqD6lxbVg5Cp0gL8w0nZDstH6ckvVmFQC1GB7jCFfzLB8g+ZwKQw16k0Nn36P
         dX8up8Idu4CPiU47YVi+kLtmaxLNGbiycJN+WuilnVPlxRXzeCsRnHWMtfBQCPBXg0xu
         U9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755758735; x=1756363535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZvukKaa2LAogSdBzY30Zp9BmoJJwEMw34HMlwv+eSCI=;
        b=sSQIHEISQ1zuxmR1nnddqeJneHmECQ6KfPUJq6vg+LgZS9k1RlIrWNM/P88eILbOU1
         lFp8DCMBpZ04T9Vrap8QK/I2g9vwOaqLNJp+leH4LZqkvh7/JSZZsvVj85A+ZuIo5SAN
         ycmIExJWqTZ5nD/KII4OBk0/xSKACeDWMLhlhPH8lkyGQmeTMUFnTIG2dLUjx1rhv8yZ
         8Z2Wwr0J4xux6qrEQ+pq1qI0pOdLmVQPH1gNZwVHXb8ZnJWNLyF+AOJPfQG7U2TY3zwW
         RIWqLpNwKTA2HESuePujdS+ouz9B1jiYOKB7QeCjtBv4fSJ6v4zj0lJPWnMABgixMtGX
         leGQ==
X-Gm-Message-State: AOJu0YzHfRnhTKheUu5ijIZsXbflNQh7gwQ52c2RgH8hzidIzOgfBY16
	gtNoBNA+w365b8qvai/NCiagLN96qCAlgxL8z46j/ziJUwlojZcngwuY64yW/Zet
X-Gm-Gg: ASbGncsb4BRzLqChB6BenxEXAdd3dHNx8dpZ1xwMjG3gO4ahfNb9h61vsoaoQN1nLvC
	TeC1wpgdDxXP4t54VP5y4Pgija8+Pn/WIG7CqNEfHmd+kg3iQdbdFPjIM9yIFUY1g08lxihedq9
	Gbk/hJzlaZI+QeBIhmypQdW6k5F+HoEoJ2bVzYEBEppM86vg/sxX5cTGCxJpIO36t/xIrhAsoiq
	WJ8LQcDZhfkDhsz0LMRYUXIf2Ct+EBVamEpLXDq5bta6fIOwxaawlgvT42U7LL+CgZeNFfvsVJ5
	/J+y9ku6MNLM8Lmb6yPVbEr2k6L2vxzVPlyiNk4HEaqgAUhATVAKTrONJROM4aTwf/RCGlKrmNu
	jFpi/eM8juo+zWN8lb6ODpGMXdOZsCnkB
X-Google-Smtp-Source: AGHT+IGWuppRF8qiQpd87O7uikcCVGaxxIrtlbjuwnQdAUng0jV/rGSR4z2/O9byxJzWcs/pKsnoTA==
X-Received: by 2002:a17:903:198e:b0:242:a0b0:3c11 with SMTP id d9443c01a7336-245fed7d247mr21195655ad.31.1755758734489;
        Wed, 20 Aug 2025 23:45:34 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed35d778sm45876685ad.49.2025.08.20.23.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 23:45:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/9] elfutils: Add run-backtrace-{native|data}.sh to known failures
Date: Wed, 20 Aug 2025 23:45:21 -0700
Message-ID: <20250821064528.754633-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821064528.754633-1-raj.khem@gmail.com>
References: <20250821064528.754633-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 06:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222212

musl's thread startup/teardown sequences and frame-pointer handling
differ from glibc. elfutils can fail to terminate unwinds properly
in multithreaded musl apps which leads to truncated or bogus traces
and then the test's "must contain main" assertion fails.

Skip this test on musl systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.193.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.193.bb b/meta/recipes-devtools/elfutils/elfutils_0.193.bb
index 3d98f1e2140..67ce3827827 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.193.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.193.bb
@@ -66,7 +66,7 @@ PTEST_PARALLEL_MAKE = ""
 PTEST_XFAILS ?= ""
 # See - https://sourceware.org/bugzilla/show_bug.cgi?id=32232
 PTEST_XFAILS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' run-strip-strmerge.sh run-elflint-self.sh run-backtrace-data.sh run-reverse-sections-self.sh', '', d)}"
-PTEST_XFAILS:append:libc-musl = " run-large-elf-file.sh run-backtrace-dwarf.sh run-stack-d-test.sh run-stack-i-test.sh run-stack-demangled-test.sh run-deleted.sh run-compress-test.sh"
+PTEST_XFAILS:append:libc-musl = " run-large-elf-file.sh run-backtrace-data.sh run-backtrace-dwarf.sh run-backtrace-native.sh run-stack-d-test.sh run-stack-i-test.sh run-stack-demangled-test.sh run-deleted.sh run-compress-test.sh"
 
 do_install_ptest() {
 	# copy the files which needed by the cases

