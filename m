Return-Path: <kergoth@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id C0DBC78776
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 21:08:46 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id l65-v6so1961823pgl.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 14:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S3M9QTcYHmgXIXvOAfxfbgTSjKpcp7D97DMT0IEJR2I=;
	b=VPVAHLjDNDEsoZdEnNkShy4dmKi4/KxNX4kGapRldRoK04NwhHw5CKvDrS4hHx2k+q
	MCEAKAs3CPE/zydK01HlJ7LSC6g5i7IvGSXCzz5d9lLmDBxIOmDVy+J5j2XusalvBFU8
	BJoV3isDtRERZxgnUraN3Z1g0VjTvLpQN4XcR9xsZopyEpK87lFyCKnuqgKe/ucqhz6O
	9imPxS5WKb0anb2x4fpfyNNhGe0dtxqum3dn2LbjeOIp2lWriWLK9PaaKL1NlqfeD5/r
	RUvSxUg9DYMdxxKc4jJ17bGs29kJ88oqUPu74stPK9vpWUHj3QX7el+i/u9PfDzA0PJk
	pwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S3M9QTcYHmgXIXvOAfxfbgTSjKpcp7D97DMT0IEJR2I=;
	b=YsI0GhQPfUav6pImxUi8/yPYg0ErEb4LwO99R07343aM1jG0NAz1HMprhLWFSrFMo/
	VzZCjfSOKlSq9JwuogqSS0v9E/haHuvIN5HsVCIT3TI677WXScws99VNIdwq8juZgqqc
	GyNSA7PE5Bx3JNI5dQ/RZNBlPlhCbGQ4seqzVvmYKVwH9G6bSUGux2ZFK5qA6M5l0CON
	/kpVbj1YRZ2qkt56I/bhJVy5n4ADPTejrU7oXHA1L0ivoBsqM1NYeLMvQVg9r3WAA3/Z
	Z81FR4Zpob9rACzUeZypGa05Uww7CwblyFUSRVxrpYbpaadzH0yc6s8x7wZNulPQ25i7
	lM+Q==
X-Gm-Message-State: APt69E0jG4Sb16EfkTohF7ze87LeHUE7323TtfL9MAPcvsXCN1mZWSMO
	ty2jqBI7m3mIZDFQBvnfv3bQ7f1+
X-Google-Smtp-Source: ADUXVKKW2e5xgW4Pi24TEqBVSciI0ch8Pc1YnvPeB4DzwWtfG3ieA3UhX27MA+kBEWwj8vAgc8x5wQ==
X-Received: by 2002:a65:490d:: with SMTP id
	p13-v6mr23030011pgs.84.1529615327707; 
	Thu, 21 Jun 2018 14:08:47 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	8-v6sm10513508pfk.132.2018.06.21.14.08.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jun 2018 14:08:46 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 02:08:23 +0500
Message-Id: <4bb748f4c9b177722a13a1f09dcd86b4595752ea.1529603271.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <cover.1529603271.git.chris_larson@mentor.com>
References: <cover.1529603271.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 5/5] populate_sdk_base.bbclass: inherit and use bbpath-intercepts
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
X-List-Received-Date: Thu, 21 Jun 2018 21:08:46 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/populate_sdk_base.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 3da350747e2..8b576e1bfde 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -1,4 +1,4 @@
-inherit meta
+inherit meta bbpath-intercepts
 
 # Wildcards specifying complementary packages to install for every package that has been explicitly
 # installed into the rootfs
@@ -306,4 +306,5 @@ do_populate_sdk[dirs] = "${PKGDATA_DIR} ${TOPDIR}"
 do_populate_sdk[depends] += "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_DEPENDS').split()])}  ${@d.getVarFlag('do_rootfs', 'depends', False)}"
 do_populate_sdk[rdepends] = "${@' '.join([x + ':do_package_write_${IMAGE_PKGTYPE} ' + x + ':do_packagedata' for x in d.getVar('SDK_RDEPENDS').split()])}"
 do_populate_sdk[recrdeptask] += "do_packagedata do_package_write_rpm do_package_write_ipk do_package_write_deb"
+do_populate_sdk[file-checksums] += "${POSTINST_INTERCEPT_CHECKSUMS}"
 addtask populate_sdk
-- 
2.11.1


