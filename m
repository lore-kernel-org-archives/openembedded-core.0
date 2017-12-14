Return-Path: <tom.rini@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 89A5978879
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 03:20:33 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id i40so6360974qti.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 19:20:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HK7ZQoUKvjoUT6uOYql5pgA82rHphYmdbWLfUgJrz3w=;
	b=GMNZLkR5MSvDFlgKsZ5Yo23MkZ40FsyZgRFshWLNcA3QwSqJWLsCuvQdHdfVoaocto
	Sk7H910mT51BTcSJy0xox6dnuHbDu6Q0BRkZKEQRi0mnpFzhABnjz0K+vLjj6fbIfxzq
	D4Z1DQ7DTFUxBw8wIm/PKxSpdcIBGEniwFsk8n7u+0hTe7tW1L1Op7pu4AEjCv7inR2J
	e191kdLJ7QtYN4YKRIM3OYEOE3WCYziNU02tFFTaN0qCni6CbO0aFNlj8IMg6EtbeTTr
	iwFEcFXX/GzDc8BM0zGEmLNIFWCL04OTeh4OdrkmSyGsdrnY8MB61x5Hw7A5CfpQomRV
	/JJQ==
X-Gm-Message-State: AKGB3mIpE0bFV0UAImXV7/U2EGlCKKgQtNmIsZEtUoNtZWsFL2UiAmBA
	zz3nLb2CEZuE6TItbQrpDH2A
X-Google-Smtp-Source: ACJfBov0vUh9+lz8N7BM8f9s5NHVASaYXCkPUsGF8wmIIIRioTIqwStSuynLUfHUW2BsVlaloRPdDA==
X-Received: by 10.200.48.144 with SMTP id v16mr14599526qta.244.1513221634264; 
	Wed, 13 Dec 2017 19:20:34 -0800 (PST)
Received: from localhost.localdomain (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	s43sm2001533qta.49.2017.12.13.19.20.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Dec 2017 19:20:33 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Dec 2017 22:20:24 -0500
Message-Id: <1513221626-18805-3-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513221626-18805-1-git-send-email-trini@konsulko.com>
References: <1513221626-18805-1-git-send-email-trini@konsulko.com>
Subject: [PATCHv4 2/4] wic: partition.py: Update comments slightly
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
X-List-Received-Date: Thu, 14 Dec 2017 03:20:33 -0000

First, we support squashfs as root, so mention that.  Second, the btrfs
rootfs creation function had a copy/paste of the previous function
comment, remove the irrelevant line.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 scripts/lib/wic/partition.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 66e61ba70c93..87312383378a 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -202,7 +202,7 @@ class Partition():
         Prepare content for a rootfs partition i.e. create a partition
         and fill it from a /rootfs dir.
 
-        Currently handles ext2/3/4, btrfs and vfat.
+        Currently handles ext2/3/4, btrfs, vfat and squashfs.
         """
         p_prefix = os.environ.get("PSEUDO_PREFIX", "%s/usr" % native_sysroot)
         p_localstatedir = os.environ.get("PSEUDO_LOCALSTATEDIR",
@@ -275,8 +275,6 @@ class Partition():
                              native_sysroot, pseudo):
         """
         Prepare content for a btrfs rootfs partition.
-
-        Currently handles ext2/3/4 and btrfs.
         """
         du_cmd = "du -ks %s" % rootfs_dir
         out = exec_cmd(du_cmd)
-- 
2.7.4


