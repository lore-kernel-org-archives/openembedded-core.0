Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1RrtA2-0003dh-IM
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 16:28:51 +0100
Received: by mail-pw0-f47.google.com with SMTP id a13so3212902pba.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 07:20:59 -0800 (PST)
Received: by 10.68.235.7 with SMTP id ui7mr17103196pbc.93.1327936859814;
	Mon, 30 Jan 2012 07:20:59 -0800 (PST)
Received: from quadra.sakoman.net
	(static-74-41-60-154.dsl1.pco.ca.frontiernet.net. [74.41.60.154])
	by mx.google.com with ESMTPS id w4sm40437462pbf.4.2012.01.30.07.20.57
	(version=SSLv3 cipher=OTHER); Mon, 30 Jan 2012 07:20:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2012 07:20:40 -0800
Message-Id: <1327936840-13937-5-git-send-email-steve@sakoman.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1327936840-13937-1-git-send-email-steve@sakoman.com>
References: <1327936840-13937-1-git-send-email-steve@sakoman.com>
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH 4/4] zypper: add missing runtime dependences on gzip and gnupg
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
X-List-Received-Date: Mon, 30 Jan 2012 15:28:51 -0000

gzip is required to uncompress repository files
gnupg is required for the support of signed repositories.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/zypper/zypper_git.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/zypper/zypper_git.bb b/meta/recipes-extended/zypper/zypper_git.bb
index e5963be..1a6b83c 100644
--- a/meta/recipes-extended/zypper/zypper_git.bb
+++ b/meta/recipes-extended/zypper/zypper_git.bb
@@ -5,7 +5,9 @@ LICENSE  = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3201406e350b39e05a82e28b5020f413"
 
 DEPENDS  = "libzypp augeas"
-PR = "r1"
+RDEPENDS = "gzip gnupg"
+
+PR = "r2"
 SRCREV = "2c5bb6ceb99ecd950ef993e43d77bf0569ea0582"
 
 inherit cmake
-- 
1.7.1



