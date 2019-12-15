Return-Path: <crg7475@mailbox.org>
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	by mail.openembedded.org (Postfix) with ESMTP id B72907F816
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 12:54:39 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:2:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 47bPP70hRQzKmbD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 13:49:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1576414166; bh=Ml2WiwI454jKxNO
	hNKbg6wISmaUNi1GDcjNv6vmm+64=; b=LpdRj2DfwolYL6KvBOqgklRxaovvF+o
	wm/KzT1libH4NJvT7HmuoLM2xTy8UonY8zSOJM7sU2EkL4YGzAze3cUgoOY0hD6q
	EbIuWhj48k9vgRf49HmMyrMLdsMh4nrh+GkNvmEyiM/udv4VjoVBiQ8gjFlcWvTw
	x19Ve1LyxPg5lcecI+cIJuiks0BwmPuXgKWHjU7xxAJbBHZEtBc++1P18TTQohVx
	T9EikHdMy63pWcI48Aj17O2vPDwsUHVeNH6YEhFQ9BAU9jpefs2VGATlw0wTYyAX
	I45ZK8SORzX61NcqTHzTOYTuGL77w7Eo9/43lZGxxwt0UsmlAdaYdqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1576414170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=wmCSyTDWyrFzQVLXU9ObyAKEBhn8B6R5U7mzqLvs0SU=;
	b=rjgR1d6JmahSY8koY9PZP7NYbeYcFQGbJNwkHZyHGvwSz9qryPckamb/v6ELy5Jn0C1gNP
	bUyPaUA7CbOjKfcbGADc6wSJydMiTKWcb47EXWQ2+ysmOekYZsUv2ZTh17pTz9i/FtkDK3
	dL1ZDYtNbg67/aTKgxDcyuZRBt7l1vFgcvgKioyL91OXehOh5XlEl5QjZVLIDn6C1ajzvs
	Ql5bXDWuSvh3CxIPZbNT3Li2sTRRckCJLUN0r3fgM/cNeoqpWw4JhDuL++zn5xX5roLeag
	/bGKseT1z0o/zEY18dOkClSdMnZOqSXnkYyIpxHXAF5geW0PZR1OkP84bjUwjw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
	[80.241.56.125]) (amavisd-new, port 10030) with ESMTP id 6I5ACM_2CiET
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 13:49:26 +0100 (CET)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Dec 2019 13:49:07 +0100
Message-Id: <20191215124910.24946-9-crg7475@mailbox.org>
In-Reply-To: <20191215124910.24946-1-crg7475@mailbox.org>
References: <20191215124910.24946-1-crg7475@mailbox.org>
Subject: [WIP][PATCH 09/12] gstreamer1.0-omx: Transition to meson based build
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
X-List-Received-Date: Sun, 15 Dec 2019 12:54:40 -0000

* Removed autotools/M4 specific bits from recipe.

* gettext, gtk-doc, and valgrind support is no longer present in gst-omx,
  and arguably never really was (because they were present in the "common"
  git submodule that is no longer being used in meson base builds).

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../gstreamer/gstreamer1.0-omx_1.16.1.bb          | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
index cb2f7045a8..89e13937ea 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
@@ -16,14 +16,12 @@ S = "${WORKDIR}/gst-omx-${PV}"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
 
-inherit autotools pkgconfig gettext gtk-doc upstream-version-is-even
-
-acpaths = "-I ${S}/common/m4 -I ${S}/m4"
+inherit meson pkgconfig upstream-version-is-even
 
 GSTREAMER_1_0_OMX_TARGET ?= "bellagio"
 GSTREAMER_1_0_OMX_CORE_NAME ?= "${libdir}/libomxil-bellagio.so.0"
 
-EXTRA_OECONF += "--disable-valgrind --with-omx-target=${GSTREAMER_1_0_OMX_TARGET}"
+EXTRA_OEMESON += "-Dtarget=${GSTREAMER_1_0_OMX_TARGET}"
 
 python __anonymous () {
     omx_target = d.getVar("GSTREAMER_1_0_OMX_TARGET")
@@ -37,21 +35,12 @@ python __anonymous () {
         d.setVar("PACKAGE_ARCH", d.getVar("MACHINE_ARCH"))
 }
 
-delete_pkg_m4_file() {
-    # Delete m4 files which we provide patched versions of but will be ignored
-    # if these exist
-	rm -f "${S}/common/m4/pkg.m4"
-	rm -f "${S}/common/m4/gtk-doc.m4"
-}
-do_configure[prefuncs] += "delete_pkg_m4_file"
-
 set_omx_core_name() {
 	sed -i -e "s;^core-name=.*;core-name=${GSTREAMER_1_0_OMX_CORE_NAME};" "${D}${sysconfdir}/xdg/gstomx.conf"
 }
 do_install[postfuncs] += " set_omx_core_name "
 
 FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
-FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la"
 FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
 
 RDEPENDS_${PN} = "libomxil"
-- 
2.17.1


