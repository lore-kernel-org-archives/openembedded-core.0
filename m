Return-Path: <carol.zhu@nxp.com>
X-Greylist: delayed 1070 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 15 May 2017 09:26:19 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0052.outbound.protection.outlook.com [104.47.36.52])
	by mail.openembedded.org (Postfix) with ESMTP id D046B71D5D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 09:26:19 +0000 (UTC)
Received: from MWHPR03CA0021.namprd03.prod.outlook.com (10.175.133.159) by
	DM2PR0301MB0909.namprd03.prod.outlook.com (10.160.217.14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1084.16; Mon, 15 May 2017 08:54:11 +0000
Received: from BN1AFFO11FD043.protection.gbl (2a01:111:f400:7c10::159) by
	MWHPR03CA0021.outlook.office365.com (2603:10b6:300:117::31) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1075.11 via
	Frontend Transport; Mon, 15 May 2017 08:54:10 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD043.mail.protection.outlook.com (10.58.52.190) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1075.5
	via Frontend Transport; Mon, 15 May 2017 08:54:10 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4F8s0Gu005326; Mon, 15 May 2017 01:54:09 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 May 2017 16:52:36 +0800
Message-ID: <1494838358-28036-5-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1494838358-28036-1-git-send-email-carol.zhu@nxp.com>
References: <1494838358-28036-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131393120506404135;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39450400003)(39380400002)(39840400002)(39400400002)(39850400002)(39860400002)(39410400002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(9170700003)(81166006)(50226002)(8936002)(8676002)(77096006)(33646002)(189998001)(5003940100001)(305945005)(50466002)(48376002)(47776003)(106466001)(105606002)(2351001)(575784001)(86362001)(2906002)(85426001)(5660300001)(356003)(8656002)(53936002)(110136004)(50986999)(76176999)(6306002)(4326008)(36756003)(104016004)(230783001)(6666003)(2950100002)(6916009)(38730400002)(498600001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR0301MB0909;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; A:1;
	MX:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD043;
	1:B+vkz0QPBbPb1FhVLZ2J2XpDOIThBRO2bjktq9i6MgKiXmW77V+/OzlZw9E/fIDIuWGAqAXb4NYZnCv4WGzA3jJqAQdXcr8ZPLLPPSxmjQdLw6Q7fq8nR4Fbr3qUzYd3RPdBSX/0r3oWEmHRzz3yITiMPoTF9gKuxXEaHmOvVJgEDGFN8Ql2ql7AiWk/xHP1yvu2QuAAzK6txY0RUdDiTpU8Oqc2+96lIHV9LNrjFvD3dzLodK8MwkH2PoGXdMCHpP/42T1w8SgZ3LJtOiIbkfg1uIU/NHlvB18JW22pVUdW9WKarjBMEUdD8LD2p+UII1ggNwmw0A3vNoSfxlkT6hsfStCnJxUnZ+rknEKca8399p7pWk1jC6NXCzgsiCmF9JEFN7ynffjiqxRVpVgsOPoqcZIK/tikO55pjAcby+/2gt8O0OjHY+x+hJFLGGOo00wssQBOdZNgg6313OWHBm7eQRFJDmP5+LBJh0yDwMlkwGl9UQOCAhBvNQZq/9zK+7RmTg79xZK+s8f0uNZrGOs67W5gX7uKqLnK/ITte1nxv0mbxwLpr/qjgrI238Qppkhzp+IucCC/zVWMyeIMXATPlcTCedZcd6hRsFAi9xlX3Nhr7K3aXMQw5luK6t/GCnEbzE7acZZm5eoXHheeYaQjPMqzCFHXXFNdp3fpR2b6VpwWjpbcl3qrbNWZJweQ+6EMO56M1XvCzEpPvcqDs8E9/0exsMniMRnYnlZ+URk=
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17252f2b-a869-41ab-dd27-08d49b6ff42d
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:DM2PR0301MB0909; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0909;
	3:o8MPteDKnQx5q/QaoKvKm+9wA1QP8Mh7cDPzIQLMK4zAk9o6TNe4rMKErDTWZbmxl9HrmoaX7NC9SBJVERfPzs8uuYLk2Vb8EehThz8+nbX/ZoL5NwCpCmBrWXYQwiwjRMAcq5LwuxI9IYi3ecjN3pvsxNn5pqiKzU5udhuHJxvz/geT+tG2a1899kYQRkKeJaMxDCuQCii5wjYw6P8GzHd5C7qIEFFNzwcqg2y0hdxgv1yACGKHoFen1Vl1Olg9eMSpNnkR2ucpntoycgq3KZRxlQqbW64zB89HXOtsxUn8oiN8srCUrkkw+SMPuNpR3j1xO9Ygszedb+sl1sH0MxhbuYJhPX+DaDIppPhU+qKFyL+fPfd+cNSqN4xUYIRF1h7E0Sh76X4h04AYDr17+OU9udmCy3UflAG/8zFVqHQ2MjDMIg/H6sPeH1Q6Yx3A;
	25:njy8c0fhWL8fjuJp5hCosU+J/X2DEXIiPuirg3N7zvD+2AjksBWVitgmliY8d+HK4N+dOZKO/z/cPFyxsuChJ3h9olUCG1ej0Qhr7Ob0jrsRBR0arczIsShFgsrKxuRgQiHn0yRENi9mL3poQl55DB79nf5GycRPhfVe5rIjx5g4fbfIe6LjuUEPfixpQbbziECuWKAu8yZfDeX0ki41iNIPNT89sRXyhQKQbpRVSKiAmd1/S8fGA5rfdyaLWi7i0YohT3KN0A7tQYko141CUq+irxqa8xYRkLSW2Ggx3rBREPvvaIVJd+fuTnRxq3ef9U7QvoSTpo/v9u/l3QNJ5iFv1DHmGEx6a7AR2SBc9oEZE9CoOx5EvjvRyRlIiL0YHXI+2a4y6VeBhUozVvedoMjpHeLfIILBWEiNsWgcG8NkUOs4HaeLjrV5MgbHwwGvWYZ7fGugLx/pW/fBiTx9/g==
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0909;
	31:r+K25yFK6VToyKT6XAcpa2mUHHMWS5pGK8dHxlR+IsgZx7wnMIDc9VPkkujkslRPkfwr3LaRY8WMvHgdV8vvnJmtmlqacuaqkprWGSiJ4rdZF+ROp/jZ2X0L8o3UMeWM5IKO+2V0u+UuAM2THplqcBrqV8QwVNshRPFxVzWZKoqUcauKy+8cQgoBgsI1xra9hd/avKglAe+iBEuyYnAERtUska28kN9U7TJGtbOUnlYLnDnYudC1dhMO+fmBwzMp
X-Microsoft-Antispam-PRVS: <DM2PR0301MB09095C630C94BAA033343A1FE9E10@DM2PR0301MB0909.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(13023025)(13018025)(13024025)(5005006)(8121501046)(13015025)(13017025)(3002001)(93006095)(93001095)(10201501046)(6055026)(6096035)(20161123561025)(20161123565025)(201703131430075)(201703131448075)(201703131433075)(201703161259150)(201703151042153)(20161123556025)(20161123559100)(20161123563025);
	SRVR:DM2PR0301MB0909; BCL:0; PCL:0; RULEID:(400006);
	SRVR:DM2PR0301MB0909; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB0909;
	4:KyFUHdGOzP6nbxf1PaeVFRSSPpNgEWZYt78wuJAC?=
	=?us-ascii?Q?03qRR/xYJ3p5wM1iBP28Qr5h3wIoMSkDrzRl9BWOBf1jxDYyjd5zov47aDdR?=
	=?us-ascii?Q?CPf8pfIz+h0L8Z1jODIgCZpUN+92l34nXUKx28gW//k1Y8C5EjJn4U/Qrliy?=
	=?us-ascii?Q?xMmCM8yrgoDhW/z413kJAQmGMk+Cnc/P0CZHPBfC8zPvWw4NvgYcZbJNZDWO?=
	=?us-ascii?Q?Fd0qFdqLhHRtox9VoBmXRCJzD4qAEXTya+l4ttgwv/VytE1495ICg9GW/qLX?=
	=?us-ascii?Q?HTv5C6WT0l4CYbaxtXq8oPuePQ8hKjq5vDw42bcMJOPpqaWrEc0NuNW8e7fC?=
	=?us-ascii?Q?Wf4fgFcnMPgelan6QI2dw56HsONZTmlGQ5lBKNj4wDLkNHzK60YEtp3++N0t?=
	=?us-ascii?Q?oHxrzFPXPpBNkmg34facSryOs7TT3sHZjdZ+s71zNNnKkeiu1Ls2FqSxYhH0?=
	=?us-ascii?Q?v6NzLCFtENMfBH8m3NhFXWkGo6PLX4owyFGcHfS2HVQGCXue0qVrArdI4QJs?=
	=?us-ascii?Q?QG4F3yj6PqVLra1K49VRe4u0JqRQ3za5z3SrKfN6mGz9lrW7pU83QpBle7C2?=
	=?us-ascii?Q?mjPh0jrKXMHiuRdxHf9DWM+tAVzBB9cTvD/lybJD577O0leVTH6FI6kxd/DE?=
	=?us-ascii?Q?ZAeMlI3JSyOkxb/87dea9C4u31LlBlUmhjSXU3AqKENd7RdSoAmT0Hem0yUm?=
	=?us-ascii?Q?cK3rYKB/Xes24oRBAJ0SmjExqjFYNdcw+ckoyByJnODixFw+yAzFcwL9Ghon?=
	=?us-ascii?Q?B4ZU7CBy/IeAVM6OjQP2bWwhla+WALxDxg6G8B7RaDkuo9VjAvdQgr120fNA?=
	=?us-ascii?Q?arOqOIRBQzsF8NtECNFelwZlriOZnzIduy+yNHMFlPq1+ZSxL07HvoR4Zkca?=
	=?us-ascii?Q?iRaUn3T0o9ws9zm+DA28Mxq/Dd3BCZfKfrio4Mgdp9ZsAWtCGnezloJpFqg9?=
	=?us-ascii?Q?98TE2/YSh4+8ZUjoWN2hMVyTqah1RRgx1vq8g4stqA=3D=3D?=
X-Forefront-PRVS: 0308EE423E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB0909;
	23:/3+BuJzoJa3jG3BDRH2ot4jpx4CQIdcwY6967eq?=
	=?us-ascii?Q?IUeYSpn7mugLkK675IxsRW2BSbS/VSKqV70b26klDfdsV/vq5CK0xth2C6/b?=
	=?us-ascii?Q?KTRhvANH7XzAsCm7grGmCl27CdWBifc2E96NHwa8l8l3b7YTTHqHARhkHCe3?=
	=?us-ascii?Q?2dGg/8bVib0TH5TlhqANBTfIcDdtkz4Z9NOF7l24M3eGqzdjl235WN7lwbM1?=
	=?us-ascii?Q?9q5g1zPgJjSnFrddzm4qdSmEF9SbTJKl+qtFEPITWerjOH8KminEnuHWX0nK?=
	=?us-ascii?Q?IV2zo1bsXg6sRiewwRoh2YvyUoEBVgfvVs6QIPH8m82OuX7JxKd1TagHEzba?=
	=?us-ascii?Q?enM2LGQlAAfBtZiigxoQkqUVAsOd/yOzd87zRIsj+vRYtFlOZJq/BAV9WXZx?=
	=?us-ascii?Q?ZZ+1nUyaMt3eIefSwxCh/Mtb4LlUSOnDVcRrEJZjyss5KZ28dI9OD7F6oxkG?=
	=?us-ascii?Q?GbsVgztnubqsvLaNKmyOa8kahJ17HVuDIQP7ahgmj9UEw6T7K0Tojo5sPDvu?=
	=?us-ascii?Q?WGDRfgZ/C9vEccHtz3u4Wgle0CA4qQEMwSRMxMJFIzC1RKO1/EP//c24rvvf?=
	=?us-ascii?Q?gX6P4orsQpxESPcj2/L9b0ifsXOllOeJDlASfTwYzYOrjE0wr0zSdCQ0Nkt9?=
	=?us-ascii?Q?LQnhR2xcdhWAhF31k/IRy28svg0tWOE2qSrQX3EDDDDEKygIxwJmA0/BlDNN?=
	=?us-ascii?Q?Xyf8uA15cRJe5sC9eqJcrMtpOui557oTZgpajBJbbyqCM8k+1UfYj+Uhf7tw?=
	=?us-ascii?Q?h3RECtEyp98dYzNVbuxDH97ad2eqBdRbNiylwUp4AdZqEQk5AXotxUEqv1WR?=
	=?us-ascii?Q?E8uBtXqAhmThXgwsQkHwnLpFgsNo0BoLfX9c3fXOzrF5Sx6nQxPSPxYdfrZq?=
	=?us-ascii?Q?7sSiMM/TIEIPBAy1ImFkecH4ZO6DVj7TDpyJ9KmQJPlmgF9bTvTbLnvSPfnB?=
	=?us-ascii?Q?oVgDo2nnOPZJRY5lHwA//SwLGGk77aodT/1of0VTC5s+ZR2XvXGSNPypwKE+?=
	=?us-ascii?Q?vONmBvOWJIkV8ej+/PPsO7ElkInpqstCC566XEp9536qLwOuHnFeFecY+a1V?=
	=?us-ascii?Q?c5cNUJwu8gSTiWlfqGu0JJhBW6CwGwSdFEGTFmuDB5e85l80VsA/mrDsCzHu?=
	=?us-ascii?Q?7pXoJov3qr2oAz2tXTr1D9+rrWPMOu4dHBq48Jzvl8SC6D1iXYCfVnRJC1Bm?=
	=?us-ascii?Q?MLwPX7o8MBcLCgd5tj6cR3KMmH7v1hpUDo75PTXR2Gw4tT23QqqIJWf5uprz?=
	=?us-ascii?Q?b88kpZTclmkttec539ckl0CSo1oAQBtjWNQx3qyI4tjinQfhcfRzCicnFAlS?=
	=?us-ascii?Q?3tg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0909;
	6:XfnptjOPLa5+oEtiqq106o6urR5V3PCawwFmgGZgWIkkhEhxKwIaqYIyWCFxn+HhWBo348zDHqZ98CKBo+RHID4hZcy7dTZnOzQG4bSos2uuk3Tj6qZCeP3qdqu61KLQIn49gQTfmX7v+xcIisFs+9Yg5604pZOfiM6vZ75Gr32F6//O/KP/jnw1OCmD0KldeCd0HvoEKpdNcXRWvuIAqc6x/wJCmyMgyWsIRm51FPhIFquvKimd+5BQWtQmpHznAhHwWc6vhuKxAPE22A/0dk7idM+Wa0sGczmrZcoWQAsUe1bIsZG9XxsqR5iWWmhHSSDX7uQea3GCPWjlxjGbz5gLnnnlWp3eh/+7RYIb9afIjN66JaNnTtmMT4K0Ll50S9bARhzdYMib9YwcnsA1josSfBGAmQE2m2NenI71iiz958y8PdWreg8YIEitOTSHlq7S88B9v3e9HHSioJVGaM0y56mNqIzujenwlqIgffRywE1hh4EG85jFTTI4K44UnIEGxZsV+0vE44JM0QEEtw==;
	5:+1bf3fBre/X51Kg7i4/obnJhVKt3szm0+zc2U+5sMcDf2POV4YdJOIUgn9ERk9JOSFN+AwlE1fPuxeQRtMtESQ0PPcLTnwt/RrjusAvx7UzEzqLzYDKsCQWZ334FqyF06pn2CuUVeoBthFsq2JlSw1P/jarGNrzYe3JZ55kWFVveK2MBkTWfbnRJn9bU7W6W;
	24:uvG8zndRiCSMVzPC5/OCt+lGczIvARwrQNtenqTUhEhcVcVVYEElFf8MI6kh9uqTmro9/IRvZf75OaVOSBg4490XllarFfA91Qm+M6o90qM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0909;
	7:CBH/Y3V2OaqHGcRX7HB6cyutgbaAlhYVeL5YFBVnjAFyKv1kDo1a+yRS6sOVu6RRWgiD0Tkklq35qHTGjoQJvovnliMkRwv2o6W/+rWoTcb3/lUGdLlZwI9G7WcyXjmvmZ+Ou7OVA8Cfrbr1ac9nTSJSm+9i7mMWCcrn/iug8ETRXdbtn3IEDD41DqlRpEzLldWDPz6cH03BndYpXmdDd0gyaBaXjuccUfGEcX3oucj2QaNLRGWR2OkdsnP8bgH8mhkScSGlpgc3tTBRCfjErz2Ws7UwuO4WJtLpJo2ut+2jZSACYIEaQ8C+kpq974TThCxLWNm0N0w/0w0GlaivBw==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2017 08:54:10.4844 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB0909
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH 4/6] gstreamer1.0-plugins-bad: Add overlayvideorenderer video sink
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
X-List-Received-Date: Mon, 15 May 2017 09:26:21 -0000
Content-Type: text/plain

- Add overlay video renderer "video-sink" property, so that can be set

- In create_video_sink, it returns video sink instead of always NULL

- Add new renderer_new_with_sink() API to set video sink

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...layer-Add-overlayvideorenderer-video-sink.patch | 138 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |   1 +
 2 files changed, 139 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-player-Add-overlayvideorenderer-video-sink.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-player-Add-overlayvideorenderer-video-sink.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-player-Add-overlayvideorenderer-video-sink.patch
new file mode 100755
index 0000000..ba5dd27
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-player-Add-overlayvideorenderer-video-sink.patch
@@ -0,0 +1,138 @@
+From 2437386711abdd866ec46d10a8bf48072ffbaaad Mon Sep 17 00:00:00 2001
+From: Lyon Wang <lyon.wang@nxp.com>
+Date: Tue, 27 Dec 2016 17:13:58 +0800
+Subject: [PATCH 4/5] player: Add overlayvideorenderer video sink
+
+- Add overlay video renderer "video-sink" property, so that can be set
+- In  create_video_sink,it return video sink instead of always NULL
+- Add new renderer_new_with_sink() API to set video sink
+
+Upstream-Status: Backport [1.11.2]
+https://bugzilla.gnome.org/show_bug.cgi?id=776490
+
+Signed-off-by: Lyon Wang <lyon.wang@nxp.com>
+---
+ .../gstplayer-video-overlay-video-renderer.c       | 38 +++++++++++++++++++++-
+ .../gstplayer-video-overlay-video-renderer.h       |  1 +
+ 2 files changed, 38 insertions(+), 1 deletion(-)
+
+diff --git a/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.c b/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.c
+index 7764d43..411dd3a 100644
+--- a/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.c
++++ b/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.c
+@@ -40,6 +40,8 @@ struct _GstPlayerVideoOverlayVideoRenderer
+   GstVideoOverlay *video_overlay;
+   gpointer window_handle;
+   gint x, y, width, height;
++
++  GstElement *video_sink;       /* configured video sink, or NULL      */
+ };
+ 
+ struct _GstPlayerVideoOverlayVideoRendererClass
+@@ -55,6 +57,7 @@ enum
+ {
+   VIDEO_OVERLAY_VIDEO_RENDERER_PROP_0,
+   VIDEO_OVERLAY_VIDEO_RENDERER_PROP_WINDOW_HANDLE,
++  VIDEO_OVERLAY_VIDEO_RENDERER_PROP_VIDEO_SINK,
+   VIDEO_OVERLAY_VIDEO_RENDERER_PROP_LAST
+ };
+ 
+@@ -81,6 +84,9 @@ gst_player_video_overlay_video_renderer_set_property (GObject * object,
+         gst_video_overlay_set_window_handle (self->video_overlay,
+             (guintptr) self->window_handle);
+       break;
++    case VIDEO_OVERLAY_VIDEO_RENDERER_PROP_VIDEO_SINK:
++      self->video_sink = gst_object_ref_sink (g_value_get_object (value));
++      break;
+     default:
+       G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+       break;
+@@ -98,6 +104,9 @@ gst_player_video_overlay_video_renderer_get_property (GObject * object,
+     case VIDEO_OVERLAY_VIDEO_RENDERER_PROP_WINDOW_HANDLE:
+       g_value_set_pointer (value, self->window_handle);
+       break;
++    case VIDEO_OVERLAY_VIDEO_RENDERER_PROP_VIDEO_SINK:
++      g_value_take_object (value, gst_object_ref (self->video_sink));
++      break;
+     default:
+       G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+       break;
+@@ -113,6 +122,9 @@ gst_player_video_overlay_video_renderer_finalize (GObject * object)
+   if (self->video_overlay)
+     gst_object_unref (self->video_overlay);
+ 
++  if (self->video_sink)
++    gst_object_unref (self->video_sink);
++
+   G_OBJECT_CLASS
+       (gst_player_video_overlay_video_renderer_parent_class)->finalize (object);
+ }
+@@ -135,6 +147,12 @@ static void
+       "Window handle to embed the video into",
+       G_PARAM_READWRITE | G_PARAM_CONSTRUCT | G_PARAM_STATIC_STRINGS);
+ 
++  video_overlay_video_renderer_param_specs
++      [VIDEO_OVERLAY_VIDEO_RENDERER_PROP_VIDEO_SINK] =
++      g_param_spec_object ("video-sink", "Video Sink",
++      "the video output element to use (NULL = default sink)",
++      GST_TYPE_ELEMENT, G_PARAM_READWRITE | G_PARAM_STATIC_STRINGS);
++
+   g_object_class_install_properties (gobject_class,
+       VIDEO_OVERLAY_VIDEO_RENDERER_PROP_LAST,
+       video_overlay_video_renderer_param_specs);
+@@ -145,6 +163,7 @@ static void
+     (GstPlayerVideoOverlayVideoRenderer * self)
+ {
+   self->x = self->y = self->width = self->height = -1;
++  self->video_sink = NULL;
+ }
+ 
+ static GstElement *gst_player_video_overlay_video_renderer_create_video_sink
+@@ -168,7 +187,7 @@ static GstElement *gst_player_video_overlay_video_renderer_create_video_sink
+     gst_video_overlay_set_render_rectangle (self->video_overlay, self->x,
+         self->y, self->width, self->height);
+ 
+-  return NULL;
++  return self->video_sink;
+ }
+ 
+ static void
+@@ -193,6 +212,23 @@ gst_player_video_overlay_video_renderer_new (gpointer window_handle)
+ }
+ 
+ /**
++ * gst_player_video_overlay_video_renderer_new_with_sink:
++ * @window_handle: (allow-none): Window handle to use or %NULL
++ * @video_sink:  the custom video_sink to be set for the video renderer
++ *
++ * Returns: (transfer full):
++ *
++ * Since 1.12
++ */
++GstPlayerVideoRenderer *
++gst_player_video_overlay_video_renderer_new_with_sink (gpointer window_handle,
++    GstElement * video_sink)
++{
++  return g_object_new (GST_TYPE_PLAYER_VIDEO_OVERLAY_VIDEO_RENDERER,
++      "window-handle", window_handle, "video-sink", video_sink, NULL);
++}
++
++/**
+  * gst_player_video_overlay_video_renderer_set_window_handle:
+  * @self: #GstPlayerVideoRenderer instance
+  * @window_handle: handle referencing to the platform specific window
+diff --git a/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.h b/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.h
+index be09113..8a96e84 100644
+--- a/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.h
++++ b/gst-libs/gst/player/gstplayer-video-overlay-video-renderer.h
+@@ -41,6 +41,7 @@ typedef struct _GstPlayerVideoOverlayVideoRendererClass
+ 
+ GType gst_player_video_overlay_video_renderer_get_type (void);
+ GstPlayerVideoRenderer * gst_player_video_overlay_video_renderer_new (gpointer window_handle);
++GstPlayerVideoRenderer * gst_player_video_overlay_video_renderer_new_with_sink (gpointer window_handle, GstElement * video_sink);
+ void gst_player_video_overlay_video_renderer_set_window_handle (GstPlayerVideoOverlayVideoRenderer * self, gpointer window_handle);
+ gpointer gst_player_video_overlay_video_renderer_get_window_handle (GstPlayerVideoOverlayVideoRenderer * self);
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index 732fc2d..82cd91c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -21,6 +21,7 @@ SRC_URI = " \
     file://0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch \
     file://0003-player-Add-configuration-for-enabling-accurate-seeks.patch \
     file://0004-player-Add-get-track-number-media-info-API.patch \
+    file://0005-player-Add-overlayvideorenderer-video-sink.patch \
 "
 SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
 SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"
-- 
1.9.1


