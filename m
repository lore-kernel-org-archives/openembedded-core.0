Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id CDB397E529
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 03:54:32 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id r1so6686459pfq.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 20:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wmv3c08R66Jwe+FP4e6BAlNVY1D5p2PLLUMb8KcNgu0=;
	b=YY35iXJ33SDv+HTkjrGLrMUKU080JMBukerfK50rh1dFc3jN4PHFnkGAcyoz7a91kL
	qk9k2WS6cRjto3wbjR7ZkgRWSxIyZJhQqbIpqsX5HQqZlY/aZdwnvSoIk0+DrmKhaSOa
	1MSk1wEtxLa7yWOeIPQwCiSxHmMxxg1XwqufpLjohks80q8XtovMY6WiGUJVJk7hGeEF
	RECaPYVRR4BxgzxAs3+XUrL51u8I2vVLY9qq9udVc1nIs3JUY96xEPq3HFwvL2YAQelN
	hdps8EL9RgKCTv52MnXdIBsTb4hdfJjbp83xMlVG1rS4rbjyPRZv/Cegbts7fk/NOETg
	u9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wmv3c08R66Jwe+FP4e6BAlNVY1D5p2PLLUMb8KcNgu0=;
	b=JRHcoR/v5YMdCYpOrWFYiQcL6hp1/CEnhbRp7zFAMjnzZCkDS5Ra5TqKR12z31WdHD
	8DfGCTKwMXhuglhSi4MyFngTwqwDvlVsejjnrCbjLb2HskjZ7TtSwT052eJYClu2dQ4d
	PtP7Z0amAD0qNNdWwQEh1qhfCEajHUiiJAORGcnyuo4+EQA0SXfUOAd+fflYsUdat1zW
	mzQ6u4x3yadlV6AtSjeVGsrioJTqwfpVp/m7Vf31Up3enNRn4VBnQDwx6CqmKVkozYdU
	fjMBpc2PRf2z/Rrmeq4lPfxrKkXCt96lqm/+dhgUybQJPh67UMWtDonJunUBWUijAmEA
	ZGgQ==
X-Gm-Message-State: APjAAAV3pbS9BacmGDQXD8zw9YF1tMArxifx0soAYaHLUG48XMdtNVBo
	uGIS5S6ufDN7boPwhZgKLP4Rrrulhao=
X-Google-Smtp-Source: APXvYqzH3MRBnEPRoV127CDShjM6iMObCNbxLNsZH4K8myDdMafU9H99T8MsK6ooq2sn5+VBgiSgag==
X-Received: by 2002:a63:4d05:: with SMTP id a5mr28776381pgb.19.1561348473956; 
	Sun, 23 Jun 2019 20:54:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:202:4180:c33:4917:1686:82c6:892f])
	by smtp.gmail.com with ESMTPSA id
	w132sm9837202pfd.78.2019.06.23.20.54.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Jun 2019 20:54:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jun 2019 20:54:11 -0700
Message-Id: <a882db428db3316b5b3bb8588e50b355029a39a3.1561348290.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561348290.git.akuster808@gmail.com>
References: <cover.1561348290.git.akuster808@gmail.com>
Subject: [Warrior][ 12/19] oeqa/logparser: ignore test failure commentary
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
X-List-Received-Date: Mon, 24 Jun 2019 03:54:33 -0000

From: Ross Burton <ross.burton@intel.com>

The output format for Python and GLib both can be of this form:

FAIL: foobar (Segmentation fault)

In this case the test is called foobar not foobar_segmentation_fault.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/utils/logparser.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index cc6d18d..b31214b 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -16,7 +16,7 @@ class PtestParser(object):
     def parse(self, logfile):
         test_regex = {}
         test_regex['PASSED'] = re.compile(r"^PASS:(.+)")
-        test_regex['FAILED'] = re.compile(r"^FAIL:(.+)")
+        test_regex['FAILED'] = re.compile(r"^FAIL:([^(]+)")
         test_regex['SKIPPED'] = re.compile(r"^SKIP:(.+)")
 
         section_regex = {}
@@ -69,7 +69,7 @@ class PtestParser(object):
                     if result:
                         if current_section['name'] not in self.results:
                             self.results[current_section['name']] = {}
-                        self.results[current_section['name']][result.group(1)] = t
+                        self.results[current_section['name']][result.group(1).strip()] = t
 
         return self.results, self.sections
 
-- 
2.7.4


