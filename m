Return-Path: <tom.hochstein@nxp.com>
X-Greylist: delayed 28757 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 19 Nov 2017 01:39:42 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0060.outbound.protection.outlook.com [104.47.2.60])
	by mail.openembedded.org (Postfix) with ESMTP id ECE6278654
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Nov 2017 01:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=oFStcSWRyqeV3uAU6MB7FREoJM6FnOle2726bJzLTdU=;
	b=nsjU4owi47aP+FUw+1dQVVmQMbLAL2MNhlD5aYpMl1jE8ZhwOlvh4n6thLzHPVZTsx+bf7YITcHyY4gDOZq1BuOBvkLm6ZhqSBgQSx70GY2RGqbAL8gxNImBhhR6jga50tzAwJYESGA+kTUgRYOiQmIFD3SR2/EkrFOLl4NSdDo=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.1) by
	AM5PR0402MB2817.eurprd04.prod.outlook.com (2603:10a6:203:99::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.239.5;
	Sat, 18 Nov 2017 15:02:39 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Nov 2017 09:02:20 -0600
Message-Id: <1511017340-27917-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.1]
X-ClientProxiedBy: DM3PR12CA0063.namprd12.prod.outlook.com
	(2603:10b6:0:56::31) To AM5PR0402MB2817.eurprd04.prod.outlook.com
	(2603:10a6:203:99::8)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f8b1e84-81c4-42cf-8009-08d52e95695f
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(48565401081)(2017052603258);
	SRVR:AM5PR0402MB2817; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2817;
	3:hoX+9SUgD17L4YL2+YwabhAAPfm7hAronzPer2WPlyyl1azP6UWjEdM3HrMEZaP3+YYu5/OY/BdAuAVb4ZrEFRgXFkzFzp1Yuaeofxi3N8LCZxov6bBzUs2f2ue5tozf9AHCGVvhpp9+qmtfj/Y7ysEndtJx9wnenHmwX2QCQDyORw6ALCjcE0+Szs/5jnHgI/+QhUlbtBdsV/eSwTvvSY0ue2Bd4LBDBXkC6BJZCenNCStXvDe2AtSohWfjIfXQ;
	25:IfN+KrIH2d9MCR25MU/0GpDIFvBq/82CIcpqs3THHiGXTs9NViRuXLSWwlH0cq+WNCDYrsESx4Scz5q2kDGBnOYP+y1tzaCOBZGG3vaV9IUViD6H2aMihuqtgy326gHqhS/uj6we/RypR4DVmUAa0mgug/sLC3qrAMf1H0GvHb9I8aA0A+VyQLkpz/7s5ahBKLh30NE2AJXBZb7w5WX+bXERye966HlY/gzhTX5qdPHQ93g51wYqUgUhHgJWl9FyTSYNwhOX4VzjdrO1w5hJIIMHzer0xMFUxPy/qcLRvLvMfS/E4ySkaHTt3cbZvF0ypfsCKx9XTUEu8QILne71LA==;
	31:GPQxIYR1O3iifvBQ7KuWkgvo7dF+pHn+gZKhyw54IrHDutvOCvVpJPjH9fblUI1THXfheFXNaUGeQGFk1NPICuh9UXRekBkzv/IIIw4EL8+VpTCuokUa56g7zN/0QICJddQ0CNcN+0/zvNTpFAFcZL2wSZ3Tt//YErwkU/aPaUUByfcaE/NmWg7umzQ2QtdllBJZW1rlI3l5bLmSP7rtJIQT/91RpJJMGVl841jrEy8=
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2817:|AM5PR0402MB2817:
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2817;
	20:DcadPW/vVU/L+3EKymEfdtlXXZ9sJZkleN1p+r/v5JXQyFLgf9nautX0DGnQ95RQnVWO+IZQbj+4qcFX+IuZ8fRBvZoKppfP4BhRdYg3hkl7x5uZDGvWyAp68JzF9fzGHPfeVgfBx/Buwf+LK4V9ckjpF5oxQxRM5WZC4CFmwitKOZzhWwBlP34wCIY8ZF/XLxKY9OaIJ+IAcMHTB46ExP4fzaHcZCSoVcqy9JO7wq+i1kUyUS82kD+G2cW8h69oyZdj8HAm4uyGYMO1x4fUKdaITPCld7XUna0AweNo/m9NVKENH+aX/Jv5/9iUdITtxQmx8urCY868QG7O5EK0hcdMXcjJi194EoONfI06mhSQppM2Fad0Q2I13o9+cMW9t2k1H6QwZsPStf4lVM3vGEuoH7xNdfiouoqqSZTrUWsOlrd57RXoMBASzjLbgoEccZUdYLVnhObbyuAfMHHKoTQxIcpQuUGDlKv703J5n/85lmViCZi8FoogfVYzydqC;
	4:kHvnmiNYero8kVNgkpGGWoTwqsGCALsh+9zAS6m1P0C9t3rKa94UtjHqDczrLV6iwb7CHTUwpFc79VeqEOYWq23R36mGpQqA/Zm7qdV9UfEkxwp8C+B1puZXOshjQOjsz3rqEFEy0BFyWR5v53ZiCydI6kFHo3u+YKlCcII6CANvN3b8kyrrl9rRDVzY66ydAg+5+JhykYtE0i1QgDme1V5mZQN067mIezsm8CC8xVc7WAsdA84ZEJA4dv6qXoDnx3XmGd+av2AtRBYgHdsGH0A8mAl1abjzI6QKnXhQLRkaQw6y3cyDuX+AlJF6taOZvecSGfRYXUMyiDv0PJ8XkAzjn+Hr+/TlKW8r7J+N9O8=
