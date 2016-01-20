Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0140.outbound.protection.outlook.com [157.56.110.140])
	by mail.openembedded.org (Postfix) with ESMTP id 012A26FFE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 09:54:36 +0000 (UTC)
Received: from DM2PR03CA0031.namprd03.prod.outlook.com (10.141.96.30) by
	DM2PR0301MB1184.namprd03.prod.outlook.com (10.160.217.146) with
	Microsoft
	SMTP Server (TLS) id 15.1.365.19; Wed, 20 Jan 2016 09:54:36 +0000
Received: from BN1BFFO11FD001.protection.gbl (2a01:111:f400:7c10::1:189) by
	DM2PR03CA0031.outlook.office365.com (2a01:111:e400:2428::30) with
	Microsoft SMTP Server (TLS) id 15.1.365.19 via Frontend Transport;
	Wed, 20 Jan 2016 09:54:36 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD001.mail.protection.outlook.com (10.58.144.64) with
	Microsoft SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Wed, 20 Jan 2016 09:54:34 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0K9s9RL004523; Wed, 20 Jan 2016 02:54:33 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jan 2016 17:51:38 +0800
Message-ID: <1453283501-3982-5-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453283501-3982-1-git-send-email-b54851@freescale.com>
References: <1453283501-3982-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD001;
	1:kKorvTTRhfB1S0416Wgjxbirl770YzEX0u7Ri87+EJAWZrqc1cHNpA+Colaxy5j1cN8I6RL5zE5Jz3/PGTeEnH+ElGPmF8LGVUo9+1f2YvGvtcmn6XnNz3dWVcNwUEfssvXc28wrPuXzDR63bAn4/3UhJatLfGOLZTLUJKKCWrEbzhrn+D9qFZUOHnWLr39m4tQPAarI3SCjZV5wxE7AaLVqwhFrCUKON1pmm0jwMSIpd2DsXzh7zRhzhCESfoB+spIFVtLcxzwc0raeiyjhzBzYrISZwAB99SPN1kkKQ6obLtPG2V0555QyZNPwgKUKcZvL+46B6fHHFe6OaHoKTdUjGMTELjQB35twAvQlG84urge3FLOhAOOL7DC8G+RcyjFB8wIjN1tgvLHV5xgC16mZWRVhXAqnzSzdiiWDffxSwzHCFite+sPnIUdy0yIt
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(199003)(189002)(85326001)(50226001)(5008740100001)(450100001)(76176999)(87936001)(4001430100002)(50986999)(104016004)(1220700001)(4326007)(92566002)(1096002)(33646002)(19580395003)(36756003)(19580405001)(586003)(6806005)(48376002)(97736004)(5003940100001)(47776003)(81156007)(50466002)(189998001)(107886002)(110136002)(230783001)(86362001)(106466001)(2906002)(2351001)(229853001)(11100500001)(2950100001)(575784001)(77096005)(15975445007)(5001960100002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1184;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: c78b1274-3b25-448a-d59c-08d3217fb42f
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1184;
	2:0JYukG4tgO1WdBtj+nfjpDqyKQcUIdTEmW0qG5KfnmmVC2c5X69A9Azs0qVoCgr7L0Ol0WL11PiHcdmSJLlVoEqZhzrz6x/0581UgpgmIwEaeMfyAb01R+0cPFeHrqOP48+MntfLJEg8lqLiQx3TXUQXNE2aXOuNqomOqV5e+112/MiR7tA2CaBZjyfSWWtG;
	3:YxYXfkIDv/kFxRhUIE3UnirQxF5mKd7ZOFr8ihJcTKkOkh1olheTgiOSlpoW/rYvy9+mkj8Q4wio4aw4AvlnZiADgDAe66b179AP790o1lc9J4Jf72k5gITVI1xc9eSnV98YnhYp4xwQ5Q5LhRIc1z/GsvhOb9PqtyKw1JUiTB5GNq5aDeOAI4kVA1i/kjP5D7+7V6BS5bTjDAmkd3woL5Fw/lkNt4L7VLhLzkmMobM=;
	25:ciVa0vN1nEaaCUkZ2pocVqjJFmo4Z2lHJttSd94CCEMJBJ8euf7n/5MYKBDsrzsiU5yQ9BhZmPnYz8sw/1eeEPVj/KeEnac+k66oB/Fm0kaA2LCZBhC3jhmeqQCdCksYaqiyeEABHqfo8QD/8SuGceUiQfGtLxSgRSj3RMNnQJocO+dg9ONWPJGIIXJFbLeyXz7vtcWDdSGosrCjHW+jUYrIL9c/ahHA9fqBCkisMkwl38sqD52zD1QaOkxaNUHH
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0301MB1184; UriScan:(101931422205132); 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1184;
	20:psU3svYgBhP7iC2f/HkOnFauzfVlTQEFwiXTnIzgwJEv6rw+R6LMqzw+8cLuI6/fOAY79f+u1rm9fNAh0xUdqbC0fU3hsDU89rwUDrVpfsy3Q6Am4C6/QssExyU857gYpfWR9TcQfV9OXZ9v0GkIlZE31BL/s0bn6EnBKWX4nEIlOx4hO/H6o3X2CDyM3tdk8U7VPmJwKzzORuy3kw8DwnyRUhQ4s47JfxIqLstJEa6cATQLAE42TKChQNixoUM8VQyhBUI4Dy9ekQUzQu1WbNU86pm4x3pR0xmziYPmiKeYRLHZ29mYcAvEa5W9IFvGZHn3hd82DhWvS0eAwV98FevsB2+m7wDcLWZ6vdRQBozHr16yLX6MCCBNU4Vx1HLcEp5n4OqypUvc4bpboVuHPHGzUOSUlvcG2lkCYj6iRkURBWaJBn9Pi/+daiY2Y09u
X-Microsoft-Antispam-PRVS: <DM2PR0301MB1184DA750D45526861BDD82586C20@DM2PR0301MB1184.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13018025)(8121501046)(13017025)(5005006)(13023025)(13015025)(13024025)(520078)(3002001)(10201501046);
	SRVR:DM2PR0301MB1184; BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0301MB1184; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1184;
	4:PgcwFnEbnhcpmCiCqp6LNaRUd/x1U55Ry6xpO2WAZ25jtZ3NxuT+bGh9oWp37lDkgFu57bLRg0+xHU71s9OK8/agXdxIVk3EQyBB7PakSRyDjDiIF2TbJBCYrV8PZQLsKZCLkfjyrChyEz9KZ87QJB+ZQFRYh1V4vI3NJNYrIX/dvwYW3TfFv4xaGqMVcYnT4zLNFW8+Oj4latQf5yUf3f2OkYy9cO6KxpM3kVzftACx8MbgHi25h8PVVNXzb1ri3FbkabQr4JN9YME9mflT1tkQCGhIYidAdBmoPXYLZQc/VZ6hvatP/C1W8IBt4vKlFmaJHyenQrBkCYver9CXtsYFL/UJkdGcb1ALws7UVDaYkShjdYQgbHzNJLKOVrXmOdkmyJikF9w5kYADirGwzCfrstL1ZwJCY3wBO60E+5C2zBDoi7hbtJg1boqxJh/a5uzz7dEiSX4o9I7H12Zum3sfiLXcXp/PxZzZsDQgFut/qz/yJK6wq6OPx9ydLeEPCdahE0MEpKs8hiLm0GOArA==
