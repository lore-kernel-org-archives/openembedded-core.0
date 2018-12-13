Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id ADCC971A36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:07 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id z11so1667210pgu.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vfcPfL0/7iLpYoKS27PqWRcNR2EvZfxev+cpeYcMSHY=;
	b=Dk3Z6CJ9dRtAzK78qfztiqeIc6BMMg7VodaOx2UlbzcD83PincUeHZrXVMQ3P9p8eF
	byp7CRf0K1/0YilgbelnSWPtT2h2mFYlWv3934s/NKHmmPJmi/Rs25Zf8rdNO6Sdu3ea
	TygzJo7yVZqJJGD3E97/8nMuE+YaFhkolo2J/FNcGEpJmc/upI/Mx77l4gQtBaIv3Ono
	hqrgoStE95cc5n9qPAk6dnVnTQR6+T9gWPhsc99TeupubETr/bwhRYXcvyrbos5zK/jN
	KZgU+zt+ZtBrbMhxmUP0Usr063i2aDc37h3SoAem73CCBdFn1sM4o/nnXmXkWz5JKdRO
	sMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vfcPfL0/7iLpYoKS27PqWRcNR2EvZfxev+cpeYcMSHY=;
	b=YycGm2sOZfg+FUcLpO3KYX4hFchQcMua6FPybxD59dhZoa0xux8YDcYsjnNULwmyex
	vrqzMdN+vZ8/rT7yHA/3w9/e3C1OYXa25PoPyraN1IACd445VT7RiaJQFQCA9lNSep+2
	hrtn8tcgY1Dkl56PrYL+rMPEDf68T0xcNyHeOW0JHFFXe6os55ND0hD3HWbsYDgb7yUd
	+B0D9HlQaIr4h7qrOZAqV14YtUIbSAeb2a+3HGLH7/vxeGti6wYM5GYCHx8HlJGVxq2O
	z2brH1+6iTZaBHbApUI16JKDwn+ZBx60GUP4vH9zIl6RwKSV7X2kc1gpEaLYMhCwzTVs
	BTjg==
X-Gm-Message-State: AA+aEWZDEb6Q1z17OHiIC0pdI73Bza13yK42F8HV3/ITn11ldcgRQzDp
	h2ROpry5BqVPFDiBPHzdOt/Jf52J
X-Google-Smtp-Source: AFSGD/WRrVOrevG0Af6FJFWXymaMJTzW6H82wo80xpcFdQnu4RHsvaLfrAo3k5/+OEQEJck2IXlQ0A==
X-Received: by 2002:a63:a41:: with SMTP id z1mr393899pgk.117.1544737148600;
	Thu, 13 Dec 2018 13:39:08 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:14 -0800
Message-Id: <6339d9636a70573d8406cb51b797977a8b4eba46.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 06/45] oeqa/selftest/signing: Use do_populate_lic target instead of do_package
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:07 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This should speed the test up signficiantly without any loss of functionality
for the purposes of the test.

(From OE-Core rev: 3dde0b749643575878bfbca2f8d2d9ec30bad166)

(From OE-Core rev: 51989db2d9eebd9f190994109c2932dac3f3034b)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/signing.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 21849a1..0edaf40 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -153,10 +153,10 @@ class Signing(OESelftestTestCase):
             self.add_command_to_tearDown('rm -rf %s' % builddir)
 
             bitbake('-c clean %s' % test_recipe)
-            bitbake(test_recipe)
+            bitbake('-c populate_lic %s' % test_recipe)
 
-            recipe_sig = glob.glob(sstatedir + '/*/*:ed:*_package.tgz.sig')
-            recipe_tgz = glob.glob(sstatedir + '/*/*:ed:*_package.tgz')
+            recipe_sig = glob.glob(sstatedir + '/*/*:ed:*_populate_lic.tgz.sig')
+            recipe_tgz = glob.glob(sstatedir + '/*/*:ed:*_populate_lic.tgz')
 
             self.assertEqual(len(recipe_sig), 1, 'Failed to find .sig file.')
             self.assertEqual(len(recipe_tgz), 1, 'Failed to find .tgz file.')
-- 
2.7.4


