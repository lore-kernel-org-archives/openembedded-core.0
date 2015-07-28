Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bbn0106.outbound.protection.outlook.com [157.56.111.106])
	by mail.openembedded.org (Postfix) with ESMTP id 7142176243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 09:58:30 +0000 (UTC)
Received: from BY2PR03CA073.namprd03.prod.outlook.com (10.141.249.46) by
	CY1PR0301MB1177.namprd03.prod.outlook.com (10.160.165.20) with
	Microsoft SMTP
	Server (TLS) id 15.1.219.17; Tue, 28 Jul 2015 09:58:29 +0000
Received: from BY2FFO11FD047.protection.gbl (2a01:111:f400:7c0c::163) by
	BY2PR03CA073.outlook.office365.com (2a01:111:e400:2c5d::46) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Tue, 28 Jul 2015 09:58:29 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD047.mail.protection.outlook.com (10.1.15.175) with Microsoft
	SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Tue, 28 Jul 2015 09:58:28 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6S9wPeg017590; Tue, 28 Jul 2015 02:58:26 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jul 2015 01:58:05 +0800
Message-ID: <1438106291-14986-1-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD047;
	1:5LywdoDUCMSb3sgER/j1HT6lL5TD9QFhp6PrZyaRDswQXQ21ZdaEwU12BHTA3niy2k+7nueayyGMsHe6feeTF1BQtgPul4cP5PdvBg7shu1Ia+DMU9NOUYVAXPBlH2Mw2FvhLd/VHLa1qz03qara8Zt/A2rIl3GejgOzNp4IEQI3tYDz/68XlKuXqFUYutJOMfDkTkVVqZQtqA7D+Xgps3aFcfHHJOfpgHcMqvO8M1if9GeWtNBOk+yh2ptqpxwg+Qfm/0g7iLdcKILNm2W+LcMPqngyI+eV5qAbLlBpoZrneInkbskkAltJ4rr102yY0AtOd4cPJZYR9wD3Gq7uFw==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(46102003)(87936001)(110136002)(106466001)(92566002)(230783001)(48376002)(50986999)(77156002)(62966003)(47776003)(104016003)(33646002)(50226001)(189998001)(50466002)(85426001)(107886002)(6806004)(86362001)(229853001)(2351001)(36756003)(5001960100002)(77096005)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1177;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1177;
	2:HCG7GL0cEYFX7u0tCJQo/5LfIUUA/UtqG1JThU6hC78ViQQEbJ1nZcaXka0+/KSP;
	3:9CtqqlUOnO6E2DMlvy51gswgNOFIWWkbKXxPPMRUWCnW2qXrgl/MwdKc/mlNlzgIHUnI1mrlQMHV/7AcE644J6khy3iTFyN/mmXGDX64eU630jcgsji4Pwglq2bnHSJ6Xm+VSL0k0C/ERfE/cwu8ZtyVZSrGLRCBHKoH/qZQGqKYtIOa+23hdUcBknR3zuOCIm6wVATHV/5OspbsIrg79sHHZ1TutnhOz+JKqriQUzE=;
	25:QbEVddQOMG7kLjuYWaQdlO/JFD6ZP9WZNA9es2iZBrLsgXEz0F/un3tFIcaVGzVrniZQ1CFMyKtuBtkXDFKwnSN3Oz05KGmTOZ8qNz+2tZ4MZTX2aaVmc8aYeWj7YzJO0b9j7ckObfQwihIEHCGK5fxBOlBbfzrmzpq2mcqZS7kHk0Op2rtpKzYpz2eOJkvqq+Yl0CFxya9ecDu/K/x6njvZts95d3GYoyGJA7kqqQRkDa75FHv8EWkmPq7/Sfg4;
	20:odherCQYfzZLBDQjoovVqxMn8BTeG8FiHrRytdXrKMKfdNWmuWpYB0hf4VQgm5y33jcpjA4cLj0QzwVBPRSXNI4wDvwo0RcWiSm77Z/gz2ID00nUhiog5lqKWoKaNJaStV8TS0tR8cSfa0ogmWaSFFcS4wFV9PBQ1MytuarjFc7jpeZFWNBQuE90ZxLTD4TVb/QbnR8Eqym2oO0t/r/Szn3RYiLfUDVU2JZkAKGt6q0LXsXXL5/KCfEZDToevuR25ms4qyxpSZ1zAG9Q4CJXF2O5uglHsW4a0nwjCcEOWpdny4IAz7a1FgcvUIPJAVZP7wxRCsnupowtwrYlh/UHumL3FHv+GlEE3exqeLb+O9s=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1177;
CY1PR0301MB1177: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <CY1PR0301MB1177F1B38AE5C824C74750FA868D0@CY1PR0301MB1177.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:CY1PR0301MB1177; BCL:0;
	PCL:0; RULEID:; SRVR:CY1PR0301MB1177; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1177;
	4:XdITV4hI8L5etjF+5YculmPIhNcGZwoTggfA3dZyBnjuoELPoRiDwzZmH/3br/4Uhg8x0XpxsXb60LOGkbBvbuPeqZ0XdpnJGz9pEclg8rpo2VIHF0EjBjQpqx37UV5UMg50vF/lgQA9c99pISG3qjvGTofu1ZsLF8s1D6Q3GQk/nKmTUVl+qM+Pj3YFHteM+lkXLpx75fBsRhH0nvyzS8IbO8QGe1YkU5iuLYsoSYScxDzJJv4tb7bmNAbuwQTQvR3quSfmBsyyTESK3I/xXY9UFqtpfEqE+kg/0yhEVSk=
