Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0040.outbound.protection.outlook.com [104.47.2.40])
	by mail.openembedded.org (Postfix) with ESMTP id 422BC60797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 15:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=iscTyf0OnbGCxiBetEMJCQC2sx5Q8g1CuyWf8mfLAbc=;
	b=chemqTbiDvuk9XJMY5SyNFEa7nt2dbAIzgOS4EHh+EoMt84DFHFmYd1HLbepHaX03yamHTATQKhPyQOXAcQF9LYFMUMJUe3WS5NV8364QaYmhNBXOg/0HtIseD+2Y8FIqtoA4uAUnKOTie9pqkD2cpzcKcSElrdBp0fVHEY3y3E=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.49) by
	DB4PR04MB313.eurprd04.prod.outlook.com (10.141.239.146) with Microsoft
	SMTP Server (TLS) id 15.1.539.14; Mon, 18 Jul 2016 14:47:34 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <otavio@ossystems.com.br>, <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jul 2016 09:43:06 -0500
Message-ID: <1468852986-2487-3-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1468852986-2487-1-git-send-email-tom.hochstein@nxp.com>
References: <1468852986-2487-1-git-send-email-tom.hochstein@nxp.com>
MIME-Version: 1.0
X-Originating-IP: [192.88.168.49]
X-ClientProxiedBy: BY2PR05CA035.namprd05.prod.outlook.com (10.141.250.25) To
	DB4PR04MB313.eurprd04.prod.outlook.com (10.141.239.146)
X-MS-Office365-Filtering-Correlation-Id: e31fa59b-9009-43cd-166d-08d3af1a74bd
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB313;
	2:VzDKyw00N1ZGvR1NGiJjFvguAaR0jiccGJVO/Rr7S/SGul94+Ovhsq2SxrgxLz4Z2X3iL8UrVf3KiHQc5VumnOoIov2FKLmoTWiOVwF8I3n490842AOfCw1OGMFcl6UgORUAJhVkYajrvxEgh0MhYsyCeRZ5afT8WV2S7rr/aMPpwzDpCJV8OLmBs5hj2O0D;
	3:2bPO+gTONIIZQT3H+msoz5avirztFxJ9mPgfkzvqzSM0OAjGAH7ZcVVUNdiR7T7J0rH1T78HE9lGHQ419hPYieDEUz2gndMykUUa7AvxpvaC4fIhK/cj411YpMsZBM9W
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB4PR04MB313;
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB313;
	25:gCdyyeYgoP3j+AMxPhedUCr5Av7T/5HdAf+r0Yv6v1Vhxdloh7nYMA1thTQpVkTHYrlcD1Il6YQw1JbeQpM3qZAj/OZVo2PDNBrM3S5qAPQDxKlGMzZu/sO3kdXiY9gw2Fh1DFXeC7B65QoncQZ56fCuHSIVrVjloZNJQ2LM083zbXekzB0qEsCllsTCb2ohGIjUB/xxcXAbdKXOWm63F9Ib9tVRRtHQjMHmPPNiwtK9SojUvgigdCQbVNBhZ3SNdkTW/aMN27/dxT3lfmcVRteuJFS37aY+CBJsv//IIDlTZLTs5U5YSPvTVyXFip8lGJ8N4ooAgVQw3UIdSkxXq/JaWTEkNFqczFL585V2XOLU4vgHJ4TE3Dyi6BWaI3ODedSc5MKEFdgFTPymjc3hFrC6fWh2FOJtANBjZof4qNXzuPrcc07h0wR96VugU8w0VYhfilI2gqxMEg/LZRPWPqqGJNGeEp4FwtxpJ/UJZrFahsUIHTZ2F8RWGGSYvKAdo9zfSf/nr5YwY6PTk7/+rp5EfCy25vcs+qG3tCSsnTVttqVa6gBC79SWHi7wH2fLz/B2k1CjN3OfpeWA4F4B/lQmjO5qgkWvopdwkAXJ7zDBBvjZKTOWcRbnOBjUn13A07PieC7SZ111Q1rdt1B4mHu5EzFyD3bQgI8TkB6JGjo2x75zurEyTFLQPnEDqAaFjGPXrF2OoIVYt9lp8eGHyw==;
	31:AQ+gPbQU7cio2T6oBqk2U/FYaxLHVVYWsWDXc148v9k/4l7KHp6BsGhcPhoZgPRhFGCGWBaFiX+J5vl5S7JC1qFFiUo2fBs1wdU/b/FuMheJutaxx4XQoyV5mt0buvWxThUIg+vQIzKV0HnRAwQ5AExWStKwIQTxTZzn3G2PWpT2j/jix0CLpBUBMhVgbUhPu8aWYs+7pWmcnjAfS3VhTQ==
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB313;
	20:i04KqFnTfLtAQiVK3pMPE57rBZg7p00x5yMbKF5waCpPmeWr3NIZQwnyZJPURKGnUNw0yVtSQJnxryNTTlAxzMPadhAr93M7dgSspndnpcslkE5//UGD06LoWY314JlF8ECvWdoQruNXKvqlm4+kE0Sc4VVL1l30jddLgrCRdUz16GewM/3cfYmmg7PgmrizXubc3QC3AZ2YXP25CrxiBHJw2SYkfCpWwRLBjq1tsSgPdM8JxMe191vNciuteDotm28C+YpTgiLqSkEDVLYDdwx08HQJphBX6uJOhYK2bTDEM0CBfVZZ4i9A8IJHkHcw5+77BKSryEY0+mxof8O1PWsj9G+VUMxL5ng/NbTBLyIeBY6+cMw5JyE/NMGIkpZniK6ueqLAmEbBOd5LMRwd4XAsCgbh7zdOJmy/QCpI+EOkOyKl9YzR0JVZhpQqm6CLqdP1wctgFUdDFQm7m8cSZFk6yQi1EeMkFAWx5HiIdAPnraPEr8a2WlXxx6PKHs/5;
	4:ml4hJTrZfiZk+aLYBEUcHO5xsxE2BvgCAB2KeiVOyNpEfRDY+07G1VFbVSRMTdne7hvqYxYMnc4Vz9C/VQFIobsxqtrlMgmGZiFZLX1gUA2PqzyWJxQxqsG33KD8545uSCZmxbS8klY4IMly+vHM7NexIb8n1UHixV6tb85q0BML/u4X8zG2KNmhvUqXkH2QyBuErP8tq1N/DEyUBGPZFu0tBUKKEX96QT93XfW4xWoS5Y3A79g2j8zs0D/VFMO4ivP2csOz9v86NyTWmI4ldgiNs5TbfaZgAAlLJPf/MRfI9JkUBBD6CiALgSp4sXuKhUnyvLqJM09VlIYyG8PRdv78uYUgtiHA5n1jq9WEU5lIT75E/1NJbt0fyNkBiVqfLkdEb9kPF50QB0H2zg44/HUmX2NxphzWz3p4BO0fBtg=
