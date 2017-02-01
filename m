Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0071.outbound.protection.outlook.com [104.47.2.71])
	by mail.openembedded.org (Postfix) with ESMTP id D1876771D3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 15:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=EZ7o7IHWWoqi3kMuSaHfUVGEAz04NHPIWnDmX4aog2o=;
	b=ukhM4rt+4R6S/cPKourvyYU+EjlS8yfxSJIRtV523US0L3phMw7QBR6DU0g8Fua2745JOgpYdYIKw6bug6Xi7ebNVFXyuHCxh4k3twzUbmnbZPIsY+G9ddeenQrz3wEc9tL2iUUpmAFwyDmtWaQI0jk4+8r3cohh55dZPip5B+k=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.49) by
	HE1PR0402MB2825.eurprd04.prod.outlook.com (10.175.29.23) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.888.16; Wed, 1 Feb 2017 15:21:10 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Feb 2017 09:14:10 -0600
Message-ID: <1485962050-3793-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.49]
X-ClientProxiedBy: BY2PR11CA0018.namprd11.prod.outlook.com (10.163.150.28) To
	HE1PR0402MB2825.eurprd04.prod.outlook.com (10.175.29.23)
X-MS-Office365-Filtering-Correlation-Id: 2b40bc77-e213-407c-c27f-08d44ab5f431
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(48565401081);
	SRVR:HE1PR0402MB2825; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0402MB2825;
	3:zS5sLPKwwzxNxDRGXNQ3YamYvY8eZmBUPKC0B1Big4CJN1gXA6oEOAZj2WFfPothc+TkUVjfu/MYdyZCZHE5sAO6+l9v0IQfut0XhExirX7xGDlzEidjaTa/DjYZWdZBKtLZTVCaJvURPv5T8AIRigz+nx9o8IjeIhy4QuyvV/icl4Uq/udvmP442U/A9gLZn6kXeOaZI+sHJMq49FEcEOes5PoKo0M+soH/CzZMDmNqEfr2SpdP7gNYd6Kxeoul/Y0K/7Sl0vvSVX+T9sB/DlaMYLuyX2qWS+UlGggGLLo=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0402MB2825;
	25:NLBEP/xJXadh0KvU4Ome5XSlB89bTsBq/sobrpraZP4n4PcwmpwkfleZi8KTxuZyeyp69WwOIZxTMPVkcJWQEC/r1+Kfl+M39w1BRsmjG2J41Wb1Ph1MV/nfd2fhUJ2+V5gYIuCg8xp6C7zq3wUqLNmSD11vFFGwPTqSZATxrIUgYaLS0SqNVXbhyoDinLa5+zdyEGbMx21E6L0Ej+ILYhKERWClRzJgDh1tM/vI/Jjtf687pxkfE27AQArtp7CKBvEqNxaWs7IUC/sjM5ACQYgKdjjsucwL72hXlIrVELvzyQ9xQ19lbmq2M9oV/w5keEiP7MgIJl5L5/fjBVbDEJItBty9zOVxLHYEdWTqPSwJUEduUdcsQ2ORYfcZURq2p5pm9R662b75U/d4n2u7zLuIuyvycz/1Xygz9nHdKnoIns4x0X1d6nEwUrA9Sd+gHdOgisLeeW/RgpyKD1Ze/XH49oy0XBOfg+7iOcoGTC/rcP95iPd98z/l4wdyM/W/lINA52bEY9a9ysBgQXPXR9M7H8OBfikSgLKMRRqE0TG4O8y3YQgxX9w1+O8UrrtCzducXkTDWx5AyOM+g31GQ/oxk7lH++cNpEauLdkh/01etGVW1zD5DeHK828iTZRbphfS28AhpQ8u9wZP3C0XrUkX6i0XvBleUswTnXacCUMT6YjH/5I+RDHH6rrZM5dn
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0402MB2825;
	31:g1UK2iKmAp7aF5LVvEhQed6pflBvjRNDnqrkttGW5YuQW1jWj7wAB0iQnhNkAItLaS9/HcvfEa7Uxt9VErtomrQGqF7QN9ahoddToinJb+kbzxFmfkUWMjDxfnfXwO3i5F+DT/NFQLP11lCbLEDpvcuvckQ0KAeDjyQ9BEosYU8ub3Izni64FXDwTaB2IinWqN2bEjBamMvrNtfc1S1NzmcM0WgcPRxAO4ujfd5UYqBYxFQBDXzVnbJ9wxutu4v1d2ZAxlmUm5ZCFl44QxqpgruJHeEna2v+0TKooNqGgOQ=;
	20:UCFQTrQcXDKQQUimfsHnRs2bFV2akBlN+dZOiyl13qBiCu22a5knUYZg8319KVHhccZibaTZIflLLXJdJwoDyQxlMx/ACzXxaJmXumCt13ejAS5reFcGjmwoU3JJ+RQEzRVhEJ8r48tSVmskHH97SRBedw21GUg0dhXp/OCWLv71G9JAKzzve1Ci3o48H1uDeC0sFNG54yx6qK1LsIjNz4RKt36jyb8GPLLz8J98YA44tcz8abjYp8Rf166P5012nwzyfpvbAm6GgTjqM6qa+EU+F3oZb9Ij8gBXWqYl1OuMm/418p52JOzaHZj2bh+Wa9+wlBD2Z5k3V8Wyu6guceGNvayCdTs8U6rGkSDLZ0edx2FZFNZB6j8gT661datHBD+SEVLbqpIlk+Zko4/5XvTlavTRkwiw7GOTeSwTQC4mo6csIHP3KEUxpKopGzNL+zkwnBuw0SDDAr9UuyVifOaUHB+mSTitMcA1CvdipaDPVjOyjuaoM+aVJj1/wiOV
