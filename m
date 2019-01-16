Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195])
	by mail.openembedded.org (Postfix) with ESMTP id F40307C0AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:00:58 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id w186so2415023ybg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 04:01:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0BIE8D396kcCHuJpHkIjuuP2zGZT3uGlamVTWGDtj14=;
	b=RVl0qK9SXakQsk7BcgvsMZgtNlDoIxtTb5/xHCeIzGxEwExZpw5z4DScer9MaJFVvo
	3neUrwly61YVH6jZvd512CSt8Fx98LZZSbClIsE5Q3baawDf4bOjw07927Y4k7JYHjJe
	0eVWDSOTS965sVnXkl2HK2Z5BsJLim3xUmZfE7R404yNI2eLRP5rLyOu0d+cajpUDskw
	3RVrqpHFkZoq27+bxJSE/iuVyK/m+TeM1IRDcSxaPKMZ1cIZHa2KYsLS8x2G8fcD5tgP
	l5099rUA+eJpFJl/IptNYuMp2fqw9TVgJaYSWEdx/yXkxQcraaTiyRowx+vQ8Wmz3yo9
	LF4A==
X-Gm-Message-State: AJcUukdY7jKvCtMQWfRigw32OZKsoJLJ/aIvr4SuhPFiAi2Ue71Serb9
	ESSwGeyYtGvAEJhlRzaK3RmGRwmx
X-Google-Smtp-Source: ALg8bN6J2D67ChqRsfJ5k6pJphy5zd+3fmirQXrnpvZ2rWlEDHmGE8qdcPV/fTKu0Fu8diVzieMcHg==
X-Received: by 2002:a25:3294:: with SMTP id y142mr7217518yby.15.1547640059610; 
	Wed, 16 Jan 2019 04:00:59 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	o124sm2169655ywe.75.2019.01.16.04.00.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jan 2019 04:00:59 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 12:00:39 +0000
Message-Id: <20190116120051.12182-4-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190116120051.12182-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190116120051.12182-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v3 03/15] util-linux: remove minix remnants
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2019 12:00:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

While commit fc66762d7c11 ("util-linux: Disable minix support.")
(or e88cee8cc31d in poky) removed most of the bits, there are
still references to minix remaining.

Remove them.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 7bfec80508..406af58502 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -159,7 +159,7 @@ do_install () {
 	mkdir -p ${D}${base_bindir}
 
         sbinprogs="agetty ctrlaltdel cfdisk vipw vigr"
-        sbinprogs_a="pivot_root hwclock mkswap mkfs.minix fsck.minix losetup swapon swapoff fdisk fsck blkid blockdev fstrim sulogin switch_root nologin"
+        sbinprogs_a="pivot_root hwclock mkswap losetup swapon swapoff fdisk fsck blkid blockdev fstrim sulogin switch_root nologin"
         binprogs_a="dmesg getopt kill more umount mount login su mountpoint"
 
         if [ "${base_sbindir}" != "${sbindir}" ]; then
-- 
2.20.1


