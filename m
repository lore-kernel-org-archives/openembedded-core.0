Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 131823 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 27 Feb 2019 16:32:19 UTC
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
	(mail-eopbgr80043.outbound.protection.outlook.com [40.107.8.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4EB136D545
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 16:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6GB8N8baWiTpNpt4irkuBqI2QYJTpSum/KQ0jFJRP8g=;
	b=t+8K2FidfYkp9ZCV1oVA0cEq+LsNjKDlH4ZWTpZdHCFUNOa03GDw0FKyMZwTBJXtOzyBQs5EXVNpeseoK/yV91jsU/PVam5g4QpvIlo5f+AcX5XIBWyhiYklEkA1ZfHKGEB5VdMi8Uw9AYC6wtXJy5Par7gmgucorFTms1rrrSA=
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com (20.176.235.12) by
	DB7PR04MB4713.eurprd04.prod.outlook.com (20.176.233.30) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1643.19; Wed, 27 Feb 2019 03:58:36 +0000
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::5f3:77c7:cddb:b6b4]) by DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::5f3:77c7:cddb:b6b4%4]) with mapi id 15.20.1665.015;
	Wed, 27 Feb 2019 03:58:36 +0000
From: "C.r. Guo" <chunrong.guo@nxp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [v2][PATCH] glibc: fix multilib file install conflicts
Thread-Index: AQHUzlC2GLoc2tyG/EqhTfU+857q1A==
Date: Wed, 27 Feb 2019 03:58:36 +0000
Message-ID: <1551239897-24094-1-git-send-email-chunrong.guo@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR0302CA0023.apcprd03.prod.outlook.com
	(2603:1096:202::33) To DB7PR04MB5068.eurprd04.prod.outlook.com
	(2603:10a6:10:1c::12)
x-mailer: git-send-email 2.7.4
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chunrong.guo@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28de1139-a68d-4fe4-c9db-08d69c67d927
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:DB7PR04MB4713; 
x-ms-traffictypediagnostic: DB7PR04MB4713:
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; DB7PR04MB4713;
	23:eBuzId57C+7s1RWrSrLKSvHQm309BAV2sEF0hVt?=
	=?iso-8859-1?Q?20WXF1fwBkyaXwyuyHFcMW8WYRXck7oDSi+yvwS8MpJhn5M38FGzMjTLMH?=
	=?iso-8859-1?Q?pRcx1dKVcWhAOdBSYOjLrhTLFVgBROSgFJRrcf5wNTUjYN8Q6tGqm8HYkT?=
	=?iso-8859-1?Q?U9A8RsKCJE8U+0ONxQvCjP3srQ3lHjuW0VmrYAJcldkUmEcVp3QNCMkyny?=
	=?iso-8859-1?Q?zm+v4SBiyH1hXXO/fgbeC0Sg9Ymc5evM/++EAG240CItUhVCkknBKuKHDr?=
	=?iso-8859-1?Q?0eWRyC9EbX4cRTvCDQ8ikpWeldk9TikIFKNr+lCJyLpQKCf11uEGWRO6tz?=
	=?iso-8859-1?Q?wcHQar7ogGz2gDP8hlA8v6B1h4jPfNHkwBaWsn7HP9oiPmqbu/c83ChWHO?=
	=?iso-8859-1?Q?+tx1WBwS8eBlLo8UqTA2Hpo/MSEJ6iOfmMR2W0se6yj+t3ioxb/M7Z758U?=
	=?iso-8859-1?Q?5ik6KEp6ZKDvYssBm3z+mQeTQO3UC+SUxO/qPUsqEvxD2Wi9HsnFC1F7m0?=
	=?iso-8859-1?Q?WLMkBm/c0wjyj1yGczy4ovnoLsn+lHsfMsaCpgP/Cs4fp4bvJqirygGdw+?=
	=?iso-8859-1?Q?dNWmeRW68XiOsJdkPLk3UEz0+n/WrGWcjXbAndqp7k2fxmy6hGu5T7SfRB?=
	=?iso-8859-1?Q?XgCM754CxU8u30lDBTLdyvZJDyrIWRtDxRGcm2XzT2S9SRraoTJjsBScVg?=
	=?iso-8859-1?Q?cSrguP/Ci4m1y6vdkwOCurKaFphI1neESGdFO3CGQHo5gFvTPr+94/tf+h?=
	=?iso-8859-1?Q?yWqut+Wv61h0ehZsQOHkmwWNvvsbmV7Rv3DIyNfyZqAMMuiUXd68SGFOPL?=
	=?iso-8859-1?Q?zpBFC3zpRYv/nvz7TBC5apBFOc2lES+VQKHZgNBglXYu2N/Ua/7RaReoLH?=
	=?iso-8859-1?Q?MlL0NrNMdPR2Mhw6kS7bWNK4eGPIRc7Wnz9/ymZSX7hMWRbdoa6zIpKRPk?=
	=?iso-8859-1?Q?1YJE1iIHsmu1Bp2CRYkZChR76zajYTiaejRvD0dIVkIYca+z7fhqzo7/Nx?=
	=?iso-8859-1?Q?13kYWjbakTpm/1za8OtOQ5tfMwQmr0pS6sDxMsmyUHg0WnqEHVVJKPKK/h?=
	=?iso-8859-1?Q?6fev4YTuwNf1U/1167lv6Nx/uS2XB3cMUdpN0saDfixhNcw2nX0bqpxpU9?=
	=?iso-8859-1?Q?/WtDhS/QuFxxxZ4beunobE8L0YcUSxqRaHzlzkfObGsRhgaZPvwSuBa9Ka?=
	=?iso-8859-1?Q?+Ysvcvsgp8HDaZ6nh2OrmlIiWsabvrZqA=3D=3D?=
