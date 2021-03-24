Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.68])
 by mx.groups.io with SMTP id smtpd.web09.701.1616629634995938153
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 16:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PBoyO8ns;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.68, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1616629633; i=@fujitsu.com;
	bh=3V8XnVb4J8v8H4ScT5AVzm77yYkmGaikU5wspyQhpGs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=PBoyO8nsBQc2+N1QLM98p3sVW7GaAkzOTEuJLrmjXOX3eODxyuP5AVJGOMx8Auej1
	 ROeMBTZ0n+2uU4ezxnE4n4xSDntrzVSooi/ZbUf43ydW9oz7+EmvCwyxDfnktLrZaU
	 biCYdoNlzlmMTUK7keNTh62sKdj/AOXQ+C7/1e/D5ltch7fUTFW5EPtoJp8uwn0mEV
	 udoq1cp+XXKFAAW1K7ceEEchh3EUKNCLbdOqsIxaDcVv3XYdiD/hR1TYm+TpuwmMnh
	 qACjg48Wk3rF81U+wYYfcEcLnDbisBxEf45gUee7cLYf8Cr0aCCDywFdZ/mvGQJdfk
	 kkGaj8byzcrTg==
Received: from [100.112.198.228] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 36/28-64503-18FCB506; Wed, 24 Mar 2021 23:47:13 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MxVbfhfHS
  Cwd3JhhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8binQfYC7ZyVGw5ENTAeJy9i5GLQ0hgM5PE
  1c/fmSCcE4wSB++sZ+xi5ORgE1CTmH7rBmsXIweHiICexNV/oiBhZgF1iUvrWlhAbGEBS4kzf
  y8wgdgsAqoSF96/AWvlFXCSOHOrmw3ElhBQkJjy8D0zRFxQ4uTMJywQcyQkDr54wQxRoygx+3
  IzC4RdJbGmYxrbBEbeWUhaZiFpWcDItIrRIqkoMz2jJDcxM0fX0MBA19DQSNfQ0lzX0NhcL7F
  KN0kvtVS3PLW4RNdQL7G8WK+4Mjc5J0UvL7VkEyMwuFIKjnbuYPz16oPeIUZJDiYlUV7rDdEJ
  QnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4t54FygkWpaanVqRl5gADHSYtwcGjJMK7HCTNW1yQm
  FucmQ6ROsWoKCXOu/EcUEIAJJFRmgfXBouuS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeR
  1BpvBk5pXATX8FtJgJaPHGH5Egi0sSEVJSDUxMwvp/tJj4g/esNV4nuGn7gsI7P3iCXV+Gulp
  M26wz484Ja+tE3Yv528xDWo76fgxbwckteiIwd+Oaxwm+Sr13JWKWWtWyJ72S//ja8bZ4R95H
  0QlSdu5zKrZaOnxIln14r3HyhAwjx7YH4SEbXLcdqHTNY7s3c2eIyKeJt9an2R848qjkho/tM
  xNvhfRJ0/Oj975mb9x1y+rA2ReZXiabJSsrJoWduNR45tAz53Z7lnUlmQx6X7wN74r/alR+Ed
  1y54h8ibmc6PziH9zLJ9rrqaY6fmrQfGsftpJ9rugZkTg77Z/e0tOW/eM6zFfdoPZ5iVeBLfP
  NSIVmj2L1lqRvGmJmLw8ff99Rsy20XImlOCPRUIu5qDgRAEFZEOUpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-41.tower-287.messagelabs.com!1616629632!568746!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26338 invoked from network); 24 Mar 2021 23:47:12 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-41.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2021 23:47:12 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12ONl6nF015350
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 23:47:12 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 24 Mar 2021 23:47:05 +0000
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] gnutls: upgrade 3.7.0 -> 3.7.1
Date: Thu, 25 Mar 2021 07:46:52 +0800
Message-ID: <1616629614-44093-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-support/gnutls/{gnutls_3.7.0.bb => gnutls_3.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.7.0.bb => gnutls_3.7.1.bb} (96%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.0.bb b/meta/recipes-support/gnutls/gnutls_3.7.1.bb
similarity index 96%
rename from meta/recipes-support/gnutls/gnutls_3.7.0.bb
rename to meta/recipes-support/gnutls/gnutls_3.7.1.bb
index 1aa94ece3a..51d472c828 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.0.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.1.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
            "
 
-SRC_URI[sha256sum] = "49e2a22691d252c9f24a9829b293a8f359095bc5a818351f05f1c0a5188a1df8"
+SRC_URI[sha256sum] = "3777d7963eca5e06eb315686163b7b3f5045e2baac5e54e038ace9835e5cac6f"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.25.1

