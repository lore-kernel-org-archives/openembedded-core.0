Return-Path: <niko.mauno@vaisala.com>
Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com
	[193.143.230.17])
	by mail.openembedded.org (Postfix) with ESMTP id D3DFA71A50
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 11:19:37 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3AiUzyMRPDRdx2EMTMrKYl6mtUPXoX/o7sNwtQ0KIM?=
	=?us-ascii?q?zox0IvX/rarrMEGX3/hxlliBBdydsKMazbeH+Pu9EUU7or+5+EgYd5JNUxJXwe?=
	=?us-ascii?q?43pCcHRPC/NEvgMfTxZDY7FskRHHVs/nW8LFQHUJ2mPw6arXK99yMdFQviPgRp?=
	=?us-ascii?q?OOv1BpTSj8Oq3Oyu5pHfeQtFiT68bL9oLBi7qQrdu8cWjIB/Nqs/1xzFr2dSde?=
	=?us-ascii?q?9L321oP1WTnxj95se04pFu9jlbtuwi+cBdT6j0Zrw0QrNEAjsoNWA1/9DrugLY?=
	=?us-ascii?q?TQST/HscU34ZnQRODgPY8Rz1RJbxsi/9tupgxCmXOND9QL4oVTi+6apgVRnlgz?=
	=?us-ascii?q?oFOTEk6mHaksx+grxGrhK9qRJxwI/Ub52aOvVxZa7dYcoaSHBdUspNSyBNH4Wx?=
	=?us-ascii?q?ZJYPAeobOuZYqpHwqlwIrRu/BgmsA/njyjpSiX/r26061P8sER/c0wwhBNIBqn?=
	=?us-ascii?q?DUo8/vOKgOVuC1ybDFwDPeZP1Y3jf97ZLHchEnofyUQb1wdszRyUc1GwPElVWc?=
	=?us-ascii?q?sYPlPzKJ1uQNrmiU9PBsWv6oi24irQx6vzuhxt80h4XUhI8Z1ErI+Tt2zYovON?=
	=?us-ascii?q?G0Uk12bN+8HJdNtSyWKZF6Tt0tTm1yuSs3xacKtYOlcCUJ0JgnyQDQZv+bf4WN?=
	=?us-ascii?q?5x/uVOKcLipliH9gZb6wnRS//E2+xeLhVMS03lNHojRYndXRtH0A0QHY5NKdRf?=
	=?us-ascii?q?tn5Eih3C6C1wXU6u5ZP085jbHbK5s9wr4okZoTrFjDEjf2mEroiK+WcV0p9Oqn?=
	=?us-ascii?q?5erhe7noqZ6TOpF2hA3nLqgjlNazDvg/MggUR2iX4/q826fi/U3iWrpKiuc5nr?=
	=?us-ascii?q?PFv5DdIMQXvq+5AwlL3YY/8xuzEjWr3MoCkXUZI19JYg+Lg5LqNlzPOPz4CO2w?=
	=?us-ascii?q?g1WokDdl3fDGObjhD43LLnjCk7fheqxx60tGxwouy9Bf4IlZCq8bL/LyQU/+rt?=
	=?us-ascii?q?jYAQUjPwOoxObnDc1x1pkCVmKXHq+ZLKTSvEeP5uI3PeaMYpEauDPmJPc7+vHh?=
	=?us-ascii?q?kGE2lkIEcaa12psXcm63E+9iI0WYenrsnswBHX0NvgomUuPqjkONUTtIaHmsQq?=
	=?us-ascii?q?0z+y80B5+8AYfEXICtj+/J4CDuSppOa2ZLD1qBHXvle8CPXO0BQCaTOdN61Dsc?=
	=?us-ascii?q?WL6sToUs2R2juEn90bUxfcTO/ShN4ZTi198z4uTOkxYa6zV1FM2Z2ieGSGQizT?=
	=?us-ascii?q?BAfCM/wK0q+R818VyEy6Ut2/E=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GDAQBXvAlZ/1YBGKxcHAEBBAEBCgEBF?=
	=?us-ascii?q?wEBBAEBCgEBhAyBDAeNeadBgUxDLoV2hSMYAQEBAQEBAQEBAQECgRCCMyALBEY?=
	=?us-ascii?q?pLwEBAQEBAQEBAQEBAQEBARoCDYFdEgE1SycEDgWKL7JQinEBAQEBAQUBAQEBA?=
	=?us-ascii?q?QEBHAWIPYdaDlUNhRkFkFiNA4cbi3uRXJQ0H4FDb4dKdoYhKoEGgQ0BAQE?=
X-IPAS-Result: =?us-ascii?q?A2GDAQBXvAlZ/1YBGKxcHAEBBAEBCgEBFwEBBAEBCgEBhAy?=
	=?us-ascii?q?BDAeNeadBgUxDLoV2hSMYAQEBAQEBAQEBAQECgRCCMyALBEYpLwEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQEBARoCDYFdEgE1SycEDgWKL7JQinEBAQEBAQUBAQEBAQEBHAWIPYdaDlU?=
	=?us-ascii?q?NhRkFkFiNA4cbi3uRXJQ0H4FDb4dKdoYhKoEGgQ0BAQE?=
X-IronPort-AV: E=Sophos;i="5.38,283,1491253200"; d="scan'208";a="40531143"
Received: from hel-exch-03.corp.vaisala.com ([172.24.1.86])
	by hel-mailgw-01.vaisala.com with ESMTP/TLS/AES256-SHA;
	03 May 2017 14:19:20 +0300
Received: from HEL-EXCH-02.corp.vaisala.com (172.24.1.85) by
	HEL-EXCH-03.corp.vaisala.com (172.24.1.86) with Microsoft SMTP Server
	(TLS) id 15.0.1210.3; Wed, 3 May 2017 14:19:20 +0300
Received: from HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17]) by
	HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17%14]) with mapi
	id 15.00.1210.000; Wed, 3 May 2017 14:19:20 +0300
From: <niko.mauno@vaisala.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2] licenses.conf: Allow overriding environment specific
	SPDX variables
Thread-Index: AQHSw/8bHv8CeLjtqUKVUPc0gy1FJw==
Date: Wed, 3 May 2017 11:19:19 +0000
Message-ID: <1493810352-5496-1-git-send-email-niko.mauno@vaisala.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.24.64.128]
MIME-Version: 1.0
Subject: [PATCH v2] licenses.conf: Allow overriding environment specific SPDX variables
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
X-List-Received-Date: Wed, 03 May 2017 11:19:38 -0000
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

