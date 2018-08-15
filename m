Return-Path: <prvs=7584e029c=Alistair.Francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id 3B7EE79241
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 22:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1534371932; x=1565907932;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=Q+aVFI5BGcRB72JEo8y4SasYkICwUTtxvpdHplGV9I0=;
	b=MIEosdiZXqu47sAYlfol/L6OUY9/GYF1IvZvwmNfG7Res4Srsy1otF6Z
	ZsVHIqrBbX+seMPB7atFtOJbju0A37iB05C4DLfxnXzO2EKhG8/xjhkfo
	5KpEi+XLN6vwr1EPV5wl02oCwzyEzGvbOMtJC1tnZVcrTnxEHTe2DaUo6
	CplBti7CNeNkFz9IgC84AqQD87ns6BJAFtPUlThAUdfJwO8sX+GtF7eM9
	0aqeNi7qiu4Fl9hsf10ZWpWQP2ENpOokdgRGMQnXSEdaibKyfvfqyR14E
	JIXp3QcMnvUqm7p373m7YzMQI65wa7vmj4a7CvYIm1XuS8lYdTd2sI0zb Q==;
X-IronPort-AV: E=Sophos;i="5.53,244,1531756800"; d="scan'208";a="91462228"
Received: from mail-sn1nam02lp0020.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([216.32.180.20])
	by ob1.hgst.iphmx.com with ESMTP; 16 Aug 2018 06:25:31 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=G/j3aolkpAGgYTYkwNiYbYommIiJ7/W+Ym3bJK0N+8o=;
	b=jz3tYgcryFoci/sPQvGhjgCeyBVi07uqwTJNsZo3hNBIW0pzK1vaBABvgXpJfOnvhbpD1NPwWKIa045P/eiwqgfoFV7exWBrf4jiZ+WFqihs/6iyQG0TwWoCHJUWxgYTZUy8yeZ+PSJprMECems1QMqG6E6hmN+xqiL2jenNhXE=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	DM5PR04MB0395.namprd04.prod.outlook.com (2603:10b6:3:9d::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1038.21; Wed, 15 Aug 2018 22:25:28 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Aug 2018 15:25:19 -0700
Message-Id: <20180815222519.25303-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: BYAPR02CA0025.namprd02.prod.outlook.com
	(2603:10b6:a02:ee::38) To DM5PR04MB0395.namprd04.prod.outlook.com
	(2603:10b6:3:9d::16)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1652581-d4be-4f5f-8961-08d602fe0186
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR04MB0395; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	3:B3PvM3CCVY8BpONz33aIegEaEQoghu1iLFD+z79LeogwyV7h3gQ7JdaiLx1gAYimvzwRU+dXj75MyOlgBGbDTsVpw2YGAqnzAWoXgXZTiORc0o/VFdDSJYfsnoFQ0F3ArOfU7sQPomWQaVBBOAhiq7K2dOvWHMhra3PE5KutwGb7tsdfj8Xc+4gfeq5P5c45IoMofeUZ8hFx8SDpyjXcIj3gfVigYzy70hFfRCNhYzhSHrbeswMttFJ8N4dSc846;
	25:1cr2ZwOn+smrFqpEpqY+8Pwij+zwjD6DwKI06xcYMdD9WOcBmYKiMaWYsVqHGvH81Tkinup0o1lIf9PwobQs6VFlcrlmnHrIIQF83SjkjyU2l2UnUyL9WPmL947sWgsDk6DeKGUzalRoITQQTSAsbSmwzMPfTVMiCHr+EUhXKdL8sorLQWoxECEPuzKc5YFbbpsiK77EqTSm2Ifa6+ePSC5ZBlAGkZoNETDK6D7VJtzf7dtSZ+1tHZL+ngadLp1i+AP0nKULjTTh0Xgsmxxcfowl8cee0Cr9/ggpZuKfrm2wSuTdb6X6aJwEputk9kG0voPwNOS5oA/IQkmuj2MYXQ==;
	31:XXYxfSOSWG5OA3onpFAkzKzvLVdKzRqfArIHOVfTwL1xjaB/JXaF84zZ9wGrP4nLyPzLzGVpfOs0eijSx0Xunr2ui+hbbEIFio4SA48cRLYWz6Z3GlZR5VlBtYXd88su9uotVt9vegXG9Ww9bgPPbXKIWSkVJAB2OTMdggaABQxfQ8LfBQiTAw10xPXTzwf163MgCg5PrG7Lyx0eQjZpIddV214tMUfFE+dNuzpTrsQ=
X-MS-TrafficTypeDiagnostic: DM5PR04MB0395:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	20:oEYR0/0diKTR+CEAEaetaNYqKyRTtwMhtj4IaENBZBtsaK8YjGefRW2yPvoevz/M/A3YNMkKGQKAD6YbVRs8esF79ObQSTLWU81vbYztJ3H7gdiwp2mqKgxDXUZFVrUW+OgU976kcA1a1YQAi9vZ2PtHurUe0m4Hzmd9A6WdmzSgI3MuzbYpZJ2w1jFdGHE6be00yEM+3ys0than4On1n4tXbOJmmugrlSQ1Rl9fBhSQ+5exs0WUWanwe0BkCWlyQRgm561FVspJyZSmjyFZYnZCbOApiZ+4cZJOwEJPVZ323OQ0P8vgrO7ympYCFGogGi6PAn156j6CY5r7vTzehpg5zMip558ouJs1syTeJLsL3QTjsAjHtNCncSCX8YorzseJ2e7H70DZFH6Xkk3vEblMcz3DjHK57X/gle6PpvwDzroTtmwrelm3TgsunI+gfOryuAERgvOWRroYo9Fh6QqkN8xYPUhUXi+JyXc/gSiNuK5om/i32ncvHDoWNUNp;
	4:8vo1bFsKCZwdNNURhWtGlhf3OnLCzAipRlxoGTHsVOGg0ywGRh5yFDeCjP8/l1nXq5j8cBhHGGRG1M4gLnmHSKOGGsPbBG7U98wV+cGaFDVy8BaN1b5jIfzHbifmN4N3yUoOoVQwe63FWlpfbg0NwoXdwZJIwhmJUQPEWE0kcp12BDaxf9OFnDNTHM3CIYtmYbNTLRuA039u/ApbLXxw+rt2SUL3Uugg7DHji+yAz71RrM2F6D2G/L00UUSrIoEjP8CtxkxHbb0EpXPDZUC46s3gnPBdcJ1manYAUo2g00w5fl63N5RMWdBpsSoNPt7Kc65rtyWr0SSkbV+nCBBzmdyMnLgvLDov7QW6bveAIkI=
X-Microsoft-Antispam-PRVS: <DM5PR04MB03951637468FAE1E4DFF73D9903F0@DM5PR04MB0395.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(226959686518644)(22074186197030);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231311)(944501410)(52105095)(93006095)(93001095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(20161123560045)(201708071742011)(7699016);
	SRVR:DM5PR04MB0395; BCL:0; PCL:0; RULEID:; SRVR:DM5PR04MB0395; 
X-Forefront-PRVS: 07658B8EA3
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(136003)(396003)(39860400002)(346002)(366004)(376002)(199004)(189003)(106356001)(386003)(2361001)(186003)(105586002)(14444005)(2351001)(26005)(6506007)(16526019)(25786009)(8936002)(6306002)(6512007)(5660300001)(6916009)(50226002)(316002)(6486002)(97736004)(575784001)(6666003)(86362001)(68736007)(47776003)(4326008)(66066001)(16586007)(956004)(1076002)(36756003)(72206003)(81156014)(81166006)(39060400002)(2906002)(53936002)(8676002)(478600001)(2616005)(476003)(1857600001)(486006)(44832011)(52116002)(51416003)(3846002)(6116002)(7736002)(50466002)(48376002)(305945005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0395;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR04MB0395;
	23:ppwwec+zZjQ+JbzKn5Y8e9U2VVH+cKdMDj1GdTcdr?=
	=?us-ascii?Q?WeiNcqqJWnhXqKHA8uUIQqpZ34BGHUADRn5x5O8Y7p1nXUetlsK4po+vv7VA?=
	=?us-ascii?Q?knD4ht3cMEPGuVH2CVZCrqKgwjRmOhmEPXv7hnTM4Y/dgYZnpyx33grhBb30?=
	=?us-ascii?Q?qCbJ5g7GMrkfiaBwnb3zmHodBzxlGlnJpPwac3xJAAYl30j4zURUT8FgYmsO?=
	=?us-ascii?Q?90QpOhDJa3ZpJJeRgDGrI765kY6YiSHWac3ghe4GRmQZu1A0mLnE2I8SxxtT?=
	=?us-ascii?Q?q0x7cqFoApoTJrJNIou1QQfqdIptf9VmPo2tXPMX7832PgrII3InmcaRGsTK?=
	=?us-ascii?Q?tORJT9NZKi+gBE6GFwBuE3LKAD3nsmTRh/nkW/mr9601WSj8qzsBPu3Z67II?=
	=?us-ascii?Q?UW7Fv5XbbP7sK9H25BxG47pY/d8yhO7Rd2mfJVbDLjmFkqTYj6lI/rcFZkUm?=
	=?us-ascii?Q?x2ZUvDCcEAhDXUYm1WShdB5+ZRZbsGyu7z6c3bfwT4fx2CgWkt++9tvzO06y?=
	=?us-ascii?Q?yn19novIBwYYUIxLdSM8pmgz3iNcoz82TwnULGpVcvX+Ik3ZAStG2m0PNl6O?=
	=?us-ascii?Q?pv1t5V2Qc19dPq2YNLk5XIzzY9HubXArcHpz3T9xJNhbeVCNpuS5ooTNUXXi?=
	=?us-ascii?Q?LYpEQSvu4csS+MZwOxLbsOTQZVkebA5quk1DUt97Lnrcr05XIRgh2JFhCVvU?=
	=?us-ascii?Q?KsIJvfo0kY3c3U093pixtT1KU08u5hVVLp8GDs/1M3KMa1fitu/fyw1EwLDS?=
	=?us-ascii?Q?xqqAcM/A6mLAvYSdy8XMTNDxHgtzCB09jbYcfQFPK3CjBKwnK232rOF/gRNl?=
	=?us-ascii?Q?eoxd8G0W52+ArPDCHNCax2vcr8TPeQlVaJDeoF5IC3tXFOVLV07X7ULh02ou?=
	=?us-ascii?Q?FCcroBzWKGlPL1zLi8Laoi8Tm9dGkdZMKYvC0JlqQsJSWAkVdATbUASxiBki?=
	=?us-ascii?Q?eMa79Nd5CIRoIUYXwtqse491ndhH7fa2GVW8AHXaIS+UOo4zKf/86TM7lLP9?=
	=?us-ascii?Q?keSGKkOLnOMqzp3DMucxO9YY28ZyaJTOtPTs7dUb6wxdfXTNTCLpepWL91UP?=
	=?us-ascii?Q?CxhL5iMTxRv3vfgzQAbpLG48pdO8rJd9M61UbalooW0JSrs0uxN+UVdeyAjZ?=
	=?us-ascii?Q?InoWT/kYf/3C8frrK8YUrMiIk3QYoEqSK0MrfM/k4LpH0K4V2d/i6CYL23kb?=
	=?us-ascii?Q?/EHppWqfExk1rvzpnmYAJ9pN/MsAMw6Klnf+raOl18B23WiFJ3JQfuOlggPe?=
	=?us-ascii?Q?mBMkvmoAEuCGzv2ZjrymT3HS8PxPgydUQuaVRqL6xK7U/ES0bu8Z23dIkREr?=
	=?us-ascii?Q?K/C1jQKvc75kN7SaSrFmqU=3D?=
X-Microsoft-Antispam-Message-Info: oRI04NyNhC+lP+qLOBCOeJmWMsrIne1oiC26NNg2lpOCRqocHnvUlNOq/RmIa/2FilMD4BtcZMu3T9UzKL7L2ingzTCSatQHEUfshJ8wTTH9AKN31xYpl0KNBAYkNu1bk6zhX5FdcSd47w3iqEj0hLDItk6uWZKm6X14s9ztuWm3ZBLpjseHQ9SkokY6Jse9l/fcwBZn+fUviHu8E2RK9hDs5asDDJGk4sWhqy6TCIjFmkLg//fDh7cgWibJCQ4RxV0/OUbuvFGckqo/BBln8qKuuU696JjDxihtNFjRTICxWMt1CdibM6PhXIEHb6ge0p3jbWBFnh9JLFjXZbcHittxVTJjUbNcTzjhNSZLJbE=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	6:Hn62zIrRlM7juWMrBICfSQtUDD2eKLb7p5DZ0qjA3FYQm/y6BSj4Am3UYhsaoohC5Uang7kmRvH4Fx+z1XaazFCJm51g52Jtg41CE3XmuB5Lt2SN+Mb4TsSOdGvghtn1mGwEcjys2S6uW9nPcO2mSpJEoEbbQVFJxjqfWotFXvn5EhlAGueEcz2emDx49xE24bk+Dnal3yqw9btQnddcJ0u+jJebOFqbeIb/3oovdTkuwxyFnYdM+1cVPzXneeSfDPJEvbP9A2Ffgt88pNW0UE7kpOGCFD7iA+TVAZr3v8N7ODtGhffngIc5iIM4zXEcYvl8on/2JmmD8bbjI+wdZqoMOOGrr1oT8duC40KWMJvMG6AHet3tHe8yb+EBLskkwUEBgP4mDf7Mgsb7XSCvVNYOFylPYKGaQ7qj/+IL86ZsqnPxo7/VgLFvLVXmYdkOslu/uaM6/LQkOOdY8/li/A==;
	5:IKhKvd6AkWU2CXePDJEdhxbqR3j9wlK787XwWLhYUHFxpx2P7kISTfk7oV6dFpQqBEkvolZRWex77VOvAaEPw/tpDhS6BOrIdhOsfXfDdc0N87NyaVgrmVrCrx+09Mgx01iGMB66te2xMiWVRrAejlNWOj9Vig09sC2Sed1A3ok=;
	7:lBfqHG0qPMKxQr/jJEhdFwMK/H9Izl0XMEsvPF3I9ouCc/ulhEFS0E5kbPHgFUiYnCN+d5jYnmM1pqZnfg3bdwTz6XIBxMe/qfXjS8crnEpnX3n7TB2CZzuzB9gMlq9cfoCyY1J+SkNzV6kP2frRUb+2XHBjcj7ARNi97cRmbqdQt0tQrtSGJr0L8ocrmrMn9A5cjWSybeUAbZQ8E+hdr7iNkdHcEMK+9EDf57p3UgtJ9VXtd4myULZmWIk4BQM5
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0395;
	20:VAmyITad396MwTpL0/GdBP+RFFLk3rMprkbIdRfYJGxA57w2F7KD95zIzG8I6s1Pl1p/6lg/A2IhzpcSqgsdVzaoHPmW6GoMJPwpZu5qtTRpaGaT87IKTa3i48B30ZOFezUsp0if/z4R1Glby2nxvCbJqPS98orG70rIJ7465YE=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2018 22:25:28.7925 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1652581-d4be-4f5f-8961-08d602fe0186
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0395
Subject: [PATCH] recipes-devtools: Upgrade QEMU to 3.0
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
X-List-Received-Date: Wed, 15 Aug 2018 22:25:30 -0000
Content-Type: text/plain

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...1806-QEMU-slirp-heap-buffer-overflow.patch | 70 -------------------
 .../qemu/{qemu_2.12.0.bb => qemu_3.0.0.bb}    |  7 +-
 3 files changed, 4 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
 rename meta/recipes-devtools/qemu/{qemu_2.12.0.bb => qemu_3.0.0.bb} (88%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index bed1594b7a..1c9226cb06 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -28,7 +28,7 @@ BINUVERSION ?= "2.31%"
 GDBVERSION ?= "8.1%"
 GLIBCVERSION ?= "2.28%"
 LINUXLIBCVERSION ?= "4.15%"
-QEMUVERSION ?= "2.12%"
+QEMUVERSION ?= "3.0%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch b/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
deleted file mode 100644
index 837b65a79a..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-CVE: CVE-2018-11806
-Upstream-Status: Backport
-
-https://lists.gnu.org/archive/html/qemu-devel/2018-06/msg01012.html
-
-From dc21a9d2951f0a2a7e63633e2b5c68c54e4edc4b Mon Sep 17 00:00:00 2001
-From: Jeremy Puhlman <jpuhlman@mvista.com>
-Date: Thu, 14 Jun 2018 01:28:49 +0000
-Subject: [PATCH] CVE-2018-11806 QEMU: slirp: heap buffer overflow
-
-Subject: [Qemu-devel] [PATCH 1/2] slirp: correct size computation while concatenating mbuf
-Date:	Tue, 5 Jun 2018 23:38:35 +0530
-From: Prasad J Pandit <address@hidden>
-
-While reassembling incoming fragmented datagrams, 'm_cat' routine
-extends the 'mbuf' buffer, if it has insufficient room. It computes
-a wrong buffer size, which leads to overwriting adjacent heap buffer
-area. Correct this size computation in m_cat.
-
-Reported-by: ZDI Disclosures <address@hidden>
-Signed-off-by: Prasad J Pandit <address@hidden>
----
- slirp/mbuf.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
----
- slirp/mbuf.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/slirp/mbuf.c b/slirp/mbuf.c
-index 5ff2455..7fb4501 100644
---- a/slirp/mbuf.c
-+++ b/slirp/mbuf.c
-@@ -138,7 +138,7 @@ m_cat(struct mbuf *m, struct mbuf *n)
- 	 * If there's no room, realloc
- 	 */
- 	if (M_FREEROOM(m) < n->m_len)
--		m_inc(m,m->m_size+MINCSIZE);
-+               m_inc(m, m->m_len + n->m_len);
- 
- 	memcpy(m->m_data+m->m_len, n->m_data, n->m_len);
- 	m->m_len += n->m_len;
-@@ -158,12 +158,12 @@ m_inc(struct mbuf *m, int size)
- 
-         if (m->m_flags & M_EXT) {
- 	  datasize = m->m_data - m->m_ext;
--          m->m_ext = g_realloc(m->m_ext, size);
-+          m->m_ext = g_realloc(m->m_ext, size + datasize);
- 	  m->m_data = m->m_ext + datasize;
-         } else {
- 	  char *dat;
- 	  datasize = m->m_data - m->m_dat;
--          dat = g_malloc(size);
-+          dat = g_malloc(size + datasize);
- 	  memcpy(dat, m->m_dat, m->m_size);
- 
- 	  m->m_ext = dat;
-@@ -171,7 +171,7 @@ m_inc(struct mbuf *m, int size)
- 	  m->m_flags |= M_EXT;
-         }
- 
--        m->m_size = size;
-+        m->m_size = size + datasize;
- 
- }
- 
--- 
-2.13.3
-
diff --git a/meta/recipes-devtools/qemu/qemu_2.12.0.bb b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
similarity index 88%
rename from meta/recipes-devtools/qemu/qemu_2.12.0.bb
rename to meta/recipes-devtools/qemu/qemu_3.0.0.bb
index 98db44a8ef..80da0810f1 100644
--- a/meta/recipes-devtools/qemu/qemu_2.12.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
@@ -7,7 +7,7 @@ RDEPENDS_${PN}-ptest = "bash make"
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
-SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
+SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://powerpc_rom.bin \
            file://0001-sdl.c-allow-user-to-disable-pointer-grabs.patch \
            file://0002-qemu-Add-missing-wacom-HID-descriptor.patch \
@@ -21,7 +21,6 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://0009-apic-fixup-fallthrough-to-PIC.patch \
            file://0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
            file://0011-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch \
-           file://0001-CVE-2018-11806-QEMU-slirp-heap-buffer-overflow.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
 
@@ -30,8 +29,8 @@ SRC_URI_append_class-native = " \
             file://0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch \
             "
 
-SRC_URI[md5sum] = "122fd7cdf241ff7eb1e42c0b503b5d1b"
-SRC_URI[sha256sum] = "c9f4a147bc915d24df9784affc611a115f42d24720a89210b479f1ba7a3f679c"
+SRC_URI[md5sum] = "6a5c8df583406ea24ef25b239c3243e0"
+SRC_URI[sha256sum] = "8d7af64fe8bd5ea5c3bdf17131a8b858491bcce1ee3839425a6d91fb821b5713"
 
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
-- 
2.17.1