X-Forefront-PRVS: 0827D7ACB9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1184;
	23:9XA3cbSA4KetANdLdYyDdHbInWhCat4XPtYqkut?=
	=?us-ascii?Q?lxymIWKvMnVulijD0aAGeP8GPXzpDQSd26RZvB5jOmHhgkxbKN10/tQRtn9N?=
	=?us-ascii?Q?kYKvql37nexybYxIuP76mEbR3p2++mGh82irPeGYEHVGw2sMHbZNPP6WazTY?=
	=?us-ascii?Q?11CcLouts3Qbv8RJn7du/fQMeIQmLC0w2Gev6V7hN0/r8Adzy5SuDPzw3lgG?=
	=?us-ascii?Q?kpMvHu7+p9AriyHXl6a0a5QGhEPg/ayRBsmLRgSSF8rlgGJu/kGEybxI09Sy?=
	=?us-ascii?Q?4NZNzU1x/XolKdgp0WqEcY5rCCaU71T/RI9qRPqWReu1YELLhY+BjIXp3sd9?=
	=?us-ascii?Q?W6W2H8J2fSijWB6tyFOnkWoeIA8bZ0cw8zCnLFn1aRhlkqKmMlfx7CB4K7CH?=
	=?us-ascii?Q?Yo1qUcFdHF3+90sJHzRmSxUOTPFY2lkrKBcGHiIY720GhwiRFhXneXE8/TRO?=
	=?us-ascii?Q?fDKU1I7XUaFQCsnJs7B4GlxV1pqXm/pE++Hh2o/Tr+Xa14+1DrX5/ox9oNTy?=
	=?us-ascii?Q?4uOc72lp4oDlFXeLeehbVDkmRG+Saiek7XVBVGTjQYRANTmymfKHpnclB6hb?=
	=?us-ascii?Q?8LFSI+vVshcICggj7zoK7MBSZpj+c0fGRLZfSujStw1+FowToPidOw6HLd6t?=
	=?us-ascii?Q?CRNEQDcJ5pc+ieRX4IZm7zAptWmDcXIxSy5wBYrvxqpIjSCcoL4/wTEUQpUL?=
	=?us-ascii?Q?IUDzZxoCYwOSYfHsnKkzhJpVS55P9Y62P9T9kyN4LYpMgYLn5fnn77SeXFY3?=
	=?us-ascii?Q?ZQZ7GrO/jma2RUU4XGp94H7/lHwo2kpF4FFBm9dA+q1g3UqDQdUsKpmEbOvU?=
	=?us-ascii?Q?Gcrs6HsYddtBWdGMnImvoTyVNMAB1n1+8DxshmFoNJsxuEEJFghiRQtEepKO?=
	=?us-ascii?Q?l/D2XxGpE6fPgjFqGXh4AyGOQ86HsuJg70sdF0E7tJzsbg4ULGLhBVMOUsL4?=
	=?us-ascii?Q?xTu7iEB2uid8Z5Zu5C6Mn9cWbesuAyX2NARSeNBUgH3EtAzAKbwCMVUfEJPZ?=
	=?us-ascii?Q?RHJHghqVjivXTC4oxPdqb/2q5h730k9OkReU26HrNHIl0LLBdyhxveGYSIge?=
	=?us-ascii?Q?nFs8zXiDr+OngAM1cbnme8lEoFWZjw+/ty0uvg3raAEpTMQtKMIxQeGsvd1X?=
	=?us-ascii?Q?yXjOmM8oEfEO8HZkdzxgjEjX0T5wrpwYNoloboFLlhWOGaZqfmlLWZR07fVv?=
	=?us-ascii?Q?3Z65+EMB+BhrB7/c=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1184;
	5:eXdMuJC3KFDmG1hfk6VDIRXeB0X8XyRGgiwAIUcp0elVmDx+mAd+4fdpZw24MlYEPQfAN+NySjBskxUpWjs6cGUJoYkWsNKWv2lIpbfZO2gRTfFd5io/VadGMRaT4CzTRYm1WF7S77wu1C5n/3edhQ==;
	24:nG5y+VMuQd7Ir+RBht2bbFF6DeAv7yFCoKBXX7I7aPCJSAJfxjCvBbwjXiN7HeDNaUxVrlTSP1u0yYEEektK3cVqBPteYC0a1E8Nwi0FgVk=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2016 09:54:34.8544 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1184
