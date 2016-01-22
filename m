Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 326B56FF5D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0MCxbxi019804 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:59:37 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id N6Y67vfZleJ2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:59:37 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0MCxZrs019796
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:59:36 GMT
Message-ID: <1453467575.27999.199.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jan 2016 12:59:35 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] xz: Allow to work with ASSUME_PROVIDED xz-native
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
X-List-Received-Date: Fri, 22 Jan 2016 12:59:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

At some point we may want to add xz-native to ASSUME_PROVIDED. This
allows that to work whilst still allowing access to liblzma for
those things which need it (e.g. pixz).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-extended/xz/xz_5.2.2.bb b/meta/recipes-extended/xz/xz_5.2.2.bb
index d118f3a..6acb33e 100644
--- a/meta/recipes-extended/xz/xz_5.2.2.bb
+++ b/meta/recipes-extended/xz/xz_5.2.2.bb
@@ -31,6 +31,9 @@ PACKAGES =+ "liblzma"
 
 FILES_liblzma = "${libdir}/liblzma*${SOLIBS}"
 
+PROVIDES_append_class-native = " xz-replacement-native"
+NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
+
 BBCLASSEXTEND = "native nativesdk"
 
 export CONFIG_SHELL="/bin/sh"



