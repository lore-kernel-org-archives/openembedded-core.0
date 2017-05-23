Return-Path: <carol.zhu@nxp.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0066.outbound.protection.outlook.com [104.47.32.66])
	by mail.openembedded.org (Postfix) with ESMTP id BF9CF72F63
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 14:09:54 +0000 (UTC)
Received: from DM5PR03CA0056.namprd03.prod.outlook.com (10.174.189.173) by
	BLUPR03MB168.namprd03.prod.outlook.com (10.255.212.152) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.14; Tue, 23 May 2017 14:09:55 +0000
Received: from BN1BFFO11FD025.protection.gbl (2a01:111:f400:7c10::1:185) by
	DM5PR03CA0056.outlook.office365.com (2603:10b6:4:3b::45) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.14 via Frontend Transport; Tue, 23 May 2017 14:09:54 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD025.mail.protection.outlook.com (10.58.144.88) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1075.5
	via Frontend Transport; Tue, 23 May 2017 14:09:53 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4NE9YgY029059; Tue, 23 May 2017 07:09:51 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 May 2017 22:08:08 +0800
Message-ID: <1495548488-12280-7-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1495548488-12280-1-git-send-email-carol.zhu@nxp.com>
References: <1495548488-12280-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131400221937202275;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39400400002)(39410400002)(39860400002)(39850400002)(39380400002)(39840400002)(39450400003)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(9170700003)(305945005)(5660300001)(189998001)(50466002)(2906002)(48376002)(498600001)(575784001)(86362001)(104016004)(5003940100001)(8676002)(356003)(54906002)(6306002)(36756003)(50226002)(81166006)(33646002)(4326008)(8936002)(85426001)(47776003)(106466001)(2950100002)(6916009)(6666003)(2351001)(110136004)(38730400002)(230783001)(8656002)(105606002)(53936002)(77096006)(76176999)(50986999);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR03MB168;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; MX:1;
	A:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD025;
	1:sKAfHXt6L88pseAqxBLwiRWUH2qv+NYZ2V49cONU3puUQkP8c2rddO9N9tgBv4ZRG+Z+iU45VJ6nxp3ps79gVM4mpMVsh7JHaoOeq/UToUoH2ZU5ijFGqOikXznqtEb1T8FZVDLtxHAoBJRDHZVJHVmZMu3t+GICFvxkkAKTb6H/WXTtZMmMq9wME60Yv7QBHj9CAxG5EueXfsQT35LUowzitPlNQMUsV1nYn7+gMJ3GD/+DjAOTcGzrOnGXTu7h2QCwlzIsBnPQ7n99FeBgEAeY8FGfawWz/Id1nQUYzapISZXhDe7H4w9yEebNbMrEuWG4jjczeUjS52cSLR+gYvah8yeabUaPKJtk0tK+7nz0wrpGNOvbS/5Z++iCPUDUqyf5cDiQ0uJU6chj/NZ8qGr8GGIW32Q9aGlAWUE/AWOP4SD5fkWshGflH4MGnA6wThi5fZWb5WNN1P+7HybJ/VbOHQ9VDzwXjPbnePpHUDqPldtKnYuG4+qavdDoiMZO0Q1+nkr2nwAOhqYoF82LPPGFmntz5e2lzpQLQ0TAA1rk3F724QT26Yz7Gx6olFr4DDFd8tNX3HHzecXYbou+iU7DzKeh75d+/OwlFoQy+IbM1+HyxahEuik2aLnZ5A7BkzwhxiW1TDsyypGTzU1Ax3ZED0X3/McqZZgn22geMKRTzAs/Tz2ZylTJuy/Zax4om5/ArEpSxRpniLO+TuTJ+vnljupM2NuCDD5COZl1i26gns7D4bWMsAuZ7LPVfSOFYPX9kjAilCMvFSShoF4aYw==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLUPR03MB168:
