Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
	[209.85.167.42])
	by mail.openembedded.org (Postfix) with ESMTP id C32D57BDBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 17:55:54 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id l10so4877403lfh.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 09:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=67WWyzt62fu5meIfWAHFPfqpU2DZEoSlaXvz2Jk6orA=;
	b=GfMiuQVq1DXMYPtLDiZRDtI5E1pKN52pvb82FsLTiLNFIImBdfLBuGKBeB+zsJvwX5
	pOlc32DuFEfpNBCaR5M9UoFNDFq5zqda7sjUyjwiZn+2z6BWw4ofjptN+rZSGuxxbP0c
	pKcwzvCA/FngQINCTTHx4cZt4NUzCTKZR/aZqxPxy2W696HczTB7jt29JyaKwrfCv6Ny
	sET83mztTxEOCVlVvjMLkKUiy20ElWizW2yQopIvOOVHRCcg2ebWUaUdPOzYxUIDi0XX
	/VnrbcvmYNvlnsYljxmQOGZ469axYG5ioMm/q9AL2xcos0yVOkKFOwiawVwCsUWzokE1
	pIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=67WWyzt62fu5meIfWAHFPfqpU2DZEoSlaXvz2Jk6orA=;
	b=J3X/Mg1D7Xi6paXWb/h2ibPWtF+jQS87FErmN71EzwuJo7rXSqOlBg9oGNldWIuybg
	CLbqP34O3hLNOCwUKdIFtV7BWtugDGjsg0eKln80PIGIcsHgtavYJLLTakMhykRU0CTV
	f1cSIv+ESI8JaOdl8zpaNw5PXmlLAO9tJbSW+tv+ivHvG203OPuYFmftt4Q5C62MXKZD
	UAyPwlYUuPDwfJI6etBOP9W0BhGoWvZ3+qrWlEFrUwyeCCx+gJBBEBS5bCfi8FOlM6k+
	yGNh33LKz6AN4GwBIwtd0BfJLzGrO2bCbC/N8r2MdYYZ8fnHKabFtYzHOhIxSNFJAWu5
	B/aw==
X-Gm-Message-State: AA+aEWZf91OzVr0WBn3fufbK1oQQi7+1Yh1ehDjMbQ4e1gxVSI2caGcK
	eT3N3MbiZvFHDkVNELjd8Nhv0kJI
X-Google-Smtp-Source: AFSGD/Wz7HahtJwgfm1dHMO4FQh0z+h6J5CdkAQ7zuuK7JgJVNOVuksVeZn/jfcqnTIbDHWxUN+7nw==
X-Received: by 2002:ac2:4343:: with SMTP id o3mr2505341lfl.129.1544810155150; 
	Fri, 14 Dec 2018 09:55:55 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	r27-v6sm991033lja.65.2018.12.14.09.55.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Dec 2018 09:55:54 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 19:54:41 +0200
Message-Id: <1544810082-22164-13-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
Subject: [PATCH 12/13] gcc: Enable secureplt for powerpc64 target too
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
X-List-Received-Date: Fri, 14 Dec 2018 17:55:55 -0000

Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 00fec0b..06c9033 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -38,7 +38,7 @@ def get_gcc_mips_plt_setting(bb, d):
     return ""
 
 def get_gcc_ppc_plt_settings(bb, d):
-    if d.getVar('TRANSLATED_TARGET_ARCH') in [ 'powerpc' ] and not bb.utils.contains('DISTRO_FEATURES', 'bssplt', True, False, d):
+    if d.getVar('TRANSLATED_TARGET_ARCH') in [ 'powerpc', 'powerpc64' ] and not bb.utils.contains('DISTRO_FEATURES', 'bssplt', True, False, d):
         return "--enable-secureplt"
     return ""
 
-- 
2.7.4


