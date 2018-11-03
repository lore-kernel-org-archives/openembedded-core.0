Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
	[217.70.183.199])
	by mail.openembedded.org (Postfix) with ESMTP id 562E479F7D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 16:45:31 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 51961FF806;
	Sat,  3 Nov 2018 16:45:30 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Nov 2018 09:44:23 -0700
Message-Id: <20181103164427.16125-22-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
References: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
Subject: [rocko][PATCH 21/25] openssl_1.0: drop unnecessary dependency on makedepend-native
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
X-List-Received-Date: Sat, 03 Nov 2018 16:45:31 -0000

From: Andre McCurdy <armccurdy@gmail.com>

The openssl Configure script will only select standalone makedepend
(vs running "$CC -M") when building with gcc < 3.x or with an Apple
Xcode version which predates the switch to clang (in approx 2010?).
Neither of these cases are possible when building under OE, therefore
the dependency on makedepend-native can be dropped (ie align the
openssl 1.0 recipe with the 1.1 recipe, which has dropped the
makedepend-native dependency already).

(From OE-Core rev: 4c5bd69e5cb203c8a4c2f3716c941661c0afc830)

(From OE-Core rev: 74524ec2a0f5a4210dd6680afb4b685a69f96a71)

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2o.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index c8ca99840e..c72e8f7caf 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -8,7 +8,7 @@ SECTION = "libs/network"
 LICENSE = "openssl"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f475368924827d06d4b416111c8bdb77"
 
-DEPENDS = "makedepend-native hostperl-runtime-native"
+DEPENDS = "hostperl-runtime-native"
 DEPENDS_append_class-target = " openssl-native"
 
 PROVIDES += "openssl10"
-- 
2.18.1


