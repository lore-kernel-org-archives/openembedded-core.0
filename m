Return-Path: <carol.zhu@nxp.com>
X-Greylist: delayed 1996 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 11 Oct 2016 11:21:46 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0072.outbound.protection.outlook.com [104.47.36.72])
	by mail.openembedded.org (Postfix) with ESMTP id BC3506011F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 11:21:46 +0000 (UTC)
Received: from DM5PR03CA0004.namprd03.prod.outlook.com (10.175.104.14) by
	BLUPR03MB327.namprd03.prod.outlook.com (10.141.48.18) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.557.21; Tue, 11 Oct 2016 10:49:21 +0000
Received: from BN1AFFO11FD012.protection.gbl (2a01:111:f400:7c10::146) by
	DM5PR03CA0004.outlook.office365.com (2603:10b6:3:118::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.649.16 via Frontend Transport; Tue, 11 Oct 2016 10:49:21 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD012.mail.protection.outlook.com (10.58.52.72) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.629.5
	via Frontend Transport; Tue, 11 Oct 2016 10:49:20 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u9BAnEtf015976; Tue, 11 Oct 2016 03:49:19 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Oct 2016 18:49:10 +0800
Message-ID: <1476182952-15222-3-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1476182952-15222-1-git-send-email-carol.zhu@nxp.com>
References: <1476182952-15222-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131206565610304712;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(81156014)(15975445007)(586003)(356003)(19580405001)(19580395003)(7846002)(305945005)(2950100002)(48376002)(50466002)(11100500001)(50226002)(8936002)(87936001)(85426001)(8666005)(6916009)(77096005)(189998001)(36756003)(8676002)(6666003)(110136003)(81166006)(33646002)(76176999)(4326007)(86362001)(575784001)(50986999)(106466001)(47776003)(105606002)(68736007)(5660300001)(92566002)(104016004)(5003940100001)(230783001)(2351001)(229853001)(97736004)(2906002)(626004)(7059030)(19627235001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR03MB327;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD012;
	1:VPlHHaSE2aeSPG25Xs6IvviMrL4tdW7uWaDy8IzjwJV3MW4G1IBJEQU4X6c4Cxg1s6oLfN+G4tQ3FQ4KTZMo5NyZdGSGSl5Mzv54PG0Z1FRr4l3L4oeUtyVdwuKUZ/Y2L1Y0LdJyo6r/9O7FQz89/IsSort4n/kXgYOfLaTe1iYVekpwSvCTaik+RKYXnxnR3kPLtkdCvMv0A0nUxjXyjdaCcqFtaYxMPeOT2eiY32D5FrZMM7JJdu3UXsAfewOv0uVTMwnVTajg2jDsgWMSvPAsR4DZndiJuLutPxtQ4LhwPBrA4PmQ9XcisfjoFJAGFtdHVk6R5M/bUqp3K8CUiBJZU6VIRbeZCNW0etPFomJWz1OD8+oi9ag6S7ABE7hmcObl94qF4ibNz0vJrFieAgIyl+879jX2sDwcssTD/GjaztbN7v/kT0zEC5Vv4bnDz524Kdab+XMD1lxVcyKAIfcg8wMkWx9jorvphsYILsVdeQ3dLyIQ5pLRfrCJzibnGsgCXfPVMnQ6/Wkju6yzgY2Kq3HXdL+8PUMnqrrStK02tGsev9BF7Ox3uxNCI9F0aD8zkHkE3ellNZD3m7ZHzipKBVGrgeLxid9CNig4qdvc8QnxNCICjKODIUd4xXrM6gnB/XXp8s1oaK2Gy0idaZaokcGjDQ1qRAOqaaUZ1ZUTZNfLQGflPO7L4LKkAusqpYJoztT8NvavT9/bMT0sIBsb6U5qylIsYTmmER2WS5M=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 1db5159f-3689-47fc-5368-08d3f1c441db
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB327;
	2:iXSr0i2Dby25zBW6r48kBbS8DTx17TMajMM0/XB/3cjHwRmi2INo+MWUA673Gwi6E+LMb6cw9w34bON1BM8mv4woMAhPZO9RXbnfhTyTnLBz3NelZDe10EHEwxbbk2SQPOJr9ArRKQ5tsHQat7qCZxJNA0Jg864Hsb4+orW95qCCpltxfsDJEqfexH92JZeu;
	3:30aVlREQpclAThPgCG8mEs013xC8dd3G4NZxexB8kzgt+OZ1Q7R8cR+QDyJuOnQaHtr9BxW2AmvQ/74BiwQs1/C5s2COOzPp6ykNb21T2mN2QDJPDScWlFyx3P5e3iJlCC+bKieuPVBElQMl57rnV3zwO6ek2HLOS9OtNfFxHv0M6qaVsZ+xg8JJNLqa0wbd7b8hdHDa4JaV57mBzjwsmWZHLkwe/WsK73ENw0hC3oM=;
	25:Hqf77bzQ4xY4+LVt6SVl05p6fu/MikQYOPnkowH+x8wK+KenA4FbEVlGdXlJNOcLNIj7QaoL2AwphNRQJPGHZ4AKmS71vcSf3PzkNn5TwxmASIiohbxmgbbQS41RiCUuh9RmfulT3nYTh8DuaO/xi0W2iKTl0qw9tNJZQSs1LcihRoyO91NnSooKRmNbcIEchhMK4LAPTZkQyjMwiIvgovJk3n5XfNg6kUYxaxTw69g0i4fql37WKQsMNTKbebzS05BXu5PLE6b/ec067UhCt3mnA4vRPTNq38Y32j27D1yoiz/tqO9zZSvnnnUdNjcU83ZDpnJDy6e2W0qxAC6HW929ZmW0cqMa+2Ot7wfka0v0wQLX3G7MjIhArWA5dtkpO1l6PXeJQbC8MFPum+sxYoaJaGY7JWlDbOntvctKbvuXvgI9peicLYWr7EpQcwQl
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR03MB327;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB327;
	31:hPG7oLUMjjFGcx/LC0tupFN985v7CzRKpxT+aG1TtLJ4/MT6WCusMwtw+TaK/1ampwzebkS3rZarRIy1lkkyn3vvhuuMiIQLnSDUA1erx3CoR+cllGDOqatYkeLs3iPcRH8mGKTU2wWSjHG0yOvEeGR0K/uDQbwpuWZOBmxj9P7+uqU3yiyIS/weddqlKbtZCFjZYI4kaFbTg3sYgKsnFeiFdy6Fp2ui4WXxs0fVB27PG0r81mY1u3Pyvy6enzEK+rZ1NgDFsr/JzBf8u+uAEQ==;
	4:R7fNkfChVd0KmtF27lkRL07cj24j/Q2lEjrN22dywugyGU1qBJxK2SXxWATI7NUnaSn0LRx/vb+oB76GHqbSgbu07sv2tuLbjVfsKuRBsGKLl7+Egrswbcq38EZUaX+wDIBF34z/Q+5oNOymdpR5/WNKGwx4sJ4VOwReOUjLkS9PAbUMQVAcCtUduqromHHoHIW2/L3YOxuQKEwozu07lVEWWAOWcTl4L1GiY5A68LXWmPyTZ0uqS9o/EQRkq9Q/GAvuKCjYmvIKZZJ/NfhkqTebfCcNV7MV5B4nvNfPdkTqaWm+MT670djb2ZeCCFhPtzfzp/ZDlWcnI3HBkP8YA6tw25n7WX/Ht7/5Lq6Ge6hGpYEQcXMBQ01yfNRukJ0oEyDLneMAXcc2cTFpi/t7+OxnFpMubeIm03Ct6cHVDAZHc7ESEt4WPlO50bSPynbRt1KCdZKqCvDa7UOqvrvwRsTILLfh/TQqC4PEWNcygbBokCL+veeARbzWRzUP5nGzWEerU8hC7LhRBlvKa6xb7zBCwWncpCZjep+lTkkpTjc=
X-Microsoft-Antispam-PRVS: <BLUPR03MB327FFA9F0A62F637D7B7ACFE9DA0@BLUPR03MB327.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13015025)(13023025)(13024025)(5005006)(13018025)(13017025)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:BLUPR03MB327; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BLUPR03MB327; 
X-Forefront-PRVS: 00922518D8
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR03MB327;
	23:z6I7pHCTR1fqnAePhOgwInKcC/708DEf/9oNlsugG/?=
	=?us-ascii?Q?2tf/S9MXzHcABPaI40dqg9LXcSjFiAGMKgu1GNXgd52jQrPW1eQRzJNi8Xrs?=
	=?us-ascii?Q?B8pNzjJPiHhyMvjNwQx9ysV5t//SF7XJq/yePqD4c1hhMQB7VUNBkjKv38Tx?=
	=?us-ascii?Q?DUTcDf47zucSouCYfuule060U/3DvLfRo0Z81RSdzZM3IzahJi4SVcYk+R06?=
	=?us-ascii?Q?p00F8PIqk4uoNByTKPvn3fZHbh5HXgKXmxhTEU1m62GTiBzuGykCZL73y618?=
	=?us-ascii?Q?vL9HjLA9xCWkU+2qxabMGrdm/hwAz0ejukVfMq6yzGjGcCi248KM7nyXp7Mr?=
	=?us-ascii?Q?yKOg/Cd7r/dPUnVbg52OOoaoeRwn/tSpBKntaJ73rGU9OQ4Nc+1FwWib3rtO?=
	=?us-ascii?Q?aJOzpVC9eaK8LUWtV4qkOsGzMVnueeB7ElbflDjcAAWe6g80ftjaqZwBHNUJ?=
	=?us-ascii?Q?6xlg5Vy5cyxudfn4zlf0Pm5ZKkC5yIzfl5+MSoUbIB9zGX/ZxUScwZgdFnqw?=
	=?us-ascii?Q?tDKBKZeQpcnCH3ljnbfPtB9ChtxuersRHepCBIpbZEzCIeMRcrrlyjAKEUj1?=
	=?us-ascii?Q?mDNJBEIkbYNwNSyzHM/8bodLPYY4VBRA/rLAu+ZP4R2WECPaHk2jfL+RXiDB?=
	=?us-ascii?Q?6AXdyK5INGBaMivAR9LshYfmm+12YTlIsw4MYSyVcUevNrfR2ehO3ZERTPbP?=
	=?us-ascii?Q?KovlV1r41+FxFircucNCy2+vCZl7i5/4dZ7yYoC8iwDMbgTX6c80JHdnL0M7?=
	=?us-ascii?Q?SbIKcSvFl0EVFSF7+J9VgIUM2ARNxpWGSFCbifTzgzHdevQIbA8myKZEazNO?=
	=?us-ascii?Q?DE/nXvLcGzSxk1J4swykIJ1CMoFEhazK0uRUIee009AjJHKUZr+f16S6ODR8?=
	=?us-ascii?Q?MYm3OGdHmhM9cjyGqvvpx2tkeQkwl/Bf50AVo9o/U/Yw7EI1fxnrmW81cmYr?=
	=?us-ascii?Q?oL9vvahBpdQB3CJqeQSy+HWBGImt6kfQwp/1/fmhm4rbpHMDnvFb7yFY/d/r?=
	=?us-ascii?Q?w5Bf48XHFfQ4MkAfjhhsWSWXMsGugrU365dV7eaitRcNVyetsEoorOzSUc9t?=
	=?us-ascii?Q?V8STF9hKOYsjbUzwP6CsbinJCCd0+8bWxOk/oEejctScmpcS4LEdAeiY6Ard?=
	=?us-ascii?Q?IW2AVtbb0cX0gXcSZn/SvpRxrlSlyTlTUFJxqcFd/Ez0t/VVExhGQZZCsrJJ?=
	=?us-ascii?Q?IsIfW69spF0GP5nNCPe9hK8A4v6B5GFbuOjcPpNjx4McMQeOWW2IvcOECUZO?=
	=?us-ascii?Q?/+XWfFYSxatr8hg2h8cJ2rwsDmt/OrVt5R/wgzsifV8rUAmRfGEyPP2cKs6H?=
	=?us-ascii?Q?1oBmkC87ZsJXVcUB0mwZo=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB327;
	6:nwsjWptJ+3S/u8477ODdAPkgvCE+gJPU10dA8545GY4bhGU3m+E2u8ZKdUMeNdNVJFmFCLHw+18OfZvl/20azVeBbKr5+X1zyi5Z76uWTD6KgvoxDIWxHxNFrPj1qRvjQJ/JFhxvY+JhO14eSTl1mXIPgPoAfFQlI1SPwCahDSv/C/DpnPfuunpnq7kXwhLkhpVnlJoNE6aLLqx3ctxeRJeMfqeCY8dzxDmdzWhwL8awPswM+6Xc/QucpwZ4mHLNWTzjPrdl2Q6NsxkZfTPZk/ksOEaUFe1ZJyRtvdT7yac=;
	5:JasQtuOH1h2PCVJtXWhs+fexaE+BwkYfVRqdEDKhUNZcQFUsIqupYmjHy4qXK8ian3P1VyBIuhGDItvOafGWVZpM/WYX1vtn/ARnvAXIUhEmPRUmUj27G6Ar4XMi/sXw8tilA6ettcVLf+z97ATbkDpCV5GbMIMPmnZHdsV4P/U=;
	24:UrJz4KnfdoOu/PiSkW4VtuqJzZQC9vJrWHtV/ctmrYB3hsJG7A0NSepT1O++6Dofl56aR6kpwDsp80SO5Iv13Gj+Nep8U10LYBg1DEPw3uE=;
	7:T02UfH7iylYGbm7ILcZieNvMrz1FM8eE6hysohcOgFKvPAd5PPB1BHPXideDklMR51+2jVjdo487k/8Goc78jvt8L6G/aIF+FtNyviJNQMlKwmw/Gw2S0eb4Wh4VyJ8wu6naoeO0TFiljLJ3QPl2vayxRaUdDEiuYBcKFzUTjs70gA6taAWtTSyL+v0cn3cq6UJce7KBdzwm+l43oBHuA+etwiAwlLzSoXuWIjjryVN7Br+zl9BuzTaKTijhd8wRg/dlI7qRQ4/BTy4hRHzNH/5sjSufgrDmmEpqsD0/OL6M9GZjYKxlSxKB/urRm9W1FAl2ShIgUW4h8/1fH3VzHQ==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2016 10:49:20.8276 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB327
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH 2/4] gstreamer1.0-plugins-bad: Fix wrong attribute list type for EGL 1.5
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
X-List-Received-Date: Tue, 11 Oct 2016 11:21:47 -0000
Content-Type: text/plain

