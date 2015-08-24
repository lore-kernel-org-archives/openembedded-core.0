Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 173E976C1D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:19:55 +0000 (UTC)
Received: by pacti10 with SMTP id ti10so33376150pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=3ZVk1EGiqkqnwTISk7Wl5vkOdjcHLu13bI1kdBZoO5g=;
	b=C8uWWUfU/Dd2774jUvTdab0BSBRsya3Rc+c2t4yPqzjs42+7Cgsv/VqkCN3HGz92s/
	Li9okyATz+z7g1H5nk2uc4nRqlatwi+G4qAShWutF/u12E7pFDkuwLbsNjjNGAyESAEf
	6b/DXCnuW4yCdwn7Q5MzgMmBncUd5D8yC/j7Y+cFI+/BA59fG35PFXKu1d4qiTvVf5yX
	NrE+w2/2NdNdiesKRsAichTNIpgGXbB0Q+rujf3ObwMJ7//XXD7kZ6DrRuMtX+M27AUS
	KSG+C585luV0jgvkzFXXyInMVbS56Puv/vHnXJWymqnk40j+dX11ruDhiPifb+q4MHBZ
	16Kg==
X-Received: by 10.68.69.7 with SMTP id a7mr50459420pbu.78.1440454795636;
	Mon, 24 Aug 2015 15:19:55 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	u10sm18537623pdp.85.2015.08.24.15.19.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 15:19:54 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 15:19:45 -0700
Message-Id: <7ee4c714dbe6b252b7c0ce6a04d1d8f2db7ced5a.1440454579.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <efbd9a5c0ebb330d105c707bbb1ebf9875003caa.1440454579.git.chris_larson@mentor.com>
References: <efbd9a5c0ebb330d105c707bbb1ebf9875003caa.1440454579.git.chris_larson@mentor.com>
In-Reply-To: <cover.1440454579.git.chris_larson@mentor.com>
References: <cover.1440454579.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/5] packagegroup-core-x11-sato: obey the pulseaudio distro feature
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
X-List-Received-Date: Mon, 24 Aug 2015 22:19:55 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 04d1e99..e0b1f51 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -39,8 +39,7 @@ RDEPENDS_${PN}-base = "\
     libsdl \
     ${NETWORK_MANAGER} \
     udev-extraconf \
-    pulseaudio-server \
-    pulseaudio-client-conf-sato \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio-server pulseaudio-client-conf-sato', '', d)} \
     "
 
 # pcmanfm doesn't work on mips
-- 
2.2.1


