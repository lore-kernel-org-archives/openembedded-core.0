Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id DFB7C74820
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 10:03:34 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id a13-v6so12774176pgu.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2018 03:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Mu42EDGq2he0LOvtfZ5FPJlwKeQZ9lNATBesNJGTdUQ=;
	b=Bu4dKYeF2S/fDU4QeikfZc+wCfS8tZSQUEE9sLnF6qEIZQz0JLzPbPJoarwleKwvgZ
	0LhaSJ5T0sln4nr7MSpENCH2lfhR8Pf+3Vgd3e0EOcwMzobCZpwh1CoTHs27bq5U37yN
	JOnWElq6UOJCxcFRzbYBnXXtRQ7fvdOhoUAw0er/zeXtNcvC9rZCPAqCObv2w294+1Gf
	i5GgnX0uRSX0Jo0zcdqlDoT3kFv9jSL97q2iMbXfj5mDhutrGcNEivxxrBg53m+G/Zx0
	JMLpc98+gywE8zEXJ9+KjnuKGSXGsdhVAjJOYpX/DoH63D6Me5PQuvlH82oy2aFqxGj8
	O73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Mu42EDGq2he0LOvtfZ5FPJlwKeQZ9lNATBesNJGTdUQ=;
	b=HWdU7IlKHCYBtB5ADOLv70J2Q9Huyecg4VQ1zm798INqFloe5PpiTFSOIkmdLWITzR
	PvRzgQsOqcyG7b1YAh2B7MZFvT9KVhVS9/5rV2KWVmFKBk9CTE55FxPvkOS7cAwYVut6
	MBXLjPwyhyDXTjtK2DYWSBUUz97PGcHEPBU8krgT1p08v+6hxsL+wSQ4H1dxa2e/zMuY
	sbVG75n1s0qLX1CWysRf6gtDdlQRft6ryzOFX7x7b4tDyeCdYm1Lvnmmt/3rAtM+I98T
	3BUZqi8oWgsbsLTgYtYIkJTG9IWGSwdJnl3ouK5s7ChAA0QjPwnqazkHd3GXZHkr01cF
	n3wQ==
X-Gm-Message-State: ALQs6tDKrx8tIwb5y8v9pccS+PKd6L5PZIP7aQ098yOOrxRDePT7X26C
	m/q312Jrytn2ZmMWYu3CuJ9wtw==
X-Google-Smtp-Source: AB8JxZpY9vW99XMAKQvsXKbth4TSnBfgpod09YMj1Tq0MoJfqZKX5WHGQ6kRqiWhLvOA4u43B4fNEg==
X-Received: by 2002:a17:902:9886:: with SMTP id
	s6-v6mr23120232plp.380.1525341815684; 
	Thu, 03 May 2018 03:03:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::52a0])
	by smtp.gmail.com with ESMTPSA id
	r30-v6sm23890856pgu.17.2018.05.03.03.03.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 May 2018 03:03:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2018 03:03:26 -0700
Message-Id: <20180503100326.32797-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] mesa: Define PYTHON2
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
X-List-Received-Date: Thu, 03 May 2018 10:03:35 -0000

Ensure that python2 is not assumed to be python which can
point to python3 in some cases, when building gallium-llvm
there are scripts which are requiring python2 and wont work
with python3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 0a4cfc25a5..9bddb7acef 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -35,6 +35,7 @@ export LLVM_CONFIG = "${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE}"
 export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE}/llvm-config"
 EXTRA_OECONF = "--enable-shared-glapi \
                 --disable-opencl \
+                PYTHON2=python2 \
                 --with-llvm-prefix=${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE} \
                 --with-platforms='${PLATFORMS}'"
 
-- 
2.17.0


