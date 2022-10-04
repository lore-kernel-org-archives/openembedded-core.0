Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691FAC4167B
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 15:51:38 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web08.12366.1664898691743312552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nd2T1rjU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d10so13472556pfh.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=ADY2A/Kon2HfilIpy7soWAB/xmYiNWJgrT+pXA/1ydk=;
        b=nd2T1rjU3LHbwrzfiy5wgPUWn59tOPe4HfOOqZVPbIgKvntE60w1/tdupefKLdVZif
         JqUsg0SOQ7/uVtiSw5+VuQgBiYGP1gOsGMtQGr2k5wtNua3CJqTgIQB4teFQQOpit133
         1KnGHKOSgb6F8G5obJQUZ5n38bKEjeVBAzjhU5WNCrew5s79eW50zZ8Gf2fdKe9E9mya
         y0bSb7z+AyjxCO9d8j3A1zz/3Xo/FXPTQDlWxYQHxCi577Wc96vKJ1Hc0ixU1wEdxnvh
         t0rGBEz+WU/hh+2tA81iuob/sSB+AMCp3FE2a74Wdkikogz8NXnsOazi7r2lQBl0mzj/
         AgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ADY2A/Kon2HfilIpy7soWAB/xmYiNWJgrT+pXA/1ydk=;
        b=PpBoQogRajimgHpUX8l4F9iEbXk2f4c34o3lJ/5Ha/6R3DYUpXhi89sdadDYe42giG
         6TdGK1Hr9AfRB03n59bFK7V7eiBIUOD+p7gptMAdtx7z3uVcq5G0fGk1cM2sTvr6StZ8
         9+J1bR5aw+Dz2417oa7wPyj6JePMs0tFAv7TU/AX3KIUDmfxmNT/2taXa8H3Aypr0foW
         fVconZiJuoqc/71zuJ23KOhaa7AAU2rx5F+sdP1rq7ZRwrGNugfsEevbMnQb48skcn/K
         +0eVm/5W0Hmy4lv6X/AQKL+BOnBCty0ibGho+DG0xLBHAqwke30sUbsZJPHzPIGaQcgh
         GnHQ==
X-Gm-Message-State: ACrzQf3CgXjxnsMaIQOznHTOpe9hZohl5F70eo8GKGo1zLIOmG3uhSBF
	zuQ73xsY8z3lWaC4MfM3UkCMeWoiJLtBEh2x
X-Google-Smtp-Source: 
 AMsMyM6XVoOkJS9v1WNdQErEXBxnSHGTYjwE5ipP6d03F9wrmUE9/PQVvqWtyP3+sImUkgH3sCi6HA==
X-Received: by 2002:a05:6a00:2446:b0:52b:e9a8:cb14 with SMTP id
 d6-20020a056a00244600b0052be9a8cb14mr28492536pfj.32.1664898690775;
        Tue, 04 Oct 2022 08:51:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a2-20020aa78e82000000b00561642b6903sm4464266pfr.120.2022.10.04.08.51.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 08:51:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/18] tzdata: update to 2022d
Date: Tue,  4 Oct 2022 05:50:40 -1000
Message-Id: 
 <cc3d1034d5635fe8270eb532b586c8fb84d851bc.1664898546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664898546.git.steve@sakoman.com>
References: <cover.1664898546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 15:51:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171418

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ceac0492e75baa63a46365d8b63275437ad5671f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index d032fed356..d3c78e9157 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2022c"
+PV = "2022d"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,6 +14,6 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "3e7ce1f3620cc0481907c7e074d69910793285bffe0ca331ef1a6d1ae3ea90cc"
-SRC_URI[tzdata.sha256sum] = "6974f4e348bf2323274b56dff9e7500247e3159eaa4b485dfa0cd66e75c14bfe"
+SRC_URI[tzcode.sha256sum] = "d644ba0f938899374ea8cb554e35fb4afa0f7bd7b716c61777cd00500b8759e0"
+SRC_URI[tzdata.sha256sum] = "6ecdbee27fa43dcfa49f3d4fd8bb1dfef54c90da1abcd82c9abcf2dc4f321de0"
 
-- 
2.25.1


