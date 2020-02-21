Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id DB1C06161C
	for <openembedded-core@openembedded.org>;
	Fri, 21 Feb 2020 02:54:05 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id q39so94926pjc.0
	for <openembedded-core@openembedded.org>;
	Thu, 20 Feb 2020 18:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mX2zETm5OlrRRKNoddYNBqWs35AIXwo8ztjalubyfAM=;
	b=Z+p8vjV3M1bIqrUMPCwAUudWO93kdQG98siSdXqLTaxEojJIiga+YFUEoCNfFMKZyY
	KZ7kPbG43rWN8Cyi8DWGjpoH00A9QnAztyIno4/ZazOI8N0brTnc6FWEqTXASh60r1EF
	VbwUWLxedwojZfsglw+mbD7j1UWdRIWrfQGDwH/FjNc0hdm+e0UbTcRX7MblqZ1BW0kT
	DOQtpNNXsLpK3rCDFMbeKueNCwNYQ3NyQJ2JTcYTcNsMVB4O+lrHq80xsWxk626JTWwo
	KyIhYoslQfQtWxXe9nrEn2efX1dt2ioWdR7KT8TDXf9mbOenMTUXFL7YHCooyptLNjm5
	jWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mX2zETm5OlrRRKNoddYNBqWs35AIXwo8ztjalubyfAM=;
	b=H1zz8y+puKV1KF+jLcnPryAh2Vh5x1Mz/Rq0m2nJZFFk+07fSnqySsaWHH4xbTu6fN
	e8LS0hQHOer7aaofMK7OL/UuNCv3dYrskx7PNUobsxJ4Q2jEciK7f2ZZqEnNKJa2RyRs
	XhLIpf7xQh+ZxCtybkiSmB+fOEReDy7jBI1oDjEagIMiE70LTEusVeE1NvyBS1qr1EsW
	25UIz5sOP5wDdN/RZHvgFGun8U6Y/Qq8a41R5oAZNBtXCcPAo+G8Q67DZeYNgKH1+Ds9
	pHicAFRjm+KfDdBjVtaCeRZRlZaGkfjYFhiCSO+DLX6iYOdMX/PMy6LUZetPDe5SxGq1
	61IA==
X-Gm-Message-State: APjAAAV+SRbEo+UFZHi69AACDBNU0z8iMcbvSf46E0ATZ6ZnJW9sch84
	fkvI7XEmgpElbQ8l189nGRQBzkqG
X-Google-Smtp-Source: APXvYqzFMdbh49zxlVF6UgbMhGijLtFGS8TNFEBwn2o3ti4W5a3RbiP58tOQ0us+/hyho8T+4VtIvQ==
X-Received: by 2002:a17:902:82c3:: with SMTP id
	u3mr32351630plz.73.1582253646904; 
	Thu, 20 Feb 2020 18:54:06 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:88be:17f0:935c:9e35])
	by smtp.gmail.com with ESMTPSA id
	y10sm925320pfq.110.2020.02.20.18.54.05
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 18:54:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 20 Feb 2020 18:53:29 -0800
Message-Id: <0d58f5a01c7d49765d66a7e2d73eef0adb868eac.1582253544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1582253544.git.akuster808@gmail.com>
References: <cover.1582253544.git.akuster808@gmail.com>
Subject: [warrior 10/14] timezone:upgrade 2019b -> 2019c
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
X-List-Received-Date: Fri, 21 Feb 2020 02:54:06 -0000

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

-tzdata : upgrade from 2019b to 2019c.

-tzcode-native : upgrade from 2019b to 2019c.

-tzdata.bb and tzcode-native.bb require timezone.inc.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit c5a382429d18642d35d40a4df6a58b971c724603)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/timezone/timezone.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index ce16524ebb..f6bab1acb4 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -4,7 +4,7 @@ SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2019b"
+PV = "2019c"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -12,7 +12,7 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.md5sum] = "91e0978d947496fd6aaf46d351f9c41d"
-SRC_URI[tzcode.sha256sum] = "2e479d409337da41408629ce6c3b4d8410b10ba6d4431d862e22d2b137d7756d"
-SRC_URI[tzdata.md5sum] = "b26b5d7d844cb96c73ed2fb6d588daaf"
-SRC_URI[tzdata.sha256sum] = "05d9092c90dcf9ec4f3ccfdea80c7dcea5e882b3b105c3422da172aaa9a50c64"
+SRC_URI[tzcode.md5sum] = "195a17454c5db05cab96595380650391"
+SRC_URI[tzcode.sha256sum] = "f6ebd3668e02d5ed223d3b7b1947561bf2d2da2f4bd1db61efefd9e06c167ed4"
+SRC_URI[tzdata.md5sum] = "f6987e6dfdb2eb83a1b5076a50b80894"
+SRC_URI[tzdata.sha256sum] = "79c7806dab09072308da0e3d22c37d3b245015a591891ea147d3b133b60ffc7c"
-- 
2.17.1


