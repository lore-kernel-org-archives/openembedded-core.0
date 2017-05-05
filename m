Return-Path: <niko.mauno@vaisala.com>
Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com
	[193.143.230.17])
	by mail.openembedded.org (Postfix) with ESMTP id D539077DA1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 10:37:55 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3A/slLgBR21PLV5qMVnyh6Xu7xb9psv+yvbD5Q0YIu?=
	=?us-ascii?q?jvd0So/mwa6ybRyN2/xhgRfzUJnB7Loc0qyN4v6mBzBLu8fJmUtBWaQEbwUCh8?=
	=?us-ascii?q?QSkl5oK+++Imq/EsTXaTcnFt9JTl5v8iLzG0FUHMHjew+a+SXqvnYdFRrlKAV6?=
	=?us-ascii?q?OPn+FJLMgMSrzeCy/IDYbxlViDanb75/KBS7oR/Qu8QZjoduNKI8wQbVr3VVfO?=
	=?us-ascii?q?hb2XlmLk+JkRbm4cew8p9j8yBOtP8k6sVNT6b0cbkmQLJBFDgpPHw768PttRnY?=
	=?us-ascii?q?UAuA/WAcXXkMkhpJGAfK8hf3VYrsvyTgt+p93C6aPdDqTb0xRD+v4btnRAPuhS?=
	=?us-ascii?q?waMTMy7WPZhdFqjK9DoByvuQFxw5Labo+WOvpxfKLdcs8VS2VORctRSzVBD5mg?=
	=?us-ascii?q?Y4cTE+YNIOBVpJT9qVsUqhu+ABGhCeTpyj9JhX/22rc20+E7HgHb2gwgGMkDsG?=
	=?us-ascii?q?rOo9X0L6cdS+S1w7PSwTrfaPNW3C7w5Y7VeR4vpvGMWKh/ccvXyUQ3CwzFiVOQ?=
	=?us-ascii?q?qYL/MzOUzeQBq2eb7+t8VeKvlm4osBt9rSSoxscpjITCm4Ebykjc+Clkwos5O8?=
	=?us-ascii?q?e0RFB0bNK+DZdcrSKXOotuTs8/QWxkpjw2xqMJtJKhfSUHx44rywPBZ/GEa4SI?=
	=?us-ascii?q?7AzsWeWNLTp9gX9oeLayiAuv/UWl1+HzTMu53VNUoSVYkNTMuHUA2wLO5cSaSP?=
	=?us-ascii?q?Zw+Fqq1yyV2ADJ8O5EJFg5la/cK5E83LE9joETsUHfHi/un0X2kbOWel0k+ue2?=
	=?us-ascii?q?7+TnZa3rqJ2TOYFykw3wPaUhl9K9D+ghLgQCQXKX9vi71L355U31WqtKgec3kq?=
	=?us-ascii?q?nCqp/aId4UqrSlDA9S14Yv8xe/DzG439QEhXQLMVBIdAydg4T3NFzCOu30Ae28?=
	=?us-ascii?q?jlmsiDtrwurJPrzlApXDNHjDl7LhcK57605dywozyspT55dOBbEcJvLzXVT8tM?=
	=?us-ascii?q?LCAR84KAy72eLnB89n2owCXmKPB7eVMLnOvl+Q+uIvP+6MaZcSuDblNfcl4eDh?=
	=?us-ascii?q?jXoillADYKamwIUYZ22hEvt6JEWZe2Tjj8wFEWcLpQo+UPfqhEeFUT5LeXmyWb?=
	=?us-ascii?q?wz5jQgB424EIjMW56ij6Gb0Ce8BJ1WaTMONlfZRXDweoOJXv0BZC6fLopqlSYJ?=
	=?us-ascii?q?fbygUJM6kxa2uQn3zrBqIubZ9msfr521h/Zv4OiGwRcz9jsyCs2A1WalUWh1hW?=
	=?us-ascii?q?oMTnk926Up8h818UuKzaUt268QLtdU/f4cCgo=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GEAQBFVQxZ/1UBGKxcHAEBBAEBCgEBF?=
	=?us-ascii?q?wEBBAEBCgEBhAyBDAeNeadHgUxDLoV2AoUFGAEBAQEBAQEBAQEBAoEQgjMgCwR?=
	=?us-ascii?q?GKS8BAQEBAQEBAQEBAQEBAQEaAg1eBnkQAgE1GTIlAgQOBYous0KKZQEBAQEBA?=
	=?us-ascii?q?QEDAQEBAQEBAQEBGgWIPYdaDlUNhRkFkFyNE4cbi36RZpQ3H4FDb4dNdoY4gTC?=
	=?us-ascii?q?BDQEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2GEAQBFVQxZ/1UBGKxcHAEBBAEBCgEBFwEBBAEBCgEBhAy?=
	=?us-ascii?q?BDAeNeadHgUxDLoV2AoUFGAEBAQEBAQEBAQEBAoEQgjMgCwRGKS8BAQEBAQEBA?=
	=?us-ascii?q?QEBAQEBAQEaAg1eBnkQAgE1GTIlAgQOBYous0KKZQEBAQEBAQEDAQEBAQEBAQE?=
	=?us-ascii?q?BGgWIPYdaDlUNhRkFkFyNE4cbi36RZpQ3H4FDb4dNdoY4gTCBDQEBAQ?=
X-IronPort-AV: E=Sophos;i="5.38,292,1491253200"; d="scan'208";a="40630368"
Received: from hel-exch-02.corp.vaisala.com ([172.24.1.85])
	by hel-mailgw-01.vaisala.com with ESMTP/TLS/AES256-SHA;
	05 May 2017 13:37:53 +0300
Received: from HEL-EXCH-02.corp.vaisala.com (172.24.1.85) by
	HEL-EXCH-02.corp.vaisala.com (172.24.1.85) with Microsoft SMTP Server
	(TLS) id 15.0.1210.3; Fri, 5 May 2017 13:37:53 +0300
Received: from HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17]) by
	HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17%14]) with mapi
	id 15.00.1210.000; Fri, 5 May 2017 13:37:53 +0300
From: <niko.mauno@vaisala.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v3 2/2] licenses.conf: Allow overriding env-specific SPDX
	vars
Thread-Index: AQHSxYum+Y6ld3fI0UC3/Ry87OPzqQ==
Date: Fri, 5 May 2017 10:37:53 +0000
Message-ID: <1493980660-9291-3-git-send-email-niko.mauno@vaisala.com>
References: <1493980660-9291-1-git-send-email-niko.mauno@vaisala.com>
In-Reply-To: <1493980660-9291-1-git-send-email-niko.mauno@vaisala.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.24.64.128]
MIME-Version: 1.0
Cc: niko.mauno@vaisala.com
Subject: [PATCH v3 2/2] licenses.conf: Allow overriding env-specific SPDX vars
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
X-List-Received-Date: Fri, 05 May 2017 10:37:56 -0000
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

