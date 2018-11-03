Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
	[217.70.183.199])
	by mail.openembedded.org (Postfix) with ESMTP id 52D6379F7B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 16:45:05 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 10282FF804;
	Sat,  3 Nov 2018 16:45:03 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Nov 2018 09:44:12 -0700
Message-Id: <20181103164427.16125-11-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
References: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
Subject: [rocko][PATCH 10/25] openssl_1.0: drop leading "-" from no-ssl3 config option
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
X-List-Received-Date: Sat, 03 Nov 2018 16:45:05 -0000

From: Andre McCurdy <armccurdy@gmail.com>

Although passing -no-ssl3 works, comments in the openssl Configure
script suggest doing so isn't really correct:

  s /^-no-/no-/; # some people just can't read the instructions

The documented way to pass no-<cipher> config options is without a
leading "-"

  https://github.com/openssl/openssl/blob/OpenSSL_1_0_2-stable/INSTALL

(From OE-Core rev: 369927de1d94a295671d3750c95b70a497b13425)

(From OE-Core rev: 3936fafb3bd85499361f32abef4919ad3c74d83f)

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2o.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index b8fe49f7c9..2cc025b923 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -71,7 +71,7 @@ PACKAGECONFIG[cryptodev-linux] = "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS,,cryp
 
 # Remove this to enable SSLv3. SSLv3 is defaulted to disabled due to the POODLE
 # vulnerability
-EXTRA_OECONF = "-no-ssl3"
+EXTRA_OECONF = "no-ssl3"
 
 export DIRS = "crypto ssl apps engines"
 export AS = "${CC} -c"
-- 
2.18.1


