Return-Path: <carol.zhu@nxp.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0088.outbound.protection.outlook.com [104.47.32.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3ECE072F67
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 14:09:47 +0000 (UTC)
Received: from BN6PR03CA0067.namprd03.prod.outlook.com (10.173.137.29) by
	BY1PR0301MB0902.namprd03.prod.outlook.com (10.160.195.141) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1101.14;
	Tue, 23 May 2017 14:09:48 +0000
Received: from BN1AFFO11FD009.protection.gbl (2a01:111:f400:7c10::181) by
	BN6PR03CA0067.outlook.office365.com (2603:10b6:404:4c::29) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1101.14 via
	Frontend Transport; Tue, 23 May 2017 14:09:48 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD009.mail.protection.outlook.com (10.58.52.69) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1075.5
	via Frontend Transport; Tue, 23 May 2017 14:09:48 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4NE9YgW029059; Tue, 23 May 2017 07:09:46 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 May 2017 22:08:06 +0800
Message-ID: <1495548488-12280-5-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1495548488-12280-1-git-send-email-carol.zhu@nxp.com>
References: <1495548488-12280-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131400221884665104;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39850400002)(39410400002)(39400400002)(39380400002)(39840400002)(39450400003)(39860400002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(9170700003)(8936002)(104016004)(230783001)(36756003)(5660300001)(50226002)(85426001)(77096006)(81166006)(4326008)(498600001)(305945005)(5003940100001)(189998001)(8656002)(76176999)(50986999)(47776003)(6306002)(54906002)(86362001)(2351001)(6666003)(50466002)(356003)(48376002)(106466001)(6916009)(8676002)(33646002)(2906002)(575784001)(105606002)(110136004)(38730400002)(53936002)(2950100002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR0301MB0902;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; MX:1;
	A:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD009;
	1:EZdCBTWDBHb3REIZneh5o93uFhi6G27ACE8flSWPyJ+hokZt3ha+n2ZsIzRxr2vg4QJETJGhYUS/qhuJaRyaJkqiOYUiysoRbgkLg//nLNnLFsHpYgo8OxajSnSInun3FpmSia6N5XCmL3h5o+3iFZp51wc/GmAEhyYCt2GHBgJe4OFAqWiC/lzPR1/kvj2LV2ZnB4Qong/M1adcHVn+CTafQO+uG0kXjY6haC53DXKXFwMQ9FGgO7w8HeL6xpXUP4qoejxzrHO4U0etomb0hyYPV8yLfzH0Yz2UcAOpY+56LcGifyL2ho21sU5MI6g7Teg8elif5ewcdfGxD45onendhP5ILuzQTOyLJVWllREZXjd0bhcqHiDrJssgJh/P15nydLLop39mDjqhVPR2dwWWggtFAVuGn7CzH8IdPrgjQ+Mpsr/58uG3NuqcGKMwHrGx1h38890nKCd6uFqYDwNFZBMQNWSDPzBGM1par3PMRFVbl4QmCi+y3pzbPv3zS2zKhmJOp3NV14lzXRPWoE5Zy4fAHgiTb6QCzrcUw4vUgHG6iOp0LVdNPUiOeU8m+TYynTlv8L9oopfqVFUWG9ILYYJLYQfdY9bjI1D6o/frXp9o4pER1zUX1GcoWPHMLYkmlNLDn/i3zGGM4MiSzR5rT+P9y420oPcOxviUCWQ2zxr41udB3YlMJvzyoYQg4IlVBOqIRrbEF5d55uGoZNPd9f9yUJgpPIdb4Zp60Jp9qmsx2pX+N/7AGARu/XKB2NSf2PK/b5DVyonpHroqPw==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR0301MB0902:
X-MS-Office365-Filtering-Correlation-Id: a62fd600-907f-4975-6baf-08d4a1e55f4c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:BY1PR0301MB0902; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB0902;
	3:JthlP61K2LpFskHBfyGKQsh0Pbvd0xLW9aX52t+1QmD6bZGu/h9YWw9yz7RW5nJl1d6yK6cRWSLqvGwyICVoMVWDTevmHTwYryr9doxpbGtyz5hpspBlTtxbredo8kLYc46M/qIJ076G7XOZ7GG+xWxW6VRWlou/+8NuWfP4PGC0PpAOgubfxmxEj9ukUgb5n5777GKVolqJcpMjB9zwO+88b4xidHMqNf+1zVntYtvM18W0jpy02hCGobdaXYh9HyDz6Nh4Jid6TEf3smUvTmuhZxL7B2ftl7FnL2ClxgSJ8oBWWTyyuC70HPsbLaLk6JfDjCt0YitfDaBUtWBIwM4kh7FRlf3xo/zfOoCs71rIb6U4uwiCAuHdsSDP6wO7XU7mxc6LVOufLJJYBWyqHVNaIHpl40kdRDV9bElqGBioZDjtlDCPI2tVsWn7jCbn;
	25:N3F8onnJatlqEAGn4PEKD4dbLqs2HmfSE4iAIo44ub5HDLum6VaCHgo0rp2CAPP+oi+4kqmUR/Kf1iTOnbRIKgHdGfOFs+p1ycM76N5QjhLfyhJR3xizYhhp8SMyZPGRSTk4FRGY8Y7BcNKj/ueQEBSOSuT9YQPHiZ7KX7yTLw+2Fqouk2qtnZYXgahUiUKzshAh3bmGYvB3BBwveuIpr9Rgb6lA0VblRLzsmgFw3plalMJbrmbSMK/iWoc3cdwzI976fWi4TOxkAsLF0vjwLXFFFbMdQZ1Pw6vZ/2mA3lXAfrYcpRqUxPygU4u/rrtLRnBjbgWEIcv8mIaXwNCVIsDZlI7pqj8K/2om5IRgl6za9PWay469mEwCkgPVKVpcKvn0nL65pe4GGW4+asNt29C904sY3BMBTi0enpgeUv9bR2LI+Gjp6Ei8jye/y5tP+KQr6TcsP7bTZW5/lOu8fnKyVDsizFJPnxO1WtmbJO8=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB0902;
	31:vYqsl/Tbrw197gWUdDV7946m9go0yF5cuhHjg9QtkxzZaZTwq6URfvheAsPmYlMGApB7o4FeFDXP+IW2R+Tx04PehDJhd5XR4Sh+f0/EiBDHYXbUjpBmlVqSjmigbh38dzP6fgIMMTGgtX+Uli1y0EmRG9p2CIc2W6RD8ottK8q1o4Tpiy0rpZ7neG5x0J7+nkBuih1FK/eCVT+jvILryJdKf232XIqmcDV4dQQIa7U3Zc/MTt7VPkmKNG0FhQSp
X-Microsoft-Antispam-PRVS: <BY1PR0301MB0902F2FF9BD1E082B9D3EB9AE9F90@BY1PR0301MB0902.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(13024025)(8121501046)(13017025)(13015025)(13023025)(5005006)(13018025)(3002001)(10201501046)(93006095)(93001095)(6055026)(6096035)(201703131430075)(201703131433075)(201703131441075)(201703131448075)(201703161259150)(20161123561025)(20161123556025)(20161123565025)(20161123559100)(20161123563025);
	SRVR:BY1PR0301MB0902; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BY1PR0301MB0902; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB0902;
	4:FAT0V86RS0Rx69jz7p5GTEWt3gQf54eHmEm8jVz9?=
	=?us-ascii?Q?9teiX655g3Ldcpxdf/u/QyzssG5UY0bi+uQMmUgAfddxk9SscsfVb+hdVFRm?=
	=?us-ascii?Q?4gMK2Wikb+xgYEmrZxGZ3Vow5AJe6ui1dMcupo6IQ7JHJ/LDk8BqUaeeNcKP?=
	=?us-ascii?Q?w0BJQTnyznMnclCN/NgsM+RjFh24kq5f2ebVKevRa2J28WNSDQgU+orIsgRQ?=
	=?us-ascii?Q?F95X9VAx2rEGZMUXPCetE3dSwU/EUJfBrJkVYd++sE3WrX/JiDzX0FNyOM+X?=
	=?us-ascii?Q?nOg8nq+ohRrgtGJ6QllSGUw9t1NkOujoV6WJARogJmvy/zD8XBDIz78nSPeV?=
	=?us-ascii?Q?KvCS7OZDRtepAs0VPcmVMcH26NQL6dJrZcMXphHYszxRpzjkbXnH56544oID?=
	=?us-ascii?Q?jJh2d4edIPad3NnE/Fqzy0/vlasJOoKpMkG6GZZEXznNRuS1XAZiB33aR8+3?=
	=?us-ascii?Q?17xYpQvRx6+vzjWPyECCwRgxpRb75akR65J/cD7z5LzMPpTbzwmyvsD4F+iA?=
	=?us-ascii?Q?ZVbqdZU8eOu+tYVxtOwtH5dCSDdhJ/jgKXSf/Dla4GwkVkQ+UKd8KRO95MyL?=
	=?us-ascii?Q?2y2riQt8m/owxGNAhH66aCZPNTsJHxHpXzs90Ww2pVc4lYUXyV82rCV/m/OY?=
	=?us-ascii?Q?RY/n4+V/rjR69ZKvDhKHyH8UB28NoSP/D4aAFme93hbp2jnERrKtj50LwgJK?=
	=?us-ascii?Q?8tVVF46JQb7ExxFp7vrRw8WPCVGBBz96vAwvIkY29xHt3Y4KWEiF1ZjRLDnk?=
	=?us-ascii?Q?Y97jw83GQVGQ3pWKKgN0WWaHVdXijMDCnakRQN8iX71L48xSPmeMXDcIE6ub?=
	=?us-ascii?Q?ypAGhgkBc2uCrhbCQYS3uBY3ZixaslZN47wRYxxrWtZ1asEDZk5A4iSA/lqX?=
	=?us-ascii?Q?wxbHUU6KgrbeNrEVT/30TQq+uQhcGFH2mqyrCWu6X8aUWeS9MOGTLW34lGxp?=
	=?us-ascii?Q?Hj4bsC8Q8ntkZKOsCI37sm6Vv0XgbmBjjVsLshkhQQ=3D=3D?=
X-Forefront-PRVS: 0316567485
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB0902;
	23:86TsM4zbuuKbxcEYk2Li+N1q461jx//l1QQFc6g?=
	=?us-ascii?Q?PV0mehS/87wTa/VDkxEApirnNDRh21+9W/Yk+JMqjD2r2zOjvNCFiZPPls80?=
	=?us-ascii?Q?vBKH2O26m9UiJrgGjSb5So5x7w3gegLkKc3qaOW8/Jv1AF2IxL57YvZNdzHN?=
	=?us-ascii?Q?loVpWPIcQJ8z7z8wa725D4Mb4kIW7o19M5ApJn8e9RzR4Rks12MADaU8yXhO?=
	=?us-ascii?Q?W+zEioFuBwT/zNfWPDBYxFdBtnhZ7gNUU11CoDan9wfd2x4DqSUetnElUyXi?=
	=?us-ascii?Q?umR4kUdxDu/zmC5Vu6viTmhdSs1DRmzekUwEvAfPbMu1a9euCq4aGlQL5yCw?=
	=?us-ascii?Q?4ipgFVHaueLOoSz4ByL67U3z+tlKGwePh7m1DjSVg6mipwRCGD/Qe07xQ/3T?=
	=?us-ascii?Q?PtPIzNTiIGVoHUT+7CdQHbNHSoAppQxiTr7RKuBUcVVwwxNqk++VJSHq71yp?=
	=?us-ascii?Q?lrElp8RP/lSsnpigMOnEmI5cL+l5U50KJkDFn6TClBuyNHjJTjBW7BOnPRa7?=
	=?us-ascii?Q?1p4NYqgWx2115ALk7hsLWt9GeaxvGfcbR60zCcfAtPM7ZKYyn4w6lEFb7lSG?=
	=?us-ascii?Q?jDcBoxTurkuwLehYe9y/aqkBVrR2R4aqY0Y3MhmL6HBAnzZSXVkGxUtaRCmQ?=
	=?us-ascii?Q?OFdh7cv6jJpcRudrSk6BkPLMq0sIKhHRBkzGYQTnfXgl4DR7E76VKMDEkB3N?=
	=?us-ascii?Q?WStbcUX4Jjs0kNuLxxJY3FymWtFMVnIiy5dZGi6BTFuxzFMeeCuX5WT+/gVJ?=
	=?us-ascii?Q?Xr3HRWJSYnC/YWXiI5EtW7acd2AiCImw0mHP0Kfgj4vEsZnp+eIVg1AQyVeI?=
	=?us-ascii?Q?5ag98756XQ5BJcfkXSjZe7NFgVEnya9EAeYQpILQ3DQl4uqjJP54A1kM0Kqf?=
	=?us-ascii?Q?OlLpJaN2C91Y047yZMzGyA/Wt7wH2cmvUpS4w+YXABZe09SpZN3nvcSq2C/o?=
	=?us-ascii?Q?PrBxfYfdjwVnZDbDROZ3jGljcGL5uTkwzPURu05IOTRG+XjPXpLvCYl0snSn?=
	=?us-ascii?Q?ZzfdHYx0Awbxd6nWfgqNG8It8M0ftyt4y2emm4N0+GZkZCZEr0/FmxeuBo8+?=
	=?us-ascii?Q?gF9+F+58X37/jXePO/QicQqdkhXmsyQfH+/Bl7YlbRiiUMZuOsq0SwqWRHN7?=
	=?us-ascii?Q?g+xSl+q0hSHvWlcgjf3znI9Rycu70GhtlQJ/w/zCbT4cSPjDSalR2CX37OWH?=
	=?us-ascii?Q?EZUrWxUKqaCILhKiIDjMnSRnfxMVhjmmZ4RAmB5CcX5Hc7Td6mzt1x17PI2z?=
	=?us-ascii?Q?cQzxLKRfFB+CGUKiwdC140oQpWcdotzuG6rRPFFEK5elVV8NoFcENJSuG5Tx?=
	=?us-ascii?Q?qeRMkDecQUNlTGGcRv+A1Mz8=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB0902;
	6:lV8CseaTcG/W6hTgcbWUTtogujQANwAeRfSjHpdpOuyqb1gGOFx+dB/01VdloY1UMT90iKTzk8N0Rk80C8w2qXmV4BUbtd/VyjaX+LQ7uneB/FJw5k2lJCaGVjted1lYMns8TtKxZX47v79oNYH3eBEpjQaDttAFQku49CypXDSGgSsCanSFsoIdQKivwKxpDCg4/5Jf+I72JNZ0BUF05x53WJDOLqlopSqXPbTtt672U4tN9/+Lp/H4CFlwZis6LtvqEzcivLl/9NBTLBt58AKTZPZIjIUZqQnRyVa3WpOD4eU11TO0LXBb1pOPXvEMt+6V++8OLkm17xQH3gDro/alTfikxHKgdoKNofJ0cYmcFh0NZpSV+c422DJ2mbyDW2DFcLoBuJLFXnwdpmgw+dqpAdnHi9EEwpHoXS8Qr03xk2Oan2NOAQJ3/KH8wB+ktQsq43a6sYXGbBeu4eQjDygg9X+rqt505rd88KcgHCFoLCxfFdTrBsQB5/gGqHjRIHYqIIkL+t7ffpyPMd2aVA==;
	5:lOLuUOEskIU9wGrbkWZNc3tDQZlrC+u0763GwDg7KtG37awmmtMoaGhuwEFmhk9R1w/6OvIali00cvZP1xveXCJL3uaZKunhzeU7T1r6LUbqMQ2nrsPBkI4OdFvGafaa8sZMrRn5v9rE1ksn4N0bbZkb4GPlZsrTqXyvbP/DPCcQASe57crsZ/+IXWZWjFIh;
	24:msySuSfdGVhwDAvwX7nqgpa+1wo8K96lkpNU7z52bu2pJz0PMSba0r5JLQ+8aH5T7oj/fJl/5ni8OiqbGQHPqwUVqJ2ffwflwTkyc2imQ/4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB0902;
	7:3E6C7fKXsqkhhfIdBY+REtFuV1+NSR3Mm/n7huVZ/ZYSW8ip1WO9HvJNZEQPVe4XfYZtZ7ceNBd7ms0/GwvYKWb0izDn6w4k4Kzq080TB2n+Ss867PtdrNicoS0wQ7iLjF+S1bEayyTLc/dIH+d5xGGrpmXAnZ87qb4sCRzpA695/4J8T7cJUUAfHNoRo1SrZd3UCX6zbMY+EqHyHrXWhcdW2/ZQO9ZVzQuLkaRQAzcrTjaez21+DvfXuT9EqUTzf5yo0jnuoANoyV97R68GhTeNfnqhY5PU3U4Gi+z3yIhsAsI6o9DuRKOddAavIQig65oLdN79Jhnkm0nMUtX6lQ==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2017 14:09:48.2793 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB0902
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [pyro][PATCH 4/6] gstreamer1.0-plugins-bad: Add overlayvideorenderer video sink
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
X-List-Received-Date: Tue, 23 May 2017 14:09:48 -0000
Content-Type: text/plain

- Add overlay video renderer "video-sink" property, so that can be set

- In create_video_sink, it returns video sink instead of always NULL

- Add new renderer_new_with_sink() API to set video sink

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...layer-Add-overlayvideorenderer-video-sink.patch | 138 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |   1 +
 2 files changed, 139 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-player-Add-overlayvideorenderer-video-sink.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-player-Add-overlayvideorenderer-video-sink.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-player-Add-overlayvideorenderer-video-sink.patch
new file mode 100755
index 0000000..ba5dd27
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-player-Add-overlayvideorenderer-video-sink.patch
@@ -0,0 +1,138 @@
+From 2437386711abdd866ec46d10a8bf48072ffbaaad Mon Sep 17 00:00:00 2001
+From: Lyon Wang <lyon.wang@nxp.com>
+Date: Tue, 27 Dec 2016 17:13:58 +0800
+Subject: [PATCH 4/5] player: Add overlayvideorenderer video sink
+
+- Add overlay video renderer "video-sink" property, so that can be set
+- In  create_video_sink,it return video sink instead of always NULL
+- Add new renderer_new_with_sink() API to set video sink
+
+Upstream-Status: Backport [1.11.2]
+https://bugzilla.gnome.org/show_bug.cgi?id=776490
+
+Signed-off-by: Lyon Wang <lyon.wang@nxp.com>
+---
+ .../gstplayer-video-overlay-video-renderer.c       | 38 +++++++++++++++++++++-
+ .../gstplayer-video-overlay-video-renderer.h       |  1 +
+ 2 files changed, 38 insertions(+), 1 deletion(-)
+
+diff --git a/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.c b/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.c
+index 7764d43..411dd3a 100644
+--- a/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.c
++++ b/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.c
+@@ -40,6 +40,8 @@ struct _GstPlayerVideoOverlayVideoRenderer
+   GstVideoOverlay *video_overlay;
+   gpointer window_handle;
+   gint x, y, width, height;
++
++  GstElement *video_sink;       /* configured video sink, or NULL      */
+ };
+ 
+ struct _GstPlayerVideoOverlayVideoRendererClass
+@@ -55,6 +57,7 @@ enum
+ {
+   VIDEO_OVERLAY_VIDEO_RENDERER_PROP_0,
+   VIDEO_OVERLAY_VIDEO_RENDERER_PROP_WINDOW_HANDLE,
++  VIDEO_OVERLAY_VIDEO_RENDERER_PROP_VIDEO_SINK,
+   VIDEO_OVERLAY_VIDEO_RENDERER_PROP_LAST
+ };
+ 
+@@ -81,6 +84,9 @@ gst_player_video_overlay_video_renderer_set_property (GObject * object,
+         gst_video_overlay_set_window_handle (self->video_overlay,
+             (guintptr) self->window_handle);
+       break;
++    case VIDEO_OVERLAY_VIDEO_RENDERER_PROP_VIDEO_SINK:
++      self->video_sink = gst_object_ref_sink (g_value_get_object (value));
++      break;
+     default:
+       G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+       break;
+@@ -98,6 +104,9 @@ gst_player_video_overlay_video_renderer_get_property (GObject * object,
+     case VIDEO_OVERLAY_VIDEO_RENDERER_PROP_WINDOW_HANDLE:
+       g_value_set_pointer (value, self->window_handle);
+       break;
++    case VIDEO_OVERLAY_VIDEO_RENDERER_PROP_VIDEO_SINK:
++      g_value_take_object (value, gst_object_ref (self->video_sink));
++      break;
+     default:
+       G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+       break;
+@@ -113,6 +122,9 @@ gst_player_video_overlay_video_renderer_finalize (GObject * object)
+   if (self->video_overlay)
+     gst_object_unref (self->video_overlay);
+ 
++  if (self->video_sink)
++    gst_object_unref (self->video_sink);
++
+   G_OBJECT_CLASS
+       (gst_player_video_overlay_video_renderer_parent_class)->finalize (object);
+ }
+@@ -135,6 +147,12 @@ static void
+       "Window handle to embed the video into",
+       G_PARAM_READWRITE | G_PARAM_CONSTRUCT | G_PARAM_STATIC_STRINGS);
+ 
++  video_overlay_video_renderer_param_specs
++      [VIDEO_OVERLAY_VIDEO_RENDERER_PROP_VIDEO_SINK] =
++      g_param_spec_object ("video-sink", "Video Sink",
++      "the video output element to use (NULL = default sink)",
++      GST_TYPE_ELEMENT, G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS);
++
+   g_object_class_install_properties (gobject_class,
+       VIDEO_OVERLAY_VIDEO_RENDERER_PROP_LAST,
+       video_overlay_video_renderer_param_specs);
+@@ -145,6 +163,7 @@ static void
+     (GstPlayerVideoOverlayVideoRenderer * self)
+ {
+   self->x = self->y = self->width = self->height = -1;
++  self->video_sink = NULL;
+ }
+ 
+ static GstElement *gst_player_video_overlay_video_renderer_create_video_sink
+@@ -168,7 +187,7 @@ static GstElement *gst_player_video_overlay_video_renderer_create_video_sink
+     gst_video_overlay_set_render_rectangle (self->video_overlay, self->x,
+         self->y, self->width, self->height);
+ 
+-  return NULL;
++  return self->video_sink;
+ }
+ 
+ static void
+@@ -193,6 +212,23 @@ gst_player_video_overlay_video_renderer_new (gpointer window_handle)
+ }
+ 
+ /**
++ * gst_player_video_overlay_video_renderer_new_with_sink:
++ * @window_handle: (allow-none): Window handle to use or %NULL
++ * @video_sink:  the custom video_sink to be set for the video renderer
++ *
++ * Returns: (transfer full):
++ *
++ * Since 1.12
++ */
++GstPlayerVideoRenderer *
++gst_player_video_overlay_video_renderer_new_with_sink (gpointer window_handle,
++    GstElement * video_sink)
++{
++  return g_object_new (GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER,
++      "window-handle", window_handle, "video-sink", video_sink, NULL);
++}
++
++/**
+  * gst_player_video_overlay_video_renderer_set_window_handle:
+  * @self: #GstPlayerVideoRenderer instance
+  * @window_handle: handle referencing to the platform specific window
+diff --git a/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.h b/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.h
+index be09113..8a96e84 100644
+--- a/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.h
++++ b/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.h
+@@ -41,6 +41,7 @@ typedef struct _GstPlayerVideoOverlayVideoRendererClass
+ 
+ GType gst_player_video_overlay_video_renderer_get_type (void);
+ GstPlayerVideoRenderer * gst_player_video_overlay_video_renderer_new (gpointer window_handle);
++GstPlayerVideoRenderer * gst_player_video_overlay_video_renderer_new_with_sink (gpointer window_handle, GstElement * video_sink);
+ void gst_player_video_overlay_video_renderer_set_window_handle (GstPlayerVideoOverlayVideoRenderer * self, gpointer window_handle);
+ gpointer gst_player_video_overlay_video_renderer_get_window_handle (GstPlayerVideoOverlayVideoRenderer * self);
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index 732fc2d..82cd91c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -21,6 +21,7 @@ SRC_URI = " \
     file://0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch \
     file://0003-player-Add-configuration-for-enabling-accurate-seeks.patch \
     file://0004-player-Add-get-track-number-media-info-API.patch \
+    file://0005-player-Add-overlayvideorenderer-video-sink.patch \
 "
 SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
 SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"
-- 
1.9.1


