Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SPFgH-000133-E7
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 18:12:02 +0200
Received: by obhx4 with SMTP id x4so5080139obh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 09:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8KxqnkS47nw2JhY8sZ8lzl+aLcwHDQl6D03E4Q3ny2U=;
	b=In5ydFDaKeClcUhJmJr0myCW84QO1D2ROznHr0uXfWBbww30WJcx+siA7wT/2Veu1b
	ImthRrahstD3pWJnCYGVLckCZGV9PBJdK30cAUVr/Ez/gGylBQ5AaFcYRfbIATmtHW4a
	cLkmGBln1P5rT+utgyusokeuCvsV+rvgoM94vHCFLG3m3WLGLOC/c7pRz9vwzVGuG09j
	qBTPn7wt50VSEzmdGSadtCcTvfNnwlcVsM6zfgaf6jHuVqmXIqm8wcfHvdLzDMgT5oxR
	y9ZbuYKWFB9TAZYtQwIOw2/ThX841EEHU8ka2L0ESma6mDlxjw8Xw9fQNSBhpDr/c/h5
	19+w==
Received: by 10.182.40.71 with SMTP id v7mr14204898obk.5.1335888135328;
	Tue, 01 May 2012 09:02:15 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id h2sm20758865obn.20.2012.05.01.09.02.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 09:02:14 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 May 2012 11:02:42 -0500
Message-Id: <7a227f07a0a5e7bd072d29840ba869b84951b136.1335888041.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1335888041.git.kergoth@gmail.com>
References: <cover.1335888041.git.kergoth@gmail.com>
In-Reply-To: <cover.1335888041.git.kergoth@gmail.com>
References: <cover.1335888041.git.kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/6] libpcap: use PACKAGECONFIG for bluetooth distro feature
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
X-List-Received-Date: Tue, 01 May 2012 16:12:02 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-connectivity/libpcap/libpcap.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
index 6051bbc..427078f 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap.inc
@@ -10,7 +10,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867 \
                     file://pcap.h;beginline=1;endline=34;md5=8d6cf7e17d5745010d633e30bc529ea9"
 DEPENDS = "flex-native bison-native"
 
-INC_PR = "r0"
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
+PACKAGECONFIG[bluetooth] = "--enable-bluetooth,--disable-bluetooth,bluez4"
+
+INC_PR = "r1"
 
 SRC_URI = "http://www.tcpdump.org/release/libpcap-${PV}.tar.gz"
 
-- 
1.7.7



