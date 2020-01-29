Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 39D9560AC2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 15:41:02 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id w15so4635782wru.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 07:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=SHKOyI6NQ9rlzhRgevJH75ptXKG8ow7sGLfS8NITBUI=;
	b=oWbfe8oIcl03Xo+Jw3MPe27qfIyqFFLyyDTLJdtFvHz91fczsWkelfAWfE5X+DDBcy
	iDYbonpBjVolGZhMr0UDTFpX84AcKT0UVICz1EgSWkyM1xWQtbKSKRQ7hciFFDfh2GJe
	TESbBFrbWLg9+tROOfnmUawpzO/SUq/B/htVYnjnjuoUITqXXnIq/ycJ6WlnWlk0Ch+/
	B21K+QhTGXwOGC0D9hjxU2ia0fA8LVRg64BLAP9BXCPpp8eJb9xcsw1YNdQqBuwOVJQi
	hfMsze2ytOivJiUON0etHOM38ahHDoAHOBMIUo1hOI8QdBLHWHlT0webwhetH0FPsmSQ
	WhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SHKOyI6NQ9rlzhRgevJH75ptXKG8ow7sGLfS8NITBUI=;
	b=J1xSLB9/diBCD4J5BDsnMMekxDqCIf79nRPaZWrl11SbgQ6Pc1QEDSzjX0/MOAEeyg
	x/08hqwfxsKp75H7cFCSOnbqcbLEjbwQWRB7GrxC+v2VRv3OVofn7+mPIcJ3DdJTQb5P
	9JfD+Dd0DIWSGSqASAktyQ/xZhAXtle52cwu15dIdcwxFycFG7m/bo2uDcX5qMNsJiu2
	JbKHX3lUIf8nPyAWgJWyrvDSiv7UjGdXg8cZB2+e6WJR1hqqm+RbfFsiFpTiO6HwWBz+
	aZR80G4hwmWoffw1kloyGFetLLCC2Vst24mr07Iy8WL6dPOZBCh5Ou76CPfw5/PHC2Ci
	IgJw==
X-Gm-Message-State: APjAAAVTA+X7oiVBdRqmtG1NrcAFB56gx63ItL6pTfhT10KLEFQ2THsS
	LHShO10fdHDB5JyY1zdgABkk6WyF
X-Google-Smtp-Source: APXvYqx8+D2HtCS6gnlhSPlxytIZeSTQ+poonriqkUfo26XdCLIwLoxL2aGrnvfXCbo96pTQsvIoGw==
X-Received: by 2002:adf:cd04:: with SMTP id w4mr6137675wrm.219.1580288894968; 
	Wed, 29 Jan 2020 01:08:14 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:25 +0100
Message-Id: <20200129090738.1398-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129090738.1398-1-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/24] ccache: upgrade 3.7.3 -> 3.7.7
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:14 -0000
Content-Transfer-Encoding: 8bit

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/ccache/ccache_3.7.3.bb | 7 -------
 meta/recipes-devtools/ccache/ccache_3.7.7.bb | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-devtools/ccache/ccache_3.7.3.bb
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.7.7.bb

diff --git a/meta/recipes-devtools/ccache/ccache_3.7.3.bb b/meta/recipes-devtools/ccache/ccache_3.7.3.bb
deleted file mode 100644
index c6a682ee0de..00000000000
--- a/meta/recipes-devtools/ccache/ccache_3.7.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require ccache.inc
-
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=0094c59039cec66b8a4c905204333514"
-
-SRC_URI[md5sum] = "7be62ea6e190941a8c12a3d5394fd926"
-SRC_URI[sha256sum] = "355955a61562c53c4ec4669e1c92708b0008f50d214b27f07a87cf4a1fa6b01e"
diff --git a/meta/recipes-devtools/ccache/ccache_3.7.7.bb b/meta/recipes-devtools/ccache/ccache_3.7.7.bb
new file mode 100644
index 00000000000..3e7362b28bc
--- /dev/null
+++ b/meta/recipes-devtools/ccache/ccache_3.7.7.bb
@@ -0,0 +1,7 @@
+require ccache.inc
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=22d514dbc01fdf9a9784334b6b59417a"
+
+SRC_URI[md5sum] = "500d7bd9ebc6ee3105d7fc332c1ef395"
+SRC_URI[sha256sum] = "9b61f7fab2ec15305ee8382b03365503232dfb04b57414e7b0433768d530fa8a"
-- 
2.25.0


