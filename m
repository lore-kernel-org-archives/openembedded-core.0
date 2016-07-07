Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0047.outbound.protection.outlook.com [104.47.2.47])
	by mail.openembedded.org (Postfix) with ESMTP id 08A73606D1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 00:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=q3wkWT3dSnvxcNzAxAWpjYuJkmP2tCceCW6netBxGkA=;
	b=nO+a5tM/1h3+Ve7qZtLNmofEHI3nGzdRXa/ty6OwQpmcZatEVVsb1TVWFRIL6ZwQb6rBk3l0X+UaICTDNkYm5P5tg6Cvl3l1Fepi2K1diQYOW+HoKnADI+0+QWWh4PavLA5alpQb10NYNidl3RqPq88ZsEriGiKdd0kVC04aK8M=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.1) by
	DB4PR04MB315.eurprd04.prod.outlook.com (10.141.239.150) with Microsoft
	SMTP Server (TLS) id 15.1.528.16; Thu, 7 Jul 2016 23:28:43 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Jul 2016 18:24:51 -0500
Message-ID: <1467933891-16460-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.1]
X-ClientProxiedBy: SN2PR17CA0017.namprd17.prod.outlook.com (10.169.188.155) To
	DB4PR04MB315.eurprd04.prod.outlook.com (10.141.239.150)
X-MS-Office365-Filtering-Correlation-Id: f1fd7391-13ff-4758-7fdf-08d3a6be701f
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB315;
	2:ebCukPbdEY0wOnt9gtu13gSt07z/g+I6Yvr+D/fGk51F9t9lie1orONmMYv7uIuOoKrkui8jeW4jcOR4Ro40SRGTDATwKSVdsdVLMsEWcZkYmlpkA8Q9hSGpi73BJs6VcjDC2u/QbRBDJDtAaoESj7Y7xriVC4w5c18EdvZ+yt+McHkzTPdiRb6uB8Hmjdws;
	3:44xbyHa2l/tDKRl718+f6OHc1T2wPEZ3MIV4AVK7xgoKxsQ7KbkxBzv2E+y29mOb0/McsSrFOlLMhcZnNFKVDnNcH/uEFmcdLrDEZnmlekbhI0ObbcxTefe8vCiGr1WU
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB4PR04MB315;
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB315;
	25:8X2Ll4EhAd60mrKiyjubr+q9ZTZoOsldQLWiGNnmZvdNFBa9sCwU4Zeg1MgBPM5S1BOdQ+Ss0rFK3w+dNWiq8Sq1Cq8aF4x89SW9+somS/Lya8Em7zS/8HjaYX+Q/pGDvbYVio94c4fZbccHMiPN4Vk4cF6u8WJcMtfC8H4swGpUKEl/mVQObv9ejBWpHckLLn1h4jSYHYtD9WJt4AxuSvDOdQWz/XTmu64kBGk5I23O5PMyfL1FGCEp11Y1e05LGWR0munOPvqR5Ce7rgZ6fob17As+X+pVssjVMd4EvdgRhtcZNg6FHnfdnhic5Qiz6rkLCw7tcPKvaNbx1GuP7WKM7LGGIwduAC0WA4Ym9sA76oVvQqUIOnZzkDyKGsZKmalcqeGs7G1jex3wixFu3zZMYyXAMz5OxJir5UR4H3bbaH/lzY91m7xIFL7EUVJMW4t5d690NBYIGmaGJMRDLYaRCuYZY8cXJFFOr0ZUdjXTqCRxcZkswT2KbhxMICul8Ly4APAV3wZ6UsUuCsXyJPETJYyi7zUOW5Zy/j0dwz8/agQY5VY+q9jns0z4aqrgiQsfnweKfVPmkvRtbu1z2e0Ux+dZgMyyrOQ8Zv+XF8P/xSXzXucKAk5JzoQEuwKTvhcZ1W9b3ur8wcr0+PVJ4uRkbY50wOETS2GeRGVq29lKjdBQZlXEwIBA8yHv045Wb1vMzM8fIqvmmGulxOymygwZ+awcjKuQ/rL4dqujfsY=;
	31:ySXKuRUmkmX3PAxMuMID9rl0F8s2CciwK6BSOe8C9Ig7ld3AjZwQWMGLPET28PT17Ds599mowltr7J97CpxgpmDNzuqhGBhGMjlHcmQz9AmhlXueLXp/Gpl0HeVVN8sn2I71IOv2uvj9Tq7Eu8vRb2glV7G+tYada+e1L3aNW2EM168yJ9F8sMbOR+HoZE/XAWffBglrO7H+AkKk7cIoog==
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB315;
	20:6ks2vF7MyJMF5tdjo6CncprmDVJzOJrYF7kiRODcjsNKUoCqskM6s5CqjgIepn54z350UZ0VISdI+gJVX/GqVpqTkk3e2vP7EbcG85k3f1nn73hQaQxkY0w+lZb4/f1GyUE4R+MepBuCxZoWPv6eBmXejiQtMNnY37pDMqmvZjRx3Q+tu2Vx+RxXckEvBtdacX99BT2ge7KnjyMJy9wSrRyrW6A1SKO/tRGGSbstifJRSBHcGG1L1mT1xvFwpsWwO0ZSA60yTuDmBzpOf2a9Pw0eh6SCFXE5NUYnoUT5c/A8dldkPrNFUeGSvWSekeXjyKZb6BYebjErOEm5t+n6lYBK0TYOCtS+dXYZUX4V3WN/tBsvXiS0iwQ2GK9C0eMi/s1xaYNcaP6zDweNfwuvFwxMY+hF8adsGWJTN/eyfrXHtwJV+4I/jLBlnoNM1927kMlzNI0gVyjc3J4FQvqHcE1DMPovMMaqju0pxq9KOKNMN/AcMv7Q9KYDfev0GPC/;
	4:Hj/NL5ilT3g+cR2NMAFOE5BL++APyP0p8WvySY+zd3iKR9Oiv/1KtehnbU7M8P/FscaECnlvTlMw+Qx1/ifcX8ucF7w1e6Cezkad9wZCpYkAEJNRgpQ82ros7RszT4QVfJM/UFCfeCBDEjaimtaMK6ry/3gLuueqYB6Iqu3JtrNdIVn6hfPAYKy0mtAJbRZUrnaxyAJFbjO8dxZ38zEkkL1jf93DFJ6R6OrbzBxiusb3zQIAuQmtKwkb4ku3o0g92Of2E410817jLUbVHYFJN8mdWPKq7bjgRTbn0Pdxcdb5UjytutWJzZZzmCRSUctDnl5FSIFztDToQODRdRbomaaDusK9U+4U8/HPp2Pwt+ECcBROIHz20kkRiTBacb/KVHUA6RdeC+utzjjuZIRysDvYzLU8lYH9itMxQR/iKszRsMkHUxz4PsdWyDfLkgnU
