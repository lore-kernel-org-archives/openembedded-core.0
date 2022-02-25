Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F84FC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:28:09 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.7076.1645799289056520439
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=XxWdIQHK;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 g7-20020a17090a708700b001bb78857ccdso8589520pjk.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Mj6Vl0noIwZlnL3Y/wdBHSrp37IpXYQYsiMgdEIJC9g=;
        b=XxWdIQHKPqXEg3Fgzrv3Y/yNgweoHBc9RVTyylmAaH0ma60eqzrTl43kMYW+NGym9f
         7jzPaUXjVtu5MbI8rHv9L3M8lqbW8RzSuOSYQSCFy9yzeSy9+IodLysLtdimklLnp1iv
         mnw183IPLnAc4BIDs8X978ltwyUfH6iL57lGLFMe2RrUYPP5ifwDAhcm5kmMPX+FAtKE
         G5c1sKNOS7Ta9xsrzfknHe2cPyhQTVQBfpuSnZ88Y2NIwYzZyWMGLJu69K0Hhusz8y8D
         cvoAybAzPFD7iSBfvFoW9BLX0V9TI9BDQnA9rH2SrzBEIOLys4kjxztzkihGU0sRtWOs
         zdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mj6Vl0noIwZlnL3Y/wdBHSrp37IpXYQYsiMgdEIJC9g=;
        b=a29vIur/OATyUCqhk6YZ2p/qfV5jJU1MYrgorvvhuIrc63+W6GYiDAW6qnSxc6E3JE
         Tkai6eXPPcCe7g0HDTGTwm95ufNZlZsNR57AQVabKpIIEX8hpK1MwYiWsTnyB55oW2my
         3mHJjXofrdKMg45cI9f0SlpU9HbglzMnuNIqPG+oTVer7VZdw756mFoeFpC2DRPCUDb0
         5svDmp0yLoBLTeESmagBl20iZjGCjA1TUvbDHGEDNWuNK8q8kSNJG6GSazEPRJ8tjUFu
         A9W1o5HJWLsAzuSKYkzQN7RLyAzGLEw+OeY/CahEsdtnXA95fbr6onA02HQLrmuv+Cnm
         q3cA==
X-Gm-Message-State: AOAM531j97U/LvCEVmLlWSLxEibdtADeCiqbHvJ4eepO9yLqTtTjuJTT
	8BYcLFgIda/YtvcXZq0XsMrk+kc57VTBVLlh
X-Google-Smtp-Source: 
 ABdhPJyBWo4CW1sZVm8oyPF99eM2qW08UrlIAd8xYJL49rQD/p4vFkcs2daajyF5qYMZo+XKSEDhLA==
X-Received: by 2002:a17:902:7043:b0:14f:47:a455 with SMTP id
 h3-20020a170902704300b0014f0047a455mr7829111plt.44.1645799288049;
        Fri, 25 Feb 2022 06:28:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.28.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:28:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 35/50] grub: remove unneeded return value
Date: Fri, 25 Feb 2022 04:26:15 -1000
Message-Id: 
 <dd8837823a279290aec963be1a2646940719c767.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:28:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162381

From: Marta Rybczynska <rybczynska@gmail.com>

This patch removes an uneeded return value in grub's (static)
grub_video_gop_fill_mode_info(). It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...move-unnecessary-return-value-of-gru.patch | 94 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0031-video-efi_gop-Remove-unnecessary-return-value-of-gru.patch

