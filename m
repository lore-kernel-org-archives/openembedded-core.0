Received: from ams-iport-3.cisco.com ([144.254.224.146])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1T9co9-0006ww-Fz
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 16:11:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=853; q=dns/txt; s=iport;
	t=1346939967; x=1348149567;
	h=from:to:cc:subject:date:message-id;
	bh=bflkSk5vN49oT9wMSJPPcKUYCsTdRMmoCo6jkPA60ew=;
	b=XrSZ0JLrUZyRiJyBR4xsj2WW1qXoX+99BTKWvH+j8ND5Ukjo3GmtzRvl
	2LSUKH5SyPniRigAxvLuzTzVuyM0J8MZlC1RP9QZQMkIX6lCJGmOJpxlT
	ZUTSIvsgHgezys0p3+y+If6gDSeC9UJLHf2Bk0CTRMp68if71bGA6kxZZ k=;
X-IronPort-AV: E=Sophos;i="4.80,380,1344211200"; 
   d="scan'208";a="7845000"
Received: from ams-core-1.cisco.com ([144.254.72.81])
	by ams-iport-3.cisco.com with ESMTP; 06 Sep 2012 13:59:24 +0000
Received: from Lan.cisco.com (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-1.cisco.com (8.14.5/8.14.5) with ESMTP id q86DxOMH017421;
	Thu, 6 Sep 2012 13:59:24 GMT
From: Martin Ertsaas <mertsas@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2012 15:59:24 +0200
Message-Id: <1346939964-24426-1-git-send-email-mertsas@cisco.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH] rsync: Add md5sum and sha256sum for the rsync_2.6.9
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 14:11:49 -0000

rsync_2.6.9 is the only rsync recipe in openembedded without GPLv3 license, but it lacked the
checksums for the fetcher.
---
 meta/recipes-devtools/rsync/rsync_2.6.9.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/rsync/rsync_2.6.9.bb b/meta/recipes-devtools/rsync/rsync_2.6.9.bb
index 54feada..8c8b115 100644
--- a/meta/recipes-devtools/rsync/rsync_2.6.9.bb
+++ b/meta/recipes-devtools/rsync/rsync_2.6.9.bb
@@ -10,6 +10,9 @@ SRC_URI = "http://rsync.samba.org/ftp/rsync/src/rsync-${PV}.tar.gz \
            file://rsync-2.6.9-fname-obo.patch \
            file://rsyncd.conf"
 
+SRC_URI[md5sum] = "996d8d8831dbca17910094e56dcb5942"
+SRC_URI[sha256sum] = "ca437301becd890e73300bc69a39189ff1564baa761948ff149b3dd7bde633f9"
+
 inherit autotools
 
 do_install_append() {
-- 
1.7.8.6



