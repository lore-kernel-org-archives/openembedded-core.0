Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1759.1795712105027048666
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 08:55:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ItBFt6K5;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3ada81853so8385307c88.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 08:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795712104; x=1796316904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lFxP6S53zeQKn+vSwAsJCh5+0Bj0P7P+VoMGzAC2mNA=;
        b=ItBFt6K5wuqPimiwFCAut8VxWQPlfKaA+XSKR2UMUHbC34/NPDS+YgTjEOecuN23Cx
         y+WfGs5XXIh2i9sQEvVHTzbIkrRWBPrX1WRXUylYatmweSO0ikmuG1IoNQ0PqQE0k+KX
         ugweZN89nwlvv3gcuI51g5Qk7PGMfEzCbcjRdeUJaf3hz5atV5WT8gAx5Q1fB2O5Bmkl
         +SLUCChZ/PZGo8PAIVwKj2cpZ4QbnlcRLu7vWmLdcHZy0FmNElC5CCZzLVPt6FCGVwlA
         Vp/HCZ0YPeiKog/D5FVsre944QriPXUviB6bIHAmb1HGNtieeFqoCh/1gbmopm4790bS
         65GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795712104; x=1796316904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lFxP6S53zeQKn+vSwAsJCh5+0Bj0P7P+VoMGzAC2mNA=;
        b=nX5jpBvoncfDLdnZByVzD1PIRx/Seb0XXbuEoXcZ2gBGRTITHmJ12aYbl7PCWl1pNy
         0dKzprykRg17IHMncj+e+PZMAY+FE596NLg2KpZ0KMju8OV3ZAmVe6HbPfHFzv3KkPfu
         caiLrmXUoobtg8/jFAQAWc5AIyjToccVVzFd4mQwiOSWO5BWkfU1rRqsWKJnQ5Ox5ghO
         ijumS1CI83YktU88SWfebsZZYS3IAsP0bj4RATCCJk067SoaH2E7tkeqfB/EKrDQhQAN
         6rMtZAYc2MDUk1swVvXfaZGYB+bQTuL7WR3Pzy4iR3LYBs4fZpToh06aBNdx9ycMfyVX
         pdIA==
X-Gm-Message-State: APuU4Z9j6xZdmnw2rjig72alLSGxMrIo38DvPs3X2ULygVqLFb4Z2wj1
	sr8WNqa0+qxpFGKFri+xH9sWO61HfrtQP2WlGMjQN0nYvwbsoNacKPHO4J+uS+L8
X-Gm-Gg: AZFdTZfHuhBz5fOALSn8loVdXP7t4LzB35IrN4MGr+FFliaIry8OkPPcmeZPn0Xxo96
	R/IrNGeFE6xiozhLqzOkSNYE+6yAGyAfafo5iM/oEfGKF5awiggsLmk+AWDsfv2aNVtUcKoXuMA
	4uJvKWpkaPjAypzcxQU+8qqKMSBbk5gfOUKTJnUYTkm6eI/w6oEEl+JZOrWUz6ynmvCySDnmFZz
	GFG4cchOfdL0chUduN6PLzSx6VdKoOC2Ckiq2OyS+tG7A3k9CUtmhvEIDil2SdBzQ1IHlmO1wvi
	4wF/6mTn5bKGwuXljlBNaoqHcnG3y4nquHgQARwZ6K1hl2ue4oLeAUj6EoCa14rASD6C3zvO2e7
	IY9gTrn82mrfajOc8JF2LsSIhWlFZofUmBYffPeXKkOl0pOgKtuvqfbkxy6PmdS+PhMH8nFKAoN
	FTzBAMkA29HSQa6i67WK8BdoRQAmeCvinoQDyngIs6Ko1B29/vo/kc/0Nk08QQvMv47WsKsDAxG
	yQQN2S7eC71EGGSY0cnjYVor+zTjdJhpnSY2Y+f3DH45UbP+AaMA5VeA3J/GVdGS17yQHGtG8xE
	4bnk6m4NnjlJDkRqqFXsRw3TgA7lUZph1kn3LuH1cDBmG4IZNW/Wv6oSOyrCqeCNLWREQl54+Sa
	FapNWWub+baSxylnG6qTp+UvI5MKggvT3NK6K3JywP9xFXbHOJbeIcFJ5ICLA1Sa8asUThLrSBy
	TB0y2z7sEfD1YC87S96an/hNkOD1FLfiKYMcg/qAn5Qhkj1MxNvGbyFLtrgd6J0HDNA3CozPE9Y
	p+IR3mxGJiob8y6P57itZwpMrSQpzCUaGnHX2Lcukn2IjJ0ywDGAwK1gIbKvRjuvp+NmTw1ibp0
	EuFE
X-Received: by 2002:a05:701a:ccda:20b0:1b5:9075:232d with SMTP id a92af1059eb24-1b590752372mr2581116c88.29.1795712104348;
        Thu, 26 Nov 2026 08:55:04 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm49537124c88.2.2026.11.26.08.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:55:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ross Burton <Ross.Burton@arm.com>,
	Paul Barker <paul@pbarker.dev>
Subject: [PATCH v2] packagegroup-core-buildessential: Add clang with clang toolchain
Date: Thu, 26 Nov 2026 08:55:01 -0800
Message-ID: <20261126165501.1623033-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 16:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251324
Content-Type: text/plain; charset="utf-8"

When the target is built with the clang toolchain, python's sysconfig
and perl's Config record ${TARGET_PREFIX}clang as the C compiler, so
anything compiling on the target through them fails when only gcc is
installed:

  FileNotFoundError: [Errno 2] No such file or directory: 'x86_64-yoe-linux-clang'

The target clang package installs the ${TARGET_PREFIX}clang symlinks.
Add it to packagegroup-core-buildessential

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Cc: Ross Burton <Ross.Burton@arm.com>
Cc: Paul Barker <paul@pbarker.dev>
---
v2: Drop anon python from ptest.bbclass, it slows things down

 .../packagegroups/packagegroup-core-buildessential.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
index 2cd67ad05f..d33af54d26 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
@@ -29,3 +29,4 @@ RDEPENDS:packagegroup-core-buildessential = "\
     pkgconfig \
     "

+RDEPENDS:packagegroup-core-buildessential:append:toolchain-clang = " clang"