X-MS-Office365-Filtering-Correlation-Id: 256e7e56-4af1-4717-1304-08d4a1e5626e
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:BLUPR03MB168; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB168;
	3:N/thpw6t0ML9yd/qpuJ+aF7DB7XA6Z8ddfs8gBC7kzflgv82yIJQg+wA2pIMU/ac0EvzZFfv4w6wjEUPZuy9JOX8R7KY5T0XtNo41rU3TH6G/7a6Ft+oLja1lLNvDJOhoWwrvnBZF/n7EDQigi8MO2EJoRXVqfedYMWBodKyk4NkYhi7yXzWgJ73Bqy+JueX+EPBhJVFNI6KK5FydzcMpyFfCZrP9ooBEcQ+2KTA4FFJVJ3VXjuM23XvBRhkDzHVcvapijK6cGFbj6aZqbSnYXyKZfMNC8dtkWvAB5iF4w41n65CP/I5jfM9/IykbqxJ6MvHQ14PVJvmarM+SuyoJgNKxyU667xQCIYC6iqAG01oJHhl6VURWN/JNqYM4VeafXLd8jBt+6ySdMy/dIADlyWtXIEL4WFFj11Ebt6p4lq3SUIRDm4c3aIXPoAsem9Z;
	25:mYt5ZZuDWw67sOpw1hSgKteMDl3QNADlYNyNnxKk5TV+0rJKt97Q3Znk+eH2ECPZ2kj8BQKwWYncDn/LbQTzt3dOfitsMn41gDZis63g5eYbLwWX2rTsQs5kVYwalzWigu6/ZHudWDb3e63tSTQfyRf/xMLjDMjVd0mgku/bh9zcwuHCzMK/BK6inKcdC71vy90eHSwqHusqhMDIzDefNtO3SOha0+Sg9sBaEMZCzAiD5RrFVFlrghkUfp+dKeTbwv+KVpB7/nz8sM9/LJ9rTLN/F7Yb4QzFGWVwoI2ohGfAlUu8CYMI0be797/SeF9pgEtBejGw+u56fn/59p3ijTsxQJfv3y1L+WAQnIz2YP92NrdVKXk582uLOfy4/l1onuOZpf2sfomcJaQPwxR9TFjRlgpfYbFZOg9k0Y17c0nhoeAKp1UKUC3DvHIikSr8BJLecWObfV/p1WXwsAYmNaaCENGHDbpBFcrN0JGcfzU=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB168;
	31:L6Yrlw3c4xz1/QWpt5/hWB8Nx3rHaqDKvKkA3bTErpAWCvD6vmveWHOj4KpEuB4yE0uKut6iGvAS+Yr0xof4BD6ZxjvuGDsW+69mSwIZ5G/OKJdkOsvThOU6rv0WIbIKL1gEu19A8OhEdIT6gNQ9lbXxUkU8vS/7+U9oPEGID4HbABUU6AK9vFXYOUbbP9Z+HX2516EkFlp2zSS/Zi7YtGYAYBWpZMVOvCNYTrsjtXRQKW3o3wX/rCcIFOkKauTo
