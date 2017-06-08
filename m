Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1CEE771AC1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 05:26:35 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id f127so3434807pgc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 22:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wDPbohjQUPsnQ+gaaSgjNPeg9Rzj5FAXmaYi8isj97I=;
	b=czPpnWmB0TZkHY5w/GB3vqvf29K4MhHnIFAk1Bf+3zYuWdgEnUohGd+WaIeOKBsep5
	yC0A9gff9y+eBi2lslRMXsID0FU0CvluCxeVxVZg8eh99r4g/JxEHjix9Iovnuympwbt
	yRjCEAT9aSPtu8oErbvi8HiIzCEOel93HvR/rm556HU4Q7TizUOo3iHRVRhOhR1pWre0
	bDQRtP6mFVPvb1wbtBY3+ELrchCjCu8bAaBqkvjbiA7QQqy/6mnBEX0ZZGtW0IuuM/v3
	aqL5/ukVObwZ0kJ2J1TLZ8kxEN6fuqBP+uNtcgvyJpp+VY+EhdAsc49of3aid0u3PSOx
	VQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wDPbohjQUPsnQ+gaaSgjNPeg9Rzj5FAXmaYi8isj97I=;
	b=ZKo+Q3LYKP5tc7W8lpCdkRm3d6AKGfdJ0kJrFWWJOjhvJK0HgIe4Xqy40GjQvuufk5
	eBqPCnz3VYeD0wsxHU5TsLKHNvftJG/su9BRjigked1ibJ1nrp0JykmjJzrWJadkhnbM
	PXq1Td2VaMCEHiRwpqEjcxu079WraRTgmnOeSYOVMYFv22OiXJsMFQdEVmqGhZKFcRXc
	4q8M+c5JtxqjrjzBXdz664fUH8/83Td6crQmayf+UfOl4dKoR/B54Jko+FkCdbooBQQE
	kRFL3RdCN1nYpU82uhxiAI8goR4N4VVF4DADaKlw2zmWzJdNqkDG+QD2C2SgPJ8XIhMf
	+5Fw==
X-Gm-Message-State: AODbwcBzYuTFiGhzgAinCNIkkGOVB/OswzC88yQT2b3xvZQ5UI0we7aD
	HJoCF5PILC5Nxe8l
X-Received: by 10.84.236.4 with SMTP id q4mr32813646plk.10.1496899596773;
	Wed, 07 Jun 2017 22:26:36 -0700 (PDT)
Received: from ip-172-31-15-204.ap-northeast-2.compute.internal
	(ec2-13-124-88-129.ap-northeast-2.compute.amazonaws.com.
	[13.124.88.129])
	by smtp.gmail.com with ESMTPSA id 66sm7632534pfm.82.2017.06.07.22.26.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Jun 2017 22:26:36 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 05:26:27 +0000
Message-Id: <1496899587-30479-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] iproute2: Upgrade 4.10.0 -> 4.11.0
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
X-List-Received-Date: Thu, 08 Jun 2017 05:26:36 -0000

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../iproute2/{iproute2_4.10.0.bb => iproute2_4.11.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_4.10.0.bb => iproute2_4.11.0.bb} (75%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_4.10.0.bb b/meta/recipes-connectivity/iproute2/iproute2_4.11.0.bb
similarity index 75%
rename from meta/recipes-connectivity/iproute2/iproute2_4.10.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_4.11.0.bb
index 063d467..0ee0f21 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_4.10.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_4.11.0.bb
@@ -7,8 +7,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
            file://0001-include-stdint.h-explicitly-for-UINT16_MAX.patch \
           "
 
-SRC_URI[md5sum] = "b94a2b0edefaeac124dc8f5d006931b9"
-SRC_URI[sha256sum] = "22b1e1c1fc704ad35837e5a66103739727b8b48ac90b48c13f79b7367ff0a9a8"
+SRC_URI[md5sum] = "7a9498de88bcca95c305df6108ae197e"
+SRC_URI[sha256sum] = "72671028bda696d0cb8f48ec8e702581c3a501caeed33eec3a81d7041cbc8026"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
2.7.4