Subject: [poky][PATCH v2 4/7] gstreamer1.0-plugins-bad: Need to set right pid if pid is 0 when create streams
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
X-List-Received-Date: Wed, 20 Jan 2016 09:54:39 -0000
Content-Type: text/plain

When camerabin use mpegtsmux as muxer to start video recording and then
stop video recording and then start video recording again, mpegtsmux will
get wrong pid.
Need to get pid when create streams.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...pegtsmux-Need-get-pid-when-create-streams.patch | 45 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb    |  4 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-mpegtsmux-Need-get-pid-when-create-streams.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-mpegtsmux-Need-get-pid-when-create-streams.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-mpegtsmux-Need-get-pid-when-create-streams.patch
new file mode 100755
index 0000000..21819a7
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-mpegtsmux-Need-get-pid-when-create-streams.patch
@@ -0,0 +1,45 @@
+From 3e0bc017ca9b4e093484ee6b3b73917918364e92 Mon Sep 17 00:00:00 2001
+From: Song Bing <b06498@freescale.com>
+Date: Wed, 22 Apr 2015 18:06:35 +0800
+Subject: [PATCH 02/10] mpegtsmux: Need get pid when create streams.
+
+when camerabin use mpegtsmux as muxer, start video recording and then
+stop video recording and then start video recording, mpegtsmux get wrong
+pid.
+
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=748288]
+
+---
+ gst/mpegtsmux/mpegtsmux.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/gst/mpegtsmux/mpegtsmux.c b/gst/mpegtsmux/mpegtsmux.c
+index c3a0dbb..5a6d9e1 100644
+--- a/gst/mpegtsmux/mpegtsmux.c
++++ b/gst/mpegtsmux/mpegtsmux.c
+@@ -761,6 +761,21 @@ mpegtsmux_create_streams (MpegTsMux * mux)
+       } else {
+         ts_data->prog_id = DEFAULT_PROG_ID;
+       }
++
++      if (!ts_data->pid) {
++        gint pid = -1;
++
++        name = GST_PAD_NAME (c_data->pad);
++        if (name != NULL && sscanf (name, "sink_%d", &pid) == 1) {
++          if (tsmux_find_stream (mux->tsmux, pid)) {
++            GST_WARNING_OBJECT (mux, "Duplicate PID");
++          }
++        } else {
++          pid = tsmux_get_new_pid (mux->tsmux);
++        }
++
++        ts_data->pid = pid;
++      }
+     }
+ 
+     ts_data->prog =
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
index 284e1f2..3f30f86 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
                     file://COPYING.LIB;md5=21682e4e8fea52413fd26c60acb907e5 \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50"
 
-SRC_URI += "file://0001-glimagesink-Downrank-to-marginal.patch"
+SRC_URI += "file://0001-glimagesink-Downrank-to-marginal.patch \
+            file://0002-mpegtsmux-Need-get-pid-when-create-streams.patch \
+"
 
 SRC_URI[md5sum] = "7c73bec1d389f0e184ebbbbb9e9f883d"
 SRC_URI[sha256sum] = "650855e39ff56a8bb6cb0c192109c5926ce12f536d06e19ebf829de71ef396fe"
-- 
1.9.1


