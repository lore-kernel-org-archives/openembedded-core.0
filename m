Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 7E8466D915
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 10:41:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB4AfLgt020978 for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Dec 2013 10:41:21 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7m0Wng-VLzuG
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 10:41:21 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rB4AfIjw020968
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Dec 2013 10:41:19 GMT
Message-ID: <1386153673.4463.149.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 04 Dec 2013 10:41:13 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] libxkbfile: Remove obsolete configure option
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
X-List-Received-Date: Wed, 04 Dec 2013 10:41:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Resolves the QA error:

WARNING: QA Issue: libxkbfile: configure was passed unrecognised options: --without-xcb

(there is no such configure option any more)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.8.bb b/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.8.bb
index 812d2af..620b414 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.8.bb
@@ -12,8 +12,6 @@ DEPENDS += "virtual/libx11 kbproto"
 
 PE = "1"
 
-EXTRA_OECONF += "--without-xcb"
-
 BBCLASSEXTEND = "native"
 
 SRC_URI[md5sum] = "19e6533ae64abba0773816a23f2b9507"