X-Microsoft-Antispam-PRVS: <AM5PR0402MB28176C759A1AD65A4BB03E8DE22C0@AM5PR0402MB2817.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(3231022)(93006095)(93001095)(10201501046)(3002001)(6055026)(6041248)(20161123564025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123555025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0402MB2817; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0402MB2817; 
X-Forefront-PRVS: 04953B1F22
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(346002)(376002)(39860400002)(199003)(189002)(377424004)(25786009)(81166006)(966005)(8676002)(81156014)(6116002)(3846002)(16586007)(478600001)(316002)(8936002)(50226002)(6916009)(6666003)(5660300001)(68736007)(86362001)(575784001)(189998001)(105586002)(6506006)(6486002)(106356001)(4326008)(2351001)(2906002)(97736004)(2361001)(47776003)(305945005)(48376002)(36756003)(16526018)(7736002)(66066001)(5003940100001)(6512007)(33646002)(50466002)(6306002)(50986999)(53936002)(101416001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0402MB2817;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; PTR:InfoNoRecords;
	A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM5PR0402MB2817;
	23:GID8TmV1bt1b3C+mcMUQ6CrkYkHUeY/WlACrQp8?=
	=?us-ascii?Q?2e0pPYUgTkXMA0hCAKQs3l/h54HeJ+2V5lKsC0uPHK+iw7/FGSLCg1wbKb76?=
	=?us-ascii?Q?r2+BHUZEfIQdotafA0NL8kSdVyd09vPGyqFuK2r7Brx88W+QzFvlZ0vW5fJh?=
	=?us-ascii?Q?FEiDsV7ndT3oQRW70m4wha41qr05xqlnCv/oV+RQ0zm/N8SfdsqVHjLFOGKH?=
	=?us-ascii?Q?rk6hoHDjNooYKiGw+P+3bzQsdra6Y6yeBaHHRLr/FejYbkilOxCB4aWlJsrG?=
	=?us-ascii?Q?4rhmYJNTbEelWEYRHYwtFbY53YjRSo6lZjKyCT4LRyoO+n9s9Doj2bDBKcq2?=
	=?us-ascii?Q?gxJ0FrY0SDEA+Fpt1/gN0tErVEGTyA1sMrqpo3VRqsuVRY+ez+1iAFWImWzV?=
	=?us-ascii?Q?Y5Qp4+64QFjf7uDcUlMf3sOn1JktDycitP0CgY9LG0aRZrrPwY7d4thgDc6z?=
	=?us-ascii?Q?DsP2vqw2pa575pqS0X2yZWwOnLtwmd7c/TDNNdb2q+u6kj+4bbu8GYqtpE62?=
	=?us-ascii?Q?xvqz+edHKOXRbxuDEBEFP3FCM5PKGAcG73/taQXmORdfqbaukS6EH0P7syle?=
	=?us-ascii?Q?efryoZbnAdw7AQKin/CtfP06bzzTjVgrZJS7sIi91y4dGuxR9Ow4MH6NwdSY?=
	=?us-ascii?Q?nF5W/wCfkLYXR54/TLTTSP8p4nI1l78s/YXUJMMLlQdMn606bkjZrDIkU9lR?=
	=?us-ascii?Q?Wwr6HuYi4SXgTtwewbNv13FWLxSoiRStmCtrZlYtasDkbFMIE9kPINrq1PIh?=
	=?us-ascii?Q?O44fDGl4ozwC02Gh86U4prfBaD53aLoGJllxmyQBVU70+DyhPh4bou/LLDw4?=
	=?us-ascii?Q?IqVwDptO8eIdF4pTFFpgf6wNgptsFiDr1+WuMzv0vldcu5ZFekpbGlxAMbQ3?=
	=?us-ascii?Q?lW7DTgFUsxO8M8HXbvT0xiimHuhVUiYOGFcaPY2KgXWBIa+jNr2B29XCrxC/?=
	=?us-ascii?Q?59VFTOS+4zI0Dd7EW0P3hAWq7ws1pXDsKTOshXysO8Aa3ywtCsHirhnnCgyb?=
	=?us-ascii?Q?XdxZnuLom8aWsY28dnw9J830YcDTHo7rKzJ1R5/E1jRDjh3/iTLu07BqSCE/?=
	=?us-ascii?Q?N0RDmn4jIL+zSY6SRx/ucT4ieW98q5nRcg52ILpIcsrddr+fh/mSminK2Psy?=
	=?us-ascii?Q?mih3a0akkMWgh0lChwqLrOfOLSmG5iHymEkw1IpI+Wp9cEl71zsDdyw=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2817;
	6:XcQYZiSTuRPFSOf+EzbmGHqL9LOhyD0+Dzt40OYYnVYaJPao9gOJ8QtIJFgnljuYpQdbqSV4xGK70h7jd5E44oeBORHssauACnaGiZZojjDNG1YpcPYK1ocea5Nf/JbEryB9Y8/c3m3VRiO2UDxNvVTvLCa2u+2vnRQ78R/PWbm4Tpf0Vxcwat5o33eGhkIfw5L6AJ9a6qqfNh6ynsVj0qigBbau122ltL6M0xOC80GBU+BzIuJ63AMpM+8CjjccD09pWc6BP/1WDbVIl34SkMXY8BRumwXk0QZ9wIJZk25MJjC98h51w7vn07iNAny2YAXy+ry5APPv+GPxkfeiBgLm1yr3kyS9pfhlBU3Ohno=;
	5:/F/JnXlxPNHih4iv0os86A5ArVFvjgqXTcmUnCqtWb/A9T7o/TbcdD/KSQap1L50iDQP0drLfL7FTsw5HOM+U4RGqgeY7RD23MQWeb9p+bfptQV7EBdaYL2TY+SMx0ltaERTn5zxDnxcHIuGL8rN5rpmm8oN2Y+tpwI7iybVehg=;
	24:ywm/G65O4PPTP1sILptMFSbx7CSipDVgpILSswXVBXfBd30H7+rEDxifQIJ5d+ds4EQm4v+aLm2l/2w2L7KGWBmK0sSWqWVviuNxhkeaMAE=;
	7:LU5YVuhJe2uKxCu7k99I9/YPt3z9wU93mvLLuz7ABSeX53ckssIzpH6TnWF1bLDNydqaLOv+71clOfcdJAQYbvAp2PAaBPR0rWj7vRyz6/ZQ6VcYCUGTJXS0FwjdGbdyZaQzJvaS+C8oeoti7icf1zggVzeeR8uUEwrndRTknnip/1+/dXFT7kYDYb2OKDKqeJthkKowLkKBk4pPx7LmqdinmABK8mZdyOf522pMT/5gcum2vhuzgY1szVkFyFTV
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2017 15:02:39.0039 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f8b1e84-81c4-42cf-8009-08d52e95695f
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2817
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2817;
	23:tL8Rr9ugcS/NaVSBh6G4+uaLUWgmsHc05ALHYKosZKPlydhyxfh/p0h0Lq4aCMjpldddSupLPsm/AgzriOJREP4UNUsUU1lS8i4ohQr1M/FCYaESB8rydLDMO6w/BM5hCJcpZ5MinIvLMPkzzJNAHw==
X-OriginatorOrg: nxp.com
Subject: [PATCH v2] libepoxy: Fix build break for EGL_CAST dependency
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
X-List-Received-Date: Sun, 19 Nov 2017 01:39:43 -0000
Content-Type: text/plain

This is a backport [1] to fix the following build error:

| In file included from /home/r60874/upstream/xwayland/tmp/work/armv7at2hf-neon-mx6qdl-fslc-linux-gnueabi/gtk+3/3.22.17-r0/recipe-sysroot/usr/include/epoxy/egl.h:46:0,
|                  from ../../../gtk+-3.22.17/gdk/wayland/gdkglcontext-wayland.h:32,
|                  from ../../../gtk+-3.22.17/gdk/wayland/gdkglcontext-wayland.c:24:
| ../../../gtk+-3.22.17/gdk/wayland/gdkglcontext-wayland.c: In function 'gdk_wayland_gl_context_realize':
| ../../../gtk+-3.22.17/gdk/wayland/gdkglcontext-wayland.c:179:43: error: expected expression before 'EGLContext'
|                                          : EGL_NO_CONTEXT,
|                                            ^

[1] https://github.com/anholt/libepoxy/commit/ebe3a53db1c0bb34e1ca963b95d1f222115f93f8

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 .../Add-fallback-definition-for-EGL-CAST.patch     | 33 ++++++++++++++++++++++
 meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb   |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/libepoxy/libepoxy/Add-fallback-definition-for-EGL-CAST.patch

diff --git a/meta/recipes-graphics/libepoxy/libepoxy/Add-fallback-definition-for-EGL-CAST.patch b/meta/recipes-graphics/libepoxy/libepoxy/Add-fallback-definition-for-EGL-CAST.patch
new file mode 100644
index 0000000..b929725
--- /dev/null
+++ b/meta/recipes-graphics/libepoxy/libepoxy/Add-fallback-definition-for-EGL-CAST.patch
@@ -0,0 +1,33 @@
+Add fallback definition for EGL_CAST
+
+The EGL API update from d11104f introduced a dependency on the
+EGL_CAST() macro, provided by an updated eglplatform.h. Given that we
+don't provide eglplatform.h, add a fallback definition for if we're
+building against Mesa 17.0.x or similar.
+
+https://bugs.gentoo.org/show_bug.cgi?id=623926
+
+Upstream-Status: Backport [https://github.com/anholt/libepoxy/commit/ebe3a53db1c0bb34e1ca963b95d1f222115f93f8]
+
+Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
+
+Index: libepoxy-1.4.3/src/gen_dispatch.py
+===================================================================
+--- libepoxy-1.4.3.orig/src/gen_dispatch.py	2017-06-06 04:24:13.000000000 -0500
++++ libepoxy-1.4.3/src/gen_dispatch.py	2017-11-06 12:45:43.594966473 -0600
+@@ -491,6 +491,15 @@
+             self.outln('#include "epoxy/gl.h"')
+             if self.target == "egl":
+                 self.outln('#include "EGL/eglplatform.h"')
++                # Account for older eglplatform.h, which doesn't define
++                # the EGL_CAST macro.
++                self.outln('#ifndef EGL_CAST')
++                self.outln('#if defined(__cplusplus)')
++                self.outln('#define EGL_CAST(type, value) (static_cast<type>(value))')
++                self.outln('#else')
++                self.outln('#define EGL_CAST(type, value) ((type) (value))')
++                self.outln('#endif')
++                self.outln('#endif')
+         else:
+             # Add some ridiculous inttypes.h redefinitions that are
+             # from khrplatform.h and not included in the XML.  We
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
index c8b398f..0172322 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
@@ -5,7 +5,8 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 
-SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz"
+SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+           file://Add-fallback-definition-for-EGL-CAST.patch"
 SRC_URI[md5sum] = "af4c3ce0fb1143bdc4e43f85695a9bed"
 SRC_URI[sha256sum] = "0b808a06c9685a62fca34b680abb8bc7fb2fda074478e329b063c1f872b826f6"
 UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
-- 
1.9.1


