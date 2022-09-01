Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7640C54EE9
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 07:21:51 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.9413.1662016901139229478
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L1FyGXUE;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id e20so21059589wri.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Peh0Oo824bcttsdngIl2bm/GvHg6llGiVQ9EfF5sFX8=;
        b=L1FyGXUE7tFU2jgrRdQuP2E8rPXDqn3QAsJEL2tUs3+MmoVWlrsbsSiGB+GlZ7+AAA
         F/dPlaJiDlTunoBEMHUhC7y7RreSdFHD3I0wDPEJVJjOC3/3ph3RyPGJBoZXzJYm+RhS
         7+5L9cfGzuUncY8UKTp0g1zrDfN7p+VyoUdnG7sipVV+eobwjGyoP+3hAxrySFV7JNaV
         MltVu2nOUxmrQyDi1IZDADYIzUaVx5ZR1/erMPno6IjRAJTa+vwvBT0B+pG6wlhBLXz/
         i7nUW3FgOEYQu4VNdF40DczHAixHOA1Daham9s0+QaQatt0o01MKIoevSImU1uCirZd1
         q/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Peh0Oo824bcttsdngIl2bm/GvHg6llGiVQ9EfF5sFX8=;
        b=vEiaFBx20Jcs60KOf16QQddj1oyIPOTQxFxLhQS4nHOXVq/GACJX72pVbgdKSAj/He
         XOgUMD4HrM65/V9OVUImTVfYEksBfodIe6zQ5X5+/60yn++ljTFm6kViog+cJyIHxPGh
         DWEn4TZHS7JAm2P2BOwctGAYqKwwTcAmlKIbjdqHFGpKdb5wuHonu0zT0XdYEbrQ2XOr
         8ZdWg2EntWbZbhKitmnQljHAw0MJWECIj6hz73YrClVHpndkmGBalsHC3P1zzDfTeGbE
         8k03k20RUZTdxyLxF6yKgfiuhNcFfMvTYXcPsNsv43Wq50/v7Q00tt50V4Dbznrynpav
         Zn2Q==
X-Gm-Message-State: ACgBeo3vazEDzcrU8gjnpE3J8PI+kGWQBG0fiYJCl6Bn1h5DHfda4u6s
	ytJRkcaozr9RIjDomE9gYeVHH8SBSQ0=
X-Google-Smtp-Source: 
 AA6agR5d/d4icvc8ptvcYXxTSzJMmhZBW0UetKUn38d6QsXO45UTKLhIcWjPhUKXj9BfwF88drSn0w==
X-Received: by 2002:adf:e60b:0:b0:225:877e:176c with SMTP id
 p11-20020adfe60b000000b00225877e176cmr13867026wrm.193.1662016899547;
        Thu, 01 Sep 2022 00:21:39 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 c18-20020adffb52000000b00225239d9265sm14022982wrs.74.2022.09.01.00.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 00:21:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/14] ghostscript: remove unneeded patch
Date: Thu,  1 Sep 2022 09:21:16 +0200
Message-Id: <20220901072125.3366367-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901072125.3366367-1-alex@linutronix.de>
References: <20220901072125.3366367-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 07:21:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170147

The patch has been added here
https://git.yoctoproject.org/poky/commit/?id=ca63a0158ae42010477080ad6bb776329f1230b0
and isn't necessary anymore, as cross compilation works fine
without it.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ghostscript-9.21-prevent_recompiling.patch | 78 -------------------
 .../ghostscript/ghostscript_9.56.1.bb         |  1 -
 2 files changed, 79 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-prevent_recompiling.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-prevent_recompiling.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-prevent_recompiling.patch
