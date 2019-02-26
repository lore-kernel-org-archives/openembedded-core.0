Return-Path: <chunrong.guo@nxp.com>
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140072.outbound.protection.outlook.com [40.107.14.72])
	by mail.openembedded.org (Postfix) with ESMTP id 6614E7C92C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 09:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=y8Zi/pwXDxHdGeLFFxP0/NCSKSBYMG5iOV1xzNy3jH8=;
	b=uMrmBCf0/eMzXrkjSflm95yjMD66WkyrR/aaroZlPeTsr/x4aDpsB0i5Q8YmTyYokdBWNzgUxTwAwKYiVO9it8109t7aYXkpuxHSvvRaOhK0tsTRWroTbFITmkCuKQy+EBqz+9HgXFA2Zk5pk2qwrrwy5Zg4RcjbPt4gS+gInNY=
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com (20.176.235.12) by
	DB7PR04MB4092.eurprd04.prod.outlook.com (52.135.130.33) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1643.18; Tue, 26 Feb 2019 08:54:31 +0000
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::5f3:77c7:cddb:b6b4]) by DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::5f3:77c7:cddb:b6b4%4]) with mapi id 15.20.1643.019;
	Tue, 26 Feb 2019 08:54:31 +0000
From: "C.r. Guo" <chunrong.guo@nxp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] glibc: fix multilib file install conflicts
Thread-Index: AQHUzbDjrjKOyXLJykOte16hSDL05w==
Date: Tue, 26 Feb 2019 08:54:31 +0000
Message-ID: <1551171252-10385-1-git-send-email-chunrong.guo@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0025.APCP153.PROD.OUTLOOK.COM
	(2603:1096:203:17::13) To DB7PR04MB5068.eurprd04.prod.outlook.com
	(2603:10a6:10:1c::12)
x-mailer: git-send-email 2.7.4
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chunrong.guo@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 484a9d04-6b93-4374-10f3-08d69bc80587
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:DB7PR04MB4092; 
x-ms-traffictypediagnostic: DB7PR04MB4092:
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; DB7PR04MB4092;
	23:05ekdqJEqwyNrZ67t8oWk+/3s7dvIQ8oi6FedT7?=
	=?iso-8859-1?Q?QHuHu9gMH4J1F/wDol/aUU3RhcSrWgYnlGAIXHAOvNYC1MJYG1B+jGgMGS?=
	=?iso-8859-1?Q?Jbos0PaYtXi2cWw8vF2WoSgNkyK3OqNdOa1Wah4kp3RDgqML8aVRFWfPAg?=
	=?iso-8859-1?Q?W5RIMUs+gzExatSuAcp6Go2lxLkC3u7CyiYi+OwAHKNdMbE2p8ywbk0kIm?=
	=?iso-8859-1?Q?L8cx6J1edxuIczxHllYLIWCyVogFP+VKIWQXloNwAetLHn6q9S4miPnJHR?=
	=?iso-8859-1?Q?Hf2aSN04/TuhND3kIq1df8JL6fvnya8yBE2jwL4cBWYNjhsGQVZsrAMmfS?=
	=?iso-8859-1?Q?rF7FYBQcQnX5ITSfEFE0GJ2TxYydKpp1kuX9OnJjh0DWaXSKrvemXvdgXI?=
	=?iso-8859-1?Q?CnQE/aO9pQWFVilpx9zfe3USZ7IkrpZh2LxMUgzKtR/gpoIYSGHGFr5Ztw?=
	=?iso-8859-1?Q?a5XFMHCxIP+VXGo8Wf10wvi5oxWEDYBmKUXYU3FWNFSXvNgUVIN/t4q1of?=
	=?iso-8859-1?Q?SY/5aF8oPOh9juvEe3n7X6d3Ov/NCw+GeH24GpAub0Xi/4KVahwHnpAf6Z?=
	=?iso-8859-1?Q?sYAO16cvm/jQ4qVRL+Z8v7OfZhGaULhhuQUaQggV4sTBJ8iLVjFpWkgreT?=
	=?iso-8859-1?Q?PV5JrnnAFpzvF4/0M6OxPDlTWMHxO0PoJwzd35OEQ3Cct6d1fwqLO9q3ly?=
	=?iso-8859-1?Q?Om+srB1Mq2NwX8/t1I5aaTo1H0uC0+mqsn3UY95Wyk1GTLBmM61eiPNJfb?=
	=?iso-8859-1?Q?l8bWB01Z0gwQUBM1HyaWdxaw1tJ/12s8eRKzmTb2gyFIEEmCxYahc2u7/f?=
	=?iso-8859-1?Q?KIresQcoIEUO2wIFLla09jMiNEVi7MMk9MuxP+CIKJL+sU568dW0+niSuQ?=
	=?iso-8859-1?Q?bmpOCq+9rZtQEOv7JhxhCA6bSaghQ30f/9M0NUrclkjslVUoSyF/+xkliS?=
	=?iso-8859-1?Q?d4T+yqSOE3hN7q6iEjTbGKVciOc1xZSH4lsI3gquZ7VBvNnfaOf0oILgkb?=
	=?iso-8859-1?Q?UDBKIvguT81l8YIYbw4C4q8Srwieva2P7KcSu8DIXnStHw8iVyf0qVLMX7?=
	=?iso-8859-1?Q?LnqoUUI4VpW3xvf0hWJgkrgEjlxSqQ4kljv6Y8ZZX0eDVsQ+XAG+dnue9l?=
	=?iso-8859-1?Q?8Wiw31m+yR5gZV9bzJUNvGp5DehmkBymCOi4v4b+J7lmj5g1ffjg+eyY5Z?=
	=?iso-8859-1?Q?dTo3H88f8qCIIH6D4vzwkM3uASbICdbrxPM6LH/uBf9L9Aym50bVnzGfG0?=
	=?iso-8859-1?Q?7prEG7yXwTY1zaHRTHM0ATYoH5847YPYZm8sUA9ufcb8K67FYgIPuxKMg7?=
	=?iso-8859-1?Q?2PGCQWRvwtDkESu5VTkjB1e?=
