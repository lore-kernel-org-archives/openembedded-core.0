Return-Path: <carol.zhu@nxp.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0056.outbound.protection.outlook.com [104.47.32.56])
	by mail.openembedded.org (Postfix) with ESMTP id CBDE571DDA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 09:09:53 +0000 (UTC)
Received: from MWHPR03CA0014.namprd03.prod.outlook.com (2603:10b6:300:117::24)
	by BL2PR03MB161.namprd03.prod.outlook.com (2a01:111:e400:c0d::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1084.16;
	Mon, 15 May 2017 08:54:08 +0000
Received: from BN1AFFO11FD027.protection.gbl (2a01:111:f400:7c10::159) by
	MWHPR03CA0014.outlook.office365.com (2603:10b6:300:117::24) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1084.16 via
	Frontend Transport; Mon, 15 May 2017 08:54:09 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD027.mail.protection.outlook.com (10.58.52.87) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1075.5
	via Frontend Transport; Mon, 15 May 2017 08:54:08 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4F8s0Gt005326; Mon, 15 May 2017 01:54:07 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 May 2017 16:52:35 +0800
Message-ID: <1494838358-28036-4-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1494838358-28036-1-git-send-email-carol.zhu@nxp.com>
References: <1494838358-28036-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131393120488219067;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39400400002)(39410400002)(39850400002)(39380400002)(39860400002)(39450400003)(39840400002)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(9170700003)(230783001)(575784001)(86362001)(85426001)(5003940100001)(2906002)(104016004)(8676002)(189998001)(356003)(81166006)(5660300001)(50226002)(8936002)(50986999)(6666003)(76176999)(2950100002)(498600001)(110136004)(38730400002)(6916009)(47776003)(305945005)(6306002)(8656002)(33646002)(53936002)(36756003)(77096006)(4326008)(48376002)(106466001)(105606002)(2351001)(50466002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR03MB161;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; MX:1;
	A:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD027;
	1:oy7eIEgTDfPy6IvaCK+OKRMtBOSteH2Axwy0ycQmqo/sGH+0/TjaFJkShRZ/pGjtZxGKVkDHxWhzQ3uwAInopc2NLi/tcFG55mqRU+S7rMSU3iaFxY/q8saClaPgi5AKttOHSEhyRzyfH6Q8vcOQpq7DPoH8uyKX/ycVx2u0i8MBkaKIQ6GVnofuk8teqbmL89hrcyKb+cbQg32qV/WO9NwQD3YBWape4Dk+1fz7SYsUHmi1+ct2oj/G4PILmWMDfl1iKgIwQP+xFTKBFSQSiPj40LiFvJtPRQmw8btceQM+iTJ5c3RwNaLWlItppCGrDJkFX1AJjZ2yOHZKIHZxpCZOMMiwP8X6Z6qLs1K8UtIs7HKkEieYKTKdloP6gRIwgOM8mGRJ59jvkffz8MrA2S58LPNcwBw35ccqFUzM4ZW0gy5GGJVzg6JUwk7fBP6ABhgPhIatQazIhTSMPIXX03R+ekw8E5JELGeolj+gGmGXrpqj6tWRfhAY5l7iVl3mTb0WerO/PbdW9i8NoQvr0E5KVrNzxN0Q1YkobwwzhNGQpv7E/sMjzkKMffjsva2kTH+WCtFSrZxhGg6kq1+mo9a1UzGpwDH3qwMJujcukU8BuYOHdCug7CaC9fNtDSA1YyLzg81DfFMxiE9wYsF9mNVTSIwy81LpZpEens6Y1Dg+SlOTgMGRkRIwLnfcywM6Won/JO2tjqjVxlZbKCXyxX06m8hn6GkN8dpT2Iv0GVc=
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66ddf07c-5dbb-4e8e-005b-08d49b6ff316
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:BL2PR03MB161; 
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB161;
	3:MS+kCnGE2f4FJ68zOM9M6T3Ako0ZtaQ8s8m5/kvPnRm1pY50wWUb9jSv+vGvUs5eXbNLM/Ytex03F03bAyAbt64ObetEoQz0ufAYlmVvYVOe35EF3/hATpy0zT5fA5u7vmt2i9VcP3Y8gc0dkG7zHyQQSTNXrAcdNd4SYPMmVfTiwlUO3DSJWjLKA8AbfIn/NVkALGL9kIschldzMSuZkUJtd9dQ+IjepBh03D3Gc/n+mCJdJxJES0ovPMaFayAlT/mdQLXH7bqhQT48rdX2NRWcOmgTOsIT9gCMBuVsV2rXpP1pxWNrkmMiBLDXwCx1FMVVV5pyyQl0SrFBRIrFs7B6XsIdKmeTelUdB+0nB0IwLTKihUoBZWw//3W0kDUnCI7bb4xK6XADnvzaFzVL5YigtA7MLJwDuwx/gINtNYUjrdUnoY9YxGRDytunFV8k;
	25:4KfE0ntb/S41/UBro4XzbfFgqPYCLVH6VJ0CAx1Rca76ALdD94tNfRS/dsIKwY11/WDFrGgb07T9xxGN3DaNFUCP5eVw5RIObiwXmvEJ1X+Df0uJgnfQ/1WoxH4jNKNCM3X1NhlphfBXUWI8papcqLM7TjGJQOA4UkD+uyR7OSOhcMaVwP13Jxdo3anA794RcTISkW3gTYQmKx82sQB/R6lDnT4wD1k7O4X761rgcmHeOhvfU3xwY3hj4MeMnykj5g9KHWohyIMySKL5BpAAmr5N8uwk10JLiQzTS0H1OOhCK8p7lI3u4j0qbg8u1GbamWxJL49GAwFsXAbYdw1UQjIFl2BtaQOQq/rrMXdeMhhplomJ2FXR1xB/yr7Ew3w1zgK4hSPWMcJknlRjMpUsMomZMOY8s02dKtgdOjh7n5vzh8nYzlkpH4amTbWN9XeVEXFkXs4GAbDNHorcAC/HSg==
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB161;
	31:WyvbyvKp6Sl1C4774JxiQ9aEJ3TAODrB0DSVQ6UMzkrbk9u4cMrpjdlggUVXAZGH5LBHflLhSYxuFzbBBgzXOqyMn6GhFKNqnm0Yl2Vgs8bG2PqfancY+qnjNtD/uxoEsWYduLxZEx5fcudGbxXz36b5c7rwej1L9TzJVkmapjijpx/p1eVYSPtsbDRYMiKNyKzNKYoJQ38wU1M7+a0OfXrd7gx2MeEZyOjQwdPumZp4je9Q3sm8r/nBNcQDZ4c5
X-Microsoft-Antispam-PRVS: <BL2PR03MB161E6E66A775D5245531685E9E10@BL2PR03MB161.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(13018025)(13023025)(8121501046)(5005006)(13024025)(13015025)(13017025)(93006095)(93001095)(3002001)(10201501046)(6055026)(6096035)(20161123565025)(20161123561025)(201703131430075)(201703131448075)(201703131433075)(201703161259150)(201703151042153)(20161123559100)(20161123563025)(20161123556025);
	SRVR:BL2PR03MB161; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BL2PR03MB161; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2PR03MB161;
	4:GtEYC17oqdzrE7uBUSmooEhT7EE0fGxIb2kaYx023g3?=
	=?us-ascii?Q?l93YjkM/3kPxafqyzKgAF3v6rNcLjC9g43ePK+5X4SFLFb6u5TFA009Rn3gn?=
	=?us-ascii?Q?lQRYhpLvZRhkwxNca3p89ii8IFUO7z8yr9e78LwwqzPFG+ikwmQx6ty2ocHq?=
	=?us-ascii?Q?FNlEeoxGYMfAbHHVf7EE8Ff6R7LNMgC/IWAAVUGenzsxdOlWBDigTnVAwFzM?=
	=?us-ascii?Q?UaTiaDbxtMD5pbDjnzzIkT99sGNG/9PfRM9kW7tkUpchOSKzjjcTTzb5IJRG?=
	=?us-ascii?Q?2AKpT26Cjm4RZjjDwF8Ayq5YuGsOYlmTMB1rWo9GD62WnZewOR99SY/aF4en?=
	=?us-ascii?Q?g9pChcd6SvReotn++VgmCiAcbufZyzhzvUvRO/v0/F13LBNAX1R8loCgVwX4?=
	=?us-ascii?Q?jHDliWfA1i71iUl/1PkFJAav7rcb136JYZXRtyM7G5BHtfMcK9RpGdunp+J6?=
	=?us-ascii?Q?87WYesrYa061dPpyidgGXOgyWKmxCKB9woz2b92NjfhAEC8WhgHHA9TZdIru?=
	=?us-ascii?Q?kZ2YUmXdePaKgsFgVhkPmrWisvfZ+mHTDbFXFy4HqvDY3jaGJEgUZ+wk4zFn?=
	=?us-ascii?Q?vx0sFRKugnHYOQg+6ALr66XsZXlu69NH/+sjsRw9uF2FNvDynhKH3M4NtqC5?=
	=?us-ascii?Q?skJl6RwVROWt5yoVVCWMewz50APJyH1eIn69eB1PxWvEsKEaCZSEPVGI2FRp?=
	=?us-ascii?Q?WlO/c3UsL+JAz9Xg7JlLB+SFLBfpAwppHsPs5nZNzJuvNB4nyCp5sBZKRWN2?=
	=?us-ascii?Q?b4sN5E0oTbjyethdB0CXqnhq9jdvjCZ+B95UPN+yRLmTj2uUqjmkXlTv01am?=
	=?us-ascii?Q?lr8z/JvcXKT/KloarOGnY6BMRSbKChRkpjzun3f/ja2bEvnPlQzi9Fyc7iM3?=
	=?us-ascii?Q?8HHEg6nKlrIG4Uu7IZGm/9yXh5p6TCPIoCm5B74luZc8LhtRkRfbRhcNxLYr?=
	=?us-ascii?Q?OT3PAoFW+nck5Y1nhlCTb7HxkBmSxVeBC2hsOfg=3D=3D?=
X-Forefront-PRVS: 0308EE423E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2PR03MB161;
	23:Lb0/n/bRAi9Eb8oVMP/0IvteP/FzCjaS5pPC/popxz?=
	=?us-ascii?Q?WMlb0F91IucioM3AQtZc/yyKjD6NGTW27WqFawKay5IAko+KmdnSFomouI4s?=
	=?us-ascii?Q?8DmhiUO9yFmdEpGYDrUKC8Mti8+Vn5RgQVx9Usjs3IO/Qqr+5Ud/MfBkQZpQ?=
	=?us-ascii?Q?mxMdFFbYgYBDPzmtIHpAw3/Zs53F5EUl0+dmt0wIs35781OKj5sNMztHqLSN?=
	=?us-ascii?Q?DWmSSQvfaZbnGSuZfpExbH8AvMQbGDe+2XPuIis4RuUkHOHhAJao51SdSd6I?=
	=?us-ascii?Q?fPcLs9ewTE0G7TnDDwgaxor1bI7q7AZb9WBRxYUpSm80H9c9eNiDE0a8wMVJ?=
	=?us-ascii?Q?88Yo1TL6x+NMjerPWNHE6nzBsD49PY6+Q8MU7mJU8W+76IucMCzv12ozbc5/?=
	=?us-ascii?Q?DKyZ/hesgWmZvdtLXxyHdChS03Cla+Ax/VG7Fbetgm9unsnUqZIAE9se8Yya?=
	=?us-ascii?Q?Xbt52I/1fLe+mj5e1kYDWV04xjuthPeNWV/A0/8lgDoYH+J9ucSfnGxX3zSg?=
	=?us-ascii?Q?5CbtNxJLmc9O1exrTjHxWEmzo7Zp94XtopbwgzAEpm56z679jPKTZk6SzNm8?=
	=?us-ascii?Q?3i3x/SXW+iI9qt/MCQGR6arGcR1e1+Otnqtenm4P5H2KDkuyNYDgALkLkrZM?=
	=?us-ascii?Q?1S2hsJhe4CQBzE4cYTkPvZEZ/4BPviLmBsbOalzBO+FJX0R3DMBprscXj+b9?=
	=?us-ascii?Q?SbFVmk7b7c5Demp5mhozYgKCyhaXs9g5y0WQf+XbJROP3ZvUTlHRIhhpNHok?=
	=?us-ascii?Q?trkJQd6PSJFNEmi+lm7ACKlKhHzlOfXtGK65Q06Scd8msA1fa3R+ms8xofwO?=
	=?us-ascii?Q?ZzWVo9/XymhI0ac0/maeDss961hx9XpyUKMOXYCkvi/uGEmF+8+YXK6X1ebJ?=
	=?us-ascii?Q?SbEYiibgEftKK/nqplcIwSEpQyUVQPyfyGJXR+2ZQate2CwBuN7WUYcXRqbf?=
	=?us-ascii?Q?0VF6/LJ5m0UxYVppkRLA5n/IgrmSyzQYUL7/BUe8Smgm4r2KpJqF0ptV9YJ+?=
	=?us-ascii?Q?n09+pRe2YbBNgbPbr5ovPfW68XgFD1TRzCz4A6x7eqg56k5/NCbFNz1YV5X6?=
	=?us-ascii?Q?uhoLsnK0BCW24cPJRcd+3cZtU11NPZ/+QoHpfXk1PFQp3kG4DZgQa7gWjxrz?=
	=?us-ascii?Q?IN/0j5vn+puvX7VxutPEsPu9aM7iZ5veAHE2/+Qb3ZdX4tGNGQGSe2rCCm3W?=
	=?us-ascii?Q?Fhg5NDCxGZCnayRIWq25bVQ6ZMH+CkXxR0gThuLMUn++/MJDdPRjB0yaD7SJ?=
	=?us-ascii?Q?AT8wQ6dMOE8gj99eGc6nsAZBcVP2RQalSQ9/QYKSzmJS/PZRWAx3+/unojlQ?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB161;
	6:f90WSDLnrB9U/MECt8H0mRYV56vTAXdpkV81EZUq4QetofNvfHgf9jNQ15X4f5xRVTlLu/i7khPS+A1jiJSPmtERPmOnbfxkwfgn7O0HIyHP0tjmRWmX0DW1ZcWtHrCr9swI1zghG3/LZ7RJiFGW8Ga39x76iEqGyS7Q36HUClUIU7NP+9mGWnn8bDdxorYJ7Z5IuNlcyK/YYEfDBfYDYsLoCPy7j9YfBdjl95oRbHQM00mJPGpVM48lwYiEqV3mzUFAqRfGyaH9/OOlk2HhXEVEvHTn+uBCQM0Z3dP8tQzhqnWGjmRleZoaunsZzPd41pHIeVxH1TwkZEKE1g44Gst0yE7GUadW98jNcjKUSr9TTgRlHYabxe5lLLACfIlMFvwUQdTL/nqM7iaKZADDXJpR6Hc8aSWj/feV3OUU6k0wig30ejbkBHIG4vdx9x2T0luF9hpcfG9zZXke4MAGESM/NFPfBqtJybO8VR7Tg9e1OesZ5bEOcomZX99lKAhqU9wN0Xil4yFruTeK+mPdnw==;
	5:huUNx48zfhGg+V7UV7m/3bOYutvxWkxhyA7/4dGaHxIg4galMlSOTdOTPkbmW9ZJLNkxDKP74Dc/KrAEbsHPRXhu08ZveO0b41s5H/pM4yr729EC0pT2pnYYMX5XkjDN7xn3G8XdC1QohdpnODVYxWLkIfmFc1zp00sCPaH5uLSPlocU9VdlDlYySSED5t3z;
	24:TzMFRf2cAUfPfLg04wUFP9w4YE1JjdUBm09rj7XK1Nn3Ef/QZ2X3K6z4qZqHnkSJAbzRPdZBWml1ADfRzSXomylgWDiz0R391A60vkpneHA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB161;
	7:fpLaO6xxbu2rDoKJN84IctWUo+v6cFSlhJO/X13eMHvShnlaj0eC0uA4GKRc6nSloLHEyNxWnFIpmCFJ7WP36WQ15jGJ96RQfyfBJB9LhJ+DNojPFHKZjmejJ9kfcbCirzOC0RVRVZF363jJW6xXXjijDkEW3H22uAzhkoyO5TtI91ZM/2I4SrXTBASdrUYVxngoETM8eAzmcgLoshvw5tihhQ0tRJNJeqy5kytXe4BajMTxqetWBCyYQEOzuYaVoOmxMupYnZDq2ctHDdKcOZcxZmLbjG++n1plPKV+AM1sXFzUzbtin5fvehTsyOqaAIgBDGtd66VBWZu5h166hQ==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2017 08:54:08.6347 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR03MB161
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH 3/6] gstreamer1.0-plugins-bad: Add get track number media info API
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
X-List-Received-Date: Mon, 15 May 2017 09:09:54 -0000
Content-Type: text/plain

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...layer-Add-get-track-number-media-info-API.patch | 126 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |   1 +
 2 files changed, 127 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-player-Add-get-track-number-media-info-API.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-player-Add-get-track-number-media-info-API.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-player-Add-get-track-number-media-info-API.patch
