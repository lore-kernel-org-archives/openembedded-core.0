Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7880B7CE79
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 18:07:48 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id j5so1983983pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 11:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1xM7sOOrFg8duFwuZ4hdmcZCRmobjn/ZR3UwDwZrk7g=;
	b=l1KJivhI5yUUw8Ki8YJ8bugxxarLeMBDGXnShDdNfIRQ4lvninA/QtpamRgkMeS9Ny
	W0fDEpSt0PKq5azC4yftstbYdNiXYCf56oETIf/iE6j4TdzRrnDDKTTMLqBsLKzoNifE
	TOm/x0h2CJ5lF87pvOTfqw20mAdiHDftmEa4NQKxzs89gKDz7Ey4ImD56TsiHRde78oc
	ouW9PDcZC0gFG+JQvcIW5K4M3LEaulzwCU6hjRlNd2xM2hG40yJRrNWFsXPkg3Qq4gki
	g2H3ZTI/h7f2f0ZIJZWpWWmHc3N7l/XuTIRU/GTZ8Zf9WfX85SFnBycCgQqyTtGbc8G3
	61/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1xM7sOOrFg8duFwuZ4hdmcZCRmobjn/ZR3UwDwZrk7g=;
	b=J/hjn8gvPQnfWKbnXSyWPVMoovGq6RNmJSeBfFCYVkLYNhPqSVSnuMOQh1HKrgNj+O
	SgyNvxb3CgIsSE/6L2OEwqTx3RaqoEi2Lre6ejV+qB1PLb6CqiCV67ugmBUsJDbBU59Z
	B+11FsikL3K+GmcwhMtO6tlDOkeBMHhJf8MF1fbGQRfipSiigW7aMZYasx1O+rqDjaBu
	hMkiBfiVcEk6giCy+lHV9y7DoG3ieoAw9XlO4oJTW3HruzpHKgumLCYKE32aS6PWaYCj
	sZCRUKI31UzZxBzOtWWkFAWcTj+bXgIpHsZjJ2Ijsv6mN5rFmlNHylHZTZJLguF9nvgo
	H+8A==
X-Gm-Message-State: APjAAAVh/SNc2FElxx9vQkogUCO6PdsDI8h1Q5OMis0qRc7/gL76aEpI
	imvQTRCgiZf1PU9+DB0U6yRzZQli
X-Google-Smtp-Source: APXvYqxfmbRwHJDA2xhG4+5tn+S3xAxqIanMgPFimjgPVtyUIlMd6fJxDYeX3lieUNx1yWfcOmy2Vw==
X-Received: by 2002:a62:5e46:: with SMTP id s67mr29126614pfb.126.1552241269488;
	Sun, 10 Mar 2019 11:07:49 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:18fc:c150:6496:1a0d])
	by smtp.gmail.com with ESMTPSA id y6sm5999607pfy.87.2019.03.10.11.07.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Mar 2019 11:07:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Mar 2019 11:07:37 -0700
Message-Id: <1552241263-26116-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
References: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 06/12] xinit: update to 1.4.1
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
X-List-Received-Date: Sun, 10 Mar 2019 18:07:48 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/xorg-app/{xinit_1.4.0.bb => xinit_1.4.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xinit_1.4.0.bb => xinit_1.4.1.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-app/xinit_1.4.0.bb b/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-app/xinit_1.4.0.bb
rename to meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
index dc2a06b..5626ebb 100644
--- a/meta/recipes-graphics/xorg-app/xinit_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=18f01e7b39807bebe2b8df101a039b68"
 
 PE = "1"
 
-SRC_URI[md5sum] = "2da154b2f80ca9637b1a17b13af0880c"
-SRC_URI[sha256sum] = "230835eef2f5978a1e1344928168119373f6df1d0a32c09515e545721ee582ef"
+SRC_URI[md5sum] = "6d506ab2efc17a08e87778654e099d37"
+SRC_URI[sha256sum] = "de9b8f617b68a70f6caf87da01fcf0ebd2b75690cdcba9c921d0ef54fa54abb9"
 
 EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
 
-- 
2.7.4


