Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id ED77D71B40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 11:16:58 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id d127so93065759wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 04:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3XLlGo55bYH6+ti84wlIrxx1h1SvF/5nP8n6QzG3+zo=;
	b=J9yjApZ5U6sA13Dl8e4pkZXjALXfzVtEQcLIpjy+k4zMaXgm1Wcmxf3n2u6s5n7o90
	WKja7sKXxJqI8r7POYmYsD/NGWwK3i9d/gbpGlKedZdQjpZjyaM7vxnthIGSargO5DKH
	Qqy6bA9yY1xMIjKYQzWa6tnVdjUoguMSiNXgRcsS9KjrDHLHWapg/kbRlvyjCSubcsTo
	0v2GaYjdc2Mgudc34UfEap//Mo8Oh9EJV/SaQNCQxXrWv+fHMJLRdUYp5shbsayrGPZP
	QXxq2MoFSHtH39VbyP23u05xDn2nC71k/Q+sjxx1UMPXneOOn6wRe0ZpxYo/FLZndPWr
	DymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3XLlGo55bYH6+ti84wlIrxx1h1SvF/5nP8n6QzG3+zo=;
	b=DxbA6FuE4AOiOHXOFCnhPp5AsXgGUNq6ixL8YK0qXUEiCa5A2Qg/R4QAaWODWJQO5c
	PqeYFvQMhiQFzy8J7wFnh2smAQZfdpR2LBK8LjOAboYIpNxl36ZkUwHyRUQ7cIa4LSLB
	iMSKgOnBLcOaZn0ex72C/dNbwzeBfH65OFkdgjoAd/3snzDqXtpnmN81McyWusL54S7x
	dU6Uai4bkVzlezwqu3hR28h1leTvDwUFm9ky5E0t2emK7T9Oy3yNMX+tmLkugH/8puEc
	JF4xoqq9cylCKS+oRj6lEB/uCESgOXtm4SVpmKjZbKErDZrFPTxMBQOUyTCTl5DBMsuR
	YbOQ==
X-Gm-Message-State: AODbwcAHNl9xZo8DAymX83o2R29rmFKmmGrGMdKwDNH8Px5sjRdIKPkk
	kphRREY3dbJXldt/
X-Received: by 10.223.178.85 with SMTP id y21mr15001523wra.58.1495711019416;
	Thu, 25 May 2017 04:16:59 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d74sm8544169wmi.3.2017.05.25.04.16.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 May 2017 04:16:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 May 2017 12:16:51 +0100
Message-Id: <1495711012-6397-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1495711012-6397-1-git-send-email-ross.burton@intel.com>
References: <1495711012-6397-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][morty 2/3] oeqa/selftest: remove test_sanity_unsafe_binary_references
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
X-List-Received-Date: Thu, 25 May 2017 11:16:59 -0000

This test was attempting to exercise a broken test, for some reason this broke
with patches under review but investigation revealed that the test itself is
broken.  The test has been removed, so there's no need to test it.

(From OE-Core rev: 4f5f552cd6601ba244ef4efc782616bc477e1340)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/buildoptions.py | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 9487898..09657ec 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -110,25 +110,6 @@ do_install_append_pn-gzip () {
         line = self.getline(res, "QA Issue: gzip")
         self.assertTrue(line and line.startswith("WARNING:"), "WARNING: QA Issue: gzip message is not present in bitbake's output: %s" % res.output)
 
-    @testcase(1434)
-    def test_sanity_unsafe_binary_references(self):
-        self.write_config('WARN_QA_append = " unsafe-references-in-binaries"')
-
-        bitbake("-ccleansstate nfs-utils")
-        #res = bitbake("nfs-utils")
-        # FIXME when nfs-utils passes this test
-        #line = self.getline(res, "QA Issue: nfs-utils")
-        #self.assertFalse(line, "WARNING: QA Issue: nfs-utils message is present in bitbake's output and shouldn't be: %s" % res.output)
-
-#        self.append_config("""
-#do_install_append_pn-nfs-utils () {
-#	echo "\n${bindir}/test" >> ${D}${base_sbindir}/osd_login
-#}
-#""")
-        res = bitbake("nfs-utils")
-        line = self.getline(res, "QA Issue: nfs-utils")
-        self.assertTrue(line and line.startswith("WARNING:"), "WARNING: QA Issue: nfs-utils message is not present in bitbake's output: %s" % res.output)
-
     @testcase(1421)
     def test_layer_without_git_dir(self):
         """
-- 
2.8.1


