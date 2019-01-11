Return-Path: <paul@betafive.co.uk>
X-Greylist: delayed 597 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 11 Jan 2019 16:54:49 UTC
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 5BF0A7C16C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 16:54:49 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 50D7B21EAE;
	Fri, 11 Jan 2019 11:44:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute1.internal (MEProxy); Fri, 11 Jan 2019 11:44:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id:in-reply-to:references; s=
	fm3; bh=WbGiC7hkFextmyhU9pPbL72AAfBIcIcP9lsI9aMELhI=; b=o1G000ef
	i5JnVWS0uL5E3RbDH8yxx5PYOdxVMiuRZEBSTkc/litdUEoNABMHWRWUUiQ5WI5s
	2gDwoOB1jo3oYoiR7uepUPKHflzKFsdav5+uVVabLdYPSF3PDpenhBaWauGWEq2K
	5pfIeoKg5GOTBKKl6pFN5lK0PC1DyrzoLLKWykbw5zSKcICZ2Ie9JZnwyALMECW0
	+DLe1SJR9KqNWhtbBBZOgtDWjcY5JwQk+feyg2UGfFet6C7hqz0NZ+axnaQRnPvj
	10rLmksp/L67wZK0e99k2aRqZlFjoh0/iqTw15Beo11IW8QjbR6ZgESw/303+Ksj
	hW6XfTffHSpy/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=WbGiC7hkFextmyhU9pPbL72AAfBIc
	IcP9lsI9aMELhI=; b=QTikmmxUAPnn9ecMtYW8Vopo4qmR2kHruYb62NEdTBrM1
	CD319XY+J4Zv9TH7hYigcCyM6BFgBe9AzCilOF6QrYcyFTEtNiooUZVa3G0HKJcN
	xhMmdcUhMdQ0Ym+Ajs7Uv+iRhW9aRu20kJfdgs3wPJ1QEUrL1hxNWW+BYUdM+xeE
	t4idu3R62aUQ32+vveNdIO5ZWOzwvcmBZ9ayqMS40aUVESxDtc+TpMWWVJEt18cs
	6xWcy6rlOKuaqp8FNjn+j0mg64Y1yFU8/c3+p2H3baCtLHWoFNyMcILzhiO8Gzbi
	z5PFqA1ayHPPqcktY1KyO2X9PfKMkXhFnrEKSY1dg==
X-ME-Sender: <xms:BMg4XCpnt8-7-aafegFVOT3ac3dmkKV_mcNgyzcP7c74Tf5ugeVSuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrfeehgdelgecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
	tdenucenucfjughrpefhvffufffkofgjfhestddtredtredttdenucfhrhhomheprfgruh
	hluceurghrkhgvrhcuoehprghulhessggvthgrfhhivhgvrdgtohdruhhkqeenucfkphep
	keekrdelledrvdejrdelvdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsegsvg
	htrghfihhvvgdrtghordhukhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:BMg4XIBu0_dsxRT_MtRhZ8J7QPya7FQXqTUz-_VBBilKAbLeZoeIsw>
	<xmx:BMg4XDNavMqb2U7hBYKgExV0OWIYVbB4x67TmlDZgHlcLt2RND9D3w>
	<xmx:BMg4XLjOxd9JXXec0BdPBJLIMS7sLue_qhuNvQj0yKGrACTaGifgpg>
	<xmx:BMg4XOx_abrVHl3IGwzEaxRk6xT8_AkP5ulPb-_HjgQdP7kR7tIwow>
Received: from eng01.s01.b5net.uk (unknown [88.99.27.92])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8DE5BE455C;
	Fri, 11 Jan 2019 11:44:51 -0500 (EST)
From: Paul Barker <paul@betafive.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Jan 2019 16:44:38 +0000
Message-Id: <20190111164438.19749-2-paul@betafive.co.uk>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190111164438.19749-1-paul@betafive.co.uk>
References: <20190111164438.19749-1-paul@betafive.co.uk>
Subject: [PATCH 1/1] [RFC/RFT] sstate: Shorten file names in sstate-cache
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
X-List-Received-Date: Fri, 11 Jan 2019 16:54:49 -0000

With the recent move to using sha256 checksums in sstate, the lengths of
some file names can now exceed the 255 char limit seen in most Linux
filesystems. When this occurs, bitbake crashes as it is unable to create
the sstate archive or sigfile.

To avoid this issue we need to shorten the length of the file names used
in the sstate cache. We can remove the 'sstate:' prefix as these files
already reside in a directory which only contains sstate files. We can
also remove the target triplet (set by the expansion of
${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}) as we also have the
package arch later via the expansion of ${SSTATE_PKGARCH}. And for
simplicity we can replace the expansion of ${PN}, ${PV} and ${PR} with
${PF}.

With the above changes we may still get bitten by packages with
exceptionally long names and/or version strings. To avoid this we limit
the length of the expansions of ${PF} to 100 chars and ${SSTATE_PKGARCH}
to 32 chars. Allowing a further 64 chars for the sha256 hash this leaves
about 50 chars for the task name and extensions (in the worst case)
which should be sufficient.

Signed-off-by: Paul Barker <paul@betafive.co.uk>
---
 meta/classes/sstate.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index da0807d6e9..987218afaf 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -8,9 +8,12 @@ def generate_sstatefn(spec, hash, d):
         hash = "INVALID"
     return hash[:2] + "/" + spec + hash
 
+def limit_sstate_frag(frag, limit, d):
+    return frag[:limit]
+
 SSTATE_PKGARCH    = "${PACKAGE_ARCH}"
-SSTATE_PKGSPEC    = "sstate:${PN}:${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}:${PV}:${PR}:${SSTATE_PKGARCH}:${SSTATE_VERSION}:"
-SSTATE_SWSPEC     = "sstate:${PN}::${PV}:${PR}::${SSTATE_VERSION}:"
+SSTATE_PKGSPEC    = "${@limit_sstate_frag(d.getVar('PF'), 100, d)}:${@limit_sstate_frag(d.getVar('SSTATE_PKGARCH'), 32, d)}:${SSTATE_VERSION}:"
+SSTATE_SWSPEC     = "${@limit_sstate_frag(d.getVar('PF'), 100, d)}::${SSTATE_VERSION}:"
 SSTATE_PKGNAME    = "${SSTATE_EXTRAPATH}${@generate_sstatefn(d.getVar('SSTATE_PKGSPEC'), d.getVar('BB_UNIHASH'), d)}"
 SSTATE_PKG        = "${SSTATE_DIR}/${SSTATE_PKGNAME}"
 SSTATE_EXTRAPATH   = ""
-- 
2.17.1


