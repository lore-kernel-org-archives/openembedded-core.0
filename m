Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	by mail.openembedded.org (Postfix) with ESMTP id B474E7C202
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:27:15 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id x85-v6so9111279ljb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5f4kvK4aV8u9OBweD0+eOoG7dlz0OIVtvSqTKj/oMMk=;
	b=sKur5Nw0SBEbNI+0c/wWDXpKZ+Bh8Vu2sFPatBpSkuIyrYeVR6EYknAgtz9gCRpikI
	50aSE2/b8AwWzc1ypUb16YA6/XL3DgkwnLs8dyohojuIPTxJSXqbn8oYN+L+1AjmsRmQ
	6gAWlVldkdB/ktppAeFHil6GHUGl6D26omsxxWd8ATECK+0X5GajLvoReqcmoBuKpdC1
	ENIgGmsr4xCN8y1oSqV0qZrBaLWJH3KIRWHTi2qRG2FcOxOKQA6aaO059lJ9OsUGQ3UG
	Ii8EZf7WklqSXA1QEO/+oaOCVLDiA0rqDwVfnPXfdxzUmulVqtLcmlxYERE6WQaFIlJb
	R7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5f4kvK4aV8u9OBweD0+eOoG7dlz0OIVtvSqTKj/oMMk=;
	b=kCvCLq/biTHfzPve0u3X8X5b+LpgN/AndgrAdpizzNcH/HGt+J7wHfsOPrXAa4rRqi
	LkcsuJKkZZ89LAAlmSOecDemnjk66EmDx5ZVQEKhMPQFZ2hWE2J0Q1EG8dpIK7fKdg9H
	riXcgI7fLx+j+n0wUiENM/xNsB0oM/KulYd+3wdCIkwgMSfp7O0jLY7UYsDpQrK0npEI
	i9o378MqEkJiLtMhXPoamY3iLkvRWngSCZpjtpj2rg+BCrnjFxOYTOtaPgkhRUY1Hrmj
	2ZPt5oQO9cYREePHpUX2k0WY+oSbUiGqSVcIqB8PXZEl/yWtuI6f9KLumjv0DtpF+m7I
	8m9Q==
X-Gm-Message-State: AJcUukdr88mAtbVAIlBHCW6sCBheZRwP3Wl113xl/PiSrdGC9Aj8nXOt
	kSpH47geCNu3kGDPhh8jopSOkzeD
X-Google-Smtp-Source: ALg8bN7vEipS1QzyAJn/AvEezrZgv4Inel7zAUGw/0qh77ukJkvUqok1OjLd6AF2ayOombXvJsPtQQ==
X-Received: by 2002:a2e:3012:: with SMTP id
	w18-v6mr9684012ljw.75.1547742435773; 
	Thu, 17 Jan 2019 08:27:15 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id q11sm358866lfc.92.2019.01.17.08.27.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:27:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:26:56 +0100
Message-Id: <20190117162659.24997-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190117162659.24997-1-alex.kanavin@gmail.com>
References: <20190117162659.24997-1-alex.kanavin@gmail.com>
Subject: [PATCH 08/11] powertop: update to 2.10
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
X-List-Received-Date: Thu, 17 Jan 2019 16:27:16 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../powertop/{powertop_2.9.bb => powertop_2.10.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/powertop/{powertop_2.9.bb => powertop_2.10.bb} (80%)

diff --git a/meta/recipes-kernel/powertop/powertop_2.9.bb b/meta/recipes-kernel/powertop/powertop_2.10.bb
similarity index 80%
rename from meta/recipes-kernel/powertop/powertop_2.9.bb
rename to meta/recipes-kernel/powertop/powertop_2.10.bb
index 4fe5447a03c..d943ba9f6e6 100644
--- a/meta/recipes-kernel/powertop/powertop_2.9.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.10.bb
@@ -6,11 +6,11 @@ DEPENDS = "ncurses libnl pciutils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
-SRC_URI = "http://01.org/sites/default/files/downloads/powertop/powertop-v${PV}.tar.gz \
+SRC_URI = "http://01.org/sites/default/files/downloads/powertop-v${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "583518c5c4434c6e9b9c58c3920950b6"
-SRC_URI[sha256sum] = "aa7fb7d8e9a00f05e7d8a7a2866d85929741e0d03a5bf40cab22d2021c959250"
+SRC_URI[md5sum] = "a69bd55901cf919cc564187402ea2c9c"
+SRC_URI[sha256sum] = "d3b7459eaba7d01c8841dd33a3b4d369416c01e9bd8951b0d88234cf18fe4a75"
 
 UPSTREAM_CHECK_URI = "https://01.org/powertop/downloads"
 UPSTREAM_CHECK_REGEX = "powertop-[v]?(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.17.1


