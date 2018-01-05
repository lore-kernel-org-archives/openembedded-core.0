Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B9AF178816
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 13:06:17 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 9so2334573wme.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jan 2018 05:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=o4KW4/+scupakW/UKwlQZct77GZyITlV+FX1UeriWEA=;
	b=afejZvzDWduqADKz5XqcVug9q5GwpBJwmCvdVTJVPb0yZMciJeltdbnj4YWEmB8cD5
	ql9GxhZO7VqQvtjd+iTSUJl8GNCJdVhwHUYmYt6+duXpuComgaG9kRoPyFNlKQYB03e6
	Gvq1RDkvqYZH71FASNbEbu546I5EFD6rzAwyRiytYVBS14SVg9RLPDxteo2RiCgOIDR6
	iKG7YjX0FHLmM1QwXHsOuxEgRoV1oZNCrV1FoMY65DYEHbXkE/PuwUORD8wlEsb6sJAt
	C5gGINJaQHz3gLi+OEgVq2Mn8ScRmYqTDOkhGdPHIAC3VORzSDc4xrnUsEZQOLPfCWXS
	vpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=o4KW4/+scupakW/UKwlQZct77GZyITlV+FX1UeriWEA=;
	b=WPnS6r7lAIl+9bW6K7uA3inCXI/5siG9HOt/VXUedkbW5vUXz3X0kVJBDxGE8aKOC9
	VGUo6NkxTpmM9xWgBIBmDLRO4cnMrbFKSUX9OG/ePGe0l1GvRJ7D5e7nDHetgDfybWX6
	X2DyyfjnD4t31XgGEf+9qlgmHiFo4tOIf4U0PSWCZnPLuDlSJa40LLc/mVsiPokQPTcB
	dh0W7Ru1sRjcibI2liky0z149wR2TxLErpPHWfINh7p8U0/CWvF1Cgv3wMVSVJrCy941
	c99A8+mq0G2iSVomMBR4V9zv4PSbNbleGoTi4gJCrug6ufanZNkzs6cd2xZ+8xatQdK4
	1EMw==
X-Gm-Message-State: AKGB3mKLWJx7BVhTCwowqUlis9LODqIv+MOuYD0vamOt2rqiCiZmyRs4
	xITqhi1c86NOKOfZErXhzV+W35N8
X-Google-Smtp-Source: ACJfBouNS8ThbXggeyqSOZYYTCVj9YR46EO4FQwXLW6tqYW/N7SM3+B8tpFlMWZ9GpiueC3VLPA5og==
X-Received: by 10.28.163.3 with SMTP id m3mr2494904wme.139.1515157578262;
	Fri, 05 Jan 2018 05:06:18 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 15sm7745021wrt.18.2018.01.05.05.06.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Jan 2018 05:06:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jan 2018 13:06:16 +0000
Message-Id: <20180105130616.5294-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] lz4: remove ptest changes
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
X-List-Received-Date: Fri, 05 Jan 2018 13:06:17 -0000

This recipe installs the test suite by copying the entire build tree into
/usr/share/ptest, which is both wasteful and breaks packaging as lz4-ptest then
gets renamed by debian.bbclass to liblz4.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/lz4/lz4_1.7.4.bb | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta/recipes-support/lz4/lz4_1.7.4.bb b/meta/recipes-support/lz4/lz4_1.7.4.bb
index 9e86985d699..86a1ab9ab95 100644
--- a/meta/recipes-support/lz4/lz4_1.7.4.bb
+++ b/meta/recipes-support/lz4/lz4_1.7.4.bb
@@ -17,19 +17,11 @@ SRC_URI = "git://github.com/lz4/lz4.git \
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
-inherit ptest
 
-EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}" 
+EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
 
 do_install() {
 	oe_runmake install
 }
 
-do_install_ptest () {
-	install -d ${D}${PTEST_PATH}/testsuite
-	cp -rf ${S}/* ${D}${PTEST_PATH}/testsuite
-}
-
-RDEPENDS_${PN}-ptest += "make python3"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


