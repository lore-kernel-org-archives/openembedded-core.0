Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RtT9K-0005zw-3w
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Feb 2012 01:06:38 +0100
Received: by eekd41 with SMTP id d41so1148962eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 15:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=pcbUkxkYsCQLERPtFIuLWSXbD0SEV53GX8OqYBc1fhU=;
	b=gdILAbIPMAnM9sbhcwdEeTRIKwE632oNNcJ4n0zPVlyQTDdRbKhR54DH2h0gnSyO0I
	GIPRRj5V28ZsLgryv0EUu1/NbFEQDxig6eJGlj6BARr+Iabj6IOKWzli5kMxDiOKc37B
	P2Jnl9RbL9IJddKBc89OkRDxg/MZMvQKEbFoI=
Received: by 10.14.52.15 with SMTP id d15mr2819596eec.105.1328313520146;
	Fri, 03 Feb 2012 15:58:40 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id n56sm27755860eeh.6.2012.02.03.15.58.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 15:58:38 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Feb 2012 00:56:31 +0100
Message-Id: <1328313391-9282-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH v2] busybox: Add flock utility to default configuration.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Feb 2012 00:06:38 -0000

Flock is required by pm-utils package to function properly
(/usr/lib/pm-utils/functions). It's shipped in both busybox and
util-linux. Both versions work fine with pm-utils. Enabling it
in busybox seems like simplest solution for the problem.

On armv5t this adds 2905b to busybox binary size:
-rwxr-xr-x 1 tworaz tworaz 2325856 Feb  4 00:43 busybox.flock
-rwxr-xr-x 1 tworaz tworaz 2322951 Feb  4 00:46 busybox.no-flock

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 meta/recipes-core/busybox/busybox-1.19.3/defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-1.19.3/defconfig b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
index b474ad4..fa9c078 100644
--- a/meta/recipes-core/busybox/busybox-1.19.3/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
@@ -540,7 +540,7 @@ CONFIG_FEATURE_FDISK_WRITABLE=y
 # CONFIG_FEATURE_GPT_LABEL is not set
 # CONFIG_FEATURE_FDISK_ADVANCED is not set
 # CONFIG_FINDFS is not set
-# CONFIG_FLOCK is not set
+CONFIG_FLOCK=y
 # CONFIG_FREERAMDISK is not set
 CONFIG_FSCK_MINIX=y
 # CONFIG_MKFS_EXT2 is not set
-- 
1.7.3.4



