Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web11.3269.1618466885628582543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 23:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eQoy0cU9;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618466883; i=@fujitsu.com;
	bh=GE019pva19SQlGSlyaSsdBaze58IawzBbx6yzdrMt3I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=eQoy0cU9wGjAtVvLhzrmvUdWRRUxHfVYwCv3hLsVE2GgplEsNdYE5vwlNohZCREsR
	 /z6uIi3l4Y2q/MOBYL8hseaWmpxbgVJndF1jL2XAxBkGFkEKxkhyYu9cBbgxdpfwyL
	 EFAbWPFhOla2SKpPhXYyg3SfgP2NuR2b5ASeGbKdCUYisD/tEWqr8/tMQHV3CqH4ge
	 VRa/GXhsoiH2kMojFZnGNAZA1Qgw9ILBr/7EGMnK7SOFGn19dpw1+m+XzKETrgsPPT
	 FejxpTu9s8OVyVSk29EV9tJeyW8LG6Uf76atYnCOTpKJe2Ratf8He+5fF/ed4t6bOp
	 NUCLV/GWxJ1Wg==
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id EE/D0-01834-348D7706; Thu, 15 Apr 2021 06:08:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MRout8ozz
  B4MwpKYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeN/22vmgrkiFZfevWFqYLwo2MXIxSEkMItJ
  4s36PSwQznFGiamfrrJ3MXJysAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3z1gJcICJhIH/
  2xiBbFZBFQlnv2dwwRi8wo4Sfz9eIANxJYQUJCY8vA9M0RcUOLkzCcsEHMkJA6+eMEMUaMoMf
  tyMwuEXSnRuX4B4wRG3llIWmYhaVnAyLSK0TypKDM9oyQ3MTNH19DAQNfQ0EjX0NJE18xML7F
  KN1EvtVS3PLW4RNdQL7G8WK+4Mjc5J0UvL7VkEyMwuFIKDjntYHz/+oPeIUZJDiYlUd5DK8oS
  hPiS8lMqMxKLM+KLSnNSiw8xynBwKEnw7rhWniAkWJSanlqRlpkDDHSYtAQHj5II77frQGne4
  oLE3OLMdIjUKUZFKXFeGZCEAEgiozQPrg0WXZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCf
  PWgEzhycwrgZv+CmgxE9DiilWlIItLEhFSUg1MQSZPf4Ys0FJU3z1nkVdNt+FVIwbv7VkLk9X
  unNR3frB0SrOM1eJWhY/Vs/rFbjhVnjrx6MDZzRcerlLJL/jtNrP9xJ/HR/Jz+OWOF//Zr3rG
  QCL2psPWo5IlOW15iw4yz57KXMSpu/wIs7+04InFnrJGfz5+elkZ6fOxRexAoayY7BoT3eB/N
  ka9zW+tj7OXqPHpVrF+qbN8uC+C4TdrUPq+6doBZQq+mssrPxy7rGUeVpv/vPD2lMPXr4fb3T
  S8/rdZTPth7kqmzhjNW/cKvqm26797xHz0/ezfmSIdLzhdlrY9uxDv8eihsnf87ukxeipdQlI
  cAvWVjLd06ybbPVkS27CGw+BC48HH0xWUWIozEg21mIuKEwGSGMqEKQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-271.messagelabs.com!1618466883!1415220!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19158 invoked from network); 15 Apr 2021 06:08:03 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-10.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Apr 2021 06:08:03 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13F682s6005084
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 07:08:03 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 15 Apr 2021 07:07:31 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] icu: upgrade 68.2 -> 69.1
Date: Thu, 15 Apr 2021 14:07:18 +0800
Message-ID: <1618466841-24292-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

refresh 0001-icu-Added-armeb-support.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../icu/icu/0001-icu-Added-armeb-support.patch              | 6 +++---
 meta/recipes-support/icu/{icu_68.2.bb => icu_69.1.bb}       | 5 ++---
 2 files changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-support/icu/{icu_68.2.bb => icu_69.1.bb} (95%)

diff --git a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
index 145efc0e01..c5dc0611c2 100644
--- a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
+++ b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
@@ -13,7 +13,7 @@ Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/i18n/double-conversion-utils.h b/i18n/double-conversion-utils.h
-index 8c6a0e1..cf89907 100644
+index c937463..feaad0f 100644
 --- a/i18n/double-conversion-utils.h
 +++ b/i18n/double-conversion-utils.h
 @@ -115,7 +115,7 @@ int main(int argc, char** argv) {
@@ -24,7 +24,7 @@ index 8c6a0e1..cf89907 100644
 +    defined(__arm__) || defined(__avr32__) || defined(_M_ARM) || defined(_M_ARM64) || \
      defined(__hppa__) || defined(__ia64__) || \
      defined(__mips__) || \
-     defined(__nios2__) || \
+     defined(__nios2__) || defined(__ghs) || \
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta/recipes-support/icu/icu_68.2.bb b/meta/recipes-support/icu/icu_69.1.bb
similarity index 95%
rename from meta/recipes-support/icu/icu_68.2.bb
rename to meta/recipes-support/icu/icu_69.1.bb
index 1ca87feee4..b79acba0cc 100644
--- a/meta/recipes-support/icu/icu_68.2.bb
+++ b/meta/recipes-support/icu/icu_69.1.bb
@@ -106,14 +106,13 @@ SRC_URI = "${BASE_SRC_URI};name=code \
            ${DATA_SRC_URI};name=data \
            file://filter.json \
            file://fix-install-manx.patch \
-           file://0001-icu-Added-armeb-support.patch \
            "
 
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] = "c79193dee3907a2199b8296a93b52c5cb74332c26f3d167269487680d479d625"
-SRC_URI[data.sha256sum] = "2989b466fa010edc41297e12fdd5ae47c2610ad68b63af1a0bd2a1acfaf497f3"
+SRC_URI[code.sha256sum] = "4cba7b7acd1d3c42c44bb0c14be6637098c7faf2b330ce876bc5f3b915d09745"
+SRC_URI[data.sha256sum] = "4fc2d8cfc3343673123586fca3967404abd4e346fba5515829204533b3bae4bf"
 
 UPSTREAM_CHECK_REGEX = "icu4c-(?P<pver>\d+(_\d+)+)-src"
 UPSTREAM_CHECK_URI = "https://github.com/unicode-org/icu/releases"
-- 
2.25.1

