Return-Path: <rruslich@cisco.com>
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
	by mail.openembedded.org (Postfix) with ESMTP id 80C17780B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 14:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=967; q=dns/txt; s=iport;
	t=1513605691; x=1514815291;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=G6JxIMawJk4g3rRxHZ7ipWJm/Sxg97Xx/WRPc1T/0/8=;
	b=UyPDnHXWNBT21HxaASS9Z5Bobq3qKu77F5BrMseRwjrQrphRXY/ytwMH
	dQsdfh5kFtsUvZARg+krlRE4psLRkzmFR0FQhW2I4BbErX0/a3bAqwMzN
	q73xPckBHLFZNECcDRpxjUhm0yFY8CfQAW3NOfdS6asaz+GbR7L2aIw78 U=;
X-IronPort-AV: E=Sophos;i="5.45,422,1508803200"; d="scan'208";a="46256865"
Received: from rcdn-core-10.cisco.com ([173.37.93.146])
	by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2017 13:52:01 +0000
Received: from rruslich-ThinkPad-W550s.cisco.com (sjc-vpn7-128.cisco.com
	[10.21.144.128])
	by rcdn-core-10.cisco.com (8.14.5/8.14.5) with ESMTP id vBIDpBR4009937
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Mon, 18 Dec 2017 13:51:59 GMT
From: Ruslan Ruslichenko <rruslich@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Dec 2017 15:50:52 +0200
Message-Id: <1513605052-9357-7-git-send-email-rruslich@cisco.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1513605052-9357-1-git-send-email-rruslich@cisco.com>
References: <1513605052-9357-1-git-send-email-rruslich@cisco.com>
Subject: [morty][PATCH 7/7] glib.inc: set CVE_PRODUCT to glib
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
X-List-Received-Date: Mon, 18 Dec 2017 14:01:29 -0000

From: Mikko Rapeli <mikko.rapeli@bmw.de>

NVD uses product glib and vendor gnome for CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2016-6855

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 69d6342d45316389afb4b062088919689db0a6dd)
Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 906e0d4..fc1406f 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -15,6 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 BUGTRACKER = "http://bugzilla.gnome.org"
 SECTION = "libs"
 
+CVE_PRODUCT = "glib"
+
 BBCLASSEXTEND = "native nativesdk"
 
 DEPENDS = "virtual/libiconv libffi zlib glib-2.0-native"
-- 
1.9.1


