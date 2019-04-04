Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id E6D847D45D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 22:16:56 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 4so4738189wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 15:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=i1z15cK+pxeM88okhoBfO8Cc9buWEeDOQ639wSWAEgY=;
	b=kekp7Ua5olx6kb5shv8lOhHmpSMkliRBhc1TVzv/0RK/J21d/b8bZ/jLeYlGFuhrbf
	s8NXOQ+/00yMeN/CWTWxpSio5NM4WRd5jueb9egvNVx/Ns2We5T4DO2JVs9kos7GDLSL
	Dj9Cc4zoKlqioV9Quji7W+3G52W52nUnw6dulbg8kkOC/zWmpTvny+nVTy+yrF/rVY+q
	OGibVQ9c0xWuE17AL4H3Vic7Ek3ECL/XXdrPJkLixYb0gkKVNakWGFt0NZZnWDlOcMUL
	po4vHmKlqhOFfUGyM6IdTr3dQFHVvMn8PQ0a18a0Zq7LShrZBuym4aPQBR09vGtzgFbO
	Qb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=i1z15cK+pxeM88okhoBfO8Cc9buWEeDOQ639wSWAEgY=;
	b=jUMyn3vqdutnOETYgNdNaoSuP41IZRbTahgpF6MdvIdZbieFrK8Z6F0txUHsbHQlMA
	1UUfMfLDI3z5nOcxe++N77UyOxUG6SxmC6/zhsQkcsS5ZRdsl/1CSUHrJdHXascZST+2
	Myo6PX6kKuaDomcF4osTvLG/pdt7kP7MvC22gkDgORkdLgkDH+HebzG7ep6TmLIGlGkI
	6ZZv+xUVZtsDgC2zLgD0JdrjNakp2v5IW4Q8HVOmbfDlwPurNuIyhonYauZx8kzFaVhQ
	dBhFApyg+LQRRYsIhQRQ8SzGEr4LE6DNUGPG6O1wYswn7eAbHH7NSEarIBZ+DNemXRcg
	R+cQ==
X-Gm-Message-State: APjAAAV4jfcymbO1ktJ9HQwZf47xObnxrOpwnogVmdBJkIfeU8lLj+1Y
	46Eo8b+fLwNJR8QHMn2FAx+xMk2WOdE=
X-Google-Smtp-Source: APXvYqxH2tpZCOAwrzBVoswbUu+1wXt7Gt8F5Z5qSTQK8OveZ09bxllBqwWoTRMHyHgeukBWmPCH7g==
X-Received: by 2002:a1c:6588:: with SMTP id z130mr5689040wmb.39.1554416217511; 
	Thu, 04 Apr 2019 15:16:57 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d3sm305565wmf.46.2019.04.04.15.16.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Apr 2019 15:16:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2019 23:16:40 +0100
Message-Id: <20190404221644.20496-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190404221644.20496-1-ross.burton@intel.com>
References: <20190404221644.20496-1-ross.burton@intel.com>
Subject: [PATCH v2 5/9] libxslt: update for new catalog path
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
X-List-Received-Date: Thu, 04 Apr 2019 22:16:57 -0000

The XML catalogue is now at the canonical path, ${sysconfdir}/xml/catalog.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libxslt/libxslt_1.1.33.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.33.bb b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
index fd442d44f72..28d404ca779 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.33.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
@@ -36,9 +36,9 @@ RPROVIDES_${PN}-bin += "${PN}-utils"
 RCONFLICTS_${PN}-bin += "${PN}-utils"
 RREPLACES_${PN}-bin += "${PN}-utils"
 
-
+# This is only needed until libxml can load the relocated catalog itself
 do_install_append_class-native () {
-    create_wrapper ${D}/${bindir}/xsltproc XML_CATALOG_FILES=${sysconfdir}/xml/catalog.xml
+    create_wrapper ${D}/${bindir}/xsltproc XML_CATALOG_FILES=${sysconfdir}/xml/catalog
 }
 
 FILES_${PN} += "${libdir}/libxslt-plugins"
-- 
2.11.0


