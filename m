Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 9ED3F719B4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 09:36:03 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 1273B20786
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 04:26:38 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Fri, 20 Jan 2017 04:26:38 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=7ZLa3bEtu4mIL5g92se1qeEbXb4=; b=VMexd
	y4c4NagJF6GqBjH4PYqeAL0fCY6rh5APqWFr22Rlfj7EhOTX3p3lIgg9cPJY8cmm
	lcSmo1GOAO3lF/XH2yrOAAg/WsZ8B2+6Vys/YsmQLQbxshRRh6M3siYh/levXrmE
	pvWn1xC3QdW4uxrYz8JQzuAbJNnBvkq3kwTDFA=
X-ME-Sender: <xms:zteBWEErnFCyhNxMU8zc5S5iyMyRg42z-lu3Du1aOIMKXxLPZQqa0A>
X-Sasl-enc: y4HtJ+HAA4utcKqqmHm0CE5dZ+tSQWerZugbbtp0CAGj 1484904397
Received: from localhost.localdomain (unknown [192.40.95.5])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8C4227EA90
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 04:26:37 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:26:29 +0200
Message-Id: <20170120092629.15146-2-tanuk@iki.fi>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170120092629.15146-1-tanuk@iki.fi>
References: <20170120092629.15146-1-tanuk@iki.fi>
Subject: [PATCH 2/2] flac: 1.3.1 -> 1.3.2
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
X-List-Received-Date: Fri, 20 Jan 2017 09:36:04 -0000

Changelog: https://xiph.org/flac/changelog.html

The license checksum changes are due to simple copyright year updates.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 .../recipes-multimedia/flac/{flac_1.3.1.bb => flac_1.3.2.bb} | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-multimedia/flac/{flac_1.3.1.bb => flac_1.3.2.bb} (83%)

diff --git a/meta/recipes-multimedia/flac/flac_1.3.1.bb b/meta/recipes-multimedia/flac/flac_1.3.2.bb
similarity index 83%
rename from meta/recipes-multimedia/flac/flac_1.3.1.bb
rename to meta/recipes-multimedia/flac/flac_1.3.2.bb
index f25271f879..8a7fc5e190 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.1.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.2.bb
@@ -5,19 +5,19 @@ BUGTRACKER = "http://sourceforge.net/p/flac/bugs/"
 SECTION = "libs"
 LICENSE = "GFDL-1.2 & GPLv2+ & LGPLv2.1+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
-                    file://src/Makefile.am;beginline=1;endline=17;md5=0a853b81d9d43d8aad3b53b05cfcc37e \
+                    file://src/Makefile.am;beginline=1;endline=17;md5=09501c864f89dfc7ead65553129817ca \
                     file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://src/flac/main.c;beginline=1;endline=18;md5=d03a766558d233f9cc3ac5dfafd49deb \
+                    file://src/flac/main.c;beginline=1;endline=18;md5=09777e2934947a36f13568d0beb81199 \
                     file://COPYING.LGPL;md5=fbc093901857fcd118f065f900982c24 \
-                    file://src/plugin_common/all.h;beginline=1;endline=18;md5=7c8a3b9e1e66ed0aba765bc6f35da85d \
-                    file://COPYING.Xiph;md5=a2c4b71c0198682376d483eb5bcc9197 \
+                    file://src/plugin_common/all.h;beginline=1;endline=18;md5=f56cb4ba9a3bc9ec6102e8df03215271 \
+                    file://COPYING.Xiph;md5=b59c1b6d7fc0fb7965f821a3d36505e3 \
                     file://include/FLAC/all.h;beginline=65;endline=70;md5=64474f2b22e9e77b28d8b8b25c983a48"
 DEPENDS = "libogg"
 
 SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "b9922c9a0378c88d3e901b234f852698"
-SRC_URI[sha256sum] = "4773c0099dba767d963fd92143263be338c48702172e8754b9bc5103efe1c56c"
+SRC_URI[md5sum] = "454f1bfa3f93cc708098d7890d0499bd"
+SRC_URI[sha256sum] = "91cfc3ed61dc40f47f050a109b08610667d73477af6ef36dcad31c31a4a8d53f"
 
 inherit autotools gettext
 
-- 
2.11.0


