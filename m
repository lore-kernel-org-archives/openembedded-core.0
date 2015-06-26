Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0BA8F605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 22:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5QMesZV013837 for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 23:40:54 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id o7AvHAnAKxsD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 23:40:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5QMefSi013834
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 23:40:52 +0100
Message-ID: <1435358441.10583.35.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jun 2015 23:40:41 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] subversion: Fix subversion-native on Fedora22
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
X-List-Received-Date: Fri, 26 Jun 2015 22:40:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Similarly to:
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=9b19d6548a345009a6de79a6820c07a72054d961

we also need to fix the subversion-native case with gcc5 by using
the same fix to the BUILD_CPPFLAGS.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/subversion/subversion_1.8.13.bb b/meta/recipes-devtools/subversion/subversion_1.8.13.bb
index 7ef7dfb..a98be67 100644
--- a/meta/recipes-devtools/subversion/subversion_1.8.13.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.8.13.bb
@@ -32,6 +32,7 @@ inherit autotools
 
 export LDFLAGS += " -L${STAGING_LIBDIR} "
 CPPFLAGS += "-P"
+BUILD_CPPFLAGS += "-P"
 
 acpaths = "-I build/ -I build/ac-macros/"
 



