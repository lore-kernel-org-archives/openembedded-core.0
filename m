Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
	[217.70.183.199])
	by mail.openembedded.org (Postfix) with ESMTP id 1063A79FCE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 16:45:11 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 05240FF807;
	Sat,  3 Nov 2018 16:45:10 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Nov 2018 09:44:15 -0700
Message-Id: <20181103164427.16125-14-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
References: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
Subject: [rocko][PATCH 13/25] openssl: support musl-x32 build
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
X-List-Received-Date: Sat, 03 Nov 2018 16:45:12 -0000

From: Andre McCurdy <armccurdy@gmail.com>

Align the openssl 1.1 recipe with changes made to openssl 1.0:

  http://git.openembedded.org/openembedded-core/commit/?id=a072d4620db462c5d3459441d5684cfd99938400

(From OE-Core rev: 24e745aaa2354432a9112879450263cab742c85b)

(From OE-Core rev: ec24fcc63e33b9c808b81968bad94e497051d350)

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssl/openssl_1.1.0h.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
index 3032778d4f..472454b5a6 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -39,7 +39,9 @@ do_configure () {
 	case $os in
 	linux-gnueabi |\
 	linux-gnuspe |\
-	linux-musl*)
+	linux-musleabi |\
+	linux-muslspe |\
+	linux-musl )
 		os=linux
 		;;
 		*)
@@ -71,7 +73,7 @@ do_configure () {
 	linux-i686)
 		target=linux-elf
 		;;
-	linux-gnux32-x86_64)
+	linux-gnux32-x86_64 | linux-muslx32-x86_64 )
 		target=linux-x32
 		;;
 	linux-gnu64-x86_64)
-- 
2.18.1


