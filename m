Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 132147FD31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 17:34:20 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z7so3999096wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 09:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Z7OWfpMv6T1HquNyGYq27K6BVEj9U3wrMeUVjoCDBno=;
	b=h+TGTT2ojLCsRZC/MN5QpoZWlkzmJXm9/HRedzw+ITjADBhlsFsbMRy7WLVs7eGQbi
	zj9ktfbIImuQCmeLv1QKIllsVR/pcUAUclBYvh72Jet2v6K5Y3csvYkWXpe+UFqTxbkZ
	nYowmTSbq8A3DLoF0n32ESHTfP+DDdHtyoE9At/7c8vle7U040pH3fm2UJvzZyoYmPMR
	ygZqmKGFQlBZ51NcrOJJplTql3w0Hrcmc0QMqX16nUDFqLx5mYvQKzVM71KcK8/QMkfe
	SaZNKhlfmc7/qqRULW2V1Ou5t8bjU+NHghzkw3GWmpDrfjsoTT8eaRP8LuT1jQeih1/r
	C9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Z7OWfpMv6T1HquNyGYq27K6BVEj9U3wrMeUVjoCDBno=;
	b=YyGyTORalKwzDl2vCY1irAMRy4d3CgJlJbh0sL61Lu3cyAwr5z8MoiWa9Nn9FMc9vg
	FEnVd0RBDIkspSdQeAdzTGAX9kQsLl4OHVv07bs2pOG0EAPjjqfTFg2YmCLAJEliIQd9
	bT+GPGay0RCqpPBAQzzQb6vusASod3tWzv7jiDqsySeEgUQAuUh6VZWARstTZFoHa30A
	Y/N8K4XJNv+urDxn3uXJBAxz7DGlkeUi7V2auqdR4ZauXrLik7PvooylIdOJumlUtBqi
	KEV4ghlEGXUXzP6jmzrpBJBqnHk8dG6w4ApXTcJlQ2239ki8BI9yGODIPuDsF8BH77CB
	cOVg==
X-Gm-Message-State: APjAAAWRPuCx1Nke394WqWRE1UQX0V7lG8EZxkDl7RZ3voeRSUTXosgy
	452g1EOM+RkEan0bOYcHHu76hneP
X-Google-Smtp-Source: APXvYqzsNyRKqUtuUBNa5jPeslNmyDLS9l4hyEIpvUYgRFcVCW/5Tmocf+RQgwg8sbV8vgAG2d1jRw==
X-Received: by 2002:a5d:494b:: with SMTP id r11mr18418770wrs.184.1579800861631;
	Thu, 23 Jan 2020 09:34:21 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	e18sm3774439wrr.95.2020.01.23.09.34.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 09:34:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 18:34:13 +0100
Message-Id: <20200123173416.112832-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200123173416.112832-1-alex.kanavin@gmail.com>
References: <20200123173416.112832-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/5] core-image-sato-sdk-ptest: do not pull in ptest-pkgs
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
X-List-Received-Date: Thu, 23 Jan 2020 17:34:21 -0000

The lists of ptests are defined via PTESTS_FAST and PTESTS_SLOW;
ptests-pkgs also pulls in additional items that are specifically
excluded from those due to causing issues with ptesting.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
index ff297fe324c..7490b773d2e 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -3,8 +3,6 @@ require conf/distro/include/ptest-packagelists.inc
 
 DESCRIPTION += "Also includes ptest packages."
 
-IMAGE_FEATURES += "ptest-pkgs"
-
 PROVIDES += "core-image-sato-ptest"
 
 # Also include ptests which may not otherwise be included in a sato image
-- 
2.17.1


