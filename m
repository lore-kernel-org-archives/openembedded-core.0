Return-Path: <laurent.bonnans@here.com>
X-Greylist: delayed 17987 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 20 Jul 2019 03:58:17 UTC
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140105.outbound.protection.outlook.com [40.107.14.105])
	by mail.openembedded.org (Postfix) with ESMTP id ABF517EFE3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2019 03:58:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=MbnRLzNs2YbEOegE/7CF8SFu6qvKdJtthNQd0k006tKxQCYV6+jRX1HesXTK1mojMFR/L3Ax2onjclK/1N9blX+QpA5yiBFDPGTs4r+UPrpRyulbgnv88cH0njAaWFE62qiP6ssJu+l2YprsL+k6xOh3tjlRx7VaMjh0OpRRrNgdYB417EsD70970w0IweU58NEZ0s0U8Vf3LZNzRJfydx48+Aq74+DNDM2L7/OOR2rA/HBIxnMjTkuofERBPLP3QLcYX1jHU5N/dwSxCdwaX0tzehqJ/twD3pXB9OJZZ7ORGn3AkraE4qX9LKiWpC03LAAICPhKeEeKGIKO3Mm6nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ecOI6SFjHx34uNsBdSpsJ2QowO4aDLv/U/BGUq726Mw=;
	b=BwklSSW/SHzPdPdPSiXLdnEU6XsGjEg01ViEhB+qs0NcDIU9nENGipz/uJ8eh+rdJY28dK8tpg3dv7YlH1s06OnBrOaHJfVY6q3W4HxeGCaYFWNIzEIQWe6vna0sGbNfcqEMibGuKIHLQfDxZIr+Na5h8bccz2CWcJgS7i/hDynXwL4YfD+3ZHgunLbMiCwFs7nWPy7Ty810EVNAeJ9aOqn4lusTwd+T3dEQEfNbzHbbkMtPBPwl9DXbECYRVFd33XjEqxSmsUZrngCK5Ak1HoHfGFvAXlV8FfoTdAor0C8sQb5Ry4TUBY03DRnz+1hFXFNDYY7kohMCiNTl3roKyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=here.com; dmarc=pass action=none header.from=here.com;
	dkim=pass header.d=here.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=here.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ecOI6SFjHx34uNsBdSpsJ2QowO4aDLv/U/BGUq726Mw=;
	b=m5Fvs0pN5Wsv3OJltIcduUbaFMSA3/kNj6QiVPs1HpMoRAnWgEUDIQMhQoLI6e7SbUmjIWKGT15MnWlwPsR1AH508FT2s+NRbLnNxUame83mVvUnn7Sf3ZFLt6Z0il+hX2uGJR/wDB5SF4dC7x1cOhqawpvnQc1bY3vHZO5Q4ew=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
	AM5PR04MB3027.eurprd04.prod.outlook.com (10.173.254.142) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2094.12; Fri, 19 Jul 2019 14:27:48 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
	([fe80::5012:d47a:1f5d:9b84]) by
	AM5PR04MB3299.eurprd04.prod.outlook.com
	([fe80::5012:d47a:1f5d:9b84%5]) with mapi id 15.20.2094.013;
	Fri, 19 Jul 2019 14:27:48 +0000
