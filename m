Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 11990 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 03 Mar 2017 11:52:27 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0080.outbound.protection.outlook.com [104.47.34.80])
	by mail.openembedded.org (Postfix) with ESMTP id 272407768D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 11:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=la+G0nadgLNfPWwitzYfrzVyZE+bcBKmM0vKY/z4BpU=;
	b=tZO49KGNewCsvf3ezMee+YaILn6s1Do6g0HxacwpfUMUar5PCKbhrQcgpzJCZTssNi/Ukb8UE2xyAnM/9R5I0kZoZ5dht3eX7fdfhY8qNY8uPzf9pKPNy2gRnjYAR9N6hEZsSzevzdKIq3EFNP0S6NBUD60dgR0jkho5qIX6V1M=
Received: from DM5PR02CA0063.namprd02.prod.outlook.com (10.168.192.25) by
	DM2PR02MB1388.namprd02.prod.outlook.com (10.161.143.145) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.933.12; Fri, 3 Mar 2017 08:17:37 +0000
Received: from SN1NAM02FT033.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::201) by DM5PR02CA0063.outlook.office365.com
	(2603:10b6:3:39::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.947.12 via
	Frontend Transport; Fri, 3 Mar 2017 08:17:37 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT033.mail.protection.outlook.com (10.152.72.133) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.933.11
	via Frontend Transport; Fri, 3 Mar 2017 08:17:37 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1cjiPA-0004et-CM for openembedded-core@lists.openembedded.org;
	Fri, 03 Mar 2017 00:17:36 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1cjiPA-0004dP-8f for openembedded-core@lists.openembedded.org;
	Fri, 03 Mar 2017 00:17:36 -0800
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v2382mFl003473; Fri, 3 Mar 2017 00:02:49 -0800
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1cjiAq-00008I-OZ; Fri, 03 Mar 2017 00:02:48 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Mar 2017 23:59:10 -0800
Message-ID: <1488527950-10906-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-22918.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(39410400002)(39850400002)(39840400002)(39860400002)(39450400003)(2980300002)(438002)(199003)(189002)(9170700003)(5003940100001)(36756003)(5660300001)(189998001)(38730400002)(110136004)(2906002)(36386004)(63266004)(626004)(8676002)(2351001)(92566002)(106466001)(6666003)(6916009)(50466002)(81166006)(77096006)(305945005)(33646002)(107886003)(50986999)(48376002)(356003)(450100001)(4326008)(9786002)(47776003)(8936002)(50226002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR02MB1388; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; MLV:sfv; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT033;
	1:SYsR7Kehm9IXcCusYzycMt+pDmEpWbTFCio5hhpdINUjPY8PZGAdIFCgaeXZ3UOUbMVKspGm3+/PrKww6yP9QipS7564F4+/P+hkTLLjHgmm0Wb3MBhlqZeL4zx/koZL0DsLC6fZIXGyLsEqUezXYwmtCGSya4LdF6F6CYQo/Foc6GcS6kzQa2Gp3weDnHSyF5mapdod2kHatu9mdqj5hxO+f1WBG9s2xrU1LB7E3ZjZVAsdMb22lmR/AVfX76vy1ty3+POi/6mNiW14riJT23eYM86WdI3gjW8iJgJEfXSVP246j68oty9Xxuy+OgGasH05GfphkbAx+4VQyh9n1v4c3mIrOW0mJDg3G/yNt/TqEahBqOB0bCe6USXHq9funZSOu6XF1Uu5L0Z2bmdNXabdq20F+kVix8x2hHEBaIapQXHFWKjawVk1JkuUFjUzn73M8/34jDO/lbby31WXQblx/LAeuxiFvEEmniN1Bq7YxgsOmnTGSt5txEhNWqJ/TBxFXyAEDJBQ/yoaPN9JSI4qKpsskf2PrY54M1kCWsc=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: b7b9645b-244c-4983-b66e-08d4620dc0af
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:DM2PR02MB1388; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1388;
	3:TtI/HI1WpbG1EEDjkUf9D1qSbodDt4Tt0M2/br+KfU7TknyMcYnSGv7uZaM0XUpvXQcjRuHGrP9pAqpwEkRcePeIusu5fL06gVo1CPnYAG1BOgj3TXJxpBKcibuYlYc/qwR+S4t4GSVU2RRgIDAnnNhJcBVYUlVDe+WHAgku3Ww7Ei0/Wprfm314ajQ8qRuoIvPycSjL+ZJ++hHW17CkGDdhMh6H7Cz1cM0qSUzbQ5qJUtg0rT7LqwWBDiKwkbV2NBCTznW5KkO8utkgyyT5+77Dgzqwa/4pHQSHU/MPVa9/fgIq/AXJ41Kv/UaPuL+CPa3k4/VGlm8MHM7dCr5lRwRj2NRZk/Gikt5kr12dJ7Qpgup/a6Wrvn8lQ9kwJ6bf4yZtrlL20+TlKJogbEun3Q==;
	25:8E9QBJi97qmkrpJxaQIYWVvcDF3RUdTqtE37cI0H1IDyfP5Zvvx2T8uH7O7Vjjg1IyE8GVYLS9Uo+azoUKMxplRIhEdHPQCaNIAzZbXuIlSKm3TgzanrjIO4790O5VI10No5ZssRUuNV39sclgv4Wup6LdvuKOABMh8JjUQDdCei30MAyN+L1Cya4LdmszpjDAAPodI+KmlafSuBY6ZdJXfLlOY3B7PjSiRBBHv6kNcZ20nevVMFuTilHTpLlm0QGxIYypiYmoB8Q/iDx+FSF6m+AmLPUNXm+H4vRJKtCD6by4sgO490zFJwvmmHQqtzygmD3pToKPx5M3ME+ppRCG1KhN0xJyWNPBejgd5ugCiOHtgP7i+tLXJtW1tqs1gVu/lrKmj37tnxFlavTHmSVmP7AI5bpQnGgAbfdNZpVhhU4DzEoWCherX96XNfv7YdxQoyz28mLGFSFHYPWVFQtw==
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1388;
	31:FrqUQjbhtFzG/HHCZuS80AH2EDUrQM2165objdVPbPp7wek5ykxU2M5lzKHmiwCk6ibDTpikNxITuDTw4TpbXWP/EBVjMtdGZqwdqr+cqrPBRKQ01ntu0Erq0yq4MngxyxsMAN3Nvvh6Hi3fKYlxgNceqg0CWM6++HWAXF7pnDl0cZ4j6d0xN7Jcjz+DSPhQNBVbOoqK9vRp17cDyB/gSom/RmeDrVV8d6J7UAys18r9aCQyShwHj+rJYLHxaIxPoWoGkirckaV3En3mrcK0Dg==;
	20:0nCY4rDHk/sD1x1lW8XIXbJcEZ/8w0ebOnX2OuYEl5t1rpzXgn8qy24RZsJy5Z3bXyc2VlQ98NDQaDYzc2GyinTKJZEOaMbQQ+D3mV/UkZm4HqFnF/nlWTIJrU3J7HxWdS8msYmrDwhLVU9V46WvwP5zeVRffik81sN0d7WZNZfEIIGSb0DB7Qb3bnVbeaYMmNQ3Y+slHr8zsRGEoLDKRkKZp2f6j9ablBt0Y6x8JrKAWgINTBPmjkNErGPb8qUcXkL0XgJF+XkNPAgd/FhJw3nqvqHK5Ego1qDnXiIsljXWp3o+bgs0ggBhHXi6IUEdgGrCZkLz+X5LJI8RywCr0kb87L090Da9I0U5FkpHo977wxuwRvvgC7G2jQegCzb39DWhVDc3UUcKJ+Qf+kzMrz/vLcIxFZJqQXk2h7O+ufRp5ik8Rsbkh2YBzfy4XqqgpInezp+oTLgEdSKAKQB1Ojt4t38umwQg16Qflj8+8ov1cBEJx3F8r3b0b2JxhLLK
X-Microsoft-Antispam-PRVS: <DM2PR02MB1388D21E04D9CA454B3A6A7CB92B0@DM2PR02MB1388.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(13015025)(13017025)(13023025)(13024025)(13018025)(8121501046)(5005006)(3002001)(10201501046)(6055026)(6041248)(20161123555025)(20161123558025)(20161123560025)(20161123564025)(20161123562025)(6072148);
	SRVR:DM2PR02MB1388; BCL:0; PCL:0; RULEID:; SRVR:DM2PR02MB1388; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1388;
	4:o8xr/ssfbF9nkRyZj9qBGYjQDkDwrgqr66KxPiLgAzeXh8THSZsBCB9Nptznon9WVVgZWmiey3ildxJhG794WByqFT2ULhqJ8a1f3vPEdOVXFnFcQ1F4iz2w+M9FE4IAhacBI/ZMtFSrfBItnjpCQBMmQ+q2vW5FMb54KlX+YTr3aMG/HK1OUfiyJuO8r8WJbwc2412epeTdT/N2jQjYfP5Sq0NhGlwehzBltJnDi2Sye8LI7BLjK5QdiUKL0dEf5d6c/TSkdFFGu34Y7a6b6JHPUedKYQwv12JrtBPs5G6wjovJhGaNyOGcHPxqNegyBiK+mpgg9UD7Qb8bSalpbEehc1LgSqe979l2kJC4Bb6U3SKIEmM5Mr0zzTzBcnCdB+ILd4OxSR75aT9NOEwuqCiACeefurWmj2oJtrKMaPKphwdVHv04IqHX7Hi0IKGCY2IQiRxU+QPjiKDkr6r2P0GU5VZNDrQ5WODQA4WugGKj8+qawRbrKmLE2h+dbCzphd/tdtCKlVY6u4whVggV9vpxM4I35vbm6clBQGaDJFV86F1Mb+SPiEWBopFQeXlZpFyAzF7WHaMtNM0Jh2cdMVq9rLUvwvHzKzow3QUScTVNj3gMesN3SzMyhXLiX5WCPBPc78kxzBSGCxsCK0JK4dNYhHiMVrF7rgb4aoJJm4d4pmeJoRtBG45wcGD4usWMTcjbJr6r5crQB2VzLhfZtJizXmzVBLsK2XfFpIWsHdqun2PSS8NCL7qf+qUPaThB9A4rpuahD8mFYhtPo/mLQw==
X-Forefront-PRVS: 0235CBE7D0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR02MB1388;
	23:g7+7ocKfMkB1tZH4PVee1hRCxuhagpPUlaCCrToi9?=
	=?us-ascii?Q?srx+RpzLyZvIpRus5kvCKcoGR4chWmBF6+SjTuPQJv4kwYoSmsT9yEr30hgM?=
	=?us-ascii?Q?l++WPzh7LiEhMHnS4QufqOWVopfqH/f8NufwVz7k7d9gvT5FSVG1rMEV5lQr?=
	=?us-ascii?Q?8+4SW4a1LbtlIZa+J9TREC3KM13SeUVhGlgmcAMufQByYN4Kxwn+Hl0huQVn?=
	=?us-ascii?Q?Z3SvYhsXwVCSS4y1/1/O/bRZVezfsjihaPTI1HNHPqP4dlQrQtZ6yc20CdN4?=
	=?us-ascii?Q?CYn5MJEGWgTiAF6ZcUwKbtkLPjywXw1o+WUG9p5r9f0g/Z90srhfGBPiIgcC?=
	=?us-ascii?Q?CG8jsy7uifeyqsT8aPvhpFccivgYyIGthcxw4hDhwAIogdiYG1fhoeYin5PI?=
	=?us-ascii?Q?5lR0MtayJuk3E8DEDXuZK/hlp0y/766gZ3i+3N8olFeayiH5cr5OP7+0c9Se?=
	=?us-ascii?Q?v+sO4NYQIpCUvNfBF0Hsw9htd3Fo9JIPijMD8YI5sUcoFhobbVQabhzd1Lui?=
	=?us-ascii?Q?oBa85N1Bhq3O7HnkV2NHbMk1yfIOi7Xv36rbjqzW0bMjcC8X9WZkPGoTTm77?=
	=?us-ascii?Q?OkNlCGEObR1IANFGL6Q94xVroWlCOkSe8FcTueo6ByX+ytx9VBUHoYVc7T+9?=
	=?us-ascii?Q?wB9Gz3Zvy4F4MozMnJD1IhaujQR55XuqLUJbaaTfkZYscuiRQfZcLuxp4VQm?=
	=?us-ascii?Q?RmBC+SKooc5Y7jDfP7APy9Pq9U83mmwmgZnAmaqqs/Y87VTucwv2/g+4q3B+?=
	=?us-ascii?Q?+JEaxrqO7sRaIFJAaHZg61WUvMAWs/dTgyxkgCrDH9D3C1uDV76spKh8lzP+?=
	=?us-ascii?Q?xMntgBrrM/caOLuMo6UmA6+CmvGjOVAubYX4nv0yzlNmw5/KaDUUlYQz/lGK?=
	=?us-ascii?Q?k3LqHO2D6kfPbGz2tJN/frAYsFv8zSKT0by0Ew0hZB18Gf+R5fEXIK5GXxR7?=
	=?us-ascii?Q?IPV4k0VCamh9MaO+dawA8gjJjGlQD+q1PGlXhnSQNSVPtznM4QA+7QMzHvtH?=
	=?us-ascii?Q?Dpzf1Pe0DUkxP7wlW2A2cTRhol6Nq1r+iDONiStwUaMhENG4FWxGjEIEtGCh?=
	=?us-ascii?Q?ecBPJPV1IIAJhU2nlMHQ1OABCGHXNrbdSRGSF5tMErIWyrE2A=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1388;
	6:kq80hKYyM8qI31eHnCGh5x9p67/h9HWRW4mdC3CgU6C0sumJHZ1KvSvyu1FxnrIG3+oB1zHg4rIPhwBQseyGjzY7Uupe/FIwsK1133LYLA1y+HqioJbBBnzuosiO8nih4zrDW6u5GGhSW/mrgXZd9COvcQn47DlwnCMQxfvlkd0aIll1rD5dm8qHIZj2bqCho92zhzlJVbgLvix4hIZzs9WyLrDnReGMW3o7u2IdQ1ymtSv1MCh5FTQhxyeLJ3e5gaqgtIn5ODQdbSV7Hy0BftQ5ZMbCY0T4Z/a2VpuT5+TSyCddcod1jy+JUeI1tPRpB1i17yf1driXw90G1sU9TPuavbwLHeJplATqFFhhie5VQmDEzr+g7dgY1Hgz1UwMEGl3tvrJ8W/ERaWvLFYIFqu6yWk/gSYk824yBMMTf5Q=;
	5:KlW18GIlSPDfJV3zStcbiyJBDsdoZjpzD+knBe2BLE1fKLGq2qDQTz+dcxXRG6sfOZPklTV1PqynHkWBUHy1wYW/vfscqoSkF1irLeaH03SSDemN+/OsN0z+lc+4KFMos2vyaJyuQ+H4NEtgVxT91w==;
	24:MtIdlsf6rnRtxgUOO2G11TbItmqCvA3emHlMPZcZRLXq9u2BGSKDkyy/NY1g+j0Mva/ZULOtgVXFqA1v8v1iyNTN7UsWqmWpP43DyCaoL9A=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1388;
	7:hYDIFstSa5ar83wr9CpWwRCeLAwqhZDeaGFq7/nYjjlIaIMCHIhbAMXnP1otrazwA1gvlLESDLbeold7hZAflppafu3pkCIR/1EsP8bEALbW37+p/mz+ykTDOTqqMtKji4AVmIvrCq+yoPsdQLwd54RNG1lRU1EkwPcrF6vB+j4g6qhz5Leq9w4hzdfTzhIfY13YOQosE69HbzTPqTkaHd5OUMR3BGGILBYXIefuNiTxbfQntdqO+EJHfYVG+mbHfoUn1mqUzy7c6GtnzVQmTDu4mByG1ZFzKOFxzZvEgntkCqAYWgwbIfGplkdUgXPF4Zwuk6P8k/nvzx5DiLFpRA==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2017 08:17:37.1670 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR02MB1388
Subject: [PATCH] perf.bb: Fix dependency while building kernel using externalsrc
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
X-List-Received-Date: Fri, 03 Mar 2017 11:52:28 -0000
Content-Type: text/plain

Having dependency on do_patch will fail while building kernel using
externalsrc. Depend on do_configure instead of do_patch to bypass the
compilation error.

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta/classes/kernelsrc.bbclass   | 2 +-
 meta/recipes-kernel/perf/perf.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernelsrc.bbclass b/meta/classes/kernelsrc.bbclass
index 675d40e..35cf49e 100644
--- a/meta/classes/kernelsrc.bbclass
+++ b/meta/classes/kernelsrc.bbclass
@@ -1,7 +1,7 @@
 S = "${STAGING_KERNEL_DIR}"
 deltask do_fetch
 deltask do_unpack
-do_patch[depends] += "virtual/kernel:do_patch"
+do_patch[depends] += "virtual/kernel:do_configure"
 do_patch[noexec] = "1"
 do_package[depends] += "virtual/kernel:do_populate_sysroot"
 KERNEL_VERSION = "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR}")}"
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index ffaa5f6..b13f8e4 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -45,7 +45,7 @@ export PYTHON_SITEPACKAGES_DIR
 #kernel 3.1+ supports WERROR to disable warnings as errors
 export WERROR = "0"
 
-do_populate_lic[depends] += "virtual/kernel:do_patch"
+do_populate_lic[depends] += "virtual/kernel:do_configure"
 
 # needed for building the tools/perf Perl binding
 inherit perlnative cpan-base
-- 
2.7.4


