Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4376E731C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 17:43:42 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id s5so890702qkd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 09:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=46XFw7oABj9c/NbMREud+j+Btgecxxz2f5PuSIntHZs=;
	b=xtJ/EeZk5xjQi2awsjqNYGf7R1LOhycMjriSqBSaQLm/hgIGKwlOsYetpTxXJ5ueLD
	DklFNFUSDHtoMSutA7mqzp3DIc9CxU+MVxeNjuKzeMsigtCt19mJkNM/4ATmT4bNgvW2
	7mT3yS1+XNKdQZOudGYos3YqF1qhqyk7icyUmRKxuxCWrYoPRHdrOZgfDj/n0KBAf09U
	ulKtBpa0dRlAkEeB1QVwr24+uFanCK2RVH8FtFMtel0V/vY/hm7nK1ces8lL2F3eyMIa
	rtvCELAEEIXWP35+dDM75Z7JJfg70n6FZzkSXB9TL+gluSUvrM61jFb9diaNQOgwMuRe
	4UBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=46XFw7oABj9c/NbMREud+j+Btgecxxz2f5PuSIntHZs=;
	b=CvaDcczVT+UqzwZV4xbWITFYyiynpVh/wid33mrT7eMcDAeXVpb26YcwhXtzWJK4HQ
	uhsCqf4WVJdoe6k0c3DHQioUjtAYCK5J7lzzIdtF1CJ2M73zR0hnyycbp1G5pkvnj5ou
	mzb6t0obmXxDrhlXTC1r1jDbWuJHHzG+7IpdY635jIMgkmbSSfa0bfKYa6Pi9sviTiuO
	davVJzpaSgCguhknV12Yr2f9gW46G12XvaC8Wt5eJorXOjP8xm30j71Y05TN+AAQbbnZ
	8AFT7h9uk6TEnOfKPPAlMBCFKRn02vasobwyj4KFAawiwe96EsBYqrUOCBha4tjIMzuQ
	3TcA==
X-Gm-Message-State: AG10YOQ0rQg3CX1hUNKMxMzhWcm+3iIGgZYuhAtReHV99lxj+3dEspYGhkcZXLJDfv3bVQ==
X-Received: by 10.55.73.199 with SMTP id w190mr49462111qka.77.1455126223319;
	Wed, 10 Feb 2016 09:43:43 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	a66sm1724349qkb.20.2016.02.10.09.43.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 09:43:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 17:43:32 +0000
Message-Id: <cd63a0edf2d1fb8473512ec04ccdcdb501e203ae.1455126045.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
References: <d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
In-Reply-To: <cover.1455126045.git.raj.khem@gmail.com>
References: <cover.1455126045.git.raj.khem@gmail.com>
Subject: [PATCH 5/9] uclibc: fetch from master branch not 1.0
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
X-List-Received-Date: Wed, 10 Feb 2016 17:43:43 -0000

From: Ross Burton <ross.burton@intel.com>

The SRC_URI was fetching from the "1.0" branch but the uclibc maintainers appear
to have removed this, presumably because it's synonymous with master as all of
the releases are also on the master branch.

[ YOCTO #9074 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index 0509a6c..a56fa7c 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -4,7 +4,7 @@ PV = "1.0.12+git${SRCPV}"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/uclibc-git:"
 
-SRC_URI = "git://uclibc-ng.org/git/uclibc-ng;branch=1.0 \
+SRC_URI = "git://uclibc-ng.org/git/uclibc-ng \
         file://0001-Disable-lrount_tes-function.patch \
         file://uClibc.machine \
         file://uClibc.distro \
-- 
2.7.1


