Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93640EE49A5
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 02:48:12 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.5610.1692931684467478477
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 19:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=3OPMe4SW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-68bec3a81c4so362882b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 19:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692931683; x=1693536483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAZW+X7dZ5Oj2FpfHZd0scHi0L1J5ZvKInvgO5fE7ig=;
        b=3OPMe4SWS1TXA64aDehX9bPZG7+iftJmSM/lSHi2mKkfVMaorkP1GhUUkNkvtJrcyH
         mfejLZwzG3mz4ssYJKua/B9/ZNc0F1u7IWsmplFZ0xNS5Fksgvwpx/b0uEFeAmyTLCoQ
         FL2Z0eesq3FrY+MYkkilMTJUzLNYDc6woDKLnINV4lWDm6/Q36Gbfzp9/bbZUDvhDP2k
         Z9OPgnd94PrgB0fjqVXwAvVfcmx3KqkF3mD4f3rIGSxPDB+RU+Mi58P/FxsX+bJpHHSN
         1w8eo/sRGCyzRhqzmS7VZC7RaB5QW2R1PzTV2ewt8LnV/yXlR9XC+WfyeX5brnyuQBIk
         Wb2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692931683; x=1693536483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAZW+X7dZ5Oj2FpfHZd0scHi0L1J5ZvKInvgO5fE7ig=;
        b=HHG4S5I5pcG15bjrquQbAaoakZm7jbkqU8FnOaUzGBUpe+7imEupmz+DtSbRrS4iYy
         NaxzcMk6jVQBt0k3hMKAFpVXqehnugJBMVtGXAVrLxko42fl5lQkcSicObaByGeIB230
         DM46aA50N8BBM5l+r/U3u6/rEnNUyGf9RSNLxcoj+90vRNLtJrj5OWHsWTPf0+dBW9NM
         iTyLA6jRvKIBsKrLM4a5fj9zuQqidgCCcd017OG0zC6uyiBKMFDpamAtOYte+FItvVsl
         i+PyTXXT7bWu5xlUXVtUg+HdxcC0uelSykvKAdY17vZSZHDWJaUbhn951NWO7cuOlqj2
         +CDg==
X-Gm-Message-State: AOJu0Yw5FLKlXKIKDB6vENBwoztpwVcN17BSPBdRZbmbnmChufuKckJa
	xPLTNtCStlzAj6+H3ksbPFLT0bk1Y5s1JmSdzVA=
X-Google-Smtp-Source: AGHT+IFJsXgSR0L2dYXWgy3XMpGKPf6TlbDLhSaD042CZd3jReUxDCOmLabd7MBcgFt/r4fLnc8QTg==
X-Received: by 2002:a05:6a00:2d1c:b0:676:8fac:37 with SMTP id fa28-20020a056a002d1c00b006768fac0037mr24504254pfb.4.1692931683546;
        Thu, 24 Aug 2023 19:48:03 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d3-20020aa78143000000b0068883728c16sm446803pfn.144.2023.08.24.19.48.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:48:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/14] yocto-uninative: Update hashes for uninative 4.1
Date: Thu, 24 Aug 2023 16:47:34 -1000
Message-Id: <c40053f9d562abe9c7972ceec9f53662213b8189.1692931546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692931546.git.steve@sakoman.com>
References: <cover.1692931546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 02:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186683

From: Michael Halstead <mhalstead@linuxfoundation.org>

This version includes fixes to patchelf.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1c5c8ff97ba0a7f9adc592d702b865b3d166a24b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index ad4816a1f3..b3bd7794fb 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.37"
-UNINATIVE_VERSION = "4.0"
+UNINATIVE_VERSION = "4.1"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "7baa8418a302df52e00916193b0a04f318356d9d2670c9a2bce3e966efefd738"
-UNINATIVE_CHECKSUM[i686] ?= "83114d36883d43a521e280742b9849bf85d039b2f83d8e21d480659babe75ee8"
-UNINATIVE_CHECKSUM[x86_64] ?= "fd75b2a1a67a10f6b7d65afb7d0f3e71a63b0038e428f34dfe420bb37716558a"
+UNINATIVE_CHECKSUM[aarch64] ?= "b6ff9171aa7d3828bc81197822e804725908856bbd488bf412121cc0deddcb60"
+UNINATIVE_CHECKSUM[i686] ?= "6354fd2e09af1f111bad5e34ce7af4f9ad7cd266188af7eeceaeb982afd5354b"
+UNINATIVE_CHECKSUM[x86_64] ?= "f83eca543170adfd2432b135ca655922a4303622d73cc4b13e92b973cdf49e3a"
-- 
2.34.1


