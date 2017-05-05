Return-Path: <niko.mauno@vaisala.com>
Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com
	[193.143.230.17])
	by mail.openembedded.org (Postfix) with ESMTP id A34AC77DA9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 10:42:48 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3AOYxc6h2Ze48Dt9xQsmDT+DRfVm0co7zxezQtwd8Z?=
	=?us-ascii?q?seIfIvad9pjvdHbS+e9qxAeQG96KtbQa16GM4ujJYi8p2d65qncMcZhBBVcuqP?=
	=?us-ascii?q?49uEgeOvODElDxN/XwbiY3T4xoXV5h+GynYwAOQJ6tL1LdrWev4jEMBx7xKRR6?=
	=?us-ascii?q?JvjvGo7Vks+7y/2+94fdbghMhTexe7J/IRq5oQnPssQdnJdvJLs2xhbVuHVDZv?=
	=?us-ascii?q?5YxXlvJVKdnhb84tm/8Zt++ClOuPwv6tBNX7zic6s3UbJXAjImM3so5MLwrhnM?=
	=?us-ascii?q?URGP5noHXWoIlBdDHhXI4wv7Xpf1tSv6q/Z91SyHNsD4Ubw4RTKv5LptRRT1ii?=
	=?us-ascii?q?kIKiQ5/XnXhMJukaxbvByvqR9xw4HWYYGaKPVwcazGcNMGXGpMRNpdWzBdDo+h?=
	=?us-ascii?q?aYYEEuoPPfxfr4n4v1YDqh2+BQivBOPo0DNIg2X53bA80+QmCgzGwhYvH9MVsH?=
	=?us-ascii?q?vOqNX6Lr0eXvyyzKnN1DjOae5d1zn66IjNaB8hoPeMUKpsfsrWz0kvGRnJjlSL?=
	=?us-ascii?q?qYD9MDOV1/gNs2iG7+V7T+6gl2knqwR3rzOyxckskpHEip8Xx1za7yl13ok4Kc?=
	=?us-ascii?q?elREJhYtOpEYNcuzyYOodoWM8uXW5ltDw7x7AJo5K3YTYGxZc/yx7RdfOKcJSE?=
	=?us-ascii?q?7xfmWeuRJTp3mW9pdbeiixmo80Wtz/PzWdS23VZEqydJjMTDum0P2hHV98OJUO?=
	=?us-ascii?q?Fy/l271jaKzw3T7+ZELl0qmqfDMJ4hx6IwloIUsUTeAi/6gEX2g7GSdkUj4uWm?=
	=?us-ascii?q?6evpbLP/qpGTNoB5lAPwPr0ylsGxG+g3Lg8OX3KD+eimyr3s50z5QK5Qgf0yiK?=
	=?us-ascii?q?bVqozVJcMepqKhAg9V1Jgs6wqnAju70tkUg2MLIExKdR6dkoTlIVLDLfHgAfe6?=
	=?us-ascii?q?mVuskTNrx/7cPr3mB5XANn7DkLbifbZ68UJczRA8zc1Z55JTEbwBPuj8Wk7qtN?=
	=?us-ascii?q?PCCh82KRa4zPrgCNV4zo8eQ36AAreFMKPOtl+F/uUvI/GSa48Tpjn9LuMq6ODz?=
	=?us-ascii?q?gnAkh1ASYLCl0ocQaHCiAPtrOEGZYXv3gtcdCmcGpA0+TPT0h12ETzFTYm29UL?=
	=?us-ascii?q?wh6T4mFo2pEJ3PRoe3gLyOj2+HGcgCYXhLDF2JG3rke4iIHvwLci+6Js56jidC?=
	=?us-ascii?q?UqCsTYIk3xyiuAL2jb19IbyH1DcfsMe30tl24KvWnAw08hRqBsWG2mWECWpzmz?=
	=?us-ascii?q?VbFHcNwKljrBklmR+42q9ijqkAGA=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GEAQBxVgxZ/1YBGKxcHAEBBAEBCgEBF?=
	=?us-ascii?q?wEBBAEBCgEBhAyBDAeNeadHgUxDLoV2AoUFGAEBAQEBAQEBAQEBAoEQgjMgCwR?=
	=?us-ascii?q?GKS8BAQEBAQEBAQEBAQEBAQEaAg1eBnkQAgFOMiUCBA4Fii6zPIplAQEBAQEBB?=
	=?us-ascii?q?AEBAQEBAQEBARoFiD2HWg5ihRkFkFyNE4cbi36RZpQ3H4FDb4dNdoY4gTCBDQE?=
	=?us-ascii?q?BAQ?=
