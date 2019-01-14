Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0EA117BFB5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 12:56:42 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id w186so7670389ybg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 04:56:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AbV/HTO9gqTBIRbllioJm+35HHHDnd3gc6jf1XxhA8I=;
	b=fSY29e4Lz2WWJDPvBdTaEASTdLTzAMiZ+z/cPF1nHWB1Kbd4GgdqmkSXw4M1qIk8Jm
	kxFsDDRhDXSmAHFdMfa4hOQz4Lzb7yvelzmlmEibTeyWyDHUCLhIgsR1GO7jbFCLfGCs
	0UBBZTyWpCVow4f+DO47CuclrZ0t1T7fyCseYfur9O5mm6dwIJTPn9fjfh477583kvJH
	64c5t1aiD7e0NcF+g+mXTOGlUvXE36YPtSnMjnf1Z1Ic2vVnR28IXZIUCnxk6NekOOcX
	FeMilx+FiKK+IQdeMiE4L/dA8YQ39FEA3dnaCibiviPHzfT4+xKnjcXlg3x6R5GoYr6a
	cRVQ==
X-Gm-Message-State: AJcUukeOYkfmtXXoDf9qJ43QxiI1oNdliVbr5vx42VVOi5Zmd9OGSG46
	w6mNlOVYmBKFjh2uMmxEb6a6uaj9
X-Google-Smtp-Source: ALg8bN48PgQcs3ykAyXdCdZa/3idX5QLitUYZ4JzhUo805ACVNiU3t5eoDl9hcU2v847qFThh5JHSw==
X-Received: by 2002:a25:1e54:: with SMTP id e81mr24013628ybe.322.1547470603984;
	Mon, 14 Jan 2019 04:56:43 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	h145sm115143ywc.72.2019.01.14.04.56.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 04:56:43 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 12:56:23 +0000
Message-Id: <20190114125632.4780-4-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190114125632.4780-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 03/12] util-linux: remove minix remnants
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
X-List-Received-Date: Mon, 14 Jan 2019 12:56:43 -0000
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


