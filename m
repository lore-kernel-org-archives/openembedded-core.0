Return-Path: <tom.rini@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 121E278798
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 16:08:28 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id 8so7289474qtv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 08:08:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HK7ZQoUKvjoUT6uOYql5pgA82rHphYmdbWLfUgJrz3w=;
	b=E01QIkuU/E5+WX4qRFmI3gxxB63enKS9r79Tb6xKDKEPaAdtnTNbnVOwsfk5w3qrpc
	vr6AfbRUsrfyjIw30hxf1tIJKD2jf+q1/gZDzrHyhmSYwQb6T/C/8RHv4nE3kSSv5RDr
	LN0dcPc2lZYGeoC/jXYcUfFVmlpjZ26aA1eFF5f3otw3KSSs0PwapXdjWwXJCo1fXxCx
	3/LXQ7bjTwJEUsCo2R01zAJ0sTshHo6cWb2yQbeKYNaz7pWP4bRLaHTbUKASXivbDbcb
	TP45y4ywC0d5RITNkhkntRnndl636fOhRrg4GJgtRojY9x0ZEWahBnX6eUF5DDHpGD9r
	QqSw==
X-Gm-Message-State: AJaThX6s0Zul8wN36YMlU4lNUfirhg5D6vApJEDEVihKoNgjmTrO66zR
	koKrg145e1OTfOIpetDoxfBp
X-Google-Smtp-Source: AGs4zMZ/OXIPUCilfSYKYxHSGzvT6dpk3j2LZnv5+ZOGSM/3HxHRyQk0V7ngJZ1vMXcyXnRSXdnZmA==
X-Received: by 10.55.149.65 with SMTP id x62mr9181012qkd.48.1510934909206;
	Fri, 17 Nov 2017 08:08:29 -0800 (PST)
Received: from opus.ec.rr.com (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	q37sm2714304qtj.66.2017.11.17.08.08.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Nov 2017 08:08:28 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Nov 2017 11:08:18 -0500
Message-Id: <1510934900-22044-3-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510934900-22044-1-git-send-email-trini@konsulko.com>
References: <1510934900-22044-1-git-send-email-trini@konsulko.com>
Subject: [PATCHv2 2/4] wic: partition.py: Update comments slightly
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
X-List-Received-Date: Fri, 17 Nov 2017 16:08:28 -0000

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


