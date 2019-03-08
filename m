Return-Path: <bassem.boubaker@actia.fr>
X-Greylist: delayed 22055 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 08 Mar 2019 23:23:57 UTC
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
	(mail-eopbgr90083.outbound.protection.outlook.com [40.107.9.83])
	by mail.openembedded.org (Postfix) with ESMTP id A99797CE60
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 23:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=actia.fr; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gM02DPdkXFzlx+uHQqSQqqsJSYuQABTQPNtTY9nrpfg=;
	b=ApBqz/Utw2S12ej5hP3bYq69d+3EQJ9o9FsdPwPNcDJl99AZIiaU3LDt1O68fDMncxQTuYF/xabxQcqzlRpTRXJe/R+jgC57CaZ4v3GpkPu72l4Zv/rIF7S/3NRMPVR6HKPEHOu8f5v6QKkDMjwvGI3GawLCZcFdQ7PfsEUyoTI=
Received: from MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM (52.134.38.15) by
	MR2P264MB0737.FRAP264.PROD.OUTLOOK.COM (52.134.33.13) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1686.18; Fri, 8 Mar 2019 16:43:54 +0000
Received: from MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM
	([fe80::4124:2bff:600f:6fe2]) by MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM
	([fe80::4124:2bff:600f:6fe2%5]) with mapi id 15.20.1686.018;
	Fri, 8 Mar 2019 16:43:53 +0000
From: BOUBAKER Bassem <bassem.boubaker@actia.fr>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH]     cpulimit: introduce support for this package
Thread-Index: AQHU1c4dw726YN3wr025HVSl5KARTA==
Date: Fri, 8 Mar 2019 16:43:53 +0000
Message-ID: <1552063426-25272-1-git-send-email-bassem.boubaker@actia.fr>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MRXP264CA0046.FRAP264.PROD.OUTLOOK.COM
	(2603:10a6:500:14::34) To MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM
	(2603:10a6:500:c::15)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bassem.boubaker@actia.fr; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [89.118.102.227]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6279e7f-4e9f-4e8d-6fa5-08d6a3e54003
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
	SRVR:MR2P264MB0737; 
X-MS-TrafficTypeDiagnostic: MR2P264MB0737:|MR2P264MB0737:|MR2P264MB0737:|MR2P264MB0737:|MR2P264MB0737:
x-ms-exchange-purlcount: 1
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; MR2P264MB0737;
	23:/JtytA1IVDnNk57LptNpLU+L0wCGMg1s/oaMj0A?=
	=?iso-8859-1?Q?XQ+ilmFnaBP6z+jJpHLLl9fzrm42pHR3Ssv9qJu+VzSTPx1vhn9vvLq/Fa?=
	=?iso-8859-1?Q?zvTy9Zu4Ll/skpu2xe2gejxfHiZOrv8vsAz+i3SIzRpte+BE8I4XF6RyGw?=
	=?iso-8859-1?Q?bX8yWflIKYpuQ0uAixCocEnn4C/y2QRqinZQGH3OJ34/vO0gXBfWl0MAUz?=
	=?iso-8859-1?Q?5HevKk7dP/gBR/PAzcLG5L5QODtn8RwJWTycLz2r2r1qnFKbedmEkI3LuR?=
	=?iso-8859-1?Q?wwL+Kyfx7gPQb+/83+0uc3YF4fHZa0H5ykHu0XPpf8TSXt1IFoAca/Tkxu?=
	=?iso-8859-1?Q?AFfh16RQXvnjpNBvqEYNThzi6iNogInY71GOecaBc7M6Iezrk4lsidzUDS?=
	=?iso-8859-1?Q?MCgnowY+ya9n3U7CVqAcdfKbE51HtBiZFNWbBS5vvsT2GRQwCa/nPCkPOC?=
	=?iso-8859-1?Q?INq6SbJZ1WJxtCkz+nfFyuzjV3Buvgn0N5sGvLGCevO4vL78tT+LKbArs4?=
	=?iso-8859-1?Q?CkRgOki8gHL2w1zeC76SsCnKiSKtdtiEBh3zforEz0mFXwsurO6E5muCN4?=
	=?iso-8859-1?Q?B6SsQEhZUWcYLm+D94y7C2ocu3BUYSQT0ImtwXEPKHBq2RklKTEZwIlfVI?=
	=?iso-8859-1?Q?kdN8KPZA4t5AiXt7LaueNo3425EN8VIFW79bgQZ6KZRkQ6ka1xNuBDCMrO?=
	=?iso-8859-1?Q?Nbg9b3o3hm6dFlCXPiS3obJ8fr3LDxUGO8bVhjnkP3fbOKFMxINRljiPGE?=
	=?iso-8859-1?Q?zthQf55EAFNCge4IK0e16BqwROQLLl42HhlWqjZox/S6Yg3L0oxB2nRciw?=
	=?iso-8859-1?Q?Qi3RW4iE345DFoE9sHJMgB0ukZ7jRge5C8yM7Xec1LmaNUUpeP9axk7Lw5?=
	=?iso-8859-1?Q?WHKczR/NbtEt+Z1hPY34Mbf5QUZ1C/ofSFf5s9s06BvMaFDkFlRcTpaTfA?=
	=?iso-8859-1?Q?uGI8A6ddsmadUDMVnq1INzAENIfSYyf7gogQEzPDXxzWkb39UQB+bl+mS9?=
	=?iso-8859-1?Q?6w2bpGXeyVzBSYJQuvvV17Mr5Gv/ivtiSuxCj6DOD9M3ZN4a81c6XlcySB?=
	=?iso-8859-1?Q?GxscwIryZNpouMMSBqEhWf5kpqixV33zYimDZyErdmqerC08bBNqeCXJPU?=
	=?iso-8859-1?Q?ao1YTinZbLZvXXI9D086RxXb2wL3YB1Tvdwzh5XALPHI2uiYNIyydujNBN?=
	=?iso-8859-1?Q?nOgA/g4mobWmao5rZkOD9+oARLK5WO+2jZfgKrTy9S469AzDqdD9dELioE?=
	=?iso-8859-1?Q?/z+ECbrk2PaJWZMb+hDEmXqkoVCTRtSfcaw7jfd9wPqN69CdpIzFiOdLzS?=
	=?iso-8859-1?Q?Ri6O4MNX/85axmWBE7abCXm?=
