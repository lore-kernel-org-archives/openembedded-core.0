Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 628AC7DEDB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 12:26:45 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id h4so19004152wre.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 05:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=G8+PS9L1tjKVrKOxIHu69zIixAqLx4PCjDBB6Z5icWM=;
	b=bZVSNk9VZ0dZYTREzeSfABJzDfW4Xg0sWZggnTXbPpNJKLn2i8z2fdbg7alNUIzoaS
	0dAN3WpG3xSv0NExmDiyLrqiJKc4IJAltwCoqNZpRlxq9R/6R4R4TnAr3JjJ895ENW04
	/OMLG/ofWFdm7SEakCrHjqYkh3adMzZC0y11N/RG5Ond43Xbv2PGauZeRS63fMnwgClO
	dONiygDuH4oTAeyjeK36x12yypwK88WacfDLmVp335ADWEm7Kr2VJ3kH3jytu3N4lmhM
	gioX2uzd8Iy6WVPHFfJAMMJpyGx4oX62gGsTAoW5ZYHdr1vicnOZUNgFLv6Z8G8pillO
	B6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=G8+PS9L1tjKVrKOxIHu69zIixAqLx4PCjDBB6Z5icWM=;
	b=JqiPQqzWBCTX+3ruf/Muv6YQTrVAtZVyeUqRTyT1/zPOoLN3zZhhST2lLBvb2Yx8FI
	U2Q3J7XfW/SL4K22vVTYIsBukIovWJBfjUqttOILbNjzFqj/HnR5e8ppHGp7ArfqcJQp
	BdRhifOMOZ9XigKXOlFpwednZ9h15V7YtYsAu8mQKgnPBVTAfEh8KA/Jy1PU6ZjAuxe2
	8nDwFiJfCAiBqyASJTCpuZMLBuzCS13HfZbsDNDpAgdhmjEBz6Vw1Xcu/3NTHZZIKB19
	flfggzV5b9wfEpf74ACDOxH/OuP7AVlMy517/ViaiCL0U66hpwXb9JhezZFam1Ih1JGw
	TPYg==
X-Gm-Message-State: APjAAAVB3CjUCVTb0qoU2qzACmZJVk6rjQnUWhWYfetkk/RZz2lyJxZh
	ezEHlSgiSnL42TASGZ3MTfIBaV++zMQ=
X-Google-Smtp-Source: APXvYqwpMvvI+BxH6+rNNdwpDhPYK9oy6ABa48T+uHBjejgi2La+N8vY/4R9VVOH97CWSVJAqFE54g==
X-Received: by 2002:adf:fb47:: with SMTP id c7mr6894013wrs.116.1557836805936; 
	Tue, 14 May 2019 05:26:45 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id g2sm8124457wru.37.2019.05.14.05.26.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 05:26:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2019 14:26:37 +0200
Message-Id: <20190514122639.102946-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/3] packagegroup-self-hosted: drop epiphany
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
X-List-Received-Date: Tue, 14 May 2019 12:26:45 -0000

Originally a web browser was added to build-appliance-image to
enable Hob's use cases that involve opening a URI; with Hob long gone,
a web browser is no longer necessary to have in build-appliance-image.

This will also address the out-of-resources problem when
build-appliance-image builds itself in a VM, as a test case.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index b296db5457e..f206cee3731 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -189,7 +189,6 @@ RDEPENDS_packagegroup-self-hosted-graphics = "\
     libx11-dev \
     adwaita-icon-theme \
     xdg-utils \
-    epiphany \
     l3afpad \
     pcmanfm \
     vte \
-- 
2.17.1


