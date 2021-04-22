Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.9243.1619078063778923752
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 00:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TPyv+cKM;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619078062; i=@fujitsu.com;
	bh=/ZNRlbyYkg+tW6s61sNaQ8Xp0q+VWmosnIHmg0/IR/M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=TPyv+cKMTAZdsOS5rWs/+SVuJMwNcdq4vPLvGoppkjtoxvxShxfRCBqYsgSvnkSPk
	 sYMDZs4w5H50sa4GIPN0818Vadu6ZBnp1mJeln21WFNUruIiwxPhXwtNAPEm2RL2+W
	 uhjWk5iZsUqdHikacz3t3jsOSwDu05Cbb2Z9Ftlv5aiChLtTn6GnxoNjRVkUPZAkWD
	 Hn0sVIMXUZlGJlWL/4ktiYPHtZTNVOVB9Zdga7WEg5tkYp+iQGXEzHQajGM6hHy+z3
	 MUF5PZNBGJEP9hNbx/Koe0gzhzRkgIUkAra5dSWLNtgN1I4LRZ/X26d3TKhHMZ5XO7
	 0Uln76SGdZnGQ==
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 4C/55-60958-EAB21806; Thu, 22 Apr 2021 07:54:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxVXetdmO
  CwfWNJhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b3lttsBa0cFacOLWRrYJzO3sXIxSEkMItJ
  Yt20ZiYI5zijxMv9Nxm7GDk52ATUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7x52EFtYwFri2
  YlWJhCbRUBV4vPWx8wgNq+Ao0Tbrt1gNRICChJTHr4Hi3MKOEmsO32FCWSkEFDNwsOhEOWCEi
  dnPmGBGC8hcfDFC2aIVkWJ2ZebWSDsSonO9QsYJzDyz0LSMgtJywJGplWMFklFmekZJbmJmTm
  6hgYGuoaGRrqGlha6hubGeolVukl6qaW65anFJbqGeonlxXrFlbnJOSl6eaklmxiBwZhScGzt
  DsaeNx/0DjFKcjApifIu5GtMEOJLyk+pzEgszogvKs1JLT7EKMPBoSTB+0ILKCdYlJqeWpGWm
  QOMDJi0BAePkgivPUiat7ggMbc4Mx0idYpRUUqcdzVIQgAkkVGaB9cGi8ZLjLJSwryMDAwMQj
  wFqUW5mSWo8q8YxTkYlYR5L2sCTeHJzCuBm/4KaDET0GLtKbUgi0sSEVJSDUzl8V+5uPdWW0a
  IuCfkqonKr/r/bp3X8cWzX+dyLEv43fstZrbf3ylW4vIP7nuJBgVEFC4vM7Zvtfy7sYdZcss0
  3aX3PtepWHGuDfP3EFnVtGXWl9dhqdXizT9Wnxa6/+lz2IF7r9uebK/afH5Fr2TuwT3K+Y/OT
  vZunZRk1yE7Z+bKdedEHks4ej1u2PYytePn1qc5RszGRYonDn4ujLGQvBe8tvPGG1UV2Xq2pe
  tv/Ovfp63B3auXv/NdUrqn/rlgXlse34knlSeuu/7C7cQz4TcmO947J7O7uUqe6lS+HHRtdaw
  j+/s1e082/74+4eBx83d8ol8Pb9+368SHl08dzhTr1Zvzar5Sbd1zY36VEktxRqKhFnNRcSIA
  niByUkEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-285.messagelabs.com!1619078061!1645187!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6699 invoked from network); 22 Apr 2021 07:54:21 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-8.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Apr 2021 07:54:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13M7sIwH005992
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 08:54:21 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 22 Apr 2021 08:54:19 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mtools: upgrade 4.0.26 -> 4.0.27
Date: Thu, 22 Apr 2021 15:54:03 +0800
Message-ID: <1619078047-5587-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1619078047-5587-1-git-send-email-wangmy@fujitsu.com>
References: <1619078047-5587-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mtools/{mtools_4.0.26.bb => mtools_4.0.27.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.26.bb => mtools_4.0.27.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools_4.0.26.bb b/meta/recipes-devtools/mtools/mtools_4.0.27.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.26.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.27.bb
index 4938713065..c6fa02ebdf 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.26.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.27.bb
@@ -24,7 +24,7 @@ RRECOMMENDS_${PN}_libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "539f1c8b476a16e198d8bcb10a5799e22e69de49d854f7dbd85b64c2a45dea1a"
+SRC_URI[sha256sum] = "9c88c8d9244e54768e40b92c005e61ec4e084ea7c070df9184caf1a6408838b3"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.25.1

