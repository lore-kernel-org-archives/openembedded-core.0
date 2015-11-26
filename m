Return-Path: <bhuvanchandra.dv@toradex.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0148.outbound.protection.outlook.com [157.56.112.148])
	by mail.openembedded.org (Postfix) with ESMTP id 342CB6011F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 09:12:28 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=bhuvanchandra.dv@toradex.com; 
Received: from linuxdev-in.toradex.int (115.115.225.206) by
	AM3PR05MB257.eurprd05.prod.outlook.com (10.242.249.14) with Microsoft
	SMTP Server (TLS) id 15.1.331.20; Thu, 26 Nov 2015 09:12:26 +0000
From: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Nov 2015 14:41:59 +0530
Message-ID: <1448529119-14843-1-git-send-email-bhuvanchandra.dv@toradex.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [115.115.225.206]
X-ClientProxiedBy: HKNPR06CA0034.apcprd06.prod.outlook.com (10.141.16.24) To
	AM3PR05MB257.eurprd05.prod.outlook.com (10.242.249.14)
X-Microsoft-Exchange-Diagnostics: 1; AM3PR05MB257;
	2:xAVeLNHc0HFR81E5ZD1zLYzK/C+IFRsHQcqcKcd0PHHkuxdXThFxP8r3kpRovdirQGQeeGqAkPIfXbFx8e+KMvaXa0AmOb9rTQFeg4ykFNTXKV59LWgf5wQjwx/nxZlh5eMuJ0Wwjb4POaTJoa5SKw==;
	3:BgyRpeNvYtYAZCdlmDnrPiTOrG5sN9HfGnZ9r6oGpnUZYMW8GLhwOmJBCpIWnG8kgbYqGW/5707jVVuZbqay0ZyAPtOWoCT1Z/hpDugPZtZt6v2n02qi/Eb1gIFqesnI;
	25:/jrWB6Snj2V6P+XSyQxdsh1GFC5EPGmttV8aJb/75xAETkJrDh/JgAt+IWffarpefHBI0oy+iToUZYmS+DGnD5i+ZZPjC8JjkB09Oi6W6oUIKSnbR77W997DZJ4Rqr772oq3AsbScwTWm4oHzz57GKkRjp4sfANZsWOYXtFmudVde6sdTeKotlXILsK/JOVCjqzyuSklCNRG33ivv4ciYcoMPSGX3WY1jKqxeU1HEZLJAPcTGM3b1VulsDBmRfF+W9o0CQf5poMwb8yMbjV9KA==;
	20:Qw5OvphuGKIP1UJ8ZbxMSgUfKHEIRC7V9Aby9jb5aAV292DwSscBa+oK6woLShhva87zLGM7nClti3nEp8fo+VOUXGZSEayC+tZa9appdWGJTyzt7OKgrKQ8wIybEQuh3gWFIa4yQiEnVrY2pmILZQGWLhgdPeew/McMzBnZQ1VQwhdIVaQ38SVia/mBKlbGpbzFYiDZH4tZae5FPyCkE8AJuxtCePuX2SErG1UT3fsThAuhr1mktca+qHJWXX6uOfuKPcJ6SDJ9xIXoZssdqsSnUElkzDcsgbdUKTBt36ekO0zc6LEymiUN0cBkWb4h+PMM1A3CfLTY+otccmu+sQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR05MB257;
X-Microsoft-Antispam-PRVS: <AM3PR05MB2572BA4820C6472E7571E5F8D040@AM3PR05MB257.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(90676262408878);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(10201501046)(3002001);
	SRVR:AM3PR05MB257; BCL:0; PCL:0; RULEID:; SRVR:AM3PR05MB257; 
X-Microsoft-Exchange-Diagnostics: 1; AM3PR05MB257;
	4:oAG7+P6R67/3YRLAYJP6oAoAAWXVsJnnWxfZZ5Abi+4fXKvLncnq1vl8+Q9g5O43A0l1C3EngS7MOcSqGhAP7K8b0vQk/u7db/s1CE/MGELbZJkSkXtGH1SxIoQXZj89resHPBoUtDqAm/vj4bv6O30VvxKMk+KUKw8Et2Y/duBH+FCkRYlgLhPvHpFYnncLrP3GhSLZaElMx7D6OCVoDU8IZw3VicBJuOOBOfPyzwrO3/YmnAd1jbiB/uKIHmu40r9R0OMxWrha/hGqGqEHRmQzlqZ3bnu0IByShp3F+YWXUsnLyd1yfS9vbz/6LWv+AHRM24VRbM+cjiEKkvvVAgOacJgGK71wcHL9D3x8EeDVHHUFyR+SCywP+xaHg2yQIB+pADOTL4ygaJNAByA79n3E3fODDepWIq2eiwiCU878GWOfa0fTfiODeUWe36KO
