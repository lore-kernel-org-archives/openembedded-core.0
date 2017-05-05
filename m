Return-Path: <niko.mauno@vaisala.com>
Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com
	[193.143.230.17])
	by mail.openembedded.org (Postfix) with ESMTP id 2E60E77D88
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 10:37:54 +0000 (UTC)
IronPort-PHdr: =?us-ascii?q?9a23=3AJLWxsxarU3dU1P81LEOdYhH/LSx+4OfEezUN459i?=
	=?us-ascii?q?sYplN5qZr8i+bnLW6fgltlLVR4KTs6sC0LuI9f68EjZRqb+681k6OKRWUBEEjc?=
	=?us-ascii?q?hE1ycBO+WiTXPBEfjxciYhF95DXlI2t1uyMExSBdqsLwaK+i764jEdAAjwOhRo?=
	=?us-ascii?q?LerpBIHSk9631+ev8JHPfglEnjSwbLdzIRmsrAjcucYajZVmJ60s1hbHv3xEdv?=
	=?us-ascii?q?hMy2h1P1yThRH85smx/J5n7Stdvu8q+tBDX6vnYak2VKRUAzs6PW874s3rrgTD?=
	=?us-ascii?q?QhCU5nQASGUWkwFHDBbD4RrnQ5r+qCr6tu562CmHIc37SK0/VDq+46t3ThLjlS?=
	=?us-ascii?q?EKPCM7/m7KkMx9lKJVrgy8qRxjzYDaY4+VO/h/fqzBct0VSnFMXtpIVyFbHo+w?=
	=?us-ascii?q?c5cDA/cHMO1Fr4f9vVwOrR6mCASrAuPvyzxIhnjs0a0/yeshDAfG3As7EtIQqn?=
	=?us-ascii?q?vUrc71O70WUe+v1qXH0TLDb/ZP1Dr79YPGcQghrOmRUb9yb8bd01cjGgzfglmN?=
	=?us-ascii?q?s4DoOy6Z2vwQv2WZ8eZsT/yjhmE9pwxwrTWj3NoghpfKi44NxFDL6yZ0zJowKN?=
	=?us-ascii?q?C9SEN2ZcOrHIZVui2HLYR7QMYvTH91tys4xL0LvIC3czUXxJklwRPUduaJfJKS?=
	=?us-ascii?q?4h35UeacOTJ4hHV4d72hnxuy6k2gyvHkVsmzzVZKsjJJktnSuXAJ0Bze8sqJRP?=
	=?us-ascii?q?R78Eu41jiA1h7e5ONdLUwoiKbXMYIuwrkqlpoLq0jDADX5mETtjKCMckUr4PKk?=
	=?us-ascii?q?5PjgYrXjvpOcNol0hR/iMqk2h8CyA/o0PhIQU2WU4+iwyafv8EnkTLlSi/05iK?=
	=?us-ascii?q?jZsJTUJcQBoa65BhdY0oAi6xa8CDeqytEYkmMaLFJDfxKKlJbpNEvPIPDjF/i/?=
	=?us-ascii?q?h06jnC13yPDBO73tGo/NIWTbkLf9YbZ97FZRyA0rzd9B4ZJbFLQBL+ntVUDsqd?=
	=?us-ascii?q?PXEAI2PxWozObgEtVyyJgTWWaOAq+CLKPSqkWE5uU3I+aSYo8apjP9JOM76PHz?=
	=?us-ascii?q?kHA2h0IScbOu3ZsNZ3DrVshhdhGeeXfqj9ILHGsGswZ7R+vwhXWGUCVPfDC1R6?=
	=?us-ascii?q?866zQxBY6qAIuFQZqi1u+vxiC+S8lQZ2NBTFWFDHHvX5uNWuwFbCvUKchkxG9X?=
	=?us-ascii?q?HYO9QpMsgEn9/DTxzKBqe7LZ?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GBAQBFVQxZ/1sBGKxcHAEBBAEBCgEBF?=
	=?us-ascii?q?wEBBAEBCgEBhRgHjXmnR4IPhiQChQUYAQEBAQEBAQEBAQECgRCCMyCCQwZ5EAI?=
	=?us-ascii?q?BTjIlAgQOBb1wimUBAQEBBgEBAQEBASKIPYdNfYUZBZBcjROTGZFmlDcfgUNvh?=
	=?us-ascii?q?012hjgqgQaBDQEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2GBAQBFVQxZ/1sBGKxcHAEBBAEBCgEBFwEBBAEBCgEBhRg?=
	=?us-ascii?q?HjXmnR4IPhiQChQUYAQEBAQEBAQEBAQECgRCCMyCCQwZ5EAIBTjIlAgQOBb1wi?=
	=?us-ascii?q?mUBAQEBBgEBAQEBASKIPYdNfYUZBZBcjROTGZFmlDcfgUNvh012hjgqgQaBDQE?=
	=?us-ascii?q?BAQ?=
X-IronPort-AV: E=Sophos;i="5.38,292,1491253200"; d="scan'208";a="40630367"
Received: from hel-exch-01.corp.vaisala.com ([172.24.1.91])
	by hel-mailgw-01.vaisala.com with ESMTP/TLS/AES256-SHA;
	05 May 2017 13:37:53 +0300
Received: from HEL-EXCH-02.corp.vaisala.com (172.24.1.85) by
	HEL-EXCH-01.corp.vaisala.com (172.24.1.91) with Microsoft SMTP Server
	(TLS) id 15.0.1210.3; Fri, 5 May 2017 13:37:53 +0300
Received: from HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17]) by
	HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17%14]) with mapi
	id 15.00.1210.000; Fri, 5 May 2017 13:37:53 +0300
From: <niko.mauno@vaisala.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v3 1/2] licenses.conf: stop relying on specific user's
	home dir
Thread-Index: AQHSxYumaoYZXnxfHUia7HyYR0Ih+A==
Date: Fri, 5 May 2017 10:37:53 +0000
Message-ID: <1493980660-9291-2-git-send-email-niko.mauno@vaisala.com>
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
Subject: [PATCH v3 1/2] licenses.conf: stop relying on specific user's home dir
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
X-List-Received-Date: Fri, 05 May 2017 10:37:55 -0000
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

