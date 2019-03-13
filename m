Return-Path: <robert.joslyn@redrectangle.org>
X-Greylist: delayed 1238 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 13 Mar 2019 04:31:47 UTC
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
	by mail.openembedded.org (Postfix) with ESMTP id 3006A6C111
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 04:31:47 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
	by mslow2.mail.gandi.net (Postfix) with ESMTP id 9EDB03A3FCD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 04:04:29 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id EB7A920005;
	Wed, 13 Mar 2019 04:04:26 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2019 21:03:44 -0700
Message-Id: <20190313040344.11803-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [thud][PATCH] yocto-uninative: Correct sha256sum for aarch64
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
X-List-Received-Date: Wed, 13 Mar 2019 04:31:48 -0000
Content-Transfer-Encoding: 8bit

From: Michael Halstead <mhalstead@linuxfoundation.org>

Avoid uninative checksum warnings when building on aarch64 hardware.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index c9d502ba4f..0d484f6c3c 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -9,7 +9,7 @@
 UNINATIVE_MAXGLIBCVERSION = "2.28"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.3/"
-UNINATIVE_CHECKSUM[aarch64] ?= "b7fbbaad1ec86d76eca84d83098f50525b8a4124cc8685eaed"
+UNINATIVE_CHECKSUM[aarch64] ?= "e495046969c796b7fbbaad1ec86d76eca84d83098f50525b8a4124cc8685eaed"
 UNINATIVE_CHECKSUM[i686] ?= "44253cddbf629082568cea4fff59419106871a0cf81b4845b5d34e7014887b20"
 UNINATIVE_CHECKSUM[x86_64] ?= "c6954563dad3c95608117c6fc328099036c832bbd924ebf5fdccb622fc0a8684"
 
-- 
2.19.2


