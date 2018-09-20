Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id C9E5278C8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 15:06:12 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id s14-v6so9754139wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 08:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=q2ympGpcsbAVKuKPLECka4lSl3UtIUSPUD/dN0ELUPo=;
	b=p5MDDrH/fMYc7HWeBXWReUTOhJ6eU8EwEbH5CTxzNDLK7ea5BXDpp4i/t1Jw5V3rUD
	BGxSysSPVGPqwbxIEIZeShj95RjlYPSLFU9g+ME0cj026t9szF8hPa4zhLrmfzp25pgt
	wni3O5pfJy0FDRpvaMs4B7kEMHa9PxBBmht8VX8QPwy5/lPmw5WC148F7NkYXor1PwbP
	F41q5WqP06VXlPdtYCmkVctW1GEXeWm900gZqhvSbb+8jkf9+K4y5ViCAWgjxKijw8KW
	vzo6cnuXm1cFb+eNifj2jeUV+Y/thdllXHUkECNAh37//15qutzKdpqc2tPaBLIr7f6x
	IWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=q2ympGpcsbAVKuKPLECka4lSl3UtIUSPUD/dN0ELUPo=;
	b=T1HqRN/u9O7qIiIsG0YdcVL5rBmSf/WmJrOOUGfMX/DvemgxGwInhXgkG7OsabOBXF
	64D2qVZSgi8rCx9NkBwX0Q0IAyhZ12U2445EgBoqkKv90med94BTTtmw8ChqxmKu08me
	vfYVSf/yJKtpkA76fKHsBJmK7qPqFJa0yQOAy0+UhJPD9tostnjjQDjktM9O0QiibIAP
	SZDVklIyxvp3h22cABr4CH6m6P4CHPffXoDlZ3TNPwYxy7CLfdDCjCfXcsdu+Lohqv/l
	HMkwcOnK98dbE3ILxnt+Vh2r2q5+EthGWfVfcecvtrXqt8rA5Y3gSGcwMjx5M9ECBIbD
	KQvg==
X-Gm-Message-State: APzg51BpfyFSifkCyaG20VzUpZltAx69NuBJOW/nEBe/kbwhwD/nyZqJ
	vzHij4/IPz7dJF6VNgB+QtXk7kl2
X-Google-Smtp-Source: ANB0VdYZJsv2BNG81drlkp1OXF8UZJUsl/Z+qRxg/deqBmPFJx8qlhV/fvWUwZlgs6EgMnyYube6BQ==
X-Received: by 2002:adf:9bc7:: with SMTP id
	e7-v6mr7504986wrc.240.1537455972850; 
	Thu, 20 Sep 2018 08:06:12 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18]) by smtp.gmail.com with ESMTPSA id
	72-v6sm23955280wrb.48.2018.09.20.08.06.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Sep 2018 08:06:12 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2018 15:06:05 +0000
Message-Id: <1537455966-8694-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] p11-kit: Upgrade from 0.22.1 -> 0.23.14
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
X-List-Received-Date: Thu, 20 Sep 2018 15:06:13 -0000

p11-kit is no longer doing odd/even for development/stable releases, so
drop the custom UPSTREAM_CHECK_GITTAGREGEX.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...NGUAS-drop-the-languages-for-which-upstream-does-n.patch | 13 +++++--------
 .../p11-kit/{p11-kit_0.22.1.bb => p11-kit_0.23.14.bb}       |  4 +---
 2 files changed, 6 insertions(+), 11 deletions(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.22.1.bb => p11-kit_0.23.14.bb} (90%)

diff --git a/meta/recipes-support/p11-kit/p11-kit/0001-LINGUAS-drop-the-languages-for-which-upstream-does-n.patch b/meta/recipes-support/p11-kit/p11-kit/0001-LINGUAS-drop-the-languages-for-which-upstream-does-n.patch
index 2fda9dfbb896..e902b0b522ff 100644
--- a/meta/recipes-support/p11-kit/p11-kit/0001-LINGUAS-drop-the-languages-for-which-upstream-does-n.patch
+++ b/meta/recipes-support/p11-kit/p11-kit/0001-LINGUAS-drop-the-languages-for-which-upstream-does-n.patch
@@ -1,4 +1,4 @@
-From c3aa4aae5e9f4adafd9e10d9466f1bc481e0aae6 Mon Sep 17 00:00:00 2001
+From c6bb4b99af39daa3221c3bdc0686987ae0f31693 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 16:47:44 +0200
 Subject: [PATCH] LINGUAS: drop the languages for which upstream does not
@@ -9,24 +9,21 @@ Upstream has been notified: https://github.com/p11-glue/p11-kit/issues/127
 
 Upstream-Status: Inappropriate [missing upstream distribution files]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  po/LINGUAS | 2 --
  1 file changed, 2 deletions(-)
 
 diff --git a/po/LINGUAS b/po/LINGUAS
-index 1fc4d53..e9cc5a7 100644
+index 767a806c2e20..6ab48001c409 100644
 --- a/po/LINGUAS
 +++ b/po/LINGUAS
-@@ -11,9 +11,7 @@ cy
+@@ -12,8 +12,6 @@ cy
  da
  de
  el
 -en@boldquot
- en_GB
 -en@quot
+ en_GB
  eo
  es
- es_CL
--- 
-2.15.1
-
diff --git a/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.14.bb
similarity index 90%
rename from meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.23.14.bb
index 57798f402010..2a8709143b19 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.14.bb
@@ -9,10 +9,8 @@ DEPENDS = "libtasn1 libffi"
 SRC_URI = "git://github.com/p11-glue/p11-kit \
            file://0001-LINGUAS-drop-the-languages-for-which-upstream-does-n.patch \
            "
-SRCREV = "bfb3bd47aa48983f5349479bca598403097ff81c"
+SRCREV = "3770793f026e46a000d2d8816d56122598289d5c"
 S = "${WORKDIR}/git"
-# exclude odd minor versions, which are development releases
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
 AUTOTOOLS_AUXDIR = "${S}/build/litter"
 EXTRA_OECONF = "--without-trust-paths"
-- 
2.7.4


