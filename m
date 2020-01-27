Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 783877F82A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 14:19:12 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c84so7242281wme.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 06:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Z7OWfpMv6T1HquNyGYq27K6BVEj9U3wrMeUVjoCDBno=;
	b=MeMEwG1dOwBZPnMNGil8iBMvOSHpJyQk2bjef3KgIva5Wqavh5u/YBe4l5i2dBplas
	gZVWuA1WPHb88JviOKy803fzw3fkLLsPPuU6ZWoDoCCD8KHnwz8zx4zshMPWKw0ng7SZ
	f8BAb4Wp2U0MW28OQUlI9PRuHHKSf9B4B2gUagEKW+iXyOVbRt536kY9UwDS64Osslnz
	g8K0lIzzfVDSUOWbJ7pCdm0n9WdsJsDb50RhtLXhX71uPoyDbbVNtIJZn1DGHSf9vf4v
	DKNkRihtCyMVj46P2bHZb2NF8isxSbYhs9RFkQ3WjnimFj52AOLkxUtO0pOSYBfVhb/q
	DtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Z7OWfpMv6T1HquNyGYq27K6BVEj9U3wrMeUVjoCDBno=;
	b=iIj3hGo8ZwvW4kYNFEPmqs7OJGUobFXIv7w4nxyp2b9Gx/yrjvQQ0bZzzRwbwv7X5T
	QmS267c63vD4MDRxv47oaGWVG7Uzo083C1ayTIQp43Azy29LunSSnTyf7bd/pqZZfxp8
	9blb1QHxJ7vy0h6DxrnlAtrKMfrGGm1tXw7B4c2cVcP6ypl5dnugvUjPg8toKvr7IjDe
	TfwS+2FslfCdk1/xzsYYJp8+5WdNQIvyYemgIys8emStEX3z95rn77OE4O41DFpF5kpz
	9YvNIolJVCG/i9zeCQcgdqZw//P93Ktad/IhYC0wyBjINbDvn3vJb5H7M0wdnkwawKwF
	obQA==
X-Gm-Message-State: APjAAAUVAoiD7mLBYxNzFBn7+7ojWdZcaDcyXmEK0vUzaeRGfL+0kmfG
	qV9DCFDlb8zSXKdhezEtnxd4g74v
X-Google-Smtp-Source: APXvYqyvUwAwEXAbk8eTB9OIK9YRJ/VipRg5nxauh/iGbwHPBjR2szCVfPUn6BxNJlIFfMWbSOU49g==
X-Received: by 2002:a7b:c249:: with SMTP id b9mr2578685wmj.74.1580134752925;
	Mon, 27 Jan 2020 06:19:12 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	n1sm20533930wrw.52.2020.01.27.06.19.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 06:19:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jan 2020 15:19:00 +0100
Message-Id: <20200127141908.84922-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/9] core-image-sato-sdk-ptest: do not pull in ptest-pkgs
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
X-List-Received-Date: Mon, 27 Jan 2020 14:19:12 -0000

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


