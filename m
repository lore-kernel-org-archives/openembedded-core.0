Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 34FD26FFD4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:59:54 +0000 (UTC)
Received: from [86.30.112.98] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 654919787; Thu, 10 Dec 2015 08:59:54 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1a71l8-000EKR-K5; Thu, 10 Dec 2015 13:59:50 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1a71l8-0004NJ-IR; Thu, 10 Dec 2015 13:59:50 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 13:59:46 +0000
Message-Id: <1449755986-16780-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] gstreamer1.0: Split bash completion information into separate package
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
X-List-Received-Date: Thu, 10 Dec 2015 13:59:55 -0000

Many targets won't even have bash installed so the completion
information is completely useless. Follow the lead of other recipes and
put it in a separate -bash-completion package.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index 77e160f..0864566 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -24,6 +24,9 @@ RRECOMMENDS_${PN}_qemux86-64 += "kernel-module-snd-ens1370 kernel-module-snd-raw
 
 CACHED_CONFIGUREVARS += "ac_cv_header_valgrind_valgrind_h=no"
 
-FILES_${PN} += " ${libdir}/gstreamer-1.0/*.so ${datadir}/bash-completion/completions/ ${datadir}/bash-completion/helpers/gst*"
+FILES_${PN} += " ${libdir}/gstreamer-1.0/*.so"
 FILES_${PN}-dev += " ${libdir}/gstreamer-1.0/*.la ${libdir}/gstreamer-1.0/*.a ${libdir}/gstreamer-1.0/include"
 FILES_${PN}-dbg += " ${libdir}/gstreamer-1.0/.debug/ ${libexecdir}/gstreamer-1.0/.debug/ ${datadir}/bash-completion/helpers/.debug/"
+FILES_${PN}-bash-completion += " ${datadir}/bash-completion/completions/ ${datadir}/bash-completion/helpers/gst*"
+
+PACKAGES += " ${PN}-bash-completion"
-- 
2.1.4


