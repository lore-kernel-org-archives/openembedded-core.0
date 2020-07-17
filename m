Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web11.12651.1594996685011948698
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 07:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Cb89/De4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.194, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f194.google.com with SMTP id x72so5481339pfc.6
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 07:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=iReTYbOBFHRxWmWujRuVNP22y7zGrUsQy2SkiwlSvUU=;
        b=Cb89/De4JFBkVcivL4wUsmLF5lT92IxkK2/Jia0gACIzUd1GcXfZ+JyHlOH6nf2VUD
         GMNFO58NasyK/iVtBypOSuxrRjPMHAUWGuabU818Z6Qm6m1DxTvZ5v7tsMFxABwsbBof
         DetbNAVdIJMdrwO9PoekcxGQ0/Nxf1tvBPClIS9V16bMJzfGmwEA+T5aSA4a2337gzS0
         wqLmT2IRgnhNC9c+cbt6SnMPALgIQgf54NL9QIT40i1AwH+b07z0kuaj+i3HJ3pyInJp
         /OBVSPRi7oBbwxKw/hcF/J+1ejOuOwp9JZlEoZGGH1Kt96Q/UtVHpX/ApEs6lI2vkoyK
         tJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=iReTYbOBFHRxWmWujRuVNP22y7zGrUsQy2SkiwlSvUU=;
        b=LKxI0ZLWNrDBn8eqyFnea/pMwhqb7phEgOz8KGrFhDRBr904feaSRCVkTJ2nLpwTxo
         cg4nxJgdABSoUQlF6tjrxX1dXPez+/tFYsEUFaXa9UZ8C211sWEC69bm2nOYF3NnPOH4
         asJ1u5RdEYf1WiQAyA/CgG3Txv8tMxi/ookOzuqQd8N0fcLYSHY9mWJ08PIZd4Jvy6Bw
         XOF/vdLzbmOFeXGHGDUarGPffeon1jxpKKkkDhGFt6/urwHt67ImEmBlzx0SRlo20HcX
         Cc8X/SZ++LFq16uCsEXB8r8fMLlLG9dJyfEOaxwpt1AxSDeOL5H23ql3nozbtobar8SS
         F3ig==
X-Gm-Message-State: AOAM5323GWqq+1oH26bOZQUvrLM4pj6YVzJBTP13xajvvMkRCcCNIxRJ
	5SA2p5vQ6de2N3W8FTGXdZFPGUJXSjc=
X-Google-Smtp-Source: ABdhPJwOXNa+XtODhs6ylsWvpgervzcRyLdX6fbOH8LBi03B6g3Kei5weD79eGG92kOam9nSaH0rmg==
X-Received: by 2002:a63:eb52:: with SMTP id b18mr8648225pgk.434.1594996684064;
        Fri, 17 Jul 2020 07:38:04 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id mw5sm3448727pjb.27.2020.07.17.07.38.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 07:38:03 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/20] linux-firmware: move ibt-misc to the end of ibt packages
Date: Fri, 17 Jul 2020 04:37:08 -1000
Message-Id: <f9d24c6cfb2d167b413301b9ec853ddc181e8043.1594996440.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594996440.git.steve@sakoman.com>
References: <cover.1594996440.git.steve@sakoman.com>

From: Yongxin Liu <yongxin.liu@windriver.com>

After commit 3ca1d3fa1d ("linux-firmware: fix the wrong file
path for ibt-misc"), if we don't change the location of ibt-misc
in PACKAGES, ibt-misc will include all ibt files and make other
individual ibt package empty.

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b3a5403a9e5d0085d7b2f97a2e44b74a54c84d3f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
index 79acccddc7..2b5963c0c8 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
@@ -278,9 +278,10 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-iwlwifi-7265d ${PN}-iwlwifi-8000c ${PN}-iwlwifi-8265 \
              ${PN}-iwlwifi-9000 \
              ${PN}-iwlwifi-misc \
-             ${PN}-ibt-license ${PN}-ibt ${PN}-ibt-misc \
+             ${PN}-ibt-license ${PN}-ibt \
              ${PN}-ibt-11-5 ${PN}-ibt-12-16 ${PN}-ibt-hw-37-7 ${PN}-ibt-hw-37-8 \
              ${PN}-ibt-17 \
+             ${PN}-ibt-misc \
              ${PN}-i915-license ${PN}-i915 \
              ${PN}-ice-license ${PN}-ice \
              ${PN}-adsp-sst-license ${PN}-adsp-sst \
-- 
2.17.1

