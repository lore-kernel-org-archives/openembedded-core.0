Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3F5C46467
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 16:44:34 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.22290.1672418665272767544
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 08:44:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=74Os/1UL;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id e10so597270pgc.9
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 08:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qpSkTaKSRcLrKEbupBwjDH2MefBdXMz7u1+dOB60LKk=;
        b=74Os/1UL3Ng48GX/vK2nYvetE9lso9DHI4qx9vCJYLBktLJ70D1Z4BaO7kfvi6M3rl
         iWS9+0syju1uT5Na0nl/zX9lFBtGFVSsrLVQ9wwHTebDkXM9HWXi47nUHAZsHcecU2EG
         jyYmnunAvbelxinr5+nijGdqebKGrv/ufEJOvsc7+Bs240buk4852evBikkswnIlIytA
         eOklnMm0bOhhIPR67J0X7zT31T/zJHuVGWIcHcO5R7Z8BkOnCFUb3zXuSCzTcTNIAKvv
         Nh778CHDIh3S6w/U8RDqKgSEXQL5W+5rAKrJzzGbB+fMQeZmkUpyj+5NUb3hFLzBTdoG
         uX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpSkTaKSRcLrKEbupBwjDH2MefBdXMz7u1+dOB60LKk=;
        b=jt8p+yAQxOY2zu26Uf2xldL4clK7bU0H0dAePcb6HRUaCkyaCKX8GNoc9oPXr5b6BC
         HTp23qpz7DrGBZw6edAn/6tAtYFR760SGIVR8MtsEfgDD8V/6otuWch0GxheXT0whP1W
         ETvoUi91PjxhRw79hxkLY91c1Ib1zfz2umG8L4gn7l9cKnaE/9mwJadXUxdagy1blgrn
         sqKvL2lhOkhlrQLjWkNd016T1dVH0DOFZy4Yh8CA6dO4cVtg5kq/NAKB6zWSBPwa5zP2
         Th1n+lnAT2Qf4Oevx2Grz2JpTX1UJO2/Xwc4lXuWBSjmD2wT1L9M8ZGCX6AxjtrEWWix
         u8FA==
X-Gm-Message-State: AFqh2kqH1MGYY/ic4TTUyi/+2YDBtXchVGA/yx38ed8ux4p+iWApc5Vy
	/Efm1Ylsw1yWg/tG4vib+Qi2Rft9X/d8spkCK+4=
X-Google-Smtp-Source: AMrXdXt8TiZDQCCeFegnQbFmt0rkwuLKaTX7+Q7fI8i3e5RWZmHNLjHDpUTTUJYJ6hFp3MlBRxsXgA==
X-Received: by 2002:aa7:87c7:0:b0:57a:9b14:69b7 with SMTP id i7-20020aa787c7000000b0057a9b1469b7mr32977163pfo.0.1672418664315;
        Fri, 30 Dec 2022 08:44:24 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id a79-20020a621a52000000b00581ad007a9fsm4413200pfa.153.2022.12.30.08.44.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:44:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 03/22] opkg: upgrade to version 0.6.1
Date: Fri, 30 Dec 2022 06:43:53 -1000
Message-Id: <e331a832a2ca4b53158a8492d5230136da7c0bf1.1672418540.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672418540.git.steve@sakoman.com>
References: <cover.1672418540.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 16:44:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175144

From: Alex Stewart <alex.stewart@ni.com>

Opkg 0.6.1 Changes:
- Opkg will no longer complain when trying to clean up the temporary
  directory, if the directory does not exist.
- Fixed a SEGFAULT when parsing package indexes with invalid `Size` or
  `Installed-Size` fields. These indexes will now produce a
  comprehensible error.
- Fixed an inconsistecy in .list generation where files would sometimes
  be entered with/without a trailing slash. The trailng slash should now
  always be removed.
- Fixed [a bug](https://bugzilla.yoctoproject.org/show_bug.cgi?id=10461)
  in package removal, where empty common directories would be left on
  disk, even after all owning packages were removed.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 037ff235fa8e369c0eac9f84cb82c9eaffba85f3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/opkg/{opkg_0.6.0.bb => opkg_0.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/opkg/{opkg_0.6.0.bb => opkg_0.6.1.bb} (97%)

diff --git a/meta/recipes-devtools/opkg/opkg_0.6.0.bb b/meta/recipes-devtools/opkg/opkg_0.6.1.bb
similarity index 97%
rename from meta/recipes-devtools/opkg/opkg_0.6.0.bb
rename to meta/recipes-devtools/opkg/opkg_0.6.1.bb
index 53c7399929..50c9451a57 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.1.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "56844722eff237daf14aa6e681436f3245213c5590ed0cda37a79df637ff3a4c"
+SRC_URI[sha256sum] = "e87fccb575c64d3ac0559444016a2795f12125986a0da896bab97c4a1a2f1b2a"
 
 # This needs to be before ptest inherit, otherwise all ptest files end packaged
 # in libopkg package if OPKGLIBDIR == libdir, because default
-- 
2.25.1


