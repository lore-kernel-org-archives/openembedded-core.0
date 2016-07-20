Return-Path: <tanuk@iki.fi>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 3EFA5606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 22:10:10 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 719152039D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 18:10:11 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute6.internal (MEProxy); Wed, 20 Jul 2016 18:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:message-id:subject:to
	:x-sasl-enc:x-sasl-enc; s=smtpout; bh=cbbXj1hnqn7Ae3/ffywYPYhRJW
	k=; b=r0Ee91rbwBw0BgfC56RuYz1INAnnXERiNckZTKkTVOU0rx6v6qYO0ZROB0
	HxyTv7Z7qbKbLTcyRDBFsVA+Ia6Urs0Hlf9MFToOH2+gvYcZVSouQ6gnT8/OPNjp
	M53WbwlVuY7bdn9xS0BlNTKpZZwsIJTWpuRAmBo06xPWmq1Sw=
X-Sasl-enc: dO/MCBz40smRpTiU341GJPW8oHWfte83LRaogB8U2Q70 1469052610
Received: from laptop.tanuk.dy.fi (a88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8FC88CCDC1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 18:10:10 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2016 01:09:58 +0300
Message-Id: <1469052598-8081-1-git-send-email-tanuk@iki.fi>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] pulseaudio: fix floating dependency on webrtc-audio-processing
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
X-List-Received-Date: Wed, 20 Jul 2016 22:10:11 -0000

The webrtc-audio-processing library isn't yet packaged for
OpenEmbedded, but let's add a packageconfig entry for it anyway to
avoid problems in the future.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index accafe1..299982b 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -58,6 +58,7 @@ PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
 # able to use pulseaudio autospawn for root as well.
 PACKAGECONFIG[autospawn-for-root] = ",,,"
 PACKAGECONFIG[lirc] = "--enable-lirc,--disable-lirc,lirc"
+PACKAGECONFIG[webrtc] = "--enable-webrtc-aec,--disable-webrtc-aec,webrtc-audio-processing"
 
 EXTRA_OECONF_append_arm = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", " --enable-neon-opt=no", d)}"
 EXTRA_OECONF_append_armeb = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", " --enable-neon-opt=no", d)}"
-- 
2.8.1


