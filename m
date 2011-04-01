Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W0W-0004v2-HB
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:30:48 +0200
Received: by mail-iy0-f175.google.com with SMTP id 7so3385901iye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=nXqkE+vTFEOKRe4uqEiAvq2Iv5mqIf9DkYDXjcZRBZg=;
	b=d8RH9yrxO4uf6OsG1WpQ2N+R1++Vpvle1Ig+xGLne4r2VgOPf7XHkwoETQWHCmi/KD
	cARS1w6TAnDZUyAsHnN46WbkuHkDUmbKb/ZjxLt0g8Lb6d4qfJRiAtXXMLMeMMhpso32
	sITpluWcka2nYtaxYKgGvryY4Jdg0SSqqt81g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=uS0hoHSdbXHZdtryeZ/q9MrYK7uqk/4vSfId0oE9ylR+ulvonxrM+yHdW1Enn0j1PS
	dQdg2oSXSrs28/zlrqtesuJEtHBJDnZ82OXQZ4u84Z4pteex2iqkyqyMukz2c7xdpdNC
	UfnInLcE1Y3jx96KIvCyFQZv/nb7RkgvdQ+N8=
Received: by 10.43.45.134 with SMTP id uk6mr824489icb.168.1301632129836;
	Thu, 31 Mar 2011 21:28:49 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id g4sm1039830ick.11.2011.03.31.21.28.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:28:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:28:41 -0700
Message-Id: <b1c85e953274d521f46d8d58377ec089e115dbc1.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 11/46] console-tools_0.3.2.bb: inherit gettext
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
X-List-Received-Date: Fri, 01 Apr 2011 04:30:48 -0000

There is a dependency on libintl in configure

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../console-tools/console-tools_0.3.2.bb           |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
index c2146e4..c7bee61 100644
--- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
+++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
@@ -3,7 +3,6 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.kbd;md5=9b2d91511d3d80d4d20ac6e6b0137fe9"
 SUMMARY = "Allows you to set-up and manipulate the Linux console."
 DESCRIPTION = "Provides tools that enable the set-up and manipulation of the linux console and console-font files."
-DEPENDS = "gettext"
 PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lct/console-tools-${PV}.tar.gz \
@@ -31,7 +30,7 @@ do_compile () {
 	oe_runmake 'SUBDIRS=${SUBDIRS}'
 }
 
-inherit autotools
+inherit autotools gettext
 
 do_install () {
 	autotools_do_install
-- 
1.7.4.1



