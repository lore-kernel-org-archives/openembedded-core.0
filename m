Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web11.702.1626829933749995876
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jul 2021 18:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XwDqnYks;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626829931; i=@fujitsu.com;
	bh=QkgEYPjk577AlvCFiRfjuhJBFp974TmczVPDzBiuUPg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=XwDqnYkswPdgBc7hwTaG2AVpapHxuBqanFULJyZNmK33COFBGPpYO3G6gipP9RR7H
	 GRfNPac3zg+6HrMkfeCZTbW39TCNMMnyXJsd0O9RYqpc6OBZWFSHT+uUylqNJe8P0m
	 3yYdQChfKIydHdyliSCwaWPrRgnMT16B9o/XWJl9k57odB8VF8HeH6OnUxRMXfencT
	 aEEcm3eZ+aPKPXcebLwgOPBtv1dGTQgKpyzJfWcoW4z4Qsv5hRP/alkrBvX/h9X88u
	 O6NTjvAgFSl5+s1U7esIz/GALa8LA0H+EbW/7pr2TURBNNKe4BK9FDJUFT7aLMqHwy
	 wpctYDJ/yenGw==
Received: from [100.113.6.207] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 01/E9-07224-B6477F06; Wed, 21 Jul 2021 01:12:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRoptd8j3
  BYPEbdos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePavjamgm72im/TDzM2MC5n62Lk4hAS2Mok
  MXPOfyYI5ySjxJepaxi7GDk52ATUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7x52EFtYwE/i/
  MSVTCA2i4CqxOYH71hBbF4BR4kby3rBaiQEFCSmPHzPDBEXlDg58wkLxBwJiYMvXjBD1ChKzL
  7czAKySkKgUuLG49QJjLyzkHTMQtKxgJFpFaNlUlFmekZJbmJmjq6hgYGuoaGxromuobGBXmK
  VbpJeaqlucmpeSVEiUFYvsbxYr7gyNzknRS8vtWQTIzC8UgpZmnYw/n71Qe8QoyQHk5Io71m2
  bwlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHhTir4nCAkWpaanVqRl5gBDHSYtwcGjJML7MA8oz
  VtckJhbnJkOkTrFqCglzjsFpE8AJJFRmgfXBouvS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJ
  WEeVcXA03hycwrgZv+CmgxE9DiXdO+giwuSURISTUwrSou+fLCP3XygXrtkqdWF1x2zFjzN7X
  l6az8zPgVJ2Q/63ypuSIcefFV2IGXt5n49JofHEu/WaEm1bfN7opb6yGL/czZCu2Xsvd1cX9k
  UL4vohN0nDnV7k3bktzbOytvZBfJbM614Hn56fDM2t75+572yM9feWZm/5Likrs7JDX/sPwR2
  3TSq2nz4fnFqT/XrGX+lz4/uHdlS7bjvf5lv88VHfbtXLDT8cXGNW05DKcmG1Sf/rO6bqrPPM
  dKozWG0SdvctgJJ9Q83vmrYHLb1IVnDq+daSCvpx23a87jxXvXXFm0dqVaD9+ksJ6PMYkaFY9
  jOV/uOnn5tFq1VfiMxv1JUkyvJYXO6i942VG1oEKJpTgj0VCLuag4EQDnW+TGKgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-248.messagelabs.com!1626829930!252284!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32585 invoked from network); 21 Jul 2021 01:12:11 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-7.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Jul 2021 01:12:11 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16L1C33a002205
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Jul 2021 02:12:10 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 21 Jul 2021 02:12:00 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libcap-ng: use update-alternatives for libcap-ng.so
Date: Wed, 21 Jul 2021 09:11:52 +0800
Message-ID: <1626829912-1826-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

    open-iscsi-user also uses the doc 'libcap-ng.so'.

    open-iscsi-user has a priority of 60.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb
index 6e6de45494..7581c29f3f 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb
@@ -6,6 +6,12 @@ EXTRA_OECONF += "--without-python --without-python3"
 
 BBCLASSEXTEND = "native nativesdk"
 
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN}-dev = "libcap-ng.so"
+ALTERNATIVE_LINK_NAME[libcap-ng.so] = "${libdir}/libcap-ng.so"
+
 do_install_append() {
 	# Moving libcap-ng to base_libdir
 	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
-- 
2.25.1

