Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 39431 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 25 Jan 2019 11:40:31 UTC
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr10040.outbound.protection.outlook.com [40.107.1.40])
	by mail.openembedded.org (Postfix) with ESMTP id C3BB27C254
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 11:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dP7MXAjhVlPoPwOZsDtQnKHSE/wiuLx0Bzm5zW19OfI=;
	b=ardUu2cdCjxD5P0jpXHvh2Kqi33xvpKwM6RgsoT/izU2r6juO84LkAfL/7dlktOY0fo8xJU5ViCg3O71kX0+jhGnKbkr06Hz7fxPNtmJnux63XdafwxsctN3WIcjurGaR69Dvu3M/L/gzywNphU7JeZMkkTjy6mD9uKBesk9yzY=
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com (20.176.235.12) by
	DB7PR04MB4060.eurprd04.prod.outlook.com (52.135.130.25) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1537.29; Thu, 24 Jan 2019 08:13:09 +0000
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::c155:178e:fbd7:5892]) by
	DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::c155:178e:fbd7:5892%4]) with mapi id 15.20.1558.016;
	Thu, 24 Jan 2019 08:13:09 +0000
From: "C.r. Guo" <chunrong.guo@nxp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] mozjs: add aarch64 be support
Thread-Index: AQHUs7ykE4+Wucrbdka7XY9DR/ZBmw==
Date: Thu, 24 Jan 2019 08:13:09 +0000
Message-ID: <1548317569-25007-1-git-send-email-chunrong.guo@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0080.apcprd03.prod.outlook.com
	(2603:1096:203:72::20) To DB7PR04MB5068.eurprd04.prod.outlook.com
	(2603:10a6:10:1c::12)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chunrong.guo@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB7PR04MB4060;
	6:ETtKWCqoTJVEYrK4vMhsOF1LVqGWubreZtSRjRB+OCIktwENvpgD0Ubk1jRn8sGs5eE14lSYRUscdkGDxzEoEYuFzJHKu8vLUtdY0G1StAcL/AQnWzaiXMQjELTQf6HjKpuv4pszjyxrgzsZ4WAps9v4aJougN3KMbxqTMgEC8NZMDltEj1QtNdXjKmVN97WokBhTmeCEjzCi39ef6P3UAkutl4VF0nb49oc4edrvGDIP2qo+oCIG1TigGgraQEy7fVW4FJQdvx3Xh3A2toSII23MUOsgdLcH9OvOde5LOyUqJHjNO+mNuxSFcPe+Z8r201KZBKlm/9ZaXXZiyGiMT4QgrFWHSlZ7yfga92cmIiZ0tCVINsCyHjRL3yIyagEugpnUglovaNITawZTXASkM0E5Xg2Q4Mwua8bd/r5Gwpp0NVIWFslqa+Aehke5T7B9cyT0/rfbgHNmUPprIYwBA==;
	5:0RHQDE6vDp9+PnHOlUGlGmQ38KJzk4yh7FQGQC5r81FwtOUxrOieT8vxcpMWny+MHQHSAUarrLAPjsMM3/8eJ9ih0m1AjX4wfzJx+tsBX1dhd3SVkf2m37EyGq+SZMxAkSDvbsgAJGKsox2K17tYLSshqy7si7HyGsOAEjfWkwUEocNJ/uCGmdILWFi7B7mwvdNYgNscFTnS01stnS5mbw==;
	7:O0I/1liC5KTXcfnjv9qzkMQwJ+VpeWnWCn3BS07f39B4CrVkaunLCVSpF0UvOEsoR+2C9yFtanVIRydFvLas7ve1w/Tdu10z91uWSuISaGmaJwfHAELF6QbSxVOeNWSXP/Ggl2ACKR2Aknou24zlFA==
