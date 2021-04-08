Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web12.4376.1617862162596003353
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 23:09:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JndRMVdT;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617862160; i=@fujitsu.com;
	bh=g1yGWssuj/5Wb5zkByR4QpR0Hhh86GWbFqkUu+R60Yk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=JndRMVdTEl2SFHsQI2lSOb3NbdcpP/8Mozf7LCwd3CrQyZHCMLIdnucHCCo202h4m
	 rnP9sTWFTlduf/NmN4frLq5j7gGeBR3oWqGx0yM4OhuBcChkov/XsK+rCAWBc5Gy+9
	 VNAYkmZ8w8VAJWbpffk2/N0s43BVSxEeYT3zuc7nrxYLKSq2u8rMmPfA2WDhvcmYgY
	 UVwOHfdZQESRrp4hZ2RDpM8l0VPS19rJw0KJk6RWFdB7nkU+Gh1xEsymllwOCOyGDZ
	 slk6AbdrGpjZ0D10xV3bakyXLnPYRuEod9SUZVrOjS5yM98SKJqPV2efxyN10tXDFJ
	 L0Lrh4u5D14Lg==
Received: from [100.113.6.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 30/A6-44603-01E9E606; Thu, 08 Apr 2021 06:09:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MRoiswLy/
  B4MI2UYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWP/+jNsBbc5Kg7vvMvSwPiMvYuRi0NIYAuT
  xLLL3awQznFGiTeH57B1MXJysAmoSUy/dQMowcEhIqAncfWfKEiYWUBF4sXvHnaQsLCAlcS+w
  0YgYRag8PveQ8wgNq+Ao8SeMyfYQWwJAQWJKQ/fg8U5BZwkbnw/zwJiCwHVPF/ziBWiXlDi5M
  wnLBDjJSQOvnjBDNGrKDH7cjMLhF0l0fnhONsERv5ZSFpmIWlZwMi0itEyqSgzPaMkNzEzR9f
  QwEDX0NBY11TXyMRQL7FKN0kvtVQ3OTWvpCgRKKuXWF6sV1yZm5yTopeXWrKJERiOKYWsH3cw
  Hnr9Qe8QoyQHk5Iob9akvAQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErz9c4FygkWp6akVaZk5w
  NiASUtw8CiJ8JbNBkrzFhck5hZnpkOkTjEqSonzHpkDlBAASWSU5sG1weLxEqOslDAvIwMDgx
  BPQWpRbmYJqvwrRnEORiVh3v0gU3gy80rgpr8CWswEtLjkYC7I4pJEhJRUA9PWC8Z7Lmne7TK
  6bTzXk91316ndpqv+T4mMfeypcP1UVHNLt0yrTZvocumgffdmvbKfb8vSztJXFtZ7cPHlJZPW
  qChHH4/s7tx/Nyam1nD7rJkFijJi+Qdv5gtMis+PXzRvxwzV7efPdXCWRTZuuGXruN/i4PpZK
  cd4GZyPc2Ys5K/xfzz1gU3Z3oDqFg/XeSmalWe+i7f8Uu+/XbA65kfWh5CjwRYb9Utr3izk+z
  Jn3/Pt/qsfO/WvO29ayCV8Y5pIRQUn56k/B/J39oq4TSj4vFTMX7ryX+97lq4ANoWJdp0Xv8j
  c4JvLEy/3R31OYfb2ZVb9Eb82HDTxn2WyQ1mY013pN/v3BSIbvtTcq1BiKc5INNRiLipOBADD
  VMaWQgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-238.messagelabs.com!1617862159!1498234!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7741 invoked from network); 8 Apr 2021 06:09:20 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-10.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Apr 2021 06:09:20 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13869F8O021143
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Apr 2021 07:09:19 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Apr 2021 07:09:16 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libksba: upgrade 1.5.0 -> 1.5.1
Date: Thu, 8 Apr 2021 14:09:03 +0800
Message-ID: <1617862144-5153-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617862144-5153-1-git-send-email-wangmy@fujitsu.com>
References: <1617862144-5153-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libksba/{libksba_1.5.0.bb => libksba_1.5.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libksba/{libksba_1.5.0.bb => libksba_1.5.1.bb} (93%)

diff --git a/meta/recipes-support/libksba/libksba_1.5.0.bb b/meta/recipes-support/libksba/libksba_1.5.1.bb
similarity index 93%
rename from meta/recipes-support/libksba/libksba_1.5.0.bb
rename to meta/recipes-support/libksba/libksba_1.5.1.bb
index 8d7043fc0a..aa296c6b9b 100644
--- a/meta/recipes-support/libksba/libksba_1.5.0.bb
+++ b/meta/recipes-support/libksba/libksba_1.5.1.bb
@@ -24,7 +24,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
 
-SRC_URI[sha256sum] = "ae4af129216b2d7fdea0b5bf2a788cd458a79c983bb09a43f4d525cc87aba0ba"
+SRC_URI[sha256sum] = "b0f4c65e4e447d9a2349f6b8c0e77a28be9531e4548ba02c545d1f46dc7bf921"
 
 do_configure_prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.25.1

