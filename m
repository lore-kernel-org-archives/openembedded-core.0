Return-Path: <tom.rini@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9A9307867E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 17:58:37 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id q13so855698uaq.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Dec 2017 09:58:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HK7ZQoUKvjoUT6uOYql5pgA82rHphYmdbWLfUgJrz3w=;
	b=MScVAc8sWeZfBbmrPyutQj/h34+v3LqwF3WkXVoiHXw6Q1hw+COb7rxnz8SLzSC3xB
	QByX+MGj0CStv9jFjTTrSx+MagMlWxfnrLhYU15iV83XVfbQK6VBETf8c56B7Uma/ion
	ZnQRtB3d+ArxCA6vf2uESxJfCoE07OOWrnYJAvb77vls3CfpDjIb2M9XSaXf8yeyqnXn
	DrBYF4D+71mbjtvz+np5KSh8yQnGYTXetoETaLDrnlMVMcN3Wn6qbTKFGpiuwy37Y2mg
	FsZWodDsgScky8MoDYoIwUv8ml7/6FZLZBv2HDMBy8QldbU9HnfzR0LrQGxC7mIGMl+/
	bu7A==
X-Gm-Message-State: AKGB3mLC+K8nb1iG8tUP8zH8viU/BsapQUtnDKIZGYNH3oVL5NCKGa+h
	1NLp4CsUjFg4wT5FFDOsxDUa
X-Google-Smtp-Source: AGs4zMbvWJxnqdXmlDpEi+2yTkBPxI3Ma0xRUpqBpjN2R+fju/2msBmYz3bPGlHo5wTiWXpRN2Y0DA==
X-Received: by 10.176.28.66 with SMTP id o2mr5738710uaj.89.1512496718543;
	Tue, 05 Dec 2017 09:58:38 -0800 (PST)
Received: from localhost.localdomain (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68])
	by smtp.gmail.com with ESMTPSA id 131sm305558vke.53.2017.12.05.09.58.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Dec 2017 09:58:37 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 12:58:28 -0500
Message-Id: <1512496710-10548-3-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512496710-10548-1-git-send-email-trini@konsulko.com>
References: <1512496710-10548-1-git-send-email-trini@konsulko.com>
Subject: [PATCHv3 2/4] wic: partition.py: Update comments slightly
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
X-List-Received-Date: Tue, 05 Dec 2017 17:58:37 -0000

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


