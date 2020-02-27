Return-Path: <jpuhlman@gmail.com>
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
	[209.85.210.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0734C6188E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 22:15:40 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id v19so730742ote.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 14:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+D9A/ssv0oynf9c+ArxRM6l3dQLnLQU638ykjpgkagY=;
	b=OS9gotdcZKHr7NIzn6Hs2c6wN50gwpUi2XYPOrmN11RWYmj5jjN+b2lDRzrn2OEwlG
	S2PBI/F2puSwUF61l8gNd1og8hhxMhaayjf+IwwrrqIzpu7da5VCdP4qg58f+7uJ3Q3Y
	7GoFOjBi42m3eqzD4s+GzXzFvx2Kq/yyWGnx0gYHjE9gMgv8uKMFB+dpZmHpJdhuaM8D
	ETFjSupkPaDH21L4VT5Ia8GwW1x0VFVcDKsxs/EgvB9QEssLEB7qXhTXZV3u8Rd7cf3I
	9VmpuN1raRO8iSynMlk3s7Scxqc/7cVGvLznQ6u/YDk80//0nyS80/mxDVrZpfNxsN/n
	KhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=+D9A/ssv0oynf9c+ArxRM6l3dQLnLQU638ykjpgkagY=;
	b=L9HExV3yjHC+sviqNVQE0YmapfKUOLwh/QATdGnErak1lG+n5kjPamAQ5NBvTRtjdi
	zV/oTmOz17U1pVV17qZa7uqnrvLbVsaGDmsWTF2r8Yn3Hk/SPCYur8I0eGfMRaJeD2Ta
	9jnAgKinD2qaeMRX52cDcDPKDx4JAPC2YLCYc54tLA8MtwnrlxS1s2UvbRx5ESnCPGEq
	Zof8dYJrfG0zaRYo/DlyiMUqPwH+pYw5DYgobiY2szNjVcs+Rn5QL25KQq9EP9/tP2QO
	beXkeevr36gFvByrh471x8rskCmv224I/diAyB4pOtaADJ+Hlu+NXlxBGs2lyTL/BzKd
	Ir2Q==
X-Gm-Message-State: APjAAAUfw5k5HKPb8qJZ2flnHS8zQ6fOwavZmoAyZnfRF6xVcofMuUhi
	bMhh437EemPgFYec4FwtOMEl59mG
X-Google-Smtp-Source: APXvYqz+7xMLwpl/NpkFsGQZMJmWEz1oi4oOafMLx1VkHlxJxrmvowcMk6dXjpE28IfubWYtU0NyFQ==
X-Received: by 2002:a9d:67d7:: with SMTP id c23mr882415otn.262.1582841741610; 
	Thu, 27 Feb 2020 14:15:41 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	b20sm2387001otp.46.2020.02.27.14.15.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 14:15:41 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 1C7322A07BB; Thu, 27 Feb 2020 14:15:40 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2020 14:15:34 -0800
Message-Id: <20200227221535.8622-2-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200227221535.8622-1-jpuhlman@mvista.com>
References: <20200227221535.8622-1-jpuhlman@mvista.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] rt-tests: make manpages reproducible
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
X-List-Received-Date: Thu, 27 Feb 2020 22:15:41 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

add -n to gzip call

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 ...gzip-with-n-for-build-reproducibilty.patch | 62 +++++++++++++++++++
 meta/recipes-rt/rt-tests/rt-tests_1.1.bb      |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-rt/rt-tests/rt-tests-1.1/0001-gzip-with-n-for-build-reproducibilty.patch

