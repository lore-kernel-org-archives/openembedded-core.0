Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
	[217.70.183.199])
	by mail.openembedded.org (Postfix) with ESMTP id 96C7A79FBA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 16:45:09 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B8FE3FF805;
	Sat,  3 Nov 2018 16:45:08 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Nov 2018 09:44:14 -0700
Message-Id: <20181103164427.16125-13-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
References: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
Subject: [rocko][PATCH 12/25] openssl: remove uclibc remnants
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
X-List-Received-Date: Sat, 03 Nov 2018 16:45:10 -0000

From: Andre McCurdy <armccurdy@gmail.com>

Align the openssl 1.1 recipe with changes made to openssl 1.0:

  http://git.openembedded.org/openembedded-core/commit/?id=e01e7c543a559c8926d72159b5cd55db0c661434

(From OE-Core rev: 35cf2c1266927b609e0022be2c7bd8e08410a456)

(From OE-Core rev: 7a5fd1ca7d4b3aa0060134e7ea2af57bb9f2fe07)

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssl/openssl_1.1.0h.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
index 14c3f54132..3032778d4f 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -37,10 +37,7 @@ EXTRA_OECONF_append_libc-musl = " -DOPENSSL_NO_ASYNC"
 do_configure () {
 	os=${HOST_OS}
 	case $os in
-	linux-uclibc |\
-	linux-uclibceabi |\
 	linux-gnueabi |\
-	linux-uclibcspe |\
 	linux-gnuspe |\
 	linux-musl*)
 		os=linux
-- 
2.18.1


