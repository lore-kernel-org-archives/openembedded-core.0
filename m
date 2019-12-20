Return-Path: <fdk17@ftml.net>
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
	[64.147.123.20])
	by mail.openembedded.org (Postfix) with ESMTP id 03D857F47E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 13:02:00 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 09CEF715
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 08:02:01 -0500 (EST)
Received: from imap7 ([10.202.2.57])
	by compute6.internal (MEProxy); Fri, 20 Dec 2019 08:02:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftml.net; h=
	mime-version:message-id:date:from:to:subject:content-type; s=
	fm2; bh=YCUb1z8RpY5tN33e5LdTseWTKZmN4BBp5Upri6RX4eo=; b=S49hwCpf
	ba5iSL3UOwUEMH9ownAlYuhI1vVlUY5mYXMgnjQCaFqK1x2xoSyBCAHtYDlm92r0
	mQ/XhXRfcTEAhXCEqiMc9WiLZSCTgQXwLVynmfHO21I1BN4V7oUGxXAXZZIbMQuo
	3Xv49gqRyXsZxOkKrqD9jheV99L4Bgd6mW0zVpl/FBTWnErvhNZ2tgGGV/JvGIbW
	20nzxfqTqXYi2WW8MecbCDN6wB1wO2ZkLYUUPNjmjSx2IidDJQB3VUN7ier3CwOP
	RMwz4B2JlPgRipOKXnIgmCBjrDk/xhKzFO4RwRLognV1ZhJ88gL+1SrAfeKw6RJZ
	/Zq5RMfp8FZXbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=YCUb1z8RpY5tN33e5LdTseWTKZmN4
	BBp5Upri6RX4eo=; b=xDAw4whvGxcmQlIc8GVgtD7F6P8HuMDbeEqTDO898hkWL
	gI5GttcM6ffOhvSz64ofxfMVDVPy6yHBciFaD6nyE64cgtm0e8y4TMqd7fg0cnrJ
	SAPZmzY+aEq4hC3gU5H+wkRVeHbrmEQ1VnzzSwJ4gTk/ks/ZWAYCtag8FIeaJd1+
	y9Pk9N10djrmhEKhPLRF8eicx7caGDo8NHK1Xoy+FnvW4xKLlsOLr2GCaibljjuf
	8ryyEbBCqdKTMVtEnUqpmqdmjvgvvAnSvVwnDenM2AaLQSM79QMMlDFS0x08ugHi
	Dl8YdCv3MKC92EO3/HtgYGp+gtS770f0W/cXErOaw==
X-ME-Sender: <xms:Scb8XTDJmevafa1Zccw3-PZzHvLLoF0ghD5zspmTyOBDonU-Ssduyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddufedggeehucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
	erredtnecuhfhrohhmpehfughkudejuceofhgukhdujeesfhhtmhhlrdhnvghtqeenucfr
	rghrrghmpehmrghilhhfrhhomhepfhgukhdujeesfhhtmhhlrdhnvghtnecuvehluhhsth
	gvrhfuihiivgeptd
X-ME-Proxy: <xmx:Scb8Xdy-oDQy3dvwNklRLNyFukL_GOoZdKFIHX7PtGrKlrkSLGudmg>
	<xmx:Scb8XZnYZVB0EgQCRmE8n8akv5YnR34R4YelUKT0C7xqaJOqR-rsfA>
	<xmx:Scb8XaG4ASYRfmGjm1RU4RfGZdSOkiylMbBfMdiu7vBPK2cReDEJBw>
	<xmx:Scb8XS5yk8Ghxc0fAF-_IlMKd35CXdJyo2dbFsuOXirbskY3EeSpww>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 560521801C3; Fri, 20 Dec 2019 08:02:01 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-694-gd5bab98-fmstable-20191218v1
Mime-Version: 1.0
Message-Id: <15ff3b91-1597-453a-bf6b-53884da94884@www.fastmail.com>
Date: Fri, 20 Dec 2019 08:01:00 -0500
From: fdk17 <fdk17@ftml.net>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] mesa: Allow building the virgl driver to be configurable
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
X-List-Received-Date: Fri, 20 Dec 2019 13:02:01 -0000
Content-Type: text/plain

From 1085177146db3db7f156a951191e756fca28e863 Mon Sep 17 00:00:00 2001
From: Fred Baksik <fred.baksik@mrcy.com>
Date: Thu, 19 Dec 2019 14:16:56 -0500
Subject: [PATCH] mesa: Allow building the virgl driver to be configurable

If a .bbappend file sets GALLIUMDRIVERS then virgl is always being
appended to the list of drivers to be built. Make virgl an optional
component.

Signed-off-by: Fred Baksik <fred.baksik@mrcy.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9ad9f2e370..87f167c507 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -67,7 +67,7 @@ EXTRA_OEMESON = " \
 "
 
 PACKAGECONFIG_class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm dri gallium', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm dri gallium virgl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
                    elf-tls \
@@ -132,10 +132,11 @@ GALLIUMDRIVERS_LLVM33_ENABLED = "${@oe.utils.version_less_or_equal('MESA_LLVM_RE
 GALLIUMDRIVERS_LLVM = "r300,svga,nouveau${@',${GALLIUMDRIVERS_LLVM33}' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
 
 PACKAGECONFIG[r600] = ""
+PACKAGECONFIG[virgl] = ""
 
 GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
 GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600', '', d)}"
-GALLIUMDRIVERS_append = ",virgl"
+GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
 
 PACKAGECONFIG[gallium] = "-Dgallium-drivers=${GALLIUMDRIVERS}, -Dgallium-drivers=''"
 PACKAGECONFIG[gallium-llvm] = "-Dllvm=true -Dshared-llvm=true, -Dllvm=false, llvm${MESA_LLVM_RELEASE} llvm-native \
-- 
2.17.1

