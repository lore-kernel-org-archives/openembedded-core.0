Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9593D7CE95
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 18:07:47 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id e17so2226687pgd.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 11:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=WG3o6Xq1sBbEGo6R9slFRQ6syU5P05rRRcid2GADzZo=;
	b=ajVciOgdenSw1SvVQfKpvH5HbZtwpYhofPBE+aN+4yq2sbXKZ+XPyFrHYojibdOVFh
	ucZneG+Dm3v4P2ToctEi5SDODqFNn+7ZvG8yrmNPd2dO5VaTL/tAZnQQfsAdSv9WGsXz
	eGfh19Iw45jvjDa45Jma/zCLrver9PQiK9IEAkpjyMY/MgL1b58buVJnTgRMOTg5Dq42
	8JykVy/N/42Hot6mPtmY8ok/4whGa+FKjptj9qEqzt6vGWq5NebK+1JEroHqnCpkaoiy
	nxAuw4NDOjnChbSXKuNOqf9dEQuFbEBLvcrwR4gVYSbqHsqw05fpk8s0MZC25nOsa4Ol
	nhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=WG3o6Xq1sBbEGo6R9slFRQ6syU5P05rRRcid2GADzZo=;
	b=BqMzp076ADUfK78+wKJFSKBZWKQNjaZ+a2OQJw9hxUNzBoGmGWhXeF+Emx4TJ1USoR
	d6MBl4Iy9/CB4ufidONYy0s4VIYRXFFx8Knzw1+BhTa8M9zN1gar1bVvxUNpfNr7ETQe
	KXhsAQxP8NNyrcaIRDGVSFONWEGFjHfPRPezNR9tpT34Xf6jg930aL1hVN/X/PqFSJiz
	Yby1FxLIibTLf5aSleSbX3vmt4UICPLIcm4aDEcXjQz5A6JfaFLAP4c8BuWeMyW/eNlI
	s7wTeuPRxOpepbQU7pZj/Muy7bZeCTRDDY8KaMcGsLXHxCcm5wOtg3Eekb1veUzqKjX9
	u8ng==
X-Gm-Message-State: APjAAAXk3cpk8V+2Adc1uzbYYJMhoct67GMkAV5U2OwzqfaWnTnRxDCz
	Tnx1H8MNN9zzbxI+MhnGzUeSzqly
X-Google-Smtp-Source: APXvYqynK+qMATqlzmpbrJ5bCMIMeY4ftWPBCXhVgPh43XxxYJ/YgPwdsMdriEFjhO6pHxiwiru9CA==
X-Received: by 2002:a63:1241:: with SMTP id 1mr9300072pgs.211.1552241268763;
	Sun, 10 Mar 2019 11:07:48 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:18fc:c150:6496:1a0d])
	by smtp.gmail.com with ESMTPSA id y6sm5999607pfy.87.2019.03.10.11.07.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Mar 2019 11:07:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Mar 2019 11:07:36 -0700
Message-Id: <1552241263-26116-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
References: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 05/12] xmodmap: update to 1.0.10
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
X-List-Received-Date: Sun, 10 Mar 2019 18:07:47 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xorg-app/{xmodmap_1.0.9.bb => xmodmap_1.0.10.bb}                 | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xmodmap_1.0.9.bb => xmodmap_1.0.10.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-app/xmodmap_1.0.9.bb b/meta/recipes-graphics/xorg-app/xmodmap_1.0.10.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-app/xmodmap_1.0.9.bb
rename to meta/recipes-graphics/xorg-app/xmodmap_1.0.10.bb
index 2deac6a..7dedb03 100644
--- a/meta/recipes-graphics/xorg-app/xmodmap_1.0.9.bb
+++ b/meta/recipes-graphics/xorg-app/xmodmap_1.0.10.bb
@@ -12,6 +12,5 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=272c17e96370e1e74773fa22d9989621"
 
 PE = "1"
-
-SRC_URI[md5sum] = "723f02d3a5f98450554556205f0a9497"
-SRC_URI[sha256sum] = "b7b0e5cc5f10d0fb6d2d6ea4f00c77e8ac0e847cc5a73be94cd86139ac4ac478"
+SRC_URI[md5sum] = "51f1d30a525e9903280ffeea2744b1f6"
+SRC_URI[sha256sum] = "473f0941d7439d501bb895ff358832b936ec34c749b9704c37a15e11c318487c"
-- 
2.7.4


