Return-Path: <niko.mauno@vaisala.com>
X-Greylist: delayed 601 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 May 2017 10:49:49 UTC
Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com
	[193.143.230.17])
	by mail.openembedded.org (Postfix) with ESMTP id B2B43719FA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 10:49:49 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3A64x/NBUZn3e/ponZBpb8Gypiit3V8LGtZVwlr6E/?=
	=?us-ascii?q?grcLSJyIuqrYbB2Dt8tkgFKBZ4jH8fUM07OQ6PG+HzFRqszQ+Fk5M7V0Hycfjs?=
	=?us-ascii?q?sXmwFySOWkMmbcaMDQUiohAc5ZX0Vk9XzoeWJcGcL5ekGA6ibqtW1aFRrwLxd6?=
	=?us-ascii?q?KfroEYDOkcu3y/qy+5rOaAlUmTaxe71/IRG3oAnLtsQbhYRuJrg1xxDUvnZGZu?=
	=?us-ascii?q?NayH9yK1mOhRj8/MCw/JBi8yRUpf0s8tNLXLv5caolU7FWFSwqPG8p6sLlsxnD?=
	=?us-ascii?q?VhaP6WAHUmoKiBpIAhPK4w/8U5zsryb1rOt92C2dPc3rUbA5XCmp4ql3RBP0ji?=
	=?us-ascii?q?oMKjg0+3zVhMNtlqJWuBKvqQJizY7Ibo+bN/t+cb/Sc9wVXmdBQt9RWjZdDo+g?=
	=?us-ascii?q?c4cDEuwMNvtYoYnnoFsOqAOzCA6qBOPuyT9IgWX63agg3OQ8FwHG2xctH8wUv3?=
	=?us-ascii?q?TVt9X6LqMSXvqvwKbUyjXDaupb1DHg44bGdRAhpOuDXbN2ccfJ1UYvEAXFjluK?=
	=?us-ascii?q?pYzkJDOZzusNs2mH7+pgSOKgkHQrpB12ojiqwMonl4rHhpoNx1zZ9yh13pw5Kc?=
	=?us-ascii?q?O3RUJhfNKoCp9duzyCO4drQM4uXXtktDg1x7EcuJO2czIGxIk5yxPcc/CHfZaH?=
	=?us-ascii?q?7xH/WOuUJDp1hHZod6+iixu37ESv0O/xW8yq31lXrCdFnNzBum4Q2BDO6MWKTO?=
	=?us-ascii?q?Z28F271jaVzQ/T7/lJIUUzlaXGNZEs2qUwlp8PsUTbGS/2hVn2gLeWdko6/uio?=
	=?us-ascii?q?7PzqbLfpqJGaLoN6hQDxP7oslMCmHeg0LxICUHSc+eSmzL3v51P5T69Ljv0tiK?=
	=?us-ascii?q?bZtIrVKd4Hqa6+Bg9Zyocj6xChADe6yNkUgHsKIExfdB6ZgIXlIUzCLOr8APui?=
	=?us-ascii?q?m1islS1kx/HCPr3vGJXNKX3Dna/nfbZ86E5czxA/zdVF6JJJDLEBJ+n+WlHru9?=
	=?us-ascii?q?zZFR82KQi0zPz9BNph0YMeXHqDArWFP6PKrV+I+uUvLvGLZI8Npjn9LeYq5/v1?=
	=?us-ascii?q?gnAnhFASYLem0oYOZH+kGfRmOVuWbGHogtcACmcKohE+QPbtiF2aTzFTYWi9X6?=
	=?us-ascii?q?cn6T4lFY2pEJnMSZ23jLyGxie7Ec4eWmcTXleUHHHlco+JV/sBZGeZJdVsujgF?=
	=?us-ascii?q?TqS6DYg52BejsQX3x7ZqIqzT4CJO5rz5090gs+vSlhZ08DVpCcO1zWiMVGhwly?=
	=?us-ascii?q?UDQDpgj/M3mlB01lrWifswuPdfD9EGv/4=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GDAQAcswlZ/1sBGKxcHAEBBAEBCgEBF?=
	=?us-ascii?q?wEBBAEBCgEBhAyBDAeNeadBgUxDLoV2hSMYAQEBAQEBAQEBAQECgRCCMyALBEY?=
	=?us-ascii?q?pLwEBAQEBAQEBAQEBAQEBARoCDYFdEgE1SycEDgWKL7JJinIBAQEBAQUBAQEBA?=
	=?us-ascii?q?QEBHAWIPYdaDlUNhRkFkFiNA4cbi3uRWgKUNB+BQ2+HSnaGISqBBoENAQEB?=
