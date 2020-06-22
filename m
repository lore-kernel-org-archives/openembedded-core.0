Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web12.18504.1592835562933016707
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 07:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jc4OnWGX;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id h10so8199028pgq.10
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 07:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=kKMPIdd2BT1AB1gP38CvXGs/mruM6mgPhK7ejqIBEBA=;
        b=jc4OnWGXmMwEpF2tIjitTG2pmNRxuAYJqsrje7H2IYJgWxv3Vrf9fWdvPBMmHWFvFK
         Z16QVA9ax1uPiO/fTQOrO8t/ADggzoIWjedXHIUQBQVdE9sfbZC3iXrVHm/4z5bAR1ck
         nKjdDosmkuDI94unjlxiuM39DAoU23D9lPJbXtImemGsPAi9IJhR2WlzGWwOGXDf3hPQ
         Y5BeXPf731vYPcxkA1ZBlRW4cKQURm1BkO5ianb+ZI238PWBnBcTa/UiMv7BkIMEZQV+
         uBSiSDxVS+cugMPQNuteHht1x6GxbNQR9MOx7CIcVeJIoErOO5nwoj33O/Mtq2r6bvwL
         9dSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=kKMPIdd2BT1AB1gP38CvXGs/mruM6mgPhK7ejqIBEBA=;
        b=L14X0yg3mTdr5vEpGaYsCtbLOzVPQzqKk0LPRW0lVQAVmHYnk4SEa7d6CQ/7KsAR4D
         pvDcQzG984tA/f9Kvq0gBeRzZ/qjA3UcT0pN4vIh/I78sWXbclAbdT5OG7J1+ud1TKen
         Pf6u7mF1mQx5O4l8fVwMFQInHQ4+D5XhyH8d0PlnToUtgezopVxgCLrtcmQG2KnWr1Yo
         uEYQSeDYUmx8GLVrSxt9EGyDXZ/foZKctX96M5FNu5iSvN9eQoOm+U8SnQM6adot5BNw
         LbFDRlJkL6C9vEO0xFDzzwTlmlbMuK/Fz1JsPz3COcNm/kogzCRTGReTjEhTZvlJBtgY
         m0hg==
X-Gm-Message-State: AOAM5339Br700gk2cVYtCOpFXiaZbniVE3viFi6WRnvmQQVoIrADBlEt
	kfg+IuoRlF22UEACHZZOHg/uEoRb
X-Google-Smtp-Source: ABdhPJz7HHMd1UEEf5kOcHA3Pya6SSATJHEsIxZ5bRNo80Z9E1GEWaFxFERbwfQ5FW7HNSnqYFneKg==
X-Received: by 2002:aa7:9513:: with SMTP id b19mr20010727pfp.152.1592835561823;
        Mon, 22 Jun 2020 07:19:21 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:489f:ae11:ae3f:a4e7])
        by smtp.gmail.com with ESMTPSA id 23sm14188840pfy.199.2020.06.22.07.19.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 07:19:21 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] maintainers.inc: add new packages remove dhcp
Date: Mon, 22 Jun 2020 07:19:15 -0700
Message-Id: <20200622141915.31932-7-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622141915.31932-1-akuster808@gmail.com>
References: <20200622141915.31932-1-akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index fc1b5272da..31dfbf5064 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -144,7 +144,6 @@ RECIPE_MAINTAINER_pn-debianutils = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-dejagnu = "Nathan Rossi <nathan@nathanrossi.com>"
 RECIPE_MAINTAINER_pn-depmodwrapper-cross = "Mark Hatle <mark.hatle@windriver.com>"
 RECIPE_MAINTAINER_pn-desktop-file-utils = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER_pn-dhcp = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-diffoscope = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-diffstat = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-diffutils = "Chen Qi <Qi.Chen@windriver.com>"
@@ -286,6 +285,7 @@ RECIPE_MAINTAINER_pn-json-c = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-json-glib = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-jquery = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-kbd = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-kea = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-kern-tools-native = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER_pn-kernel-devsrc = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER_pn-kexec-tools = "Armin Kuster <akuster808@gmail.com>"
@@ -393,7 +393,7 @@ RECIPE_MAINTAINER_pn-liburcu = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-liburi-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libusb1 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libubootenv = "Stefano Babic <sbabic@denx.de>"
-RECIPE_MAINTAINER_pn-libuv = "Armin Kuster <akuster@mvista.com>"
+RECIPE_MAINTAINER_pn-libuv = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libva = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libva-initial = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libva-utils = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -449,6 +449,7 @@ RECIPE_MAINTAINER_pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>
 RECIPE_MAINTAINER_pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER_pn-llvm = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER_pn-log4cplus = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-lrzsz = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-lsb-release = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-lsof = "Ross Burton <ross.burton@arm.com>"
-- 
2.17.1