X-IPAS-Result: =?us-ascii?q?A2GEAQBxVgxZ/1YBGKxcHAEBBAEBCgEBFwEBBAEBCgEBhAy?=
	=?us-ascii?q?BDAeNeadHgUxDLoV2AoUFGAEBAQEBAQEBAQEBAoEQgjMgCwRGKS8BAQEBAQEBA?=
	=?us-ascii?q?QEBAQEBAQEaAg1eBnkQAgFOMiUCBA4Fii6zPIplAQEBAQEBBAEBAQEBAQEBARo?=
	=?us-ascii?q?FiD2HWg5ihRkFkFyNE4cbi36RZpQ3H4FDb4dNdoY4gTCBDQEBAQ?=
X-IronPort-AV: E=Sophos;i="5.38,292,1491253200"; d="scan'208";a="40630658"
Received: from hel-exch-03.corp.vaisala.com ([172.24.1.86])
	by hel-mailgw-01.vaisala.com with ESMTP/TLS/AES256-SHA;
	05 May 2017 13:42:47 +0300
Received: from HEL-EXCH-02.corp.vaisala.com (172.24.1.85) by
	HEL-EXCH-03.corp.vaisala.com (172.24.1.86) with Microsoft SMTP Server
	(TLS) id 15.0.1210.3; Fri, 5 May 2017 13:42:47 +0300
Received: from HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17]) by
	HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17%14]) with mapi
	id 15.00.1210.000; Fri, 5 May 2017 13:42:47 +0300
From: <niko.mauno@vaisala.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v4 2/2] licenses.conf: Allow overriding env-specific SPDX
	vars
Thread-Index: AQHSxYxVHDvZQsAVzU2mCzgHnz92bg==
Date: Fri, 5 May 2017 10:42:46 +0000
Message-ID: <1493980959-9571-3-git-send-email-niko.mauno@vaisala.com>
References: <1493980959-9571-1-git-send-email-niko.mauno@vaisala.com>
In-Reply-To: <1493980959-9571-1-git-send-email-niko.mauno@vaisala.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.24.64.128]
MIME-Version: 1.0
Cc: niko.mauno@vaisala.com
Subject: [PATCH v4 2/2] licenses.conf: Allow overriding env-specific SPDX vars
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
X-List-Received-Date: Fri, 05 May 2017 10:42:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Change certain variable assignments from 'hard' (=3D) to 'soft' (?=3D) so t=
hat
suitable permutations of values for these variables can be assigned eg. in
custom meta layers. Otherwise eg. fossology server is limited to run on sam=
e
machine as bitbake.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/conf/licenses.conf | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 2e3dce3..c96b7de 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -125,7 +125,7 @@ SPDXLICENSEMAP[SGIv1] =3D "SGI-1"
 SPDX_TEMP_DIR =3D "${WORKDIR}/spdx_temp"
=20
 ## Output directory for generated SPDX files
-SPDX_MANIFEST_DIR =3D "${SPDX_TEMP_DIR}/fossology_scans"
+SPDX_MANIFEST_DIR ?=3D "${SPDX_TEMP_DIR}/fossology_scans"
=20
 ## SPDX Format info
 SPDX_VERSION =3D "SPDX-1.1"
@@ -144,7 +144,7 @@ DATA_LICENSE =3D "CC0-1.0"
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
@@ -158,7 +158,7 @@ FOSS_NO_COPYRIGHT =3D "true"
 #    FOSSology server recursively unpack components.
 #
=20
-FOSS_RECURSIVE_UNPACK =3D "false"
+FOSS_RECURSIVE_UNPACK ?=3D "false"
=20
 # An option defined as [FOSS_FULL_SPDX] in ./meta/conf/licenses.conf is us=
ed to
 # control what kind of SPDX output to get from the FOSSology server.
@@ -173,7 +173,7 @@ FOSS_RECURSIVE_UNPACK =3D "false"
 #   license tags in the report will be "NOASSERTION"
 #
=20
-FOSS_FULL_SPDX =3D "true"
+FOSS_FULL_SPDX ?=3D "true"
=20
 # FOSSologySPDX instance server. http://localhost/repo is the default
 # installation location for FOSSology.
@@ -182,7 +182,7 @@ FOSS_FULL_SPDX =3D "true"
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

