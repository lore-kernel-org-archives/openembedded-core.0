Return-Path: <mirza.krak@endian.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0093.outbound.protection.outlook.com [104.47.2.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7094578164
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 07:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=endiantech.onmicrosoft.com; s=selector1-endian-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=4N702h0UZSMFjCzkeCkJG/ba2EaYHHPaqL24t2An5kE=;
	b=XMeLILC7d4qUAcabcqbtFmf80ueXfzKOFzQlXNTms8N0ieIjeQjMqFXJ4Wp9G93X87oa/a4t1HqSORy8cD9hykBPYaDUkQaIWjWy46AJFLS6BpQSQ4w8eKGDW7/309oogB66LZm0rKrPy7mAxRGxF7/tFZ/W7ehkA9KFKNnf/48=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=endian.se;
Received: from localhost.localdomain (212.116.75.34) by
	HE1PR0601MB2283.eurprd06.prod.outlook.com (2603:10a6:3:93::9) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1124.9;
	Fri, 26 May 2017 07:03:52 +0000
From: Mirza Krak <mirza.krak@endian.se>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 May 2017 09:03:44 +0200
Message-ID: <20170526070344.6053-1-mirza.krak@endian.se>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-Originating-IP: [212.116.75.34]
X-ClientProxiedBy: HE1PR0502CA0012.eurprd05.prod.outlook.com
	(2603:10a6:3:e3::22) To HE1PR0601MB2283.eurprd06.prod.outlook.com
	(2603:10a6:3:93::9)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1PR0601MB2283:
X-MS-Office365-Filtering-Correlation-Id: e1493d45-a396-42ab-43f4-08d4a4055e17
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(201703131423075);
	SRVR:HE1PR0601MB2283; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0601MB2283;
	3:iHkldWz2cxWrP5M7U0WP/xnP9kWmEGTmiEwotYRdpFzj/GGyk6EwoKNzOSFWWJtRFZT4HFUW4Wf4u3Vn2yG+3yqYkxstEfmb95iBy7VIDkRt71XROQBRyjW1BFOA/qjULQFubCJhkbF7rVegOeotzuav/vd8eCghhno/CS669bPwsp5TjJE1QlWgCYWFXZRga1JQWxhewmY8XV0nqbDKzYj+gzWZ0XOvgwIpgGkGgE4CuPYpYteQChG9rBSKCJf4AUrxPZruvcLXd34go3d+qT6qK2EIy+eXvuAlY+k3iDs=;
	25:jrfqYXQTcwvcrn15poyQISByDkuHoZuE9vy6qllOkVlLdXjIuSz/VTO/uMMx4lvghmoKy+s2oyyKwe43Anyt7cTnPoh+C5nyad7yTKWJG/OIuM3+Rop4NydtQKkJ8L3d/xw87UnFptsPUnW/gRI2x5tNK3gNmI+k44neGtnj96siL+RqVSSW12ygpQXFSu9U+aZxmRIjTRfdDQO2JvJ261nRAd4bmT6T+8+2GAIGy3m0n8S49HoO+KPil8pVKPYCcFxfVD3CBEtfvEh/93tvbAcP51lE9yn46Wn0g1yQXn40grcdGqwcF4OElX0U9v1TYdtYSFeszT1JHCBsK7IyexkXh9JvEb75va1iBNPpFuTfUsfAwZ0+SfMXFmM2z0P+HN3RFOXZaL0PPx2GlCR3hSp30rgoVlesFzJ2pTjkUE4LJY1PMVBrzQVb2o/mCDAsH9aZFY4I3TWDlvgumxr9cL7Y4xzhVF+HtLj6WXqPF8U=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0601MB2283;
	31:Gl9mdl7Iw8jzzNswCSMtyLVjP8QcAdA2CNPV2ZvgYDNquCsqBa8dXmZ8NHcavULq6DaoYvAGLACoGVlHrU767e4VI1Wev0mYOzvPwfdcoeVmcefxT3wqqlE63/E6BUVS+g1TS6lRuon03daE0Kk232PYam4YkYfNLWrE7wJxUI25fS8xhj/sHRXtKrO7b6sG9SGBwNn4/6WExUxItzvMO6Rf1uwtyJ/t6vqk/FnVZUQ=
X-Microsoft-Antispam-PRVS: <HE1PR0601MB22839755756DAC9E72E79C079BFC0@HE1PR0601MB2283.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(6041248)(2016111802025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123558100)(20161123555025)(20161123564025)(20161123562025)(6043046)(6072148);
	SRVR:HE1PR0601MB2283; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0601MB2283; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0601MB2283;
	4:wYNl72rHNdcfizD/zTkDIao/t+Gc0J+9fW307F/eN+61mi0FmKrzUptK0io1Hp1JLbxXfLVX97XpCjxY5UZM9ogEq/jODoVoa50ZVQ3lqf+/si6yAlbf0KJjGtTPtJHX/ER8dZV+cpBN337d2tFWiKbG8oZpff+PRlhbjrx+fmvy22//KpwzdRo2QwsNvC0Rj4Rb0iZzmW7IpV4HXAhiuAtAczjkccGWSxfT2upbbEDI2N/2HE+xgaiffT5QDxeQV80D2ZmDJqErMeipvJJ1MyeUNQqSNA2/RVJwN0oY97iWPyFk2lIryIbqfvTNYDdXAUFoU7gIIjoHbpJhooB+2r9aqDjaWOmE/SR8s7qgFFzRArgle1daS/WaBDST5+qqLjjC8ELihe6KX2VzIrC2hJ1UEQ9vH6TO1qMS6VxkciIsol6xsJoJaVTP9dAgvTXJ4bcMQ+P+717LUkSWjjPGaHfxgWDSjF4nppeUR7ra0mmAEUWLBK2GdtccR3WWkb/kRDMYaBDp5jHoFLJAfVwUsMnJO+3DPl/j7Fr4VWgIIIADR8M+H8Gw0NOFS0OFMqjWfj2sFAwUyM45N3TpkZt+tnBJzHSypPiGqHx07HdpBXof//fNabtIbcB7QCSQDDs20R5CcS6syICp2G3EQrPyhq8NUrSr/STn4HlEpzK/4YDxvqgUY1QemJkXO4z9utmoKTLAC4WfZhkIbT4IAXnpAdaTWZNuMJaUXpshCM8Uwrxx1N3nSmHFNwQ1VtLNyaeKg9v6bj/pSK1R5fYS+FN0PmW3qycWoZ/JOUzgvCZ543alNMRODSgJMbuci5n8pEWmskRHJXOcHwqBLGQInSyUHMQIxiqAwNhYJ5r1VIx/yG4MYRcZo5W05S3ngyAK5D9f
X-Forefront-PRVS: 031996B7EF
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(39400400002)(39410400002)(81166006)(6666003)(8676002)(25786009)(478600001)(50466002)(54906002)(6306002)(189998001)(6116002)(3846002)(6916009)(50226002)(1076002)(6506006)(86362001)(6486002)(5660300001)(107886003)(50986999)(33646002)(38730400002)(42186005)(36756003)(7736002)(74482002)(2906002)(110136004)(53936002)(5003940100001)(4326008)(2351001)(48376002)(47776003)(305945005)(6512007)(966005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR0601MB2283;
	H:localhost.localdomain; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; HE1PR0601MB2283;
	23:T93FqQ1kMqbSGhAUy9wtYQC+Ey2p4KcLbbuJOFT?=
	=?us-ascii?Q?xPrSx9xLe1f8diHFuIfP7y5bciS+tOQ42C90AotB+NpQ+9hef56sm0xObH7J?=
	=?us-ascii?Q?s55RybX6f4PRxPmgIZiVkAsVqpxo84KFBqMx+nThDNDJ30MxD1MQuSHSBDC/?=
	=?us-ascii?Q?QfNfSWB0DZAff1H1y6Me78gjCRLO0a6egYkkAmmQvkT3aQvKk4mKx920MxOM?=
	=?us-ascii?Q?QcLcH4ls8pkrBJy2LHVq1Ivz17YwIiY8RFyeAiw4+fGQYtIy91ub99K24VHM?=
	=?us-ascii?Q?ZARfQwBsWNrP6crTiBHIs0lYtncD/p9GaVQXx9cHsTOEtn4M4n2JKeWFfCZR?=
	=?us-ascii?Q?7XTjgLFkkyYg1m+KIU5R/Bemq4hYP88Efm1NfniXLJCFPjtiXdDn9YBruJPC?=
	=?us-ascii?Q?Wt7pgPtL7RYN3SIag03OpTOpmjoqzbZx8puH0TxkImnzV6E1+US3JASp7+x/?=
	=?us-ascii?Q?8c0OlSrKq+RRfmrr7WNFqMttzXC62AM0a9XNDF7ARBAHLo3CW5qLmhJkwHrf?=
	=?us-ascii?Q?KdCKoGKv9LJJhx9KvFigWodFazHWn/leFdk0GSbhdD42CGuwIVbeB4OTW58o?=
	=?us-ascii?Q?PRZi9zSmjNxw+UPqUVRQS5BoRcgcw4/35ORuTxnTBMyp6S7WNbQv7pxgPGGb?=
	=?us-ascii?Q?eDn7PPKH9AEL69EDzMSGsSjC8ig/mYzmSWZT07SWIFQfrP4bFbCLmK7kINUv?=
	=?us-ascii?Q?cyVdoZtMbF/LkpV4I822HyferZoNiRQ+zWkYQQU+oy92odQ8IiMmCV+V48sF?=
	=?us-ascii?Q?P9vr8ejbCxzVwz71inE9ChZ1ifq1QM3mkVkhJDmngfXh6acnJu7UoKDP/1fs?=
	=?us-ascii?Q?X8yBRRFXTsEk+8UIAVZaL7Ll0PeAnnjGy0oXINUJf7HrpILuMcJTM640rzIO?=
	=?us-ascii?Q?DhN6/HRSLpFjChVYJxZXt+c6jUi4tFXkjvqj9VxERF6tlfohY2/u5qeydOS1?=
	=?us-ascii?Q?9bcdm/UEssb7s0tC3z9Z2P0K/v3+Ov6aszv+89TZfUP7tF1FleZMinFgLusE?=
	=?us-ascii?Q?U5bntMbDBTvFQPIhq8jiqaE8i?=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0601MB2283;
	6:LSKm1qtyK1TUlcczrtzwI585OL3Gbxzu6OzFZwpbCLnJvayIYFVeGjQhOSHX5TPGfB9j8KwDD/nsnjS/bW+hDS6PEggy409s23jyKCQ7Dsp7OENZZoN3HGwoNzGViSl3nIlhdhhztpzLTEM5ShYOZigm7Khv44VeDjbsKfdcf892kdFyk4LtqMejL1PxL+t2k1X0r1qFiWztwPdP/jbLWGYsgF7N5/TdjniIGTiMDGr+b1BPpoGjiUt3V0/lY6QFKzZtsT22d3icUFmTmW5i3/wpebu5s6CHzApsMzdGTFnyc2ybS6HvSODhJkLvkCOfuJb62F3Ke9A1Ely8/mmhrmXjwhEU6iUVs1aGCu1MiSWDGDqfKYrSFDDKSh3tOWH6kosxh/tPgiL7y2Gg7CdXt4W4jrQos+a0ruqUCMgWteYHruWVVoWEgqaUmEYYVUfxMjy/NF8CO77IHS17/FQqs+aGRC1jvKvK43whh/NSM+MDfwmYN2WSVU81qa01bMN7Q2C/1vAhg6uY6NhQoMHKrw==;
	5:ddBKEO4aU9+ZaPiIK/JAshh7lselcaqGPvxkGGJGchv1ZCAPee9KCE/+Hpj4xwaRb92LvSSqy7f7vSrkzxMGkAd5SVS3DAunHjhFlOvxKnlWbUDUFl6eAoEvz7ZxFFVMgdcjn2Vs5HQOPIEvSQESb2UL70sHRBn4czTHHg2jYVM=;
	24:JLaikplRtevw7a6ppaV3FE+1OyI/Nr3Spa6tDoXLiAYrEvBeWMquEJ89blmlrELD9HC7IsS6FaYPjkZFyQu0W9K3ohJ9Z5rAYs7IQ51J6pE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0601MB2283;
	7:MaWEjo9smsqiX7phGqWc9AdTcnqsPrmrS/K8vhcthEpexbIKHUamgE1fuKz2D7CaYRK/ZMSEumAglNxLWMuOcVN8y0ZEP3243CHbcg09sseTnzp9gfGNGVCiUSawA11md6mSsTRvi83aEnZUKvICX3oh1tgfriQ91BwZAH/G8R58rEFWkvR7oW4TaTDg81L76KUCy/BAhG7XDh5oFnrFhsuK8CZ3bX8ZTdWvLL3kyS1vpaIxJO/qs05P4j5WxoIxx4xZlcLayrD95daEZg4IRFj5WonV3tAY7+q9RGlcS4PIjgyymW7ds92g0oWJuY+cBs3SgsrHtWly5u3PBuSdMw==
X-OriginatorOrg: endian.se
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2017 07:03:52.5246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0601MB2283
Cc: Mirza Krak <mirza.krak@endian.se>
Subject: [morty][PATCH 1/1] openssl-native: Compile with -fPIC
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
X-List-Received-Date: Fri, 26 May 2017 07:03:54 -0000
Content-Type: text/plain

From: Khem Raj <raj.khem@gmail.com>

Fixes
| /usr/bin/ld: libcrypto.a(sha1-x86_64.o): relocation R_X86_64_PC32 against undefined symbol `OPENSSL_ia32cap_P' can not be used when making a shared object; recompile with -fPIC
| /usr/bin/ld: final link failed: Bad value

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0a19e72081771fca8ed94fb2a2a8996fd3dce00c)
Signed-off-by: Mirza Krak <mirza.krak@endian.se>
---

I hit the same compiler error as in above commit message when running on morty branch.

I simply cherry-picked that fix in to morty branch. I looked in the git log of oe-core and it seems to me that it shall be ok to do that?

This is a re-send since I messed up Subject the first time around [1]

[1]. http://lists.openembedded.org/pipermail/openembedded-core/2017-May/136489.html

 meta/recipes-connectivity/openssl/openssl_1.0.2j.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
index 9a7cdedd05..b6fb126349 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
@@ -5,6 +5,7 @@ require openssl.inc
 DEPENDS += "cryptodev-linux"

 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
+CFLAG_append_class-native = " -fPIC"

 LIC_FILES_CHKSUM = "file://LICENSE;md5=27ffa5d74bb5a337056c14b2ef93fbf6"

--
2.13.0


