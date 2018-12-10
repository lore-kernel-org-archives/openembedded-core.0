Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id C99716C4DC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 17:11:53 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c14so11327244wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 09:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qkOtSir03PTwCW1cU1ditSbT9t5iVVadJ/LSQ2rj1V4=;
	b=EzHP7arp4HOLONVCMz7CPLT6Otd02jSv3VhwBc3gq2GF89RBLUlpTOnaIBB6XRYtEh
	dOYq45xMcWpjifSEjtDmgSDvhc+FNvt++OImZtKzpIE046kAWr/XZ/4M6mNKXyrJXxkx
	Mptt1s42wSROCd2IM8khdEC69YXSVG/JjacT6gDkPAOTPDXDrL/QxdnHRLQ+Cjg84AZq
	63/WBHGmAKCyykDdd5PCf2UOnsw6xeHMK/rksgA07E4WkTSBbIL2x1skIEr3ObskoEQ6
	L2TuyFAgWUXWfoRdw/l9wtXY91Fso8KUyXrE2gT01cHeNfD8Wlov75Ti7xUCEZBIUD3P
	2e4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qkOtSir03PTwCW1cU1ditSbT9t5iVVadJ/LSQ2rj1V4=;
	b=b8PbBDq415wBhR2M+JTFz+0gcRSg74Gd62Dor2WskfjrMQAQ6iKoSIMkuf3tD1+tQL
	zdj32y4EljfCdgNqXol05XIOZNEpRDOriegpx0tTtznaWqF0kB47qbkXSH61TbZ19Bdh
	mOZJtsIuyKPNZjg0it+hKX+m57nU1/dAtIlRysw81syCs8E18HKY7bUu8ul0yFkPkOA3
	iBU77XEMqYHgMV2kp3FLzjAD+mdh1QBA+Z/pmI7HT/WnOlIEiPUNoS3ILE2SN0ONem9E
	D8VTCieVljJ0K6axN3iWFpSq6B/HooT6q0555X92kT9G6lJULNZKkqnsiJ8LPPtvJFGc
	a4Fg==
X-Gm-Message-State: AA+aEWY3p+bZovrm1kTVR9p6DMt58enjlCMmjyQTPlY53JPPsrNUb/G7
	hfNCoqYr6ipz+i7doseLNczaq+hQEg8=
X-Google-Smtp-Source: AFSGD/XeqfJ2QDZE6Hm6p8e602a181TxoHcJeZKP3webZ3HysHYx+XtFQUYB1lvcmcizjwKpePSOYA==
X-Received: by 2002:a5d:528e:: with SMTP id c14mr10366026wrv.236.1544461914086;
	Mon, 10 Dec 2018 09:11:54 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y13sm12343505wrn.73.2018.12.10.09.11.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Dec 2018 09:11:53 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Dec 2018 17:11:40 +0000
Message-Id: <20181210171141.10722-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181210171141.10722-1-ross.burton@intel.com>
References: <20181210171141.10722-1-ross.burton@intel.com>
Subject: [PATCH 3/4] oeqa/sdk: clean up galculator test
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
X-List-Received-Date: Mon, 10 Dec 2018 17:11:54 -0000

Drop redundant imports and variables, and use os.makedirs() instead of
bb.utils.mkdirhier().

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/sdk/cases/buildgalculator.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index 7beb55884d3..c488a1c73e2 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -3,17 +3,11 @@ import subprocess
 import tempfile
 import unittest
 
-import bb
-
 from oeqa.sdk.case import OESDKTestCase
-from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
-
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
 
 class GalculatorTest(OESDKTestCase):
-    td_vars = ['DATETIME']
-
     def setUp(self):
         if not (self.tc.hasTargetPackage("gtk+3", multilib=True) or \
                 self.tc.hasTargetPackage("libgtk-3.0", multilib=True)):
@@ -33,8 +27,8 @@ class GalculatorTest(OESDKTestCase):
 
             subprocess.check_output(["tar", "xf", tarball, "-C", testdir])
             self.assertTrue(os.path.isdir(dirs["source"]))
+            os.makedirs(dirs["build"])
 
-            bb.utils.mkdirhier(dirs["build"])
             self._run("cd {source} && autoreconf -i -f -I $OECORE_TARGET_SYSROOT/usr/share/aclocal -I m4".format(**dirs))
             self._run("cd {build} && {source}/configure $CONFIGURE_FLAGS".format(**dirs))
             self._run("cd {build} && make -j".format(**dirs))
-- 
2.11.0