x-microsoft-antispam-prvs: <DB7PR04MB4092CD77A5A45C1BCF5A540D847B0@DB7PR04MB4092.eurprd04.prod.outlook.com>
x-forefront-prvs: 096029FF66
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(979002)(376002)(346002)(396003)(136003)(366004)(39860400002)(199004)(189003)(6512007)(305945005)(7736002)(68736007)(52116002)(6436002)(486006)(2616005)(476003)(53936002)(386003)(6506007)(26005)(5640700003)(102836004)(6486002)(186003)(14454004)(478600001)(86362001)(99286004)(8676002)(81166006)(81156014)(8936002)(50226002)(5660300002)(2906002)(256004)(2501003)(25786009)(97736004)(71200400001)(71190400001)(4326008)(316002)(6116002)(36756003)(6916009)(3846002)(105586002)(66066001)(106356001)(2351001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB4092;
	H:DB7PR04MB5068.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nKB00suzgCTIeRzpHFdZMQPO4jV4yalPRMK7B+admWGXdokDEj08+DTsTXey8OYTFrT0p9/kueWpKEreBVNrvxZNRI7UwtjwGlAQbZeWb/DTWLR/3Q2Qf6GmzMCyZWr8rW/C2c0Ibl3/V7/NHPkuWFxzNygU+dLsWWgpsLPiXjlRHunitUPmrs8Xxz6aXeqXVW6+vKlJWfvY5kNZATTtaCdQwLc44okUajWZEyjiDI+YqNmkDR2ujLNggYEI/IEXcwUkIGxIooy5MbCL4nqeZ7r+s74+rbAHEoZ/tDvYzo7QML/xNbOG+tpPEu/HwD7mz95Nl0C+k77paMNOwjNWYAUu+oPUit5G8PSr9dahDADyS41WXf3XZc+8yPtw3nSp/Ytwy1fKqy3tpDLTHODOQWOA547UqBlAax6bhhm1ezY=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 484a9d04-6b93-4374-10f3-08d69bc80587
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2019 08:54:29.4926 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4092
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
X-List-Received-Date: Tue, 26 Feb 2019 09:27:50 -0000
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


