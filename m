Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 52E4178289
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 04:56:07 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m75so7393131wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jul 2017 21:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=AjZNjrfmIQHjkYlKef6h7Npvgrog/Yi91JDZHPqtsoI=;
	b=ZaLWnxgQ/telbhIxUPIB2WdQbR952LZE9v7IWh9hoGInDc/RUiIRzk1yxI67NJD7/P
	09sLhg9jJmlH53k9KgdPNQfK9M9gExm7A4LYvjnKMvSLTdHrxIrMjX9lDRVqpilLvZC7
	ghnDOXlMUEzGO95+MxsKv9jaDt5448NwsaU7vvchYRq0uD4lX6P9nejG/oSwhDwTJ77u
	8B17MMoZgG62Ee6rc5oDCiYhTJDQh+zW5BkP3AgVNZuKRBXTBOcDTMAoO4bFwGnKQUHm
	qdQqukOr4E3tPQ7tIb8nvCood4XbFSu46xcSu4OcnHtxXoVO50CvW+GVWoPwNP2KEn6Q
	F/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AjZNjrfmIQHjkYlKef6h7Npvgrog/Yi91JDZHPqtsoI=;
	b=aTiAuCGg3bB5HIrDvETpsvbwSEAspDxobxVyJYmzoVOEzGkG8VIJLds5RKUaizx+bo
	PA6d42GEASrjS3gntZ/q0m+TpBN3dn0KXMtNoWEacVZsTOrlHbFidLASMCEuORHcRSIU
	kSMru9RliDkq90ie3WDnXqhsJB90X3ZTX7lstu63b1dbaKaKntmGWBu1DSgX/aWGTS1b
	y1dMLe1dfC8g/cmhufaepCAztqlWexL66r0tE7xadQmclxsMwmJKzzvF09aN3a2y2M0Y
	EC3cCrS/1c7V9HG1g1ONaXL4QIWjbki0LE7itM41wSl/JcNAzNGcxtyXDM86IChHyZl2
	HK/w==
X-Gm-Message-State: AIVw112YTy8WqRfqKp406U1Sit1n8l/PiSr9Mi3dfAMMhm/fgCQfwD/a
	kvFZJs0fiPf4/OMW
X-Received: by 10.80.145.2 with SMTP id e2mr14176174eda.8.1500872168742;
	Sun, 23 Jul 2017 21:56:08 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.119.192.124]) by smtp.gmail.com with ESMTPSA id
	c56sm6805536ede.21.2017.07.23.21.56.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Jul 2017 21:56:08 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jul 2017 06:55:52 +0200
Message-Id: <1500872152-28584-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] package-index: inherit nopackages
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
X-List-Received-Date: Mon, 24 Jul 2017 04:56:08 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Drop deltask do_package* syntax, inheriting nopackages instead.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-core/meta/package-index.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/meta/package-index.bb b/meta/recipes-core/meta/package-index.bb
index fe022ff..a4123b7 100644
--- a/meta/recipes-core/meta/package-index.bb
+++ b/meta/recipes-core/meta/package-index.bb
@@ -4,17 +4,14 @@ LICENSE = "MIT"
 INHIBIT_DEFAULT_DEPS = "1"
 PACKAGES = ""
 
+inherit nopackages
+
 deltask do_fetch
 deltask do_unpack
 deltask do_patch
 deltask do_configure
 deltask do_compile
 deltask do_install
-deltask do_package
-deltask do_packagedata
-deltask do_package_write_ipk
-deltask do_package_write_rpm
-deltask do_package_write_deb
 deltask do_populate_sysroot
 
 do_package_index[nostamp] = "1"
-- 
2.7.4


