Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 111959 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 26 Feb 2019 16:58:46 UTC
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr10078.outbound.protection.outlook.com [40.107.1.78])
	by mail.openembedded.org (Postfix) with ESMTP id AC6696C0ED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 16:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=y8Zi/pwXDxHdGeLFFxP0/NCSKSBYMG5iOV1xzNy3jH8=;
	b=jjEcwGIcxqOD477So9PpjcTcKXTh3jBmxZwKkazWO6Ogx1yW00ZlJ2QCGPB2Mi9Z4tn/xOOxmFt/v+l164CnVtkLMAeQ0EaMzwXKAvEvqBhNa5E0lMzw+8U5jIRhoSQ96UnKuqFSjBRQUCztIK2YT8SYP9DtUQnXgCvnGpKRMWI=
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com (20.176.235.12) by
	DB7SPR01MB0027.eurprd04.prod.outlook.com (20.177.195.205) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1643.16; Mon, 25 Feb 2019 09:20:05 +0000
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::5f3:77c7:cddb:b6b4]) by DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::5f3:77c7:cddb:b6b4%4]) with mapi id 15.20.1643.019;
	Mon, 25 Feb 2019 09:20:05 +0000
From: "C.r. Guo" <chunrong.guo@nxp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] glibc: fix multilib file install conflicts
Thread-Index: AQHUzOtL+8j9zB20bkSPOqMQWF79qw==
Date: Mon, 25 Feb 2019 09:20:05 +0000
Message-ID: <1551086317-17933-1-git-send-email-chunrong.guo@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0076.apcprd04.prod.outlook.com
	(2603:1096:202:15::20) To DB7PR04MB5068.eurprd04.prod.outlook.com
	(2603:10a6:10:1c::12)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec74fc43-6c00-4601-6387-08d69b026d5c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DB7SPR01MB0027; 
x-ms-traffictypediagnostic: DB7SPR01MB0027:
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; DB7SPR01MB0027;
	23:ilAP63YWNxXC9ZCqk55/ToOJylalwKMcfTxf3V?=
	=?iso-8859-1?Q?ids9XXV5XpXqE+M/L+0bWj74KMn70sLKPoYMXBKBSQDxtDtA69OFshV2HN?=
	=?iso-8859-1?Q?MZDb/IEqZG9uW65v1x0a4M1HSPfquQNver+oRDFClu7VXa11OfPONbcZCS?=
	=?iso-8859-1?Q?IHc/5gljxSNF21ohNbnmIW0cgYUlHrlI5Vr7Mxu3tmvTYXfMlWdDfGbf6G?=
	=?iso-8859-1?Q?2R8f1XE1H6ZiAoEUTMLdXML8UxBhvrc1JtXR9T/0VfrrIi/dY/GEBzLwY+?=
	=?iso-8859-1?Q?Ee1WBQhoalLdrtU2Eg1NuMZvorfD88n7WaY3Zd6BwB8nI3AxWOi9e+Kv6b?=
	=?iso-8859-1?Q?x96R1+SPloZVwZaxtpzynBAjG7q426hKx0I+iBA/HK/47rHbdW1lfxnFHq?=
	=?iso-8859-1?Q?iYUBBWF8Vb/Qc/AJHyqnrL2zQEKvn0Vc+jvOVeNxF8azTthQ2q6xwCOAE7?=
	=?iso-8859-1?Q?7JZ/FNe46bT8635LdgQM/T5vOp2Vt+J5gtx9FySzTcgEaZy3xsU7IHVZxU?=
	=?iso-8859-1?Q?6bXbwEKn/vdEufeOJDfOC9ALxfzpZFcEvFZ2GjfwkAnu5nUdFpe1AFKcFw?=
	=?iso-8859-1?Q?+o8Or3FtuzT0rgXRPUGMWGLY1Evbi3KhRSy/hh2DmtgQv7ay08Hc6TD18c?=
	=?iso-8859-1?Q?3WcXWB9iC9fPU2A6fBU5N+H/2SE4Aa1DDvklgkAjPMIXiUnhZ5OaZYiOz+?=
	=?iso-8859-1?Q?EnPxkhpik0FT3/J/MaSxXUONJDEBU+s28gZ27IButXjRdHwSIyyg8RBOfW?=
	=?iso-8859-1?Q?M+cMZGAnSIwvULePI8xNs6+NivPRrO3zhDUcAsRzK1tZQBE5ZgXtreG8Ku?=
	=?iso-8859-1?Q?c1LcP5B45iU0MSZlllaEZRtYeyYc/YPSNq05ROspOwgKMN/EjgY+5tWQQD?=
	=?iso-8859-1?Q?C8a0nW3eA0aDsinIas81FufuJRGilvSd72VUfJL5c61vV3pa3Bhoph5kVQ?=
	=?iso-8859-1?Q?t8oj03FRY2sKLMMA6/7YXr31RelLyuMGxJ5LXw5gwwcAPXqdx/LqNL9qoY?=
	=?iso-8859-1?Q?FhqvH7I05LHYrZeVXCjKU1vkiPzjGYy5zUO9YdZcDr/wRzX/G5rseM8SvT?=
	=?iso-8859-1?Q?gFdbDmJZ2Pu6Jdkqfv0mfw6qjPm7LAmaUiSTsikGOw4M0yQBLZcsLQVb8B?=
	=?iso-8859-1?Q?Xltw6p6kN9WVaH/8zw21c6IRcEtu6/vEM73s8kZ70Wt+Np962/tDBipAjM?=
	=?iso-8859-1?Q?Wz4rwLGrROko1B+A++nW5ZNpdeYyOUsy2QwIjlcTiYpthLunto6exQY=3D?=