deleted file mode 100644
index c76915fb81..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-prevent_recompiling.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 239d681306a8d97ed10954788d32ba2f4b55f77c Mon Sep 17 00:00:00 2001
-From: Kang Kai <kai.kang@windriver.com>
-Date: Thu, 29 Mar 2018 16:10:16 +0800
-Subject: [PATCH 06/10] prevent recompiling
-
-Just use commands provided by ghostscript-native, preventing recompile
-them when compile ghostscript. Way to enable cross compile.
-
-Upstream-Status: Pending
-
-Signed-off-by: Kang Kai <kai.kang@windriver.com>
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-
-Rebase to 9.25
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
----
- base/unix-aux.mak | 44 --------------------------------------------
- 1 file changed, 44 deletions(-)
-
-diff --git a/base/unix-aux.mak b/base/unix-aux.mak
-index 5bf72e9..9cb39d7 100644
---- a/base/unix-aux.mak
-+++ b/base/unix-aux.mak
-@@ -54,50 +54,6 @@ $(AUX)gp_stdia.$(OBJ): $(GLSRC)gp_stdia.
-   $(stdio__h) $(time__h) $(unistd__h) $(gx_h) $(gp_h) $(UNIX_AUX_MAK) $(MAKEDIRS)
- 	$(GLCCAUX) $(AUXO_)gp_stdia.$(OBJ) $(C_) $(GLSRC)gp_stdia.c
- 
--# -------------------------- Auxiliary programs --------------------------- #
--
--$(ECHOGS_XE): $(GLSRC)echogs.c $(AK) $(stdpre_h) $(UNIX_AUX_MAK) $(MAKEDIRS)
--	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(ECHOGS_XE) $(GLSRC)echogs.c $(AUXEXTRALIBS)
--
--$(PACKPS_XE): $(GLSRC)pack_ps.c $(stdpre_h) $(UNIX_AUX_MAK) $(MAKEDIRS)
--	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(PACKPS_XE) $(GLSRC)pack_ps.c $(AUXEXTRALIBS)
--
--# On the RS/6000 (at least), compiling genarch.c with gcc with -O
--# produces a buggy executable.
--$(GENARCH_XE): $(GLSRC)genarch.c $(AK) $(GENARCH_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
--	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENARCH_XE) $(GLSRC)genarch.c $(AUXEXTRALIBS)
--
--$(GENCONF_XE): $(GLSRC)genconf.c $(AK) $(GENCONF_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
--	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENCONF_XE) $(GLSRC)genconf.c $(AUXEXTRALIBS)
--
--$(GENDEV_XE): $(GLSRC)gendev.c $(AK) $(GENDEV_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
--	$(CCAUX_) $(I_)$(GLSRCDIR)$(_I) $(O_)$(GENDEV_XE) $(GLSRC)gendev.c $(AUXEXTRALIBS)
--
--$(GENHT_XE): $(GLSRC)genht.c $(AK) $(GENHT_DEPS) $(UNIX_AUX_MAK) $(MAKEDIRS)
--	$(CCAUX_) $(GENHT_CFLAGS) $(O_)$(GENHT_XE) $(GLSRC)genht.c $(AUXEXTRALIBS)
--
--# To get GS to use the system zlib, you remove/hide the gs/zlib directory
--# which means that the mkromfs build can't find the zlib source it needs.
--# So it's split into two targets, one using the zlib source directly.....
--MKROMFS_OBJS_0=$(MKROMFS_ZLIB_OBJS) $(AUX)gpmisc.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
-- $(AUX)gscdefs.$(OBJ) $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
-- $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ) $(AUX)memento.$(OBJ)
--
--$(MKROMFS_XE)_0: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_0) $(UNIX_AUX_MAK) $(MAKEDIRS)
--	$(CCAUX_) $(GENOPTAUX) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_0 $(MKROMFS_OBJS_0) $(AUXEXTRALIBS)
--
--# .... and one using the zlib library linked via the command line
--MKROMFS_OBJS_1=$(AUX)gscdefs.$(OBJ) \
-- $(AUX)gpmisc.$(OBJ) $(AUX)gp_getnv.$(OBJ) \
-- $(AUX)gp_unix.$(OBJ) $(AUX)gp_unifs.$(OBJ) $(AUX)gp_unifn.$(OBJ) \
-- $(AUX)gp_stdia.$(OBJ) $(AUX)gsutil.$(OBJ)
--
--$(MKROMFS_XE)_1: $(GLSRC)mkromfs.c $(MKROMFS_COMMON_DEPS) $(MKROMFS_OBJS_1) $(UNIX_AUX_MAK) $(MAKEDIRS)
--	$(CCAUX_) $(GENOPTAUX) $(I_)$(GLSRCDIR)$(_I) $(I_)$(GLOBJ)$(_I) $(I_)$(ZSRCDIR)$(_I) $(GLSRC)mkromfs.c $(O_)$(MKROMFS_XE)_1 $(MKROMFS_OBJS_1) $(AUXEXTRALIBS)
--
--$(MKROMFS_XE): $(MKROMFS_XE)_$(SHARE_ZLIB) $(UNIX_AUX_MAK) $(MAKEDIRS)
--	$(CP_) $(MKROMFS_XE)_$(SHARE_ZLIB) $(MKROMFS_XE)
--
- # Query the environment to construct gconfig_.h.
- # These are all defined conditionally (except the JasPER one), so that
- # they can be overridden by settings from the configure script.
--- 
-1.8.3.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.56.1.bb b/meta/recipes-extended/ghostscript/ghostscript_9.56.1.bb
index b2e741b44f..e71a6cc0d3 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.56.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.56.1.bb
@@ -36,7 +36,6 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-           file://ghostscript-9.21-prevent_recompiling.patch \
            file://cups-no-gcrypt.patch \
            "
 
-- 
2.30.2


