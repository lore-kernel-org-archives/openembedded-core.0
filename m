Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3A8CCA473
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:38:35 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.64418.1656877115259480522
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=OKvkDpri;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id fz10so1274423pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7+wL1YS650i1q3tYzZCzsd0XKhmwweqV0CvlMWpytL0=;
        b=OKvkDpriuyO8oxPuTwqaGnrDO7bGU20fLwfrKHDAp9ZiC9L0m27C2M9X9t50LiqyC4
         s7G7AjpYOQH7sScXOAcufBPhJtk2IfPZKiDsTE2jUzCsyn7BUVwHLPXSC1fAxvyVmgMV
         TINPHZZW5PCMD33PwSDEN52WVJ3zJfKUNDt42Tmqtu9sIU0ss8bw3l5pVRkD6raO9WrZ
         lHvaZvwfOabho9XojpMKXCRFySOURkhO13me5zUqjrdheW5knmFoQoy9KVXCRG53juDy
         wIPPjH8LHPUNncdtYNiTt9vE0QJ3iDg8Cry0nzF3p6HpgWo2+GmPitqSUIVpPk/DFnap
         Bl7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7+wL1YS650i1q3tYzZCzsd0XKhmwweqV0CvlMWpytL0=;
        b=Wguo485sRcTqN2NUWMeor1ewuMr2bgYPjcva4z+9YN07l3N0pxKjB73v1xWRZEp7B5
         c8wXdyZJlXWPQo40A4jfz7mLVR6kbHI2aYANmcTWdrIFT1xtO4FtWgbsL1743irRQpdI
         DqD0SY72LAO1l2Zi10gdMFsvxYRDfGtT1T9LTDmVpGkmtqmmUX/DYRLTWZswdLHDGXaT
         amXCFbeLZuRLedWcQ3T18wnQc8UOfpcAmlNFH0YtYmBUt3Acp1b7xCnPb8EtqVs+5PuW
         dpQHrWqTXu0/MeBfOAzBsCgshbdX8xvAA/yLL/rfvzOMdjErDX6xR+ijs3zTNcS5iVqn
         zA6w==
X-Gm-Message-State: AJIora9t0crZEvbam/i9bfPPsNOO9+628fMgsVEMqjEMiAGF9Z2Vz1oN
	M9KqZDUOudqHMmLP6jYpTEgVxJn6eHT++IE3
X-Google-Smtp-Source: 
 AGRyM1u17Xs3pV09Cki0D6AT7HL+OetuPAyYPyy35xW9oqcLIXvTExck0lMkxalTceQa9FAEKPwt7g==
X-Received: by 2002:a17:902:f68a:b0:16b:a762:9735 with SMTP id
 l10-20020a170902f68a00b0016ba7629735mr22562637plg.23.1656877114259;
        Sun, 03 Jul 2022 12:38:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.38.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:38:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/30] packagegroup-core-ssh-dropbear: Add
 openssh-sftp-server recommendation
Date: Sun,  3 Jul 2022 09:36:02 -1000
Message-Id: 
 <e2dfd3b72845bd645b077f34a1da05ef94f6825e.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:38:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167587

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Seems sad to have to do this but openssh is moving to use sftp instead
of scp to move files. This means scp from Fedora 36 will no longer be
able to move files to/from a dropbear based image. This breaks a number
of our key QA tests and I suspect will cause users pain too.

The sftp server from openssh is small (200kb uncompressed) and standalone
so adding it to the packagegroup seems to be the best way to preserve user
sanity. If people really don't want it, they can just use dropbear instead
of the packageground.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a98188e83b2c027d99cc38e3367e1ec2a98efbb0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
index 4f844ad925..d06c6a5609 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
@@ -4,3 +4,4 @@ PR = "r1"
 inherit packagegroup
 
 RDEPENDS:${PN} = "dropbear"
+RRECOMMENDS:${PN} = "openssh-sftp-server"
-- 
2.25.1


