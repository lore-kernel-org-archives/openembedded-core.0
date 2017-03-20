Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3E66D7795B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:54:42 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id u108so96474987wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 09:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Zn6LIa3Vcgfwg78fcJzTUwVEkGU4b4kpetqZcwikC7U=;
	b=QxRoqWTxX9y8PmsT/RwKa2bgw0nMkNZvouMW35LgUDWsYqzMZezc0y/IgJrRAQiurx
	qROhy9CoqZTwObr4x03/jU6XmO8jPl/bXFCKW/lXAx78Mq4KNIjE19jY2zPiQ4KuDzTJ
	mc8IX58EaET7ZR97Jd1kQprPernCnolOzC118ZggNOYbDzpqmlEQBRuWa4Vwea6+rn6K
	KvWPWRq5DyOqxHTjRHIW1Ze2AorZo3z2VTtvcI2Q1WbWbNsdYnxuU69pkSeBm3dm0l1L
	K6sllsjDo4R7v+it8rR4c/p8Ef/ivdJFGZhPm82mQTxJoQAsgRNPXmoAepCHWVycTW5a
	8iYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Zn6LIa3Vcgfwg78fcJzTUwVEkGU4b4kpetqZcwikC7U=;
	b=FBkNvtLcyRQ9JJxD/RD15k03OVAeEz/HUbt5IwrsVn4rR98wN1AKcWokEQClwwKLwi
	oswU3ETgDxIJmgXg60UulhMjiDJzw60bIEwySUAzY7353EHYMIZVSOG8RSWzM3hZeYPV
	TZuuy50MZbNO9lnvTjnP2wVNWZaAFm7Bx7CKqCFU2HVTRCOwgz2mgsyNrPfeLtGynkr6
	8vguuvnVmdjqcP4nXhbx5oZhwSebffvB1wahZJznCd0h7Ej/ACY4aKdEQbVlngsBBlDw
	2yJ9YR728uaKDe3hHtWnvIssmiUJSlUMDbq35MZGAXy13JqEhWwFYWNB3zXqb+Sps5fL
	PaTg==
X-Gm-Message-State: AFeK/H2+HJYmBGgoS2IHDaQ4dWUrq54+PA85fHa83CSrA0LHdTM1ZHBj/WBSfZLTlgfCpYW3
X-Received: by 10.223.154.50 with SMTP id z47mr25961718wrb.76.1490028883326;
	Mon, 20 Mar 2017 09:54:43 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	o15sm14141971wmd.10.2017.03.20.09.54.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Mar 2017 09:54:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 16:54:38 +0000
Message-Id: <1490028878-24324-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1490028878-24324-1-git-send-email-ross.burton@intel.com>
References: <1490028878-24324-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] oeqa/selftest: remove test_sanity_unsafe_binary_references
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
X-List-Received-Date: Mon, 20 Mar 2017 16:54:43 -0000

This test was attempting to exercise a broken test, for some reason this broke
with patches under review but investigation revealed that the test itself is
broken.  The test has been removed, so there's no need to test it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index a97257e..7ace747 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -114,25 +114,6 @@ do_install_append_pn-gzip () {
         line = self.getline(res, "QA Issue: gzip")
         self.assertTrue(line and line.startswith("WARNING:"), "WARNING: QA Issue: gzip message is not present in bitbake's output: %s" % res.output)
 
-    @testcase(1434)
-    def test_sanity_unsafe_binary_references(self):
-        self.write_config('WARN_QA_append = " unsafe-references-in-binaries"')
-
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
-        self.add_command_to_tearDown('bitbake -c clean nfs-utils')
-        res = bitbake("nfs-utils -f -c package_qa")
-        line = self.getline(res, "QA Issue: nfs-utils")
-        self.assertTrue(line and line.startswith("WARNING:"), "WARNING: QA Issue: nfs-utils message is not present in bitbake's output: %s" % res.output)
-
     @testcase(1421)
     def test_layer_without_git_dir(self):
         """
-- 
2.8.1


