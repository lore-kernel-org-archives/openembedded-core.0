Return-Path: <Jagadeesh.Krishnanjanappa@caviumnetworks.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0088.outbound.protection.outlook.com [157.56.111.88])
	by mail.openembedded.org (Postfix) with ESMTP id 486FA7391D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 10:47:41 +0000 (UTC)
Received: from CY1PR0701MB1145.namprd07.prod.outlook.com (25.160.145.28) by
	CY1PR0701MB1146.namprd07.prod.outlook.com (25.160.146.11) with
	Microsoft SMTP
	Server (TLS) id 15.1.118.21; Tue, 31 Mar 2015 10:47:40 +0000
Received: from CY1PR0701MB1145.namprd07.prod.outlook.com ([25.160.145.28]) by
	CY1PR0701MB1145.namprd07.prod.outlook.com ([25.160.145.28]) with
	mapi id 15.01.0125.002; Tue, 31 Mar 2015 10:47:41 +0000
From: "Krishnanjanappa, Jagadeesh"
	<Jagadeesh.Krishnanjanappa@caviumnetworks.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH v2] libart-lgpl: add art_config.h for
	armeb/aarch64be/aarch64be_32
Thread-Index: AQHQZ9saAFKC9zDiAUCHZsmuWkvRJZ02b33D
Date: Tue, 31 Mar 2015 10:47:40 +0000
Message-ID: <1427798860065.8452@caviumnetworks.com>
References: <1427384351-17870-1-git-send-email-jagadeesh.krishnanjanappa@caviumnetworks.com>
In-Reply-To: <1427384351-17870-1-git-send-email-jagadeesh.krishnanjanappa@caviumnetworks.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [111.93.218.67]
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0701MB1146;
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10009020)(6009001)(377454003)(50986999)(87936001)(54356999)(2656002)(107886001)(450100001)(102836002)(36756003)(106116001)(117636001)(2501003)(2351001)(66066001)(92566002)(110136001)(76176999)(77156002)(2950100001)(2900100001)(86362001)(19580395003)(99286002)(122556002)(575784001)(19580405001)(46102003)(40100003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0701MB1146;
	H:CY1PR0701MB1145.namprd07.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-microsoft-antispam-prvs: <CY1PR0701MB1146246C870FD91E75ED00868EF40@CY1PR0701MB1146.namprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:CY1PR0701MB1146; BCL:0;
	PCL:0; RULEID:; SRVR:CY1PR0701MB1146; 
x-forefront-prvs: 0532BF6DC2
MIME-Version: 1.0
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2015 10:47:40.8202 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 711e4ccf-2e9b-4bcf-a551-4094005b6194
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0701MB1146
Subject: Re: [PATCH v2] libart-lgpl: add art_config.h for armeb/aarch64be/aarch64be_32
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
X-List-Received-Date: Tue, 31 Mar 2015 10:47:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

ping

Regards,
Jagadeesh
________________________________________
From: Krishnanjanappa, Jagadeesh
Sent: Thursday, March 26, 2015 9:09 PM
To: openembedded-core@lists.openembedded.org
Cc: Krishnanjanappa, Jagadeesh
Subject: [OE-core][PATCH v2] libart-lgpl: add art_config.h for armeb/aarch6=
4be/aarch64be_32

From: "Krishnanjanappa, Jagadeesh" <jagadeesh.krishnanjanappa@caviumnetwork=
s.com>

The preprocessor macro values present in art_config.h
differ for individual architectures, basically libart-lgpl recipe will
pick up correct art_config.h file based on

ART_CONFIG =3D "${HOST_ARCH}/art_config.h"

and thereby having correct preprocessor macros definition
of each architectures.

Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@cavium=
networks.com>
---
 meta/recipes-gnome/gnome/libart-lgpl/aarch64be/art_config.h    | 10 ++++++=
++++
 meta/recipes-gnome/gnome/libart-lgpl/aarch64be_32/art_config.h | 10 ++++++=
++++
 meta/recipes-gnome/gnome/libart-lgpl/armeb/art_config.h        | 10 ++++++=
++++
 3 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-gnome/gnome/libart-lgpl/aarch64be/art_conf=
ig.h
 create mode 100644 meta/recipes-gnome/gnome/libart-lgpl/aarch64be_32/art_c=
onfig.h
 create mode 100644 meta/recipes-gnome/gnome/libart-lgpl/armeb/art_config.h

diff --git a/meta/recipes-gnome/gnome/libart-lgpl/aarch64be/art_config.h b/=
meta/recipes-gnome/gnome/libart-lgpl/aarch64be/art_config.h
new file mode 100644
index 0000000..500ffc3
--- /dev/null
+++ b/meta/recipes-gnome/gnome/libart-lgpl/aarch64be/art_config.h
@@ -0,0 +1,10 @@
+/* Automatically generated by gen_art_config.c */
+
+#define ART_SIZEOF_CHAR 1
+#define ART_SIZEOF_SHORT 2
+#define ART_SIZEOF_INT 4
+#define ART_SIZEOF_LONG 8
+
+typedef unsigned char art_u8;
+typedef unsigned short art_u16;
+typedef unsigned int art_u32;
diff --git a/meta/recipes-gnome/gnome/libart-lgpl/aarch64be_32/art_config.h=
 b/meta/recipes-gnome/gnome/libart-lgpl/aarch64be_32/art_config.h
new file mode 100644
index 0000000..b0e74ad
--- /dev/null
+++ b/meta/recipes-gnome/gnome/libart-lgpl/aarch64be_32/art_config.h
@@ -0,0 +1,10 @@
+/* Automatically generated by gen_art_config.c */
+
+#define ART_SIZEOF_CHAR 1
+#define ART_SIZEOF_SHORT 2
+#define ART_SIZEOF_INT 4
+#define ART_SIZEOF_LONG 4
+
+typedef unsigned char art_u8;
+typedef unsigned short art_u16;
+typedef unsigned int art_u32;
diff --git a/meta/recipes-gnome/gnome/libart-lgpl/armeb/art_config.h b/meta=
/recipes-gnome/gnome/libart-lgpl/armeb/art_config.h
new file mode 100644
index 0000000..b0e74ad
--- /dev/null
+++ b/meta/recipes-gnome/gnome/libart-lgpl/armeb/art_config.h
@@ -0,0 +1,10 @@
+/* Automatically generated by gen_art_config.c */
+
+#define ART_SIZEOF_CHAR 1
+#define ART_SIZEOF_SHORT 2
+#define ART_SIZEOF_INT 4
+#define ART_SIZEOF_LONG 4
+
+typedef unsigned char art_u8;
+typedef unsigned short art_u16;
+typedef unsigned int art_u32;
--
1.8.2.3