X-IPAS-Result: =?us-ascii?q?A2GDAQAcswlZ/1sBGKxcHAEBBAEBCgEBFwEBBAEBCgEBhAy?=
	=?us-ascii?q?BDAeNeadBgUxDLoV2hSMYAQEBAQEBAQEBAQECgRCCMyALBEYpLwEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQEBARoCDYFdEgE1SycEDgWKL7JJinIBAQEBAQUBAQEBAQEBHAWIPYdaDlU?=
	=?us-ascii?q?NhRkFkFiNA4cbi3uRWgKUNB+BQ2+HSnaGISqBBoENAQEB?=
X-IronPort-AV: E=Sophos;i="5.38,283,1491253200"; d="scan'208";a="40528117"
Received: from hel-exch-01.corp.vaisala.com ([172.24.1.91])
	by hel-mailgw-01.vaisala.com with ESMTP/TLS/AES256-SHA;
	03 May 2017 13:39:48 +0300
Received: from HEL-EXCH-02.corp.vaisala.com (172.24.1.85) by
	HEL-EXCH-01.corp.vaisala.com (172.24.1.91) with Microsoft SMTP Server
	(TLS) id 15.0.1210.3; Wed, 3 May 2017 13:39:47 +0300
Received: from HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17]) by
	HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17%14]) with mapi
	id 15.00.1210.000; Wed, 3 May 2017 13:39:47 +0300
From: <niko.mauno@vaisala.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] Allow overriding environment specific SPDX variables
Thread-Index: AQHSw/mWLE6QUEh+wUW6n2xCpu4qSA==
Date: Wed, 3 May 2017 10:39:47 +0000
Message-ID: <1493807968-4697-1-git-send-email-niko.mauno@vaisala.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.24.64.128]
MIME-Version: 1.0
Subject: [PATCH] Allow overriding environment specific SPDX variables
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 May 2017 10:49:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Change certain variable assignments from 'hard' (=3D) to 'soft' (?=3D) so t=
hat
suitable permutations of values for these variables can be assigned eg. in
custom meta layers. Otherwise eg. fossology server is limited to run on sam=
e
machine as bitbake, and generated SPDX files are placed into home directory
path of a custom luser account.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/conf/licenses.conf | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index d210a0e..fcaec1b 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -123,7 +123,9 @@ SPDXLICENSEMAP[SGIv1] =3D "SGI-1"
=20
 ## SPDX temporary directory
 SPDX_TEMP_DIR =3D "${WORKDIR}/spdx_temp"
-SPDX_MANIFEST_DIR =3D "/home/yocto/fossology_scans"
+
+## Output directory for generated SPDX files
+SPDX_MANIFEST_DIR ?=3D "/home/yocto/fossology_scans"
=20
 ## SPDX Format info
 SPDX_VERSION =3D "SPDX-1.1"
@@ -142,7 +144,7 @@ DATA_LICENSE =3D "CC0-1.0"
 #   information.
 #
=20
-FOSS_NO_COPYRIGHT =3D "true"
+FOSS_NO_COPYRIGHT ?=3D "true"
=20
 # A option defined as[FOSS_RECURSIVE_UNPACK] in ./meta/conf/licenses.conf.=
 is
 # used to control if FOSSology server need recursively unpack tar.gz file =
which
@@ -156,7 +158,7 @@ FOSS_NO_COPYRIGHT =3D "true"
 #    FOSSology server recursively unpack components.
 #
=20
-FOSS_RECURSIVE_UNPACK =3D "false"
+FOSS_RECURSIVE_UNPACK ?=3D "false"
=20
 # An option defined as [FOSS_FULL_SPDX] in ./meta/conf/licenses.conf is us=
ed to
 # control what kind of SPDX output to get from the FOSSology server.
@@ -171,7 +173,7 @@ FOSS_RECURSIVE_UNPACK =3D "false"
 #   license tags in the report will be "NOASSERTION"
 #
=20
-FOSS_FULL_SPDX =3D "true"
+FOSS_FULL_SPDX ?=3D "true"
=20
 # FOSSologySPDX instance server. http://localhost/repo is the default
 # installation location for FOSSology.
@@ -180,7 +182,7 @@ FOSS_FULL_SPDX =3D "true"
 #   https://github.com/spdx-tools/fossology-spdx/wiki/Fossology-SPDX-Web-A=
PI
 #
=20
-FOSS_BASE_URL =3D "http://localhost/repo/?mod=3Dspdx_license_once"
+FOSS_BASE_URL ?=3D "http://localhost/repo/?mod=3Dspdx_license_once"
 FOSS_SERVER =3D "${FOSS_BASE_URL}&fullSPDXFlag=3D${FOSS_FULL_SPDX}&noCopyr=
ight=3D${FOSS_NO_COPYRIGHT}&recursiveUnpack=3D${FOSS_RECURSIVE_UNPACK}"
=20
 FOSS_WGET_FLAGS =3D "-qO - --no-check-certificate --timeout=3D0"
--=20
2.1.4

