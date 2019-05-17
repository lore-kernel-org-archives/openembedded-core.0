Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9BAD07E01C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:14 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id q15so7598773wmj.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4SVmrIuJLbmrXgGXSxG+ohGOOolfaynwpA/FlgNrPYY=;
	b=Vo3HasE0tQiO8GlD94WkxTJSgG1cm36Xe/HRtj7fBrK6GvCmL8B/IIAQ77MttbsYE4
	lhb890ESXTAjdpKu9vvsxrqGgSwzjYE7UenHLRTEl3bmJqyMFakQlYwiKG08tf6pX5ov
	TU3d9FV048FyC38WrsqwhoX+pAvHiPWqKH4bEGcLWm9Wdn9kmo0zDbtrHITKT5lBUzjW
	0E+yYN39oX03cb8z2rjTHbdnyNKqAKFyFEtd36jCTKjWtAPbQmvimqonu1WpeOHWUGZZ
	w/7uaWvo4T8bZn2wYEU6d3FJPxlhqJc6SeCKshlLRoOcQO4eEbc3byD4JtnCkDu9aORM
	IXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4SVmrIuJLbmrXgGXSxG+ohGOOolfaynwpA/FlgNrPYY=;
	b=ibsxmYY4J8sOEprjTEZLxddPrZOht83daev+93YJLMNM3S8zzohZcCJ4/kG1ar8dNn
	iuL0POUCw/+XODCEGLhIGMcaKSsmAYTC3rpsIy7vj01msjuj+fYOOWhrhVRZILrgLWZv
	WfbSMUBOVehuj4A0oh5/bg63dtQMlao/m+RhFpgpHOR651xzUrZ6u1f8cRS995VRGpZJ
	4O2sjFgT7rxfbO+ySf/bV0JMmx31T60ABFPhfOHuSe+YEKzG0Umx7roYpJd0iQ+6DZ/j
	z4gIx9UEUz23FelT4k+tj/jNlFFUd1fP911HsJF5Ujf2w/ZQWLMzkxLT1SFPTx1KCYZ5
	K4bg==
X-Gm-Message-State: APjAAAXRligQV+dK4agEnNSC+ljc1G2G+MrCqafwf5mR0NmPpXgIyoTn
	b5CwXSX//VDW9JVmVNwz3Q93embP
X-Google-Smtp-Source: APXvYqy5y6lKXLX+o71MJXPKSc5d6l/ZMVcS2h1ZjgLF4LekyoM/IAGcZ9q68crib4yG110sMXENhQ==
X-Received: by 2002:a1c:a684:: with SMTP id
	p126mr27667455wme.101.1558116735367; 
	Fri, 17 May 2019 11:12:15 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:33 +0200
Message-Id: <20190517181151.44001-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 19/37] libxcrypt: upgrade 4.4.4 -> 4.4.6
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
X-List-Received-Date: Fri, 17 May 2019 18:12:16 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libxcrypt/{libxcrypt_4.4.4.bb => libxcrypt_4.4.6.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.4.bb => libxcrypt_4.4.6.bb} (93%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.4.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb
similarity index 93%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.4.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb
index b44c07b4d0b..637c0e6ffbd 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt_4.4.4.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt_4.4.6.bb
@@ -9,10 +9,10 @@ LIC_FILES_CHKSUM ?= "file://LICENSING;md5=be275bc7f91642efe7709a8ae7a1433b \
 
 inherit autotools pkgconfig
 
-PV = "4.4.4"
+PV = "4.4.6"
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
-SRCREV = "3b251d4e1af66aa7697c4ac96c689f996fa90c32"
+SRCREV = "398943774c5ff38baf1bc5ee088855fd8983bb05"
 SRCBRANCH ?= "develop"
 
 PROVIDES = "virtual/crypt"
-- 
2.17.1


