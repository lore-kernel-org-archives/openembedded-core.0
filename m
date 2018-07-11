Return-Path: <Rasmus.Villemoes@prevas.se>
X-Greylist: delayed 21318 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 11 Jul 2018 18:07:39 UTC
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr40090.outbound.protection.outlook.com [40.107.4.90])
	by mail.openembedded.org (Postfix) with ESMTP id 7E7DB784F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 18:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=prevasonline.onmicrosoft.com; s=selector1-prevas-se;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=MKG8z8xKss3v2TrF5ayYKlgELpXrG9VBO8z6KDMD/6A=;
	b=X7HF4fBVxlgdebf1TP00y6d6I1rBfskYqrsTKFWf1s3oX/1YRjcU7Ka4VPAU6NlXw/MSZevE4fXJLYOP+8EsvzjdMsM5K1fZL+8vEe7KNlm90oroa2Ln6C09X3plOA4vPy7yQ7cAzJZ6Az0EcbPaxlsj7OV8T4W6msTcBjdo1vo=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
Received: from prevas-ravi.prevas.se (81.216.59.226) by
	AM4PR1001MB1332.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:98::22) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.930.21;
	Wed, 11 Jul 2018 14:30:28 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jul 2018 16:30:18 +0200
Message-Id: <20180711143019.30896-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
X-Originating-IP: [81.216.59.226]
X-ClientProxiedBy: LO2P265CA0003.GBRP265.PROD.OUTLOOK.COM
	(2603:10a6:600:62::15) To AM4PR1001MB1332.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:200:98::22)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7da19f51-dac7-463f-0f5b-08d5e73ad97a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:AM4PR1001MB1332; 
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1332;
	3:da8DX2II8sV42N84gnEffBzQ38eqzVGkEfEe//uGSgdOwRns1n0ajD8HsyY98uLx2MkTco230AITl0d8uX/9c6QSlJ2LIiWUnysUw+77LSvD8ggQrMWpxp8Ua3UYzAKKvT0rT1xAvb5+TrNxnOF6l/cvAIglJS45ZQK6qYKfmFaqUMwflhuUrBd/L/zxGN0Bz15NQp4YhIjK/RBHr+hPaikUd+C4ANAgXcAYoEnxZGNAP3RxhjUPo7btXBjAX3YW;
	25:I0MWQFnO5862BvdVONx7XJl5p3wJRuMMsUOMXNK5Ow7kb/VMviLtTcsLC5h3h0rxeb3Ji0EcdiDm3LoAKP/6qJaZgsV6H4uvqqbmuwKiL4rlxaEl08YUyAfgWpp6RB+97e2PuDc1LCOuXAaV3l0V07nXyxByuCeLZOd23YFd5YlRo/wQNVLA0rkONGddaWv1UnPVgiQMrUtuREZbRp+s9AsHXFiRNEZgEdxduDxKltFtTbCVZv1lQvyvbSJgzJ3xOSzrH8uxlup3eWr6fs1G9FnINwy6IbZeSpiKPD+PQ6bnr5qbcpVv5FBSVlu2Hek6MYYQbnOjr+CUtvLxvmWeGQ==;
	31:ASvoqRAzVPTguS+v0/8JWtk7Qy2woVdBh7Vo8uPHGbfuuMfYdYhx8vtBf8NBHMcvmwCra4AdkjzWyOKKVqqb/qzkninhjsyydio+DW5QpUHjAAzHU3L8H81iF0g+tgpl26o1JuOBGCSGMAlEYleVIMAPLWudD3alaEPlbyrlrORvHJsA+BhkH3+fDbRSvIPEGTSOrL5Rog/DWK186P1bXEZs94VxJ5NjhdDVeaZo3AE=
X-MS-TrafficTypeDiagnostic: AM4PR1001MB1332:
X-Microsoft-Antispam-PRVS: <AM4PR1001MB1332B52DD07F5571DF3A196A8A5A0@AM4PR1001MB1332.EURPRD10.PROD.OUTLOOK.COM>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(93006095)(10201501046)(3002001)(3231311)(944501410)(52105095)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123562045)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:AM4PR1001MB1332; BCL:0; PCL:0; RULEID:;
	SRVR:AM4PR1001MB1332; 
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1332;
	4:2J8tXxw+5jJAa1mt+s5Ul01zbhqVZclRVQBcML7Byznzt1SpYc3EeiwTIuqXnznQJbR/uBJk+fqZy0q2eLY0GZSMfTomk1f46b4dJGygYyWGBi728UXSn0ZRKKT+tGdWBm7VGUhi0ZoYZqDeQLpFR7Czeczz0NbogfWRRAhAlMyBvtYZfhMpbEA3Hrgv7BWVPDWXy7BpPCuZhqPyxFBMYibV4f1QFbgHUDu3PoDiKnBUH0xo9zogrtzydLkn1F3iFxjdQwxVCzb1VSj/cZvGCw==
