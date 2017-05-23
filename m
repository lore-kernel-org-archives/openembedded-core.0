Return-Path: <carol.zhu@nxp.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0079.outbound.protection.outlook.com [104.47.36.79])
	by mail.openembedded.org (Postfix) with ESMTP id E02A777E8C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 07:50:38 +0000 (UTC)
Received: from BN6PR03CA0040.namprd03.prod.outlook.com (10.175.124.26) by
	BN1PR03MB169.namprd03.prod.outlook.com (10.255.200.142) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.14; Tue, 23 May 2017 07:36:10 +0000
Received: from BN1AFFO11FD034.protection.gbl (2a01:111:f400:7c10::157) by
	BN6PR03CA0040.outlook.office365.com (2603:10b6:404:10c::26) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1101.14 via
	Frontend Transport; Tue, 23 May 2017 07:36:09 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD034.mail.protection.outlook.com (10.58.52.158) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1075.5
	via Frontend Transport; Tue, 23 May 2017 07:36:09 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4N7Zo6i015402; Tue, 23 May 2017 00:36:07 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 May 2017 15:34:23 +0800
Message-ID: <1495524863-28699-7-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1495524863-28699-1-git-send-email-carol.zhu@nxp.com>
References: <1495524863-28699-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131399985693098643;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39380400002)(39400400002)(39840400002)(39860400002)(39410400002)(39850400002)(39450400003)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(9170700003)(81166006)(230783001)(38730400002)(2906002)(5003940100001)(189998001)(305945005)(4326008)(50986999)(5660300001)(8936002)(36756003)(97736004)(50466002)(50226002)(8676002)(48376002)(498600001)(76176999)(53936002)(6306002)(85426001)(356003)(110136004)(86362001)(575784001)(8656002)(105606002)(77096006)(6916009)(2351001)(6666003)(33646002)(106466001)(104016004)(47776003)(2950100002)(54906002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR03MB169;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; MX:1;
	A:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD034;
	1:VF1T3iqVDDfgFULSzZk5dGRm1+T98IYJvL4hFKkVy4peH5qyMCCbOLF/a45+WQEh8qfqd74svpgKjadDxtAelgxpUnqyld6G5TA7Gsyw/9gIzKItSXj64iO0gLLtidLYE9vK66KBowoGVxfQ34OyYgMiaHvuyLh3VKJE4j3ML5dRJVDAotu1rCzvjXglKHb60o4aN/r0s00m2Z+EBKADNcUN+PeBW+PDd2TBXsBSsRdGruD0o7/U01QeiZQrBAg85BJLBN7lgLjftxJBjSWGvyQuh7QBgWHX+vFxShGuJs7V/q6NLKK7t5RCvVI0SVSLRGhMy8adZu6N0n4zJ0HDGt/X996WAIz6mYJgucW866c1wMKZ/BM78CW3m53FSy2xwQ6oG/0SgBmmdHfoKbDKQl6PiKSkPvT4ODX6vvF2YJWXozmfydduNy1gYcEqH9lW9C3AMslwnphsPwWkgSkrIqIv7o/p3Xt+qOgzXFNrh8h9nwS+qXDqI52a7EVus40QWSrNFcmHXxQ58+EOY3yRfLkvj37VsfDIBryA+A1ZHja1OWSlhoZHgjcHi7Mxnimv83oYgOjfvcrm8rfGxnxrf0YeDWHsaaQWpXGUTR6z50xGXHZvfB/yeutt2ElSMGkO+UxsO8mggTpirdVSJvkL6V2XFawL2Ln+iDCcIjnMuLO+RAWQP6nYf7sAs3Htkxq7Va2DOe5uawLBPnOxWl9uAD0hQe/Ptq/URF+Q9v1UGKk816fRIncNYqnIEcp1nwdr3LCkSRgKzAiSUbLpeMGltA==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PR03MB169:
X-MS-Office365-Filtering-Correlation-Id: 99dcf111-8682-4422-bfcf-08d4a1ae612c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:BN1PR03MB169; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB169;
	3:fyjhpIrfhJeKAOpF73Iml5ZNP+e87hPlNSeBodXeWib3ZwhzQVlnIpbmdKhiZEbvoaSxXRKnbfR6yXLWVMMbqEr6cRYqbat5IZcXe6CEKusHrHAxZdCu0YBslU2fjqB+gbNvRwxgX+TcBMqQsioZc6gp+c24X7W4fGym3vMS9pxSltA23zMiD0KBou8cHm8DHnP2bvzdQjDgrsNoe/z6z/P+C5fb+NyAt/SpXBxvadnVBi1zATbhbQYllBz/K6DNXbe/TlrclHKOHWMHok7Y03rqLNoZ/7VVpXVCblqmk81neKZzM0nsqe+zLq+5A5/JF5NJVInHK2WYnlvXBVUCTB5sweEQTOdhW6xGm7tQkqm09n4yTQxnsnsLIONj84NdUcRNM0MdDsGptOZucHTLfNeFb8/J9jl/WHIJaK9V7kuFyKC8PV8C1d565HmyquZz;
	25:nYdS2mE8HXT0gHF7uvxs1wUS5O+pRjE9m7ZQtKqBm0TU08/w/3EJsrs7sCh6+ORjNemLLKggKzuL17VOUwtF9539lb8gA5eKYrodW5P+l8rx7BvD5a4+Dvl4glfiSL5lYRoHKteyh4jBoovjO+fRwDGeN8vbf+x3LdSRr73b35ltPlGFGvipHje0gb0jCZ9esdau/4R7asRbQpkxQL82AvnS9h3BA5HkqTXYDDcGCoEMHJjkpNp25rudpty7SLmkJQHheJDqLuIIotvN/p1hMNKRWh9jTrw2Ty8ZBETuEjO5j+LkZJWAAddVYF0vkSD/Uo3E5VP4HTekPsqV0TO7Ddcc+Z2ZBYPf3GNylXiUKk3fBRWpChHgLl+gvKbOdLQRbhdihCPzjWKo2Zjqn+4ky+rZ5GLp5aoEOTSW6Q3zvN+w//CDIgLZS9TOqYZDer6Nm5Z9QIlFKFmC5wrDIsjZ4T1WU77NCTsvTMXkShto1W4=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB169;
	31:qPe1tWhKAR8nQWVu1+Fy+albnqnJRtfgpX0K+CDri+WuzcLuny8woHJWKwqcB7QMVv4nncwCZUisbRJZQkNAgg3EFONermn0PHs3JS7RIvwMSpZ5UqnN43Fk0dnodGyKYtzlbJGbuj38AaFpE3QgzYoMaSRSRV8oXx85HaRmsV3xAYHuBxryZ/CVpYdgZYeAcRhyTnYykzebnhhbyC5/zJ/YwFQvjX4iHCpN50hD1iR15TbrKXNNAxKXwwNWYL1x
X-Microsoft-Antispam-PRVS: <BN1PR03MB169AF0D443CD4F12DCE19B2E9F90@BN1PR03MB169.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(13017025)(13015025)(13023025)(13018025)(13024025)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(6055026)(6096035)(201703131430075)(201703131448075)(201703131433075)(201703161259150)(201703151042153)(20161123561025)(20161123565025)(20161123559100)(20161123556025)(20161123563025);
	SRVR:BN1PR03MB169; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BN1PR03MB169; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1PR03MB169;
	4:xrBEU1soc5TpY+tbyuyE4R0DwCLcsZbxCcODJkZqUq4?=
	=?us-ascii?Q?p6mHMx7kDWR2Mauf36+NUEw4cuNeOWnzrOmy9RK63nJ4kxkXALwLx6EpzAwe?=
	=?us-ascii?Q?bu1is472ZputRUVgupMo5v4IgpDxToABQRUbOiCpRsXzMtfQF2mUKGskJ9FA?=
	=?us-ascii?Q?cApHvGQI6rXczPLT2jMlWM1g7B1l8wfeByvL/Mt+5CydONcnFvy1VXucliXh?=
	=?us-ascii?Q?ueNS+zs9ae4SP8HSEUF+f6alhzrsqNn2WJTQshcuIYvx5K45NeLuCg0rfRtM?=
	=?us-ascii?Q?LRWx0jxkUGk3BZfEdjBvF4v32ZfjYEGm28IL0fZGcCn7f6ubAhPD1zc8SIhU?=
	=?us-ascii?Q?7rn4LSFPxZr4QD8yeKAxb7dJZGRXzfOuoV+/mVTYx8f8XlCbHsRpG9cFRC9z?=
	=?us-ascii?Q?wmvuEsPScgKYdI6JCh90vDHF4sMPLrlq7luBa+GNAJX96aERo9Vg0hyepVpx?=
	=?us-ascii?Q?zMgPRTM63OJOup98Ma2wPCM7BozXhGTZcnEjcg+bE+7yiwt3Th5kn1401hZj?=
	=?us-ascii?Q?pw20sh2ES71yrSOlm83w5Lq1TyKXjohdXV1nHjY7IRcZ2xiw3WTEYKCw8Y8g?=
	=?us-ascii?Q?EwIoST+Zze05pC1Zgg6jYjZGFkeoKk7CZaqXbLnmeQM3NcqIg/JiZ+vA0Fq6?=
	=?us-ascii?Q?tbregnRx73DPC5DGWdwyhDo3tp20jOLozRGG5ciN3bukyBCkYuoL5yXIQY8y?=
	=?us-ascii?Q?1o44/pps5dhBccBhMEnV6GnX3qHG5Hx2ouJrt4zOxfIk+zOntAc3KJgXZnmv?=
	=?us-ascii?Q?eo3F5qE9FPRFr+vU21q7IY3fLI5MrIdnM1dAv1WPmupRH55R3jOHsj076Kp1?=
	=?us-ascii?Q?e4XonNuiYgVf0JYTtP6sFYe8CN1kAzsX/8UBhU0BUPuq74Ezo/E+f6Drtvjv?=
	=?us-ascii?Q?OJLl8TxGv0JAVhZ8sQVpMLOBI1hgz6r52R6rev97og3kytrRCWsP4PcrWTMW?=
	=?us-ascii?Q?Okjg7MDznUDObjMnwEgyGkVRmpM1LwwK6NIrdLQ=3D=3D?=
X-Forefront-PRVS: 0316567485
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1PR03MB169;
	23:7Dpoz5PLKNI/BwVZQkMa4Y9LcUkXzcN/+M5TwTbeAY?=
	=?us-ascii?Q?ObK/ycKsTOnpp2X2HU9hvDV0JKK8moYQenwsKHvXOk8gQLtfjA/U5CzONqWr?=
	=?us-ascii?Q?fk4Xyh6HWzq++X9iIzJf706dMFUvBPkr0nhvU2lE+i3XuXqqLqRqQIPD/RK5?=
	=?us-ascii?Q?XW7H0uh2GnY8EmXFBC0UqetD8wSC7EeFSlM846ejAZRoYFsKz6r8ZvsAEqma?=
	=?us-ascii?Q?6FHMk7nQaWNqIrbmDtoBnJubnG+RpnfuN4j4paZG9wVyi6dXIlD7n9+21cys?=
	=?us-ascii?Q?f/W3K4M5r0NA2VwPzgslVkrSo5xPhlm8atxwZj0Bwuz7jjioh0T7IepOMt0x?=
	=?us-ascii?Q?lWwOcJ4D0obBzDtPYOp48jTK0Gmu2jEsDdDbEYgJy6IZMUiE2dXHp43c+Xgv?=
	=?us-ascii?Q?TuOCIaP1LTTCUXgiOIX8YFtaT8RVi8k6SLQW52Dgaiavcle7genvMoetyOLI?=
	=?us-ascii?Q?QVbFc9poyuQ6jVXyflHJoCKPhiQRxZ1gAJTjVTt3q3/5DZehgi1cJJEgAk1h?=
	=?us-ascii?Q?ooE5VMEMRGBBZ6ZvMLuBVrUPk55wpQMvH/Nv8D6Q/c2PCdhE0ujSaYMMYfIz?=
	=?us-ascii?Q?dV89EIYlSz8HCi4klxx2rKcehIf787tSmHESkCzMvT1qYuisu7YaAvxXKXvL?=
	=?us-ascii?Q?HWbY77jvizzDsxHlY7aLKyPxFzuHwyN/19Q6nYJmBwBAMfRDxBqdXDET7jcM?=
	=?us-ascii?Q?lpX77ieN9R5QL7tn4SMcD89xNE53P1ZLVcuk+BDA33u54mTqZzJULSip6jJb?=
	=?us-ascii?Q?9cYyS/9rFtrDfSQo7cD/zU2lCMUfNaff5WNo8tGy7n4lK4zMBDWRW7P+7wM+?=
	=?us-ascii?Q?ki0Hg1IN9tZ8wZRMoNjcALQtWZTg/u2YSD/u1Ra8SyFZEhguXWmu1sngR6AS?=
	=?us-ascii?Q?A+ssMXiXh0T/E0lSxJAsTDEd2HT3BEW2MPmLHbJkWiPG3uOEzxywk28AapUJ?=
	=?us-ascii?Q?EArqyfk5NXmiXrv2gk0sTA+9quXDWJPoZlo8ZN74FL71iBQslrNzrePWrp5w?=
	=?us-ascii?Q?suqa0sUoXyzRpQCq8gPBwTGUmiTpmw4fVJuufHW2zwb0bAytOphw2RTks6Ba?=
	=?us-ascii?Q?mMckHHYP61o+bWTuUNyrZKp2+TuBImGF+t3bCPLwr2mS/T9WATgaJRLKY35V?=
	=?us-ascii?Q?vxshC2XdcVxBX2eq1zZb3T+A/TqiLyv2hktkQ1zO3rLqjLdeGRmJn3Nuqswz?=
	=?us-ascii?Q?pWwzeusducxrKdG334282br6pnvLAgrb4ssOwDapFUalAzSLiBtOC5aoQzFA?=
	=?us-ascii?Q?naEbJq9zzXxoXtjR2VJYyFXnA/zYk9QeEZ8dZPrFSAMfk2CzlyQjvCBmgY4q?=
	=?us-ascii?Q?Nj/JGzOiStJDs4ydWzj6hWOWW0vKRPotjTXg9dhbHe?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB169;
	6:bopTWpjO78C0LDcW/NPwwkBy0kGAYm01L5i1MKZx2ImrCAbOFBuXIf7n0dqIsSvvY9cC8idFET9Q4Kfk/3Yy7ABrvvlN/kb1FiIumZpxk6+41T02CUu8J8lcHQZrASAiiAkuyBR0TQyJy1k0xxNmuuAjhbnhBgek9wFj+NsO9oRGqP870/PVZEVDhn4yypX/GRIbq0kvCI4J2mq/aTN7ilVEpKkSQp1Lg2/ASSR7U32JVvDM4A1dR53fUSsa7yZoGVeHnqNcGXNuBGXFmQEv/LyUXQ4D/cBpajj5FtC+DSimXAeasj01y3YzJGdH7WW8mGlWEPC6AM0AsZ5CsQuQC2m+t8cF/ROo6fwFqbRiVKY8lCBwrxcy/38Omu+0/UzWoTIS+ymVCFqvUKCYR0r8v594dlFwZpUKj7JOFTrDjMAh0YdZ6diIxHNOBSHz9+7g9TWkLJBDkjEQZqtROrrD/+PasAA0MjwNV3l0UN1xef5lqheFkaZXxdltjbR/Jnak;
	5:vKG36qqFMpZxqTk646kZr7xAu7xZO6qVbLCUyj456GBWrtJV7Sh8I9jCg4y/DQwrWrzkK02W+fZV4kVsyAJyKwAFD3TeQ7IibWzV9+SaE816W/l8GUK40Z96y7chiCkxbMHM6Fzb720JOyugv7cYTK96aCebpCT+E8OtzfnIL5icbFs9ASBAsm//TTvblcq4;
	24:GZUgqJWW2kINTFy8k4+9SV0KiHfy51ENZRlKoRiXcnNOwf1ti6gQeB+Vd7q9uqhJwee6uQ38go7/U66mZxp22shKVhTtKmUVecmV9+bED+c=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB169;
	7:kEfXUQOtPaGHHi0nW23NPWKIc0o9cIz+iIEWVxkr5lIScXX35C86itwikaxBqQYqldu+UR2SsN1sY8sUgfvbuDSxIa2O4dBIMfVAFm2HViYFB2szU6kOGod0u/ZJgkUH5VKGV/1eVHsFFl5tXeCfnDHWWhgIHZicKk0D3DELB78hODpRRh7glrHnJ6Cm7LjVgPuGeohCMYQpw/kk2opG6C8pLH1Hrq9NXzkMnN8gJwgCnN3PpcZeEu0SnTY45xzeaNOoJ3BJoNPume3Ptc+M5GJB1fs+G6YqTWQPNz18+sLbiJW7YzsyUKWtSaukq6ynmh07p8U1rarhIsfNthiITg==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2017 07:36:09.1070 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR03MB169
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH v2 6/6] gstreamer1.0-plugins-bad: Fix memory leak when use a GValue in glupload
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
X-List-Received-Date: Tue, 23 May 2017 07:50:39 -0000
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


