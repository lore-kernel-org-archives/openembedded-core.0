Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4FF667E3F1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 23:40:30 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id p15so1807398pll.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 16:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FU36oojCpCEFaJHuumanlIBHSx4PmWr6WPAKYGH1Pf8=;
	b=lnAF7ArRgDEvH+sTjNUKdtGLTS4MMkb0Dkb2Iwz2lXQsU15uf7orNNeQJR8ZPFtiP3
	FQyPqAc8poi+ZmWgKWr5pfMPtBtI23n//on5DhVl6C0ivI9Vh0jjQZyuNGiw76qkBG+p
	xNHZ2+ZebRteJGTKGMuoU22kEDV1pgulUpHeVk0OQ8ai1NBB5CT5wwcnO/pHnsJllLtf
	Abmlh9nmqSbiW54DeEN0Xy+PZWLmPfbnYq1+bSuEXYHKIcZW2g3gKYJhv1El6kiwonpz
	pifJX5n9YG4AWcNQ8cvTC48j4NuCw5SZtKVLfkzbfb4Ytqkm81ybD6CkAhYPNL1nAlx8
	ry8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FU36oojCpCEFaJHuumanlIBHSx4PmWr6WPAKYGH1Pf8=;
	b=izb2cHGtFO6U7IQueuia+tlD5iL7eM1mfLsiXt+YhgK1iUGAxCggzC8JV2tf4UOxcq
	vU6MVL5QYk85209GCIzcdEg3a9dQZkbuf0TEV+MKN83E2nPglaIMCBjzQI/qCNwg8KHE
	Kitu6IaOywvj1U4LBJiuoXjYSqxOH7O7Gi6GB7R9HP0O09eddcJ3QFf8Zx9MWgN+gOgu
	n+0uDTlTiiFNao0zPJ4k1s0EqsLBL2eyg47MdU00Ih41s9sjWCF0jONCejemMo/Poyq1
	M88RhQ5ZG/wDYHIWYNGg4/ouRYGmkiqmmrMVhcnq5SkCrVHZa6Bfrn+BvkcNAVLI/2P8
	k7bA==
X-Gm-Message-State: APjAAAUAEggABcDWN9G1vnCtw6uLXB5rSYbYlo9FarroTwoZSSGnDBWy
	iGPb9odganSJe6sRMjapfYJKo0KdigA=
X-Google-Smtp-Source: APXvYqwKOwbhY4rG2r5MkpqX/t3B2UTsA5BVoS2tK+WQH8upPeMlNx/KMmZVZG4X7TkDUp4OaL07Og==
X-Received: by 2002:a17:902:9f8b:: with SMTP id
	g11mr86968667plq.199.1558568431075; 
	Wed, 22 May 2019 16:40:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::e252])
	by smtp.gmail.com with ESMTPSA id
	h6sm39453465pfk.188.2019.05.22.16.40.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 May 2019 16:40:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2019 16:40:18 -0700
Message-Id: <20190522234018.30565-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522234018.30565-1-raj.khem@gmail.com>
References: <20190522234018.30565-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2 4/4] maintainers: Account for musl-obstack and libssp-nonshared
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
X-List-Received-Date: Wed, 22 May 2019 23:40:30 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
v2: Rebased

 meta/conf/distro/include/maintainers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 67a51cdecc..2c10b104de 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -382,6 +382,7 @@ RECIPE_MAINTAINER_pn-libsm = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libsndfile1 = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-libsolv = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libsoup-2.4 = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-libssp-nonshared = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libtasn1 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libtest-needs-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libtheora = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -512,6 +513,7 @@ RECIPE_MAINTAINER_pn-mtd-utils = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-mtdev = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-mtools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-musl = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-musl-obstack = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-musl-utils = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-mx-1.0 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-nasm = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-- 
2.21.0


