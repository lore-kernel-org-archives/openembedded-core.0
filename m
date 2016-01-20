Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0131.outbound.protection.outlook.com [157.56.110.131])
	by mail.openembedded.org (Postfix) with ESMTP id 9F26C71957
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 09:54:30 +0000 (UTC)
Received: from BN3PR0301CA0082.namprd03.prod.outlook.com (10.160.152.178) by
	BN3PR0301MB1169.namprd03.prod.outlook.com (10.160.156.143) with
	Microsoft
	SMTP Server (TLS) id 15.1.365.19; Wed, 20 Jan 2016 09:54:30 +0000
Received: from BY2FFO11FD023.protection.gbl (2a01:111:f400:7c0c::122) by
	BN3PR0301CA0082.outlook.office365.com (2a01:111:e400:401e::50) with
	Microsoft SMTP Server (TLS) id 15.1.390.13 via Frontend Transport;
	Wed, 20 Jan 2016 09:54:29 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD023.mail.protection.outlook.com (10.1.15.212) with Microsoft
	SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Wed, 20 Jan 2016 09:54:29 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0K9s9RI004523; Wed, 20 Jan 2016 02:54:27 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jan 2016 17:51:35 +0800
Message-ID: <1453283501-3982-2-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453283501-3982-1-git-send-email-b54851@freescale.com>
References: <1453283501-3982-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD023;
	1:XJuWx5n72T6KryoSqYJs3+LST1XGUiGAVOpMxZ0I+ZWhiQHVD8FHJ4NO93B8yuyxRK86A8EykKj7mOeOFviioRxWhC38mlz3YMtwKgDH/AGbPMKFvpEbx2cLHg5bffxikaMI1nYHTuFDY0M0jjxFEo+zzHHQ5F43g/sg8JsreqbP0nMxjNTGhhyRKgIeM0ImlaCA76IXDkHnNnnAYFAx0TkWNbZnI3USDLODGtL81tNhtqL6W3gHvNOTQzreNkr859Piry4uqbBUV38+jIT40BjeLBPLwqetuzLeVnTbui+DhzoI345zgyd4PWFRIeN2mk+PtHmKLQ4YK8tJhPJcPlIbl8OJQbuT2OMQhKAPBymhGuGWvhwyHXqNlCDwumYMM37gyRyq20Z+L0gLCKpa0eBkrEkgVYSv2qtpD7YvXvH2cRzIrTDYe7aptWTZvVMj
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(199003)(189002)(77096005)(15975445007)(5008740100001)(4326007)(104016004)(6806005)(2950100001)(50226001)(19580395003)(19580405001)(36756003)(4001430100002)(5003940100001)(11100500001)(586003)(1220700001)(81156007)(107886002)(110136002)(33646002)(2351001)(48376002)(86362001)(450100001)(85326001)(50466002)(92566002)(229853001)(575784001)(189998001)(106466001)(50986999)(47776003)(76176999)(97736004)(87936001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1169;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: da8fd7c8-c299-45db-2e26-08d3217fb058
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	2:mPBY53yhmNbFeKbQsmYiZMrUToe4IS/t5TbSm1CJHc1Dckv0eUZYXyEC3YrHP0xYlAYIOsLZcsdAvTnXWnbSCeHhsQqfNNEBh6/XyXwq3VWHDxvqkqwK0+oaSuBkLOCOP1GYEBaek96DpYEh5f/DgZUjcVQSqB9qyOQ5EnWlrnywOZNatKJIuFgPqLGYmx8+;
	3:xNZ3Q6GRcCnAHxppbKzlCtAMCFGdRWMu6cOFXR6niVw0AV35Doe5BCADV9qc7FuxASkLSvhcpZHSj+YeYPnTlk7bSCcOmBICtTNpHPkQKmLM5KHxqsUsyIBjfpuLmfp5eJj7pjnS1LVjmEL/qLYTZ6OujgwzP7N0nzvsuUKgU2UCQQ8J0WtORMadTOQ283TUT4jyZ9fUvWxVUWO+ln+CQ+dydTAlTbHKazTTx9sZBik=;
	25:QbmFM7WBTgDG9wuzxBX6GIq/0DO0sWWYqZprPCYk5JmwzWXeI1A65f9MT5if2+dkY+SgH/TwMnvORlCyv0HMFYsHvuZm1LGYwmxp8wyjQ+pS5PkBWi24tAUdMqXyVEnZ+/QF3IupBKwQ3L8G2rKfEyl8URXLlPSyxsLOHLYH4lSIEZJBhT2oZ9w6KmVkpwHtNViIdeyctC4des5a3cuNAbYAY3WRQK9b7BRP6rh40Bli/TSxbQUpdfyDWp3LEaOU
X-Exchange-Antispam-Report-Test: BCL:0;PCL:0;RULEID:;SRVR:BN3PR0301MB1169;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	20:tgFAlPQbwEPUGMmkfffn4R46od77gJXSS0z/xRM5hN+fVImjxFV+fsarvuoLMPYu0y/YUE70UB1hynlebLMT+DRRaijhYwt+ij9ZbAxqXb5vhtK0kXa3QJ8DEEi4U5X3UFvA+gTV8LvRm4GwN5jW1OZk5hzu8tHj173YDp2Y//JZTRPmT0jEtqCyHZS4/eLjxspTwoocp24xcn8DTumEQY4GJhJlrrXLy3HeUm9z/LFCCRFT5ID+NdZYf+9LPeBFr2v2dA7L3seP4r989fOp/LsRj0jgJn/S+KS5Q1gWNimzc2cQt/nnY/JxM+VRdkGpbWMA7hBCzdBVbS9nMM3DxyEocmmYN7Y/deZ1GW+IWX6WKtZGvY0rP6GonHlYJvGMJ9m75Hizli//iuTe35dX6mCcG955krpS9rpIBLILRgCW75Q/s1HAxHTD8ql4PbMe
X-Forefront-PRVS: 0827D7ACB9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0301MB1169;
	23:KHg06MC6Bzi8pq5u6dPk42EH0a4zIKUWx4CoiwJ?=
	=?us-ascii?Q?3m1fQjlkOMRZLNNd99mQWJB5Lz1TqkAIqZTj5eICEEMULkTDC29bZQ8X6d95?=
	=?us-ascii?Q?0QX0SWugB+0hh7VQA/z22fcdIiYDZvyoYa3qtpGjil4BaQc1nBlWKpsZ56i1?=
	=?us-ascii?Q?ZvfWDZ9rmp1CVST/JEfBMc2d4bMjY4s9X3EfNBi+sfmPgTrJF+c93Q67l7Zr?=
	=?us-ascii?Q?vg2jGsRN1hnk2/BFkGPA3HOegQrzVDgOZeX4Kms0Hh3sxonlEWEfUiIOxwlT?=
	=?us-ascii?Q?kv+uNDLEE4kRzEtrWV9EKpRU7PoPZquDNwrrXOw4yrKy5q0kEPIqpLj1Arkj?=
	=?us-ascii?Q?gftOcKEwxvxX12v7OOaeKipI+qQcvWEXTXNa0CGpCjfQdRaTIwJbiOAmr7bK?=
	=?us-ascii?Q?uBcZnrcPcF6Q2+LTvRT2awudEznaQJdQv7v3hejTZIbkfnyq58oQJTfmkhzN?=
	=?us-ascii?Q?ODZ34C1lsa4VvN2I3MwjXSAf4zaR8T7GO8I0xiJTbMwsWTF+jjuALC2CoReb?=
	=?us-ascii?Q?YAtWuEMidxubzOKowZJrwuzdoUqjl9aeGL8bAl4on/5x5CvDp7zrjnDxITa6?=
	=?us-ascii?Q?FQhmq7d496Ku0IWoQlM8zvme02QhFDCXNozH/Mrt2Uz5q6UeElCLzo+CuWCD?=
	=?us-ascii?Q?raGbncctDB9+jnBHq/3MNhjr2deBfiZTZzAv/MJZHKj3Bv6JdHpueD91hDAP?=
	=?us-ascii?Q?9f7K5LNJCnxiQ1dxcDv+jLqtDtahVQzeF4iVUKUi0qPGNRIpTAd0LS6b5XVy?=
	=?us-ascii?Q?qMR53YLn569X8JxRqDB9oOkF6Sgl86ir4mab4YJU9b0/XaXbBa+SsMk+oUKS?=
	=?us-ascii?Q?E82l7FKSD1FQB9BGwgcPNRRbLeaSVfhjsd2JiR0vJp/jCX9iFbBwpQbbuo9D?=
	=?us-ascii?Q?FKFyf3skehgDnTbsvbCtdp9mOPAlt1O2AAeANPkDPt0WzEcsRsSVt2Wth1Ky?=
	=?us-ascii?Q?3x7HS2oZ385W89sDuQHcol7P1VtYeVdcAN5Bt85Qw/hp2M6Lo97DQm0cmnfh?=
	=?us-ascii?Q?8xPsFBhscK5NByST0hiYak1jERP/xzwkubTbkcdogBX+1fJXGdeAinccAtRs?=
	=?us-ascii?Q?UHyKImjTFzkLG4SqS9/3Wy46fkCh7pi5fRcd4Lc4Y4Wdx0EKyzQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	24:UUNSPaGH/rsBbLOQY6jljBMaLh6LWsVq/AgvsArXO4hEpHz2ZjubaEp4o4lTNZpis5orM8dmWarTfhJR3R4anAvYqIpNSOUDTzLfrWEAxI8=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2016 09:54:29.0632 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1169
Subject: [poky][PATCH v2 1/7] gstreamer1.0: [baseparse] unset FLAG_DISCONT when push to adapter
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
X-List-Received-Date: Wed, 20 Jan 2016 09:54:31 -0000
Content-Type: text/plain

Since DISCONT flag will be handled by priv->discont flag,
there is no need to copy DISCONT flag to adapter.
Otherwise, the DISCONT flag will always be set on each frame
for the first chain in buffer.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...e-unset-FLAG_DISCONT-when-push-to-adapter.patch | 33 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.6.2.bb                |  1 +
 2 files changed, 34 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-baseparse-unset-FLAG_DISCONT-when-push-to-adapter.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-baseparse-unset-FLAG_DISCONT-when-push-to-adapter.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-baseparse-unset-FLAG_DISCONT-when-push-to-adapter.patch
new file mode 100755
index 0000000..3612dbf
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-baseparse-unset-FLAG_DISCONT-when-push-to-adapter.patch
@@ -0,0 +1,33 @@
+From 90254a34f57278930bbcb3bd80cfef607157b03f Mon Sep 17 00:00:00 2001
+From: Lyon Wang <lyon.wang@freescale.com>
+Date: Wed, 4 Nov 2015 18:16:52 +0800
+Subject: [PATCH] [baseparse] unset FLAG_DISCONT when push to adapter
+
+Since DISCONT flag will be handled by priv->discont flag.
+There is no need to copy DISCONT flag to adapter.
+Otherwise, the DISCONT flag will alwasys been set on each frame,
+for the first chain in buffer.
+
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=757575]
+
+Signed-off-by: Lyon Wang <lyon.wang@freescale.com>
+---
+ libs/gst/base/gstbaseparse.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libs/gst/base/gstbaseparse.c b/libs/gst/base/gstbaseparse.c
+index 51d159d..184fafe 100644
+--- a/libs/gst/base/gstbaseparse.c
++++ b/libs/gst/base/gstbaseparse.c
+@@ -3026,6 +3026,7 @@ gst_base_parse_chain (GstPad * pad, GstObject * parent, GstBuffer * buffer)
+         parse->priv->discont = TRUE;
+       }
+     }
++    GST_BUFFER_FLAG_UNSET(buffer, GST_BUFFER_FLAG_DISCONT);
+     gst_adapter_push (parse->priv->adapter, buffer);
+   }
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.2.bb
index ba46c77..ef1e88c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.2.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://0001-Fix-crash-with-gst-inspect.patch \
+    file://0002-baseparse-unset-FLAG_DISCONT-when-push-to-adapter.patch \
 "
 SRC_URI[md5sum] = "5e610b5a94c209487310739b39b6c464"
 SRC_URI[sha256sum] = "5896716bd8e089dba452932a2eff2bb6f6c9d58ff64a96635d157f1ffaf8feb2"
-- 
1.9.1


