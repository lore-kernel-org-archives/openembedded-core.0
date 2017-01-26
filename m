Return-Path: <liu.ming50@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id C2D3B71DEC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 12:07:11 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id w144so17993483oiw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 04:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8p3Se2STsu44rIWggs8ewFN+v5Pn5GQwdi+C9RZHphE=;
	b=CaqYAnx63GjEsPpSVwGCe76pjOAEhqai277vzhgjHSIOFS/ZVpdcdbHRIAJwR+Knc7
	5+kgPvJk3g6YFNc2/IsI17s5PBQbXv8pMHEBRvpSG/bEa1Jiqm9xjriLmKrXABUGWiQb
	pGAhWXAS9O9kaf4wU73d2FBCb7wQ6imaImd71UzmhYiyt1auEkRogaEXOvDp5BEfs8+u
	7vcr9tbbNFhjqNG5zfs1GXP2qT8UIpZpX4Rw658MUtgaFc39u/2bHXpkyrz/1qGx5krL
	pIubhuyx4OFJFxmYR9PYKkh7kWugXZy9JLvTdPo7vvDkqtLuymdkPBpO16d7opQ1Jfaj
	2LoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8p3Se2STsu44rIWggs8ewFN+v5Pn5GQwdi+C9RZHphE=;
	b=meOV50XOH9PhflU6HTISP1qQdQjaspSAAhAnJIiibxeUQsdlPJMLnrxcT/wQ6Y3hII
	csZLt7GSEYCx/CLeMkaaJJtuskuR5uBSdPQhJekQ6GhfXsrLT996E7hN7VC8lJA49FVR
	Xnl1zQPkVZIevcFcB+ijvc2Z2BKpwRXABau0IKISOxsu9U5/g/t7bRGizx0/vcJOae3L
	27VSqegh8fq8w9jE9+Czu1WfJOlRDFbvnEp/aZcDXpNGe2zXLx0xuD3wQeWRHGGqFsZ6
	JARUyh1SO6vxheCnqiAv6AHoZYUvKOF9kD68PuFZ1xPIy3MhCOnnUocNzBat2N0M+KKx
	M8sg==
X-Gm-Message-State: AIkVDXKYlA8RgAUfSpng7h52mUo0xS9UJfibFabcJfecjBtXCEoCC2pQhzA3d1UNG6gUsA==
X-Received: by 10.36.68.130 with SMTP id o124mr27555298ita.62.1485432431822;
	Thu, 26 Jan 2017 04:07:11 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.224.150]) by smtp.gmail.com with ESMTPSA id
	m77sm1311160ioi.19.2017.01.26.04.07.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Jan 2017 04:07:11 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 13:06:57 +0100
Message-Id: <1485432417-10737-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] rootfs-postcommands.bbclass: drop insert_feed_uris function
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
X-List-Received-Date: Thu, 26 Jan 2017 12:07:12 -0000

From: Ming Liu <liu.ming50@gmail.com>

The source makes no reference to insert_feed_uris any more, simply drop
the unused reference, to avoid confusing the developers.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/rootfs-postcommands.bbclass | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index c8f18c6..1acda29 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -220,24 +220,6 @@ make_zimage_symlink_relative () {
 	fi
 }
 
-insert_feed_uris () {
-	
-	echo "Building feeds for [${DISTRO}].."
-
-	for line in ${FEED_URIS}
-	do
-		# strip leading and trailing spaces/tabs, then split into name and uri
-		line_clean="`echo "$line"|sed 's/^[ \t]*//;s/[ \t]*$//'`"
-		feed_name="`echo "$line_clean" | sed -n 's/\(.*\)##\(.*\)/\1/p'`"
-		feed_uri="`echo "$line_clean" | sed -n 's/\(.*\)##\(.*\)/\2/p'`"
-		
-		echo "Added $feed_name feed with URL $feed_uri"
-		
-		# insert new feed-sources
-		echo "src/gz $feed_name $feed_uri" >> ${IMAGE_ROOTFS}/etc/opkg/${feed_name}-feed.conf
-	done
-}
-
 python write_image_manifest () {
     from oe.rootfs import image_list_installed_packages
     from oe.utils import format_pkg_list
-- 
1.9.1