X-Forefront-PRVS: 0730093765
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(396003)(136003)(39850400004)(366004)(346002)(376002)(199004)(189003)(53416004)(48376002)(7736002)(69596002)(6916009)(44832011)(6666003)(2361001)(50466002)(36756003)(3846002)(1076002)(476003)(956004)(5660300001)(74482002)(66066001)(47776003)(2616005)(486006)(6116002)(316002)(305945005)(25786009)(6506007)(26005)(386003)(105586002)(4326008)(52116002)(42882007)(16586007)(2351001)(1857600001)(6486002)(97736004)(72206003)(186003)(81156014)(51416003)(68736007)(16526019)(107886003)(53936002)(2906002)(81166006)(50226002)(8976002)(14444005)(106356001)(6512007)(8676002)(478600001)(8936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM4PR1001MB1332;
	H:prevas-ravi.prevas.se; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM4PR1001MB1332;
	23:kNVHzYaDOvYETUIVPZTxnVK1x5BRwmtG+mZelT8?=
	=?us-ascii?Q?RWeRo/gVQZ/XZCIhgR+uFpwdI8t5HVMrJlTmbYwSREnPqoRhFwcWsUyay+uD?=
	=?us-ascii?Q?y/DZ74rS2/QswNYT7xOonsfAi7H5vxF2Th1jdue92LP7ekkwZI5SdOgQecmz?=
	=?us-ascii?Q?B+3vvkmQB4TLm58zpjySnNFF+CgYGlU9vFmXpsav1C7G8GlLbLR2sVr+Ujdf?=
	=?us-ascii?Q?jb3ub1PF2rl0ufKhtOQCPgIhoTaP+QFSFFOMVb2j/CbtmTU5nhXVXoizXK3T?=
	=?us-ascii?Q?GyP9cfHdI6/Dn+QszjZy47UM6Ue7afn/jPg8TrSPw0TI2y56JOAgv1JNppir?=
	=?us-ascii?Q?AIYgfgw9NEGJ0w1Iz0z7J9YZ2EDbx2481DfZjkiLEHJplFYP5E3FSRIXntgo?=
	=?us-ascii?Q?ba2/w/90WIYACZDX9WvanK+dpOe32KaLIn+SHeKGkaeLaUwE4ofU+V//aAsn?=
	=?us-ascii?Q?Iggn90IImR8Z2QVOr7iKYBiy4+yyWsxJjrTr2eWy12VTh+lRpWgWETCePDSG?=
	=?us-ascii?Q?mguXSaO4D6ccLMh6NXMjnav3TuOn6TyhKZVV4tBnbrU3lvFRcORkH0Y2eE2D?=
	=?us-ascii?Q?ZGiCKYMFF13QgaJ2wuChgrEpChAeh4YgJm+klblIoZ1JoJCrGebbIKS136qd?=
	=?us-ascii?Q?/pIGWLtFPRCDjlTcC8bzqg6djLnSgl2jDbEAontSLXad0ipeTJw+A+GuMIDy?=
	=?us-ascii?Q?SgEwrNGn6YLG7Qc9ArM62btPHjeo/G66aOa+CSytTQBtV9gG9Q6FrX4zQZU7?=
	=?us-ascii?Q?JOh2uSNBMJGL43lOijevwWcdj2tdqhPdKA0FJZvEuazn2srSx+iec60b5mxy?=
	=?us-ascii?Q?Q/CAnR1lwte1UYwnr8qa33NN//aJGa566OeYX2yxvcXrrGi/F6ll71zY/25F?=
	=?us-ascii?Q?KTbLKf1OR7yXVt1AUOEl8V1nTvOgRfHUxVA9Kun/MC7S09PYb+d+KeSIuAEW?=
	=?us-ascii?Q?ToIyBGHie/CqqHBWlsj8GLutE4nb7dPrIuk2ZCsElhBw+CEzd+iBtDECoIn/?=
	=?us-ascii?Q?VbEdAeos7Rn53gelRHIAZm4hkso2FzingGMT8tLmeJ3WjhY1IzJUm4B5JHkC?=
	=?us-ascii?Q?7xcsI3O6Tq0wtk4aYcb0gurGxSuUZakvEXIZpwIqbARjviT4AXpH5SEvPXsC?=
	=?us-ascii?Q?4YsUHRnaG1mRoyKitdPsC8S5g3CL+Q4YyxTENbEzNAsjuud5yiRCdM7+BBU6?=
	=?us-ascii?Q?cCro2SzeNDuS3JiYgozzuHzS6KSnlu+rUzfuCDdn6/rNnbeViitT3bTQk7kz?=
	=?us-ascii?Q?kKd0srYDdUSwt71396+HU/YsLJFV+TdbXkqxjwgS7I9ayRXU4oyYZKzkFHYE?=
	=?us-ascii?Q?D52mBu1BBi4sMzVemkDZr0QAH3gVGnCfX4jSXFaM61VIbPdUEJIxdCFzxH4b?=
	=?us-ascii?Q?w2q+rGQ=3D=3D?=
X-Microsoft-Antispam-Message-Info: X1baeVKOwfiu1DOBRSfYueee5IvmZ7/uM+cS2p4vT3aWjszvIbLSmzMFVMOXPb7STuRaoNgS2n1gCfmV4HtsJdtfyqQmA8hdgaEBDZIEzJmrJcgOPBTQqRxiSlICyxppE5K9bWwXzVmW6UKVTtmGAYnkUX/V2XV1TX5CehcyM0+Sg25BHDiCbceJjqCCOCL2js8I7p10tQreV7YqSDPlT+hyuvbBpPCFIZsKHBgtdYYJJkto0/GvDzvNO9tOhZ6wbnH/stBW0EHkXLfv26ZVRjQoZI+gU/5Ov9jrcdn8I5cNvEWuZgfvNpd0o/PrpZMTi1wQ3Q5c/WW4NMO4Ufpy2GcLFnsIquPheTUpf5623BQ=
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1332;
	6:O1nVuyKDqp1YI8m7gw4fc5ya7fxadG9Ha8GvCH1d27S2asIrIKCqHt2TipGn9Jfv+Tfhd+ZonYIivZAFTszzGXD/thO8NqDopd5YhE+2qrCCLaJmTye2WX7LuilEck4PW2FEb711LhDk2rOumdxM2WJjpfw2f9lVMqZEoYVKbGugCJxJeSigCQIy0e8Mup1juWiZ3ekIE71C9P5jjBNWCu30lr4TCvZsQM4MzZmiBpv6mQi81MEB5ZfIjiCwYTW4n3nCn3OLZVJgDyx6j1B1DFDGNlSta1NelHkIMnuHDoeqqhPKDbX882dOGxQOYoEwMT7UOIpp0rQHxG+NrnSttScMST59cZJFwioqIQ2iRXkgIZ4rcVbTSgB3/oyK0BRs9n7KRWD20deFXeChT4PJmtmwATo2XEoy9YaLul+Bjy7ALJHnDiuRa15n8LQrwhsAU7uH1XZNhYVE7coPUKpodQ==;
	5:GA7Z0yqvh7SrkH3tR3KG9swgmOA2VybLRY68NN19OCYixodEoDVZtlMbewdZfWYpHO/mReZZ5sAI7Y3XlxwoqulVFEe2mPQVJnjXfihiiJPHa91u+qINpFVO2jmpv6Yh70Wsug28hEo3JKf/SR5UqOqE3nPlOeoEuU1Ecn54eAQ=;
	24:sMQIzVDlf1zlSKhF72qRRceUCY3Jp2cidjYrbLayK70gqWUJUtN6naTg0fyrOkCMf4xfe0wJIHcVvZmwy5p0DywRboeeorSM0aoS0MmOf7g=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM4PR1001MB1332;
	7:m/b87MgG4RkJf+BUKaTUFxJQBjkDeCwsJnrUO1PRV7+HVbeWR2fgwrjvXVdSoAsOxt4KWvx5LdBplSB8HyX/2p5cm2wg3jtOy3cQy0uPMChdu3I9uHlBqoX8Up778UQuWMyGPcaIT3E+ZTPSS92eCGjkAiGqqEDYbOuXYr7xP6FjZCvEjldE2xFIJvLbbSLOBhbQhIJg13d4BbqNshl1WKaPBt7ykzSCg7pUYmWIUU/CQeXGYZr+T+syV1zIsVF8
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2018 14:30:28.2915 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da19f51-dac7-463f-0f5b-08d5e73ad97a
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR1001MB1332
Subject: [pseudo] [RFC 1/2] pseudo_ipc.c: Use MSG_NOSIGNAL if available
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
X-List-Received-Date: Wed, 11 Jul 2018 18:07:40 -0000
Content-Type: text/plain

MSG_NOSIGNAL has been in Linux since 2.2, and has been standardized in
POSIX 2008. Using that when available avoids the overhead of the two
syscalls to set and restore the SIGPIPE handler. Moreover, we can
eliminate one write() call by making use of sendmsg() to do
scatter-gather I/O.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 pseudo_ipc.c | 63 +++++++++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 50 insertions(+), 13 deletions(-)

diff --git a/pseudo_ipc.c b/pseudo_ipc.c
index 82c6f70..7786880 100644
--- a/pseudo_ipc.c
+++ b/pseudo_ipc.c
@@ -26,13 +26,17 @@
 #include <ctype.h>
 #include <errno.h>
 #include <sys/stat.h>
+#include <sys/socket.h>
 
 #include "pseudo.h"
 #include "pseudo_ipc.h"
 
-/* Short reads or writes can cause a sigpipe, killing the program, so we
- * trap it and report that something happened.
+/* Short reads or writes can cause a sigpipe, killing the program, so
+ * we trap it and report that something happened. We can avoid the
+ * overhead of setting/restoring the SIGPIPE handler if MSG_NOSIGNAL
+ * is available.
  */
+#ifndef MSG_NOSIGNAL
 static sig_atomic_t pipe_error = 0;
 static void (*old_handler)(int) = SIG_DFL;
 
@@ -51,6 +55,9 @@ static void
 allow_sigpipe(void) {
 	signal(SIGPIPE, old_handler);
 }
+#else
+#define pipe_error 0
+#endif
 
 #if 0
 /* useful only when debugging crazy stuff */
@@ -66,6 +73,36 @@ display_msg_header(pseudo_msg_t *msg) {
 }
 #endif
 
+#ifdef MSG_NOSIGNAL
+static int
+do_send(int fd, struct iovec *iov, int iovlen)
+{
+	struct msghdr hdr;
+
+	memset(&hdr, 0, sizeof(hdr));
+	hdr.msg_iov = iov;
+	hdr.msg_iovlen = iovlen;
+
+	return sendmsg(fd, &hdr, MSG_NOSIGNAL);
+}
+#else
+static int
+do_send(int fd, struct iovec *iov, int iovlen)
+{
+	int r, s = 0, i;
+
+	ignore_sigpipe();
+	for (i = 0; i < iovlen; ++i) {
+		r = write(fd, iov[i].iov_base, iov[i].iov_len);
+		s += r;
+		if (r != (int)iov[i].iov_len)
+			break;
+	}
+	allow_sigpipe();
+	return s;
+}
+#endif
+
 /*
  * send message on fd
  * return:
@@ -75,6 +112,7 @@ display_msg_header(pseudo_msg_t *msg) {
  */
 int
 pseudo_msg_send(int fd, pseudo_msg_t *msg, size_t len, const char *path) {
+	struct iovec iov[2];
 	int r;
 
 	if (!msg)
@@ -89,14 +127,13 @@ pseudo_msg_send(int fd, pseudo_msg_t *msg, size_t len, const char *path) {
 		if (len == (size_t) -1)
 			len = strlen(path) + 1;
 		msg->pathlen = len;
-		ignore_sigpipe();
-		r = write(fd, msg, PSEUDO_HEADER_SIZE);
-		if (r == PSEUDO_HEADER_SIZE) {
-			r += write(fd, path, len);
-		}
-		allow_sigpipe();
+		iov[0].iov_base = msg;
+		iov[0].iov_len = PSEUDO_HEADER_SIZE;
+		iov[1].iov_base = (void*)path;
+		iov[1].iov_len = len;
+		r = do_send(fd, iov, 2);
 		pseudo_debug(PDBGF_IPC | PDBGF_VERBOSE, "wrote %d bytes\n", r);
-		if (pipe_error || (r == -1 && errno == EBADF))
+		if (pipe_error || (r == -1 && (errno == EBADF || errno == EPIPE)))
 			return -1;
 		return ((size_t) r != PSEUDO_HEADER_SIZE + len);
 	} else {
@@ -105,11 +142,11 @@ pseudo_msg_send(int fd, pseudo_msg_t *msg, size_t len, const char *path) {
 			msg->result, pseudo_res_name(msg->result),
 			msg->pathlen, msg->path, (int) msg->mode);
 		// display_msg_header(msg);
-		ignore_sigpipe();
-		r = write(fd, msg, PSEUDO_HEADER_SIZE + msg->pathlen);
-		allow_sigpipe();
+		iov[0].iov_base = msg;
+		iov[0].iov_len = PSEUDO_HEADER_SIZE + msg->pathlen;
+		r = do_send(fd, iov, 1);
 		pseudo_debug(PDBGF_IPC | PDBGF_VERBOSE, "wrote %d bytes\n", r);
-		if (pipe_error || (r == -1 && errno == EBADF))
+		if (pipe_error || (r == -1 && (errno == EBADF || errno == EPIPE)))
 			return -1;
 		return ((size_t) r != PSEUDO_HEADER_SIZE + msg->pathlen);
 	}
-- 
2.16.4


