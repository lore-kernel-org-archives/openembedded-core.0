Return-Path: <carol.zhu@nxp.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0086.outbound.protection.outlook.com [104.47.36.86])
	by mail.openembedded.org (Postfix) with ESMTP id 932C373178
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 06:04:15 +0000 (UTC)
Received: from BN3PR0301CA0065.namprd03.prod.outlook.com (10.160.152.161) by
	BN1PR03MB249.namprd03.prod.outlook.com (10.255.200.13) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.528.16; Mon, 4 Jul 2016 05:48:12 +0000
Received: from BL2FFO11FD063.protection.gbl (2a01:111:f400:7c09::144) by
	BN3PR0301CA0065.outlook.office365.com (2a01:111:e400:401e::33) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.528.16 via
	Frontend Transport; Mon, 4 Jul 2016 05:48:11 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD063.mail.protection.outlook.com (10.173.161.159) with
	Microsoft
	SMTP Server (TLS) id 15.1.523.9 via Frontend Transport; Mon, 4 Jul 2016
	05:48:10 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id u645m6uW030562;
	Sun, 3 Jul 2016 22:48:09 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jul 2016 13:46:28 +0800
Message-ID: <1467611193-31658-2-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1467611193-31658-1-git-send-email-carol.zhu@nxp.com>
References: <1467611193-31658-1-git-send-email-carol.zhu@nxp.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131120848910569758;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(92566002)(5820100001)(230783001)(76176999)(50986999)(36756003)(2870700001)(356003)(85426001)(81166006)(50466002)(305945005)(4326007)(2906002)(105606002)(8666005)(7846002)(229853001)(2351001)(575784001)(23676002)(106466001)(87936001)(69596002)(104016004)(33646002)(86362001)(110136002)(97736004)(8936002)(189998001)(50226002)(77096005)(19580395003)(6806005)(68736007)(15975445007)(47776003)(586003)(19580405001)(2950100001)(81156014)(8676002)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR03MB249;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD063;
	1:RUgumMnXqiAhteKWnKDQe180K0CPOXH1PjQ7ZQaUQHd/TiAuejtj5RCRqHKWnOlUey8C/G6q0QJREZd7FclbYyfsjZeSVXB5Q6su4+6Hbb2VOKBWAKPxoxaYKDNDnECzIpDYfGyuHQ3SAS1c6kVYQnmEBSn2dc2wdRkM55eU+c6yzVrdujOnNONFKbCXx2x4bSVTs45MctH3/KxNEMl85cbFzK46t7PMO5ciUE1Rldg6CvMKnJuklvulMN7mZoOTtM2AqpGxWPpaZbngyhjdjAiv5dQSrl3dRgzih/lai4jaFypzhd+S9iKrqInIFxMSSh+kSgdQ4+ZWZokspgAXQPPD3jV4jYXwKPVJyngNlawzP3vEZvGGiIc1D5AznDwX13isXw0ZDPdmY33GHwviu4PDvyF6+vV9B3hvO43B15yhlbhN6B1WB9TMjzl9gk66NetCHpR7eLC4K+3wJTyrLMKkIjiVlLYODS4qjMlP+xNubw75tcyeSV8NJbrtMWEK4Px1wjA73sCtjvih6ro2/1OBlGHm0izN8kGOWwEHfvDQFfgDTKBYtX1mLoBYzSf3w0GIJ/8jlTvUOqww1HGUUrOoYumlZz4XVetKH8+mKHXx4CahGPPWmF+tMM0bF3IdIJ3tPQCCwoVXBsADQQ+F40dPOWmlRNem/8bLMMUsN/pTbCj2mWfQ9/p57SOZpiC+E5TFk0IWtSS1FQHUnxo76WvtkHukbM/+ADnPKT6X2AQ=
X-MS-Office365-Filtering-Correlation-Id: fc3ceb8e-85c5-42ae-efbd-08d3a3cec86a
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB249;
	2:LGFT+kIW5f2LiilRN4byvhmHl94DlrNBDVf6GhqKNLddENbm3vKR/7fQklJyQU6LmRGpBtiFwSXaK74r2+w+aMPC7+WfSYQfYFIQUC67TssnkU1KIumHZ/NxwP0CcbS29xj7PLYFXI/4f4pt33cwmXaCp+kIG5zjRc+h8q4+SHspUNEtDJwlPdYxet+CPTo2;
	3:hR0daunWfDcvW+tZ5bBZgXt/ZHNr4cbTMbI4tNtudMlw+yAmqGagRhczL+pmxn5G1SilDZHQ6VoLSHy+Wa1PUKMD7MfMQ2uz+ErYuBr5Vi6ilXN1hAC/+aO+GMX9R6GBRJdu0TiD1RbpxRiJ9RXUfJI+lD6wrc+xpKIF+o6KqahK2VW3e93WVBvQqP8N9LPOUPv/gvVXZ+mQOVrmauwkQMizeMcbjgunA8hqNrZEOaQ=;
	25:4AcHO+0uXV8W6CggI2vStLX0cb2DUF1UKsDk/vQBjoYn4Rv0LpbfHuxroevGBWwlEAVhhueNgTS+YMgJ3FhJP619YOsi0mEIkWN41RykyDXsislBphZA782zyv4vcPB3dfUxk5L/4d2leIoCMyZn9nAIeYM2P06XTYaG/kmLzDf2OR01iTl1bmBX0OL8Tn8KsNEMNQYSSYok3tIiP0BbQiDtSFvxW0eXpwq74Vs5+oB29noRjkz/+H9tB0MU9+gHC/hACeh50ClXIHiUw4wQWrwysRPQVbCU8Bpy2zLoo8PJUjjUrB69+BTQSrc45pKMd6aIp23etnl6w6S1YQjAHnjgeoy7OEEZ5bxg7aoxK/YBIluq6Fra55+gFEFyT55ViColqOUG+1zxG6roJTJgEZEySFwBPbSjLvLRQI4n0mg=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN1PR03MB249;
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB249;
	31:pt+EHsqciXHOy2nZAXenFg5HlDBBt+sHI2vlpCap9jeUNb1XVGgMxjVsKy7G1J82/rZpDLN8jkB/rkRbQr+DKGDdyvRmGr/AaNHHFCebksDu/3N33sC/kTPnlw5t3gpWGfpsbp/hsvFi4qMVYUepJpYiGr1qQcQjbMakH1AYPq+ylAtmDJzO11O6vBG+FGAX6NVOv19sW8G8DsDWE1A/Eg==;
	4:ErbQ3RpHPYP9UCmQLhC67XZs2vvjwdJkzq0t57KiobeBW3G/TC3uOcoOletDECz7EClQyAo5wYgu786PuFZHzSW70DuDIlwSjwCHGpr26m24VXzZ07d2XWc5h8av581NmBZBl9vMkjzTfWIe820+5VbevCehJwgn6Bll3w+qlInq+rk4yRjEU9smp7nVSRTDicguoCSLR11VfTy68iw4B4GOOKwTNZh9AGMhalaZ0ZmkSza+y4t5zjZWnzB3Ba3NhXLdrQAf33BW7rGDYEZCFcBhSwkeLF9Wz77A/jZ2s1dHVhq9NPlxdqTO/hkT54MdfbC2uzruotxmaeZPliuHwWRJ7Ttb1Wv2mAsddMtXJVdt4ErEIvAAI6SD2sycZq15c9ObuxPYpNKR/UGouxgyZAXgE6lIClUoUHknZixZLJ1c/yaZHdvoW8zOSBbf1UNmaeeXEJEqY9XFwxYnLah8as9uJzUsGOEExOWS9IWf6AkZ1ySAre4oz9xvT41BbsohBRUhV8qXnS7c424ZVTSy+mKcQiIAaCxdW/Pv8w9JjjxG1LLF5ihGIrlqgCs53CkB
