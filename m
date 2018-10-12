Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id A88CD79B9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 11:15:04 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a8-v6so12504652wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 04:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=dnlXEykdC9TNvga+0ZfdnyWRnGQLnWCPbLHyLMw32rs=;
	b=YnJtOLcK7Ap3yvFoU2tPXyNXI85kuORmLgiepUq3zX8Nomty9FGP54ZOxKFvtMDCRv
	Uof0TLM3Z8IGvozlIVVVeJ1yXoIXazuFZ0mgRLtGqE2DAup9f8G3jrHLg682prkqiiua
	Bhi0sXtWHEefFA1MrVLEy/LyN0p8Y/Mx3/QYzeI5A0DKZPeqSLSzpHS61jij+h+WEVdW
	jO10Hcaq5wVns4Lhe2L9gfi4rJIZqIU2UQzv5H3F0/NT0BU1LOLj7gbOyN4/k77gjIGY
	1xLwNWOX8zPxQGdlP/YdlQsQdHQpSOJbZVgArlmsuxPmZ5q80EP7WBUXgq8HEXvuZJe2
	mbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=dnlXEykdC9TNvga+0ZfdnyWRnGQLnWCPbLHyLMw32rs=;
	b=ay+CjeJWtqEdPCF1C7CKADwnuWeMh8D0LbeWIU52kNd6l+zTri/02XbMDmTSKWzJX+
	z/kfwMAzfd1DaIqRog8wrKlzj6XjEJNVNjdo3Kt0DGbLDb8bffL/twTlhzx7xV1YoODv
	8f3I23VK3UKaJsYqvNQqXx01jspSrTqrbsWLe2EQWwUfL/8o1hrVGdinX7ZxnNQB3EOH
	9AH3oozNacidQeLXvWmtd79BH5UNltlVTZJ1ydIZsAYSRN82BEc1YxPidsodqbjyW9s0
	hhshmzYgMacjcgSmeNW5rEGh37fz2stQqDdWwu8DD5UTEwRITER5spl2mtzoPHy7cdHz
	TuBw==
X-Gm-Message-State: ABuFfojPG0pLrXTJZtkMrswbwCX8ZjaBGHiqo+AS76gpXczi4ghemXz2
	Vjfr4tQMxNHxo3ERhxE3dNlxr+M7O64=
X-Google-Smtp-Source: ACcGV63ucbBCK57gXvnU6YOaZtVyc7sKxGUoR3lnxFQuObzmSBdjzNbz8pkAbSCKyy+A5intmakmLQ==
X-Received: by 2002:a1c:b9cf:: with SMTP id
	j198-v6mr4702230wmf.57.1539342904951; 
	Fri, 12 Oct 2018 04:15:04 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j9-v6sm850186wrt.32.2018.10.12.04.15.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Oct 2018 04:15:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Oct 2018 12:15:02 +0100
Message-Id: <20181012111502.2354-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] e2fsprogs: add perl dependency to e2fsprogs-ptest
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
X-List-Received-Date: Fri, 12 Oct 2018 11:15:04 -0000

Some of the tests need perl, so add it to the RDEPENDS.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
index 45c96742c7e..ce95dec5fec 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
@@ -112,7 +112,7 @@ ALTERNATIVE_LINK_NAME[mkfs.ext2] = "${base_sbindir}/mkfs.ext2"
 ALTERNATIVE_${PN}-tune2fs = "tune2fs"
 ALTERNATIVE_LINK_NAME[tune2fs] = "${base_sbindir}/tune2fs"
 
-RDEPENDS_${PN}-ptest += "${PN} ${PN}-tune2fs coreutils procps bash bzip2 diffutils"
+RDEPENDS_${PN}-ptest += "${PN} ${PN}-tune2fs coreutils procps bash bzip2 diffutils perl"
 
 do_compile_ptest() {
 	oe_runmake -C ${B}/tests
-- 
2.11.0