x-microsoft-antispam-prvs: <DB7PR04MB47137BF97FF180CBA466D67D84740@DB7PR04MB4713.eurprd04.prod.outlook.com>
x-forefront-prvs: 0961DF5286
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(39860400002)(396003)(136003)(376002)(346002)(189003)(199004)(4326008)(25786009)(36756003)(68736007)(106356001)(476003)(486006)(2351001)(2616005)(52116002)(105586002)(8936002)(2501003)(81156014)(81166006)(316002)(8676002)(50226002)(6916009)(97736004)(99286004)(2906002)(53936002)(6506007)(478600001)(386003)(5660300002)(5640700003)(14454004)(102836004)(6512007)(256004)(66066001)(7736002)(26005)(186003)(305945005)(71190400001)(71200400001)(6436002)(6486002)(86362001)(3846002)(6116002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB4713;
	H:DB7PR04MB5068.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fdVL9PTI+uRcByHFQ/wMKH9Vn5FBGJM39VNRVU5F1qmm3U+dph+ryxg1mZFkf957LFnmgxuhkpnr1ZEqJ0xIDGwyBd+6jRtUw7RUCvfBsTOkR81JCkwToq76dLl0yxt53psiP4fvXjJjuqv0t/Td4pMMRVYPNf3HgbUNrDe0D4FZqjwkVyonQgn0uJ+pl/ouSQWsWDBqR5biZZMZeElmUeREVsBZNxkG0VZDMJlCeF4ldGw569FTy8m2SiMlyYTAKIsF9SQ+sNQIRCSikXxGIDBya8Py3kx89Ehe6xxD8E9xnHcCaSXcSgiybPHrzqWUqe2WPdifJ7U6Ex2vcBLPVjXZeFrLV8y+FGSXe+eZpHCA8GSyiyCOQTYNhLD4L4vEKwDEI0TIrvPCWylV2VAkeXUQtKpyadvPZ6n1Kgcsyq4=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28de1139-a68d-4fe4-c9db-08d69c67d927
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2019 03:58:36.1754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4713
Subject: [v2][PATCH] glibc: fix multilib file install conflicts
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
X-List-Received-Date: Wed, 27 Feb 2019 16:32:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Chunrong Guo <chunrong.guo@nxp.com>

Leaving bits/procfs-id.h,bits/procfs.h,bits/shmlba.h out of being multilibb=
ed introduced a problem in building the SDK for arm64:
Error: Transaction check error:
file /usr/include/bits/procfs-id.h conflicts between attempted installs of =
lib64-libc6-dev-2.29-r0.aarch64 and libc6-dev-2.29-r0.armv7ahf_neon
file /usr/include/bits/procfs.h conflicts between attempted installs of lib=
64-libc6-dev-2.29-r0.aarch64 and libc6-dev-2.29-r0.armv7ahf_neon
file /usr/include/bits/shmlba.h conflicts between attempted installs of lib=
64-libc6-dev-2.29-r0.aarch64 and libc6-dev-2.29-r0.armv7ahf_neon

Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/=
glibc/glibc-package.inc
index b925961..be7fe24 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -149,6 +149,7 @@ do_install_armmultilib () {
 	oe_multilib_header bits/local_lim.h bits/mman.h bits/msq.h bits/pthreadty=
pes.h bits/pthreadtypes-arch.h  bits/sem.h  bits/semaphore.h bits/setjmp.h
 	oe_multilib_header bits/shm.h bits/sigstack.h bits/stat.h bits/statfs.h b=
its/typesizes.h
=20
+        oe_multilib_header bits/procfs-id.h bits/procfs.h bits/shmlba.h
 	oe_multilib_header fpu_control.h gnu/lib-names.h gnu/stubs.h ieee754.h
=20
 	oe_multilib_header sys/elf.h sys/procfs.h sys/ptrace.h sys/ucontext.h sys=
/user.h
--=20
2.7.4