diff --git a/meta/recipes-bsp/grub/files/0031-video-efi_gop-Remove-unnecessary-return-value-of-gru.patch b/meta/recipes-bsp/grub/files/0031-video-efi_gop-Remove-unnecessary-return-value-of-gru.patch
new file mode 100644
index 0000000000..7e4e951245
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0031-video-efi_gop-Remove-unnecessary-return-value-of-gru.patch
@@ -0,0 +1,94 @@
+From 2a1e5659763790201a342f8a897c8c9d8d91b1cc Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Tue, 8 Dec 2020 21:14:31 +0000
+Subject: [PATCH] video/efi_gop: Remove unnecessary return value of
+ grub_video_gop_fill_mode_info()
+
+The return value of grub_video_gop_fill_mode_info() is never able to be
+anything other than GRUB_ERR_NONE. So, rather than continue to return
+a value and checking it each time, it is more correct to redefine the
+function to not return anything and remove checks of its return value
+altogether.
+
+Fixes: CID 96701
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=fc5951d3b1616055ef81a019a5affc09d13344d0]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/video/efi_gop.c | 25 ++++++-------------------
+ 1 file changed, 6 insertions(+), 19 deletions(-)
+
+diff --git a/grub-core/video/efi_gop.c b/grub-core/video/efi_gop.c
+index 7f9d1c2..db2ee98 100644
+--- a/grub-core/video/efi_gop.c
++++ b/grub-core/video/efi_gop.c
+@@ -227,7 +227,7 @@ grub_video_gop_fill_real_mode_info (unsigned mode,
+   return GRUB_ERR_NONE;
+ }
+ 
+-static grub_err_t
++static void
+ grub_video_gop_fill_mode_info (unsigned mode,
+ 			       struct grub_efi_gop_mode_info *in,
+ 			       struct grub_video_mode_info *out)
+@@ -252,8 +252,6 @@ grub_video_gop_fill_mode_info (unsigned mode,
+   out->blit_format = GRUB_VIDEO_BLIT_FORMAT_BGRA_8888;
+   out->mode_type |= (GRUB_VIDEO_MODE_TYPE_DOUBLE_BUFFERED
+ 		     | GRUB_VIDEO_MODE_TYPE_UPDATING_SWAP);
+-
+-  return GRUB_ERR_NONE;
+ }
+ 
+ static int
+@@ -266,7 +264,6 @@ grub_video_gop_iterate (int (*hook) (const struct grub_video_mode_info *info, vo
+       grub_efi_uintn_t size;
+       grub_efi_status_t status;
+       struct grub_efi_gop_mode_info *info = NULL;
+-      grub_err_t err;
+       struct grub_video_mode_info mode_info;
+ 	 
+       status = efi_call_4 (gop->query_mode, gop, mode, &size, &info);
+@@ -277,12 +274,7 @@ grub_video_gop_iterate (int (*hook) (const struct grub_video_mode_info *info, vo
+ 	  continue;
+ 	}
+ 
+-      err = grub_video_gop_fill_mode_info (mode, info, &mode_info);
+-      if (err)
+-	{
+-	  grub_errno = GRUB_ERR_NONE;
+-	  continue;
+-	}
++      grub_video_gop_fill_mode_info (mode, info, &mode_info);
+       if (hook (&mode_info, hook_arg))
+ 	return 1;
+     }
+@@ -466,13 +458,8 @@ grub_video_gop_setup (unsigned int width, unsigned int height,
+ 
+   info = gop->mode->info;
+ 
+-  err = grub_video_gop_fill_mode_info (gop->mode->mode, info,
+-				       &framebuffer.mode_info);
+-  if (err)
+-    {
+-      grub_dprintf ("video", "GOP: couldn't fill mode info\n");
+-      return err;
+-    }
++  grub_video_gop_fill_mode_info (gop->mode->mode, info,
++				 &framebuffer.mode_info);
+ 
+   framebuffer.ptr = (void *) (grub_addr_t) gop->mode->fb_base;
+   framebuffer.offscreen
+@@ -486,8 +473,8 @@ grub_video_gop_setup (unsigned int width, unsigned int height,
+     {
+       grub_dprintf ("video", "GOP: couldn't allocate shadow\n");
+       grub_errno = 0;
+-      err = grub_video_gop_fill_mode_info (gop->mode->mode, info,
+-					   &framebuffer.mode_info);
++      grub_video_gop_fill_mode_info (gop->mode->mode, info,
++				     &framebuffer.mode_info);
+       buffer = framebuffer.ptr;
+     }
+     
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index d18e329b96..24a269d90d 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -77,6 +77,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0028-syslinux-Fix-memory-leak-while-parsing.patch \
            file://0029-normal-completion-Fix-leaking-of-memory-when-process.patch \
            file://0030-commands-hashsum-Fix-a-memory-leak.patch \
+           file://0031-video-efi_gop-Remove-unnecessary-return-value-of-gru.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