new file mode 100755
index 0000000..82e05bb
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-player-Add-get-track-number-media-info-API.patch
@@ -0,0 +1,126 @@
+From 573142bb46ea5ffff78bf0672923553877c9726c Mon Sep 17 00:00:00 2001
+From: Lyon Wang <lyon.wang@nxp.com>
+Date: Tue, 20 Dec 2016 18:20:02 +0800
+Subject: [PATCH 2/5] player: Add get track number media info API
+
+Upstream-Status: Backport [1.11.1]
+https://bugzilla.gnome.org/show_bug.cgi?id=773570
+---
+ docs/libs/gst-plugins-bad-libs-sections.txt |  4 ++
+ gst-libs/gst/player/gstplayer-media-info.c  | 62 +++++++++++++++++++++++++++++
+ gst-libs/gst/player/gstplayer-media-info.h  |  8 ++++
+ 3 files changed, 74 insertions(+)
+
+diff --git a/docs/libs/gst-plugins-bad-libs-sections.txt b/docs/libs/gst-plugins-bad-libs-sections.txt
+index 77092f9..8515556 100644
+--- a/docs/libs/gst-plugins-bad-libs-sections.txt
++++ b/docs/libs/gst-plugins-bad-libs-sections.txt
+@@ -2064,6 +2064,10 @@ gst_player_media_info_is_live
+ gst_player_media_info_get_image_sample
+ gst_player_media_info_get_tags
+ gst_player_media_info_get_stream_list
++gst_player_media_info_get_number_of_streams
++gst_player_media_info_get_number_of_video_streams
++gst_player_media_info_get_number_of_audio_streams
++gst_player_media_info_get_number_of_subtitle_streams
+ 
+ gst_player_stream_info_get_index
+ gst_player_stream_info_get_caps
+diff --git a/gst-libs/gst/player/gstplayer-media-info.c b/gst-libs/gst/player/gstplayer-media-info.c
+index bba8ea6..a6c17c4 100644
+--- a/gst-libs/gst/player/gstplayer-media-info.c
++++ b/gst-libs/gst/player/gstplayer-media-info.c
+@@ -791,3 +791,65 @@ gst_player_media_info_get_image_sample (const GstPlayerMediaInfo * info)
+ 
+   return info->image_sample;
+ }
++
++/**
++ * gst_player_media_info_get_number_of_streams:
++ * @info: a #GstPlayerMediaInfo
++ *
++ * Returns: number of total streams.
++ * Since: 1.12
++ */
++guint
++gst_player_media_info_get_number_of_streams (const GstPlayerMediaInfo * info)
++{
++  g_return_val_if_fail (GST_IS_PLAYER_MEDIA_INFO (info), 0);
++
++  return g_list_length (info->stream_list);
++}
++
++/**
++ * gst_player_media_info_get_number_of_video_streams:
++ * @info: a #GstPlayerMediaInfo
++ *
++ * Returns: number of video streams.
++ * Since: 1.12
++ */
++guint
++gst_player_media_info_get_number_of_video_streams (const GstPlayerMediaInfo *
++    info)
++{
++  g_return_val_if_fail (GST_IS_PLAYER_MEDIA_INFO (info), 0);
++
++  return g_list_length (info->video_stream_list);
++}
++
++/**
++ * gst_player_media_info_get_number_of_audio_streams:
++ * @info: a #GstPlayerMediaInfo
++ *
++ * Returns: number of audio streams.
++ * Since: 1.12
++ */
++guint
++gst_player_media_info_get_number_of_audio_streams (const GstPlayerMediaInfo *
++    info)
++{
++  g_return_val_if_fail (GST_IS_PLAYER_MEDIA_INFO (info), 0);
++
++  return g_list_length (info->audio_stream_list);
++}
++
++/**
++ * gst_player_media_info_get_number_of_subtitle_streams:
++ * @info: a #GstPlayerMediaInfo
++ *
++ * Returns: number of subtitle streams.
++ * Since: 1.12
++ */
++guint gst_player_media_info_get_number_of_subtitle_streams
++    (const GstPlayerMediaInfo * info)
++{
++  g_return_val_if_fail (GST_IS_PLAYER_MEDIA_INFO (info), 0);
++
++  return g_list_length (info->subtitle_stream_list);
++}
+diff --git a/gst-libs/gst/player/gstplayer-media-info.h b/gst-libs/gst/player/gstplayer-media-info.h
+index 7ffd6b4..6866ff6 100644
+--- a/gst-libs/gst/player/gstplayer-media-info.h
++++ b/gst-libs/gst/player/gstplayer-media-info.h
+@@ -175,12 +175,20 @@ GstClockTime  gst_player_media_info_get_duration
+                 (const GstPlayerMediaInfo *info);
+ GList*        gst_player_media_info_get_stream_list
+                 (const GstPlayerMediaInfo *info);
++guint         gst_player_media_info_get_number_of_streams
++                (const GstPlayerMediaInfo *info);
+ GList*        gst_player_get_video_streams
+                 (const GstPlayerMediaInfo *info);
++guint         gst_player_media_info_get_number_of_video_streams
++                (const GstPlayerMediaInfo *info);
+ GList*        gst_player_get_audio_streams
+                 (const GstPlayerMediaInfo *info);
++guint         gst_player_media_info_get_number_of_audio_streams
++                (const GstPlayerMediaInfo *info);
+ GList*        gst_player_get_subtitle_streams
+                 (const GstPlayerMediaInfo *info);
++guint         gst_player_media_info_get_number_of_subtitle_streams
++                (const GstPlayerMediaInfo *info);
+ GstTagList*   gst_player_media_info_get_tags
+                 (const GstPlayerMediaInfo *info);
+ const gchar*  gst_player_media_info_get_title
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index 6655a86..732fc2d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -20,6 +20,7 @@ SRC_URI = " \
     file://0001-mssdemux-improved-live-playback-support.patch \
     file://0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch \
     file://0003-player-Add-configuration-for-enabling-accurate-seeks.patch \
+    file://0004-player-Add-get-track-number-media-info-API.patch \
 "
 SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
 SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"
-- 
1.9.1


