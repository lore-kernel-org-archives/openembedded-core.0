Return-Path: <tom.hochstein@nxp.com>
X-Greylist: delayed 7278 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 01 Feb 2017 00:29:57 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0076.outbound.protection.outlook.com [104.47.2.76])
	by mail.openembedded.org (Postfix) with ESMTP id 6D72071CA2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 00:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=VlGGtLnBL2ljWE7gEM/2RrhL1VUzoSypFP93ZKKUfwg=;
	b=bXtS6stvzxm5g3jSMIy5yIM4g4L9SRosz6416ObINt0M7ITtM27ZyPaSFP9eOz5vU3Ufy11jib+51y02x+v2bHXkrQR+pvMmjb7sFD1hiNQsFR1MXZZxGt2boKyXTfO8SMu8y6eiPYXYCr3Sf14Q24IbWLLxIfuRB1rqUXWkjWs=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.49) by
	AM5PR0402MB2817.eurprd04.prod.outlook.com (10.175.41.136) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.860.13; Tue, 31 Jan 2017 19:55:25 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Jan 2017 13:48:29 -0600
Message-ID: <1485892109-2868-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.49]
X-ClientProxiedBy: BLUPR0301CA0001.namprd03.prod.outlook.com (10.162.113.139)
	To AM5PR0402MB2817.eurprd04.prod.outlook.com (10.175.41.136)
X-MS-Office365-Filtering-Correlation-Id: 2fb0eae9-0037-4f2c-a203-08d44a131975
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(48565401078);
	SRVR:AM5PR0402MB2817; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2817;
	3:UUBopvRGy0jfLUphnz0OsI7RxYKHTd/SixNemRQFdXbTK+NSaWbIN6S4RI8dZ967kgxcAy7SZM2Rq10aU5kBS8oja7jh8FKg7X03u4P4Qrlj9+ojnEjNtPeHu3IL7BvvGVwUEpyzxXynl1pB/QhdE/kvKCOl0SL9E6m9A1GCBIPDv0fmCqB0f1o9Jn1oDJHkP4/r5IjiHUJnWoEZtwQOH676ov5SclLpqv2w5asPYMRCRunkDl2ls/qsI35roy2OTA2rvhhg1cFXhJhUMl0VGRrXNtnIVji8bYwTMpV3ilk=;
	25:I1FAHUylfQv1/uAdz6n8aYqrpR5DUBIYvw/oh7QZa7gV6pSoIO8pXhUJ4eGmbgwf3xHsPN0XRET4mggkr2eGH98XXd0Y/trRmtRH0YjiFAfLSLnSbw2d60V6NZdDGrRT6FTgFJG3gFAhmSzsahrZd1gKBCavgp4HRNxI2U3dwr68qxAhgWMxhIjPFxJPFqVUlX0h6Bb4/Eq/l2z1EWbizWblIEH+ExeIfRxTf+yXKHms2VlzQkrE7Gf+Iy1EM76p7ub0sxbgeGOKD9yCnlGzSmr6p0jGZ/Jk+HUngGj4cyf6I5Mo7AFkj98SsVxc8Z3mCxlRKcVwQ65bTG7HRj1RDm9TI/eWVE4CDRxl+ADDfgxPSwaHMuv9eoHnlikE7wMdHTKNT3m0Y0kZAQLg8ZtjJOEugQq1Z7+X5JFrQR+OJ/rM+j8VR4uXT1dVhS1AWEc9XjFbtIsNkFFVJEW7qhapUQ==
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2817;
	31:ZVHwteO0s6qgPU/7BrFf/aiWv/J6GeMp1Pg2yjNzfkQTrPa6ZLF5JTUcd22Y6wk8GIyW7M6b4vUVF5vbvofrBulQRnFZ1HZmTUFTgl2xbJvXHkKaCv9loDQ6kshTzpCB2vamEKhmPbKLA9cjcPEXROeUq1/TJSYDgIUbp7GARDI4YLCGPQVWL3QN0HtWEMCEgXMVvHYBfZMkxdD2YFIBBA+ZGKA9mGQNy9dMvhGRObgLIlzCk02naNp2aDVS8t47VmAYRTvzn8VOjnP5KNkwlQ==;
	20:aAWlvhF75svlotNM6lG4EnfuoaASuuPLp8t9dKfZabSV64OPX7gmrvvuzw/L+fDAoOVOoaeLSipQTNT/UYuecnR1zjHHD9Dsv8sZF5NPrCSt603gt7q2D9Y9ZoKIs+VkWAQ9HeHTrUtvXszrbTTYl/igdXWo8GD5J5FyA4NFn9fO0QEaVIP/lOZC81WQ0JrtoysYVSJyiSNG+zbtiXKb5/5l2V1rYbDvIujIzM+5MRH93TvXP8ihv7aPoQYy3gmQzdEu+xS4ziyXjjsLfVjR5Lsu7/iUg9GVuFT0pe0okQBtgNP0Tig8qlUmjKLaMSL9G6gVLx30Kk4yjXvr7F28Pd5eQHtQkYSj4L6uEnlnj6rI/p7eu8URgTvSNqKEMY4Ag5y9EIPGE8FcmtpQpl2moR6lc1cBR/xnxH3z943t14oqB0SJwywyhD/83lkyJ8u7SWEJT0SdIZQpc9We4BjwMzdgjFTjB6RCQ4bFCBZSuW8ugEHLoLIQk/cDTeY+Qzk4
