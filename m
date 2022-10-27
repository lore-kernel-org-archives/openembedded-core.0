Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 543AAFA3741
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 02:37:16 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.2165.1666838230037470494
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 19:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Ep5gjoj+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d10so103920pfh.6
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 19:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLkaiNPVDXfRqF02zRycXrygrzKZXQ1AKlltDtFFcRQ=;
        b=Ep5gjoj+FT3V/AOg+Reu+9vKBgKoYT9HUk5bTFzX2RzP6aYsI92/8TxzH9av/Z+0AX
         +Qaf6rwrrqE2e8hFzl/qlcsxDBkHlhq1CSdZpCnnVHGD506U2IFADPXxBV1GgGESn/Ku
         sEPb4TsX6ApstR5AUCKpIdnrABiPOo9COMNUyajJSRHYcEu4f+mu/GxPrTpQpQR3KS0E
         UZ49puzGQkyMcJ1IrsSzJioHvb+FvW9wnDNQfn/+L5hrxg8FM03tvNonOZMHNo7zlCXJ
         hvPD3Bkdcpam6qBDM5RVYh24ra/Get4JH/rKgEdVv0X+cmpp3Ai8S+8qt24AAoXlHc4l
         Ifmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLkaiNPVDXfRqF02zRycXrygrzKZXQ1AKlltDtFFcRQ=;
        b=rR7jEFabFwwcnBZaxJ61Kwx/A5xiiYMP6Cxo2ti1yLj67voTQgDFAspedz90kUAMiQ
         eHqQxpZOBrqxIibHFCkBklb0aKveE3ZL5dne8t8V3/EM7pomVO4mIJGI/xoF2GiFYBNp
         XcbyOM6qmzdZ/EKp44IgqT2np12cN9E4rLE7UFWvTIN0apnkq4+/mPrqL91tB1doDg6p
         S8N7ymMuUn9hCpIV0sD8TfGcJiklfoXUiOQOJpqBMLfR7Uro1mRIWo7SlglxTr99c2b2
         dNq33j/7Lpnu57HKxQI3sRal6Ep4gUESfZFL1Mlus4lTUCWeSupDpfQiVnD5Fy3uPClX
         ITrQ==
X-Gm-Message-State: ACrzQf3Bamjc6k4/avoKuxZDb1ziDdAG7woE+7R9dtmATet8RAVywCy7
	UVosud1CtjdgGIRlINZNGOyItvydkH5xYx5Y
X-Google-Smtp-Source: AMsMyM5+q3tprhbxe+Z5SOZB9xmX9VAaKFf5X8WFNGzp82j5SDEbvZcbIE+ZfP75FgpEWVLYA0sKIA==
X-Received: by 2002:aa7:800a:0:b0:565:af23:f5a4 with SMTP id j10-20020aa7800a000000b00565af23f5a4mr47213746pfi.42.1666838228947;
        Wed, 26 Oct 2022 19:37:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b1-20020a62cf01000000b0056246403534sm81088pfg.88.2022.10.26.19.37.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 19:37:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/8] glibc: stable 2.35 branch updates.
Date: Wed, 26 Oct 2022 16:36:37 -1000
Message-Id: <ab154b24419782bdf281d038e093003909e698fe.1666825041.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666825041.git.steve@sakoman.com>
References: <cover.1666825041.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 02:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172183

From: Yash Shinde <yashinde145@gmail.com>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


