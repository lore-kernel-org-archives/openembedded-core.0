Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D771473195
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 13:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3EDXrII012915 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 14:33:53 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NCE9ZNK9hCo7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 14:33:53 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3EDXpIO012912
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 14:33:52 +0100
Message-ID: <1460640831.9308.176.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Apr 2016 14:33:51 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] default-providers: Update to use PREFERRED_RPROVIDER
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
X-List-Received-Date: Thu, 14 Apr 2016 13:33:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Get rid of the very confusing PREFERRED_PROVIDER_bluez4 using the 
new/better PREFERRED_RPROVIDER syntax.

[YOCTO #5044]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 5801b67..b2548e1 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -46,10 +46,8 @@ PREFERRED_PROVIDER_nativesdk-opkg ?= "nativesdk-opkg"
 PREFERRED_PROVIDER_console-tools ?= "kbd"
 PREFERRED_PROVIDER_gzip-native ?= "pigz-native"
 PREFERRED_PROVIDER_udev ?= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','eudev',d)}"
-# There are issues with runtime packages and PREFERRED_PROVIDER, see YOCTO #5044 for details
-# on this rather strange entry.
-PREFERRED_PROVIDER_bluez4 ?= "${@bb.utils.contains('DISTRO_FEATURES','bluetooth bluez5','bluez5','bluez4',d)}"
-PREFERRED_PROVIDER_bluez-hcidump ?= "${@bb.utils.contains('DISTRO_FEATURES','bluetooth bluez5','bluez5','bluez-hcidump',d)}"
+PREFERRED_RPROVIDER_libasound-module-bluez ?= "${@bb.utils.contains('DISTRO_FEATURES','bluetooth bluez5','bluez5','bluez4',d)}"
+PREFERRED_RPROVIDER_bluez-hcidump ?= "${@bb.utils.contains('DISTRO_FEATURES','bluetooth bluez5','bluez5','bluez-hcidump',d)}"
 # Alternative is ltp-ddt in meta-oe: meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
 PREFERRED_PROVIDER_ltp ?= "ltp"
 PREFERRED_PROVIDER_getopt ?= "util-linux-getopt"



