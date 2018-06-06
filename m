Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id A59E477170
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 21:37:26 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id f1-v6so4617705plt.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 14:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AbLb9QVCxwXJHxrpMUiKk57AOw5i1N9wzsoxfTny1DI=;
	b=I0baDc2LGTsHj40vCLHQk9zppwdI7593Jlle1eHcLMMDCTB7R7cKNZuxHwhEFEWp3I
	oILZ2hKtgZuuoWQGWAOVfmtl9HsxNFvr7n4Wk2Jmumump9vnlF3tv2clrsmAXR+Gf674
	2o7eL0jU7Peuh+jOFasGEnD2aoSWdFZjvRmXN//JgrvNjNgKw5CWInlmf7LRCoTB/JGJ
	Hcqa2SBZBL9Ws+iHbFkabgB4ejJuycNBdn4VNwd3C6buxaEgtyMeV5uBtx8Tck51g2zS
	MpnyXJUCvCJ6HM+7F9HihfIL7uROpEBuA1lYlZ4HRV4rYljRC+N2tTS4FrAASoPJ36nu
	WNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AbLb9QVCxwXJHxrpMUiKk57AOw5i1N9wzsoxfTny1DI=;
	b=iM+n+xEQRZvZEyxDl/QoDsEJE0UpgrMw0d+v1sbnonKHKDwjBl8TWzd7dgt6lGpHTS
	+Id+RAjY+onwKX/N99H7M+EnBFRbQm5v/a6f8kWh+yvgTmm+myndP5Cz5nM24vTViHQe
	axK0ayBTxfpX+tDnuMkEWbLaqs77zpa4IUQXZ/JWUybwQW/GssEqU99pLryRhvIxhLmP
	W7CrfBnbSwtRwYLMhJy9ElS1MW+CMSM86hyRTW6tcRko7L2qT1KLMTCZQ/izMChJT3/b
	AeoI35i7C9ihDIFGtW9yy1//R6g8cgLGUbpOId5dXtbNb4rR/6SIZAGvL5/i56e1owvP
	Y1Ig==
X-Gm-Message-State: APt69E0cahgIVnmnuP6BXQNk/cFYrnApZHISlUM5ruaQ9VdIDYi+PPU6
	okB2RTH7p/BnaIw20NYcISaXjg==
X-Google-Smtp-Source: ADUXVKKU7zCPlPRaj58U3rXEmLseUqpwbtHpD49tSf51zryNBWvhxoC+61jOFlTRmQcBcsi0JFoDGQ==
X-Received: by 2002:a17:902:9344:: with SMTP id
	g4-v6mr4945877plp.10.1528321047524; 
	Wed, 06 Jun 2018 14:37:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	c191-v6sm30452374pfg.48.2018.06.06.14.37.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 14:37:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2018 14:37:18 -0700
Message-Id: <efd143e3d8acaa87a588fe978f3dae0d96bbfb22.1528320772.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1528320772.git.raj.khem@gmail.com>
References: <cover.1528320772.git.raj.khem@gmail.com>
Subject: [PATCH 02/12] valgrind: Remove code to remove -mcpu option on arm
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
X-List-Received-Date: Wed, 06 Jun 2018 21:37:26 -0000

This partially reverts 6a053573dc4e6c7490e0e86fd043e425ea85f12c
Since the tune files are now supplying mtune and not mcpu this
is no longer required to be managed here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.13.0.bb | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
index d3af35e7f8..7d7469becd 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.13.0.bb
@@ -64,7 +64,6 @@ EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEIN
 
 # valgrind checks host_cpu "armv7*)", so we need to over-ride the autotools.bbclass default --host option
 EXTRA_OECONF_append_arm = " --host=armv7${HOST_VENDOR}-${HOST_OS}"
-TARGET_CC_ARCH_remove_arm = "${@get_mcpu(d)}"
 
 EXTRA_OEMAKE = "-w"
 
@@ -76,14 +75,6 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
 # which fixes build path issue in DWARF.
 SELECTED_OPTIMIZATION = "${DEBUG_FLAGS}"
 
-def get_mcpu(d):
-    for arg in (d.getVar('TUNE_CCARGS') or '').split():
-        if arg.startswith('-mcpu='):
-            return arg
-        else:
-            continue
-    return ""
-
 do_configure_prepend () {
     rm -rf ${S}/config.h
     sed -i -e 's:$(abs_top_builddir):$(pkglibdir)/ptest:g' ${S}/none/tests/Makefile.am
@@ -95,8 +86,6 @@ do_install_append () {
     oe_multilib_header valgrind/config.h
 }
 
-TUNE = "${@strip_mcpu(d)}"
-
 RDEPENDS_${PN} += "perl"
 
 # valgrind needs debug information for ld.so at runtime in order to
-- 
2.17.1


