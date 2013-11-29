Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 53DB56C731
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 14:36:24 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rATEaHYI010588 for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 14:36:18 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id beOMMsQj31xe
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 14:36:17 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rATEaCOC010585
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 14:36:13 GMT
Message-ID: <1385735769.11222.61.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Nov 2013 14:36:09 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sqlite3: Fix configure option warning
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
X-List-Received-Date: Fri, 29 Nov 2013 14:36:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

WARNING: QA Issue: sqlite3: configure was passed unrecognised options: --disable-tcl

There is no tcl option or support now so remove the option.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 3fa8d4c..064d78c 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -7,8 +7,8 @@ LICENSE = "PD"
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF = "--disable-tcl --enable-shared --enable-threadsafe"
-EXTRA_OECONF_class-native = "--disable-tcl --enable-shared --enable-threadsafe --disable-readline --enable-tempstore"
+EXTRA_OECONF = "--enable-shared --enable-threadsafe"
+EXTRA_OECONF_class-native = "--enable-shared --enable-threadsafe --disable-readline --enable-tempstore"
 export config_BUILD_CC = "${BUILD_CC}"
 export config_BUILD_CFLAGS = "${BUILD_CFLAGS}"
 export config_BUILD_LIBS = "${BUILD_LDFLAGS}"



