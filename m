Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.286.1622072825881207330
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 16:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dsCIMbFD;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622072824; i=@fujitsu.com;
	bh=HFHBaIBVJmtMtGMWqyvwlN1A7mUreNG2/MvNs84V7LI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dsCIMbFDv/8eFKdGoK1Iv1wwaGfBLZ49EUXmdQTVB7LCEq8j9WeUWgEXRLgGLpF+Y
	 VoWyrk4U5GJPIZGAGmtfnPn3zzfeWNFo1wuKvYFIGLcbBqQdVsKoxsTQ80PQ3Rhp6j
	 Cf0z3Oqh3KeBRr5zQB1hrxtu3DipU4kMPFaUE3cpivEbwNeLIYt4q4OKwgsAGi3KEi
	 NeSbEIWHKq0Gl53bnwGo4NkoPE6iS9wZKn+jdsbpr67UbtTJjrC8q3I/nBbR211s6M
	 OKIPEHRQE6+JYIp3pXCc9Z8fEoEbvcLZqeZAdvB99XU33MrFyVWwfFhFm8JEGSMBou
	 F7QOMnwdtEuag==
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 73/DE-25406-7FDDEA06; Wed, 26 May 2021 23:47:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRqvv97ro
  Eg5l7WSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oyfW94yF3zhqPjweAtjA+Nsji5GLg4hgVlM
  EluuvWCGcE4wSrx8O5Gpi5GTg01ATWL6rRusXYwcHCICehJX/4mChJkFVCRe/O5hB7GFBZwlN
  h3aA2azCKhK/Ng4kw3E5hVwlJjYfRAsLiGgIDHl4XtmiLigxMmZT1gg5khIHHzxghmiRlFi9u
  VmFgi7QuL14UvMExh5ZyFpmYWkZQEj0ypGi6SizPSMktzEzBxdQwMDXUNDI11DSzNdI0MTvcQ
  q3SS91FLd8tTiEl1DvcTyYr3iytzknBS9vNSSTYzA8EopOHJtB+OB1x/0DjFKcjApifJeO7Eu
  QYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7+TbQDnBotT01Iq0zBxgqMOkJTh4lER4e28BpXmLC
  xJzizPTIVKnGBWlxHmvgvQJgCQySvPg2mDxdYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO
  8HkCk8mXklcNNfAS1mAloslAi2uCQRISXVwBSpcKv+vZL4e7NwJ5cQyZ0q/68s0VGeu+dX9/G
  kGbOcAlUDPn0+9fVA/Jblm1k1bv0O0leRaw+/vL+7ebXXxfYoTZ93AQd811+b8qbmNzNfnPZe
  tbc37VTXaDTZt6yK3GTMvyv+/kvVWrkJnOu7FTezL19zQEFwTfd2z962q1N5nn9yUa44Y97zz
  k4xeWZpn+u7dXe7Lxabf9Hv8tl8eGOv1pX09X+Us/ax2jx68CBmuqoBt4RhcZtc1aHLJUkmZs
  rW92S2JgesuRQg823dLd4Frj0Xn0mICrHmFTA7/TfuO7mc6bhB35xpkSuTnz2Tm7k49wWz15r
  LCQ/i5JbI8qtKrVw6L4ir1FAzT/p3pBJLcUaioRZzUXEiADTBHWMqAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-291.messagelabs.com!1622072822!91774!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9949 invoked from network); 26 May 2021 23:47:03 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-10.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 May 2021 23:47:03 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14QNkuMI017906
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 May 2021 00:47:02 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 27 May 2021 00:46:54 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-libarchive-c: upgrade 2.9 -> 3.0
Date: Thu, 27 May 2021 07:46:43 +0800
Message-ID: <1622072806-6524-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-libarchive-c_2.9.bb => python3-libarchive-c_3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-libarchive-c_2.9.bb => python3-libarchive-c_3.0.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb b/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-libarchive-c_2.9.bb
rename to meta/recipes-devtools/python/python3-libarchive-c_3.0.bb
index 3a2d8733e9..d29195545f 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_3.0.bb
@@ -9,8 +9,8 @@ PYPI_PACKAGE = "libarchive-c"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "083bd2cb0043c1e22a52cb9a05e31532"
-SRC_URI[sha256sum] = "9919344cec203f5db6596a29b5bc26b07ba9662925a05e24980b84709232ef60"
+SRC_URI[md5sum] = "920885f5910aa8245e30896996e0415b"
+SRC_URI[sha256sum] = "6f12fa9cf0e44579e5f45bbf11aa455a930fbfdb13ea0ce3c3dfe7b9b9a452ba"
 
 RDEPENDS_${PN} += "\
   libarchive \
-- 
2.25.1

