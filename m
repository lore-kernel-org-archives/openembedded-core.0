Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.9633.1624979129396566837
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 08:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MYd9y2xF;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624979126; i=@fujitsu.com;
	bh=pVyu0dlNM8nlBUef/S8VbOfE8ZWYPUOE0Af/nvMhjpo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=MYd9y2xFEy6HwhTVHueJVovEXN50QzJ+2E9caXoSIiUW3H0JZBnMW/MW1pVf0YXXL
	 6H2ZmVQrsoGd/obeLDYcm46qqoqq8IeGVlUU6EpzLqi030p4Y6DU+xe051z8gh9/vZ
	 KJeMj5m1kZomOzvlc60bgi+EUpYNAOJCMAtSgoMpot/fiKlVp7pgy/H+IseoyNd3u0
	 1cWW+/Aw1NkeVwRF7+2u2hGtAOansBmDUzcAm2GNP0ghC5q1WsQ0HJMggTZq7tQo87
	 1jjCSzIb4E4TkPkUrfs/ZM+r+BB19ki95TEOePb+r99GCqVl7zIAgfe+uXSMvHKSqZ
	 d+mDi2rBJehbA==
Received: from [100.113.7.10] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 9D/74-03281-6B63BD06; Tue, 29 Jun 2021 15:05:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxVXeb2e0
  Eg01TWSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oye3RfYCp7wVCx4+oe1gfE0dxcjF4eQwCwm
  iY2XZ7FDOCcYJS79bwByODnYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvHrASYQErifMPz
  jCC2CwCqhL3Ll9hASnnFXCSuL/cEiQsIaAgMeXhe2YQm1dAUOLkzCcsEGMkJA6+eMEMUaMoMf
  tyMwuEXSHx+vAl5gmMvLOQtMxC0rKAkWkVo2VSUWZ6RkluYmaOrqGBga6hobGuua6hkaFeYpV
  ukl5qqW5yal5JUSJQVi+xvFivuDI3OSdFLy+1ZBMjMLxSCtkrdzCuffNB7xCjJAeTkijvJb3b
  CUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeC+YAOUEi1LTUyvSMnOAoQ6TluDgURLhnQyS5i0uS
  MwtzkyHSJ1iVJQS5+U0BUoIgCQySvPg2mDxdYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO
  9tkPE8mXklcNNfAS1mAlq86MlNkMUliQgpqQampD6v2gMVRjf3/lS7nXvNfpkxb+Pf7kdbppc
  8OfvrvsO9DYdMvXQrfgmZvHxSu1dQ6H2lwq6OaXpsva9fcrb/Svn1N/J4x9Kp+69XmJf3yZpG
  eSgyfq6q09gQJz4nMYQxZF9B5d9erdbrV8I6F/At/2bA7Hi990aOWNTHqyqpumwsGpVFTxy3z
  OyZe8OPyyLq+gHrQ/PWT7o7b1J7Ce+lop/SHt/b5sxqVNrRXLv/sf8Pv88L0qbKhEROKkrIKV
  3yQYYjRWf1uwNLmu6JKyrsXbD2ZPsf/T7TdRPbDEvZF50w7vt6i2nm9YuWz2ZfvaR4xyt5Ev9
  EluTclx9XcZf5WLaUpx97nCARGrbnUOd7JZbijERDLeai4kQA9VJjWSoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-245.messagelabs.com!1624979125!47443!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10900 invoked from network); 29 Jun 2021 15:05:25 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-12.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 29 Jun 2021 15:05:25 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15TF5Ixu001011
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 16:05:25 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 29 Jun 2021 16:05:16 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] cmake: upgrade 3.20.4 -> 3.20.5
Date: Tue, 29 Jun 2021 23:04:49 +0800
Message-ID: <1624979093-98912-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cmake/{cmake-native_3.20.4.bb => cmake-native_3.20.5.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.20.4.bb => cmake_3.20.5.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.20.4.bb => cmake-native_3.20.5.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.20.4.bb => cmake_3.20.5.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.20.4.bb b/meta/recipes-devtools/cmake/cmake-native_3.20.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.20.4.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.20.5.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index cf2cd0c2fa..c557a55527 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "87a4060298f2c6bb09d479de1400bc78195a5b55a65622a7dceeb3d1090a1b16"
+SRC_URI[sha256sum] = "12c8040ef5c6f1bc5b8868cede16bb7926c18980f59779e299ab52cbc6f15bb0"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.20.4.bb b/meta/recipes-devtools/cmake/cmake_3.20.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.20.4.bb
rename to meta/recipes-devtools/cmake/cmake_3.20.5.bb
-- 
2.25.1