X-Microsoft-Antispam-PRVS: <AM5PR0402MB28174138BE2914BBC3FD5A90E24A0@AM5PR0402MB2817.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863)(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026)(6041248)(20161123558021)(20161123560025)(20161123562025)(20161123564025)(20161123555025)(6047074)(6072148);
	SRVR:AM5PR0402MB2817; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0402MB2817; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2817;
	4:4V4WxIGr4YEr6sbzqE2vNL7tWA9S/wmq2WRZu8hYvrFO20YVChS9+0LKHvbyUNjepFob56tDt6wG+sgCgF4yDPHGoX0Z3Su9DLyksQPXSUtBqjkL0AT/h443DcFCXnSypmYbWJ00Kj+ox3JF4Q4esnGgyoddk0l6k8+kTm2rMaBAFMtTDlcwpXebwh5Jmq7R6qSUvQiQkenXeyww+HqHcl2eLzHhdSAU/h8GUBB3mGKrKJh66nrPOF7/NB8Y/Wbs19f7FlSguxdFcHmeLknwaBGcLei/7DzNIMqSfb1opCRpLU7L51TbudWtfQNIyB/ecMG6/PwfVp66MlWUZ+dzc6NSRXEcUzgJJypu1DFVIU1iDdaXDu8RNGhK+oLL11CqltIQJx34GTUJD45Jne7oPNsFbFRh17Gt+MnVpuKaoAen+frscO96Kiys8MA1JsGMKhswe/Q93FsjepCSLP9jrkhJv8wWHWrF+zMshqivqONEh0dz8rXuQ5AvWW9j0SLQypBYeEZ0qjGilwss5d3G9OF303TPHQcazh1ZPRLHryatNnbCFI1fmvLviRQ6ma9/+Hj8APcGzd3LnxrNp+EeaqONAwtmQEyVw/qZbEEdXU4PzGTyTohZmBk3kR3e3s/VZuaGMgOicLVD8/4JbgeiS144SVBjxZ36NMGeI11Cy3qgL/SdhIzsUZkEPCJWqkzEI2GFx4beVwWEEFTxDH1J6Dzm3+zqzGS4q7qL34nF/gQ=
