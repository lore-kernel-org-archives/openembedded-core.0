Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A09EC32772
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 19:41:02 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web09.7377.1660938054795590900
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 12:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W1PHaIug;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id s206so4453987pgs.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 12:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=v+xs8xjPf96EkOAr55exAZVM27irVPw/AL/jL1kBL5Y=;
        b=W1PHaIugoDQygQb5OUlP4go4WUUMnqDanfnVhZdIPWylPVVf4InAo2lbzfZciMnObC
         6hHP5KCsBHoCRhhMlJrSqYcBFtWoE3Tm2FzkLRG3aTTTBNd3Hs52fkYGouMOqKnCMthW
         +UGSHsO6lgMcJthuF+LsxtIKQKNU2V6uylUAWc0u0CDe8Y8Rtolab7yk//Ncf2/VgJoS
         PGDDLAYqoh/G3zfEVUHgWTT0cXgfZd//f86IpPkxW+2St7i8hs0RKHzjSuGXa7bb1QKR
         fTAy+Nx7jo5rPjWDu/uj9SbqUh278B4CG4JjobsvrbG0Lh5bLzy286F7O+A0A3N8DzY6
         JP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=v+xs8xjPf96EkOAr55exAZVM27irVPw/AL/jL1kBL5Y=;
        b=nc2pV87lvx+oqMetJNC2drVWvF4vK23zThRYIJHL4Q1a1AYmNeRqoSmjn+8LUPeGm/
         eGuR932IUYKHJgCB0+2MHtTKiA4XClkCSyFxYvRa3K/1A41KgSz+4vw3OodtjacFcQ8/
         NRe2OlOI2P69wJnugphqNCKj1DT/S/1+5KYIHMec5meVKnNjrna7mmU4uZ9PmhVUnJMd
         6ALDPXYylsXOQpmLygL/6LaFqKfor+LocBTLKL3zrZtoOXfIBgj8kIwIHzQFw2bSfUNq
         5nta11CWLC1/tfHj+DqeAaCuIBe76eF1JOoFdCjUvP5el4TTV5gZaWGppZVTrbxZOjuL
         /PqA==
X-Gm-Message-State: ACgBeo1ePZojocpw8zhJei+bWSQ5nt//tIgzzP/X6fVgsMY6g0y4N958
	GX25NDbaMIY+IJn2coJ4Bzhha2A897NFSw==
X-Google-Smtp-Source: 
 AA6agR4CPJKZ5KxQZRa6+z5Ta+JsFi/GTwIGE7wXcBYDJI204nZIVX+E9cZ/zBzET3enpAD7LyDMkA==
X-Received: by 2002:a05:6a02:205:b0:420:8b7e:3ff with SMTP id
 bh5-20020a056a02020500b004208b7e03ffmr7219992pgb.427.1660938053847;
        Fri, 19 Aug 2022 12:40:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d53f])
        by smtp.gmail.com with ESMTPSA id
 y2-20020a62ce02000000b0052ea306a1e8sm3795600pfg.210.2022.08.19.12.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 12:40:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] binutils: Upgrade to latest on 2.39 release branch
Date: Fri, 19 Aug 2022 12:40:50 -0700
Message-Id: <20220819194050.3687868-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 19:41:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169641

This brings in few bugfixes which we need e.g. fix elfutils ptests we
need

https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=e8cf73215187b0c08679d726a5cc7c019fa3ea2e

changsets in this update

* 9e855cffa1f PR29466, APP/NO_APP with .linefile
* e3b5d935247 PR29462, internal error in relocate, at powerpc.cc:10796
* e8cf7321518 gas/Dwarf: properly skip zero-size functions
* 9284b63ea39 ld: fix NEWS typos

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.39.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.39.inc b/meta/recipes-devtools/binutils/binutils-2.39.inc
index 0976131ddb..89612a3eae 100644
--- a/meta/recipes-devtools/binutils/binutils-2.39.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.39.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_39-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "a58f83e8b85fa3c1564de530d68a14fc620c0027"
+SRCREV ?= "f89058434f13382c85b8729464192bc7763d88a4"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.37.2


