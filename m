Return-Path: <petter@technux.se>
Received: from vsp-authed-01-02.binero.net (vsp-authed02.binero.net
	[195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id AFD4A601A2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 21:20:19 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-01-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Wed,  7 May 2014 23:20:27 +0200 (CEST)
Received: from eldbvzzwp1-7x.lan (81-229-90-163-no67.tbcn.telia.com
	[81.229.90.163]) (Authenticated sender: petter@technux.se)
	by smtp-10-01.atm.binero.net (Postfix) with ESMTPSA id 35D373A148;
	Wed,  7 May 2014 23:20:13 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 May 2014 23:19:48 +0200
Message-Id: <74900f74cc49bf174099c990f586ac778381a875.1399497346.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <b481b46603ad2ee97a9cc55890293e24db85b8e7.1399497346.git.petter@technux.se>
References: <b481b46603ad2ee97a9cc55890293e24db85b8e7.1399497346.git.petter@technux.se>
In-Reply-To: <cover.1399497346.git.petter@technux.se>
References: <cover.1399497346.git.petter@technux.se>
MIME-Version: 1.0
Subject: [PATCH 02/13] dbus: remove usage of FILESPATH
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
X-List-Received-Date: Wed, 07 May 2014 21:20:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes [YOCTO #4497]

Usage of FILESPATH is discouraged, since it can make recipes harder to
bbappend. Instead FILESEXTRAPATHS should be used to extend the path.
Avoid using filesdir in dbus, since current patchdirs are only shared
between some of the dbus bb-files.

Signed-off-by: Petter Mabäcker <petter@technux.se>
---
 meta/recipes-core/dbus/dbus-test_1.6.18.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus-test_1.6.18.bb b/meta/recipes-core/dbus/dbus-test_1.6.18.bb
index 9ea0f4d..bff1a46 100644
--- a/meta/recipes-core/dbus/dbus-test_1.6.18.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.6.18.bb
@@ -23,7 +23,7 @@ SRC_URI[md5sum] = "b02e9c95027a416987b81f9893831061"
 SRC_URI[sha256sum] = "7085a0895a9eb11a952394cdbea6d8b4358e17cb991fed0e8fb85e2b9e686dcd"
 
 S="${WORKDIR}/dbus-${PV}"
-FILESPATH = "${FILE_DIRNAME}/dbus"
+FILESEXTRAPATHS_prepend := "${THISDIR}/dbus:"
 
 inherit autotools pkgconfig gettext ptest
 
-- 
1.7.9.5