X-Microsoft-Antispam-PRVS: <DB4PR04MB313B6943E2BB4834D115F95E2360@DB4PR04MB313.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:DB4PR04MB313; BCL:0; PCL:0; RULEID:; SRVR:DB4PR04MB313; 
X-Forefront-PRVS: 00073DB75F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(189002)(199003)(36756003)(33646002)(7736002)(66066001)(19580405001)(305945005)(229853001)(19580395003)(81156014)(47776003)(105586002)(7846002)(42186005)(8676002)(50466002)(92566002)(2950100001)(48376002)(2906002)(81166006)(189998001)(86362001)(101416001)(4326007)(6116002)(5001770100001)(586003)(3846002)(97736004)(5003940100001)(50986999)(76176999)(77096005)(106356001)(50226002)(68736007)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB4PR04MB313;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB4PR04MB313;
	23:jq2JlduoFM4xN00u2GNEa+NWleSoirXj4nhyYDPHJx?=
	=?us-ascii?Q?nzExHr0l3RM+BEgjIVonpcp9w2ft0qR1b2VpqOLjiaAmonH5l5gIU4Ix5mtB?=
	=?us-ascii?Q?8U00BgPKrWG0MjbFiLUgFqxnOVvH5XJQfA+51Q9sLlUjw+K19XJd45waU1aw?=
	=?us-ascii?Q?39p44xAqA2E1MvR2qNe2MXNILHgt5wu0UXwR9AYlgNPx7YyFGux//pRhL1i3?=
	=?us-ascii?Q?aEJ28q6SSqJogCAHL+/Ww1wKNKkrGm4osho/Ftiig+1idaGWrjepG2Bj2sML?=
	=?us-ascii?Q?PjpA2MXoetKBprz8N6Ga4uXPuVMOdUU9uBqj1Ckfyw327L+Ym85rqVP/HXNJ?=
	=?us-ascii?Q?xmQ7Fnxbs3z3XwZA5rq9D/NoFHVGpOyLZ30rYfm4h0moU7fXgsVwCdMgilpU?=
	=?us-ascii?Q?eexBaW3A4k8QLpYYyx/UQ2SMvtnlaEAXMGr2ME2+EeNoe9/MAqMo52iHe4ox?=
	=?us-ascii?Q?eCuIsefLoBSKqstqcQXyiURMdGLfP0P5NhPOaUzjn2f5CejXq1TprGk/5RqZ?=
	=?us-ascii?Q?sBTQDHZC09gEZ7RST/WOfNa5e15RrNsE39rUo9EDREUY8XMKOrIo/oPA8zsi?=
	=?us-ascii?Q?dNd5zw0yj17hXIF4969FFd6LFiN9JE/CMKFVrajSTrx1Vt7tVsx20RdKwXYR?=
	=?us-ascii?Q?jRMDVjz2qxrERu1O7zAKjt1E41I3tvO2GcqRWr3QCqPbFPQrGnZlZvt4OMtI?=
	=?us-ascii?Q?hejjlHZxEYyFEV2uJUSoDFPrZoEfUTYTNweCnEyrfUmU6PyrJOhx/QSZc2Kg?=
	=?us-ascii?Q?MEA7dGrnckmqn5EJ+dzEqqK98taogSV9Tk+wSujxX45aIzP0ykT02hssVSib?=
	=?us-ascii?Q?CaAk7X7iFS4lPjHr5pKn+7cYudE97nzgrSQH2yFgfpqK/xZZbR+u8W/ULPbb?=
	=?us-ascii?Q?lAkI+PJkqeNcQM0gBgx5XE5dOXGiDc26A9oZAP8yFWRq7uE4zMg7B+lcQUES?=
	=?us-ascii?Q?APczhZnYDWj91blPMV72ftlEBLecchXqK9RdjBuZuaZHtFWQctadHxmrTsEc?=
	=?us-ascii?Q?Muqqu6ysLPQrd5munB72RdZpJob0JZnC/WfWoEYHF/okcIpJgVtx416D2mNK?=
	=?us-ascii?Q?UR580OJ0lPAKNFSV9qwRh7bz+Q?=
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB313;
	6:AMHKsaCmGsfdPmBYGens2deSNtaf45divgzOGnfYIiugGwyirc7q0W0Du68ztJ/7lKOTAqyA6PBiK0CF4lv2UhfoarK45lI6DYUBJ2nF9kc13j0vwp5npP7t3T6h7dqc00drJyxD0oiMJXT7PUND4nHIhKmtvz+sA61T3PYPohJ35JtBQk7ohDnshQQoOJxWNooUNTPcVc4DQcvTlnie/GdIm2DVhznsUebrTmbIX4CpgLO6rYooDyStU7/ayKVK0vQ4RIQMnYOVHRXrPqh1Z45xO3AsyrbSNvG0Tc90/IV8RK4pCZSgdMFhAXhmb3onjr5YXDOL+Ro3MKdM/5ULtA==;
	5:ZmNjhsFu14O9gifJi6GCow7r/bMY4WokdJhLhIUGTTNxKeuxgwSsPIi9B4Hlt8kqZ0+FU1PLq1E+rd2qoM5/l8fOq5wO94p16XqfaSuHLmthomoq8K6EEawCMa7mxRRmY6Lkyq6yIQsvyM6CCf3/jA==;
	24:4T9j2+MW8MODpTAkrV7E2aPbjtO9C1r45FVhDktTSU2nw0sj0saRjzwZRr6Dn8l0fJXIhHCcEx+/PJ5iGt8vTt1IXpdFB9Y74Vu/60MQFRE=;
	7:fi6iSCiIjeXKtuq+qsXdupA1YPiy5CeN8fZVAKwplZy09e2VpKYeV1fNbgs4vO+sqleij8mHxC0gj3iIEHIZhD7mneM2i4q5ZYe7R6cHp3L8MuIEHnKU7vRpAgvq4Fa7HOtF+rQkW/XxRQaFJte9zXaj72TpyQ9d9xYF4GWdDaegmr7f7s7Sxo9L8edoTbbW/LZRN8HSw+edkQJukne8i7oo8o5f1FYlu3BAUPvw16DhbIX3pZQM6RaeiBWc0mTE
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2016 14:47:34.2503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR04MB313
Subject: [PATCH v3 3/3] weston-init: Fix weston-start to allow weston args without openvt args
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
X-List-Received-Date: Mon, 18 Jul 2016 15:02:01 -0000
Content-Type: text/plain

The parser didn't properly handle commands of the form
weston-start -- <weston-options>.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-graphics/wayland/weston-init/weston-start | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index cd64216..e72fbaa 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -35,13 +35,12 @@ fi
 
 openvt_args="-s"
 while [ -n "$1" ]; do
-	openvt_args="$openvt_args $1"
-	shift
-
 	if [ "$1" = "--" ]; then
 		shift
 		break
 	fi
+	openvt_args="$openvt_args $1"
+	shift
 done
 
 weston_args=$*
-- 
1.9.1


