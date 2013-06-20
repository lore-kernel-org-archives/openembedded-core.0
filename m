Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6E1C06AD70
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 16:12:01 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id ey16so2000943wid.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 09:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=sw8d3fKUdXoesCHbULmNUEhOg2Skw2ha/lnpyT+Xa+c=;
	b=LnctTid63d0waIk+aQgDrQMtf30vrwSPNE3UibbRfl9GnHD7/ruWOj7gnW5Oi+4E29
	YQYdDZ5nTcrOZUJVGVxofoICpUHN+RFyVtWYkaL2o3K1MYsjppPJvjlL3pp1wkq1UHeV
	pmdM21I+kMkMDMbDNYdt/gEXMGj/uvE2PXgtTTR8mULnvXv5k79POgHODDqksfcDoZ/m
	NTveTh0U4vv4kmEDfMS20ERhaCfYUGE6KL6P8sxkt51EBXxCdTNQsz9BYoJXc6f6TZTa
	COzvGJBpOouHdu8E+gZc8c+SwIFNqFMt14exZKlBTyKAoIm9UP3GMVspxfAOKAoLD0EK
	o5Mw==
X-Received: by 10.194.110.73 with SMTP id hy9mr6164414wjb.95.1371744722052;
	Thu, 20 Jun 2013 09:12:02 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id k10sm1508166wia.4.2013.06.20.09.12.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 20 Jun 2013 09:12:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2013 17:08:25 +0100
Message-Id: <29e79f9f005d78e4e19a476f17e2489d1a3d2c13.1371744428.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1371744428.git.ross.burton@intel.com>
References: <cover.1371744428.git.ross.burton@intel.com>
In-Reply-To: <cover.1371744428.git.ross.burton@intel.com>
References: <cover.1371744428.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlNHR+Rn+WAscEtnLo3a82m3dyspKyzrgzmZ5B1+FRb0+/O4LUP19BODeFGgDXwwijwLCDw
Subject: [PATCH 3/7] mesa: remove a redundant do_install tweak
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
X-List-Received-Date: Thu, 20 Jun 2013 16:12:01 -0000

Mesa isn't incorrectly installing GLU headers anymore, so we don't need to
delete them.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa.inc |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 6aba0cb..01dbbad 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -78,9 +78,6 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
             "
 
 do_install_append () {
-    # GLU is now in libglu (this shouldn't be required in Mesa 9.x)
-    rm -f ${D}${includedir}/GL/glu*
-
     # Drivers never need libtool .la files
     rm -f ${D}${libdir}/dri/*.la
     rm -f ${D}${libdir}/egl/*.la
-- 
1.7.10.4


