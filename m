Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
 by mx.groups.io with SMTP id smtpd.web11.5943.1588858413411331212
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 06:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=hWRBxHOU;
 spf=pass (domain: pr.hu, ip: 87.242.0.9, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1jWgea-0006j3-0G
	for openembedded-core@lists.openembedded.org; Thu, 07 May 2020 15:33:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=i0PiZHCAjW7U7iiYwX5uAvGy3d1+kssZAvDSqwvLxdQ=; b=hWRBxHOU46//u9AaGUiYfm5HDY
	ribUrF54ROzVFoqra3txabjf9DpEcN2svEtzbR3jUvL+vWNKsiiHmfFvJ8qY69Y2NsIPwGfExuE5X
	ohRfBIXGKqEf5EQTSBWtNhMvFmOdwj2woK0BnmDU0HhwwLFW919uu8Qg1i/8SEyNQMXpMcWddvZGo
	8YzDzRn7bAEcX4h7PMk2tx9kRgVcT/2VSP1K6Q4+12vkGkEB91nxS9dzEusB4MXveCZwEY41KOMlI
	Amrn1I3fayiC1MDdSW3JEsSBhizOYJSauhVlvEgQJwIlJ6f5RgIdhukpOMsMaKTaAGAl+GHEa4FSH
	ecWoV2Qg==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197] helo=zolilaptop.sicom.com)
	by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1jWgeW-00055M-3v; Thu, 07 May 2020 15:33:29 +0200
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
Subject: [PATCH v3 3/4] mesa: Add PACKAGECONFIG knob to enable VAAPI
Date: Thu,  7 May 2020 15:33:00 +0200
Message-Id: <20200507133301.4336-4-zboszor@pr.hu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200507133301.4336-1-zboszor@pr.hu>
References: <20200227052448.65435-1-zboszor@pr.hu>
 <20200507133301.4336-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Scan-Signature: 9c5e05eb7b369c1b31c27083e129340a
X-Spam-Tracer: backend.mail.pr.hu -1.0 20200507133329Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The previously added libva-initial recipe makes it possible and
trivial.

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
v2: Small explanation in the commit message
v3: Rebased to current master

 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index f59503bf14..7a889a5b11 100644
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
2.26.2

