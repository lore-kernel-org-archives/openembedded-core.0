Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 75C7F60842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 15:58:29 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MGALH5012135 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 17:10:21 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9Q_v2j3gHcpY
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 17:10:20 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MGAGuk012103
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 17:10:18 +0100
Message-ID: <1377187095.6762.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Aug 2013 16:58:15 +0100
In-Reply-To: <1377186667.6762.25.camel@ted>
References: <1377186667.6762.25.camel@ted>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH v2] mkfontscale: This no longer needs a full libx11, xproto suffices
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
X-List-Received-Date: Thu, 22 Aug 2013 15:58:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From 241ba8ad72afe7010568d0b3b574244f424817fb Mon Sep 17 00:00:00 2001
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 22 Aug 2013 15:49:08 +0000
Subject: mkfontscale: This no longer needs a full libx11, xproto suffices

configure just looks for xproto so we can drop the libx11 dependency and
reduce the amount we build for some small performance improvements and
less of the -native stack.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.1.1.bb b/meta/recipes-graphics/xorg-app/mkfontscale_1.1.1.bb
index 3d248d1..65f74c2 100644
--- a/meta/recipes-graphics/xorg-app/mkfontscale_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontscale_1.1.1.bb
@@ -8,7 +8,7 @@ font name (XLFD) is generated, and is written together with the file \
 name to a file fonts.scale in the directory.  The resulting fonts.scale \
 is used by the mkfontdir program."
 
-DEPENDS += " zlib libfontenc freetype virtual/libx11"
+DEPENDS = "util-macros-native zlib libfontenc freetype xproto"
 
 BBCLASSEXTEND = "native"
 



