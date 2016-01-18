Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0140.outbound.protection.outlook.com [157.56.110.140])
	by mail.openembedded.org (Postfix) with ESMTP id 9FC7D6FFEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 09:51:09 +0000 (UTC)
Received: from BN3PR0301CA0025.namprd03.prod.outlook.com (10.160.180.163) by
	BY1PR0301MB1175.namprd03.prod.outlook.com (10.160.195.146) with
	Microsoft
	SMTP Server (TLS) id 15.1.365.19; Mon, 18 Jan 2016 09:35:46 +0000
Received: from BN1BFFO11FD010.protection.gbl (2a01:111:f400:7c10::1:134) by
	BN3PR0301CA0025.outlook.office365.com (2a01:111:e400:4000::35) with
	Microsoft SMTP Server (TLS) id 15.1.365.19 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:45 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD010.mail.protection.outlook.com (10.58.144.73) with
	Microsoft SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:44 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0I9ZROd015522; Mon, 18 Jan 2016 02:35:42 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jan 2016 17:32:57 +0800
Message-ID: <1453109582-25485-9-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453109582-25485-1-git-send-email-b54851@freescale.com>
References: <1453109582-25485-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD010;
	1:caGhLQcrRpmd2bunHTboSZ1H8NjxzWksS8v/4uJSkuZcngGO+3NjM+sF4sWTquQK3LiILn2zUBbbTMj3qbJhIQw/SMonNNXYzPGZ0oAibpPWs9EaJTA3KkP7FVjRKvB2aHqRG0AjMHBltDOCBq43Wouq6qI1T9/VRV7LIOtl3nxaJhHZI7bu2ZITmOk/F2i5vYHFE1gkTV1Rh8TaPBMFQ9zqeVKysQ8zJuMvAQDZvjQhdfJAiDZRVMaRMtVbPFEFpCDUgHYzomUWHvBDxnvpLK7DWgJDl2IQqU/SLVpLx91jaKZZLMeVBI73HiArzcdkuRlV/cW6tzr7xmyAh75eMWxvkN8NoQRmO52ojwmncg4m7CNx8NfcjjKV2rQZ4JS75NLx0OMfIkrvCRW0ueVZVlJmWAlNn0/XQpODkSiwYFc=
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(199003)(189002)(50226001)(1220700001)(97736004)(50466002)(48376002)(1096002)(230783001)(50986999)(81156007)(76176999)(19580395003)(104016004)(6806005)(36756003)(575784001)(19580405001)(86362001)(189998001)(586003)(87936001)(2950100001)(5001960100002)(107886002)(15975445007)(450100001)(106466001)(85326001)(92566002)(47776003)(229853001)(4001430100002)(5008740100001)(5003940100001)(4326007)(2351001)(77096005)(33646002)(110136002)(2906002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1175;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: c74b6475-9be4-49ee-dd37-08d31feabda5
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1175;
	2:ukcihEfhXy7TCP/C5ursKGbMFOfmcOz6fjWml/uwFR4fG53RDnjgyyMS+Jo70sx1FaFtR0xG+6k4ux41ksgWEfp+w/wn4wPGGdp1Qszol1N8KqfuwlUh6g30N/4vhimsP/ZgG2Qn4DzOzDrpGtNrn5f3qodLXIt61p2lZJSs9hIKV4bRgjlgcs5Cc1opiXQa;
	3:AAT/GGfhHzMzHlwBXhxPtjhSJgN+C1Tg5d6ee0B2s2/pIB4ab3lTevkTqoNsCwyOSiOa0NLAxGfYzXEpUHMLMcwFD2lYsDR/I4yF1+Zsjsoo6za9E8tpphO95bEFe/5XrrF2/fDmOMUgBMkULGQuv70B7gL5vXDUkzU8prdzjTCmm/AEh2MssUQgJtW+YrZh3PC/Tgs7Jjb4ALHvqKSJ5NoBscjtyQSbteiST59L4bY=;
	25:UmpdJEVZwiqbfitCPcvaAdlC7Y5GdKnTcVQORGnKKziO/plAAFwXonX3XQ/0o+SWCLMTZbmclHVUZcUXH/20mG/IE14ZGx1cSFkmvpvjZfXUElwXy0KueOC9fNCbL4RprErs5mgaeLnW9fx8BL/3SGomABgKdaQYb4OWvFbGjxQ8ond3DS8EuWu5OLhVOytuxYrxmAAoHRy4ZXyxJSeWBS4XnfulFxtpqe43PdgWlOx2u812B+37bpEDqckQQM+e
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR0301MB1175; UriScan:(101931422205132); 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1175;
	20:pJn3IxGEe7J2FT05X+GXfkb5TgIFEBdjuOEF2D970HDAIZZlNNEXERHRfjdWaVGHSsjH3IMvA79Kohy2rlLXYupDKTxKaNLXhgcT2tanVycsuI2AtCLPjwmNXdH/unfULpDbs+bTzoyJxH2bOeOfxovXmhRUETXUcNcPbziU8JX0JXCquX+Hhu/rHmOUSKCHjFrslaUPaWQX10zE1WW9FNueW5zSBTBPjhdEgHOIys5AbXG1DybTMCIyA6coU8lNn5phaD7lqyCVuyqO7x09+FCpMh4JNFjPdseG0qFQR+tElbX0xqmgGoJWf6TuYWXv4h4O2ZcwCmUBvzmOE6tqMkNi+pLX/etC2CmPgh2ckR22NzF21hgT9zp/75hpTvcS3y2I3nQ7u0XHUtftLtNFLeuqJNRGMnQ8mbW5pOzxUdzNU0/dGEH7dGyKDkiSH+D8;
	4:Bt0VKKCsHOyO8OZxJKyRL3nlD6yi8lt8PPjmKQPNjKGG9wIE0ak5nKBcl94PpSBBbox4JH5AeuRxwJtbzFI315v5Jw2LMDlGi9GytYzwX242V+RMV28q6IqeCpPUGHhBXOInZd0MefmdqrXctyuQhMv3lEFgwHsSlnzNGi1IVfQEm1ZNQF7hQNJDAS3LFlcioSmhSXBIKrgGwjf6TWUYwZLKvC2sEh8hsRvKdWsy5DQ+lORNWUs02oPbVXjG7ZkdOq0L4YC3IjaC0UBpQjh8YxAbL1EefCqY/T/hsvHYFjQB3r1gndXgDwVE3YzUb0d3E4QF7WJd8gYDlosMj4fLQlyJytmae6g2OKrkE/Npdc4v1SSBDkAL2YJ72KYkuYQpRRcdGD7C5ErqzuQGXpRsyxraGNWoMbn5xcDITKg6188w08tvcyd6JABzPqRyPdn9YL0bywDxsi6ulKv08qFEmfBqmi5HVbpm5Zsv05DcvyDtWtZl8IkUHChe8wYCBONL
X-Microsoft-Antispam-PRVS: <BY1PR0301MB117545219978A22C1848CCB086C00@BY1PR0301MB1175.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(13018025)(13023023)(8121501046)(13015025)(520078)(13017025)(10201501046)(3002001);
	SRVR:BY1PR0301MB1175; BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR0301MB1175; 
X-Forefront-PRVS: 08252193F3
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB1175;
	23:e++DyWrTwIU+m44bQ176Vz6WYXCOz8KoxFc6wk8?=
	=?us-ascii?Q?lnEKWi0LhtDV9z5PIfi0zUQCDHE4AMw2OC0dRWp45L3qGwuHhESuBH5DZLx7?=
	=?us-ascii?Q?FS42TAfYt6q+ctkGVVLUgjHXJADl+7mjLBQ7Irj29QU325oDNNEl8Fx3DzkM?=
	=?us-ascii?Q?/74seECVfuTqY5D8sPg8i+F1uuxBijWpvDptUWk2eEAi26v4LwSTttdzvtJf?=
	=?us-ascii?Q?axiN6DR4tUdLkVs66HmY5cxVUN9WHXr19hmCPGDH2o38Wb+Jalp+P6qJJxNM?=
	=?us-ascii?Q?b6QNKNiaU+lXxJyAsfishcj0cJYjKVcHaAkhNA26ac4UPTmFLXVqlPK3WZCI?=
	=?us-ascii?Q?8QNr2TujrTp8CxAG0/eFptgnQWc4hxfgYFC55h8pJ/R3mv+Cfso1+TIqtop/?=
	=?us-ascii?Q?ixqvsCOaEW0O1b86D64KSDosrmlk/vkrTSQu9qn2VS475Wgpfy6QFqn0aYbD?=
	=?us-ascii?Q?wBVz9umvtHnLnSP3CCmZOv+hebqOIBe4YpAGVrSmdqHUboG4ft3IoeXomHt8?=
	=?us-ascii?Q?Sy/x1Uu4jVXAWSr5sCrGgUTLImBRYlGnLVgpVFARa7ykBITUSO/7vji5/7/c?=
	=?us-ascii?Q?TL1HXHQJy7y3skpfIUvKT10A8i0Gx/om2oLMuwBKFZbtbPiXNUuMCOKVrooh?=
	=?us-ascii?Q?v67Kj7rkAOlUpGNPCf51FgmCpRqmL6/yCAQtpcbjxLlwSPFrIGqk6ERvCdi+?=
	=?us-ascii?Q?VxctGKBaM5yUypGv2biPzhqFBJzKaZO0HUXtexc7nqRR3aQlcIDHaKlGjl1i?=
	=?us-ascii?Q?xqlTbl+3MxhV+JZc0l4aYAxbtwfIRBHOUa0hL8hNaiA7jf/mWDPRwVJOoOB1?=
	=?us-ascii?Q?p2OvHoUsaPu3pSMZRp7TaZEm+RG/T2kIl3EYO/zHwZgg/Y+YG85nOkllrFZ0?=
	=?us-ascii?Q?sU+2iaboptn/lLcLKOIGz8fI4e5nIP68yfzCi/bV1YK8Mws1aTxfdzLCKyzX?=
	=?us-ascii?Q?e7uEw3FFzqeQ3jzRI1HbWWFc48pCaoN2n+nJFTYP6HVoMUYYqQByHYJTZ8A3?=
	=?us-ascii?Q?+4r/0tv6sruj6340pcOg+ZkNuSMrNFhj1cCO/l/33yR8B8vFrYlCMsP+8XSp?=
	=?us-ascii?Q?kJZyXlMECji1UG7wTtsPhbl+XTd9eW31nvurVv0JrtukjZIVrQxeKNhb97mb?=
	=?us-ascii?Q?Mj3kFKchlXQ2sbv2qyG7VgWoJwEw0UTHfjqo5u1fMPkuIcb5rX1g+UQ=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1175;
	5:IJdMLGZpeIUW7DEQy1OzNd7t/p7E41v1w5NvXMMEF4SnYzu7l4nEzwAJdIL3XO2RC4GX+t+8v5MOpm928F4XlNrypQU2UrKYPfcwPLlnLjGBUdpxylVkjCrPeJbmx67nUrVNQTbvWeyA6mgSlqowjQ==;
	24:JEmT/RPnidgVmWYfEPYm/tEAmz3mSOyGXq5C9g43cpSrNEaxQd1iPs5vuomHc8GMQ3pw9382dlRwjvESXI+C1hTZ01XWOvkJPny1YXvs7UM=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2016 09:35:44.4584 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1175
Subject: [poky][PATCH 08/13] gstreamer1.0-plugins-bad: Add check coding type when drain in mpeg4videoparse
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
X-List-Received-Date: Mon, 18 Jan 2016 09:51:10 -0000
Content-Type: text/plain

Our use case is demuxer only output key frame when backward playback.
Every frame is DISCONT and KEY frame. mpeg4videoparse will detect coding
type when detect start code after VOP. our use case will drain after VOP
and can't detect start code after VOP. Add check coding type code when
drain.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...arse-Need-detect-picture-coding-type-when.patch | 47 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb    |  1 +
 2 files changed, 48 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-mpeg4videoparse-Need-detect-picture-coding-type-when.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-mpeg4videoparse-Need-detect-picture-coding-type-when.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-mpeg4videoparse-Need-detect-picture-coding-type-when.patch
new file mode 100755
index 0000000..3f09d4d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-mpeg4videoparse-Need-detect-picture-coding-type-when.patch
@@ -0,0 +1,47 @@
+From f712092e768347b59719f5016714c91d4d82483b Mon Sep 17 00:00:00 2001
+From: Song Bing <b06498@freescale.com>
+Date: Wed, 20 May 2015 15:13:20 +0800
+Subject: [PATCH 03/10] mpeg4videoparse: Need detect picture coding type when
+ drain
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+our use case is demuxer only output key frame when backward playback.
+every frame is DISCONT and KEY frame. mpeg4videoparse will detect coding
+type when detect start code after VOP. our use case will drain after VOP
+and can't detect start code after VOP. Add check coding type code when
+drain.
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=749617]
+
+---
+ gst/videoparsers/gstmpeg4videoparse.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/gst/videoparsers/gstmpeg4videoparse.c b/gst/videoparsers/gstmpeg4videoparse.c
+index 53db2d5..dbbd6d2 100644
+--- a/gst/videoparsers/gstmpeg4videoparse.c
++++ b/gst/videoparsers/gstmpeg4videoparse.c
+@@ -502,6 +502,18 @@ next:
+     case (GST_MPEG4_PARSER_ERROR):
+       /* if draining, take all */
+       if (GST_BASE_PARSE_DRAINING (parse)) {
++        /* need decide intra_frame */
++        if (mp4vparse->vop_offset >= 0) {
++          if (G_LIKELY (size > mp4vparse->vop_offset + 1)) {
++            mp4vparse->intra_frame =
++              ((data[mp4vparse->vop_offset + 1] >> 6 & 0x3) == 0);
++          } else {
++            GST_WARNING_OBJECT (mp4vparse, "no data following VOP startcode");
++            mp4vparse->intra_frame = FALSE;
++          }
++          GST_LOG_OBJECT (mp4vparse, "is intra %d %d",
++              mp4vparse->intra_frame, mp4vparse->vop_offset);
++        }
+         framesize = size;
+         ret = TRUE;
+       } else {
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
index 3f30f86..507d048 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
 
 SRC_URI += "file://0001-glimagesink-Downrank-to-marginal.patch \
             file://0002-mpegtsmux-Need-get-pid-when-create-streams.patch \
+            file://0003-mpeg4videoparse-Need-detect-picture-coding-type-when.patch \
 "
 
 SRC_URI[md5sum] = "7c73bec1d389f0e184ebbbbb9e9f883d"
-- 
1.9.1


