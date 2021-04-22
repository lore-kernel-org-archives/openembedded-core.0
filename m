Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.9274.1619078072123266070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 00:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bVoFanrr;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1619078070; i=@fujitsu.com;
	bh=6MgXXbwTRkDLgt8zsYTZKfjEYfOyb9LRWYfABP23mDo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=bVoFanrr9ukE8G0w5kexZDyp4Kec+5rN+dIv8O6m0y1G0vI1p0DB+wzUAjLio+NHb
	 vvjO8LK+WWoqRkvMR6PvVQpfMAxVGjdvuD5Io9Qu9r9fzDVtt1kn2WOuhC5V1aDNKi
	 E0pCWfHthHEQi3KZ9IkMd47EOS7b8w78rpoc6psnnpnU8lZeSym4E6V0mES8ZhdhGC
	 L0V/b36MNVdJfk7CHHexXS4nh0PqNjNketrchyljHkujio3ZBgkSfnYGYlBdG79pKr
	 UFSz3K/HBCY+iaZGhuq76cRHD9FF493hfT7OBjeTYRkWqnJcJGGP07BwmpWHofMaGk
	 BcMLvF/w/7y3Q==
Received: from [100.113.0.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 4A/09-55623-5BB21806; Thu, 22 Apr 2021 07:54:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MxVXerdmO
  CwebDmhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bSxY4F/9grtu/bytLAuJC9i5GLQ0hgFpPE
  1INLgBxOIOc4o8SLF2UgNpuAmsT0WzdYuxg5OEQE9CSu/hMFCTMLqEi8+N0DVi4sYC5x+dYVZ
  hCbRUBV4sKOs2BxXgFHia5Pi9lAbAkBBYkpD9+D1XAKOEmsO32FCWSkEFDNwsOhEOWCEidnPm
  GBGC8hcfDFC2aIVkWJ2ZebWSDsSonO9QsYJzDyz0LSMgtJywJGplWMlklFmekZJbmJmTm6hgY
  GuoaGxrqGukbGZnqJVbqJeqmlusmpeSVFiUBZvcTyYr3iytzknBS9vNSSTYzAUEwpZHyzg/Hr
  6w96hxglOZiURHkX8jUmCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgfaEFlBMsSk1PrUjLzAHGB
  UxagoNHSYTXHiTNW1yQmFucmQ6ROsWoKCXOuxokIQCSyCjNg2uDxeIlRlkpYV5GBgYGIZ6C1K
  LczBJU+VeM4hyMSsK8lzWBpvBk5pXATX8FtJgJaLH2lFqQxSWJCCmpBiY566Ob9z2dPH/iwmc
  HxGb5S++pbFFNdbIy+i2ZMnl2tqlymOsvo/zIOxteR6m5rf52mrN7dUhZgs9HVXm2CVeZvt6f
  vnTFwXMMN6ZUni2c+ci2eoqgg+mczxYXM1/UG+bx/cq4J2e0gv1XbwdHB8/5FJG1mx3mCT7Nt
  ec/VRh2LOlr7ZI3sYWsd7Wuds88eifyXFwb/60NPNkPLhsuL599qEIsULn4hMzSfWUf5SSXzD
  u5+iOHVNTR6bVxd8OOxFjaddZ4SAupsjXO/vfjpclZraTy+6zzzupeOP3J1bN1i+Cmu0u45O/
  zPa7awacYwLQpetmdpyVTDPyLTvBOm33BfVdAuuzMdyl13m+6n+xXYinOSDTUYi4qTgQA0EHz
  8UADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-228.messagelabs.com!1619078069!143744!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31518 invoked from network); 22 Apr 2021 07:54:29 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-14.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Apr 2021 07:54:29 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13M7sSMn006068
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 08:54:28 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 22 Apr 2021 08:54:27 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] tiff: upgrade 4.2.0 -> 4.3.0
Date: Thu, 22 Apr 2021 15:54:06 +0800
Message-ID: <1619078047-5587-5-git-send-email-wangmy@fujitsu.com>
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
 .../recipes-multimedia/libtiff/{tiff_4.2.0.bb => tiff_4.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libtiff/{tiff_4.2.0.bb => tiff_4.3.0.bb} (95%)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.2.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
similarity index 95%
rename from meta/recipes-multimedia/libtiff/tiff_4.2.0.bb
rename to meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index ea8580a25e..abf0a67740 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.2.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -10,7 +10,7 @@ CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
           "
-SRC_URI[sha256sum] = "eb0484e568ead8fa23b513e9b0041df7e327f4ee2d22db5a533929dfc19633cb"
+SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
 
 # exclude betas
 UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.25.1