x-microsoft-antispam-prvs: <DB7SPR01MB0027E0EC8FE1237401AA9CB3847A0@DB7SPR01MB0027.eurprd04.prod.outlook.com>
x-forefront-prvs: 095972DF2F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(376002)(346002)(366004)(396003)(136003)(199004)(189003)(6486002)(476003)(102836004)(97736004)(316002)(3846002)(2616005)(486006)(6436002)(8676002)(6346003)(68736007)(478600001)(25786009)(386003)(6506007)(6116002)(14454004)(105586002)(256004)(2351001)(2906002)(6916009)(71200400001)(71190400001)(106356001)(50226002)(99286004)(305945005)(52116002)(36756003)(7736002)(81166006)(5640700003)(86362001)(5660300002)(8936002)(186003)(4326008)(26005)(66066001)(53936002)(6512007)(81156014)(2501003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB7SPR01MB0027;
	H:DB7PR04MB5068.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chunrong.guo@nxp.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Fbqj615O2ZI6PRCXL+oXCRmZpnIEL+Z0TECRZbD4ptNi4PYZt99Xj/yiNrq3V8ZSxCSc5onOtIvX+MIgdKMJAf6p2RlgM4dg867T8XwyrrOZXmfqy8OOMS6v2VT/VDE6U8zQ1F2wOJKIIGofLPNLZh98aHWlZDrIhcurmXrDZSthAFIh6JvtRFKQ7onx9ahMudj6D4jNL3GPgGkp1oRdmh6lVPB9EjelyB2ws/mztGSvcbnL4CD2Fe4+HZgxbDUOnw5qTA2WCpwzsiWdc3v8j6/quhhmHeAhjRgGXVRKpaogMFqSIu3NFWruRTia6YZhc330lxYCqahp6oOLUHncQ71AIf7JGd0KOIL0ddDd7djMRxPVC8d+uUDG7FX5mYBC5+k89QnukHbBaWI9pfCWoRDNl/cdwx8rApG6mv4l4w0=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec74fc43-6c00-4601-6387-08d69b026d5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2019 09:20:03.3655 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7SPR01MB0027
Subject: [PATCH] glibc: fix multilib file install conflicts
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
X-List-Received-Date: Tue, 26 Feb 2019 16:58:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Chunrong Guo <chunrong.guo@nxp.com>

Leaving bits/wordsize.h out of being multilibbed introduced a problem in bu=
ilding the SDK for arm64:
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
index 329732f..822ffd6 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -144,6 +144,7 @@ do_install_armmultilib () {
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


