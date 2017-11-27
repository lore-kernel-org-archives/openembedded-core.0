Return-Path: <tanuk@iki.fi>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id D614E7830E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 16:49:10 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 98DF120C0E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 11:39:50 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Mon, 27 Nov 2017 11:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=9gIfrbR68EPluCAyAn0jum7wWQAs4+0t7TclMQDkQJE=; b=h6nka3BA
	O188BCd7ZDiAePkTL5PcFWNJHnse1sBHlJRqMSbpK4t5xp6feCPBqf/eW73D16t7
	q9cNjWnEORQgxYq+rU45tJV4sHfOmqDFS6sHDUgehs3HK63m/0FI5Sk0wouKdrJf
	8V39QdjVsez4iMJZtiEZSMIzxwCee/2n7S6v7srsidMBdqqpFteme4GVSaBk7ut6
	AZeM2l/I3G7wP2Ecoan7GIs7i50XQGjiu1fR8STWWHgWDu2/wNmQDPJL8VJPF7Oo
	iuV3cksWrXUXBYcl+gIIn+VQ2w/djkSp+Jh6eycU3PKmRoTMVN63yZ7ynUbKeWKT
	JNAsMea0hLLyiA==
X-ME-Sender: <xms:1j8cWjtX3TKtNJSn9jC2qTfVgQTUFsSmfqE9MzT3PMRkcb9utNM46g>
Received: from localhost.localdomain (unknown [192.40.95.17])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0F4EC7E7AD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 11:39:49 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2017 18:39:32 +0200
Message-Id: <20171127163934.31597-5-tanuk@iki.fi>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171127163934.31597-1-tanuk@iki.fi>
References: <20171127163934.31597-1-tanuk@iki.fi>
Subject: [PATCH 4/6] alsa-plugins: 1.1.4 -> 1.1.5
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
X-List-Received-Date: Mon, 27 Nov 2017 16:49:11 -0000

Changes:
http://www.alsa-project.org/main/index.php/Changes_v1.1.4_v1.1.5

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 .../alsa/{alsa-plugins_1.1.4.bb => alsa-plugins_1.1.5.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-plugins_1.1.4.bb => alsa-plugins_1.1.5.bb} (96%)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.4.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.5.bb
similarity index 96%
rename from meta/recipes-multimedia/alsa/alsa-plugins_1.1.4.bb
rename to meta/recipes-multimedia/alsa/alsa-plugins_1.1.5.bb
index b7f79b7535..4bd0acc54f 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.4.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.5.bb
@@ -21,8 +21,8 @@ LIC_FILES_CHKSUM = "\
 "
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/plugins/${BP}.tar.bz2"
-SRC_URI[md5sum] = "de51130a7444b79b2dd3c25e28420754"
-SRC_URI[sha256sum] = "530d1c3bdaeb058f2a03607a33b9e16ee5369bfd30a96bc09bd2c69b4ddd1a8a"
+SRC_URI[md5sum] = "f898b0e6e8acf3f6f82bc2a0f0c84a97"
+SRC_URI[sha256sum] = "797da5f8f53379fbea28817bc466de16affd2c07849e84f1af8d5e22f7bb7f1c"
 
 DEPENDS += "alsa-lib"
 
-- 
2.14.2


