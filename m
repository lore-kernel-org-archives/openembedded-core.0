Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D8BFC7EE2A
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 15:25:26 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.36191.1683386717257417077
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 May 2023 08:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=OlnJnuVp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-64389a44895so2422523b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 08:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683386720; x=1685978720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ffs4NYvPP67YwYlBG9ejGwN0Ed+zI2x2A70q3+WSjQ=;
        b=OlnJnuVpnAX2iGOffH3Wj1/tmRhEk73QCngWRuPIMUYtaug2NsUoWzKiRkUTIaCc3h
         Is3Sx/jbkBxCcnRq6zNaL3FaLsMaIU6/2zLuMJwRxCsWANW7M9iGeo+4m8GUp4jliY8f
         da4a2ksWhrYnwiQSXrRhPoubC5XBo+nG0IJAWMf+FpwWfc3R5agLc2KL2pCjBz3ulxop
         8yr8MvWOSqMBNBWcwlFBAQGkXVz37qsVo0zDeWUUPgQUe4q9h84LOsdjH8t7iZUtDqyN
         Dzs4rutVmnWXkYLkDSmQzePBc4y3eCzCBu/SKl2GpPLduo7UgPu5951MlVdHIf7IhQUn
         3N7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683386720; x=1685978720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ffs4NYvPP67YwYlBG9ejGwN0Ed+zI2x2A70q3+WSjQ=;
        b=Ud0qvk39HeMittxGLAwEAWE+7Nh8LwbX/z6EgE0EgyxCNfvPnZXIgKKoSkO650deeL
         9Dn8pcobDhneDn8ZEwxcEB1GDykzOK2sFLAL64c076KYn01wI4zmQNl0Af8YZKj7ls6J
         CHuud1YkL4gk9HeUT+4xMDVhxWnBs+MAo+TbxZkjJUv8VGtYDaySqdZitm0Gb+kbUHea
         os5Yw4tIIahGBLjGReIROGdpn5nIbwU6f5GMTPtyzjLjPBH0oLPjip6sgXbsUc2qdfZe
         9clWiT/YMNLKc6A33w69eTCeJB9tuv+BY+BeWrxriXx6OlaED0As11PGNG1PzidgjaCh
         J2bQ==
X-Gm-Message-State: AC+VfDy3I7pCp7+BBQh7xP7uQu/JPaNVVsTxxXVYA4SamKU8GKAkvjhL
	zCSRu77lIiB1LVDnP/Bx4+l/lvT/JlIsRnC3VNU=
X-Google-Smtp-Source: ACHHUZ7BeqAKMT3Hfh2IJ90kSzURDDtRQP459i7XP/uRUuyaGUgGiGW5GbvYgO0h3paNOhGTAIMLmA==
X-Received: by 2002:a05:6a00:c89:b0:63b:5609:3bb5 with SMTP id a9-20020a056a000c8900b0063b56093bb5mr7098639pfv.18.1683386720392;
        Sat, 06 May 2023 08:25:20 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c8-20020a62e808000000b0063b1b84d54csm3296718pfi.213.2023.05.06.08.25.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 08:25:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/15] libbsd: Add correct license for all packages
Date: Sat,  6 May 2023 05:24:44 -1000
Message-Id: <538bd24499acfc42ee592a8302b94e54035da178.1683386547.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683386547.git.steve@sakoman.com>
References: <cover.1683386547.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 15:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180997

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

BSD-4-Clause is only applicable to the {PN}-doc package as when I
check for the source code I find below files which only uses the
license BSD-4-Clause

~/sources/libbsd$ grep -rl "All advertising materials mentioning features or use of this software" *|grep -v \.1|grep -v \.5|grep -v \.8 | sort
COPYING
man/arc4random.3bsd
man/getprogname.3bsd

~/sources/libbsd$ grep -rnB5 "BSD-4"
COPYING-9-Files:
COPYING-10- man/arc4random.3bsd
COPYING-11-Copyright:
COPYING-12- Copyright 1997 Niels Provos <provos@physnet.uni-hamburg.de>
COPYING-13- All rights reserved.
COPYING:14:License: BSD-4-clause-Niels-Provos

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libbsd/libbsd_0.11.5.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-support/libbsd/libbsd_0.11.5.bb b/meta/recipes-support/libbsd/libbsd_0.11.5.bb
index bb8766a070..21af37882f 100644
--- a/meta/recipes-support/libbsd/libbsd_0.11.5.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.11.5.bb
@@ -29,6 +29,13 @@ HOMEPAGE = "https://libbsd.freedesktop.org/wiki/"
 # License: public-domain-Colin-Plumb
 LICENSE = "BSD-3-Clause & BSD-4-Clause & ISC & PD"
 LICENSE:${PN} = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-dbg = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-dev = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-doc = "BSD-3-Clause & BSD-4-Clause & ISC & PD"
+LICENSE:${PN}-locale = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-src = "BSD-3-Clause & ISC & PD"
+LICENSE:${PN}-staticdev = "BSD-3-Clause & ISC & PD"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=0b31944ca2c1075410a30f0c17379d3b"
 SECTION = "libs"
 
-- 
2.34.1


