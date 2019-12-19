Return-Path: <shohei.maruyama@cybertrust.co.jp>
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
	(mail-eopbgr1410101.outbound.protection.outlook.com [40.107.141.101])
	by mail.openembedded.org (Postfix) with ESMTP id 39D597FDDC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 11:17:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=VfZfUFTeyEJJKQo9EXDOJ2o3SyEaxg8gJXpjqBPkec7W8RhfUGUeTRpk4yUfym8tAoggfkUM95cjOkk7EbB9e+rd7LtKdI0930PguISF8T5artrtXimNPbScPgvG1duLygLimJjwSyj9vt8MJAFOBejMCxjNJZGOSsfwzSxkeCQYExrd+SUljtC5UD/WsbavAcHbYQ6qXE38mCPS0TQxwefVd3gqZfUng+D2RicsmFxwvET/oZKfBcuJ704LG1ARIK0g6FVnmRt9es+AuK6V63h2vCqdoH4Qk0mvj34k3aaLFssGgJxLM+J2UATi1A/AFEFdCGCOkA4XAMGo2w9qlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=vjPri75k2N96uZLpg/2NEGIOVYzsfbHQVLJM5tSlUfw=;
	b=LrD0JEZwdjmXwknRTH7nZlm4DbHbVot4VEaPm7QQJ0B8i7I4q+JlgDo7NopDsmOoukpVul+IZWZwwih+OuQqw4QXE4/rXs00nynzHo/4UmEg+gz14F60tG/kmh9yGeo6eF2f4xgRwnuHLMI7MbRlBwyxcva0nA8fcJxEv7PLQNxLMlLjJFub/xtGKz+RnP5fUfNqo1qR43g6aXnqIYFMIic6fVfkW4v0W5n0HndSAMg+xUcVVghOblToOXvstHOpAFLlwtNhLxTcCzz5IX4AHvZXRObLdHIJtkj/PRGQ7ztSfDnFRE64okIRfMvmnzAJCFJqmUx6R+W8jdjJEjdiLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=cybertrust.co.jp; dmarc=pass action=none
	header.from=cybertrust.co.jp; dkim=pass header.d=cybertrust.co.jp;
	arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intra01.onmicrosoft.com; s=selector1-intra01-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=vjPri75k2N96uZLpg/2NEGIOVYzsfbHQVLJM5tSlUfw=;
	b=Afr0DrjokRIwVwFsVU+Zg+k2rMUGUgn4UG4jLtLzWgF0wOfMrzFaBDaoZfp79+FFuKUJ9iki3ggWudf4tm6vdWlOiXmDHIrdz1imS68Ux7vMawNUSdq7MZ0gzkNTdCu9kCJm06q6gWJ34S2yW4j+gDs2cYy5egdKVppfGVIDM0g=
Received: from OSBPR01MB2616.jpnprd01.prod.outlook.com (52.134.253.73) by
	OSBPR01MB2934.jpnprd01.prod.outlook.com (52.134.253.85) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2559.14; Thu, 19 Dec 2019 11:17:48 +0000
Received: from OSBPR01MB2616.jpnprd01.prod.outlook.com
	([fe80::908d:9cce:8d6d:628d]) by
	OSBPR01MB2616.jpnprd01.prod.outlook.com
	([fe80::908d:9cce:8d6d:628d%7]) with mapi id 15.20.2559.015;
	Thu, 19 Dec 2019 11:17:47 +0000
From: <shohei.maruyama@cybertrust.co.jp>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] qemu: Add PKGCONFIG for glusterfs
Thread-Index: AQHVtl3xZmAesdETdk23NzcoeKZtsA==
Date: Thu, 19 Dec 2019 11:17:47 +0000
Message-ID: <20191219111758.22827-1-shohei.maruyama@cybertrust.co.jp>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: TYAPR01CA0105.jpnprd01.prod.outlook.com
	(2603:1096:404:2a::21) To OSBPR01MB2616.jpnprd01.prod.outlook.com
	(2603:1096:604:17::9)