X-Microsoft-Antispam-PRVS: <HE1PR0402MB28255C814D343B0E1A4098B9E24D0@HE1PR0402MB2825.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863)(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026)(6041248)(20161123560025)(20161123558025)(20161123562025)(20161123564025)(20161123555025)(6072148);
	SRVR:HE1PR0402MB2825; BCL:0; PCL:0; RULEID:;
	SRVR:HE1PR0402MB2825; 
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0402MB2825;
	4:/6iKd4p+Zjavzb5Zy7UBNbd3XJgCtB9J1DX81GriUOX5qyfKTIVffKSy3IgzAiPgrk25Q361fsEXsM9PqYboP1OtFqG86EtOR8F7MOp7MlZw7qhPggj1E81vg1cu7EWvn1vGKQBejYYkh0b4z4iJKQchv6vbrZRWZgljiVq2fHWJHBzvkNZhyXvhJ6XHuhc2DP2rS/DR60bQYU7xBPzAgD2CwyHBn5HgQHbkN4IJPFRlxfM+JZ2z72IV2Wyd2Lpcpf1VU2tFulixNwvb2V/8mwEgSEmdY+7WZWQ7UjiZme1zXY6EVAHQyL+1u5lOkbb86dOaG1EKurdE+D8CkEQHA6ZD47XUTVvYx3RI5I7lFCDxizqs1ixrLLuN/lfMBL5GhdKVE2z2O8gLzirH3yMn13HCqq/ySzLji+/PcqIpX/hadhAbzkO2LsAAdvI7xtIOr2SA63xcfCsoHLVJkhFTclqYjAnndh+WEuavwj9bDgcZ9mdKO79ujdbvn/LUAJvOVCqQlp9hdCFj2pVbrpHMgehOKhxL0JA7vahqxB9FXweMUqRgks4Qyd261ETfXIal5UXuaEezO5pKMRUzK09mfVBMwhSxCUZVqhtA/TYHfreXTbxm8tkiFckK6y6khzsRpzpBobvuIG5oU1xV7Oy6yV7ojfEwO3WvGraJL6Xf+1P/52kcmHMFzE7dv5i72p4RV8fOkqxieHODxI4J9SaZBQ==