X-Forefront-PRVS: 0772E5DAD5
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(5004730100002)(86362001)(229853001)(81156007)(5001960100002)(42186005)(101416001)(105586002)(19580395003)(87976001)(106356001)(5008740100001)(50986999)(48376002)(66066001)(1096002)(50466002)(3846002)(40100003)(33646002)(69596002)(107886002)(6116002)(97736004)(77096005)(5003940100001)(36756003)(586003)(4001430100002)(47776003)(122386002)(50226001)(53416004)(19580405001)(110136002)(189998001)(92566002)(2351001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM3PR05MB257;
	H:linuxdev-in.toradex.int; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: toradex.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM3PR05MB257;
	23:hOQU7UBajBoEMuazQgl/0TQZBAIyjogMkykVFUD0T+?=
	=?us-ascii?Q?horlsta0NTI8UvHJk+SDTOJutDkThjmiHvIZb6iizp7buQusTzSRYxHnDhiW?=
	=?us-ascii?Q?/PZ1hjeE/BVDdxeiHmwmwFZZeiH9wXadnZ0TSVMCboGaUvoo2z+Z76s0gpiu?=
	=?us-ascii?Q?6g3sawhKNJPmadeeTPVHLRbrBSubzEV+tl5+IO48PPi/hClVYKzOQuDjaFLG?=
	=?us-ascii?Q?EuFSPndJOMKY5AMOhOZXgbp8029c74pcJD2Rb2uAZ8AsL5e2tOV3SJ+uPbxw?=
	=?us-ascii?Q?aEoAM1B40XqRSGVRozz7na6NYe7YrO/CD6SvdcIPsLf/gHAYDt+k/3O40ytw?=
	=?us-ascii?Q?kCuNhKfpjq5Bff4zY74MVVYccuDCY/WSG3i3EH8K/9P+g4ceSG+oIfAYBcP/?=
	=?us-ascii?Q?diRbWvdLwD2GZHb5WoiDeH6MBk/wIcID4R1Rnp5gHcQ2GgADe5A5Y2LM5Gjz?=
	=?us-ascii?Q?sM0tX18pvgbrfcRcpGZJK1iUEA6pPD1gB6aXy+W1ewHTHwYdKruN+qXUHeO/?=
	=?us-ascii?Q?1eK9/fMT44Vk0e2g7a7w0ez4/cJN9LQZ84lEYzhp+LKq5x0SshKGb5XXHFc9?=
	=?us-ascii?Q?MM2L0ffPbjG+87rYbvO1sQlM9L4vULx6+Ta5llDAlXVdVQ39y8C9VxzqKbcj?=
	=?us-ascii?Q?cusJDBGHryg076QZReBMBQWh6WSDqxSg2xtNzkEI6IWGBE55VwBJXQ23G0lG?=
	=?us-ascii?Q?LK4nfU4DQLNwFU80+p5iom5X7F8ja7dsFt5bO0/SQJCI3swF5XugnRNobKsO?=
	=?us-ascii?Q?DsEGNNUJjTcdHmlp9qv/jm3EutRPY3Cw4WAe2ScHz6+olC17/URE6uSi3ORr?=
	=?us-ascii?Q?jAgdVo3iAbPP3V7LWPRqTCTIGXmXZGjLNAXBfL372sKs6Xl+iQoQ5DC41fbH?=
	=?us-ascii?Q?B5/qdzMRrC7YwQ9KtesHMGCl4nNdw30qzYHI/ctUyeTeTngTKAqV1/GhvqVa?=
	=?us-ascii?Q?YSlR74TNAGqOvYkIJIxLBZLlCXAV49Mt0vy1pWg02aphyUd+f4SrneLQhuXY?=
	=?us-ascii?Q?KRiEKOFDw4bfzEvLYmJhUSAhRVgKcpdr2ftCFx+sfnqeylpBrmG9MQZzjDou?=
	=?us-ascii?Q?s/8f3lq6YPzCx1Sg7B18xNsOwju1DEhYEOh6soQvCMeJONAA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR05MB257;
	5:NKn8OszewRGHkcgQTe0eSV+pjFGFfCC3HJadrjUL1RF7imHNUmruxPEt8sS/mGzLWh/W6yNEghQcqWPAx+ielg4yf8bTKQRqR0Do+XpVLgAtwC+Sl4Zj6IsrNtnYI0K2sed2cOpFCeDov67TJ7MFjA==;
	24:UPOBRgA/BMUAAmR4cBVwnnQzv8f9JS1crTcgCdUZjyH/wKymb+HfBRh62W6jC6U305iHsMG9qir6eWB5g8Hm1Uego+Cmf1DQ9DFx0htls3U=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2015 09:12:26.8255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR05MB257
Subject: [jethro][PATCH] linux-firmware: rtl8192cx: Add latest available firmware
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
X-List-Received-Date: Thu, 26 Nov 2015 09:12:29 -0000
Content-Type: text/plain

Add latest available firmware binaries for RTL8192CX chipsets.
These new firmwares have been released in 2012, have been used
by the mainline kernel as preferred firmware since 3.13 and
even backported to stable branches.

Signed-off-by: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 4939ca6..0878ab1 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -260,10 +260,10 @@ FILES_${PN}-rtl-license = " \
   /lib/firmware/LICENCE.rtlwifi_firmware.txt \
 "
 FILES_${PN}-rtl8192cu = " \
-  /lib/firmware/rtlwifi/rtl8192cufw.bin \
+  /lib/firmware/rtlwifi/rtl8192cufw*.bin \
 "
 FILES_${PN}-rtl8192ce = " \
-  /lib/firmware/rtlwifi/rtl8192cfw.bin \
+  /lib/firmware/rtlwifi/rtl8192cfw*.bin \
 "
 FILES_${PN}-rtl8192su = " \
   /lib/firmware/rtlwifi/rtl8712u.bin \
-- 
2.6.2


