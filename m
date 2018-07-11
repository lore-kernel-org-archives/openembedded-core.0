Return-Path: <Rasmus.Villemoes@prevas.se>
X-Greylist: delayed 3550 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 12 Jul 2018 14:01:33 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur01on0129.outbound.protection.outlook.com [104.47.0.129])
	by mail.openembedded.org (Postfix) with ESMTP id 92ACF7551B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 14:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=a3gIhvJJHZ5VZoW2c0d41Qh9HbB4UZT1/drF9o5c0k8=;
	b=TqZiXZD8tz8i0vx9JhSqgJ/qJrppboQPlL0mEhQAHwLHd+OpMIcHJKuUdt8i+kVs1mZ4VxerYEiDqdHgu8yn9bWC5lCpjHmIUq1ffysxsnUE4eUUPPlTeUG1dclzqHOicEk33qHzqlPy9cvMV+f1AoT0LAYLPV23pYHBTYBJkPg=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
Received: from prevas-ravi.prevas.se (81.216.59.226) by
	AM4PR1001MB1332.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:98::22) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.930.21;
	Wed, 11 Jul 2018 14:30:30 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jul 2018 16:30:19 +0200
Message-Id: <20180711143019.30896-2-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20180711143019.30896-1-rasmus.villemoes@prevas.dk>
References: <20180711143019.30896-1-rasmus.villemoes@prevas.dk>
MIME-Version: 1.0
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: LO2P265CA0003.GBRP265.PROD.OUTLOOK.COM
	(2603:10a6:600:62::15) To AM4PR1001MB1332.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:200:98::22)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b155fe8-f736-426e-b8bd-08d5e73adaa1
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:AM4PR1001MB1332; 
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1332;
	3:OTKyb8q/upc2rofJLfR96extHVK2wVeJvozOaPJvY6lVmRAb2uhqscXw4IjDRcr1oEAETjcD6pf2kdABEECdGslCBKQkSic++FpJ8OEc7E6PTEQ/v9mMowDSXjprJyKJzyjgdFL5m2mOb/skYw0Zzovxq5m0GT9BJdc5Gmp0DRVAR2cWNdy1NRRYOwtuTFFKO24sAolFU4GZgEU1Q1ttTyTZQ5QjFUyjqxooj9XUArfOHpZWOnLwoPM4s/cQqMe9;
	25:H0yrfY5NtUSu64XhAWgKbgNzx8P3eMEXjL0v57kv4ZnqnyV3XDMXLZIRDc/DK6ZUtQHmhl0QcZ9Voj7uZ56nPpbDzh2LAXMbfn02BjMha++qXwSG0u2t1uWO8+wRBucTk4dMvRwPd7kCwiKAWeIyIZxNDZiOPKHSYjh5AVE3fUBfcnSYKAGapJrEnyVqjhas7YwuW2qCHcLs48aI6hG1pA71XoZCJHGBPZH0ImDPQk6ohmlWJS8Mtkd6LTP/nZFpIK4sSIn+R7AB4GRHtUR39m3pdJ2hNKSBlVQCXhqKdfDy9+hTt0SXOisTIZDl3+NE2qjkewqFdfetW6w8KvmHuQ==;
	31:q+bx4LzwH2E0iT82LXFQbJWUWjTKWNxT2JBSeWSW87fPC4ROJXPYJ9S+vDoSXUZuTc+hri1ASG2f0vA+aagfTYQ6c6tkiVvNlWTSm04EVvCukBDzh+jiDGntbqXSOWOs19PZRFBP6hSEnvJGL+bdSZa1z1zggGO2WJtQdaG1YS23O3n1O6+2tNqvqdV9sqULBpY1Z3IjWTLTa3sJJhdMXw25ZeXwsYGEVW+MYO6Njrs=
