Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
	[209.85.219.194])
	by mail.openembedded.org (Postfix) with ESMTP id D27437C1AB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:51:30 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id y7so2430447ybg.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 04:51:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0BIE8D396kcCHuJpHkIjuuP2zGZT3uGlamVTWGDtj14=;
	b=Cv5AutdRFz7o0bgTSENuuUYzGExVO2GHlO0RkTjxORDdjtAotp9KnStMsxBlAWqgkk
	7KwfNxy793OBlPbh+i9C/2sjxUJYu8LhFJdvyIZu04nz3xIYAJH1Ll1bakGtlXkg07Xr
	E45bdGzGTvlt+uoF5V319kT0VLly3RyVxhKYTty++6U5cjS28yqtoCnRCU+mIhJYM0KA
	FHuundCZgE+ysdD4Sg4Mff+CDoOmpRIOw+lAf0mewke4uHH3C+ONFKM12aDoIpuiQLLk
	MaK86TgY1FT1ITJw39v6qze9Tr9o/r5/sPcpwaLdP+i9QooCtqwm/Rg47Ub8Aj3M3cq4
	aRwg==
X-Gm-Message-State: AJcUukf99+V+SDOwOPlBd3HBy9KFVlkj+qkgGfXSR2AAj/sfZ4T5KbSI
	68w9vIiKGa7KsYL+AQwVF+Qo9BkM
X-Google-Smtp-Source: ALg8bN5aSSD6JTuhg5F52r/2BxjWey8v3PTTqDgrdIocpnS/8CEsLGZPluAQUP9+44fwjbocZ0a6Yg==
X-Received: by 2002:a25:8751:: with SMTP id e17mr7268492ybn.241.1547643091853; 
	Wed, 16 Jan 2019 04:51:31 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id y63sm6194558ywy.1.2019.01.16.04.51.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jan 2019 04:51:31 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 12:51:12 +0000
Message-Id: <20190116125124.20177-4-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190116125124.20177-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190116125124.20177-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v4 03/15] util-linux: remove minix remnants
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
X-List-Received-Date: Wed, 16 Jan 2019 12:51:31 -0000
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


