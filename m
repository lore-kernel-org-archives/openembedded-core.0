Return-Path: <sujith.h@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id EFBB06CCA3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 05:49:42 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id mc17so344055pbc.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 22:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=G3kVsqvHYCCzE2nFI5Gf4Xa3ZULGXkLh8OVZmE189Ds=;
	b=yRt+WNRFA0DWeyCiOcGH3bzUxtj4HtDwkEmorAGKzFIxLBy7jB+0KaQsB+kc5JIbon
	0FSpCD9HELQhQZkQclljkaL4I27S/VezW9PdL7/xyMm2HBTxiVrwLHa6lpWa4fq7xwH8
	tR8KUfene3NZhR5KJJSp+GwCI3dy2aKLfAyDRM4SD6ukVUr39vq077OVfN8QxyjN5i0G
	Cd1JynuTerOKTi6VFuJBDdjKRxFyqfRy25f8c6tc4xQTKk39QQ/Zmyz3VriGXqFQzBVy
	UYH+MyKeB22RaySMrLJTISgO8Va+NL0+0rDDG/9+/ZiHcnLy+slRQPk6GrLCajdoLnov
	ccvg==
X-Received: by 10.68.40.169 with SMTP id y9mr143668pbk.193.1381902584758;
	Tue, 15 Oct 2013 22:49:44 -0700 (PDT)
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([139.181.35.34])
	by mx.google.com with ESMTPSA id
	fk4sm103852666pab.23.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 22:49:44 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2013 11:16:35 +0530
Message-Id: <1381902395-24934-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.8.1.4
Cc: Sujith H <Sujith_Haridasan@mentor.com>
Subject: [PATCH] nspr: Add LDFLAGS to TARGET_CC_ARCH to fix warning
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
X-List-Received-Date: Wed, 16 Oct 2013 05:49:43 -0000

WARNING: QA Issue: No GNU_HASH in the elf binary: 'armv7a-vfp-neon-mel-linux-gnueabi/nspr/4.10-r0/packages-split/nspr-dev/usr/lib/nspr/tests/formattm'
WARNING: QA Issue: No GNU_HASH in the elf binary: 'armv7a-vfp-neon-mel-linux-gnueabi/nspr/4.10-r0/packages-split/nspr-dev/usr/lib/nspr/tests/threads'
WARNING: QA Issue: No GNU_HASH in the elf binary: 'armv7a-vfp-neon-mel-linux-gnueabi/nspr/4.10-r0/packages-split/nspr-dev/usr/lib/nspr/tests/semaerr'
There are many QA Warnings thrown like the above for this recipe. This is observed for target imx6 sabrelite.

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