X-Forefront-PRVS: 0204F0BDE2
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(39850400002)(39410400002)(39450400003)(39860400002)(39840400002)(199003)(189002)(50986999)(189998001)(97736004)(450100001)(92566002)(36756003)(4326007)(106356001)(50226002)(86362001)(42186005)(33646002)(2906002)(38730400001)(2351001)(6116002)(575784001)(68736007)(305945005)(7736002)(3846002)(6916009)(81156014)(66066001)(48376002)(110136003)(50466002)(47776003)(5660300001)(81166006)(6506006)(105586002)(8676002)(6486002)(5003940100001)(25786008)(101416001)(6512007)(53936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0402MB2817;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; PTR:InfoNoRecords;
	A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM5PR0402MB2817;
	23:PFIhqYQDCeCMprYD8OTJs1LGWRhhOVaRxC2k1OJ?=
	=?us-ascii?Q?QRPeAsrfZsMxld2x/zR4mIgV9DtefH6UBTshfnh8pLD8RWlachlKGw/Q5wZ5?=
	=?us-ascii?Q?qZEeOrdq3uo/FNE/JnxLKxzXAdQeO5vpsuN7hWx8W0BozmFfF1Cte1wLGdM7?=
	=?us-ascii?Q?+78IH9dghZdpHZovGF+JEEFDtgGVjAIPXTkJb+kVXxprlObNmi7EmmeJn7ZL?=
	=?us-ascii?Q?llhjTirMVKYtK2pLy1b+OBvmqo5oPFyQaqneIyQynsAWXyzqtTMIqsW0Ve8+?=
	=?us-ascii?Q?szWciSlaGaEFjs2yniNza65ar6r2yYHJjlfV7RaBamsl/76LR+WzRm2DnStd?=
	=?us-ascii?Q?wNOcEKuhLbebiEDM2yJ8PbEkHiee0HstIQkZNSipt4IXViw24Ii2z8WzQaiK?=
	=?us-ascii?Q?lH0vfyDkVj57k7HvvaaBto2F14jZgS8bStK+AKe9cc+XFLnWHJz4KYCpuWK1?=
	=?us-ascii?Q?12LHzwuy5hsQh/CQV9xXpMOwP7YUEeRkYbJRSLWip8RjbN1wbrHJ+TQ1n7xu?=
	=?us-ascii?Q?eTig7pDc/QpnokT1k+jWcy4QfsQSk4b4Jp80IH6HnVJj8g9dwnMOUxS6X1TD?=
	=?us-ascii?Q?B6Fe+6HbwFDS1yx2vdZbvvcNiEeUIzELBo+LPB22z4BRmmiqLGVZUcYaXonA?=
	=?us-ascii?Q?E1whFGx6zJVsjELNNR29HFqRxb6yMtvC0Rr6jom+VwDVFyycTeBvx5S3ifgH?=
	=?us-ascii?Q?b+8B7p8K41EtXuDzTn84FOFhJAPU3V/UaYdlZ1Er4XKzH9HB4fdmeposVE4o?=
	=?us-ascii?Q?VNxi881t8YGRj748PjEzDt/ektTJYKJD9HDl5HF1oehO2q3FDAFlV2c/S6FO?=
	=?us-ascii?Q?b7zXas9QcyAdYZfbNSo1Uxt4rQWSogoXsvtv1PyqfyHIgReXBVEHPcwIfZcZ?=
	=?us-ascii?Q?V4A4k/w62OEPhXYkbIXadFDy1VlljsY3MvkMycvcEd1NGn5jtADSzYAUJJWb?=
	=?us-ascii?Q?D1MyRBJllZ+NsLiySclc49hqwhhWP5FnHWjNUnA2R3FcPqVwLjsZqi5ayjmV?=
	=?us-ascii?Q?cPn8Ie/dC9ZMdOhSd/JBEcKXrXvsy5nGY94BtNPRzZ5hN7X9APda7vnT+PSV?=
	=?us-ascii?Q?RK6n2XYwjCfHpBQdxjOG2VXfgaoTsgtS+chqJrpU4PNgZOo5Cb4CyAavEo4L?=
	=?us-ascii?Q?u5VyqJlKUVaLHsk8xUDDIDBTyk9/tpEit4cvlRAApQOTurKY8QZPWK/LiMiy?=
	=?us-ascii?Q?PcxIWta5kZtZ2kgLHnmVSloCp7n2VXvqxT4in?=
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2817;
	6:z/Z1XvO8fWDQaKz8vJPmnp80zYyyUrKM5NlY7fSHavDsWC6zKYyAiZDrZwOYIbMYPTeE0cgjY+ChM2783dcwzQa+eu++6sn91DfCO1W0WiPthINM4RNrefOuAwnZGTCGNdBEV4b9AHIEyIe3v9P+ibYNFlUDOC+ID/wbIYTzDiUH+utTktQWELmSpjUla12roJzgUQbJnvvloiAWpUGZSuPBkETP1pDE2aGTiwDaFgQTZKSgBFLUytsddFOl3+LwnMJ6+WfY2/pdeRhezon7VfR+ALxI1fEoBJcvfAoO1qczuLt0cMCF1yZhld+Jv0lnxqa51k5PED1GAUQ82AucmXBL463vhQzoI53lrdSaG3uY/UO9DcqCMGK9M2ixaaTQJ9w62Buwbu8n0qn9pwdyEDtya1NK1JhrJV4D8+DfXxtq8UUU2L3EnhWjT0O3wmv8;
	5:cnYs5zap64RQ/t5Y6ETju7vuJeXEyqUkp/suNsiwR/WJoGDIqac+gpL8HKulkgJJ0n6FHmgEY3KgmoGuZF4ZpqFiTnMd+TX+NYxHji4gPB0mc8alJJL5Box4E4n8+lyDCDBLDLinm4sPnDv4TFEZj7dziM5cLp4+mR8bBeeLans=;
	24:FfZqIF/dGKiwyPzYmjaKyhJYM90sDdHNwMlGIY9yzs5/+SNLO5z8AmpqHk3r8/IjDuV0HijJVql7F+YHqacKvTE/NNYi/Hh70MTrij5ynj0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2817;
	7:jTdVvihgz49LjNNXGThi07N0hZ6w/4OYh1RFJFyW8Q8Jb0DFoZsyls3GJ33fpmKKjGsSNq4YqjzK8TDW8HDbDKsxG4HHwjeBL3bDmJuOx8E8MAvQtDgaxk313TqUDcU4xlkGfeNDxRD6QzWT4HXghrt0zfWJev5g3/8Jh2fZkGzMnG2G4k8OYkW4rxO2dKFg81JxkxRsh0xpq/rUcb0QK83HogVyeVSsZK2xeVY34q4t7EvhDfxdBpwO1IX4gVyPXqMdpT6e0LK+u/Vu8JArEYPEuLNN+PN8oozzI/5sDqcs3lkIJ4fpg5pSc7UaTP7TAkjYBTQVD7dJK5krNMF3EwxDigUOs8F69OXRy8sa6gLsSuX+Uf9FQwzbiLv+++YkQ4tS0ijUSaMofT80ZgX1IWMsTFPvBMFv1LrLMkjoGdGExv0gAZZACyLYSnj+o2TmR5g4wK/YKJGA8Gk87aKpj+ru7fEHV2/wvdjF3JgYnyPVybW7K96WaArBQKnpk0LXUK/WPxmmAcOb/BqlRLpfnGFR7ZvP3YLWWiWtqEuiiR4p7n4palHFargg7Mhvpsnm
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2017 19:55:25.2841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2817
Subject: [PATCH] xserver-xorg: Fix X server 1.19 crash
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
X-List-Received-Date: Wed, 01 Feb 2017 00:30:01 -0000
Content-Type: text/plain

Commit 6a5a4e60373c1386b311b2a8bb666c32d68a9d99 removes the configure of
useSIGIO option:

xfree86 SIGIO support is reworked to use internal versions of
OsBlockSIGIO and OsReleaseSIGIO

The check for useSIGIO is no longer needed.

Upstream-Status: Pending

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 .../0003-Remove-check-for-useSIGIO-option.patch    | 45 ++++++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.19.1.bb            |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-Remove-check-for-useSIGIO-option.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-Remove-check-for-useSIGIO-option.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-Remove-check-for-useSIGIO-option.patch
new file mode 100644
index 0000000..db2d845
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-Remove-check-for-useSIGIO-option.patch
@@ -0,0 +1,45 @@
+From cf407b16cd65ad6e26a9c8e5984e163409a5c0f7 Mon Sep 17 00:00:00 2001
+From: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
+Date: Mon, 30 Jan 2017 16:32:06 -0600
+Subject: [PATCH] Remove check for useSIGIO option
+
+Commit 6a5a4e60373c1386b311b2a8bb666c32d68a9d99 removes the configure of useSIGIO
+option.
+
+As the xfree86 SIGIO support is reworked to use internal versions of OsBlockSIGIO
+and OsReleaseSIGIO.
+
+No longer the check for useSIGIO is needed
+
+Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
+---
+ hw/xfree86/os-support/shared/sigio.c | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/hw/xfree86/os-support/shared/sigio.c b/hw/xfree86/os-support/shared/sigio.c
+index 884a71c..be76498 100644
+--- a/hw/xfree86/os-support/shared/sigio.c
++++ b/hw/xfree86/os-support/shared/sigio.c
+@@ -185,9 +185,6 @@ xf86InstallSIGIOHandler(int fd, void (*f) (int, void *), void *closure)
+     int i;
+     int installed = FALSE;
+ 
+-    if (!xf86Info.useSIGIO)
+-        return 0;
+-
+     for (i = 0; i < MAX_FUNCS; i++) {
+         if (!xf86SigIOFuncs[i].f) {
+             if (xf86IsPipe(fd))
+@@ -256,9 +253,6 @@ xf86RemoveSIGIOHandler(int fd)
+     int max;
+     int ret;
+ 
+-    if (!xf86Info.useSIGIO)
+-        return 0;
+-
+     max = 0;
+     ret = 0;
+     for (i = 0; i < MAX_FUNCS; i++) {
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.1.bb
index 987a2be..5a657e0 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.1.bb
@@ -3,6 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://musl-arm-inb-outb.patch \
             file://0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch \
             file://0002-configure.ac-Fix-wayland-scanner-and-protocols-locat.patch \
+            file://0003-Remove-check-for-useSIGIO-option.patch \
             "
 SRC_URI[md5sum] = "caa8ee7b2950abbf734347d137529fb6"
 SRC_URI[sha256sum] = "79ae2cf39d3f6c4a91201d8dad549d1d774b3420073c5a70d390040aa965a7fb"
-- 
1.9.1


