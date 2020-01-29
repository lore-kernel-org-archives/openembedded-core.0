Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id B7E4F60A88
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 15:43:23 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id q9so4266911wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 07:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=iau82+O3pXNKKDPFcnQMxmRdZeKKj4KHtJmlbjuYSuM=;
	b=pUJrEOovaDWgS5Gppo2sTi+XyjYi5Suamt9rf34Z9FeuU2Lta3Ta9Mn25pgAe8gq/G
	r+bDG3neMg7jVMPtAydI1xXZyZpDzIcyAgk8AdKVtkFUCgq/Ko/V4bK4UuHcE0lOcrG2
	UbJu9L/0qYwi76p2ViWsIBezsGxqXtTf8PULecy6ggBMZryfMyNirc4Z2nY9EXMdAoIF
	0mGyLdWESbZ3CooDzi1dDiMxcbG1hXyy3HvyNPaSBnkXZA7U1T276g34u9tqxv8QarMv
	+IxS7IquhJe6gGs7CRz4SCoE2Djvg0McWnjlOW77HHx+avl5hgcJUNxdHnPcx/L/WwrK
	N1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=iau82+O3pXNKKDPFcnQMxmRdZeKKj4KHtJmlbjuYSuM=;
	b=GqsVaIe1+XLbV3SHhebEjYHnbQuGPceZBJ1xTh4xtsMHsNhGr06c+gkyL9hYjffE6W
	LuR1LHvuD/vqw+dWuzJz3hro91sewaSR+vExHr0wU+tNdroI6ZL0e8k+Oy5cSeT9yNg8
	Sde8na6Ooev7JGTUMtgvpjyOKcb9RifyfgeuZ0e6IpV74NUSnTHuGBW3t+rDtZuq1dID
	q/vDX42pKk2ZKNErYG3sf8a0rb0ISyYrvvM3bOgPlLDEV7CwPcoIr4rIGAdcLLjYzRWt
	FCp6amsWtt33X9a+FyBta4hjSKMm6dlBaJ/KdenLVoUj2Khf/dzwMRxIWWHyN0LY89E8
	zlnA==
X-Gm-Message-State: APjAAAWh45aV0jrPStqheFIRMgCJKAeb9hviQHUqFiz+hItqvEKRU3kL
	iv0OWXs1njITt7R+E6XJLmgBgHIp
X-Google-Smtp-Source: APXvYqzCvs8UiZaV6530IxjGakQT2HXTlNdw61DzS4TlXgOmaLo1K4TelCXjUoXnQDhpj5dY/xvn5Q==
X-Received: by 2002:a05:600c:2c41:: with SMTP id
	r1mr8937371wmg.57.1580288898471; 
	Wed, 29 Jan 2020 01:08:18 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:29 +0100
Message-Id: <20200129090738.1398-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129090738.1398-1-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 15/24] python3-gitdb: upgrade 2.0.5 -> 2.0.6
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
X-List-Received-Date: Thu, 30 Jan 2020 15:43:25 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python-gitdb.inc                 | 4 ++--
 .../python/{python3-gitdb_2.0.5.bb => python3-gitdb_2.0.6.bb} | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-gitdb_2.0.5.bb => python3-gitdb_2.0.6.bb} (97%)

diff --git a/meta/recipes-devtools/python/python-gitdb.inc b/meta/recipes-devtools/python/python-gitdb.inc
index 633752fd1b0..23ec2986b15 100644
--- a/meta/recipes-devtools/python/python-gitdb.inc
+++ b/meta/recipes-devtools/python/python-gitdb.inc
@@ -8,8 +8,8 @@ inherit pypi
 
 PYPI_PACKAGE = "gitdb2"
 
-SRC_URI[md5sum] = "94e59e5fb00960541f6e137b1456ab0a"
-SRC_URI[sha256sum] = "83361131a1836661a155172932a13c08bda2db3674e4caa32368aa6eb02f38c2"
+SRC_URI[md5sum] = "1a7ea3362e405f8a5634f7ee53636094"
+SRC_URI[sha256sum] = "1b6df1433567a51a4a9c1a5a0de977aa351a405cc56d7d35f3388bad1f630350"
 
 DEPENDS = "${PYTHON_PN}-async ${PYTHON_PN}-setuptools-native ${PYTHON_PN}-smmap"
 
diff --git a/meta/recipes-devtools/python/python3-gitdb_2.0.5.bb b/meta/recipes-devtools/python/python3-gitdb_2.0.6.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-gitdb_2.0.5.bb
rename to meta/recipes-devtools/python/python3-gitdb_2.0.6.bb
index fe158327cbe..2dcd9c8affb 100644
--- a/meta/recipes-devtools/python/python3-gitdb_2.0.5.bb
+++ b/meta/recipes-devtools/python/python3-gitdb_2.0.6.bb
@@ -1,2 +1,3 @@
 inherit setuptools3
 require python-gitdb.inc
+
-- 
2.25.0


