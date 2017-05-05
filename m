Return-Path: <niko.mauno@vaisala.com>
Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com
	[193.143.230.17])
	by mail.openembedded.org (Postfix) with ESMTP id E0A3577D88
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 10:42:47 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3AmOFLZx/TsKPeqP9uRHKM819IXTAuvvDOBiVQ1KB3?=
	=?us-ascii?q?1+4cTK2v8tzYMVDF4r011RmSDNudta4P0buempujcFRI2YyGvnEGfc4EfD4+ou?=
	=?us-ascii?q?JSoTYdBtWYA1bwNv/gYn9yNs1DUFh44yPzahANS47xaFLIv3K98yMZFAnhOgpp?=
	=?us-ascii?q?POT1HZPZg9iq2+yo9ZDeZwRFiCC8bL59Ixm6swHcvdQKjIV/Lao81gHHqWZSde?=
	=?us-ascii?q?RMwmNoK1OTnxLi6cq14ZVu7Sdete8/+sBZSan1cLg2QrJeDDQ9LmA6/9brugXZ?=
	=?us-ascii?q?TQuO/XQTTGMbmQdVDgff7RH6WpDxsjbmtud4xSKXM9H6QawyVD+/6apgVR3mhz?=
	=?us-ascii?q?odNzMh8G/ZlNF+jL5VrhyiqRxwwY/Ub52aOvVxZa7dYcoaSHBdUspNSyBNH4Wx?=
	=?us-ascii?q?ZJYPAeobOuZYqpHwqlwIrRu/BgmsA/njyjpSiX/r26061P8sER/c0wwhBNIBqn?=
	=?us-ascii?q?DUo8/vOKgOVuC1ybDFwDPeZP1VwTfw8JXEfxI/rf2WQ759ftDdxVQ1Gw7Bk1mc?=
	=?us-ascii?q?sZHpMjGL2ugXrWSW4PBsWOOghmI9tg19vDuiyt8iiobXhY8Z1lXJ+CB5zYsxON?=
	=?us-ascii?q?K0VUt2bcO+H5ZSsiyVKZZ5T8EsQ2xtpio116AKtJy9cSMX0poo3QTfZOaCc4WQ?=
	=?us-ascii?q?5xLjU/ueLilgiXJ+fbK/mw6y8U+9yu3gTsW00EhFri5CktTUtH4D2Brd5tGIRP?=
	=?us-ascii?q?R84Eqv2y+D2xzO5u1ePU80krDbK4Y7zr4ujJUTsF/DETXymErslqOZakIk+u2w?=
	=?us-ascii?q?5+TmZLXpuIOcOpdphgz8LKgigNKzDOsiPgQTRWSW/fmw2KXm/ULjQbVKivM2kr?=
	=?us-ascii?q?PesJDfPckboK+5AwxS0oo57hawFSqm0NIfnXQcMlJKYhOHj5PzNFHKOv/0F+uw?=
	=?us-ascii?q?g1OpkDtz3fDJIqXhAonRLnjEiLrheq595FBayAUtyNBQ/IxbBawcL/3tR0D9rc?=
	=?us-ascii?q?DXDhgjMwOq2OvnDNR91pgCWWKUGKOZN7vSvkGO5u0xJumDf5EatyvgJPc7+vHi?=
	=?us-ascii?q?l3g5mUUSffrh4ZxCPHegE/JrJk+UbXbhjpIKFn0Hlg4/V/DxzlqaXDheYny/U6?=
	=?us-ascii?q?4x6nc8Eo3wXqnZQYX41LqA3yD9G5RLYGduFFmNCn7sfsOPXPJaO3HaGdNojjFR?=
	=?us-ascii?q?DevpcIQmzxz77AI=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GBAQBxVgxZ/1sBGKxcHAEBBAEBCgEBF?=
	=?us-ascii?q?wEBBAEBCgEBhRgHjXmnR4IPhiQChQUYAQEBAQEBAQEBAQECgRCCMyCCQwZ5EAI?=
	=?us-ascii?q?BTjIlAgQOBb1qimUBAQEBBgEBAQEBASKIPYdNfYUZBZBcjROTGZFmlDcfgUNvh?=
	=?us-ascii?q?012hjgqgQaBDQEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2GBAQBxVgxZ/1sBGKxcHAEBBAEBCgEBFwEBBAEBCgEBhRg?=
	=?us-ascii?q?HjXmnR4IPhiQChQUYAQEBAQEBAQEBAQECgRCCMyCCQwZ5EAIBTjIlAgQOBb1qi?=
	=?us-ascii?q?mUBAQEBBgEBAQEBASKIPYdNfYUZBZBcjROTGZFmlDcfgUNvh012hjgqgQaBDQE?=
	=?us-ascii?q?BAQ?=
X-IronPort-AV: E=Sophos;i="5.38,292,1491253200"; d="scan'208";a="40630657"
Received: from hel-exch-01.corp.vaisala.com ([172.24.1.91])
	by hel-mailgw-01.vaisala.com with ESMTP/TLS/AES256-SHA;
	05 May 2017 13:42:47 +0300
Received: from HEL-EXCH-02.corp.vaisala.com (172.24.1.85) by
	HEL-EXCH-01.corp.vaisala.com (172.24.1.91) with Microsoft SMTP Server
	(TLS) id 15.0.1210.3; Fri, 5 May 2017 13:42:47 +0300
Received: from HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17]) by
	HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17%14]) with mapi
	id 15.00.1210.000; Fri, 5 May 2017 13:42:47 +0300
From: <niko.mauno@vaisala.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v4 1/2] licenses.conf: stop relying on specific user's
	home dir
Thread-Index: AQHSxYxVX220O5kYskmW+3VSfVvs9A==
Date: Fri, 5 May 2017 10:42:46 +0000
Message-ID: <1493980959-9571-2-git-send-email-niko.mauno@vaisala.com>
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
Subject: [PATCH v4 1/2] licenses.conf: stop relying on specific user's home dir
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
X-List-Received-Date: Fri, 05 May 2017 10:42:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Relocate SPDX_MANIFEST_DIR to a location which doesn't rely on specific use=
r's
home directory, which may not exist on may systems.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/conf/licenses.conf | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 2d6a707..2e3dce3 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -123,7 +123,9 @@ SPDXLICENSEMAP[SGIv1] =3D "SGI-1"
=20
 ## SPDX temporary directory
 SPDX_TEMP_DIR =3D "${WORKDIR}/spdx_temp"
-SPDX_MANIFEST_DIR =3D "/home/yocto/fossology_scans"
+
+## Output directory for generated SPDX files
+SPDX_MANIFEST_DIR =3D "${SPDX_TEMP_DIR}/fossology_scans"
=20
 ## SPDX Format info
 SPDX_VERSION =3D "SPDX-1.1"
--=20
2.1.4

