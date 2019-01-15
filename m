Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id 017547C0C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 14:45:33 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id a190so1139386ybg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 06:45:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AbV/HTO9gqTBIRbllioJm+35HHHDnd3gc6jf1XxhA8I=;
	b=jmO+OIzfe2IvSGt628p4fnIlikvgyvlmXyPSHdePedmb1O4hSWptW9P24Cbe4WfAiY
	zFNqzf2rWar8eYtkr20RK7ApOoGW7SMc3O7PLFWtQCX3RvE3xxG3Y+Yy5y7wE8/boQ9F
	YHJ4/Go1SGA3P4WvTTDvijIRe7ycZLU1maORmEW9tBq+Y7SjPOJtuNXQAZKDFhNif64N
	F3JYcA/iVhNm+tEDpTKjb6CXUajBh5Gku4YRt54H7zO1D9id7UK0LFEZ6URpqyJjXVz5
	vs5Jf7heMGtPeOUZC5wvLYzyYkny4pUyKz7UJIDb+Q36VG97HCesIgkqot0MHOPPsrtD
	c7nw==
X-Gm-Message-State: AJcUukdKsCOjUTHcnbwZ1rE03FnU3CZR5mG0RtIpQB9wA5vZcpwV5X3V
	EgrQb4o/AOhZt3fs3zsxi5rO+wN5
X-Google-Smtp-Source: ALg8bN51DunSFfreeqDqq8PescVwSIm84q9x04ViFIvTZyEOvrhf1bdXnZJGeKYiZH0a6C0M7Dojlg==
X-Received: by 2002:a25:818c:: with SMTP id p12mr3486213ybk.394.1547563534008; 
	Tue, 15 Jan 2019 06:45:34 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i13sm1261220ywe.53.2019.01.15.06.45.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 06:45:33 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 14:45:13 +0000
Message-Id: <20190115144525.29388-4-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115144525.29388-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190115144525.29388-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 03/15] util-linux: remove minix remnants
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
X-List-Received-Date: Tue, 15 Jan 2019 14:45:34 -0000
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
index a1702da5b4..8c8cbde8c2 100644
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


