Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id C521879669
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:40:52 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id j62-v6so8498587edd.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Jp3QGFbQrN2aEaktaNZFzgsaQel9djicnn1tzl8Er9Q=;
	b=sj0riunczlEdD+TCZUjMbAOLU0zMJybitIopzLp9dPvNltj8ZTJsisfM/MLQ5BDUaB
	IjfcFlL+GPDCCTtx5sFAVr7Cah1xvO3A8/G2lp0rCyz4aXIhyyBc0leFos6u8xHNsNUE
	vl/4IWzqiGsGFp+hOlYs2ia7K5tLoN/pE7Vk1wWKfl0DX/WqJYxcZJRHJdQ01JlXfBcW
	DpHXR04nfMf0tKXWT3caRDOzqcotczLtYD6F3NTE897wZKhJPqRnE4Dd+GFltMI6lql4
	G54ysNqm6VI9dFQfWKphnvg6r9Uw87eb4XLdn5ucfaDI0bUN5krhOMjRCGwb1a2DrdoB
	nJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Jp3QGFbQrN2aEaktaNZFzgsaQel9djicnn1tzl8Er9Q=;
	b=lPUxUcFNQIZ/9WrdscD1KuRZQZkKOhUaq0UOOR+GEX7KN1Of9VIv3dFF0nOBmNCths
	bTIHWSFM3LBBbd2JqlXA6np6Ckfca+4QpJFpwEhlCreI01chcqgru0ExYZVGzEJfuLSv
	qQF7KrO3tXhLmF3MCK7Bv2ILi2sTIB/iV0tFar7zOr4uuWaXLH5wkgc7iDWYAPPSQkIy
	ZeTSzR/csWCqQyjrMnWaAEIASiYUpj6Yye5Rm4qpA6wfoHN657kNywS+w4WL5RGB0d/7
	08shDtrU4eTAcXA3BSeCumYVrsPBUr/1G9Zs8jDlCU1akPFylhnfMcDsm9eLaNRg8PCJ
	+aBw==
X-Gm-Message-State: APzg51Ccc45E+DfTheIyTzdzx8SKSBvm1RgCpxANbXkSaqU32UdNSr1w
	73oyl7lj6DCNbsMU0zP0kp12RRczts0=
X-Google-Smtp-Source: ANB0VdajMv7xb8tgB1v79BBJlXRRdH5derKEI4Q/Lh68pbd6w4IOPjl5IsT9Woqc80kiIknJsjPZkA==
X-Received: by 2002:a50:a8a6:: with SMTP id
	k35-v6mr2795867edc.135.1536230453308; 
	Thu, 06 Sep 2018 03:40:53 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	k28-v6sm2256506ede.11.2018.09.06.03.40.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:40:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:40:30 +0200
Message-Id: <1536230436-30342-15-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
References: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCHv2 15/21] gptfdisk: update to 1.0.4
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
X-List-Received-Date: Thu, 06 Sep 2018 10:40:53 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/fdisk/{gptfdisk_1.0.3.bb => gptfdisk_1.0.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/fdisk/{gptfdisk_1.0.3.bb => gptfdisk_1.0.4.bb} (86%)

diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.3.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.4.bb
similarity index 86%
rename from meta/recipes-devtools/fdisk/gptfdisk_1.0.3.bb
rename to meta/recipes-devtools/fdisk/gptfdisk_1.0.4.bb
index 4d617e3..4426a79 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.3.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.4.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "util-linux popt ncurses"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "07b625a583b66c8c5840be5923f3e3fe"
-SRC_URI[sha256sum] = "89fd5aec35c409d610a36cb49c65b442058565ed84042f767bba614b8fc91b5c"
+SRC_URI[md5sum] = "5ecc3c44913bb6b53d3708d1ac7ac295"
+SRC_URI[sha256sum] = "b663391a6876f19a3cd901d862423a16e2b5ceaa2f4a3b9bb681e64b9c7ba78d"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/gptfdisk/files/gptfdisk/"
 UPSTREAM_CHECK_REGEX = "/gptfdisk/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.7.4


