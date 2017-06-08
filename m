Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 003EB78257
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 13:19:38 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 6EA0420B5A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 09:19:40 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Thu, 08 Jun 2017 09:19:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=JfEAEbbcAOZdEyIHwzlEldCdd2HH6vM+dKhJQsCi8
	2A=; b=sHFHCeFIZvnW5CpgYt3FSb0DtbD+V477uO+0pu9FerUY4kPbCFs3KQRUA
	GJp+92sbl3arweNKCmKn1BTB40Fw8PuM1+0R76mXMHkTqj+Z+CThRMJX9G0uA3WT
	RJNMLq07nClezcnG7BMfSCRe04p1bLLydOFVXLo+saRvIuu9gr0iWslK7AsgXSe4
	kpvkwP109dTYXNFCa0CnOnp2/q4nt4FaUar0xk9oiXwq8urmAw+5osemeIhzMPjD
	bh9fIlAfnnaodaYXZ2zg5S8sm+bEq+LsvY8ZdZaVneAfuNuRxfjKg03GpdFKCoob
	P6LknWzYwZB4vUnO5lEmBIy0Sa6Sg==
X-ME-Sender: <xms:7E45WV6-TW_20UrHMZj5FygRd7MEfmTpOzmBwcjcGos97fEG_tCfrw>
X-Sasl-enc: zoBHjkh4HL0xe6RX7NZ0Ygy8RIpr2c39wNxciN9eS+iY 1496927979
Received: from localhost.localdomain (unknown [192.40.95.39])
	by mail.messagingengine.com (Postfix) with ESMTPA id D48387E98B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 09:19:39 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 16:19:29 +0300
Message-Id: <9312926d20b695b16da19fd498c0b5902e2f8c93.1496927857.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496927857.git.tanuk@iki.fi>
References: <cover.1496927857.git.tanuk@iki.fi>
Subject: [PATCH 3/3] alsa-plugins: 1.1.1 -> 1.1.4
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
X-List-Received-Date: Thu, 08 Jun 2017 13:19:39 -0000

Changelog: http://alsa-project.org/main/index.php/Changes_v1.1.3_v1.1.4

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 .../alsa/{alsa-plugins_1.1.1.bb => alsa-plugins_1.1.4.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-plugins_1.1.1.bb => alsa-plugins_1.1.4.bb} (96%)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.1.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.4.bb
similarity index 96%
rename from meta/recipes-multimedia/alsa/alsa-plugins_1.1.1.bb
rename to meta/recipes-multimedia/alsa/alsa-plugins_1.1.4.bb
index 16686a0445..b7f79b7535 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.4.bb
@@ -21,8 +21,8 @@ LIC_FILES_CHKSUM = "\
 "
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/plugins/${BP}.tar.bz2"
-SRC_URI[md5sum] = "69f9f3e2de3c97fc71d496e91e271fe5"
-SRC_URI[sha256sum] = "8ea4d1e082c36528a896a2581e5eb62d4dc2683238e353050d0d624e65f901f1"
+SRC_URI[md5sum] = "de51130a7444b79b2dd3c25e28420754"
+SRC_URI[sha256sum] = "530d1c3bdaeb058f2a03607a33b9e16ee5369bfd30a96bc09bd2c69b4ddd1a8a"
 
 DEPENDS += "alsa-lib"
 
-- 
2.11.0


