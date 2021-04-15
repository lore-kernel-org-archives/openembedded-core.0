Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web08.3251.1618466914517900462
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 23:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sqrzCIeJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618466912; i=@fujitsu.com;
	bh=e+cGMe5ym/XevNcFwKNHjnJHpp7MBqQYup8giyBvkFQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=sqrzCIeJqZVvpnjvewohoC6WOMxdZKwCvaSG9zhV61Ep42J36J6P8Gpx89anocpdZ
	 e3j2UsOg7BTBJqeFDUkUQsegpWSpc1pk2IPS6Ee9K6RdpQP/XoOuV/afIUf0v4MQkk
	 2wpsY3VvfOcEYKV3SsBFTocN9Fu7ePYHqdjf3x07zp6r56eRXZ6Y8yWzzb3gWvqSIZ
	 X7npNt5iZ/VmRKV9aieS3IiE8fKl0U4CeIJfcGvOE050Zu1erjzYE/IyM8WE5b4fFC
	 1SVnOKexHeBcIJ03AcDUTHgZR6zHr1D7AyjhirBQk3NAXi9h0PY+K+HcMWk4gcrGtu
	 DdPkP4NZj0rrg==
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id CA/0C-14660-068D7706; Thu, 15 Apr 2021 06:08:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRWlGSWpSXmKPExsViZ8MRoptwozz
  B4MwLCYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP0jk72gnU8FXeX7WRrYOzm7mLk4hASmMUk
  sf3cTmYI5zijxIvOy6xdjJwcbAJqEtNv3QCyOThEBPQkrv4TBQkzC6hIvPjdww5iCwuYS7xb8
  YcJxGYRUJXYeGQeC4jNK+AkMXXvNDYQW0JAQWLKw/fMEHFBiZMzn7BAzJGQOPjiBTNEjaLE7M
  vNLBB2pUTn+gWMExh5ZyFpmYWkZQEj0ypGi6SizPSMktzEzBxdQwMDXUNDI11DS1NdI0NTvcQ
  q3US91FLd8tTiEl1DvcTyYr3iytzknBS9vNSSTYzA8EopOHx9B+Ot1x/0DjFKcjApifIeWlGW
  IMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCVxEYsEKCRanpqRVpmTnAUIdJS3DwKInwfrsOlOYtL
  kjMLc5Mh0idYjTmOLlqySJmjlUHpq9iFmLJy89LlRLnlQEpFQApzSjNgxsEi8FLjLJSwryMDA
  wMQjwFqUW5mSWo8q8YxTkYlYR5a0Cm8GTmlcDtewV0ChPQKRWrSkFOKUlESEk1MPmEN5R2Snc
  67W9hyZH/ojzviL3Bra5N3bNf/uF1UYk47ZaeJ3yHJ9KxKck5b+bT95HXFJhW3WyuiA00e/T1
  d0SnfOtyvsOvtzD6fA8rczdiWHpbvb1nQg5vcOs7/VUVbVH9TNt3et/98W/ibft+r+wccea30
  +66aSd5rXhpMmvbwg1le26tD11oWTsvRHZlirSkkvzUb41us+zX5M+P4fv1T/hMpu35VfEWm6
  XjdPmW3NLamhB36DFf3nWbf3E3fmYLz90Rpmm17OVqZbV65i9vX31iP5H5bf3ZHd8rXmxo/nb
  w+YFlwus2iwnOXmZ42WrpkQTvS21Zzpfn3spL/h53IyNk8eVFWQ2yr1/FzVViKc5INNRiLipO
  BAC5lxeoPAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-265.messagelabs.com!1618466912!1468933!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15446 invoked from network); 15 Apr 2021 06:08:32 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-22.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Apr 2021 06:08:32 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13F68VSE005237
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 07:08:32 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 15 Apr 2021 07:08:30 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libcap: upgrade 2.48 -> 2.49
Date: Thu, 15 Apr 2021 14:08:19 +0800
Message-ID: <1618466900-24355-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

License-Update: add description of GPL v2.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/libcap/{libcap_2.48.bb => libcap_2.49.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.48.bb => libcap_2.49.bb} (93%)

diff --git a/meta/recipes-support/libcap/libcap_2.48.bb b/meta/recipes-support/libcap/libcap_2.49.bb
similarity index 93%
rename from meta/recipes-support/libcap/libcap_2.48.bb
rename to meta/recipes-support/libcap/libcap_2.49.bb
index a12738d63a..3f4a9256cf 100644
--- a/meta/recipes-support/libcap/libcap_2.48.bb
+++ b/meta/recipes-support/libcap/libcap_2.49.bb
@@ -5,7 +5,7 @@ users, without giving them full root permissions."
 HOMEPAGE = "http://sites.google.com/site/fullycapable/"
 # no specific GPL version required
 LICENSE = "BSD | GPLv2"
-LIC_FILES_CHKSUM = "file://License;md5=3f84fd6f29d453a56514cb7e4ead25f1"
+LIC_FILES_CHKSUM = "file://License;md5=e2370ba375efe9e1a095c26d37e483b8"
 
 DEPENDS = "hostperl-runtime-native gperf-native"
 
@@ -14,7 +14,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
            file://0002-tests-do-not-run-target-executables.patch \
            file://0001-tests-do-not-statically-link-a-test.patch \
            "
-SRC_URI[sha256sum] = "4de9590ee09a87c282d558737ffb5b6175ccbfd26d580add10df44d0f047f6c2"
+SRC_URI[sha256sum] = "e98bc4d93645082ec787730b0fd1a712b38882465c505777de17c338831ee181"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.25.1

