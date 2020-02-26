Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id DC6396131F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 14:12:24 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1j6xC7-0006qw-Lp
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Feb 2020 14:57:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ry7pll3qarcvMuM7+jGiDZ8vyjCInAAUxaDs/d90i84=;
	b=UsU5Lx1hk5XEzW9EMT7ftfPM/5
	HNPqPnkcr038heMliUgM0uKG82uaqbEh2EF2jRLnYp5VKGPCtHyIBxKEb0Ahihlqx0IrSTf4snybL
	9QwgaNHdeBESwvpT31tl6widW6i+UYCSuGcSTSRXmrQnmG4Or7W3RyVoySwi0WfBcGjnl8TT9xZfg
	6w+QL0w8UfeB3TWRAmV22LcMDukXY5ERG64Vd+CAErkb3GNGXeHaKxsB1LvAXi9EZgxUxs+/NFDpi
	OMy1cIHKrZe9ZpNvIGFtE0acdQ8Kham00tTT0SW8CEaXNUl6ctJJMiSOtMpKMz8dwFwhpe1f9jHG0
	T+E9M/Zg==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1j6xC3-0007hR-PA; Wed, 26 Feb 2020 14:57:45 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2020 14:57:14 +0100
Message-Id: <20200226135716.49255-3-zboszor@pr.hu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200226135716.49255-1-zboszor@pr.hu>
References: <20200226135716.49255-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.9 (-)
X-Scan-Signature: 35da33d425e5fc86b4edf4ddc57b6065
X-Spam-Tracer: backend.mail.pr.hu -1.9 20200226135745Z
Subject: [PATCH 3/5] mesa: Add PACKAGECONFIG knob to enable VAAPI state tracker and drivers
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
X-List-Received-Date: Wed, 26 Feb 2020 14:12:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
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