X-Microsoft-Antispam-PRVS: <BN1PR03MB2494578B7502FF32D69064EE9380@BN1PR03MB249.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197)(158362468548515);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13015025)(5005006)(8121501046)(13023025)(13018025)(13017025)(13024025)(10201501046)(3002001)(6055026);
	SRVR:BN1PR03MB249; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BN1PR03MB249; 
X-Forefront-PRVS: 0993689CD1
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjFQUjAzTUIyNDk7MjM6VkFTTUxNZW9Eb1hUYktxeW5xZkI5ejByYURp?=
	=?utf-8?B?ZXdXcFFDeGREOFA2eG9keUY1TjZpT2s0OGlOYmNuT2tmNTQydzJZQnhRTWYy?=
	=?utf-8?B?ZzQ3Y0xsaXBRbktsYmlPRHdhWE1XcjgyUjZTMnc3WDQrbVJqZDF2VVNOR0M4?=
	=?utf-8?B?bTNrc1JuNHhFa0tlVmFJSmI3VjVtR0h4enBpK0lTU0xndmdRQzMxK1BiSENK?=
	=?utf-8?B?aHJmZzNJZHpkMzErVFNQaTM4QkpZelkyR0tpbG41SmR1ME1PT3l6WFp2TzBh?=
	=?utf-8?B?RzFGbzZxZmp4a2pyM0dGUDdQSjUydTY4SVM1MGFJY3hrQUpxanFYQ3c5Rm1Y?=
	=?utf-8?B?SHQ2UGFUajhQR2hGd0VtRHZ2Z21qKys1MnQwcTNNMDNCOE54MkR1cmdjcmRO?=
	=?utf-8?B?S2ZWUG1XRUkxUnNNUkMwaHh4S0VlelRMV2diSnFYdDVzdXhrMnNlbnE1VHM3?=
	=?utf-8?B?YnNZNWhpSVRHTVpjN2dhMHBtTThMczZSTFlRZWNKelQxOGdsUjl0VFRDUnZt?=
	=?utf-8?B?QVN6T2QwSVROeERXbjlnM3h0TittQVJJUDJabkp2ZTZhbUI2L3gyZTNGV2Zh?=
	=?utf-8?B?eHFwQzBjaFBicUlUeGx6RGp0am9ja09iUjg4ZjgzRlJYbkpMWkVveXdkc2dV?=
	=?utf-8?B?Ti9kR2pDbHBPL0lFVjNtUmRSQlQ3S296Sk9XSHJ1QW96VXlMQ3l0VmRLRk9O?=
	=?utf-8?B?MmQxWGFldHVORXFycEhqaFRlSFE4Z3RTVGNmSCthNFh2c0t1QndJbnNJZXFH?=
	=?utf-8?B?QzZSeFM4T1hjNmJtSDlrT2EyME9NeWV0dHVNMmV2VGh5QlFUY0V3QzFMN00z?=
	=?utf-8?B?THc2dVU4UDM1RHpTcjNTYmIyMU11OG5wckdoZ01UQlFzclBJeEdZaTh1NVJx?=
	=?utf-8?B?Uk5WcTRoa2ZCWFFyL1hubmtKbVhuL2Z5TlEzZmF3cytUS2hoanh6K0wrZkpn?=
	=?utf-8?B?ZVFYSVAydWZUbGhRV2tVWDhTL1BsSU5LQUppTVR5RnlwaTFSY3BxRHhsYmhn?=
	=?utf-8?B?Uy9RZFdGMVlPTGFyRTF5R0RWMWdabG92R210a2xqOFFXUldzUVRlZDFlZ09C?=
	=?utf-8?B?Q2hEelZiRG1oM0tLd1dVVkxEQmtSdXRGYlptejlBc3AvNURhQjFFTVNtRkx6?=
	=?utf-8?B?N0NUVUVoMENUTGUzWHU4dVIxUVc0K2E5Sm5SZmlrclFtOGpBa2JLc0xNOEFt?=
	=?utf-8?B?SXRIZkcrZHJXTzVpaHdUTCtrT1dOVnRJWHlZQlB0bXFvZG1hYlZHR0duc1RB?=
	=?utf-8?B?dWZISmVtdnZQams4dDJxWVhTYVpMYlRBMnpUNmdUWlJ0VE44c3Y2S2RPNk1B?=
	=?utf-8?B?SXlJVTN5aTJKUDNET3IyeWZ5cDF3VCtBTFhLeFNpcG91NWl4T1JIcUV4UStp?=
	=?utf-8?B?MXdWM0lGajJzdzYxZzlrUXJCRTgrckROTjUvNWRDdmZNdldINGRHUWVLbUE2?=
	=?utf-8?B?TFhYWTZIS2Z0cGxNb21SQ3RaaU1YaUFnbElGcm5EZmthaThvYXJWa1IxL2tM?=
	=?utf-8?B?Vmd1SVNtV3JFU3ZZMjQ3N0ZkTEpaVmsrTWdvT3hjMkxiQWsxZ2VaQkM5L3B3?=
	=?utf-8?B?N0d5Y1RVbUNOejhOV3VrVVg0U0diOCtWaFNwellsOE9ta1J6QUVUTG96MTlI?=
	=?utf-8?B?c0d5bFl1alRnNEVGWHJ4VkJzdXpLOGxuRGtZaVM4b3dPYWIyRDE0RkE9PQ==?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR03MB249;
	6:ry0+/tbWhNO9yaU+CjX7m77HwhFY4pf7g8hkzzYWgMExnASl1XRNMrXLVhU+5OgNToEfKV6YRVSPdr6/akw2SiL7uwiv03M7CKazSaKU6pHEdQmegloM8mA9mm5YNOCye1CNeNGIBzO7AQAfEf/TWR5nXEl6ahXf4AIMMROk+LCjFujaAkuR4c7qS39lL5P45UUqTJzrfIyLmZzoVsbnYZwbeQTMaRJ7UMhVBaZ74Ssr5ASkcmdDDohbFB38CGUefsi8wBKoaSV40NRHorkhGaQg+l6LPna4ncgRvvUtAUA=;
	5:yNei94hISAt+GHVX5OqbH/caybVFUF2y9IDebMtAiiWrpzqey41PsrPe9DkDuEHiG0w3kigYZjpnWFgDlnlF8Q6Zu9R+jX75vBycmrdTSonywQ5CPIfdAwQNwIV2TDqHGszmplHxLLOH9cr+8dI67ITZUCA1NE0oneVyjMlAZns=;
	24:sYI1OJmNFbUUOmOah7Af77hlXd7sEZEZXXgHaJKqXCxUrEn53NYXNpCoVcOwHmki3EUJd8cjfJsWxTieA0PaofbydFhZy2TF879Hgn/6FF0=;
	7:7jFdRNPyWJ+K53rchz3xskUwRBjYuDfEigyYDYJelZbogPz19gRCwHqb8oP11dUtXhhJf0WGEO4jgnMRxALvKsPGhi5XfkHmnN+mWjoXQ0qP1qvyuRBYRNe7q68tgKSAojsf7vcFhwqAbVciUPcY9dWCrQOMcFgTF7mqqS3ysVVVbrjjVDTeAA/vGJzdkmRF7Je4MKfGdsinh2s0vCm/TgifcYmtqybzZEaDRCijFnm2W3BiH6V4j/sAorCGOUwg
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2016 05:48:10.8385 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR03MB249
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH 1/6] gstreamer1.0-plugins-bad: Enable gldeinterlace on OpenGL ES
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
X-List-Received-Date: Mon, 04 Jul 2016 06:04:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Enable gldeinterlace on OpenGL ES to improve performance.

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...lplugin-enable-gldeinterlace-on-OpenGL-ES.patch | 634 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb    |   1 +
 2 files changed, 635 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-enable-gldeinterlace-on-OpenGL-ES.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-enable-gldeinterlace-on-OpenGL-ES.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-enable-gldeinterlace-on-OpenGL-ES.patch
