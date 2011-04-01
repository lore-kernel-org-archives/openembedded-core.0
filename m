Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W1d-0005BL-4K
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:31:57 +0200
Received: by iwn10 with SMTP id 10so3432302iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=+SyfTAlyprG7+0JAICsSKd1QV0tbXodYvZvHnn6uflk=;
	b=UW30npaOzgfPk6cCgWnsFMpHQXJgzoJ4ovc1KwECvojSf69cInUjktSUf4BUzc9BKo
	Hxv4BcXYW87pRNRTsXJzq1W7OAj6uROL7Z8clnEElUGwQDre9g1yS0Pex8zf0HVE80cT
	kfvEulPU45aRLWf9oFma7f8sx/jUE8FqtU7wo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=GO9QSytOaLTiYtGgw1Z4k2oKvxHilgMXSIN91k9iGARMb6CyfSY75iJfv4Y1VOOOWJ
	/orCF/WvHeFH8stl9EzDvHt377dOik724ti83YJmYHaRr6RVRZAEbbft5RJIOOAHZVYS
	fecm9nnTk33nc3HH0b8EYVZWs7rXjxZ8Ld8X8=
Received: by 10.43.58.18 with SMTP id wi18mr4499078icb.489.1301632196040;
	Thu, 31 Mar 2011 21:29:56 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id o3sm1184612ibd.10.2011.03.31.21.29.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:29:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:29:47 -0700
Message-Id: <0f14a3f39c28f21ab059aa8ab133785a0cb645dd.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 30/46] sed: inherit gettext class instead of adding gettext to DEPENDS directly
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
X-List-Received-Date: Fri, 01 Apr 2011 04:31:57 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/sed/sed_4.1.2.bb |    4 +---
 meta/recipes-extended/sed/sed_4.2.1.bb |    4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/sed/sed_4.1.2.bb b/meta/recipes-extended/sed/sed_4.1.2.bb
index 80d4b03..89b1f34 100644
--- a/meta/recipes-extended/sed/sed_4.1.2.bb
+++ b/meta/recipes-extended/sed/sed_4.1.2.bb
@@ -6,12 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SECTION = "console/utils"
 PR = "r5"
 
-DEPENDS = "gettext"
-
 SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.gz \
            file://fix_return_type.patch"
 
-inherit autotools update-alternatives
+inherit autotools update-alternatives gettext
 
 do_install () {
 	autotools_do_install
diff --git a/meta/recipes-extended/sed/sed_4.2.1.bb b/meta/recipes-extended/sed/sed_4.2.1.bb
index 045fd66..d775d44 100644
--- a/meta/recipes-extended/sed/sed_4.2.1.bb
+++ b/meta/recipes-extended/sed/sed_4.2.1.bb
@@ -6,14 +6,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
 SECTION = "console/utils"
 PR = "r1"
 
-DEPENDS = "gettext"
-
 SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "f0fd4d7da574d4707e442285fd2d3b86"
 SRC_URI[sha256sum] = "8773541ce097fdc4c5b9e7da12a82dffbb30cd91f7bc169f52f05f93b7fc3060"
 
-inherit autotools update-alternatives
+inherit autotools update-alternatives gettext
 
 do_install () {
 	autotools_do_install
-- 
1.7.4.1



