Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SnuFg-0001Uh-OZ
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jul 2012 18:22:28 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so16967057pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2012 09:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=vyTh8Myky4yLEFHDVMUvAeBnCwtkFHFFEh6OL09h2wc=;
	b=JfYDJW6mHky5Uvs4ImfMBXmx2O1Gm/+MS6gJQjasIoeK2rlDe3gPL62eS0vpXomv8B
	JYns3wCJy++fD6yr0Kyisdy0Y23eP0qILxyQoxVfahnYXDVyYoDdoVRe0ft2Bl6/j2JL
	FNTcUWrNuIoJOiGMNkuC8fpLyIBoXaGVs5oHp+VfUiwLV3X2YX2+FLLURjZOgeuKg8cX
	XAC3XfcbdrYUP9ntpgq4wYO+RxZyH9uaid7vibplKtfbNSyrcg6ZqWEdEfsDFWC2kJ6I
	udgiTqZwYm1p12xKR4hqRgvEL85Z/CxeaPUiKAqEKgoxVlvsUuBNUG81ScbkcqXWx+Uc
	G2Ng==
Received: by 10.68.192.73 with SMTP id he9mr22520036pbc.17.1341763882376;
	Sun, 08 Jul 2012 09:11:22 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qp9sm25927714pbc.9.2012.07.08.09.11.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 Jul 2012 09:11:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Jul 2012 09:10:29 -0700
Message-Id: <7976d15f539f8919ff4979a3f5d9eec45b305d01.1341763346.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
References: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
In-Reply-To: <cover.1341763345.git.raj.khem@gmail.com>
References: <cover.1341763345.git.raj.khem@gmail.com>
Subject: [PATCH 11/19] puzzles: Fix checksums
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
X-List-Received-Date: Sun, 08 Jul 2012 16:22:29 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/puzzles/puzzles_r9561.bb |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_r9561.bb b/meta/recipes-sato/puzzles/puzzles_r9561.bb
index 83fabdf..b5a47fd 100644
--- a/meta/recipes-sato/puzzles/puzzles_r9561.bb
+++ b/meta/recipes-sato/puzzles/puzzles_r9561.bb
@@ -9,13 +9,12 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=453de74d749439762ef4814f7bee1fec"
 
 # Upstream updates puzzles.tar.gz for the new release, so checksums seem to be changing regularly right now
-#SRC_URI = "svn://ixion.tartarus.org/main;module=puzzles;rev=${MOD_PV}"
-SRC_URI = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/puzzles-${PV}.tar.gz"
-SRC_URI[md5sum] = "c86695aebfc95efe1d6241863849101b"
-SRC_URI[sha256sum] = "2c20a45189387e3de8804a58bdb4e47ac4bb0f890001a509dfbdc015b5a84b95"
+SRC_URI = "svn://svn.tartarus.org/sgt;module=puzzles;rev=${MOD_PV}"
+#SRC_URI = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/puzzles-${PV}.tar.gz"
+SRC_URI[md5sum] = "d45c4ce0530d62d59d819a91b1b1e055"
+SRC_URI[sha256sum] = "87b54f2990fb6bee4981e22851f86361fb7e0b0d2010e22eeb387b6564d0bc11"
 
-
-S = "${WORKDIR}/${BPN}-${PV}"
+S = "${WORKDIR}/${BPN}"
 
 do_configure () {
 	./mkfiles.pl
-- 
1.7.9.5



