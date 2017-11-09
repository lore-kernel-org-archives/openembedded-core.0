Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 09801784E3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:53:42 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id u142so4038381ywg.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 17:53:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HK7ZQoUKvjoUT6uOYql5pgA82rHphYmdbWLfUgJrz3w=;
	b=JsH5s1DxVioXn9pXkwy4bzWn9+JwzTcxyf5z6I9GZNzuwzjlKmC8R5GWbHNWKcZx3B
	8j7Lr/Sh2+0W3pjiAm2SUKkLM3gNaTihvg7YIZoLZIJBF1obE51Z+opQ1D3n9cVdolCu
	SuI3QHj97oEGDJh/0yTmPPs5ASpQB7Ihyc76PFOFmZmykZYwzKDIFqk+oBMoMiGIw6Oy
	qPOMPEiWVSx0zP6tD17uOh/tIccKO0LYcTLmJDkIOi3reyta41Mynh4a9cUBaA6wpXp1
	n6Kkb1XhDhuUNsvpAi6+t1mvySpC77d6VZv/M9B14L++xhnrz+cozlmqRZrhBJ7h4U6T
	STYA==
X-Gm-Message-State: AJaThX6pCHDlKLWDAyM6XeulgjumRQDvmPKOQZ++NiW9TABac3VY8lrc
	6KxUud90tSLIfS63pb4Ruy85
X-Google-Smtp-Source: ABhQp+RpBjVZXaRe3s70mwsTdRko20gb01WfZ+0Dl6GMw0XRo4zWaRRQds8bS8+OM8yZutbEH0eoMg==
X-Received: by 10.129.161.77 with SMTP id y74mr436943ywg.166.1510192423888;
	Wed, 08 Nov 2017 17:53:43 -0800 (PST)
Received: from opus.ec.rr.com (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	h26sm2850736ywk.67.2017.11.08.17.53.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Nov 2017 17:53:43 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Nov 2017 20:53:31 -0500
Message-Id: <1510192412-5065-3-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510192412-5065-1-git-send-email-trini@konsulko.com>
References: <1510192412-5065-1-git-send-email-trini@konsulko.com>
Subject: [PATCH 2/3] wic: partition.py: Update comments slightly
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
X-List-Received-Date: Thu, 09 Nov 2017 01:53:43 -0000

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