X-Microsoft-Antispam-PRVS: <DB4PR04MB315BE6F4BBD5D09A8A2D5B9E23B0@DB4PR04MB315.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:DB4PR04MB315; BCL:0; PCL:0; RULEID:; SRVR:DB4PR04MB315; 
X-Forefront-PRVS: 0996D1900D
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(199003)(189002)(8676002)(7736002)(2906002)(110136002)(81156014)(33646002)(42186005)(97736004)(450100001)(48376002)(230783001)(81166006)(92566002)(189998001)(305945005)(586003)(19580405001)(19580395003)(77096005)(50226002)(106356001)(6116002)(105586002)(47776003)(3846002)(4326007)(66066001)(229853001)(86362001)(5003940100001)(50986999)(2351001)(36756003)(50466002)(7846002)(101416001)(68736007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB4PR04MB315;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; PTR:InfoNoRecords;
	A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB4PR04MB315;
	23:R/XihI4uRxn2nZfLyFoxUJj6xoZqXEcuJUt+qhQoAm?=
	=?us-ascii?Q?MNHxRnwS+81HEvCn+bNvutsZY7P9AHVwYXm1peBW8PoeuU4eNy5eupc6pizK?=
	=?us-ascii?Q?Gc2H9zRvCzh+gTQlknlR2je+gUW77AQ5zrBvgNg3jQcTNDTG0dPZZH5OCMzm?=
	=?us-ascii?Q?tGdCh26HPJ7lMXoeQOHq0JDqjzAB3k8fO433J2iMZaN3X8zlANRZys3CLTnh?=
	=?us-ascii?Q?VKNCsot9WF+PF1QQf503m5H9xy6o5TSsy+4dXfpyKom3s5P3G+wQ8pzZ4Rrr?=
	=?us-ascii?Q?1bKwmSoYLJbiqdglqfl13wLySoT2xYYMyjO3ZkhSt8yvayUxbZFjWa6IA+Nk?=
	=?us-ascii?Q?NcHyOjkdmAnVs3GzeCO8slzLsB6NOLfZguBhht97ec6s2SSeWgz7XKEJFeAl?=
	=?us-ascii?Q?aDJmbRa1134TKsbrQd0SIGHkhyV9i+xoHIpb4InVPGcg+jaVUqhC1X/AfZih?=
	=?us-ascii?Q?Ctn6cJouj7+cUvxSgq7g7wiQKCvHgw0ph1FPNRwefuTzOSxmEfACT6aejE8e?=
	=?us-ascii?Q?/7SLU7CflF68Bz70FjFHQu5pluMdfEBwL+seo4knNYWTaV1kTEJ6ZKU6Iz07?=
	=?us-ascii?Q?vH66edH2zgxqlssWMwEPAsgVowAXIq31D02569Carvi76dtIQvZ/r3yZo6LX?=
	=?us-ascii?Q?DQtQBbqcg41mpy9gOhyHoUbQAJBmh9wtXs/Rl1fBuo8S13bodZXPdhBJN0kq?=
	=?us-ascii?Q?GAokTqTuXlwVjfMbICqqDdS5vef0905ZSZBoTS/NP9+UGGmRYY5nAZrgFbWs?=
	=?us-ascii?Q?t4yDHvHwu06HugitbmeNV9mkFJsOT6ZBBhsARrhu7UhxXVrlMfYj9lXgVDiK?=
	=?us-ascii?Q?hYbrTkp/AwEjJVZZpRl+oPkyMm9XvUxiIN5ISA53jGvJ3PyBu+KHosuuPbaL?=
	=?us-ascii?Q?uBLpa+/IkmNoMQCyoGHKYyHufbWZEuAePDpaEfbda2yU98V2425amtfXptyp?=
	=?us-ascii?Q?9rpcCm9ob+dnMfs9sKnY6lWqbMAKCo8b7fGPooLDBe4JB8HjrE5CDb+NHIFF?=
	=?us-ascii?Q?8z8gF7NRqRL00BY7Gzt+rO571qRS0SLVwXLVqgu6mq/gHeTLeDGUWAI0H3Pt?=
	=?us-ascii?Q?1j1rjy+8XnQEhl3M4EFPv7S84b?=
X-Microsoft-Exchange-Diagnostics: 1; DB4PR04MB315;
	6:W9FPdrOHcA11vrvK7MFbcHaDhZOzQ5vPlRFyfM0HF2BnrGZVPaCGwtWDnJTzfxBeuLlC4jd2lKqxi0RdfWvAedJovCVZWji+5NMYmEGjuFlylwCcvHb4sHQDJ7VIRL6iejNWJqSWOcx16v+npDVZruisuTZ0nOYyL11L61Q5vzcqcSZ6tVX2iXf9H9d0wANsWakma78FW8GnpBJbUBe+EiqepLSUDn+FgSD7hNgIRkHaAAzu+elBEr/g3YDxut8V2tmSETuI7xF5y6KMtfmXYUXSHcoYS3yZPvRJ2X1w5eabaW48LPT5N6Io7rZjJigUDBdaUYq4m8eHDDWosT729g==;
	5:08/OtCgtbuqXeUxEDiXNfEq4T0zoQBJYYAI8hwuv/ef7hPb3bvuyYKL9KGAEzdtQx55MRcIHIDaUpSMf/wKR4smqvrTZrkEHtRwRxepgM4tdbzVPJc6yulDtTwDxFhc3Ce7xBCxjwOlIVWS3hg9vMA==;
	24:TelxauWBqTuIYuMX+1FU+Su64GiDuD99GnjdRgys6ECbzJvupQsXReqZANhcvDvD42m8MpEu1lpC3xhdmMx2Gw0AT9Wu4jmsp6hAxgkAnzs=;
	7:U2SZvX4fkwS1wLcQjrjQmwDarikmOhOjmGjFBMnP7vbPs7g+Me+v8MX2jzbpRcIIwtuA3vdGqH2p5+VnEMdhKZpHDHtsirXsEFl7q4K2hobcM5CtJNxYea50Yja/Q2kxR20V1mH/wjHPyZV8rh8eEqfZjkfkIKCPbdp4+CGCGBfzLGfwjqZJ1G+G4Lk7TltKCB2gsZM7tfvprtwiU0zR332uoatR7k8BkL7sqIHQufDgJqxDygBONvpXPVZNiCm+
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2016 23:28:43.9027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR04MB315
Subject: [PATCH] nativesdk-packagegroup-sdk-host: Add wayland-scanner to the SDK native toolchain
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
X-List-Received-Date: Fri, 08 Jul 2016 00:02:32 -0000
Content-Type: text/plain

The build tool wayland-scanner was missing from the native toolchain
of the Yocto Project SDK build.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 0c6a530..2c2abed 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -24,6 +24,7 @@ RDEPENDS_${PN} = "\
     nativesdk-makedevs \
     nativesdk-smartpm \
     nativesdk-postinst-intercept \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland', '', d)} \
     "
 
 RDEPENDS_${PN}_darwin = "\
-- 
1.9.1


