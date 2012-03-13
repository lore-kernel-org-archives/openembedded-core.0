Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S7Fdy-00011V-3G
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 01:31:14 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0cdeY004588 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:39 GMT
X-Quarantine-ID: <25uUWwAtWkx0>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 25uUWwAtWkx0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:38 +0000 (GMT)
Received: from ted (ted.config [192.168.1.70]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q2D0cZ8S004535
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 00:38:36 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1S7FVT-0002eQ-9q
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 00:22:27 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 00:22:14 +0000
Message-Id: <25109aa2a4c2814ad89b4b416b4de31d14b65e93.1331598077.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
References: <df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
References: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 07/17] gtk-doc: Clarify license as GPLv2
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

The .m4 file has no details but the upstream project is clearly GPLv2
so update the LICENSE file to match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/gtk-doc/gtk-doc.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc.bb b/meta/recipes-gnome/gtk-doc/gtk-doc.bb
index 765304e..3147d4a 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc.bb
@@ -4,7 +4,7 @@ It is used for generating the documentation for GTK+, GLib \
 and GNOME."
 SECTION = "x11/base"
 SRC_URI = "file://gtk-doc.m4"
-LICENSE = "LGPL"
+LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://../gtk-doc.m4;endline=10;md5=868a952d8bb2d825d724854cfaf8f14e"
 
 PR = "r4"
-- 
1.7.5.4



