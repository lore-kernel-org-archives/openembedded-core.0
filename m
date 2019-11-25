Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 169087FC14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 10:08:16 +0000 (UTC)
IronPort-SDR: Rz/uiGhBsVHD1pKW8fJCyu7IcFowCjQ25uZ+mIQa4CXEnV5gW3wEYPOEvQKR3gCjqqVn9sPwv8
	xnSime++odXTMY08GPAq+RZYdpRzWVmmlWRQdYxSlmLHHnkcaHT1MAzlGbiVwy43mhvcYIHr3g
	IwC6duOj8ORnfAi6WQUgOZ9NYaCiV5Qqn+HaKSLrYCPE0SPESmcgLccdO6uYdJijB+NEy0a7jj
	VwGUsRwibNeutXzBQrFtEqSY5fmGJ2JyXNX/xXc6U7N1DUmrnGyPbW4DUZgasWajdcCD8t2mAk
	fCQ=
X-IronPort-AV: E=Sophos;i="5.69,241,1571695200"; 
   d="scan'208";a="2785845"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2019 11:08:12 +0100
Message-Id: <20191125100813.24338-3-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191125100813.24338-1-pkj@axis.com>
References: <20191125100813.24338-1-pkj@axis.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] opkg: Trim the text part used for the license file checksum
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
X-List-Received-Date: Mon, 25 Nov 2019 10:08:17 -0000
Content-Transfer-Encoding: 8bit

This avoids including irrelevant information when calculating the
license checksum.

License-Update: Trim the text part used for the license file checksum
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/opkg/opkg_0.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.4.1.bb b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
index f0ae8b36bd..00ae9c74c2 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://code.google.com/p/opkg/"
 BUGTRACKER = "http://code.google.com/p/opkg/issues/list"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/opkg.c;beginline=2;endline=21;md5=90435a519c6ea69ef22e4a88bcc52fa0"
+                    file://src/opkg.c;beginline=4;endline=18;md5=9f5a1ad5395378a807d6d591e2f92d25"
 
 DEPENDS = "libarchive"
 
-- 
2.21.0