new file mode 100755
index 0000000..175e822
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-enable-gldeinterlace-on-OpenGL-ES.patch
@@ -0,0 +1,634 @@
+From 8a0e97f7e672301cc76e394855e8c7a3448b0249 Mon Sep 17 00:00:00 2001
+From: Haihua Hu <jared.hu@nxp.com>
+Date: Fri, 8 Apr 2016 16:47:15 +0800
+Subject: [PATCH 4/6] [glplugin] enable gldeinterlace on OpenGL ES
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+1.Porting the exist deinterlace shader and OpenGL callback
+  to be compatible with OpenGL ES.
+2.Add a our blur vertical shader to gldeinterlace.
+3.Add a property named “method” to let user choose which
+  deinterlace function to use. Default to choose blur vertical
+  method for better performance.
+
+Upstream-Status: Pending
+
+https://bugzilla.gnome.org/show_bug.cgi?id=764873
+
+Signed-off-by: Haihua Hu <jared.hu@nxp.com>
+---
+ ext/gl/Makefile.am        |   4 +-
+ ext/gl/gstgldeinterlace.c | 344 +++++++++++++++++++++++++++++++++++-----------
+ ext/gl/gstgldeinterlace.h |   6 +-
+ ext/gl/gstopengl.c        |  13 +-
+ 4 files changed, 275 insertions(+), 92 deletions(-)
+
+diff --git a/ext/gl/Makefile.am b/ext/gl/Makefile.am
+index 5d55f54..46419a7 100644
+--- a/ext/gl/Makefile.am
++++ b/ext/gl/Makefile.am
+@@ -40,6 +40,7 @@ libgstopengl_la_SOURCES = \
+ 	gstglfilterapp.c \
+ 	gstglviewconvert.c \
+ 	gstglstereosplit.c \
++	gstgldeinterlace.c \
+ 	gstglstereomix.c
+ 
+ noinst_HEADERS = \
+@@ -63,20 +64,19 @@ noinst_HEADERS = \
+ 	gstglfilterapp.h \
+ 	gstglstereosplit.h \
+ 	gstglstereomix.h \
++	gstgldeinterlace.h \
+ 	gstglviewconvert.h
+ 
+ # full opengl required
+ if USE_OPENGL
+ libgstopengl_la_SOURCES += \
+ 	gstglfilterglass.c \
+-	gstgldeinterlace.c \
+ 	gltestsrc.c \
+ 	gstgltestsrc.c \
+ 	gstglmosaic.c
+ 
+ noinst_HEADERS += \
+ 	gstglfilterglass.h \
+-	gstgldeinterlace.h \
+ 	gltestsrc.h \
+ 	gstgltestsrc.h \
+ 	gstglmosaic.h \
+diff --git a/ext/gl/gstgldeinterlace.c b/ext/gl/gstgldeinterlace.c
+index bd0eff0..c1250dc 100644
+--- a/ext/gl/gstgldeinterlace.c
++++ b/ext/gl/gstgldeinterlace.c
+@@ -43,7 +43,8 @@ GST_DEBUG_CATEGORY_STATIC (GST_CAT_DEFAULT);
+ 
+ enum
+ {
+-  PROP_0
++  PROP_0,
++  PROP_METHOD
+ };
+ 
+ #define DEBUG_INIT \
+@@ -57,17 +58,23 @@ static void gst_gl_deinterlace_set_property (GObject * object,
+ static void gst_gl_deinterlace_get_property (GObject * object,
+     guint prop_id, GValue * value, GParamSpec * pspec);
+ 
++static gboolean gst_gl_deinterlace_start (GstBaseTransform * trans);
+ static gboolean gst_gl_deinterlace_reset (GstBaseTransform * trans);
+-static gboolean gst_gl_deinterlace_init_shader (GstGLFilter * filter);
++static gboolean gst_gl_deinterlace_init_fbo (GstGLFilter * filter);
+ static gboolean gst_gl_deinterlace_filter (GstGLFilter * filter,
+     GstBuffer * inbuf, GstBuffer * outbuf);
+ static gboolean gst_gl_deinterlace_filter_texture (GstGLFilter * filter,
+     guint in_tex, guint out_tex);
+-static void gst_gl_deinterlace_callback (gint width, gint height,
++static void gst_gl_deinterlace_vfir_callback (gint width, gint height,
++    guint texture, gpointer stuff);
++static void gst_gl_deinterlace_greedyh_callback (gint width, gint height,
+     guint texture, gpointer stuff);
+ 
+ /* *INDENT-OFF* */
+ static const gchar *greedyh_fragment_source =
++  "#ifdef GL_ES\n"
++  "precision mediump float;\n"
++  "#endif\n"
+   "uniform sampler2D tex;\n"
+   "uniform sampler2D tex_prev;\n"
+   "uniform float max_comb;\n"
+@@ -75,35 +82,35 @@ static const gchar *greedyh_fragment_source =
+   "uniform float motion_sense;\n"
+   "uniform float width;\n"
+   "uniform float height;\n"
++  "varying vec2 v_texcoord;\n"
+ 
+   "void main () {\n"
+-  "  vec2 texcoord = gl_TexCoord[0].xy;\n"
+-  "  if (int(mod(texcoord.y * height, 2.0)) == 0) {\n"
+-  "    gl_FragColor = vec4(texture2D(tex_prev, texcoord).rgb, 1.0);\n"
++  "  if (int(mod(v_texcoord.y * height, 2.0)) == 0) {\n"
++  "    gl_FragColor = vec4(texture2D(tex_prev, v_texcoord).rgb, 1.0);\n"
+   "  } else {\n"
+   "    vec2 texcoord_L1_a1, texcoord_L3_a1, texcoord_L1, texcoord_L3, texcoord_L1_1, texcoord_L3_1;\n"
+   "    vec3 L1_a1, L3_a1, L1, L3, L1_1, L3_1;\n"
+ 
+-  "    texcoord_L1 = vec2(texcoord.x, texcoord.y - 1.0 / height);\n"
+-  "    texcoord_L3 = vec2(texcoord.x, texcoord.y + 1.0 / height);\n"
++  "    texcoord_L1 = vec2(v_texcoord.x, v_texcoord.y - 1.0 / height);\n"
++  "    texcoord_L3 = vec2(v_texcoord.x, v_texcoord.y + 1.0 / height);\n"
+   "    L1 = texture2D(tex_prev, texcoord_L1).rgb;\n"
+   "    L3 = texture2D(tex_prev, texcoord_L3).rgb;\n"
+-  "    if (texcoord.x == 1.0 && texcoord.y == 1.0) {\n"
++  "    if (v_texcoord.x == 1.0 && v_texcoord.y == 1.0) {\n"
+   "      L1_1 = L1;\n"
+   "      L3_1 = L3;\n"
+   "    } else {\n"
+-  "      texcoord_L1_1 = vec2(texcoord.x + 1.0 / width, texcoord.y - 1.0 / height);\n"
+-  "      texcoord_L3_1 = vec2(texcoord.x + 1.0 / width, texcoord.y + 1.0 / height);\n"
++  "      texcoord_L1_1 = vec2(v_texcoord.x + 1.0 / width, v_texcoord.y - 1.0 / height);\n"
++  "      texcoord_L3_1 = vec2(v_texcoord.x + 1.0 / width, v_texcoord.y + 1.0 / height);\n"
+   "      L1_1 = texture2D(tex_prev, texcoord_L1_1).rgb;\n"
+   "      L3_1 = texture2D(tex_prev, texcoord_L3_1).rgb;\n"
+   "    }\n"
+ 
+-  "    if (int(ceil(texcoord.x + texcoord.y)) == 0) {\n"
++  "    if (int(ceil(v_texcoord.x + v_texcoord.y)) == 0) {\n"
+   "      L1_a1 = L1;\n"
+   "      L3_a1 = L3;\n"
+   "    } else {\n"
+-  "      texcoord_L1_a1 = vec2(texcoord.x - 1.0 / width, texcoord.y - 1.0 / height);\n"
+-  "      texcoord_L3_a1 = vec2(texcoord.x - 1.0 / width, texcoord.y + 1.0 / height);\n"
++  "      texcoord_L1_a1 = vec2(v_texcoord.x - 1.0 / width, v_texcoord.y - 1.0 / height);\n"
++  "      texcoord_L3_a1 = vec2(v_texcoord.x - 1.0 / width, v_texcoord.y + 1.0 / height);\n"
+   "      L1_a1 = texture2D(tex_prev, texcoord_L1_a1).rgb;\n"
+   "      L3_a1 = texture2D(tex_prev, texcoord_L3_a1).rgb;\n"
+   "    }\n"
+@@ -113,8 +120,8 @@ static const gchar *greedyh_fragment_source =
+   "    vec3 avg_1 = (L1_1 + L3_1) / 2.0;\n"
+   "    vec3 avg_s = (avg_a1 + avg_1) / 2.0;\n"
+   "    vec3 avg_sc = (avg_s + avg) / 2.0;\n"
+-  "    vec3 L2 = texture2D(tex, texcoord).rgb;\n"
+-  "    vec3 LP2 = texture2D(tex_prev, texcoord).rgb;\n"
++  "    vec3 L2 = texture2D(tex, v_texcoord).rgb;\n"
++  "    vec3 LP2 = texture2D(tex_prev, v_texcoord).rgb;\n"
+   "    vec3 best;\n"
+   "    if (abs(L2.r - avg_sc.r) < abs(LP2.r - avg_sc.r)) {\n"
+   "      best.r = L2.r;\n" "    } else {\n"
+@@ -144,8 +151,87 @@ static const gchar *greedyh_fragment_source =
+   "    gl_FragColor = vec4(last, 1.0);\n"
+   "  }\n"
+   "}\n";
++
++const gchar *vfir_fragment_source =
++  "#ifdef GL_ES\n"
++  "precision mediump float;\n"
++  "#endif\n"
++  "uniform sampler2D tex;\n"
++  "uniform float width;\n"
++  "uniform float height;\n"
++  "varying vec2 v_texcoord;\n"
++  "void main()\n"
++  "{\n"
++  "  vec2 topcoord, botcoord;\n"
++  "  vec4 cur_color, top_color, bot_color;\n"
++  "  topcoord.x = v_texcoord.x;\n"
++  "  botcoord.x = v_texcoord.x;\n"
++  "  if (v_texcoord.y == 0.0 || v_texcoord.y == 1.0) {\n"
++  "    topcoord.y = v_texcoord.y ;\n"
++  "    botcoord.y = v_texcoord.y ;\n"
++  "  }\n"
++  "  else {\n"
++  "    topcoord.y = v_texcoord.y - 1.0/height;\n"
++  "    botcoord.y = v_texcoord.y + 1.0/height;\n"
++  "  }\n"
++  "  cur_color = texture2D(tex, v_texcoord);\n"
++  "  top_color = texture2D(tex, topcoord);\n"
++  "  bot_color = texture2D(tex, botcoord);\n"
++  "  gl_FragColor = 0.5*cur_color + 0.25*top_color + 0.25*bot_color;\n"
++  "}";
+ /* *INDENT-ON* */
+ 
++/* dont' forget to edit the following when a new method is added */
++typedef enum
++{
++  GST_GL_DEINTERLACE_VFIR,
++  GST_GL_DEINTERLACE_GREEDYH
++} GstGLDeinterlaceMethod;
++
++static const GEnumValue *
++gst_gl_deinterlace_get_methods (void)
++{
++  static const GEnumValue method_types[] = {
++    {GST_GL_DEINTERLACE_VFIR, "Blur Vertical", "vfir"},
++    {GST_GL_DEINTERLACE_GREEDYH, "Motion Adaptive: Advanced Detection",
++          "greedhy"},
++    {0, NULL, NULL}
++  };
++  return method_types;
++}
++
++#define GST_TYPE_GL_DEINTERLACE_METHODS (gst_gl_deinterlace_method_get_type ())
++static GType
++gst_gl_deinterlace_method_get_type (void)
++{
++  static GType gl_deinterlace_method_type = 0;
++  if (!gl_deinterlace_method_type) {
++    gl_deinterlace_method_type =
++        g_enum_register_static ("GstGLDeinterlaceMethod",
++        gst_gl_deinterlace_get_methods ());
++  }
++  return gl_deinterlace_method_type;
++}
++
++static void
++gst_gl_deinterlace_set_method (GstGLDeinterlace * deinterlace,
++    guint method_types)
++{
++  switch (method_types) {
++    case GST_GL_DEINTERLACE_VFIR:
++      deinterlace->deinterlacefunc = gst_gl_deinterlace_vfir_callback;
++      deinterlace->current_method = method_types;
++      break;
++    case GST_GL_DEINTERLACE_GREEDYH:
++      deinterlace->deinterlacefunc = gst_gl_deinterlace_greedyh_callback;
++      deinterlace->current_method = method_types;
++      break;
++    default:
++      g_assert_not_reached ();
++      break;
++  }
++}
++
+ static void
+ gst_gl_deinterlace_class_init (GstGLDeinterlaceClass * klass)
+ {
+@@ -163,25 +249,60 @@ gst_gl_deinterlace_class_init (GstGLDeinterlaceClass * klass)
+       "Deinterlacing based on fragment shaders",
+       "Julien Isorce <julien.isorce@mail.com>");
+ 
++  g_object_class_install_property (gobject_class,
++      PROP_METHOD,
++      g_param_spec_enum ("method",
++          "Deinterlace Method",
++          "Select which deinterlace method apply to GL video texture",
++          GST_TYPE_GL_DEINTERLACE_METHODS,
++          GST_GL_DEINTERLACE_VFIR, G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS));
++
++  GST_BASE_TRANSFORM_CLASS (klass)->start = gst_gl_deinterlace_start;
+   GST_BASE_TRANSFORM_CLASS (klass)->stop = gst_gl_deinterlace_reset;
+ 
+   GST_GL_FILTER_CLASS (klass)->filter = gst_gl_deinterlace_filter;
+   GST_GL_FILTER_CLASS (klass)->filter_texture =
+       gst_gl_deinterlace_filter_texture;
+-  GST_GL_FILTER_CLASS (klass)->init_fbo = gst_gl_deinterlace_init_shader;
++  GST_GL_FILTER_CLASS (klass)->init_fbo = gst_gl_deinterlace_init_fbo;
+ 
+-  GST_GL_BASE_FILTER_CLASS (klass)->supported_gl_api = GST_GL_API_OPENGL;
++  GST_GL_BASE_FILTER_CLASS (klass)->supported_gl_api =
++      GST_GL_API_OPENGL | GST_GL_API_GLES2 | GST_GL_API_OPENGL3;
+ }
+ 
+ static void
+ gst_gl_deinterlace_init (GstGLDeinterlace * filter)
+ {
+-  filter->shader = NULL;
++  filter->shaderstable = NULL;
++  filter->deinterlacefunc = gst_gl_deinterlace_vfir_callback;
++  filter->current_method = GST_GL_DEINTERLACE_VFIR;
+   filter->prev_buffer = NULL;
+   filter->prev_tex = 0;
+ }
+ 
+ static gboolean
++gst_gl_deinterlace_start (GstBaseTransform * trans)
++{
++  GstGLDeinterlace *deinterlace_filter = GST_GL_DEINTERLACE (trans);
++
++  deinterlace_filter->shaderstable = g_hash_table_new (g_str_hash, g_str_equal);
++
++  return GST_BASE_TRANSFORM_CLASS (parent_class)->start (trans);
++}
++
++static void
++gst_gl_deinterlace_ghash_func_clean (gpointer key, gpointer value,
++    gpointer data)
++{
++  GstGLShader *shader = (GstGLShader *) value;
++  GstGLFilter *filter = (GstGLFilter *) data;
++
++  //blocking call, wait the opengl thread has destroyed the shader
++  gst_gl_context_del_shader (GST_GL_BASE_FILTER (filter)->context, shader);
++
++  value = NULL;
++}
++
++static gboolean
+ gst_gl_deinterlace_reset (GstBaseTransform * trans)
+ {
+   GstGLDeinterlace *deinterlace_filter = GST_GL_DEINTERLACE (trans);
+@@ -189,10 +310,17 @@ gst_gl_deinterlace_reset (GstBaseTransform * trans)
+   gst_buffer_replace (&deinterlace_filter->prev_buffer, NULL);
+ 
+   //blocking call, wait the opengl thread has destroyed the shader
+-  if (deinterlace_filter->shader)
+-    gst_gl_context_del_shader (GST_GL_BASE_FILTER (trans)->context,
+-        deinterlace_filter->shader);
+-  deinterlace_filter->shader = NULL;
++  if (deinterlace_filter->shaderstable) {
++    /* release shaders in the gl thread */
++    g_hash_table_foreach (deinterlace_filter->shaderstable,
++        gst_gl_deinterlace_ghash_func_clean, deinterlace_filter);
++
++    /* clean the htable without calling values destructors
++     * because shaders have been released in the glthread
++     * through the foreach func */
++    g_hash_table_unref (deinterlace_filter->shaderstable);
++    deinterlace_filter->shaderstable = NULL;
++  }
+ 
+   return GST_BASE_TRANSFORM_CLASS (parent_class)->stop (trans);
+ }
+@@ -201,9 +329,12 @@ static void
+ gst_gl_deinterlace_set_property (GObject * object, guint prop_id,
+     const GValue * value, GParamSpec * pspec)
+ {
+-  //GstGLDeinterlace *filter = GST_GL_DEINTERLACE (object);
++  GstGLDeinterlace *filter = GST_GL_DEINTERLACE (object);
+ 
+   switch (prop_id) {
++    case PROP_METHOD:
++      gst_gl_deinterlace_set_method (filter, g_value_get_enum (value));
++      break;
+     default:
+       G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+       break;
+@@ -214,9 +345,12 @@ static void
+ gst_gl_deinterlace_get_property (GObject * object, guint prop_id,
+     GValue * value, GParamSpec * pspec)
+ {
+-  //GstGLDeinterlace *filter = GST_GL_DEINTERLACE (object);
++  GstGLDeinterlace *filter = GST_GL_DEINTERLACE (object);
+ 
+   switch (prop_id) {
++    case PROP_METHOD:
++      g_value_set_enum (value, filter->current_method);
++      break;
+     default:
+       G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+       break;
+@@ -224,13 +358,9 @@ gst_gl_deinterlace_get_property (GObject * object, guint prop_id,
+ }
+ 
+ static gboolean
+-gst_gl_deinterlace_init_shader (GstGLFilter * filter)
++gst_gl_deinterlace_init_fbo (GstGLFilter * filter)
+ {
+-  GstGLDeinterlace *deinterlace_filter = GST_GL_DEINTERLACE (filter);
+-
+-  //blocking call, wait the opengl thread has compiled the shader
+-  return gst_gl_context_gen_shader (GST_GL_BASE_FILTER (filter)->context, 0,
+-      greedyh_fragment_source, &deinterlace_filter->shader);
++  return TRUE;
+ }
+ 
+ static gboolean
+@@ -241,7 +371,7 @@ gst_gl_deinterlace_filter_texture (GstGLFilter * filter, guint in_tex,
+ 
+   //blocking call, use a FBO
+   gst_gl_filter_render_to_target (filter, TRUE, in_tex, out_tex,
+-      gst_gl_deinterlace_callback, deinterlace_filter);
++      deinterlace_filter->deinterlacefunc, deinterlace_filter);
+ 
+   return TRUE;
+ }
+@@ -259,36 +389,104 @@ gst_gl_deinterlace_filter (GstGLFilter * filter, GstBuffer * inbuf,
+   return TRUE;
+ }
+ 
+-//opengl scene, params: input texture (not the output filter->texture)
++static GstGLShader *
++gst_gl_deinterlace_get_fragment_shader (GstGLFilter * filter,
++    const gchar * shader_name, const gchar * shader_source)
++{
++  GstGLShader *shader = NULL;
++  GstGLDeinterlace *deinterlace_filter = GST_GL_DEINTERLACE (filter);
++  GstGLContext *context = GST_GL_BASE_FILTER (filter)->context;
++
++  shader = g_hash_table_lookup (deinterlace_filter->shaderstable, shader_name);
++
++  if (!shader) {
++    GError *error = NULL;
++
++    if (!(shader = gst_gl_shader_new_link_with_stages (context, &error,
++                gst_glsl_stage_new_default_vertex (context),
++                gst_glsl_stage_new_with_string (context, GL_FRAGMENT_SHADER,
++                    GST_GLSL_VERSION_NONE,
++                    GST_GLSL_PROFILE_ES | GST_GLSL_PROFILE_COMPATIBILITY,
++                    shader_source), NULL))) {
++      GST_ELEMENT_ERROR (deinterlace_filter, RESOURCE, NOT_FOUND,
++          ("Failed to initialize %s shader", shader_name), (NULL));
++    }
++
++    filter->draw_attr_position_loc =
++        gst_gl_shader_get_attribute_location (shader, "a_position");
++    filter->draw_attr_texture_loc =
++        gst_gl_shader_get_attribute_location (shader, "a_texcoord");
++  }
++
++  g_hash_table_insert (deinterlace_filter->shaderstable, (gchar *) shader_name,
++      shader);
++
++  return shader;
++}
++
+ static void
+-gst_gl_deinterlace_callback (gint width, gint height, guint texture,
++gst_gl_deinterlace_vfir_callback (gint width, gint height, guint texture,
+     gpointer stuff)
+ {
+-  GstGLDeinterlace *deinterlace_filter = GST_GL_DEINTERLACE (stuff);
++  GstGLShader *shader;
+   GstGLFilter *filter = GST_GL_FILTER (stuff);
+-  GstGLFuncs *gl = GST_GL_BASE_FILTER (filter)->context->gl_vtable;
++  GstGLDeinterlace *deinterlace_filter = GST_GL_DEINTERLACE (filter);
++  GstGLContext *context = GST_GL_BASE_FILTER (filter)->context;
++  GstGLFuncs *gl = context->gl_vtable;
++
++  shader = gst_gl_deinterlace_get_fragment_shader (deinterlace_filter, "vfir",
++      vfir_fragment_source);
++
++  if (!shader)
++    return;
++
++#if GST_GL_HAVE_OPENGL
++  if (USING_OPENGL (context)) {
++    gl->MatrixMode (GL_PROJECTION);
++    gl->LoadIdentity ();
++  }
++#endif
++
++  gst_gl_shader_use (shader);
++
++  gl->ActiveTexture (GL_TEXTURE0);
++  gl->BindTexture (GL_TEXTURE_2D, texture);
++
++  gst_gl_shader_set_uniform_1i (shader, "tex", 0);
++  gst_gl_shader_set_uniform_1f (shader, "width",
++      GST_VIDEO_INFO_WIDTH (&filter->out_info));
++  gst_gl_shader_set_uniform_1f (shader, "height",
++      GST_VIDEO_INFO_HEIGHT (&filter->out_info));
++
++  gst_gl_filter_draw_texture (filter, texture, width, height);
++}
++
++static void
++gst_gl_deinterlace_greedyh_callback (gint width, gint height, guint texture,
++    gpointer stuff)
++{
++  GstGLShader *shader;
++  GstGLFilter *filter = GST_GL_FILTER (stuff);
++  GstGLDeinterlace *deinterlace_filter = GST_GL_DEINTERLACE (filter);
++  GstGLContext *context = GST_GL_BASE_FILTER (filter)->context;
++  GstGLFuncs *gl = context->gl_vtable;
+   guint temp;
+ 
+-  GLfloat verts[] = { -1.0, -1.0,
+-    1.0, -1.0,
+-    1.0, 1.0,
+-    -1.0, 1.0
+-  };
+-  GLfloat texcoords0[] = { 0.0f, 0.0f,
+-    1.0f, 0.0f,
+-    1.0f, 1.0f,
+-    0.0f, 1.0f
+-  };
+-  GLfloat texcoords1[] = { 0.0f, 0.0f,
+-    1.0f, 0.0f,
+-    1.0f, 1.0f,
+-    0.0f, 1.0f
+-  };
++  shader =
++      gst_gl_deinterlace_get_fragment_shader (deinterlace_filter, "greedhy",
++      greedyh_fragment_source);
+ 
+-  gl->MatrixMode (GL_PROJECTION);
+-  gl->LoadIdentity ();
++  if (!shader)
++    return;
+ 
+-  gst_gl_shader_use (deinterlace_filter->shader);
++#if GST_GL_HAVE_OPENGL
++  if (USING_OPENGL (context)) {
++    gl->MatrixMode (GL_PROJECTION);
++    gl->LoadIdentity ();
++  }
++#endif
++
++  gst_gl_shader_use (shader);
+ 
+   if (G_UNLIKELY (deinterlace_filter->prev_tex == 0)) {
+     gst_gl_context_gen_texture (GST_GL_BASE_FILTER (filter)->context,
+@@ -298,44 +496,24 @@ gst_gl_deinterlace_callback (gint width, gint height, guint texture,
+         GST_VIDEO_INFO_HEIGHT (&filter->out_info));
+   } else {
+     gl->ActiveTexture (GL_TEXTURE1);
+-    gst_gl_shader_set_uniform_1i (deinterlace_filter->shader, "tex_prev", 1);
++    gst_gl_shader_set_uniform_1i (shader, "tex_prev", 1);
+     gl->BindTexture (GL_TEXTURE_2D, deinterlace_filter->prev_tex);
+   }
+ 
+   gl->ActiveTexture (GL_TEXTURE0);
+-  gst_gl_shader_set_uniform_1i (deinterlace_filter->shader, "tex", 0);
++  gl->BindTexture (GL_TEXTURE_2D, texture);
+ 
+-  gst_gl_shader_set_uniform_1f (deinterlace_filter->shader, "max_comb",
+-      5.0f / 255.0f);
+-  gst_gl_shader_set_uniform_1f (deinterlace_filter->shader, "motion_threshold",
+-      25.0f / 255.0f);
+-  gst_gl_shader_set_uniform_1f (deinterlace_filter->shader, "motion_sense",
+-      30.0f / 255.0f);
++  gst_gl_shader_set_uniform_1i (shader, "tex", 0);
++  gst_gl_shader_set_uniform_1f (shader, "max_comb", 5.0f / 255.0f);
++  gst_gl_shader_set_uniform_1f (shader, "motion_threshold", 25.0f / 255.0f);
++  gst_gl_shader_set_uniform_1f (shader, "motion_sense", 30.0f / 255.0f);
+ 
+-  gst_gl_shader_set_uniform_1f (deinterlace_filter->shader, "width",
++  gst_gl_shader_set_uniform_1f (shader, "width",
+       GST_VIDEO_INFO_WIDTH (&filter->out_info));
+-  gst_gl_shader_set_uniform_1f (deinterlace_filter->shader, "height",
++  gst_gl_shader_set_uniform_1f (shader, "height",
+       GST_VIDEO_INFO_HEIGHT (&filter->out_info));
+ 
+-  gl->ClientActiveTexture (GL_TEXTURE0);
+-
+-  gl->EnableClientState (GL_TEXTURE_COORD_ARRAY);
+-  gl->EnableClientState (GL_VERTEX_ARRAY);
+-
+-  gl->VertexPointer (2, GL_FLOAT, 0, &verts);
+-  gl->TexCoordPointer (2, GL_FLOAT, 0, &texcoords0);
+-
+-  gl->ClientActiveTexture (GL_TEXTURE1);
+-  gl->EnableClientState (GL_TEXTURE_COORD_ARRAY);
+-  gl->TexCoordPointer (2, GL_FLOAT, 0, &texcoords1);
+-
+-  gl->DrawArrays (GL_TRIANGLE_FAN, 0, 4);
+-
+-  gl->DisableClientState (GL_VERTEX_ARRAY);
+-  gl->DisableClientState (GL_TEXTURE_COORD_ARRAY);
+-
+-  gl->ClientActiveTexture (GL_TEXTURE0);
+-  gl->DisableClientState (GL_TEXTURE_COORD_ARRAY);
++  gst_gl_filter_draw_texture (filter, texture, width, height);
+ 
+   if (texture == filter->in_tex_id) {
+     temp = filter->in_tex_id;
+diff --git a/ext/gl/gstgldeinterlace.h b/ext/gl/gstgldeinterlace.h
+index a81a2e7..58a9c0c 100644
+--- a/ext/gl/gstgldeinterlace.h
++++ b/ext/gl/gstgldeinterlace.h
+@@ -38,9 +38,13 @@ typedef struct _GstGLDeinterlaceClass GstGLDeinterlaceClass;
+ struct _GstGLDeinterlace
+ {
+   GstGLFilter  filter;
+-  GstGLShader  *shader;
++
++  GLCB	       deinterlacefunc; 
++  GHashTable   *shaderstable;
+   GstBuffer    *prev_buffer;
+   guint         prev_tex;
++
++  gint	       current_method;
+ };
+ 
+ struct _GstGLDeinterlaceClass
+diff --git a/ext/gl/gstopengl.c b/ext/gl/gstopengl.c
+index 50676c4..135862a 100644
+--- a/ext/gl/gstopengl.c
++++ b/ext/gl/gstopengl.c
+@@ -62,6 +62,7 @@
+ #include "gstglstereosplit.h"
+ #include "gstglstereomix.h"
+ #include "gstglviewconvert.h"
++#include "gstgldeinterlace.h"
+ 
+ #if HAVE_GRAPHENE
+ #include "gstgltransformation.h"
+@@ -77,7 +78,6 @@
+ #include "gstgltestsrc.h"
+ #include "gstglfilterglass.h"
+ /* #include "gstglfilterreflectedscreen.h" */
+-#include "gstgldeinterlace.h"
+ #include "gstglmosaic.h"
+ #if HAVE_PNG
+ #include "gstgldifferencematte.h"
+@@ -226,6 +226,12 @@ plugin_init (GstPlugin * plugin)
+           GST_RANK_NONE, GST_TYPE_GL_STEREO_MIX)) {
+     return FALSE;
+   }
++
++  if (!gst_element_register (plugin, "gldeinterlace",
++          GST_RANK_NONE, GST_TYPE_GL_DEINTERLACE)) {
++    return FALSE;
++  }
++
+ #if HAVE_JPEG
+ #if HAVE_PNG
+   if (!gst_element_register (plugin, "gloverlay",
+@@ -250,11 +256,6 @@ plugin_init (GstPlugin * plugin)
+     return FALSE;
+   }
+ #endif
+-  if (!gst_element_register (plugin, "gldeinterlace",
+-          GST_RANK_NONE, GST_TYPE_GL_DEINTERLACE)) {
+-    return FALSE;
+-  }
+-
+   if (!gst_element_register (plugin, "glmosaic",
+           GST_RANK_NONE, GST_TYPE_GL_MOSAIC)) {
+     return FALSE;
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
index c7d67f8..7cd14c7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
     file://0001-gstreamer-gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch \
+    file://0002-glplugin-enable-gldeinterlace-on-OpenGL-ES.patch \
 "
 SRC_URI[md5sum] = "83abc2e70684e7b195f18ca2992ef6e8"
 SRC_URI[sha256sum] = "d7995317530c8773ec088f94d9320909d41da61996b801ebacce9a56af493f97"
-- 
1.9.1


