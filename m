Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5FFA460169
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 08:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7H8oVVr018926 for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 09:50:31 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JniRh0tJny-l
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 09:50:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7H8oT0A018923
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 09:50:30 +0100
Message-ID: <1408265429.24858.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Aug 2014 09:50:29 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] local.conf.sample: Append sdl to qemu-native* PACKAGECONFIG
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
X-List-Received-Date: Sun, 17 Aug 2014 08:50:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Now there are other PACKAGECONFIG options to qemu, we need
to append to the list.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 555f8db..6b5250a 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -198,8 +198,8 @@ BB_DISKMON_DIRS = "\
 # By default qemu will build with a builtin VNC server where graphical output can be
 # seen. The two lines below enable the SDL backend too. This assumes there is a
 # libsdl library available on your build system.
-PACKAGECONFIG_pn-qemu-native = "sdl"
-PACKAGECONFIG_pn-nativesdk-qemu = "sdl"
+PACKAGECONFIG_append_pn-qemu-native = " sdl"
+PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
 ASSUME_PROVIDED += "libsdl-native"
 





