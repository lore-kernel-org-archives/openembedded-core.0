Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 95F736B9DD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 09:24:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s039OixC017850
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jan 2014 01:24:45 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 3 Jan 2014 01:24:44 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 4 Jan 2014 01:27:13 +0800
Message-ID: <b26fe9bc5b459770c0716ba086b905924d7f2b9b.1388769973.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1388769973.git.liezhi.yang@windriver.com>
References: <cover.1388769973.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] mime.bbclass: remove the --disable-update-mimedb
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
X-List-Received-Date: Fri, 03 Jan 2014 09:24:43 -0000
Content-Type: text/plain

Gnome and other freedesktop's mime data has been moved to
shared-mime-info, and there is no such an option any more, we already
have this recipe, so remove it, this will fix the warning:

configure was passed unrecognised options: --disable-update-mimedb

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/mime.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
index 690610e..721c73f 100644
--- a/meta/classes/mime.bbclass
+++ b/meta/classes/mime.bbclass
@@ -1,7 +1,5 @@
 DEPENDS += "shared-mime-info-native shared-mime-info"
 
-EXTRA_OECONF += "--disable-update-mimedb"
-
 mime_postinst() {
 if [ "$1" = configure ]; then
 	UPDATEMIMEDB=`which update-mime-database`
-- 
1.8.3.1


