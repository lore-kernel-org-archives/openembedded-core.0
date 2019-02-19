Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6D7687C9D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 17:47:27 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id d17so8530111wre.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 09:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4pIXHV7tbcTdFiO/1aykTXwNvdfkGr1trrMAyk4iL+M=;
	b=Fq2SqfkdRNzgdt97rkVRuMUxiz1keCtS6ZP76e1FxU0kw5yelgQY3jx/WX6H042oQw
	PCHxlcjkzPK6SG50EYM+RLpKVYXGnvz2hIerJ0740muffYtJogcQ3b4LOACuQfy0oE+Q
	/fVRwNs68byvIegvwiD3Ps1ZwuibjT5i32gcU3i3HdRAoGnH8DxQ24dS02hZ7WC8E3Ca
	6t/gKkdb6is1COJEl8w3QXVLYuph5ScB8Fz9vUnm6X/WRs69FHsJAPnB/Vnh+NYSjEGR
	RFgq43zIdHSGr+6uy5CcYFiGe4q1UTwufrce+zsfEL8RFwDpfOp5OSwliADCOTWc3i3I
	blkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4pIXHV7tbcTdFiO/1aykTXwNvdfkGr1trrMAyk4iL+M=;
	b=awI9T1mlrhvPz72C61o4oqnLth4jp1PJGJEP46s+mtK43VVN651YlOL8uBjDwyf74g
	xq0A6LZ1LOlF4jz386yde7zLbaAuIEVh5GiKaEVvIgFJCAwZFGe8k3cHHBBL+vZNf42g
	qCdJxrEbjzaFYZkmEF52P9syr1VP3+C5OiKKBx35qtExfvlvxM2sb7WbhbtZMbnRNOG0
	hpsvq1sUMwxhJAHQo2pdlkGSOC1FcglhNAUrxN/BeuKRjfPUzBu1TAfexT+d8+0K36o+
	72pvFdIaWnQQjPRQkNMxOIWhvRC4vXus34nlv4/NBWzHP2Jl9FDuScMqdf385GvVMaws
	wiVQ==
X-Gm-Message-State: AHQUAubnk4Aca/RarpiUrcO2N0jx/z3ImEfdkOQEeZ6c0mfc4Ika3tcm
	5egY7Aft/hwecDreOIWkmGkoBYCQ
X-Google-Smtp-Source: AHgI3IbzvuNyxN8npcw3kdD1+gv57FTylY5z4GrlIEKajQEmJv0+/+S0rjbbmpf5+3zSVsEeno0jcQ==
X-Received: by 2002:a5d:4e43:: with SMTP id r3mr22237781wrt.162.1550598447949; 
	Tue, 19 Feb 2019 09:47:27 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	z15sm2006684wmi.46.2019.02.19.09.47.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:47:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 18:46:59 +0100
Message-Id: <20190219174712.60694-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219174712.60694-1-alex.kanavin@gmail.com>
References: <20190219174712.60694-1-alex.kanavin@gmail.com>
Subject: [PATCH 07/20] p11-kit: upgrade 0.23.14 -> 0.23.15
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
X-List-Received-Date: Tue, 19 Feb 2019 17:47:27 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../p11-kit/{p11-kit_0.23.14.bb => p11-kit_0.23.15.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.23.14.bb => p11-kit_0.23.15.bb} (97%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.14.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.15.bb
similarity index 97%
rename from meta/recipes-support/p11-kit/p11-kit_0.23.14.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.23.15.bb
index dd25c381329..59e675b5428 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.14.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.15.bb
@@ -9,7 +9,7 @@ DEPENDS = "libtasn1 libffi"
 SRC_URI = "git://github.com/p11-glue/p11-kit \
            file://0001-LINGUAS-drop-the-languages-for-which-upstream-does-n.patch \
            "
-SRCREV = "3770793f026e46a000d2d8816d56122598289d5c"
+SRCREV = "1ba80c67c492f25581ed97c8c31ffb5f20636d06"
 S = "${WORKDIR}/git"
 
 AUTOTOOLS_AUXDIR = "${S}/build/litter"
-- 
2.17.1