For EGL 1.5 spec, the attribute list type should be EGLAttrib.

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...Buf-Wrong-attribute-list-type-for-EGL-1.5.patch | 194 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb    |   1 +
 2 files changed, 195 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0011-EGL_DMA_Buf-Wrong-attribute-list-type-for-EGL-1.5.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0011-EGL_DMA_Buf-Wrong-attribute-list-type-for-EGL-1.5.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0011-EGL_DMA_Buf-Wrong-attribute-list-type-for-EGL-1.5.patch
new file mode 100755
index 0000000..8e97cc0
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0011-EGL_DMA_Buf-Wrong-attribute-list-type-for-EGL-1.5.patch
@@ -0,0 +1,194 @@
+From b390dc7aee52f87a0841740092bca19d6e48881f Mon Sep 17 00:00:00 2001
+From: Song Bing <bing.song@nxp.com>
+Date: Wed, 13 Jul 2016 17:15:44 +0800
+Subject: [PATCH] EGL_DMA_Buf: Wrong attribute list type for EGL 1.5
+
+For EGL 1.5 spec, the attribute list type should be EGLAttrib.
+
+Upstream-Status: Backport [1.9.2]
+https://bugzilla.gnome.org/show_bug.cgi?id=768602
+---
+ gst-libs/gst/gl/egl/gsteglimagememory.c |   78 ++++++++++++++++++++-----------
+ gst-libs/gst/gl/egl/gstglcontext_egl.c  |   20 ++++----
+ gst-libs/gst/gl/egl/gstglcontext_egl.h  |    3 ++
+ 3 files changed, 66 insertions(+), 35 deletions(-)
+
+diff --git a/gst-libs/gst/gl/egl/gsteglimagememory.c b/gst-libs/gst/gl/egl/gsteglimagememory.c
+index 46098b5..6c5ae47 100644
+--- a/gst-libs/gst/gl/egl/gsteglimagememory.c
++++ b/gst-libs/gst/gl/egl/gsteglimagememory.c
+@@ -432,6 +432,9 @@ gst_egl_image_memory_from_dmabuf (GstGLContext * context,
+   gint fourcc;
+   gint atti = 0;
+   EGLint attribs[13];
++#ifdef EGL_VERSION_1_5
++  EGLAttrib attribs_1_5[13];
++#endif
+   EGLImageKHR img = EGL_NO_IMAGE_KHR;
+ 
+   allocator = gst_egl_image_allocator_obtain ();
+@@ -442,32 +445,55 @@ gst_egl_image_memory_from_dmabuf (GstGLContext * context,
+       GST_VIDEO_INFO_COMP_WIDTH (in_info, plane),
+       GST_VIDEO_INFO_COMP_HEIGHT (in_info, plane));
+ 
+-  attribs[atti++] = EGL_WIDTH;
+-  attribs[atti++] = GST_VIDEO_INFO_COMP_WIDTH (in_info, plane);
+-  attribs[atti++] = EGL_HEIGHT;
+-  attribs[atti++] = GST_VIDEO_INFO_COMP_HEIGHT (in_info, plane);
+-
+-  attribs[atti++] = EGL_LINUX_DRM_FOURCC_EXT;
+-  attribs[atti++] = fourcc;
+-
+-  attribs[atti++] = EGL_DMA_BUF_PLANE0_FD_EXT;
+-  attribs[atti++] = dmabuf;
+-
+-  attribs[atti++] = EGL_DMA_BUF_PLANE0_OFFSET_EXT;
+-  attribs[atti++] = offset;
+-  attribs[atti++] = EGL_DMA_BUF_PLANE0_PITCH_EXT;
+-  attribs[atti++] = GST_VIDEO_INFO_PLANE_STRIDE (in_info, plane);
+-
+-  attribs[atti] = EGL_NONE;
+-
+-  for (int i = 0; i < atti; i++)
+-    GST_LOG ("attr %i: %08X", i, attribs[i]);
+-
+-  g_assert (atti == 12);
+-
+-  img = ctx_egl->eglCreateImage (ctx_egl->egl_display, EGL_NO_CONTEXT,
+-      EGL_LINUX_DMA_BUF_EXT, NULL, attribs);
+-
++#ifdef EGL_VERSION_1_5
++  if (GST_GL_CHECK_GL_VERSION (ctx_egl->egl_major, ctx_egl->egl_minor, 1, 5)) {
++    attribs_1_5[atti++] = EGL_WIDTH;
++    attribs_1_5[atti++] = GST_VIDEO_INFO_COMP_WIDTH (in_info, plane);
++    attribs_1_5[atti++] = EGL_HEIGHT;
++    attribs_1_5[atti++] = GST_VIDEO_INFO_COMP_HEIGHT (in_info, plane);
++    attribs_1_5[atti++] = EGL_LINUX_DRM_FOURCC_EXT;
++    attribs_1_5[atti++] = fourcc;
++    attribs_1_5[atti++] = EGL_DMA_BUF_PLANE0_FD_EXT;
++    attribs_1_5[atti++] = dmabuf;
++    attribs_1_5[atti++] = EGL_DMA_BUF_PLANE0_OFFSET_EXT;
++    attribs_1_5[atti++] = offset;
++    attribs_1_5[atti++] = EGL_DMA_BUF_PLANE0_PITCH_EXT;
++    attribs_1_5[atti++] = GST_VIDEO_INFO_PLANE_STRIDE (in_info, plane);
++    attribs_1_5[atti] = EGL_NONE;
++
++    for (int i = 0; i < atti; i++)
++      GST_LOG ("attr %i: %" G_GINTPTR_FORMAT, i, attribs_1_5[i]);
++
++    g_assert (atti == 12);
++
++    img = ctx_egl->eglCreateImage (ctx_egl->egl_display, EGL_NO_CONTEXT,
++        EGL_LINUX_DMA_BUF_EXT, NULL, attribs_1_5);
++
++  } else
++#endif
++  {
++    attribs[atti++] = EGL_WIDTH;
++    attribs[atti++] = GST_VIDEO_INFO_COMP_WIDTH (in_info, plane);
++    attribs[atti++] = EGL_HEIGHT;
++    attribs[atti++] = GST_VIDEO_INFO_COMP_HEIGHT (in_info, plane);
++    attribs[atti++] = EGL_LINUX_DRM_FOURCC_EXT;
++    attribs[atti++] = fourcc;
++    attribs[atti++] = EGL_DMA_BUF_PLANE0_FD_EXT;
++    attribs[atti++] = dmabuf;
++    attribs[atti++] = EGL_DMA_BUF_PLANE0_OFFSET_EXT;
++    attribs[atti++] = offset;
++    attribs[atti++] = EGL_DMA_BUF_PLANE0_PITCH_EXT;
++    attribs[atti++] = GST_VIDEO_INFO_PLANE_STRIDE (in_info, plane);
++    attribs[atti] = EGL_NONE;
++
++    for (int i = 0; i < atti; i++)
++      GST_LOG ("attr %i: %08X", i, attribs[i]);
++
++    g_assert (atti == 12);
++
++    img = ctx_egl->eglCreateImage (ctx_egl->egl_display, EGL_NO_CONTEXT,
++        EGL_LINUX_DMA_BUF_EXT, NULL, attribs);
++  }
+   if (!img) {
+     GST_WARNING_OBJECT (allocator, "eglCreateImage failed: %s",
+         gst_gl_context_egl_get_error_string (eglGetError ()));
+diff --git a/gst-libs/gst/gl/egl/gstglcontext_egl.c b/gst-libs/gst/gl/egl/gstglcontext_egl.c
+index ceafdf3..df6ba3f 100644
+--- a/gst-libs/gst/gl/egl/gstglcontext_egl.c
++++ b/gst-libs/gst/gl/egl/gstglcontext_egl.c
+@@ -309,8 +309,8 @@ gst_gl_context_egl_create_context (GstGLContext * context,
+   GstGLContextEGL *egl;
+   GstGLWindow *window = NULL;
+   EGLNativeWindowType window_handle = (EGLNativeWindowType) 0;
+-  EGLint majorVersion;
+-  EGLint minorVersion;
++  EGLint egl_major;
++  EGLint egl_minor;
+   gboolean need_surface = TRUE;
+   guintptr external_gl_context = 0;
+   GstGLDisplay *display;
+@@ -363,8 +363,8 @@ gst_gl_context_egl_create_context (GstGLContext * context,
+   }
+   gst_object_unref (display);
+ 
+-  if (eglInitialize (egl->egl_display, &majorVersion, &minorVersion)) {
+-    GST_INFO ("egl initialized, version: %d.%d", majorVersion, minorVersion);
++  if (eglInitialize (egl->egl_display, &egl_major, &egl_minor)) {
++    GST_INFO ("egl initialized, version: %d.%d", egl_major, egl_minor);
+   } else {
+     g_set_error (error, GST_GL_CONTEXT_ERROR,
+         GST_GL_CONTEXT_ERROR_RESOURCE_UNAVAILABLE,
+@@ -380,16 +380,16 @@ gst_gl_context_egl_create_context (GstGLContext * context,
+     gint i;
+ 
+     /* egl + opengl only available with EGL 1.4+ */
+-    if (majorVersion == 1 && minorVersion <= 3) {
++    if (egl_major == 1 && egl_minor <= 3) {
+       if ((gl_api & ~GST_GL_API_OPENGL) == GST_GL_API_NONE) {
+         g_set_error (error, GST_GL_CONTEXT_ERROR, GST_GL_CONTEXT_ERROR_OLD_LIBS,
+             "EGL version (%i.%i) too old for OpenGL support, (needed at least 1.4)",
+-            majorVersion, minorVersion);
++            egl_major, egl_minor);
+         goto failure;
+       } else {
+         GST_WARNING
+             ("EGL version (%i.%i) too old for OpenGL support, (needed at least 1.4)",
+-            majorVersion, minorVersion);
++            egl_major, egl_minor);
+         if (gl_api & GST_GL_API_GLES2) {
+           goto try_gles2;
+         } else {
+@@ -599,7 +599,7 @@ gst_gl_context_egl_create_context (GstGLContext * context,
+   }
+ 
+   /* EGLImage functions */
+-  if (GST_GL_CHECK_GL_VERSION (majorVersion, minorVersion, 1, 5)) {
++  if (GST_GL_CHECK_GL_VERSION (egl_major, egl_minor, 1, 5)) {
+     egl->eglCreateImage = gst_gl_context_get_proc_address (context,
+         "eglCreateImage");
+     egl->eglDestroyImage = gst_gl_context_get_proc_address (context,
+@@ -614,7 +614,9 @@ gst_gl_context_egl_create_context (GstGLContext * context,
+     egl->eglCreateImage = NULL;
+     egl->eglDestroyImage = NULL;
+   }
+-
++  egl->egl_major = egl_major;
++  egl->egl_minor = egl_minor;
++ 
+   if (window)
+     gst_object_unref (window);
+ 
+diff --git a/gst-libs/gst/gl/egl/gstglcontext_egl.h b/gst-libs/gst/gl/egl/gstglcontext_egl.h
+index 90abb03..4a72ddf 100644
+--- a/gst-libs/gst/gl/egl/gstglcontext_egl.h
++++ b/gst-libs/gst/gl/egl/gstglcontext_egl.h
+@@ -46,6 +46,9 @@ struct _GstGLContextEGL {
+   EGLSurface egl_surface;
+   EGLConfig  egl_config;
+ 
++  gint egl_major;
++  gint egl_minor;
++
+   GstGLAPI gl_api;
+ 
+   const gchar *egl_exts;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb
index 358c5d1..3b57db9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb
@@ -20,6 +20,7 @@ SRC_URI = " \
     file://0008-gl-implement-GstGLMemoryEGL.patch \
     file://0009-glimagesink-Downrank-to-marginal.patch \
     file://0010-glplugin-glimagesink-support-video-rotat.patch \
+    file://0011-EGL_DMA_Buf-Wrong-attribute-list-type-for-EGL-1.5.patch \
 "
 SRC_URI[md5sum] = "955281a43e98c5464563fa049e0a0911"
 SRC_URI[sha256sum] = "7899fcb18e6a1af2888b19c90213af018a57d741c6e72ec56b133bc73ec8509b"
-- 
1.9.1