x-ms-office365-filtering-correlation-id: b75e24ad-d2d4-4e32-e448-08d681d3c66f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DB7PR04MB4060; 
X-MS-TrafficTypeDiagnostic: DB7PR04MB4060:|DB7PR04MB4060:
x-microsoft-antispam-prvs: <DB7PR04MB4060722D114BEEBF4ED5D6FC849A0@DB7PR04MB4060.eurprd04.prod.outlook.com>
x-forefront-prvs: 0927AA37C7
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(39860400002)(396003)(346002)(366004)(136003)(189003)(199004)(478600001)(8936002)(52116002)(86362001)(50226002)(53936002)(6306002)(6916009)(316002)(106356001)(68736007)(14454004)(6512007)(71200400001)(6116002)(186003)(66066001)(26005)(7736002)(71190400001)(3846002)(99286004)(4326008)(386003)(5640700003)(36756003)(102836004)(97736004)(81166006)(2906002)(81156014)(6506007)(25786009)(486006)(476003)(2501003)(6486002)(305945005)(6436002)(8676002)(2616005)(256004)(105586002)(2351001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB4060;
	H:DB7PR04MB5068.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yrflF4tYjND/zCpzyA+ncdFVZbmv56Ueem01Ni2jnYHUs8K8XRWLLe3MnfyzLCLGUZZgJMRYX6wBj3CKfPEydr7uQIM+c2cFg8ywjhf0t/6ka8qYn6rpDAG7yaZ8M8W/wY7EO/Iz1IviXUjQAW2Mm80q3iwiH/jCuQr7ol6UbpgDdneV/165afl81Oj6bZtV/OkZXyGKQ+UIFVlI1qgUS2CByBEOboF8F20lWg1X2cgVMxw+KPLnhimEvSJ/dXyB9Spn1pGRT89btLV4yAel57UfmiUED7Xh+uJ5AV1pd9+zsOJOuZH2HYhe2JEwf2ey6M8kNGs2e3aTVILLjqJwK2icfjXG4x8s64mFGCj+EllM1YLnyLrfkNuPB1LXmjBArmUbxg4paei59m+yulZNuZAAIujtNq5sg9HgoBNG6qI=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b75e24ad-d2d4-4e32-e448-08d681d3c66f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2019 08:13:07.3889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4060
X-Microsoft-Exchange-Diagnostics: 1; DB7PR04MB4060;
	23:k1CLY4/Ql90CuE0HbvDEn27Qi+eYUgxKcsSHnLBDyFkvJANWz3bBvMLFb2y6NHxrFPKbphuZnwc+cRWgprw6r/B8YW53vyuZZLpYUuQ8N6y6EZZw4IVsaU0WZBEJQvQmVfBcJpTJrrttElM2kMndFA==
X-OriginatorOrg: nxp.com
Subject: [meta-oe][PATCH] mozjs: add aarch64 be support
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
X-List-Received-Date: Fri, 25 Jan 2019 11:40:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Chunrong Guo <chunrong.guo@nxp.com>

Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
---
 .../mozjs/mozjs/0001-add-aarch64-be-support.patch  | 28 ++++++++++++++++++=
++++
 meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb     |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0001-add-aarch64-b=
e-support.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-add-aarch64-be-suppo=
rt.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-add-aarch64-be-support=
.patch
new file mode 100644
index 0000000..05ab2c1
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-add-aarch64-be-support.patc=
h
@@ -0,0 +1,28 @@
+From 52ab270c9ff1e3b0d5ce2fd59a268afd6e9cc0c8 Mon Sep 17 00:00:00 2001
+From: BJ DevOps Team <bjdevops@NXP1.onmicrosoft.com>
+Date: Tue, 16 Oct 2018 16:53:18 +0800
+Subject: [PATCH] add aarch64 be support
+
+Upstream-Status: Inappropriate [oe specific]
+
+---
+ build/moz.configure/init.configure | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/build/moz.configure/init.configure b/build/moz.configure/init=
.configure
+index 56e6730..139b5fa 100644
+--- a/build/moz.configure/init.configure
++++ b/build/moz.configure/init.configure
+@@ -359,6 +359,9 @@ def split_triplet(triplet):
+     elif cpu in ('mips64', 'mips64el'):
+         canonical_cpu =3D 'mips64'
+         endianness =3D 'little' if 'el' in cpu else 'big'
++    elif cpu in ('aarch64_be'):
++        canonical_cpu =3D 'aarch64'
++        endianness =3D 'big'=20
+     elif cpu.startswith('aarch64'):
+         canonical_cpu =3D 'aarch64'
+         endianness =3D 'little'
+--=20
+2.7.4
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb b/meta-oe/recip=
es-extended/mozjs/mozjs_52.9.1.bb
index a28ecc5..e39c929 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
@@ -15,6 +15,7 @@ SRC_URI =3D "http://archive.ubuntu.com/ubuntu/pool/main/m=
/mozjs52/mozjs52_52.9.1.o
            file://add-riscv-support.patch \
            file://0001-mozjs-fix-coredump-caused-by-getenv.patch \
            file://format-overflow.patch \
+           file://0001-add-aarch64-be-support.patch \
            "
 SRC_URI_append_libc-musl =3D " \
            file://0006-support-musl.patch \
--=20
2.7.4


