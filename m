Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.68])
 by mx.groups.io with SMTP id smtpd.web09.4552.1604563578325642493
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 00:06:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=M2Qr5yg8;
 spf=pass (domain: windriver.com, ip: 40.107.237.68, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GpMeFSFAqPwNGcbRONRV6zhlRy7pXPDZ92OvxZN8nNv1b6TVcpTzw49poUe9Wt1oR0hXBlood8VCvdnUNL6/1XfVtxbhIBAjh+0inngzhhHxCvjX6wYIXtx/2nZaBCXUUFfpNfh4W1HSTByeL8IIHes/k07pWg5rPRGyOZ+II9Yu/rZHnoKqWC/vwO6CjzluvBCDewjDGWUigF+uvENn4Vdjn5oHRJ0Zc6AoW7r682eDhw3NGeJJ4DlZ7EFv1pQiJ/T8BpoBTGe0HzAZUHL/GAH062KH+aHGJv1VpGFuB5Dom7do2T3AZOrPy5ldcGkcH3chGjCmeRkUwm6As5U1uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nqAV7nk9ExyC+lNCc/AvwWpTztfD4eoiDhIAk27nlE=;
 b=AqNrcLjU0jnvjLn2oTf7GJvZy2cbWkxkzkyXb7AaPgLa7icF0g2EYSvJ3yTCWN3EanWsA2mLqVJlPK5lv9oxTdNQrfyD0IrqRgfvxNLjKxTtYc3v4slc43uh7KSHkeaL7NH7gt+3rDVhhCvfBZCjeo6PbkU2ub4H1IaA747D3g2RWRUffjjdjp1ooHC87zG/JvLV292MxOr2uw5VovDZjoc2wEhZAqyb27hczA3PmrfuWJ++x8rZHR/9qKXikgExEJNWP1PQu21C/EbqJznsudKOy2iVbgOF/FgRk8GIctnAKz75kltRM9Qa4P07g3cAky+DUnttF0cxnUoxmbxPHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nqAV7nk9ExyC+lNCc/AvwWpTztfD4eoiDhIAk27nlE=;
 b=M2Qr5yg84ArnN5L1qBEQ6SFcaJHKriHjar9dQU7/6SylowH2qspTQVGec4qENTanEXT3kCDnRuwIZI2YlzK3gFYh5EHc6t0adHsbgS4pHhHxQZUlmcn9d8LmO3u5NFc7bdx8qIXg2UqjXkiA0azPnVTQvDezez/+dvxMH06E9Fs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2192.namprd11.prod.outlook.com (2603:10b6:301:59::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Thu, 5 Nov
 2020 08:06:16 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98%6]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 08:06:16 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V2] pulseaudio: unify volatiles file name
