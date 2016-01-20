Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0107.outbound.protection.outlook.com [65.55.169.107])
	by mail.openembedded.org (Postfix) with ESMTP id 537AC601B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 09:54:13 +0000 (UTC)
Received: from BLUPR0301CA0013.namprd03.prod.outlook.com (10.162.113.151) by
	BN3PR0301MB1169.namprd03.prod.outlook.com (10.160.156.143) with
	Microsoft
	SMTP Server (TLS) id 15.1.365.19; Wed, 20 Jan 2016 09:54:13 +0000
Received: from BN1AFFO11FD033.protection.gbl (2a01:111:f400:7c10::174) by
	BLUPR0301CA0013.outlook.office365.com (2a01:111:e400:5259::23) with
	Microsoft SMTP Server (TLS) id 15.1.365.19 via Frontend Transport;
	Wed, 20 Jan 2016 09:54:12 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD033.mail.protection.outlook.com (10.58.52.246) with
	Microsoft SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Wed, 20 Jan 2016 09:54:12 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0K9s9RH004523; Wed, 20 Jan 2016 02:54:11 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jan 2016 17:51:34 +0800
Message-ID: <1453283501-3982-1-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD033;
	1:4o9QFka7vizikQuunFBHsBd41qinZvEqEgeUed75OSTOJrqF779heGiUq7xLYs1HticDOEpnCjtgsM0iN0pfWK6+sbME0QxX3YqjaNiYIr/XwBcwSYWNwhb7nwum7kGbKEI4kja2XPiucJs0vgBr0n7mVK7t/fHj30QHhBZi791738czCR/w4xVQrOwyc5GlTWXlxLuVhZFAqdcioeBlEZ9qkhmXFoMZYZmJfbyO3UeaG+qO2arTRPPVfAoR99gU3oOZ7teXRe4HU7+fqzB/BezZwSjOPLOLebNMfEkPX/TODHTIKtSuUfT/wCI8d+wKF5wonLhj+32a91HQ6rbO5N5VGvz7AWPYn8/+KDi2DgMTjtCVOL4bA3g1T1Jvor6m0YBXxMUQ4Es7M0ccGUuMtlUotcJHWyc63yW5KHh8HGgqJYjcvQyQywjrhcPYS02r
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(199003)(189002)(77096005)(5008740100001)(4326007)(104016004)(6806005)(50226001)(36756003)(4001430100002)(5003940100001)(11100500001)(586003)(1220700001)(81156007)(107886002)(110136002)(33646002)(2351001)(48376002)(86362001)(450100001)(85326001)(50466002)(92566002)(229853001)(189998001)(106466001)(50986999)(47776003)(97736004)(87936001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1169;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 41a92645-e952-4a81-748f-08d3217fa660
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	2:FsvKn7mZyLVOg2Atxkmw9Uanwu73GZmMpqbskRNv8L/Y3iF6TD/rGFAH8H5UsXa1yyfcSg24W7SpkfedlPJFjzzRZQZ7gIoFVX2SAIEpwDoxRLG2Wfd9iZn9URfiVsk+87onDaK6Na6/Rp6SvCD+Q5rpZBT2rqdQaSuRCH7EntoDI0rZdxIUhpZs/LyfpE8h;
	3:8QHStYyHxWNsCmKjakHDl/cL9SOtF/5ulZqghEUzJsYAtIhV2IDtve++vwmVYDy7FlMIzOdzriMchXyppcvqxRj8vC5B4tnWdAXzP62ytIkJSH0ZNcMrttOMA6CIiJ1zXC2xaoKUPIW6qJvFL2jnCJD0mcNOVx3ReeaT07EY95cTHLZqwjM4N1jDr737hiyWZbl/zRwRUAqu3Xt26qQFE/nMTBAiaoUzfOF2aQhEvDw=;
	25:gEVSesEhZ5drXlG4XuRC/jCtv7SNbn4O6uWeLmMe8RQFFpuCHVdjmZY/HO1jrLLTCIiNoVIvg0wx2I4Su9rcXsgzleshANwvpOpDmGWcGFS4xa2eBL6x/37zcD1b36hCGNTV86UpabxX98lnnwndJL0JgK8ILS6CCSyTaBNyF7N1tz9LBcx5L26mShpVDMQQva+nyZNiQjbYqsk9sun1dlOz7gZ6nkiueXPDgKdHVcwpPFhArlsCkRBVYLaXFKDJ
X-Exchange-Antispam-Report-Test: BCL:0;PCL:0;RULEID:;SRVR:BN3PR0301MB1169;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	20:HAJnJ9QhFYe2uqmmh1m1VKdNP6GYKPYuQ5H+PlciJt6bR6lt3smM/kPEFwxcvIPTctkCpJeSLAvJbFNTU5Y5cOuvFtGUDTpn64F4e1rryvM4lnVxjXRE+wxF0iWt3s9361PZNO0XzCaYACJykcAqDOdf9M9XHyJbUe/cLlGk0gL2esvOv6eB6DBh2NUVy4oQxHALZLsoI1g0XoW0Rv7U1qSISLHtwIA+DcPDSqHtWPfHRGYcI54rH0KlWSiAOT5PHkgGJ8LqBMXpR6u0nks1bO9tPbax7GSV4jQZIr87HDA6yKJVLdob0acaYHVoPIwL18W2UWcH7sm9shqp8LDcdC86LvSZLv9lDabt4uzOopMKpQlOrbYgcVvemtqqpOQemsPIl7oWk2FP6g6/NA0JVzEvEPV0tVOWJ6b33dTr5bI1wsdYmSR9dTAL1gOBqnVB
X-Forefront-PRVS: 0827D7ACB9
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	23:UtpChOJTxSjqYgDG51IkG655RwuZ3NTk9uYxf2xuzE0inydASWqnRd/1IJ5rkENldtDAv3HYuR5vbrO0znKcV95JzK6R2rFAaTuEYpatOY88OIZWqfN+ZYPyupAf003RxGdYuMde0sJN43SBGO9Y+CpEJzbgnuR+xJ9ze5vhTiu2zmPFonbiVY+4wEVeXeerbjrun5/LSRKfe/cErpUCk0f93aOR4K0NLspuhiiydTA34HZoslWf/3T7qFeqK0X4EsrPnTwftUKxGhsemYZgWb/dXyFoylKeCfsJq0woHQC0S82vnao21PMsgv38mV0bikvVpKiOTUMb9hONj16nQfFEzzKvlWqrbtoElXhcYMNCNohhUvIDRd1n/6DFkxaume0szwvx1C5rQdoh9KxrHBnXUuGndTpYtysvSqfWWzhcxx903QVHK6HJUn+UH2nJvcbni5Yz2JrrvrFkSY1jl6ZMXfc5Kd8llOwWssNo4YlJ6DTN8OZ0vH1gF6HBfSUC7fjtHoHv7MUTEjdvaP656xhUldDzbRylS3xmTWwUHvYnD4JD5B/sxSvlrMGITHDUYMcqX+45N2M2QWHd7Vef+RHNgwfu9B/Q8SJUZIp/xteyc3FXFbopMxxTwkOiYSnMoO68qUzLQvhg26rKagoNdRzQVw0u2Oqp1kFnZ7Ku3Slnw2GJQQlyCxk31DDA+CKHziKaD5ODQLulZxXkUrWwBqw0fm4a6cI3zWxnezz7tsiWPBqCMuz8R3D6+xoyEHbXWs2E5+tJCWCepfztF6trIsSAg/gbsh7a8z+Rg8oo/Urg5sAF9DMFEq22/UU2ldebuuh2oRZ0tL3VTCodzx9bpdtSLTRiYOCkcvflYCoCMM5okSA/PnPaEMTZetnrqzvZtSbe/TTkMBqusE6TzLePYJhZZmbfJ/rbU8jzaGO1kMWIVVqJTdpj+tAzeWMcBJkc
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	24:UtQ8bqKvpQRe0Vh8/rl+auHPsPNAtAuJ7HwqE93GuXJadbmZIflISjS4phORf/F5zcjafsCfGYCAHI+4JNE9+2a5/W2j4I8Twm6koIBI0U4=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2016 09:54:12.3402 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1169
Subject: [poky][PATCH v2 0/7] Add patches for gstreamer 1.6
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
X-List-Received-Date: Wed, 20 Jan 2016 09:54:14 -0000
Content-Type: text/plain

---gstreamer1.0
   Correct the setting for FLAG_DISCONT when push to adapter,
   in case audio decoder subclass can not get enough data.

---gstreamer1.0-plugins-base
   Send taglist if no valid frame is decoded util EOS.
   Add video crop supporting when convert frame.

---gstreamer1.0-plugins-bad
   Need to set right pid if pid is 0 when create streams.
   Add detecting picture coding type when drain.
   Fix memory leak of navigation thread.

Yuqing Zhu (7):
  gstreamer1.0: [baseparse] unset FLAG_DISCONT when push to adapter
  gstreamer1.0-plugins-base: Fix taglist not being sent to down stream
    if all the frame corrupted
  gstreamer1.0-plugins-base: Add video crop supporting when convert
    frame
  gstreamer1.0-plugins-bad: Need to set right pid if pid is 0 when
    create streams
  gstreamer1.0-plugins-bad: Add detecting picture coding type when drain
  gstreamer1.0-plugins-bad: Add detecting picture coding type when drain
  gstreamer1.0-plugins-bad: Fix memory leak of navigation thread

 ...pegtsmux-Need-get-pid-when-create-streams.patch |  45 +++++++
 ...arse-Need-detect-picture-coding-type-when.patch |  47 +++++++
 ...rse-Need-detect-picture-coding-type-when-.patch |  47 +++++++
 ...window-fix-memory-leak-of-navigation-thre.patch |  35 +++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb    |   7 +-
 ...-send-to-down-stream-if-all-the-frame-cor.patch |  57 ++++++++
 ...ame-Support-video-crop-when-convert-frame.patch | 143 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.6.2.bb   |   2 +
 ...e-unset-FLAG_DISCONT-when-push-to-adapter.patch |  33 +++++
 .../gstreamer/gstreamer1.0_1.6.2.bb                |   1 +
 10 files changed, 416 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-mpegtsmux-Need-get-pid-when-create-streams.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-mpeg4videoparse-Need-detect-picture-coding-type-when.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-mpegvideoparse-Need-detect-picture-coding-type-when-.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0006-convertframe-Support-video-crop-when-convert-frame.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-baseparse-unset-FLAG_DISCONT-when-push-to-adapter.patch

-- 
1.9.1


