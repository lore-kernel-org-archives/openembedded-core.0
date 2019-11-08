Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2FB607FC8F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2019 17:41:07 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id j13so7278921ioe.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2019 09:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=p6BdHST7YA3h8f17W+fXGynJ3YoOpgi2S/2i+QSCplI=;
	b=ivrr9L8Dh5qoL5cGOPQxHc2rQs1y/6RVIyFziKrPzuATA/AnWCky4Nr6Gr6DXAo8Id
	4L8dOQS/lto1R2/zu5+MDDtiLGwGrYlSf5f9K1vw4wpSzSy/tXCB7ViBrSXdXzByvAVQ
	04THghaRalIUmSBgNbglC+u1hUoa2AxIu1RTEJlpbJjD5d552sER/7dcNJT5+X2lGWnP
	GIE/m24SZ60t7Q12nSWcIp49bhs3KHdA0xnuXgR6eWkP9GsneZCE1j8fCourodFRPkPA
	4B3cfy2zkRFst/2xqYZ/4AAckOYseF8Y7tEEa4aIckMTx98lU/mrs9rJi/2x3AEGol+7
	446Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=p6BdHST7YA3h8f17W+fXGynJ3YoOpgi2S/2i+QSCplI=;
	b=GrfThiJYHS6EXHHiBU+yw6hX2L6ndHi+uwaUJjeevdiJFxFWxWB8MQsAz1sNSdSv34
	3To8im6mSZIYz+24H2kEtyTYn/SvjLDtrUM6b16TRVJK9epSv6zBrRBLXwNqGalx1ltg
	8q61zt6qpJ/j2d3zuJ1ySA4C7tBJ8gMfUZkK7Pf7Sz84lc9ELwBgIaKifh3b2UiT8Mxa
	Mj9Ptx/V5n1Lf2dqafRI8xkue54VyCVJkiNnIcUL0+USfHfW8MQ7Uvc7OGD9srg+dtMR
	gBw61/0XV3odtjD4CU9rymFOVEMQQjng68DhPV+KiXL/XfT47IkGLuccBWTd/OJJs2cZ
	tN7A==
X-Gm-Message-State: APjAAAXC9o7kmnMTacP7i2XnDg6bMS9I0Z5fSDZAEj0KDJvYf80TIy6G
	jh18IUzLPzHn/ifKS/8SaiTdhbpF4xE=
X-Google-Smtp-Source: APXvYqy6JcVh8BA1/7Gg/tFGMjY/QlqhCLgEKjLDMOkuAhPHYlxqAugrTkzNBYvIapWFE5paa6f/TA==
X-Received: by 2002:a05:6638:237:: with SMTP id
	f23mr12062478jaq.51.1573234860267; 
	Fri, 08 Nov 2019 09:41:00 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id u21sm856725ila.41.2019.11.08.09.40.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 08 Nov 2019 09:40:59 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Nov 2019 11:40:53 -0600
Message-Id: <20191108174053.2129743-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] oeqa: reproducible: Fix extra data reporting
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
X-List-Received-Date: Fri, 08 Nov 2019 17:41:08 -0000
Content-Transfer-Encoding: 8bit

A typo was preventing the extra data about the reproducible build from
being reported in the test results

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 0b3c02ab450..7e26eead5c3 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -89,12 +89,12 @@ class ReproducibleTests(OESelftestTestCase):
         for v in needed_vars:
             setattr(self, v.lower(), bb_vars[v])
 
-        self.extrasresults = {}
-        self.extrasresults.setdefault('reproducible.rawlogs', {})['log'] = ''
-        self.extrasresults.setdefault('reproducible', {}).setdefault('files', {})
+        self.extraresults = {}
+        self.extraresults.setdefault('reproducible.rawlogs', {})['log'] = ''
+        self.extraresults.setdefault('reproducible', {}).setdefault('files', {})
 
     def append_to_log(self, msg):
-        self.extrasresults['reproducible.rawlogs']['log'] += msg
+        self.extraresults['reproducible.rawlogs']['log'] += msg
 
     def compare_packages(self, reference_dir, test_dir, diffutils_sysroot):
         result = PackageCompareResults()
@@ -121,7 +121,7 @@ class ReproducibleTests(OESelftestTestCase):
         return result
 
     def write_package_list(self, package_class, name, packages):
-        self.extrasresults['reproducible']['files'].setdefault(package_class, {})[name] = [
+        self.extraresults['reproducible']['files'].setdefault(package_class, {})[name] = [
                 {'reference': p.reference, 'test': p.test} for p in packages]
 
     def do_test_build(self, name, use_sstate):
-- 
2.23.0


