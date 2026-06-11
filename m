Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C009FCD98CE
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 15:56:06 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49276.1781193360228093622
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 08:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=abjBd2m6;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4859b1fc7a8so62068b6e.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 08:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781193359; x=1781798159; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/uhqF1LxrLpUXqg620+4RlUm60eiz/PgFr4U26Lc5Mo=;
        b=abjBd2m6sC/yTPjScfBqy9mEDjDeWkT0Z5+GQmDcbHCugDkvoqKUMrKpL4daZo0vWX
         6R1cA8xUdL+9grlB8IjO3u2Q6Q7O4DFLk/JHi2hNbtYgr2gI63yCzMnyOSR1IU7+z+uN
         ntnsBxF2SxF6KbiEnYM/vTEE7md9+djB5v5fMlHnqMKfqKAmaNF26cHIhBioFjt6SUxf
         VdcxybOwW6//a2n6BsewFu31PC01q4EKwEHO2AUm8yr7PWVF63HNKNABS/Br5yMkIBn9
         HV6akMeTQ9pUhLuJrgzZTtUAmN2XyhsgzHbX2qVZ3Pp9+lm90IhoPhPVfbAochshPHC7
         KOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781193359; x=1781798159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uhqF1LxrLpUXqg620+4RlUm60eiz/PgFr4U26Lc5Mo=;
        b=mLse8YW6dCKLE64Ph60G7GPpA4c+Ah25+crrag48J+qbvegtNL5qw1xECxpL5wn9Qo
         ybREaha3MQPFaABrIwIWIQctac8rCc/afmrhxRLFdGH5JjVSdI2x7M49vAiIpEFEPTv1
         EFQvN3eqTU41/TUKU2jDSu1L3o4UgF8t5xwTqo86r21dSieyz72VtjOvKrI4APn7lGgj
         /PaxAgSE27SYv2c+Aph+O3o4x1nSPMBJ4pCwMYf93M+/+ieBWPOpTVNKWbiAUvVW4GXu
         NGRnqhexBvDThMEvuk9Su7jRxvlJzPdL2IEftNJDEVS1J+va/2EjicwuE1ZyMD1uwvZy
         gwKA==
X-Gm-Message-State: AOJu0YxXJcvQytiUY95fw7iMwKunnCdEJWlAn8XJnCA6dwAJA7I3XnZB
	cdIdU60wFR7icE/XQdrfTq/TaAg5qHV7+B3X3VKnQ6l9TiUAiIghh8qVfbxkhQ==
X-Gm-Gg: Acq92OGYY9CUxGbrk2fcnY4qBuWSq8n6X90ppLmLj/5lDGo3RrEPNoGjtUZB0iX6rkx
	RMdhMF3P1O+amGGV65JC8LItnjtLbfcC/FCEXyVrod/powwWzYXiUgce15HB4kqwhVCPX+7zE8/
	E1O8YJ5+/DhmvO6dvTDk7j6DdUTn5tKtxmqo/otCLwS4wflXudQQfgz0ZA7fgGavWR0pB5+IFgm
	YosyQJuHd/JkPhcMeKXp4/XQzhwvABWSGAAN98aMjlYNMYZLfT/dVunlN/NGDfoI0yew0aS69dp
	lGpNe1xw7PE0P0K0pqhNE1nEMPygOd8BsBz7jXZ+IBJIlkrWKc4w7f4tQExawtYYa5FaiYSIj7C
	0WSDQeZBsms8N+c2795fgpfLHomiNJygR8IsEnPPAlIVbJNcXEm/hSxl2jpTLdJDqI/AVFjYnum
	IsePEnbNRlL6MtxtrnrXUPbRV6IbYmk3M=
X-Received: by 2002:a05:6808:6554:10b0:486:84be:660d with SMTP id 5614622812f47-48719eeafc3mr1631666b6e.1.1781193359298;
        Thu, 11 Jun 2026 08:55:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::f0c3])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4424466fe65sm1288548fac.6.2026.06.11.08.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 08:55:58 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] ffmpeg, x264: Add comment about circular dependency
Date: Thu, 11 Jun 2026 09:55:55 -0600
Message-ID: <20260611155555.3477911-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 15:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238445

There is a circular dependency on x264 and ffmpeg that can be triggered
if both enable the PACKAGECONFIG for the other. We don't have a way to
solve this yet, but add a comment to indicate that this is the case so
that users are not surprised when it occurs.

[YOCTO #16312]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.1.bb | 2 ++
 meta/recipes-multimedia/x264/x264_git.bb       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.1.bb
index bfa35882ea..0aa8c6e8e1 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.1.1.bb
@@ -76,6 +76,8 @@ PACKAGECONFIG[v4l2] = "--enable-libv4l2,--disable-libv4l2,v4l-utils"
 PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
 PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
 PACKAGECONFIG[vpx] = "--enable-libvpx,--disable-libvpx,libvpx"
+# Note: There is a circular dependency between ffmpeg and x264 that can be
+# triggered if both have PACKAGECONFIG enabled that depends on the other
 PACKAGECONFIG[x264] = "--enable-libx264,--disable-libx264,x264"
 PACKAGECONFIG[x265] = "--enable-libx265,--disable-libx265,x265"
 PACKAGECONFIG[xcb] = "--enable-libxcb,--disable-libxcb,libxcb"
diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index b3d1cfd695..f0278cae64 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -29,6 +29,8 @@ PACKAGECONFIG ?= " \
     ffmpeg \
     ${@bb.utils.filter("DISTRO_FEATURES", "opencl", d)} \
 "
+# Note: There is a circular dependency between ffmpeg and x264 that can be
+# triggered if both have PACKAGECONFIG enabled that depends on the other
 PACKAGECONFIG[ffmpeg] = "--enable-lavf --enable-swscale,--disable-lavf --disable-swscale,ffmpeg"
 PACKAGECONFIG[opencl] = "--enable-opencl,--disable-opencl,"
 
-- 
2.54.0


