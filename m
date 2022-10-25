Return-Path: <yashinde145@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24887C38A2D
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 09:18:48 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.4969.1666689521996099400
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Oct 2022 02:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oT/dh3zQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: yashinde145@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id w189so9801980pfw.4
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 02:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dGO561xoxXbMRBSJZevV8WVsAWQzd/DAqwmJGaqNdAU=;
        b=oT/dh3zQPiXK+ytWPrAVf4ow1qt12aNcWGOe0FsUHhxuJU3uvmH64WMuctwnOyC9Nr
         +0hFPglF3FGtZ6H9R6suF58OlHNVhbyK4MnKMwqBlcE48mxX7Hi+obwG0XB41XcJHaaX
         RB0spg2njJnhUJD/C29VuotWe926X5zzNAOWD2MSX6G0tpjwQbMSrBOfnSsHI/zWUyrD
         2NHSiMn7ngD2mWZpgtkQ62DMzWEI9uXXlFQr/QuWrK0WyIYwIgtYExD6Wd/z2D82OBuk
         5nK3oi67bjar/fWQoMq0YaUz+Y8RZF4hRhJ6oWK16WhC/Ax5I2zZl1F+i6Q9uT55xpXk
         apYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGO561xoxXbMRBSJZevV8WVsAWQzd/DAqwmJGaqNdAU=;
        b=0+728KoYoNSUNSc0KJtUilXjsrj29NNbSJz87EBT775DCzpa7ldvR2ys54TF0VYP7N
         9xVTAPlDmY72rHdmmjiwqigBlhlB2yCZHqGRwXDHm1mXfVaY6O/m6oOwCfdHIcmE+6ye
         cU7+82UqiJK51qOWakf53w/NDQ+HGKKsBVFyYAIuMbzWa5HIpdjYrD24wwLZ0CSGjooe
         ha6Wkio0Dl6NJgJ3svge48f+Tu9Ls36qjTLFRVLVwyeLIN9cOvfRbnPVL+hzSCNidI/Q
         NB9VUQDBewj52pB2W5KpkgdUWvmXLBO81oK0R2i6BHbaRoRCq0pvas/qhNLcEQXEriAm
         snmQ==
X-Gm-Message-State: ACrzQf2n/LjDDLuU0LHx95K+jWHuG8Lfarxu/YmvQfXCVRJtqC0CBLFk
	u7sWZcisj/m+Qv9MFPqnZ+vzLn7A5d1Lvg==
X-Google-Smtp-Source: AMsMyM5dODYyx85dkfSpEYNGoz+gl3FvC6ymyi037RwDv1sqo6vjH1uF3U2mFt4fGZ60R8Amz5Gjlw==
X-Received: by 2002:a63:c117:0:b0:46b:208e:fd76 with SMTP id w23-20020a63c117000000b0046b208efd76mr32366083pgf.577.1666689521269;
        Tue, 25 Oct 2022 02:18:41 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902900600b0017a0668befasm886108plp.124.2022.10.25.02.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 02:18:40 -0700 (PDT)
From: Yash Shinde <yashinde145@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	sundeep.kokkonda@gmail.com,
	Yash Shinde <yashinde145@gmail.com>
Subject: [kirkstone] glibc: stable 2.35 branch updates.
Date: Tue, 25 Oct 2022 14:48:32 +0530
Message-Id: <20221025091832.535612-1-yashinde145@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 09:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172125

Below commits on glibc-2.35 stable branch are updated.
8d125a1f91 (HEAD -> release/2.35/master, origin/release/2.35/master) elf: Do not completely clear reused namespace in dlmopen (bug 29600)
f8730697d2 nss: Use shared prefix in IPv4 address in tst-reload1
135c29bf9c nss: Fix tst-nss-files-hosts-long on single-stack hosts (bug 24816)
767c99850b nss: Implement --no-addrconfig option for getent
bca80a916e nscd: Drop local address tuple variable [BZ #29607]
20152a849b x86-64: Require BMI1/BMI2 for AVX2 strrchr and wcsrchr implementations
02aa1f4a5b x86-64: Require BMI2 and LZCNT for AVX2 memrchr implementation
c85a45acac x86-64: Require BMI2 for AVX2 (raw|w)memchr implementations
1523fbedff x86-64: Require BMI2 for AVX2 wcs(n)cmp implementations
7e1326c43a x86-64: Require BMI2 for AVX2 strncmp implementation
6260de8867 x86-64: Require BMI2 for AVX2 strcmp implementation
0161ebf15b x86-64: Require BMI2 for AVX2 str(n)casecmp implementations
97ff96b0e1 x86: include BMI1 and BMI2 in x86-64-v3 level
a6d2e2c192 hppa: undef __ASSUME_SET_ROBUST_LIST
562e5b2821 hppa: Fix initialization of dp register [BZ 29635]
e36aeeaf08 nptl: Add backoff mechanism to spinlock loop
4f3c6dcd20 sysdeps: Add 'get_fast_jitter' interace in fast-jitter.h
a7d5383328 m68k: Enforce 4-byte alignment on internal locks (BZ #29537)
dee4146cec gconv: Use 64-bit interfaces in gconv_parseconfdir (bug 29583)
6fea8e6b94 resolv: Fix building tst-resolv-invalid-cname for earlier C standards
649213ae27 nss_dns: Rewrite _nss_dns_gethostbyname4_r using current interfaces
4a214c7448 resolv: Add new tst-resolv-invalid-cname
519e1b0251 nss_dns: In gaih_getanswer_slice, skip strange aliases (bug 12154)
ee74c14325 nss_dns: Rewrite getanswer_r to match getanswer_ptr (bug 12154, bug 29305)
692fc980eb nss_dns: Remove remnants of IPv6 address mapping
def97e7f71 nss_dns: Rewrite _nss_dns_gethostbyaddr2_r and getanswer_ptr
51b6c3c28b nss_dns: Split getanswer_ptr from getanswer_r
492d259ebc resolv: Add DNS packet parsing helpers geared towards wire format
a333ba1d50 resolv: Add internal __ns_name_length_uncompressed function
d7c22ec359 resolv: Add the __ns_samebinaryname function
83b09a8e86 resolv: Add internal __res_binary_hnok function
6e56f918a8 resolv: Add tst-resolv-aliases
fae10fcb3b resolv: Add tst-resolv-byaddr for testing reverse lookup
d883d02008 elf: Implement force_first handling in _dl_sort_maps_dfs (bug 28937)
c15c0f1985 elf: Rename _dl_sort_maps parameter from skip to force_first
ff344711ea scripts/dso-ordering-test.py: Generate program run-time dependencies
f4687bb416 elf: Fix hwcaps string size overestimation
55a636430b Use __ehdr_start rather than _begin in _dl_start_final
61e15f6815 elf: Run tst-audit-tlsdesc, tst-audit-tlsdesc-dlopen everywhere

Signed-off-by: Yash Shinde <yashinde145@gmail.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index d3cea19f9c..7d7db46c2f 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "f8ad66a4cab14ed294bf50e7a9eddb73da6cf307"
+SRCREV_glibc ?= "8d125a1f9145ad90c94e438858d6b5b7578686f2"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.25.1