x-microsoft-antispam-prvs: <MR2P264MB0737580398193429E5C687629C4D0@MR2P264MB0737.FRAP264.PROD.OUTLOOK.COM>
x-forefront-prvs: 0970508454
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(39850400004)(396003)(136003)(376002)(366004)(199004)(189003)(107886003)(102836004)(81156014)(71200400001)(71190400001)(478600001)(14454004)(305945005)(105586002)(2351001)(316002)(68736007)(106356001)(74482002)(7736002)(3846002)(8676002)(86362001)(2501003)(50226002)(66066001)(54906003)(8936002)(81166006)(186003)(52116002)(386003)(99286004)(6506007)(97736004)(6116002)(256004)(476003)(2616005)(26005)(6436002)(486006)(14444005)(25786009)(6486002)(6916009)(6512007)(5640700003)(36756003)(5660300002)(4326008)(2906002)(53936002)(6306002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MR2P264MB0737;
	H:MR2P264MB0196.FRAP264.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: actia.fr does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pZlDIQeJJyWLUQ4je2qVn67tA2SS1Ul48D5M8cN5xZb1VmHGJvfChtP2E7M/Au2HDYFNDN3J7jQe6ndtTDx6E/Su5ckgufvSTi7kpvLdRR5+YHnjQ43f9b7aJsIOqNAWgsiwRS0G88FV99RqeU62tS0vyPtEfjRnBuOIPqOWm6C46WBtEwN8x02ZV5jW1vl5JGfJNnqeOHvC2+4cQzBGw8yAP+ivMPUp7Ku+h/OBQCcGlrzs3VCXH6SggwcQVjcNOoRvuiP/znPKUNwzUO3vdDWdkOMQuI0FoUmIia6/aWScZ+4K7fONjNCfu+uHXYVBovTlLp24C0UXVgabcB9JGAe7Kb7X6UoOetRCigWfxhpqoHQqvdXCzu0jOZUB6GRU3Fl8afHdcCCU0Dkol0ih2Os4oQFeVVGYUQM0ewEuUjc=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a6279e7f-4e9f-4e8d-6fa5-08d6a3e54003
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2019 16:43:53.8490 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 86314f06-03e8-4460-82f3-a44f992a19c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR2P264MB0737
X-Microsoft-Exchange-Diagnostics: 1; MR2P264MB0737;
	23:ZK89DiAmcrPEnQhEQMCkX3f9yArA7eKY0yJU4SBgSXOSWFhR6jvf7Y8n52wb3J05NICEXFZwUGmLgDWvSElmIxzNuzu6eN+QDmSvWA0QChW18/AJZwnSD+Hw/Y0+Q3VbceQ08xnGzSRQpptLd66mFA==
X-OriginatorOrg: actia.fr
Cc: SAMMOUDA Ahmed <ahmed.sammouda@actia.fr>
Subject: [PATCH] cpulimit: introduce support for this package
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
X-List-Received-Date: Fri, 08 Mar 2019 23:23:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

    * Now, cpulimit recipe is put under recipes-support. Binary will be ins=
talled by the recipe under /usr/sbin

	# cpulimit -h
	Usage: cpulimit [OPTIONS...] TARGET
		OPTIONS
		-l, --limit=3DN          percentage of cpu allowed from 0 to 100 (require=
d)
		-v, --verbose          show control statistics
		-z, --lazy             exit if there is no target process, or if it dies
		-i, --include-children limit also the children processes
		-h, --help             display this help and exit
		TARGET must be exactly one of these:
		-p, --pid=3DN            pid of the process (implies -z)
		-e, --exe=3DFILE         name of the executable program file or path name
		COMMAND [ARGS]         run this command and limit it (implies -z)

		Report bugs to <marlonx80@hotmail.com>.

Signed-off-by: Bassem Boubaker <bassem.boubaker@actia.fr>
---
 meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb | 22 ++++++++++++++++++++=
++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb

diff --git a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb b/meta-oe/rec=
ipes-support/cpulimit/cpulimit_0.2.bb
new file mode 100644
index 0000000..d0c524e
--- /dev/null
+++ b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
@@ -0,0 +1,22 @@
+DESCRIPTION =3D "cpulimit is a tool which limits the CPU usage of a proces=
s from bash prespective"
+HOMEPAGE =3D "http://cpulimit.sourceforge.net/"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86c1c0d961a437e529db93aa3bb32dc=
4"
+
+PR =3D "r0"
+
+SRCREV ?=3D "f4d2682804931e7aea02a869137344bb5452a3cd"
+
+SRC_URI =3D "git://git@github.com/opsengine/cpulimit.git;protocol=3Dhttps"
+
+SRC_URI[md5sum] =3D "4f805fe26c8cf28e8251d64d0ace21d4"
+SRC_URI[sha256sum] =3D "544516d0d80c685b1df1344a71c900e845270551cf210300fa=
4d13876e10817a"
+
+inherit autotools
+
+S =3D "${WORKDIR}/git"
+
+do_install() {
+        install -d ${D}${sbindir}
+        install -m 0755 ${S}/src/${PN} ${D}${sbindir}/
+}
\ No newline at end of file
--=20
2.7.4


