Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 963ED745BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 12:28:26 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id r21-v6so8482030qtm.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 05:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4YXkH7h492+eDrpdwaV0CjUA8qqqdFeBdcusN7C+sS4=;
	b=iJrDdhoEW+ERsMOyFASEJQAZH9Mlx0b3etGqM4YWlgRp7m8tlu4JTao35fZc2rLG0Q
	JwjFwVvRr0pK/IYW2G3p7RrpyOLDTKvjUN3m4+nDU2n88qMyG6BCpe+5HUgCPciiWvx6
	UzJpevDgHoxDZ79TVDZM/bA5qA1WabXkg1yB26zsj1CEhGOViZvQ+AcqMMAZae1bUPDa
	o1sowff8ce58ZxtzAI0YomCVwGy9oqNCQMbRLKF09ft81H7IV8ZO5tZlH6uWXRiWKpuH
	0w+L4/kPPmN4QIKw4H8gZlWFb67O5zJkUyBXj1oDEN3eu6elsdUXEj/Si3iGxMWQnry0
	kLtQ==
X-Gm-Message-State: AOUpUlGT7BhJ8MCVgG7TbHyyCq0t0yMNwq+udxaOMPFVehSXIaC0yOso
	vnna793fnpx+ZQ5azky5yxT/hfD5
X-Google-Smtp-Source: AA+uWPz6FlDhup5EoqIBucS7QJDwmBk+Hi8G+xBuperpSJTGoRMWY6/jWGBB2vPN6K+59NQuYegf5A==
X-Received: by 2002:a0c:d24d:: with SMTP id
	o13-v6mr29708045qvh.210.1534508907125; 
	Fri, 17 Aug 2018 05:28:27 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	u25-v6sm1107414qkk.7.2018.08.17.05.28.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Aug 2018 05:28:26 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2018 08:28:20 -0400
Message-Id: <1534508900-1733-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-gitdb: update to version 2.0.4
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
X-List-Received-Date: Fri, 17 Aug 2018 12:28:26 -0000

Update to the latest stable release

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-devtools/python/python-gitdb.inc                         | 4 ++--
 .../python/{python3-gitdb_2.0.3.bb => python3-gitdb_2.0.4.bb}         | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-gitdb_2.0.3.bb => python3-gitdb_2.0.4.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-gitdb.inc b/meta/recipes-devtools/python/python-gitdb.inc
index 2d5292e..789ab95 100644
--- a/meta/recipes-devtools/python/python-gitdb.inc
+++ b/meta/recipes-devtools/python/python-gitdb.inc
@@ -8,8 +8,8 @@ inherit pypi
 
 PYPI_PACKAGE = "gitdb2"
 
-SRC_URI[md5sum] = "d5217eb94ebd36fcec62b929d1f72b00"
-SRC_URI[sha256sum] = "b60e29d4533e5e25bb50b7678bbc187c8f6bcff1344b4f293b2ba55c85795f09"
+SRC_URI[md5sum] = "6e21f5795a204f7afecb0a72fff66932"
+SRC_URI[sha256sum] = "bb4c85b8a58531c51373c89f92163b92f30f81369605a67cd52d1fc21246c044"
 
 DEPENDS = "${PYTHON_PN}-async ${PYTHON_PN}-setuptools-native ${PYTHON_PN}-smmap"
 
diff --git a/meta/recipes-devtools/python/python3-gitdb_2.0.3.bb b/meta/recipes-devtools/python/python3-gitdb_2.0.4.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-gitdb_2.0.3.bb
rename to meta/recipes-devtools/python/python3-gitdb_2.0.4.bb
-- 
2.7.4


