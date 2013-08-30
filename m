Return-Path: <lizj@suika.fct.css.fujitsu.com>
Received: from fgwmail5.fujitsu.co.jp (fgwmail5.fujitsu.co.jp [192.51.44.35])
	by mail.openembedded.org (Postfix) with ESMTP id 72F986BBD2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 08:04:02 +0000 (UTC)
Received: from m2.gw.fujitsu.co.jp (unknown [10.0.50.72])
	by fgwmail5.fujitsu.co.jp (Postfix) with ESMTP id EEBA13EE10C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 17:04:01 +0900 (JST)
Received: from smail (m2 [127.0.0.1])
	by outgoing.m2.gw.fujitsu.co.jp (Postfix) with ESMTP id E098445DE4D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 17:04:01 +0900 (JST)
Received: from s2.gw.fujitsu.co.jp (s2.gw.fujitsu.co.jp [10.0.50.92])
	by m2.gw.fujitsu.co.jp (Postfix) with ESMTP id C06A145DE4E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 17:04:01 +0900 (JST)
Received: from s2.gw.fujitsu.co.jp (localhost.localdomain [127.0.0.1])
	by s2.gw.fujitsu.co.jp (Postfix) with ESMTP id A96DD1DB8043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 17:04:01 +0900 (JST)
Received: from suika.fct.css.fujitsu.com (mikan.fct.css.fujitsu.com
	[10.24.14.129])
	by s2.gw.fujitsu.co.jp (Postfix) with ESMTP id 518AA1DB803E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 17:04:01 +0900 (JST)
Received: by suika.fct.css.fujitsu.com (Postfix, from userid 506)
	id B5F3C180408; Sat, 31 Aug 2013 02:03:59 +0900 (JST)
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 31 Aug 2013 02:00:23 +0900
Message-Id: <1377882023-14125-1-git-send-email-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] libxml2: make xmlcatalog work via --with-catalog
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
X-List-Received-Date: Fri, 30 Aug 2013 08:04:02 -0000

Previously,when execute xmlcatalog, it shows as follows:
 "libxml was not compiled with catalog and output support"

So it seems more reasonable to make xmlcatalog work
by using --with-catalog instead of --without-catalog

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 meta/recipes-core/libxml/libxml2.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 7fb2644..7a6a638 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -29,7 +29,7 @@ do_configure_prepend () {
 	sed -i -e '/.*ansidecl.h.*/d' ${S}/configure.in
 }
 
-EXTRA_OECONF = "--without-python --without-debug --without-legacy --without-catalog --without-docbook --with-c14n --without-lzma --with-fexceptions"
+EXTRA_OECONF = "--without-python --without-debug --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma --with-fexceptions"
 EXTRA_OECONF_class-native = "--with-python=${STAGING_BINDIR}/python --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma"
 EXTRA_OECONF_class-nativesdk = "--with-python=${STAGING_BINDIR}/python --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma"
 EXTRA_OECONF_linuxstdbase = "--without-python --with-debug --with-legacy --with-catalog --with-docbook --with-c14n --without-lzma"
-- 
1.7.1