X-MS-TrafficTypeDiagnostic: AM4PR1001MB1332:
X-Microsoft-Antispam-PRVS: <AM4PR1001MB13324A2B2E2202065B1765F28A5A0@AM4PR1001MB1332.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(93006095)(10201501046)(3002001)(3231311)(944501410)(52105095)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123562045)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:AM4PR1001MB1332; BCL:0; PCL:0; RULEID:;
	SRVR:AM4PR1001MB1332; 
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1332;
	4:G7WLUHaLhg2bA2iF+aHLYxrxrgFfq2OMeB+mZBrJZRPPcBgGYd4xJqLPWAy81xsPNwqVGqbTDjf3VJ9ca2Fc2SL5ZNth6zdVwAfsLeDAztYl6n6Vs0H/b2s/mzZLpmHEzTeHUnsi1z/iXXbbuiWbPLB17ejobk44RTtCFlUAQGQLHbouB263x4Qf7t9Og1ZFWbCTkUwk/6xlogEhEmAipNteuCtJjW9yzJiPIikBDxJ43AOamhaVmxf9VR2zFCEGZnjwiTnMT+MWs4QPoQ+eug==
X-Forefront-PRVS: 0730093765
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(396003)(136003)(39850400004)(366004)(346002)(376002)(199004)(189003)(53416004)(48376002)(7736002)(69596002)(6916009)(44832011)(6666003)(2361001)(50466002)(36756003)(3846002)(1076002)(476003)(956004)(5660300001)(74482002)(66066001)(47776003)(2616005)(486006)(11346002)(6116002)(316002)(76176011)(305945005)(25786009)(6506007)(26005)(386003)(105586002)(4326008)(52116002)(42882007)(16586007)(2351001)(1857600001)(6486002)(97736004)(72206003)(186003)(81156014)(51416003)(68736007)(16526019)(107886003)(53936002)(2906002)(81166006)(50226002)(8976002)(106356001)(6512007)(446003)(8676002)(478600001)(8936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM4PR1001MB1332;
	H:prevas-ravi.prevas.se; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM4PR1001MB1332;
	23:2NS+iUlIegRSHMC4/MtBdSq7qpKzpMNBGIw5Pj3?=
	=?us-ascii?Q?ZA3cxR1GijlFrOs50gemZP1v+rU34QNNF0e2A9G4lw3Cob5Mtw7wNwAGDuAo?=
	=?us-ascii?Q?j3FKTM7y7DSpSo4aZef/DuG+nIIHgJSA3u86dlzpRbyfe6q8eTlyFZNyLXqR?=
	=?us-ascii?Q?9F2dbz+qnWEE/06NCanR9M6dlrcVyUmALw+TAcEs6up5nRQCmw2+zhrQPCXM?=
	=?us-ascii?Q?+hogJKnyqWUhc2SRz1XlPdL4avWmipRaCXVLgvPE3rXetsSRu2rwU+ce1kkE?=
	=?us-ascii?Q?qXMnBzXxgm9jF0k1yfLnQCARE5Hf5jERg2CYrc6XW2SNIu3ZPaISaBwtAA5u?=
	=?us-ascii?Q?JJH5JWtCQUBwheelF2Yjrrd4oX9icxYyK6O4P8wq3EasAnR0JJ6lzyo/aglN?=
	=?us-ascii?Q?3qZF4Tuh78vHf3CmewmcQP52olJ1ZNUkLF+H6XIqHcAX7/0hloNNDvL/Gj7M?=
	=?us-ascii?Q?s8+g/bpnK0VBbpcCqyLUy84MerP5Q7q9WMOTTLjyYDsszd4GZgKE3kExWlDM?=
	=?us-ascii?Q?oReVK9PJFdtajheML8hMZH209DvLzUUuifwDAAOP95APXBNXqWY0lFHPkffZ?=
	=?us-ascii?Q?GPNpZd5yihUKNXBpdrkwQo5RN/D56ea3YIjk8Q17L2YIqbB5NfjZfEhTE0zc?=
	=?us-ascii?Q?nYLLiogFDJD5UVmb+RWK0RVyvMO6Sng5I4LfV+EYr5IIGKaF+SvV78wS8x4j?=
	=?us-ascii?Q?4tbSIqDaKmeGy6CV6kt6q6YzVv4XS9WzBE4dAtS2gKRddKlpFUz4HMi9nTKP?=
	=?us-ascii?Q?5xPlScxGEFnXHLPtM6OP3zL12FMi9OmxDxYgJ5lf5PJH9GCrJ3nnmvBvue00?=
	=?us-ascii?Q?NJnPsn6JcL6AtvdgpRM55bFFjH8JE0exKKPiw9IcORKIkkwplQRQxFHOQ7Sx?=
	=?us-ascii?Q?cbhVJk1JMT+MbK9jmXUopyLb+4sqQb+3SgZUVFYF5KRsbrCBfERkbOaASaQp?=
	=?us-ascii?Q?B6jDd21SWlGsTGR5S1LG/jsA5XvVFaldzSoTiWIPAYDLMR1UBBNPDzitqmsx?=
	=?us-ascii?Q?lelmfU/XWHXYyYM5PQ8Ngrr+Gk99/vkiGyPCir4DBgLHM9nNpQZfFj8c0l7y?=
	=?us-ascii?Q?heF57DvsxYgz2l6MU1txZS8vYNprKLQCV26FVzj0BXXSspIjC1QZc8zfLqTj?=
	=?us-ascii?Q?qpcXhh8IUGSshdS+h4e6ufyJbWXSErCXGEM7OEbmFlPVCF1vaj3+JQB+T0CF?=
	=?us-ascii?Q?fLp/RuWi3+v8/D26irSamqKUgy7vXbOiPwNBaGsL958E3ughqXMNiy1W9X/d?=
	=?us-ascii?Q?l++k/guxSqodYBwOf9WGcntIddsOn4yrXK4Sb7GBvjWOXUVeiyCi+62AKOGw?=
	=?us-ascii?Q?jDt6+ueEj4HW1UfqB6sZrorAZFxj+4QJHvO0EusiWRBaN6tvgiINNoB5cMSC?=
	=?us-ascii?Q?4p3Mc32bg/0V1GoUk2ZFwe+JJO1QT7pcDZKL4KLkOX4iMb0yo?=
X-Microsoft-Antispam-Message-Info: 19aUzcLGgMkNDppsnMTrAkP3CFE1RFtSdBQEzTQaW5+nx3OhuKbO9gTduPttTCD6greh5uRqD7DfnnzRrphCBf7mHi9Lz5gSXkf9OzBVLr/tGRkFgeocbuUvrgIs4EYvhcZSoNcIyCLDYf9eDlg9j7UEhdhcS2t1T1HFtnSt81eqr54Hs5KMueIkWQQZBXnFbmyZ/B+8YGn0KnFq3ZRgQvk7UFiRhgYpluQqndm4LIbQAiDwJox6Ihdit7XAKT8uzqCtpzFcmqffhTZ0ccqq2itJTTkcK9Ipj8Syr+MDj2qqKNzHfMSpJFol/loWdHgJIrS+/pjYI8v8Id/gkutIfWdBv3X/PaMucbC7YI/rR/E=
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1332;
	6:Lsr6PcJkjU4mLi3nKv04eup2ivE7QXJ3l3ravr4voNLA8VK+nthiQC6vQULj5culs1oGwPqGZpFNLQgC/X6+X+lR6WhxW7ll/cSPWUApmzWkj4A7OmrJLfzqgpzIoPN/5XzAVsjC1QzhgXSULPehLG5+AQClYveL4ZnqRYhAeWPZSN2LPBFI2REsoK5KV49QRmkTrsjGD6RvUE4ayQuGvaim3E/hh27JRC9Swo6EButU5UQ2aTHihnBv69RtteFxCG0+nn+0XAuNsBo+iA6tBMTiwT6CeBjX2uVDMtHAa8bP4AXTTVNpSIxAKgHIeyg2pJxnHDm0bc24cNW4Fs3PcZX968Q2QKqNEAqplj5taF8reUZRTp8aqmlObRFhUedMyzH5vO73k+l7toNT1AQzxLsD0HWm14LZfMdAENpZz5prVEi9IlGWPVJf3KfiL3RU2sa2sbJhCRmBUMMJfIBTMA==;
	5:PG0cNAWvzJNM+L4HIdQakDYM4tVlLQ8Qi7Jcvdv996pzFhYxRPpVHNO/20bfGnjFlm0PtQuE4v6uBuPULjstnrbgpcdTUEutx6JTGJzXezOUWrzbPCiZM4x2YQF1XladUNTIsv5iKR4yP7y2UE6foZwjDP8re0a34d/Jb8Y1rkE=;
	24:PhZmqHPgDnioT9Z0jvtK1zlrATBixEijBxE+S9eXcsM41jk6eI52rFi2JI7c3+SKE+Eod5kt1TFI8i19fMNmTwthnpvHXOGcph2GSHLin9w=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1332;
	7:PgRWjh5e4csXoQ1s7hpS7kYmSTnq2qk2dKqvXObsO5ugcgxEfl6kRRat2URG37p/0GJjuCdOhwxEZPmmeqXVr3rMDt/qZUxkxIgFAhn1Qzpp3cUAHKcyrMZ3AbyFr4LO7fAQPzXEwzgGMva0upWLb0BtH66oaCS5ojgbp+Eitmm4O5BCY5B0y9I+clHX2RN+ZbVUHR+GmLcsgBbbP+dUtuSwoQ2xYzVDTEzOu4MWrWuKIbmgPggOwpNwPN+wnUp8
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2018 14:30:30.2312 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b155fe8-f736-426e-b8bd-08d5e73adaa1
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR1001MB1332
Subject: [pseudo] [RFC 2/2] pseudo_ipc.c: eliminate some code duplication
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
X-List-Received-Date: Thu, 12 Jul 2018 14:01:34 -0000
Content-Type: text/plain

Since msg->pathlen is set to len in the first branch, we can share the
final submit-and-check-for-success part of the two branches.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 pseudo_ipc.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/pseudo_ipc.c b/pseudo_ipc.c
index 7786880..3571dad 100644
--- a/pseudo_ipc.c
+++ b/pseudo_ipc.c
@@ -113,7 +113,7 @@ do_send(int fd, struct iovec *iov, int iovlen)
 int
 pseudo_msg_send(int fd, pseudo_msg_t *msg, size_t len, const char *path) {
 	struct iovec iov[2];
-	int r;
+	int r, iovc;
 
 	if (!msg)
 		return 1;
@@ -131,11 +131,7 @@ pseudo_msg_send(int fd, pseudo_msg_t *msg, size_t len, const char *path) {
 		iov[0].iov_len = PSEUDO_HEADER_SIZE;
 		iov[1].iov_base = (void*)path;
 		iov[1].iov_len = len;
-		r = do_send(fd, iov, 2);
-		pseudo_debug(PDBGF_IPC | PDBGF_VERBOSE, "wrote %d bytes\n", r);
-		if (pipe_error || (r == -1 && (errno == EBADF || errno == EPIPE)))
-			return -1;
-		return ((size_t) r != PSEUDO_HEADER_SIZE + len);
+		iovc = 2;
 	} else {
 		pseudo_debug(PDBGF_IPC, "msg type %d (%s), result %d (%s), path %.*s, mode 0%o\n",
 			msg->type, pseudo_op_name(msg->op),
@@ -144,12 +140,13 @@ pseudo_msg_send(int fd, pseudo_msg_t *msg, size_t len, const char *path) {
 		// display_msg_header(msg);
 		iov[0].iov_base = msg;
 		iov[0].iov_len = PSEUDO_HEADER_SIZE + msg->pathlen;
-		r = do_send(fd, iov, 1);
-		pseudo_debug(PDBGF_IPC | PDBGF_VERBOSE, "wrote %d bytes\n", r);
-		if (pipe_error || (r == -1 && (errno == EBADF || errno == EPIPE)))
-			return -1;
-		return ((size_t) r != PSEUDO_HEADER_SIZE + msg->pathlen);
+		iovc = 1;
 	}
+	r = do_send(fd, iov, iovc);
+	pseudo_debug(PDBGF_IPC | PDBGF_VERBOSE, "wrote %d bytes\n", r);
+	if (pipe_error || (r == -1 && (errno == EBADF || errno == EPIPE)))
+		return -1;
+	return ((size_t) r != PSEUDO_HEADER_SIZE + msg->pathlen);
 }
 
 /* attempts to receive a message from fd
-- 
2.16.4


