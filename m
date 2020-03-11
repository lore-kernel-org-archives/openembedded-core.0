Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 66A4561BBF
	for <openembedded-core@openembedded.org>;
	Wed, 11 Mar 2020 02:26:26 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id z65so404726pfz.8
	for <openembedded-core@openembedded.org>;
	Tue, 10 Mar 2020 19:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=itxXS39Y7irtdZ9Yq+wh7vT3nIOsp1vDX37jqweXW6k=;
	b=LylB1NNy2KAUb/av+aEDMDvc6OWaFERlwkrbrv6X8oFZRqN4pFq4E+Fg02vvqNovoD
	AaV5qX8cTjDKOQMy7xv6b0H3Bdxeqb1wXu3CD9oRBhXiuLugjRfRocjWVhqqX49EQIZs
	BEHM/Hwpns0uXyjsRn5kBSLXeqgA2IYjL/CWoC4Nn3uRHWHTXdV9ZDg+q0P9RFWFjQyo
	4q9kKh3GlTKOMpM79Z1TtozTAuEEsmyeRVUgCN3TeMsJNWPJRrjNCni4R+Vh4y7gxRhj
	E1TFG7RuRfGqvKtsSt5APbTz+/8KVP4GxKOpUtczx9OicZq8wsPi36DNg2U0sTCOZ6Sf
	RQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=itxXS39Y7irtdZ9Yq+wh7vT3nIOsp1vDX37jqweXW6k=;
	b=K+NcDMhXhbQ+VfNAJZ9lwLWFgJs/YwaudwztPW+8Rz1v2lybeVwVxwQ5NqSi6e4bbu
	kN5BKfx9HDTc+HhsPYSPdJSsRiUbIecc8Dv6uKiFWJ5C3KDjVMzVGH2ZzfNjvq+CelnQ
	D2q8iq17geYh35rkXsrOHHFP9XNJhv/Bnt5juAIgczuAIBAK3FGe3hKdz93iZr/1HCei
	ldhb4TYwYLjfsBs4DyRiZZj/BKfj1ToRpzysntOQUi29r7s5tJKqq/0HL2jmtcUfTBZy
	gscoPYApPmOp3XDWEDBLv/JK/iDx9cjdXw8rgzTiAya4vDeJnNJH8bJe8Aw1/ArGYrtT
	Z3Wg==
X-Gm-Message-State: ANhLgQ2/rDIzSMzzNNmjLsHqhVorp+4o3/Ou4GPdEMtW0mzlNvgNQl4h
	56ZXnfgsM1dtxsu/XNM/hAzxGoR4
X-Google-Smtp-Source: ADFU+vtM4+o90ECTIXcty8zE/I2+I9pQIIBmSIk1TGumDtjiBrnOrwBfWykOJdTjXkx3crw+1pNAfQ==
X-Received: by 2002:a63:ba59:: with SMTP id l25mr686578pgu.68.1583893587354;
	Tue, 10 Mar 2020 19:26:27 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:a4a4:c739:7769:e9ed])
	by smtp.gmail.com with ESMTPSA id
	o11sm1461661pjb.18.2020.03.10.19.26.26
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 19:26:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 10 Mar 2020 19:26:08 -0700
Message-Id: <d6c8fd78942018bf24e093fcec3ba4899359406c.1583893499.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583893499.git.akuster808@gmail.com>
References: <cover.1583893499.git.akuster808@gmail.com>
Subject: [zeus 07/16] gcc-cross-canadian: A missing space in an append caused an invalid option
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
X-List-Received-Date: Wed, 11 Mar 2020 02:26:26 -0000

From: Mark Hatle <mark.hatle@kernel.crashing.org>

When configuring the cross-candian toolchain for a non-linux target system,
the resulting gcc configuration included:

  --enable-initfini-array--without-headers

these should have been two separate options.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7b52893632dae7bc9ac75dddc7ad625e19f41050)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index f14cbf7152..4aac345bec 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -158,7 +158,7 @@ SYSTEMLIBS1 = "${target_libdir}/"
 EXTRA_OECONF += "--enable-poison-system-directories"
 EXTRA_OECONF_remove_elf = "--with-sysroot=/not/exist"
 EXTRA_OECONF_remove_eabi = "--with-sysroot=/not/exist"
-EXTRA_OECONF_append_elf = "--without-headers --with-newlib"
-EXTRA_OECONF_append_eabi = "--without-headers --with-newlib"
+EXTRA_OECONF_append_elf = " --without-headers --with-newlib"
+EXTRA_OECONF_append_eabi = " --without-headers --with-newlib"
 # gcc 4.7 needs -isystem
 export ARCH_FLAGS_FOR_TARGET = "--sysroot=${STAGING_DIR_TARGET} -isystem=${target_includedir}"
-- 
2.17.1


