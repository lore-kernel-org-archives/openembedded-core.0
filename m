Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web09.606.1624405930469502751
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 16:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WDd5a0cW;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624405928; i=@fujitsu.com;
	bh=27HIKoBtpzH6DTSa1M3Bn/t+VnrirLjqe3vA1lhHszg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WDd5a0cWqdf3s76Rm2gNST5zCZENhm1nvk9YRsejAHX1wHBBKw2wOoVDjTi6YPAEA
	 SnuiQyku9T+Zscus05Q9q3kfR/6Y0yh6yUc9s7jIxE4a/OdD9/ZJhtnohhxX2cNBfw
	 b1YW/PMxGDU/kkg6LxX+3xr51ASZRaJ5sCxatkPXQ+Xu48D3M1CX4y+G5PB5KKCeJI
	 GsV0z+2T8enbFmJBitaH/mf+GwQoSohAvIa7HvhslI92Da07wCP/+rn43I88Wr+nxI
	 8dKu5etU6GI/8eg2s4b2nPC7pVEioJznKxG9nyYUPna1Px2nmZGO7Pb55jLikdTm9i
	 wj8n+RZtzSd1g==
Received: from [100.113.2.110] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id D2/A5-52906-7A772D06; Tue, 22 Jun 2021 23:52:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRWlGSWpSXmKPExsViZ8MRoru8/FK
  Cwc5jGhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bCzz9YCmaKVrS9WsvSwPhYqIuRi0NIYBaT
  xJYVR1ggnBOMEveunGPsYuTkYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv3vYQWxhAXOJh
  ju/mEBsFgFVicmPP7KA2LwCThKLPt9hA7ElBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL14wQ9QoSs
  y+3MwCYVdIvD58iXkCI+8sJC2zkLQsYGRaxWiZVJSZnlGSm5iZo2toYKBraGisa6xraGaol1i
  lm6iXWqqbnJpXUpQIlNVLLC/WK67MTc5J0ctLLdnECAywlELmhTsYf7z+oHeIUZKDSUmUl6vo
  UoIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6tpUA5waLU9NSKtMwcYLDDpCU4eJREeLtAWnmLC
  xJzizPTIVKnGHU5Vh2YvopZiCUvPy9VSpzXD2SGAEhRRmke3AhY5F1ilJUS5mVkYGAQ4ilILc
  rNLEGVf8UozsGoJMwbCjKFJzOvBG7TK6AjmICOUPh9EeSIkkSElFQDk6pJmtT7SwtuS7prWs5
  90c1/yJpbZ3Njn3XJtOD0Zplrfs86nbUl3N4InukWXtbCzsAUsfeSmk7H1IcdJ/8tUn+2wGL2
  heO6zUyXeO5O5xDd6/Tp8RIj4+XiuUx6lx1tQkQubBPYfCIwTkzuQcT731ONdvlG5Yn4CPaJv
  Jmdv/ZGtNYKE0HmA56cFb4rWu9onGnsZLF/YK9swSv3e6flmaSNLy4lsb5/3vTD+017wVW2Dy
  FffOY8Y3nU26y7KTK/2GRT+XP/ds2ElJjFvxJn6Ca65czqaMzpWfBB/dXCsF+rZSYuciryaHb
  i2Ls4QD3pU+bJv0eO38mR2vKw6f3OqjtvRX7vWXN18d6acu7rSizFGYmGWsxFxYkA/oY36TcD
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-232.messagelabs.com!1624405927!120134!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24448 invoked from network); 22 Jun 2021 23:52:07 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-9.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Jun 2021 23:52:07 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15MNq1JT032409
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 00:52:06 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 23 Jun 2021 00:51:59 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libcap: upgrade 2.50 -> 2.51
Date: Wed, 23 Jun 2021 07:51:38 +0800
Message-ID: <1624405899-80322-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

refresh 0001-tests-do-not-statically-link-a-test.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-tests-do-not-statically-link-a-test.patch     | 10 ++++++----
 .../libcap/{libcap_2.50.bb => libcap_2.51.bb}          |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.50.bb => libcap_2.51.bb} (95%)

diff --git a/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch b/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
index 414e45a6f4..55872aa8fa 100644
--- a/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
+++ b/meta/recipes-support/libcap/files/0001-tests-do-not-statically-link-a-test.patch
@@ -7,14 +7,13 @@ This fails on e.g. centos 7
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  progs/Makefile | 2 +-
  tests/Makefile | 4 ++--
  2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/progs/Makefile b/progs/Makefile
-index 289186e..071a285 100644
+index 3e82862..48533f3 100644
 --- a/progs/Makefile
 +++ b/progs/Makefile
 @@ -49,7 +49,7 @@ capsh: capsh.c capshdoc.h.cf $(DEPS)
@@ -24,8 +23,8 @@ index 289186e..071a285 100644
 -	$(CC) $(IPATH) $(CAPSH_SHELL) $(CFLAGS) -o $@ $< $(LIBCAPLIB) $(LDFLAGS) --static
 +	$(CC) $(IPATH) $(CAPSH_SHELL) $(CFLAGS) -o $@ $< $(LIBCAPLIB) $(LDFLAGS)
  
- sudotest: test tcapsh-static
- 	sudo $(LDPATH) ./quicktest.sh
+ uns_test: ../tests/uns_test.c
+ 	$(MAKE) -C ../tests uns_test
 diff --git a/tests/Makefile b/tests/Makefile
 index 4a5f2f9..4266d86 100644
 --- a/tests/Makefile
@@ -48,3 +47,6 @@ index 4a5f2f9..4266d86 100644
  
  clean:
  	rm -f psx_test libcap_psx_test libcap_launch_test uns_test *~
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libcap/libcap_2.50.bb b/meta/recipes-support/libcap/libcap_2.51.bb
similarity index 95%
rename from meta/recipes-support/libcap/libcap_2.50.bb
rename to meta/recipes-support/libcap/libcap_2.51.bb
index 15137f0ac0..a43dca9f13 100644
--- a/meta/recipes-support/libcap/libcap_2.50.bb
+++ b/meta/recipes-support/libcap/libcap_2.51.bb
@@ -14,7 +14,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0002-tests-do-not-run-target-executables.patch \
            file://0001-tests-do-not-statically-link-a-test.patch \
            "
-SRC_URI[sha256sum] = "47a57b8bd238b84c93c921a9b4ff82337551dbcb0cca071316aadf3e23b19261"
+SRC_URI[sha256sum] = "6609f3ab7aebcc8f9277f53a577c657d9f3056d1352ea623da7fd7c0f00890f9"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.25.1