diff --git a/meta/recipes-rt/rt-tests/rt-tests-1.1/0001-gzip-with-n-for-build-reproducibilty.patch b/meta/recipes-rt/rt-tests/rt-tests-1.1/0001-gzip-with-n-for-build-reproducibilty.patch
new file mode 100644
index 0000000000..3bafbbe08f
--- /dev/null
+++ b/meta/recipes-rt/rt-tests/rt-tests-1.1/0001-gzip-with-n-for-build-reproducibilty.patch
@@ -0,0 +1,62 @@
+From aabf518e2e61a882b925f9d2ac53dafa7a041a0a Mon Sep 17 00:00:00 2001
+From: Jeremy Puhlman <jpuhlman@mvista.com>
+Date: Tue, 25 Feb 2020 22:58:59 +0000
+Subject: [PATCH] gzip with -n for build reproducibilty
+
+The date can get encoded in the header of the gz file, which
+causes the binary files between two different builds of the
+same data to be different. Add -n for reproducibilty
+
+Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
+
+Upstream-Status: Submitted [mailinglist]
+
+---
+ Makefile | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index a54d82b..e9f0d5a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -168,17 +168,17 @@ install: all install_hwlatdetect
+ 	cp $(TARGETS) "$(DESTDIR)$(bindir)"
+ 	install -D -m 644 src/backfire/backfire.c "$(DESTDIR)$(srcdir)/backfire/backfire.c"
+ 	install -m 644 src/backfire/Makefile "$(DESTDIR)$(srcdir)/backfire/Makefile"
+-	gzip -c src/backfire/backfire.4 >"$(DESTDIR)$(mandir)/man4/backfire.4.gz"
+-	gzip -c src/cyclictest/cyclictest.8 >"$(DESTDIR)$(mandir)/man8/cyclictest.8.gz"
+-	gzip -c src/pi_tests/pi_stress.8 >"$(DESTDIR)$(mandir)/man8/pi_stress.8.gz"
+-	gzip -c src/ptsematest/ptsematest.8 >"$(DESTDIR)$(mandir)/man8/ptsematest.8.gz"
+-	gzip -c src/rt-migrate-test/rt-migrate-test.8 >"$(DESTDIR)$(mandir)/man8/rt-migrate-test.8.gz"
+-	gzip -c src/sigwaittest/sigwaittest.8 >"$(DESTDIR)$(mandir)/man8/sigwaittest.8.gz"
+-	gzip -c src/svsematest/svsematest.8 >"$(DESTDIR)$(mandir)/man8/svsematest.8.gz"
+-	gzip -c src/pmqtest/pmqtest.8 >"$(DESTDIR)$(mandir)/man8/pmqtest.8.gz"
+-	gzip -c src/backfire/sendme.8 >"$(DESTDIR)$(mandir)/man8/sendme.8.gz"
+-	gzip -c src/hackbench/hackbench.8 >"$(DESTDIR)$(mandir)/man8/hackbench.8.gz"
+-	gzip -c src/signaltest/signaltest.8 >"$(DESTDIR)$(mandir)/man8/signaltest.8.gz"
++	gzip -nc src/backfire/backfire.4 >"$(DESTDIR)$(mandir)/man4/backfire.4.gz"
++	gzip -nc src/cyclictest/cyclictest.8 >"$(DESTDIR)$(mandir)/man8/cyclictest.8.gz"
++	gzip -nc src/pi_tests/pi_stress.8 >"$(DESTDIR)$(mandir)/man8/pi_stress.8.gz"
++	gzip -nc src/ptsematest/ptsematest.8 >"$(DESTDIR)$(mandir)/man8/ptsematest.8.gz"
++	gzip -nc src/rt-migrate-test/rt-migrate-test.8 >"$(DESTDIR)$(mandir)/man8/rt-migrate-test.8.gz"
++	gzip -nc src/sigwaittest/sigwaittest.8 >"$(DESTDIR)$(mandir)/man8/sigwaittest.8.gz"
++	gzip -nc src/svsematest/svsematest.8 >"$(DESTDIR)$(mandir)/man8/svsematest.8.gz"
++	gzip -nc src/pmqtest/pmqtest.8 >"$(DESTDIR)$(mandir)/man8/pmqtest.8.gz"
++	gzip -nc src/backfire/sendme.8 >"$(DESTDIR)$(mandir)/man8/sendme.8.gz"
++	gzip -nc src/hackbench/hackbench.8 >"$(DESTDIR)$(mandir)/man8/hackbench.8.gz"
++	gzip -nc src/signaltest/signaltest.8 >"$(DESTDIR)$(mandir)/man8/signaltest.8.gz"
+ 
+ .PHONY: install_hwlatdetect
+ install_hwlatdetect: hwlatdetect
+@@ -187,7 +187,7 @@ install_hwlatdetect: hwlatdetect
+ 		install -D -m 755 src/hwlatdetect/hwlatdetect.py $(DESTDIR)$(PYLIB)/hwlatdetect.py ; \
+ 		rm -f "$(DESTDIR)$(bindir)/hwlatdetect" ; \
+ 		ln -s $(PYLIB)/hwlatdetect.py "$(DESTDIR)$(bindir)/hwlatdetect" ; \
+-		gzip -c src/hwlatdetect/hwlatdetect.8 >"$(DESTDIR)$(mandir)/man8/hwlatdetect.8.gz" ; \
++		gzip -nc src/hwlatdetect/hwlatdetect.8 >"$(DESTDIR)$(mandir)/man8/hwlatdetect.8.gz" ; \
+ 	fi
+ 
+ .PHONY: tarball
+-- 
+2.23.0
+
diff --git a/meta/recipes-rt/rt-tests/rt-tests_1.1.bb b/meta/recipes-rt/rt-tests/rt-tests_1.1.bb
index 5aa0aa10c3..dad252b4ed 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_1.1.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_1.1.bb
@@ -13,6 +13,7 @@ inherit ptest
 SRC_URI += " \
             file://run-ptest \
             file://rt_bmark.py \
+            file://0001-gzip-with-n-for-build-reproducibilty.patch \
            "
 
 # rt-tests needs PI mutex support in libc
-- 
2.20.1


