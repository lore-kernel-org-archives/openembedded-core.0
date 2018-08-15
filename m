Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 98F3D79101
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 20:43:48 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r16-v6so2182439wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 13:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=lJiAUPD+P2oNKu4YUNwogrgdHTCGrnaGjWVWgT0Iem8=;
	b=OsHC1o04CbX19z35nshMe1Hw2P1d6XhRSzMAneAqU8JfoUtZdOyqPnGUsdCOtz2WWq
	0TrbzRogrJiS2HXiT0xV8saDX4Tx/jyiyqL7FHFk3d7vu8srqPOj4PKVfmkTaL6Q5NT6
	GK66D3JwWQuYj7pJRmU53ic6nywQzeQLp1LbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lJiAUPD+P2oNKu4YUNwogrgdHTCGrnaGjWVWgT0Iem8=;
	b=IncFYNE5TWFZRhjTARmGlP45NqmR/55CiyesLodH7KwBH++w6alPWbMzeX3gYljyba
	mhdDspSxpHcSFDUJ3Jhu57dQBjglw/9SB5umwyAlznR4L8ryk3FkJLRg4zpCF7rHp/RI
	VXW7Mr4gu3OkEmXP8lkOH8yZmyiCwl3wLYLT4vqgebMhLNCckIGxtRiUcwNzXpS+NJMP
	P5BpCMEr0ilZEP9jXebKDQlm/CcFv1oNlYAgVGoYhdAbOCLsYpTIopH6GjxZaCNnzuxm
	UNiS+HUmobgDLjLIxrBhRWn+wcSJCcDgwvZDELWTOf+7eL2aF7BCWwhQ5IFfoyx2jy0K
	bnFQ==
X-Gm-Message-State: AOUpUlFcepIMrZOMRYdfWmEJ0fMihkM/Gxm91V00slChk1Zl5BRhnSpI
	9i6Z+DzniQFfxI8k8cLGG5yNKMX+upI=
X-Google-Smtp-Source: AA+uWPw8TnBx1yUe21kd+h66B8g/MJl5XO7nlWw3QWCD0vq88wTLr1y0fw6r3fqdOl9LIheCkY9zmQ==
X-Received: by 2002:adf:adc9:: with SMTP id
	w67-v6mr17331302wrc.135.1534365828994; 
	Wed, 15 Aug 2018 13:43:48 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b22-v6sm2113045wme.48.2018.08.15.13.43.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Aug 2018 13:43:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Aug 2018 21:43:47 +0100
Message-Id: <20180815204347.30892-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] acpica: Add missing DEPENDS on bison-native
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
X-List-Received-Date: Wed, 15 Aug 2018 20:43:48 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/acpica/acpica_20180508.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/acpica/acpica_20180508.bb b/meta/recipes-extended/acpica/acpica_20180508.bb
index dfa9a18ccb0..b5c89fafc59 100644
--- a/meta/recipes-extended/acpica/acpica_20180508.bb
+++ b/meta/recipes-extended/acpica/acpica_20180508.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://generate/unix/readme.txt;md5=204407e197c1a01154a48f6c
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-DEPENDS = "bison flex"
+DEPENDS = "bison flex bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
            file://rename-yy_scan_string-manually.patch \
-- 
2.17.1


