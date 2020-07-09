Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web11.588.1594271977538794712
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 22:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UsEsYRxt;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: rehsack@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id l12so879838ejn.10
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2020 22:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=sRQzF2/EyvdrYN9RtK1nqk8MGOkuKuzSrLS3J3Z3ARE=;
        b=UsEsYRxteQ+kzKzgoJFnC+KR3l379LZMiCIKbl0+LQIcfIUJKXiJi5uBKtRp+2MkTo
         37EsoZP1KIwVRIkzeBTmftFkyY/+iQXQ5pes9NsGfim0BXKmhJRw/eSccbrKXSeSJV09
         TdzyfC8QrC4rvpviAZl6oBf8MZinVQvhDkZbUy9z31Ql5ReFRSdAGZV2GdpEGPOXZNaY
         r9V+EYE3cl7cWRC9ZHhXo/o+EfAw86iJIi85Xvojrgz2P7xQht6dYTlmEwUrUbYOv2RN
         K2djvWZi8HWJJBt/47LTxQSPolE5OJE+iYoJQEBpKeM/eQtM7KaLl6MbgLRIlFWk06aD
         aC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=sRQzF2/EyvdrYN9RtK1nqk8MGOkuKuzSrLS3J3Z3ARE=;
        b=XJBCAVz/6vr7Qmmb57NqBSI7Kg7y3my2DsDgXbXQ5DfMILTbYu2uvBxDsSdkugffdW
         U8wKW49W+xZr2BP/HNNMoYxcnuf6wj0hgpQ+Y0vOb56hgtggbdky9xFxpTLZWkn3ytDq
         oAEcnU8ueBO553jLtqHxXfb5dXczqSyGZqxzD8kQV+HXmZKOof8UgQe2xzj4Muo+Q0/j
         f99YXCzymsjqgORZONNgY0Rfcgo+xrNJeAiRjsGBuCf437qffNpw0NYvqP43npFebSQH
         jemCJI8lHPE3FtU7E16ZpFERkdHZfo1cis+CGS+41J5u+cS+u1ncBPEKTy/F88y7bsG6
         +7+g==
X-Gm-Message-State: AOAM533D2nw/G4gSgZUL0Ey/zPqMWlmz7QQK0nsK2pFx9QJkLNFDfS+n
	nVoRS/F6fiNwzxwAnFXUW3/FAaqI
X-Google-Smtp-Source: ABdhPJwHAqyiCGF34AoA5IZTNhQjX6QWkWZnylg0Nn7qhHkHOX0NaMljvP59xfeTXIH+ScF13xrAxA==
X-Received: by 2002:a17:907:a92:: with SMTP id by18mr57797086ejc.116.1594271975636;
        Wed, 08 Jul 2020 22:19:35 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from beaker.muppets.liwing.de (p4fe931fc.dip0.t-ipconnect.de. [79.233.49.252])
        by smtp.gmail.com with ESMTPSA id i7sm1121770eds.91.2020.07.08.22.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 22:19:34 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: "Jens Rehsack" <rehsack@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [OE-core][PATCH 1/2] subversion: extend for nativesdk
Date: Thu,  9 Jul 2020 07:19:23 +0200
Message-Id: <20200709051924.4355-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1

For SDK environments where people still use subversion, let it easily being
added to buildtools-tarball to invite more developers relying on Yocto
based SDKs without much requirement to setup anything on the development
workplace.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-devtools/subversion/subversion_1.14.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/subversion/subversion_1.14.0.bb b/meta/recipes-devtools/subversion/subversion_1.14.0.bb
index b9884151cf..452a025fcc 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.0.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.0.bb
@@ -59,4 +59,4 @@ PARALLEL_MAKEINST = ""
 
 RDEPENDS_${PN} = "serf"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

