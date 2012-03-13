Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S7Fdy-00011T-20
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 01:31:14 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0ccOv004580 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:38 GMT
X-Quarantine-ID: <9LBYGCqrhi7T>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9LBYGCqrhi7T
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:38 +0000 (GMT)
Received: from ted (ted.config [192.168.1.70]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0cYIG004531
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:36 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1S7FVS-0002eL-WE
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 00:22:27 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 00:22:12 +0000
Message-Id: <b6906c8c08dff9f8b3dac0d2d637856296cb4a60.1331598077.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
References: <df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
References: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 05/17] matchbox-session: Clarify LICENSE as GPLv2
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
X-List-Received-Date: Tue, 13 Mar 2012 00:31:14 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../matchbox-session/matchbox-session_0.1.bb       |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
index df9f2ab..dc10031 100644
--- a/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
+++ b/meta/recipes-graphics/matchbox-session/matchbox-session_0.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Custom MB session files for poky"
 HOMEPAGE = "http://www.matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.openedhand.com/"
 
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://matchbox-session;endline=20;md5=180f1c169a15d059a56c30094f6fb5ea"
 
 SECTION = "x11"
@@ -11,6 +11,8 @@ RCONFLICTS = "matchbox-common"
 SRC_URI = "file://matchbox-session"
 S = "${WORKDIR}"
 
+PR = "r1"
+
 inherit update-alternatives
 
 ALTERNATIVE_NAME = "x-session-manager"
-- 
1.7.5.4