X-Microsoft-Antispam-PRVS: <BLUPR03MB1682FF7C467D0802156BCA7E9F90@BLUPR03MB168.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(5005006)(13015025)(13017025)(13024025)(13023025)(13018025)(8121501046)(93006095)(93001095)(3002001)(10201501046)(6055026)(6096035)(20161123561025)(20161123563025)(20161123565025)(201703131430075)(201703131433075)(201703131448075)(201703161259150)(201703151042153)(20161123559100)(20161123556025);
	SRVR:BLUPR03MB168; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BLUPR03MB168; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR03MB168;
	4:dfwyrwRANyw44iFWFnHRWbIfe6a9eE4zlZZ5OkD1DLC?=
	=?us-ascii?Q?6F7AEscYTpVGex86e6Qd1RVZOkxRS9LhE7W27+aybkRq0dugTtcZ5x38f0Qy?=
	=?us-ascii?Q?0Qmtv/Y1thEw0oz+mc23200EMUgrQDRnHsSJ66D53veC6BddDk3rpUa+TODr?=
	=?us-ascii?Q?j49a8K58D+6pkO1OujDLElb3t7qIRkHt28dk/ER2CY6njJFcjJiG70hyFPwS?=
	=?us-ascii?Q?wTFMp30jWjTE3M6DxmIEA+hYldMjqTabh63rU7HRyAwZh+t8P2HlthAJXUfc?=
	=?us-ascii?Q?SKkMazjRKPoqL3Cu/5GJGABAi0Kwwi/Pcbo8R2KDgHDuTFHW/pBv4SubXgg+?=
	=?us-ascii?Q?ODkMXohzZpUfXDhZt2ozosy4/jhYMzg87Y0VzM/jQpOybbNpheyookecLHVQ?=
	=?us-ascii?Q?caUSpB0xr5N59v2LBxzmMeRSvX/Qc7wP3AYXdIbcrDp0r0vfEa7aqnOng7ed?=
	=?us-ascii?Q?7UiLKFSzl81lYZl/YtANHSL9HhfQXt0c2a0d1pBZjAKvJZoKfk4nYoMv2b67?=
	=?us-ascii?Q?s86hJm6x1LJDL/LRra7a7QC1PWvPyrDzt3IEZjrB9OKq92JQpeZl+jVodZ80?=
	=?us-ascii?Q?9P7cxpDXImHMQKsiuR/2HUAkyR/UOR5HPNCSZkOUU2CBhehAQpyHLKtdvmJo?=
	=?us-ascii?Q?9f91XTXUBNpdvKipsTr4UN8WOE1rpnU8ITQmkXTnssvNT0VdX56SNAo6la3i?=
	=?us-ascii?Q?J5dOG5JtWwy+lVayzvFvcdVAQdGCJxlOL7Sq8lR2R2SyblkZKMUVANc5k7tT?=
	=?us-ascii?Q?ICgwoPLTARHMNM5mEx2zlsIM+jSlxu2uyrkWTRqHVD99SX7Hua/bBHOLpNTQ?=
	=?us-ascii?Q?Busi85fCybAegUhHpfYf6fE4GYSbravOTOGYC6uGXA49Ltu10Cfedz1Ku1l9?=
	=?us-ascii?Q?I4rrLzXjWfXWJnTT63O9QmjMe6Xo+Llo1xyq4XlbdjvzcWfbbPic9y6vdhou?=
	=?us-ascii?Q?Eblo4pwg184L28qswlxKnPoaDeNmkHNcnag415Q=3D=3D?=