From: "Bonnans, Laurent" <laurent.bonnans@here.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] openssl: fix valgrind errors on v1.1.1c
Thread-Index: AQHVPj4jxaY6s5bTSU2eUekG3cdEiA==
Date: Fri, 19 Jul 2019 14:27:48 +0000
Message-ID: <20190719142742.31137-1-laurent.bonnans@here.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=laurent.bonnans@here.com; 
x-originating-ip: [131.228.216.132]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ce97f13-12c5-4485-2a4c-08d70c554644
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:AM5PR04MB3027; 
x-ms-traffictypediagnostic: AM5PR04MB3027:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <AM5PR04MB302730C85088977BCFEAF7C385CB0@AM5PR04MB3027.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:216;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(199004)(189003)(68736007)(53936002)(6512007)(36756003)(186003)(102836004)(99286004)(316002)(26005)(2616005)(305945005)(6306002)(6506007)(476003)(486006)(66066001)(6916009)(7736002)(5660300002)(66946007)(8936002)(2351001)(6486002)(71200400001)(71190400001)(76116006)(8676002)(6436002)(478600001)(2906002)(1076003)(256004)(966005)(14444005)(4326008)(6116002)(3846002)(5640700003)(86362001)(66446008)(107886003)(2501003)(81156014)(81166006)(25786009)(64756008)(66556008)(91956017)(14454004)(66476007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM5PR04MB3027;
	H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: here.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: O9TCjxFQiYu7Gd6CUCkdpFXw0UgdqroH94+W6f91MAT/7xk+H/kHwMzy7fJ5J7mJyF8zRcsFABXENYaRDleud087xpqeUsaFSZLDCxY1jvywdh6IUpTn3C1IN4vRWxkiho26BWFv7gO3ummMq3eNglagls0JfQkrgr7ztP9yvP90FdTWLlXLUdY0W7f4OsO7ESEDmBEw5WTOkZndyY2u2KQb52wXMD8GyjfM30x7pMZ6b0vsBnQaNxz2mYsn5E1Z4hxegKz/At/QE3c1i7EVotk7U5OmEFZsMyomWWO7+0tBAkzUinJkfKI1G97LpgAU2EjZ4F4zLJWlFTXW8WVeF8fbbGxtDW5OHb3df81VNZJ6rOGC58RxXiXAVl3mH97GceogSFdGlokYiHVAR0DgCob5VPKdhOZhXQdPbzBBYgA=
MIME-Version: 1.0
X-OriginatorOrg: here.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce97f13-12c5-4485-2a4c-08d70c554644
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 14:27:48.5960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d4034cd-7225-4f72-b853-91feaea64919
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: laurent.bonnans@here.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3027
Subject: [PATCH] openssl: fix valgrind errors on v1.1.1c
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
X-List-Received-Date: Sat, 20 Jul 2019 03:58:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Running valgrind against code using Openssl v1.1.1c reports a large number =
of
uninitialized memory errors. This fix from upstream solves this problem.

Signed-off-by: Laurent Bonnans <laurent.bonnans@here.com>
---
 .../0001-Fix-broken-change-from-b3d113e.patch | 35 +++++++++++++++++++
 .../openssl/openssl_1.1.1c.bb                 |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Fix-brok=
en-change-from-b3d113e.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Fix-broken-chan=
ge-from-b3d113e.patch b/meta/recipes-connectivity/openssl/openssl/0001-Fix-=
broken-change-from-b3d113e.patch
new file mode 100644
index 0000000000..6b4789fc70
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Fix-broken-change-from=
-b3d113e.patch
@@ -0,0 +1,35 @@
+From 711a161f03ef9ed7cd149a22bf1203700c103e96 Mon Sep 17 00:00:00 2001
+From: Pauli <paul.dale@oracle.com>
+Date: Fri, 29 Mar 2019 09:24:07 +1000
+Subject: [PATCH] Fix broken change from b3d113e.
+
+Reviewed-by: Tim Hudson <tjh@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/8606)
+
+Running valgrind against code using Openssl v1.1.1c reports a large number=
 of
+uninitialized memory errors. This fix from upstream solves this problem.
+
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/711a1=
61f03ef9ed7cd149a22bf1203700c103e96]
+Signed-off-by: Laurent Bonnans <laurent.bonnans@here.com>
+---
+ crypto/rand/rand_lib.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/crypto/rand/rand_lib.c b/crypto/rand/rand_lib.c
+index 23abbde156..a298b7515b 100644
+--- a/crypto/rand/rand_lib.c
++++ b/crypto/rand/rand_lib.c
+@@ -235,8 +235,9 @@ size_t rand_drbg_get_nonce(RAND_DRBG *drbg,
+     struct {
+         void * instance;
+         int count;
+-    } data =3D { NULL, 0 };
++    } data;
+=20
++    memset(&data, 0, sizeof(data));
+     pool =3D rand_pool_new(0, min_len, max_len);
+     if (pool =3D=3D NULL)
+         return 0;
+--=20
+2.20.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb b/meta/rec=
ipes-connectivity/openssl/openssl_1.1.1c.bb
index 377adb1785..75159ac725 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-${PV}.=
tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-c=
o.patch \
            file://afalg.patch \
            file://0001-Fix-build-error-for-aarch64-big-endian.patch \
+           file://0001-Fix-broken-change-from-b3d113e.patch \
            "
=20
 SRC_URI_append_class-nativesdk =3D " \
--=20
2.20.1

