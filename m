Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id C203978639
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 11:59:08 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id 13so7690352wmq.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 04:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=/hvr+AE2QuMJn8IQxRGjj5Ip1MBG8drBHCDL0Pcmft8=;
	b=02wwiaEIhOYUyWiVwSMdOpNOfrem+esfgsribKIz/KNi4CGwMfHjlVN1j5FmpbcCl2
	NeXUXLh0xChJkyHsB0LkK2Sai/xM2r1MKn21qtbDZNxOJ26T9Xmd6aL3lrkm127acfzg
	/Pp0jA6tCIv8wu8jdOEbLckF3NtDH+P8YgjQPUA/wwgK+uoKa/rXaH3KlTTauhurMNLm
	kz8Iu0e2lsCHKMmqgIZ2qSnjqnAiQgQ9vAfAG3ty3hYpjinGAREpnbUSdTM/VhBKsjq0
	v6a/7KdZx1a5H+Jf+e+1RPObYYhqsBfMB+oat8uYaalzQwrKq7kjZ/O5VjSggFyTNISD
	T9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/hvr+AE2QuMJn8IQxRGjj5Ip1MBG8drBHCDL0Pcmft8=;
	b=toNV6oopRykSIc9+CDRpH4LI3JIYE3UyhuTd87aF7Fc4apjbIeq6Pa6hjT69en4xBf
	hUNc6gqkREugW/H8R6tSuG+280OlTMRgbf8sO6LRgipFmqFBHcfx1o+xOXsrYqLiKJSJ
	aVyzISEMiBQKlx8e3bHiRoJ3hxpm9vkWyTmAo/m+K5pHsoYqZHnOoOzzBBlm9EtUGetB
	ZgFIAswNn8gSj3xNp+wRBNJBUNvBR2cXQT24A5XYInkyRGqhvBu34PRcPOsKrTcZAupS
	lRinYqTGUSH2xNHAUyoMcoFB5KxSVgGcC9+8OMFIec8dImOqv+6q6pU7f0SS5llJeOMC
	Iwgg==
X-Gm-Message-State: AHPjjUhyTPEAXEPA3vNvqx4EBP5iVACyu2j5I93O5c1jxl8WX+TUj5xB
	6VKzGbzchreG144fFvUb3euP+PO7
X-Google-Smtp-Source: AOwi7QC2J1BzbSn91ehfEF+rMOtRZ73d5CvP/PoT2vnxzrHYyNBm3WlpIA7o8zKQpmV/GVeDccSCag==
X-Received: by 10.28.169.140 with SMTP id s134mr2621007wme.36.1505476748039;
	Fri, 15 Sep 2017 04:59:08 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d5sm1151311wma.22.2017.09.15.04.59.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Sep 2017 04:59:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Sep 2017 12:59:05 +0100
Message-Id: <20170915115905.5092-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] oeqa/selftest/recipetool: use stable tarball for recipetool create test
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
X-List-Received-Date: Fri, 15 Sep 2017 11:59:09 -0000

GitHub dynamically generates the /archive/ tarballs but we're encoding checksums
in the test suite.  Change the URL to use a static tarball, and update the
checksums.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index bdd405f1cc0..754ea949824 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -367,16 +367,16 @@ class RecipetoolTests(RecipetoolBase):
         # Try adding a recipe
         tempsrc = os.path.join(self.tempdir, 'srctree')
         os.makedirs(tempsrc)
-        recipefile = os.path.join(self.tempdir, 'logrotate_3.8.7.bb')
-        srcuri = 'https://github.com/logrotate/logrotate/archive/r3-8-7.tar.gz'
+        recipefile = os.path.join(self.tempdir, 'logrotate_3.12.3.bb')
+        srcuri = 'https://github.com/logrotate/logrotate/releases/download/3.12.3/logrotate-3.12.3.tar.xz'
         result = runCmd('recipetool create -o %s %s -x %s' % (recipefile, srcuri, tempsrc))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
         checkvars['LICENSE'] = 'GPLv2'
-        checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=18810669f13b87348459e611d31ab760'
-        checkvars['SRC_URI'] = 'https://github.com/logrotate/logrotate/archive/r3-8-7.tar.gz'
-        checkvars['SRC_URI[md5sum]'] = '6b1aa0e0d07eda3c9a2526520850397a'
-        checkvars['SRC_URI[sha256sum]'] = 'dece4bfeb9d8374a0ecafa34be139b5a697db5c926dcc69a9b8715431a22e733'
+        checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263'
+        checkvars['SRC_URI'] = 'https://github.com/logrotate/logrotate/releases/download/${PV}/logrotate-${PV}.tar.xz'
+        checkvars['SRC_URI[md5sum]'] = 'a560c57fac87c45b2fc17406cdf79288'
+        checkvars['SRC_URI[sha256sum]'] = '2e6a401cac9024db2288297e3be1a8ab60e7401ba8e91225218aaf4a27e82a07'
         self._test_recipe_contents(recipefile, checkvars, [])
 
     @OETestID(1194)
-- 
2.11.0


