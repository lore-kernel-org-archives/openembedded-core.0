Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 434 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 25 Apr 2016 07:32:51 UTC
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 849966E666
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 07:32:51 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Apr 2016 09:25:33 +0200
Message-Id: <1461569133-13241-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] rpm: explicitly disable tomcrypt
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
X-List-Received-Date: Mon, 25 Apr 2016 07:32:52 -0000

Configure autodetects libtomcrypt, but then it adds libtommath to
$LIBS and fails to link subsequent tests if it's unavailable.

| checking for pcre.h... yes
| checking for pcre_compile in -lpcre... no
| checking whether to build with PCRE library... no
| ++ executing failure action
| configure: error: unable to find usable PCRE library

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/rpm/rpm_5.4.16.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index cbdca88..f2c12d2 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -328,6 +328,7 @@ EXTRA_OECONF += "--verbose \
 		--without-ruby \
 		--without-squirrel \
 		--without-sasl2 \
+		--without-tomcrypt \
 		--with-build-extlibdep \
 		--with-build-maxextlibdep \
 		--without-valgrind \
-- 
1.9.1


