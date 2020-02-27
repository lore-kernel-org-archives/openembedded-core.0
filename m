Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 2787061177
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 05:25:03 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1j7BfU-00078c-GZ
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Feb 2020 06:25:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ABLmarVXEZ45TMzwLCNth0gHSkcbc4ozACsYKk32Urw=;
	b=gSZG4GZo810LLPpfytjChmSwud
	Jef5vVXpegfz36mPHwLhVKWuYc16/yY3Z0k7hUQE4V7e2lx/Yaje/EFkhxIM4+M9clOB+sGXcefLr
	QtORowRAaoHMLxSxWOlyoPahDr98GvTp5gfuDqOKVLXn+E0AHfRPd+W2fA+8+1j71lOo+rtNOubA9
	5ckz5NINcqTccXdRmN0/jE+1Emdyq85F2tr/Y22inTTvgPmf0LSdMZop2Tu75hn5tIYA6S752dvOW
	MRcTwcY6nbAnWDMGaOovqYPjW8jCtL8yce7N707dAiNBq/fsZxmc6QHBtXIKWQRlHF05LauyDgzTp
	xkXUHTfQ==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1j7BfQ-00020C-Iq; Thu, 27 Feb 2020 06:25:02 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2020 06:24:47 +0100
Message-Id: <20200227052448.65435-4-zboszor@pr.hu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227052448.65435-1-zboszor@pr.hu>
References: <20200227052448.65435-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -2.0 (--)
X-Scan-Signature: 48655851012a525c67c379fb6cc9c196
X-Spam-Tracer: backend.mail.pr.hu -2.0 20200227052502Z
Subject: [PATCH v2 3/4] mesa: Add PACKAGECONFIG knob to enable VAAPI
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
X-List-Received-Date: Thu, 27 Feb 2020 05:25:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The previously added libva-initial recipe makes it possible and
trivial.

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
v2: Small explanation in the commit message

 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 87f167c507..479d3223fa 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -142,6 +142,7 @@ PACKAGECONFIG[gallium] = "-Dgallium-drivers=${GALLIUMDRIVERS}, -Dgallium-drivers
 PACKAGECONFIG[gallium-llvm] = "-Dllvm=true -Dshared-llvm=true, -Dllvm=false, llvm${MESA_LLVM_RELEASE} llvm-native \
                                ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
 PACKAGECONFIG[xa]  = "-Dgallium-xa=true, -Dgallium-xa=false"
+PACKAGECONFIG[va] = "-Dgallium-va=true,-Dgallium-va=false,libva-initial"
 
 PACKAGECONFIG[lima] = ""
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
-- 
2.24.1


