Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7B3C07C60B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 13:10:02 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id h22so4279966wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 05:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=uN5LTb6/JYLbn8A4F2Vp/sMM5L5e/eNERQXdJBW0OHM=;
	b=PVnO6Nm030XXUaPmtZKLAW0/jPL8gEkd5zUalomrYREGNv1sqaA2+cAN74ake8/Bi7
	kTvglb0kotYjVNBwG2Dkm9j5BzpC+ZfnDTSlSmv6YBz42Bpp7Nks/mzzTInfKN1hKKL6
	i6W6CksW79mNf+DllZxoSil+rN0pz6CZyUUDl/C81w2vxjukaPMeuqvKH5THr5hesM+h
	VZKoO0JUGtM3XfV1Ayk0ngk0soVfpxDAJJta8LgW6smisk3hSGpGk8xXlfl2ANJ97sJA
	6QDX/rQ9ynJrk9w+1TatqWUH5oB3BLW9/pkWf/OYgVqJpQaUexuIfm4tvpoAL9qnIlm2
	cVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uN5LTb6/JYLbn8A4F2Vp/sMM5L5e/eNERQXdJBW0OHM=;
	b=TmQjQn8/9KU8GHP56sHUpsaPi7eh77frsDs3rzzselCCTH/j57WuqTYUzbLb0cbj4W
	C3HvUEHzpQKq9Aq3Pr1Gl6PFliR38eMNBwl6zOZu9aPLEgunCNRvv8+kyi7Y48ImZadU
	PnWJy/1nmMmWcFGhvOvybw0EP7lz2YsDzpKzYHpG+WiV5rXHc1bDzA11Tva+F0SUPcKp
	IF5A9Rw+6iID9oU4oDTUsNYkHNWR5bonQHWitGIaRujKE1jb79Y9ueutSpV2D2LaM8nQ
	6QG4bLr4GbvxoYVB4xFnOLpfNvebEuxJW5lVsv/H7zmkfzY9VbagQWEgoiKkusq5j9KI
	OlZw==
X-Gm-Message-State: AHQUAuZOY91cr28M453TNbinKtCm+FXvQcWMhLXk9q9dIQv26YRmGvu4
	7b5ExuuoiC7OS41qPOTrj9pIbpEq4yA=
X-Google-Smtp-Source: AHgI3IbTkuuxl7LErjHEa/TvcNf2AzOE4EK1l+jerq7ZZ6IrKEyJHaHMcPWngMxqBfYIdxVGxHvKug==
X-Received: by 2002:a1c:ce0e:: with SMTP id e14mr2899896wmg.53.1550149802896; 
	Thu, 14 Feb 2019 05:10:02 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id o7sm2242677wmc.44.2019.02.14.05.10.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Feb 2019 05:10:02 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Feb 2019 13:09:55 +0000
Message-Id: <20190214130955.3685-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][thud] package: Add pkg_postinst_ontarget to PACKAGEVARS
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
X-List-Received-Date: Thu, 14 Feb 2019 13:10:02 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Changes to pkg_postinst_ontarget were not triggering rebuilds, this fixes
that.

[YOCTO #13127]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 0fe9576b4db..66e423e9993 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2122,7 +2122,7 @@ python package_depchains() {
 
 # Since bitbake can't determine which variables are accessed during package
 # iteration, we need to list them here:
-PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst pkg_postrm INITSCRIPT_NAME INITSCRIPT_PARAMS DEBIAN_NOAUTONAME ALTERNATIVE PKGE PKGV PKGR USERADD_PARAM GROUPADD_PARAM CONFFILES SYSTEMD_SERVICE LICENSE SECTION pkg_preinst pkg_prerm RREPLACES GROUPMEMS_PARAM SYSTEMD_AUTO_ENABLE SKIP_FILEDEPS PRIVATE_LIBS"
+PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst pkg_postrm pkg_postinst_ontarget INITSCRIPT_NAME INITSCRIPT_PARAMS DEBIAN_NOAUTONAME ALTERNATIVE PKGE PKGV PKGR USERADD_PARAM GROUPADD_PARAM CONFFILES SYSTEMD_SERVICE LICENSE SECTION pkg_preinst pkg_prerm RREPLACES GROUPMEMS_PARAM SYSTEMD_AUTO_ENABLE SKIP_FILEDEPS PRIVATE_LIBS"
 
 def gen_packagevar(d):
     ret = []
-- 
2.11.0


