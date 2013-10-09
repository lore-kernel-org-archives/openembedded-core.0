Return-Path: <sujith.h@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7A9A56ADA2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2013 04:30:01 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id lj1so453515pab.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2013 21:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=TEIAcwOEwFHN/ADQHGIhh4cepQwwc6UzEeukP0VUCY8=;
	b=UIGoteoNJzuMtKx2l+47mEMOCw0I7sVFceCgny0lCp+FI2k4F7O19waI/7w4hSB0MW
	sxfLrh7Kfcjvy69qOgVGF3Uj80h2wmHulvFPHFzzfy0yvmBvKWA+BDMGhKaFc60CGo8t
	G/2UV6oLbLBHe8smi5mx4bymgZ6oISKxL0GqJtY5LjaL6hsasHDeXaTRIGg2e6EPrF13
	UpJ7gvr6yZnlUmA+IgVl8M9i/ulyzC+JwEptaeQVy107+HM/mfrHC07AdipHHIHuTVov
	b2p5IkPsRmXjWKD5121HPJU7/HbLT/6WJrpcv4NSVDJM3arQEcm+hiSWYRDKpcoxJRuo
	mDXA==
X-Received: by 10.68.2.105 with SMTP id 9mr5803735pbt.26.1381293003179;
	Tue, 08 Oct 2013 21:30:03 -0700 (PDT)
Received: from SVR-IES-FEM-02.mgc.mentorg.com ([139.181.35.34])
	by mx.google.com with ESMTPSA id
	vz4sm51592584pab.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Oct 2013 21:30:02 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Oct 2013 09:55:32 +0530
Message-Id: <1381292732-5090-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.8.1.4
Cc: Sujith H <Sujith_Haridasan@mentor.com>
Subject: [PATCH] Fixing the warning
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
X-List-Received-Date: Wed, 09 Oct 2013 04:30:02 -0000

Warning: No GNU_HASH in the elf binary

Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
---
 meta/recipes-support/nspr/nspr_4.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/nspr/nspr_4.10.bb b/meta/recipes-support/nspr/nspr_4.10.bb
index fcecb95..4247fd0 100644
--- a/meta/recipes-support/nspr/nspr_4.10.bb
+++ b/meta/recipes-support/nspr/nspr_4.10.bb
@@ -19,6 +19,7 @@ SRC_URI[sha256sum] = "0cfbe561676b92e5af3ddc7ac77452014e3da8885da66baec811e73541
 S = "${WORKDIR}/nspr-${PV}/nspr"
 
 RDEPENDS_${PN}-dev += "perl"
+TARGET_CC_ARCH += "${LDFLAGS}"
 
 TESTS = "runtests.pl \
     runtests.sh \
-- 
1.8.1.4


