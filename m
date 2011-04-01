Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W0a-0004q6-GU
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:30:52 +0200
Received: by mail-iw0-f175.google.com with SMTP id 10so3431291iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=6ZHS5EwScBT0FoWWtKRiihFstt9Mt9YxcW8HeX+TDGo=;
	b=rfvdgHXgr+739ASlxIduQvZtOaNQTdzHCM+hSe5ttQyW7WYxwQJXcyz2ro4+pU63pp
	DUdWm52oa6sxGIxB6TWzoIKZUztIKSlPx5W3Z9eM8FID9f20RtnxHowl2by8cW5bR0ow
	J6wsSOw2WNDxxkAuwftLYAf3ic4ugtCcSHxpE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=CvFYd8TkGWIlsQCeaYCND06Ly9pUfgWBzeAYpjPOgIFig25NesjQTDtMPR5CduFgUZ
	np+c4/JuWWva7ULHjnT0OO/TikHrYZUWVL9H8+5bIawAQ1t4P3b0qnpL5iFj4gP1WLa0
	F5Evj85VD83Jz5087g/wvfyQtKWdw5sdky12U=
Received: by 10.43.65.65 with SMTP id xl1mr2351774icb.35.1301632122991;
	Thu, 31 Mar 2011 21:28:42 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id y10sm1181596iba.29.2011.03.31.21.28.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:28:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:28:34 -0700
Message-Id: <c093dff591a0c46a1b6e83c491d184761e2342b7.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 09/46] galago: inherit gettext class instead of adding gettext to DEPENDS directly
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
X-List-Received-Date: Fri, 01 Apr 2011 04:30:52 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../galago/galago-daemon_0.5.1.bb                  |    4 ++--
 .../recipes-connectivity/galago/libgalago_0.5.2.bb |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/galago/galago-daemon_0.5.1.bb b/meta/recipes-connectivity/galago/galago-daemon_0.5.1.bb
index 5d981af..01f0ef7 100644
--- a/meta/recipes-connectivity/galago/galago-daemon_0.5.1.bb
+++ b/meta/recipes-connectivity/galago/galago-daemon_0.5.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION =   "Galago is a desktop presence framework, designed to transmit pr
 HOMEPAGE =      "http://www.galago-project.org/"
 LICENSE =       "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS =       "gettext libgalago dbus glib-2.0"
+DEPENDS =       "libgalago dbus glib-2.0"
 
 SRC_URI =       "http://www.galago-project.org/files/releases/source/${BPN}/${P}.tar.gz "
 
@@ -14,5 +14,5 @@ EXTRA_OECONF =	"--disable-binreloc --disable-check --disable-tests"
 
 FILES_${PN} += "${datadir}/dbus-1/services/"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gettext
 
diff --git a/meta/recipes-connectivity/galago/libgalago_0.5.2.bb b/meta/recipes-connectivity/galago/libgalago_0.5.2.bb
index b1b8ce7..6d9f76b 100644
--- a/meta/recipes-connectivity/galago/libgalago_0.5.2.bb
+++ b/meta/recipes-connectivity/galago/libgalago_0.5.2.bb
@@ -5,7 +5,7 @@ LICENSE =	"LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
                     file://libgalago/galago.h;endline=21;md5=141785cb9ec62067398dda136a7bb401"
 
-DEPENDS = 	"gettext dbus glib-2.0 dbus-glib"
+DEPENDS = 	"dbus glib-2.0 dbus-glib"
 
 SRC_URI =	"http://www.galago-project.org/files/releases/source/${BPN}/${P}.tar.gz \
                  file://mkdir.patch;patch=1 \
@@ -15,6 +15,6 @@ SRC_URI[md5sum] = "7ec92f2ecba1309ac4b71b4b4d8d0a0d"
 SRC_URI[sha256sum] = "9b7c9845e2f661dbf5c2595e67bc7afd48f090ac2c033726c89d7f0e90791dfa"
 PR = "r2"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gettext
 
 EXTRA_OECONF = "--disable-tests --disable-check"
-- 
1.7.4.1