X-Forefront-PRVS: 0205EDCD76
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(39450400003)(39410400002)(39840400002)(39850400002)(39860400002)(199003)(189002)(25786008)(5660300001)(6506006)(4326007)(38730400001)(2906002)(50226002)(6486002)(66066001)(6916009)(47776003)(101416001)(110136003)(81156014)(81166006)(8676002)(50986999)(68736007)(6512007)(575784001)(97736004)(105586002)(2351001)(189998001)(106356001)(53936002)(305945005)(48376002)(5003940100001)(450100001)(50466002)(7736002)(42186005)(6116002)(36756003)(3846002)(33646002)(86362001)(92566002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0402MB2825;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; PTR:InfoNoRecords;
	A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; HE1PR0402MB2825;
	23:Ie9a0l9ECeL/S2kCFrO2AdslJVWzWFZu1J0dnmj?=
	=?us-ascii?Q?GXvmQ1SxatYGnbFvEvQ9tmCsmH2mT/WCMo1F7Za44fS15k0n6zE5EvhaEy9I?=
	=?us-ascii?Q?plfIlKHODIPvuxWYb5J0QSQDiDhV1GwlpV2+abIjFaxeAfpgKqCwtEY7dOCi?=
	=?us-ascii?Q?3Pe6YN52oz+Y8HV3tUslccBJiOB0WG7h5uioIXL5lLGnrcPj/ML6Ert/7U+L?=
	=?us-ascii?Q?1Fv36Vp9VhtBKfku5HbpMsG0Mzl5FZlBankzApiF28yfXz2u4+DBKBa8doKS?=
	=?us-ascii?Q?C6yaLYMX+XatAek+V7sJegXvhKJGt7w6AoBmg0a/55p14WVHPJZ50uSoA5eo?=
	=?us-ascii?Q?TNNYt8s1/1dNfS+9iUGSdF/+ppLJ6kkXj8hZ2/TRaAOzbaMXBfHzXOd9v+Yi?=
	=?us-ascii?Q?OMCZ7TQMZ+fvf2XqVaVWLoER9n6zysLtsUcyIRboqZXm6JxT4tSo0fTPDUpW?=
	=?us-ascii?Q?ggnuZz3m4+K8RGIYtPgOoA7ej9gCvrozVa52DrrToCYZkVJxeITdv6O/wxHx?=
	=?us-ascii?Q?NimBb3oYDS8QLNsRZNvurO+yZnpSz+7EX6bRcqm4SSFXmOaX2kmyADqSFnBr?=
	=?us-ascii?Q?S+a9k1xyJiw8KqQsiDoy0aUfqP9b+5NVBiDDa48Jjlt/YOt9H1qaahUg2ZiR?=
	=?us-ascii?Q?oz2+07FuFiwD3fiAt/MxoZ+i6Vsuo7ynAyRmHuTTzzjsmTGZUHWD4Fo+Vnht?=
	=?us-ascii?Q?Bm4cB+rsyh/9KuPDD9sRwzXGBu1VjasaShiiEoELVHWDxJ1YgAY85yLY9pZT?=
	=?us-ascii?Q?0ohZCk3fUIu64/ZXN8XwcaXD5GaDbyzKrlDqa6hm9KCMtXSAbaE7r5Vo3geI?=
	=?us-ascii?Q?iUr+EBScmBNB2/ikttgiGUqKalhNjbWJiw25E7k3LY0n0aZVN8o+H7nJc2Di?=
	=?us-ascii?Q?y0NpzDGrw5MLRRggOBvMRel0FsdHHwalHsWiyLa5vbmr9AFPx1Jrycz7LJOU?=
	=?us-ascii?Q?2ZITyW9I7B8teq47PHbVVB9eag3wOooospzpL8WJf5WCzr9/P1ot0iGFqeqz?=
	=?us-ascii?Q?APO9a12ua/02NtXrMHbbtxLA8kY3cEEmYFqda5cMp5psPN2cuqPmfy3vkrg0?=
	=?us-ascii?Q?AbUvwiBiNrXjBwjEX/QHX6ME1otsth5933lLECA8ZE7dREf4fa0aiKMTMAId?=
	=?us-ascii?Q?iCLrw1Zr4me9V6B9ZUGOsgLruwE7+H6I2nEZR4FFoyfcI/ojj/HpfgANTWPU?=
	=?us-ascii?Q?wkZ1sQxHgg9KZBrL+wETvol3nKwbjXV7UWC19?=
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0402MB2825;
	6:I6nIvgn5dXcc6ytxi0b/Hz1xu+j1jU8AUlgG497lNgAEcAhoKZdxd8Kh7EJC6sAgIBqYieRN8ya9OBO/VuACpJJiAmjOoPPrQgTVIIqOYK87o7LYOXlmcxoARf1dLlY+niZQFx0C/pV8QUa+BVHJd+iy7Yjdi2ON0L+NOcvRktlcD1wpWmD7QpQlfpA55UdbAnB9MNwGi2oKIMndY1Hvr85OAGEQ3Pa/EUws33Aq3+kSuPEe5ZE3tag3cVLw41wsTHeJ4JNEbor4h0yWv34FAiFjK3/8Dy7qt0c8T+dfkhEFISwMkuyJbpWsWTX7oFDxVWjapkavQa2DIoW9zaid9grq7TpnsqzULscBjEDZl4sGO0cR34q/8jiXT+yHSgSKiVi6yITksNf3zZ9tGVFhHdEgl/EXoMbGG/a60yTZY5Y=;
	5:2PY2R5vYpBLWTmoJ/XCXho7NyHYTQmEAku3r6b72hsLVL3yD4Vf9baIKFSdn9P/S54F1KxwOF62lqoXdb6Pi1XqMAIuK6L+QID0xo3CEzvvYoEZAiUETn2fPs8ZMYejhtBecWD9AG1VrhIhQHNfgXw==;
	24:Mt8Yz06FY4DeAgc7ceZN0aibis/bIYys+dt0xMO4Ur0Eg0aRmSnL1dOHd1EHMkGwJUnuOLq//+DEfJ3NXiRn7hxvLoKiZ+ZlHRK8KAsJBS0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; HE1PR0402MB2825;
	7:zZtEIKQhldSb59CiZaidW25DJqdd3RTmxzqjfPLzW7GzO8ru9yg2hyMNTeVJ94G649BWd8RKaO2+Rrl6y5l4pIK3UZ+aiIkniRwSSRNkEq8iK0Itb5I7xTesKEORrVSoWgxkLeLzhK/fhggYqZ0hK4s9dMYMoEXh+8jjIsg3vGKBFfmv0dsxsh7ThD01LU0pe6i31pP0QGci3rHXjLivIUZNarEAHAVG9nw3uh+LHZqird6huY5C1MDYzTn21MAl1D+WbGZ2Vhb2TZoKrJxlDWh0Z6eMw9BmoMEKbmayLFRubIhK4lG/mu09XVWqwWfKuRysgdg35cT0CbgLrSMdbq1oivfLyVxQSarmE+9i6A+SfNB1pTjsxI00UGgChsB0eHCUf/rmqRXojaqtbvXeM3OcEFQuv6vyVBbRUvGsgh9XKlGwCwdX3Xia5IS9RhmKuJJWB3xkJanIE/OAvCPSrleUvAwLwQ8Q8n3OaF94QcJRBCMg2GtZIG3TW8nw+0xCwT64lObmlFlaPHBbXl9Q/Q==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2017 15:21:10.3642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2825
Subject: [PATCH v3] xserver-xorg: Fix X server 1.19 crash
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
X-List-Received-Date: Wed, 01 Feb 2017 15:21:14 -0000
Content-Type: text/plain

Commit 6a5a4e60373c1386b311b2a8bb666c32d68a9d99 removes the configure of
useSIGIO option:

xfree86 SIGIO support is reworked to use internal versions of
OsBlockSIGIO and OsReleaseSIGIO

The check for useSIGIO is no longer needed.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 .../0003-Remove-check-for-useSIGIO-option.patch    | 47 ++++++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.19.1.bb            |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-Remove-check-for-useSIGIO-option.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-Remove-check-for-useSIGIO-option.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-Remove-check-for-useSIGIO-option.patch
new file mode 100644
index 0000000..beed6cb
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0003-Remove-check-for-useSIGIO-option.patch
@@ -0,0 +1,47 @@
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
+Upstream-Status: Pending
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