x-mailer: git-send-email 2.24.1
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=shohei.maruyama@cybertrust.co.jp; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [219.123.27.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 852268bc-b4d3-4b97-d766-08d7847513dc
x-ms-traffictypediagnostic: OSBPR01MB2934:|OSBPR01MB2934:
x-ld-processed: 72cc4624-32b4-4dab-b80a-8563e559bd82,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB2934B9ED1EBDF0FE5FD642C0D6520@OSBPR01MB2934.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:304;
x-forefront-prvs: 0256C18696
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(366004)(346002)(136003)(39860400002)(376002)(396003)(199004)(189003)(5660300002)(1076003)(4326008)(316002)(107886003)(2616005)(8936002)(71200400001)(36756003)(86362001)(4744005)(186003)(66476007)(2906002)(26005)(66556008)(64756008)(478600001)(66446008)(8676002)(52116002)(6506007)(6486002)(66946007)(81166006)(81156014)(6916009)(6512007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:OSBPR01MB2934;
	H:OSBPR01MB2616.jpnprd01.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cybertrust.co.jp does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sf0+KiZGf8kMlHnX5wBhwLAXnxiLeP26EzifvO31R16aVjH7vCGWWDZ59NubT51iLlNNZa1NpEahpIBtfJ4y8pq7Dd2YN4Jy7Pa+7klZamlYYh3sCXostZhiA2/Qim3QiNDs5nZodb5mTIAze0vye9HwUByP4FkGfryz/VdiT/jORqqQ3tkKLVSB3GDpogQ62dD0coyZnUl8gWcSSKtBO1oT9m8uNthU2ADos9cN5reyKj6wYCTWkksoDAd0hXLT3tEvBYCWByoRxGf0q32x3bw6jnYKHEw0VxtLiktlZMJhwJBUUghW6IdcZDMBt3AcDWVlCWJ3ef5nRVV8cX+QdDj6OJQK3HXrX3BwVUJ9rdrz1V/ka4YQWB1kokbjenONJK0HHXUXWZ+m+ZCxFGqU1SLqL/Fa6XI0/+X3YvlWQOJFb91DY+Lk44axM7Ld3BMB
MIME-Version: 1.0
X-OriginatorOrg: cybertrust.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 852268bc-b4d3-4b97-d766-08d7847513dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2019 11:17:47.8293 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72cc4624-32b4-4dab-b80a-8563e559bd82
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s4NsGbCXM0+2qKOzKhpOu4N/atbxz1tj2L6p7raQM0NGWQ/ozal+/pbP+9+pMR4pJV4cxPsuPqhr1jKa111eMNDEOOCJlhseGHHVcrxsdFlDAvZd3CYLq3a/j+xA37LK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2934
Subject: [PATCH] qemu: Add PKGCONFIG for glusterfs
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
X-List-Received-Date: Thu, 19 Dec 2019 11:17:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

This commit adds PKGCONFIG for glusterfs. glusterfs is not required for ru-
nqemu, so it should be optional to reduce build time.

Signed-off-by: Shohei Maruyama <shohei.maruyama@cybertrust.co.jp>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index 202134b3d8..e917a96241 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -160,5 +160,6 @@ PACKAGECONFIG[virglrenderer] =3D "--enable-virglrendere=
r,--disable-virglrenderer,v
 PACKAGECONFIG[spice] =3D "--enable-spice,--disable-spice,spice"
 # usbredir will be in meta-networking layer
 PACKAGECONFIG[usb-redir] =3D "--enable-usb-redir,--disable-usb-redir,usbre=
dir"
+PACKAGECONFIG[glusterfs] =3D "--enable-glusterfs,--disable-glusterfs"
=20
 INSANE_SKIP_${PN} =3D "arch"
--=20
2.24.1


