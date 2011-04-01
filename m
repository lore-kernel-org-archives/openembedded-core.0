Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W0T-0004qV-4J
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:30:45 +0200
Received: by mail-iw0-f175.google.com with SMTP id 10so3431324iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=j2ppiMLvvf2FGlSzJgGjtRvMESEoV9I5B7em7eHwF2w=;
	b=T//Lj0uQ1NkN/pApCoqhBSz4CG4JDyxhfRz/xDaQPmJF3l7XVLDQxFDSRR8q5vaNYY
	aPGjzWfKTxZPGrrJs/dl7ast2iChoQ5tmavNKbiVFO5ph6eJ4MQoFv4mXq/uFLZA+jRL
	F+OvbT9QILNEbfd4axBn5KwN76ZxCA2tIRZjI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=tztC10qlotUCP7HBpSdsBwCp7PUocF/eyJgjEz8a48Z8t2/zNp91+ijlFLXXV6AxAA
	erPePs1za+oE93CEY10BANfvRf0s35UmfrJDtI8XG4p9PjkIrjb4rWFbuPCp1AAVJ3fE
	eoyxyjY95MRaS4i/bdVQwCve+zZq5Kz7H8kzU=
Received: by 10.43.60.82 with SMTP id wr18mr4171426icb.359.1301632126423;
	Thu, 31 Mar 2011 21:28:46 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id he40sm1180615ibb.33.2011.03.31.21.28.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:28:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:28:37 -0700
Message-Id: <779ec3904eedaf773b43d627d8b9a3f8e36f32ea.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 10/46] telepathy-glib_0.13.6.bb: inherit gettext class instead of adding gettext to DEPENDS directly
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
X-List-Received-Date: Fri, 01 Apr 2011 04:30:45 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../telepathy/telepathy-glib_0.13.6.bb             |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.13.6.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.13.6.bb
index 63ada04..476ed7f 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.13.6.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.13.6.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Telepathy Framework glib-base helper library"
 DESCRIPTION = "Telepathy Framework: GLib-based helper library for connection managers"
 HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
-DEPENDS = "glib-2.0 dbus python-native-runtime dbus-native dbus-glib gettext"
+DEPENDS = "glib-2.0 dbus python-native-runtime dbus-native dbus-glib"
 LICENSE = "LGPLv2.1+"
 PR = "r0"
 
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "76a38a64d1b7fbaa6e1aaf6a9f8b898840c551aea5d9121bdcb35fdbb6
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gettext
 
 FILES_${PN} += "${datadir}/telepathy \
                 ${datadir}/dbus-1"
-- 
1.7.4.1