X-Forefront-PRVS: 0316567485
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR03MB168;
	23:oZ2SLWMa7uYvu13o8ICbiafY1u/cU19ggBQ4QfvXYR?=
	=?us-ascii?Q?3LfLk0erzLAsGcCOzgi3mRBgPotcw6MYsQK7NRWtdOH8j4iIRn8IlAZkJOX6?=
	=?us-ascii?Q?WASWjSjYVRcpJV8+v6KKgtnZRQ0uJHWVfwAWug9vVpF94HobUXaOKYp2mKES?=
	=?us-ascii?Q?wRyBjdpBdrGyh+d3poHe3+KcQPy9MFed4K3cSMCX9oC8AsuU/kkLKkH1EJpD?=
	=?us-ascii?Q?FM3MdZcg8Ca8nD0ZINpZdFZJQ4czvgXXmiy3foCgBQDmBK5PX7Qv/VqHHK25?=
	=?us-ascii?Q?L2oWYhYL9WiLDyIzKYpdytCHJs9vqtmXQFAT3kOengiG7HspEctLzWNU6O4y?=
	=?us-ascii?Q?enZZ3TANZ2SffStJXvfpsT+s9rMZZBNtJZ8lAreJqtJ98t5qHifIN7lnf1O+?=
	=?us-ascii?Q?PnAwTocdaZAKN24LvF4O+2D/9Yzp13GlUODMFGbf3pFJtyJNQQW9b7/yLtJd?=
	=?us-ascii?Q?crreLlnBhyxSJJ3iBgGKJAqy0Aq4f1Hfph71Bb5p8dkWw16piDPhN71QRqQ6?=
	=?us-ascii?Q?HTI8BBiQFRIGVzDRk6eTGf8vOLvTjGnhGBaDSHMocy7kxwlsAJrGtalGiqMt?=
	=?us-ascii?Q?jhd34jb2R76VCsFZpCUIjnGlkC3uTAuBcmpfp8LLncJMRgrqfAwJrIHkH5U1?=
	=?us-ascii?Q?G2J0I74FxTIkXnswBEbCCk39BagKqZbQ4RKeYFmAom75jx76p/tgtxr+qXYF?=
	=?us-ascii?Q?j04oa0Ibfm24+6Mi3M0Hz/p2ovXGGm9v8k08qFBHNpsLfxvQEbPaAs6YIZFT?=
	=?us-ascii?Q?URtMLZDqKHdwyaoGyZIsENUo6YIYGEa7Kl7vzACmG9jvjAgtKpis5jKn6XHc?=
	=?us-ascii?Q?qVvBM++goUrypPSnOnTAFNVlrC/MW3EkowXMNYoSP2mljWUTTYtuf4V85KrA?=
	=?us-ascii?Q?c4+jw6JgwFWg1hJegbbfO9waD+5wA4kn99M98Fv3iNVyPPvcWo2GCuqNQM2Y?=
	=?us-ascii?Q?mVt1LsdPUO25HToARARtmnVOyj+DaLazA4EXAQ358dRdNfo0kYMpmPKDjrK+?=
	=?us-ascii?Q?3GGh8ZfKzqS5HOMLjcycQtn50jdoFgCDFH2Mm5OGa6sdlyjJU69XWlYje+vU?=
	=?us-ascii?Q?9IDlWxcu59kNBdFvZqus1CqBF2i1+/BaYtd19cn/83m71uZgGqFzHwUuwjNk?=
	=?us-ascii?Q?1ghsZOLYlf86ddSOyY68DY6n2bEBKOoTK3Xcuuy658bc0viGhDFDSIOx1K93?=
	=?us-ascii?Q?0YnN460nv7MXtuSA+/pPUtW5UDW0vnqVDw8c/v2/xYltw9nBGqYisD8G3IQZ?=
	=?us-ascii?Q?JrfYYZ4FF1OcWgnDRAWRB2lnGKkiB/zbKGfI3jQ1xSeCbj49cOKSw4V+/poC?=
	=?us-ascii?Q?IZZPXQ1yB0nhGvMhXWp0k=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB168;
	6:Xhxmr7M5ySSbXUFWGfX11XEoXJsKjqzWzdvCjKp9tbkS8IUYbQSb8cpLs8lty8gvE3De3UHM0wS9z56AoAqNfG7nUYGj/3meCrGA0BkVNFfITgzBzz6hHo+dXeRtQ+uiISnZ4AJO/dYCLWGa1Ght+5j+Yw+bgu1hmd73fRmzimpgG+ZZzD7NpIlpOWT1qbSiXMgo9YtkDyChtHiEZjCa822pnEhFbAHs0owpiEVM9IX60Hxvnp8EGjowOZaovaLdXpbKTcyjuYb8p3qeWwCx1MGBifyH6Z51IzL7ESjI1q8Dsf8Ac3cFPcnFZgAXsNgIJpxEJj56ReI8IIEtgYxdUasGmCUjhTFo3F3SqUQjiSDGURi/rCQ8BZ52ZKXzgYH8hMoTmo6Vjy5vBxZTqrS6iWK/CG6aDKGkhsCYzBTkVk/PSb6loqqMbGqYvUs146qjOGtgPMgj5WZ8mltN08+6ACGSK8u5dk5XvP+xhRMnBklkrxbpYhW5K8H1MZjJwRW53JS/gke46bffsDfLBJbBDw==;
	5:XW6rQzZOzLhHnKhLfnkKXBGyAs09kOdZ1i0PNw49xZ8E0ZcPWqhSioZOk6wDbHEQnxs0+HVMUQ1XBSAYlPX+/A+451T7UTrSC4k/RMV3DTflazkbjodqCW8AK6yRUDPHGELC+ZpPfWQqFUUWHGGrBoQ6VZgPFdDKZL03Nq8cTsJmXqxAjMzD3z2hu023H+N4;
	24:W5UaZcC2wtRrOopnCGqOlh1kiQYYnZIKMEW1taVLLiNnpZY1d3b72NyqhLFn5nKKILSb7xNCsh35t9P2fq7QP4CiI9xqzszVn7zzvgkq83s=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB168;
	7:SC84CQnmGUCx9sylWO2otbVqT38XtDHySBL0fRHwAdCIVlowDOHgkoJSbcMhsphvvDU/2MYwIVfMwNl+kXoa3qRYNUVvoaqz9AWncVjGsqRPWANXt1nGfVPaqYSi1D4FXLD5jdcUGZawMiE/7zwaZ5+WmOAm2NMdOBRCnMzU05cIhkC55gVexzfpIPO0cpRiZ9dB54A/Yfm6cO4jB1KBj38yFvqh0Iib2J4sXiH8hKbaqRaZ1oyETJyor9VuT4HKEiXdalapcXqesYJjq7Ax/XBu4/YTyaxjuNuBV28Ub17MOVC2PbgBupsW6k1aQU4mdTrE+b8i3bxHEPCT/qUQ1A==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2017 14:09:53.5486 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB168
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [pyro][PATCH 6/6] gstreamer1.0-plugins-bad: Fix memory leak when use a GValue in glupload
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
X-List-Received-Date: Tue, 23 May 2017 14:09:55 -0000
Content-Type: text/plain

