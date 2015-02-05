Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id B288672DED
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:54 +0000 (UTC)
Received: by pdbfp1 with SMTP id fp1so8546166pdb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=I1NNpj1LfSTcHj12rRIbl6G5YmfR2MLweNerSddbSas=;
	b=CjBxXc+Omu06JdDNyJY8RJ8tlkprthAKRoqRYClOoU/PrmpXPvfg44Mexmm9YvklSx
	YKNgcPM3fSU8UEUzpqgOQEHKpMrpjRzXHgbiA3EVfwWVmcR3Vg27dxc8YHOLQx7OQAfV
	mMcSz3/aBvS+KyfPQejTB1GcBNckv2+qY+ZF+gny0M4GjEMsYpRPh59qyAAPZolNMr2S
	R2m27w2clDHtCXTgaZU0QUVjBnEMzoyblZKFhZTVyys59ZwfrmXLhoRtQXxbzn6Ll/v2
	+C2zrdq2wLYjs3oPKWk/YCi5ABunybk5rGSRHZYw18BBOhUJxpr1F8ZZyuntFIHd5QxF
	2KBQ==
X-Received: by 10.68.204.66 with SMTP id kw2mr6473272pbc.149.1423152355877;
	Thu, 05 Feb 2015 08:05:55 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:59 -0800
Message-Id: <9b2c60afe5077a3cdc029d1734d9b23b2301921d.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 51/61] python: ensure all of Python is installed in nativesdk
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:56 -0000

From: Ross Burton <ross.burton@intel.com>

If any part of Python gets installed in a SDK, we need to ensure that all of
Python gets installed to avoid replacing python in the environment with a
minimal package set.

[ YOCTO #6735 ]

(From OE-Core rev: e36ff98a7a4da478bb886f61005cd72a0b5a9c0e)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/python/python_2.7.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index 2547ea4..bada39b 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -160,6 +160,7 @@ require python-${PYTHON_MAJMIN}-manifest.inc
 # manual dependency additions
 RPROVIDES_${PN}-core = "${PN}"
 RRECOMMENDS_${PN}-core = "${PN}-readline"
+RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python-modules"
 RRECOMMENDS_${PN}-crypt = "openssl"
 RRECOMMENDS_${PN}-crypt_class-nativesdk = "nativesdk-openssl"
 
-- 
1.9.1