X-Forefront-PRVS: 06515DA04B
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1177;
	23:SwR7oeySadD6Zo5wX0kuCrvj4tkaaKWOJI/0STb0DlL5JIM+RzNSyKG+2qTw1AFycwZ33rkIm5cI8EXRH3Loaj3khiBckMEVunqkycI1TwIdYNpUnlW4SQ4k3yUAzDkpLPZoI6BrdCBX7XaplskCIlsjojp8/c6CiWjk4XwDyHh4ZUO6VOMyUh/o/i1/Fcda94EikChUfvStcR8zS6LzPTf/6JzRT/IOalLvf/7UoeSlJO2JHi4wNgTntqpOE3R8wECXlFb/MSAgO7QpUWLeoEwahRcqVQ/BzH9WBUDjkAT0iSifiiR5WP/d88Gpyi/S0wPLyv0DfqqsQmLmfIadutiWbquCcOQjXLbxwVRO0XSu3EXo3q3L5pceNkfi+JKVNHcr3f+gu1IPYP+bsedR1VAHXFk0xx/O5U99B5H342vOX3Z5xn4tavfBCZCfKjwCHlKQ1Ylr5tEMq5aqBWfkY15SCypoR2L4BCayeN8X2SVgl6Zb/6N0awBk4+g2wRg1F2cUDMGPlSFKINp1mlv4SRQmHILIwbD+sfxDbCyI0UzLC5qxVjOSpDBmPEYbuQxiHI1CgvnceNo9G4m+K+xEwfFKXgdcZxNDR3rULzcrTEO5WQCbYxN1wtlejErE12y2zaX+12u5zZicu68LqSuCkaRjpBlTA1aWkGT/F3spIVBI071djvX76yeI3VmqQ1GUnZKx153eEVbiDuLyEI5VrTddur2E9RUMBwNaIcWfKhY+C9jmY1c7zMO6GuhadrkM5Od/FhvIdHG0Ad+ob1n0Kbu24ffb95T6tn9NHvsyFn2IRgt1R0h8j1MSjZ6MGkdNuQzYW4akHM2b8G7YdCCyFw==
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1177;
	5:dCq88Lt+MsZifN182pMjCcuChKUMIjZunH3IZKZPlibl14vUoM2zdvVBoZotzuy2x+wCMAOCqbVdxpSi9oDAQlXOyoi3whcVmrCmGREn6eoqnc1xMEQ1SPaYQtLTd8wbDTV2QKmKzpMSRo6Z/QFmzA==;
	24:8lQyhkKI00X2GodODwrBqfOL01GQG16U9E4Gdqf4YCpOEYDIMSkJE8IYlqRWRbcNG6N9u1NrK/azAlPF2+KKgK6jQquK0dc1q5pJivbsSmY=;
	20:EOd6S6pLxSVojPJSf8ka0w8+aUFbny4oSF0WvlkGbLFsVXSgf284Ds8YbHzePw5VcVjRaTxyjGyrNNVwx3n0Fw==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2015 09:58:28.7005 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1177
Subject: [poky v3][PATCH 0/6] gstreamer1.0-plugins-base: Add patches for Gstreamer 1.4.5 base
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
X-List-Received-Date: Tue, 28 Jul 2015 09:58:30 -0000
Content-Type: text/plain

Fix id3demux issue

Handle audio/video decoder error

Update video alignment after video alignment

Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF, keeping buffer writable

Gstvideofilter use new GST_VIDEO_FRAME_MAP_FLAG_NO_REF

Don't ref buffers twice when mapping

Keep sticky events around when doing a soft reset

Yuqing Zhu (6):
  gstreamer1.0-plugins-base: Bug fix for id3demux issue
  gstreamer1.0-plugins-base: handle audio/video decoder error
  gstreamer1.0-plugins-base: update video alignment after video
    alignment
  gstreamer1.0-plugins-base: Add video-frame related patch
  gstreamer1.0-plugins-base: Add videofilter related patch
  gstreamer1.0-plugins-base: Add videoencoder related patch

 ...rame-Don-t-ref-buffers-twice-when-mapping.patch | 26 +++++++
 ...frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch | 87 ++++++++++++++++++++++
 ...r-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch | 69 +++++++++++++++++
 .../fix-id3demux-utf16-to-utf8-issue.patch         | 54 ++++++++++++++
 .../handle-audio-video-decoder-error.patch         | 66 ++++++++++++++++
 .../videobuffer_updata_alignment_update.patch      | 53 +++++++++++++
 ...p-sticky-events-around-when-doing-a-soft-.patch | 46 ++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  7 ++
 8 files changed, 408 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch

-- 
1.9.1


