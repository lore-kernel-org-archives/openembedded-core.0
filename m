Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Rjs9G-00062x-B6
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jan 2012 13:46:54 +0100
Received: by eaal1 with SMTP id l1so1691173eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jan 2012 04:39:28 -0800 (PST)
Received: by 10.213.19.73 with SMTP id z9mr878058eba.41.1326026364314;
	Sun, 08 Jan 2012 04:39:24 -0800 (PST)
Received: from localhost.localdomain ([79.115.118.211])
	by mx.google.com with ESMTPS id a60sm276181372eeb.4.2012.01.08.04.39.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 Jan 2012 04:39:23 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Jan 2012 14:39:20 +0200
Message-Id: <1326026360-27733-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
Cc: Andrei Gherzan <andrei@gherzan.ro>,
	Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH] gettext: License modify LICENSE to GPLv3 from GPL-3
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
X-List-Received-Date: Sun, 08 Jan 2012 12:46:54 -0000

From: Andrei Gherzan <andrei.gherzan@windriver.com>

[YOCTO #1884]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-core/gettext/gettext_0.18.1.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index 615582e..1e8c952 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Utilities and libraries for producing multi-lingual messages."
 DESCRIPTION = "Gettext offers to programmers, translators, and even users, a well integrated set of tools and documentation. Specifically, the GNU `gettext' utilities are a set of tools that provides a framework to help other GNU packages produce multi-lingual messages. These tools include a set of conventions about how programs should be written to support message catalogs, a directory and file naming organization for the message catalogs themselves, a runtime library supporting the retrieval of translated messages, and a few stand-alone programs to massage in various ways the sets of translatable strings, or already translated strings."
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SECTION = "libs"
-LICENSE = "GPL-3+ & LGPL-2.1+"
+LICENSE = "GPLv3+ & LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 PR = "r6"
-- 
1.7.5.4