This memory leak issue is common.

GValue "targets" should be unset after set to caps
to avoid memory leak.

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...-glupload-fix-memory-leak-when-use-a-GVal.patch | 29 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |  1 +
 2 files changed, 30 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glupload-fix-memory-leak-when-use-a-GVal.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glupload-fix-memory-leak-when-use-a-GVal.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glupload-fix-memory-leak-when-use-a-GVal.patch
new file mode 100755
index 0000000..fa98405
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glupload-fix-memory-leak-when-use-a-GVal.patch
@@ -0,0 +1,29 @@
+From a3988d464c89742cfe8fbbd570eef5e6ab5159ba Mon Sep 17 00:00:00 2001
+From: Haihua Hu <jared.hu@nxp.com>
+Date: Fri, 28 Apr 2017 10:21:31 +0800
+Subject: [PATCH 1/2] glupload: fix memory leak when use a GValue
+
+GValue "targets" should be unset after set to caps
+to avoid memory leak
+
+Upstream-Status: Backport [1.10.5]
+https://bugzilla.gnome.org/show_bug.cgi?id=781876
+---
+ gst-libs/gst/gl/gstglupload.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gst-libs/gst/gl/gstglupload.c b/gst-libs/gst/gl/gstglupload.c
+index f33a696..3ef3b19 100644
+--- a/gst-libs/gst/gl/gstglupload.c
++++ b/gst-libs/gst/gl/gstglupload.c
+@@ -179,6 +179,7 @@ _caps_intersect_texture_target (GstCaps * caps, GstGLTextureTarget target_mask)
+   target = gst_caps_copy (caps);
+   gst_gl_value_set_texture_target_from_mask (&targets, target_mask);
+   gst_caps_set_value (target, "texture-target", &targets);
++  g_value_unset(&targets);
+ 
+   ret = gst_caps_intersect_full (caps, target, GST_CAPS_INTERSECT_FIRST);
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index 91e1a51..68f78ea 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -23,6 +23,7 @@ SRC_URI = " \
     file://0004-player-Add-get-track-number-media-info-API.patch \
     file://0005-player-Add-overlayvideorenderer-video-sink.patch \
     file://0006-gst-player-fix-gst-player-failed-to-load-external-su.patch \
+    file://0007-glupload-fix-memory-leak-when-use-a-GVal.patch \
 "
 SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
 SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"
-- 
1.9.1