Date: Thu,  5 Nov 2020 16:05:54 +0800
Message-Id: <20201105080554.10210-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <1643A66260CD2871.18368@lists.openembedded.org>
References: <1643A66260CD2871.18368@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0163.apcprd02.prod.outlook.com
 (2603:1096:201:1f::23) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR02CA0163.apcprd02.prod.outlook.com (2603:1096:201:1f::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 5 Nov 2020 08:06:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0aec3729-2af8-4510-b92b-08d88161abd0
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2192:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB219225E05F5D27E8180C08DBF9EE0@MWHPR1101MB2192.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gx2Zt36D1FQxjvjiL2jFaA0IhsMqw2Wh24wAWnu7flV1AObfMly3sWCMAXfRMZ6zaBdeVUGqg+qo7ZwpnyEsU5PsCteYscRhRdXbrf/S0npOIzt+ei19uB1onGOkLbynIuiFZZuy1tFbpotg/L+iFPtF1+i4QVqAHRNq0kwjUyjqAH3HAmPX82Zq0axuN7xzXKHFf+5rh79k47PZ6pvvUS/RajybDgF6/91yogKc6Da1OlTQ9RwrP88fctGPcTxP1i/vGvZH15hQ84Yv8RdbLsxPzLzzBssN3h2MLwwAwg6/GFbpa7qJ+rf99XsZx2qktjWb3hBnFEinT7O3s01QHw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(396003)(136003)(366004)(83380400001)(86362001)(36756003)(6486002)(8676002)(2906002)(6916009)(8936002)(6666004)(186003)(16526019)(44832011)(52116002)(478600001)(5660300002)(316002)(6506007)(66556008)(66476007)(26005)(956004)(2616005)(6512007)(66946007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	8EO9ZuqcY3/Gxq2/OQQSO1V6L06LIghaRoa/vQ3s4BSDjlyFDTpDydLwhR3X8af4MIiqjCp+QsZYCdATC9uHOckdS1uR/vA143zB6ANDEuJgtLRKn+Qk0G1GZsblub4E+HslGm7vcqrD6siUhIFEqvQqxZJTiJVLgmk6cYjlH7FR5IuHDHBe8pHQmO5+cAMf6JFpgX/QqDIQUwwOm6HDJf0MY8rg5gy/yqfE7pvo+nasMcGOMuCine4S9wYEPeY6HC1FFVjl1NM7SBp5SC1xy1YjnlxYuzZe+zb+RW+5/bs+df6X3Im6Tt6wx60n5sqP/q8fst9jg3jDAJGUz7Bso3JYrfKuLQnd1CQLKTcyrMrQNbLy/gxO+6Us+mSCizMaxbaWQtW/BNqObhy0OlFRxsbB0TYF01nJG4QJFpREA93x+5y/cmfhm9L4NhkjoVZu+e3U7jUnrNdd9LeGfAPT1mtUKhC8Hxcr1SEUWqV/90Hvy6ZJtfjhx518MbjeOLXous2ilj2vp/pVOekgWrrXytux8r3hC1ZhP3ifox8PQ/23JFPUX/ruL9J+i05e0dBwZHx5KnBGcfq4L4/lviI2MluwXHLrw4F77o7MeMJoHysG5aGzDS6nFx5UEx+uSXSja0lc4MOQtckNaB8lgLOp5w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aec3729-2af8-4510-b92b-08d88161abd0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 08:06:16.8881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gasxb4nMRjKRUaV9ghIxHE13LW7FwFtevxazm9QxcdzUSiU6vmsBdg8BbbYjLVOAkmBSrY0AqrH13lvQXcsFIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2192
Content-Type: text/plain

Make the volatiles file name start with a numeric value to unified
volatiles file naming. I searched in oe-core, only pluseaudio volatiles
file name is not start with number.

On a default sato-sdk image:
$ ls /etc/default/volatiles/
00_core 01_bootlogd 99_dbus 99_sshd 99_wpa_supplicant volatiles.04_pulse

This is just a name change and will not affect the functionality.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 4e32b27087..3a26cb59dd 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -149,7 +149,7 @@ do_compile_append () {
 
 do_install_append() {
 	install -d ${D}${sysconfdir}/default/volatiles
-	install -m 0644 ${WORKDIR}/volatiles.04_pulse  ${D}${sysconfdir}/default/volatiles/volatiles.04_pulse
+	install -m 0644 ${WORKDIR}/volatiles.04_pulse  ${D}${sysconfdir}/default/volatiles/04_pulse
 }
 
 USERADD_PACKAGES = "pulseaudio-server"
@@ -192,7 +192,7 @@ FILES_libpulse-mainloop-glib = "${libdir}/libpulse-mainloop-glib.so.*"
 
 FILES_${PN}-dev += "${libdir}/pulse-${PV}/modules/*.la ${datadir}/vala ${libdir}/cmake"   
 FILES_${PN}-conf = "${sysconfdir}"
-FILES_${PN}-bin += "${sysconfdir}/default/volatiles/volatiles.04_pulse"
+FILES_${PN}-bin += "${sysconfdir}/default/volatiles/04_pulse"
 FILES_${PN}-pa-info = "${bindir}/pa-info"
 FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} ${bindir}/pactl */udev/rules.d/*.rules */*/udev/rules.d/*.rules ${systemd_user_unitdir}/*"
 
-- 
2.17.1

