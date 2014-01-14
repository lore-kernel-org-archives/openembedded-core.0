Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 02A47600AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 16:26:12 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginm.net ([86.30.57.232]
	helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <pb@pbcl.net>) id 1W36ob-0002RS-4d
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jan 2014 17:26:12 +0100
Message-ID: <1389716768.19023.16.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jan 2014 16:26:08 +0000
X-Mailer: Evolution 3.8.5-2+b1 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview: The binaries: -rwxr-xr-x root/root 21956 2014-01-09
	19:39 ./bin/hb-shape -rwxr-xr-x root/root 21504 2014-01-09 19:39
	./bin/hb-ot-shape-closure
	-rwxr-xr-x root/root 36520 2014-01-09 19:39 ./bin/hb-view [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH] harfbuzz: Move ancillary binaries to ${PN}-bin
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
X-List-Received-Date: Tue, 14 Jan 2014 16:26:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The binaries:

-rwxr-xr-x root/root     21956 2014-01-09 19:39 ./bin/hb-shape
-rwxr-xr-x root/root     21504 2014-01-09 19:39 ./bin/hb-ot-shape-closure
-rwxr-xr-x root/root     36520 2014-01-09 19:39 ./bin/hb-view

are not generally useful on target systems.  Also, their presence in the
same binary package as libharfbuzz.so defeats the debian package autonamer.
Inherit lib_package to move these to ${PN}-bin.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_0.9.25.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.25.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.25.bb
index 544deec..ba637bc 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.25.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.25.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-${PV}.t
 SRC_URI[md5sum] = "491b631239f51dcd4f7934775306c4e7"
 SRC_URI[sha256sum] = "dc6e5997a569526cd28147a80a0f65466e87ae617753b38704a60184bc6d6bee"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig lib_package
 
 DEPENDS = "glib-2.0 cairo freetype"
 
-- 
1.8.5




