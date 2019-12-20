Return-Path: <fdk17@ftml.net>
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
	[64.147.123.21])
	by mail.openembedded.org (Postfix) with ESMTP id A017D7FD86
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 11:21:21 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id A962C42C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 06:21:22 -0500 (EST)
Received: from imap7 ([10.202.2.57])
	by compute6.internal (MEProxy); Fri, 20 Dec 2019 06:21:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ftml.net; h=
	mime-version:message-id:date:from:to:subject:content-type; s=
	fm2; bh=JVkfLGTCADdUwu/CBe0OEJMTa8K529i6DJpLq5lpOsk=; b=4SiE/X/u
	sahChMkSgmtX5axLbmPwsFPXzKqkntue7G94MgYjcS0jQsR3tXAsji4RrI9tMroU
	dyLWojox3Ado1ow3hYDwkjDdhi+suTaDdlfBCqIrpqcm2eZHxx1eou68jDUgt7Gn
	exQ+k4TahHvYrPXfjAk8sIqIZ/bYERI7A7Z3FTk/YIR90qcqkqbbiVgD8qVDM7AG
	uie3ZV5h20lr3JNbzIjMaK5g1FByzxX9YXIAKz4IPFdrS/WmH4DM4MFVNBX1gZ+R
	fUH29BfcU8Pu/Dvbsl8qk0OaOlIANsSle92xz0/5Sv60JG8moyYK04YhuFueY0ES
	4B18SS8CCE0Aiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=JVkfLGTCADdUwu/CBe0OEJMTa8K52
	9i6DJpLq5lpOsk=; b=Uya3b73ItqDjVfu2zcK99PuAa8XWGPNo3/EMWPWfmAPpw
	QqtohdIHksGMZZKSig+pN9JlSLyWSi09ppdxn2eHuEytEPZjyNN603xcXFUPwQVN
	rvQHqGuB9NscJ2pQDlRuH2A8CAZJXntuilYmTm2lpb9uwcR8gdem4fK03d9jMMRw
	Nb1IkX1zCXr4SQeGyPBSY76A3pGP7gkm0JQqCJ5YOZV16t69p541g3wrBGAqh9ym
	nVWo/OzHPE7EpnFhWaDcR9rwRAdLa3xBvEu4R6/G7fiOQAFppvKXXGqIeODbcJOT
	tIDnafFoB62XZHCKdIT0u3DIi/MbxyyeQZBeK1c5Q==
X-ME-Sender: <xms:sq78XRvLz_VL7LrKyN_J8voYV0R480p-pKo9HpAb2VgGlr44gLZl1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddufedgvdehucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsegrtderre
	erredtnecuhfhrohhmpehfughkudejuceofhgukhdujeesfhhtmhhlrdhnvghtqeenucfr
	rghrrghmpehmrghilhhfrhhomhepfhgukhdujeesfhhtmhhlrdhnvghtnecuvehluhhsth
	gvrhfuihiivgeptd
X-ME-Proxy: <xmx:sq78XWKMeg1OuYw2X6_CIU24teKMtf9j3cVYd147qPwce6iabVuJvA>
	<xmx:sq78Xfcq7tkrGT5Tdjq8TkOAz-kLyXjH_5NcWrqqdlmxAlEo2EtYJg>
	<xmx:sq78XZJ84GB3G6ZMQ5ZUoxWTK8oSUiMIoFo9GF4OOyh3U-pQwPVd2g>
	<xmx:sq78XZb4WaUaUSeYg5AMPUCk8oon2pPBAUEGOSsn9uKI4LvzTyoscQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0E72D1801C3; Fri, 20 Dec 2019 06:21:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-694-gd5bab98-fmstable-20191218v1
Mime-Version: 1.0
Message-Id: <90324de7-7fd9-4861-bfe2-6f897e45607b@www.fastmail.com>
Date: Fri, 20 Dec 2019 06:21:01 -0500
From: fdk17 <fdk17@ftml.net>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa: Allow building the virgl driver to be configurable
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
X-List-Received-Date: Fri, 20 Dec 2019 11:21:21 -0000
Content-Type: multipart/alternative; boundary=3ceb8cefbd1349d199269e370784be30

--3ceb8cefbd1349d199269e370784be30
Content-Type: text/plain

From 0a572f757f3d1d1c0e47a452cb4098ee7c228edb Mon Sep 17 00:00:00 2001
From: Fred Baksik <fred.baksik@mrcy.com>
Date: Thu, 19 Dec 2019 14:16:56 -0500
Subject: [PATCH] mesa: Allow building the virgl driver to be configurable

If a .bbappend file sets GALLIUMDRIVERS then virgl is always being
appended to the list of drivers to be built. Make virgl an optional
component.

Signed-off-by: Fred Baksik <fred.baksik@mrcy.com>
---
meta/recipes-graphics/mesa/mesa.inc | 3 ++-
1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9e5808ee27..b03df65c69 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -119,10 +119,11 @@ GALLIUMDRIVERS_LLVM33_ENABLED = "${@oe.utils.version_less_or_equal('MESA_LLVM_RE
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

--3ceb8cefbd1349d199269e370784be30
Content-Type: text/html

<!DOCTYPE html><html><head><title></title><style type="text/css">p.MsoNormal,p.MsoNoSpacing{margin:0}
p.MsoNormal,p.MsoNoSpacing{margin:0}</style></head><body><pre class="u-article">From 0a572f757f3d1d1c0e47a452cb4098ee7c228edb Mon Sep 17 00:00:00 2001
From: Fred Baksik &lt;<a href="mailto:fred.baksik@mrcy.com">fred.baksik@mrcy.com</a>&gt;
Date: Thu, 19 Dec 2019 14:16:56 -0500
Subject: [PATCH] mesa: Allow building the virgl driver to be configurable

If a .bbappend file sets GALLIUMDRIVERS then virgl is always being
appended to the list of drivers to be built. Make virgl an optional
component.

Signed-off-by: Fred Baksik &lt;<a href="mailto:fred.baksik@mrcy.com">fred.baksik@mrcy.com</a>&gt;
---
meta/recipes-graphics/mesa/mesa.inc | 3 ++-
1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9e5808ee27..b03df65c69 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -119,10 +119,11 @@ GALLIUMDRIVERS_LLVM33_ENABLED = "${@oe.utils.version_less_or_equal('MESA_LLVM_RE
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
2.17.1<br></pre><div><br></div></body></html>

--3ceb8cefbd1349d199269e370784be30--
