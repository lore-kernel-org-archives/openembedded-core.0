Return-Path: <alejandr@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0072.outbound.protection.outlook.com
	[104.47.37.72])
	by mail.openembedded.org (Postfix) with ESMTP id D2A9D7883A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 21:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=SvvzFAP4dkF6WJS7ZO8nomxGj6F2Qt1LGwQg2kMQeFM=;
	b=q8ROFt38JoEwHD0zB6d6SRxfCzZEBTgm+EaYK/Ooo5ox9o1+bHw1hPDug927JdcZtBCRwqxZXZrXqAHEmRJuqBTaDrJGVgwk/zyQHaqhHsai0r3a2Ad/4w8IfU2G3DE58jXJi5GJY/RxFkAJaAIjSPLri8DncvI8cQIaIdBEPJg=
Received: from MWHPR0201CA0094.namprd02.prod.outlook.com (10.167.161.35) by
	BY2PR02MB1329.namprd02.prod.outlook.com (10.162.79.24) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.444.14; Tue, 30 Jan 2018 21:09:51 +0000
Received: from SN1NAM02FT041.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::209) by MWHPR0201CA0094.outlook.office365.com
	(2603:10b6:301:75::35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.444.14 via
	Frontend Transport; Tue, 30 Jan 2018 21:09:50 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT041.mail.protection.outlook.com (10.152.72.217) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.444.13
	via Frontend Transport; Tue, 30 Jan 2018 21:09:50 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1egdA5-0000Ie-Pm for openembedded-core@lists.openembedded.org;
	Tue, 30 Jan 2018 13:09:49 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1egdA5-00034v-KM for openembedded-core@lists.openembedded.org;
	Tue, 30 Jan 2018 13:09:49 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w0UL9mk3003504 for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 13:09:49 -0800
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>) id 1egdA4-00034o-Q0
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Jan 2018 13:09:48 -0800
References: <1516648119-12528-1-git-send-email-alejandr@xilinx.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
X-Forwarded-Message-Id: <1516648119-12528-1-git-send-email-alejandr@xilinx.com>
Message-ID: <4ccf00a5-1a5f-bc37-bef8-b914823a7eab@xilinx.com>
Date: Tue, 30 Jan 2018 13:09:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <1516648119-12528-1-git-send-email-alejandr@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39380400002)(346002)(396003)(376002)(39860400002)(2980300002)(438002)(28163001)(189003)(199004)(5890100001)(6306002)(65956001)(64126003)(478600001)(316002)(31686004)(50466002)(9786002)(106466001)(8746002)(63266004)(8676002)(8936002)(36756003)(305945005)(6916009)(5660300001)(59450400001)(356003)(83506002)(81166006)(2950100002)(81156014)(47776003)(58126008)(65806001)(186003)(31696002)(336011)(65826007)(67846002)(2906002)(106002)(575784001)(23746002)(77096007)(26005)(76176011)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1329; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT041;
	1:x6hsGa4nrKE0Qc63DYfP7IZFgy1EkkCn01knWnEBdm/xnFYnCQ+mW78fs0WPwGsXa895MykriJ9oC9K6Hwe25BBnkDlg6S3rg9hwJgSGNk6VA6WspLR6puocJW/XUE6j
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39a3c7ab-07a8-46cf-65e0-08d56825cd01
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:BY2PR02MB1329; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1329;
	3:t+uMUmP5yFJf8vayV+HtWLts+Jke5wTGfAZAN1CM2smCAOUEnRBo2XObIQBckrEf3n/tH3eRmYEULpF4MUGp7LNbD51d0426Jl8zTyoo1dxBsal4xSmHPkloiVcvWgVizZFFk3PI90F5alxfZTQ6tKbj4aRDKr6q0b5yJLtJqohvXnOYHFlU0/Q0LZp4D6PVQ8iN0Ochbg0GoJ6OigrkDuMaUqQMA+7wyIFdpcDiIL9naecrJeAzA5AebP4NV1SklYdX+GpN/zY/gJdVnt/sJiNjk13+zaPHxORovD2ez1IZIH8UqB5+56xkdCnl+TcTVD61kU7+7CKYYWb6KhuWS78SxCL7nvhmEEr0v2+7kAU=;
	25:HOut8tOcyTzEpUeoeAOLNZFsUaEjVBwGyyEjKAfKv6vNtNcdLPbe6fqSkO4bXTY12JiN59drpdK3yBH+GQSx0gqMZZZtwPb9lH5Iyok8BYiijy80ktC13Cuw7/stHVbuNTmoeyec1jsePph7pIDGbEbEHS+p8Jv8/UIC5n66sU0dSy6gU5QEcB2FyOu9Cw1snhVWJ8k0WhLKJbViKN/N0K3sXrrAk4m+cVxQLfkztVJzHtR96M9+Q9DJzCzHxbxGEhWA0CxALx5/kYeeG+zjsSNp2k3G+Qf3eFLqR+x8dlpEdawTW2pmfh/eO7iHwb/mgrfbOPglchnzG0/uplm+pQ==
X-MS-TrafficTypeDiagnostic: BY2PR02MB1329:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1329;
	31:8v12uaTGUlVetoYdbuXbB/ITZe/hh1pf3uuwEyn6ilNwnE/+XzhQOrzLI743aLBTFSASGjEHzX6qlnLaXr2VI2WFsGYJX70GHHAQJKFvMrem9r6NLCwOokSlg9VTaCo23qPMIMKNyVnJDAJZ4Dr7Oycyu6e/8WHMYheiHcjfZUsWoEpOJEVgAFIUQoEq+/ymm2Ol5jkF7MiiK+nhK3k3sFsZAb1xwqapOo7ApRUGpbc=;
	20:XgXwRm3iWPw7/0Xn/2eGaC8UxSNtjbAK6Ai5llwfvGRDaSJnsOPP74DWYjXvufC8baanvs3bbhiIfIWfPZ1cPHii8JPLKXnAN0s2OwQwywurbd4GbGpA+YqiUvOxisvQVMWjkea9O1T/0ZXKaqf3iZoWJnwM21g1GtSFOKtREVslz4J6h6S6w99mZS/03FCr3ZqmuUimGJF1s0lTQ0nAU7xmWReYkZMdBLhb0RREvtP1hALIdkb9sqBVUwc00Xs7R2VJYcby6GfZpBtMvS9SXQlwXZ0Q9AVTLAJD+SMa+WAo7nQ+skx+/qYmFBN2Fk6zvrioRcUdxvqFUI/b3/uPJ/ZU1DUocBOTXHpmjOLDpTfkkx/pdfYXCMkOabnOgmV0GyrkeRBAOTlbT0ZZd7qVwiwKo+N94ZtsLPftfpCJ2AFKJiHLrg0hOmF3ncRXfSDr3IHMwizcUx+1cl4VGhpaC3cCb+3vt/bsGes8nY4Sb/WBo5S3ToTB4Xp4OteZsTDl
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BY2PR02MB1329E174579316E4AA506D6DACE40@BY2PR02MB1329.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3002001)(93006095)(93004095)(3231101)(944501161)(10201501046)(6055026)(6041288)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123558120)(6072148)(201708071742011);
	SRVR:BY2PR02MB1329; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB1329; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1329;
	4:6/EJmt9SCxPprwbI82XVnPLUveAZMY4ipQ9J+HBoyyHHizBXZEDHA4pKeC8YDUeMmxTcoJdhGtC0snCNMkXUA4v/GaMesTq3/Ut48vznkilbkFPQbU40Y74q5PXKs+U/y+uwmfJjUztYhEsn0p1wu5UOgUbQyW3gxcybli1iIGOSxSL/Nbe1zRifBRehR0kQow87VqdV3yjgLoh86qPoKgdeoic3+ZxZGpHJ0tVdmGw4M8AQxMw+BUei+EKzjm/8bra1JHPrKkzyuX4W5KiyCRYVaWfVaWVHUCpO5hl7c34sy63zLAaxyyOi0U/nOFMbtBRmGMNTc6oAyChvzglUs//yNAgrn3sCy1qpYSNawZA=
X-Forefront-PRVS: 0568F32D91
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BY2PR02MB1329;
	23:QaEzUt19Ql1hDZt2Rri+Uc5CMIzrabcwDDElA?=
	=?Windows-1252?Q?UDoyVueSmS5weR0GmhFyJJKy6xyVBkoCv9B8WUukMXRgCvVnwsFQm5K7?=
	=?Windows-1252?Q?vpN1uYPM+VfnAL0ABTKA+AWfKGxHID7E+uR/0KqeehZvIfsV6BY2G2xU?=
	=?Windows-1252?Q?xK0j49qr9cyXDkGH/a8xO3PmnxCHAvPz+LeVsUNLFCsS51ftVrm833T3?=
	=?Windows-1252?Q?0Zy5Ffa6YK8SrGGCq03xk8uchdffzVVMB98euTAO0y0yBP+4Hv8yu1MX?=
	=?Windows-1252?Q?aKwwYpu6Cb6V2+uCukC1/Uyw3drHFoXQc1ytZHSqg6w1VFUaAlbhvFRV?=
	=?Windows-1252?Q?qdzPadHBt3eg/xFkWECKAo6WNVwzdsRz72pVLXQCTDJc+pgF4+Je/LkG?=
	=?Windows-1252?Q?zfon66bStVAZv45bg/lCkL3hM2BsMB/z5MCqgj6LPfTWTnuDMBYHNmfk?=
	=?Windows-1252?Q?QWvfPqWLkNfUbDxi+3L2ZN7vBITR0Ri/VN2oHRNBD5SjbJ5qaQaiR9rv?=
	=?Windows-1252?Q?bwxtFUWF5jH1eOmB7Q1lj6MQ0cfDY1E7l10cqJsP3csYUY8DZlDC/w/B?=
	=?Windows-1252?Q?FtvrXCi0QowShfEWv0C/2vgvQnrrl4qwSghz94BOFfwYno3KkIcOg7wj?=
	=?Windows-1252?Q?ZHKN2oJSYdjgpwPyyumWRzpBFV0QmWzfQKkK/5+LH8Dr+lJIKxYGd3IA?=
	=?Windows-1252?Q?GvenINs6LTajvRMQCvOHXJJdbtVBP+YSUsKV8aaTruShVdYZpAjhdGxm?=
	=?Windows-1252?Q?Q3Z6+30I1+u3q0+JwLELYzu9fGMmbRjVtfoqaWXEnm7jYbo0sIHFQWSX?=
	=?Windows-1252?Q?HVKUlgigzKrzyhN0mZp8jZQ+McWCLygWy8zz3S7ux7eQ+/JUoA3fXcHj?=
	=?Windows-1252?Q?dQ915QfKtVfO6eDIaGVguBOIlDFxi7JyNXPmoNOy/aJsQ9Ti5wJReXf/?=
	=?Windows-1252?Q?kwf7nwBeg4E8SOt497x6JMJekOqUQFPbBE0q57CAPS09M2TC7O3+MUQy?=
	=?Windows-1252?Q?qzacpLXPScc3ryI54mgBFwPvj9hzybKx5pLs6sb/GGiqEwjEybZh5hWW?=
	=?Windows-1252?Q?7JmMYDbG/jjK6oaK473HJ4OdnD9KXKdDWSXw60rkZG5VboveKdKigOk5?=
	=?Windows-1252?Q?8t1yMpkt2ITuYd0xM0Hi//gZeYM28pGFle7klLUz3tafw51+h6B4dQSB?=
	=?Windows-1252?Q?Opn3Khkw5V7ruUGXniwi2MTcIPIYa4LH0PBBXFFW4AEzN2YkRvkbUPgm?=
	=?Windows-1252?Q?toQywegLEJppX65/A=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1329;
	6:ylEHrDq4Zwo3K4gofh03kVn7Me2t4QK/I6fRA0K/e+uAeuG+hkiRw9UB8Kr9mxOrrb97YY+h313suI8DwAboxHcdtO1uc8OH9hu/cTzDzq3c4vNHfvQVdFKtdAexetoTO8XeasupIvh2l5/GKTj1i6+snDCcI4hN7HG+GgWz2sQcv9Mp6zdFusEN/gPk2tvJzJpptPBNK051C7ZVQFfM66gE8bWQY5LARZhazQKzrL8yf/foXsdi2m3upEPoSYNsz6bUmRUCL1irAQSDL4ug1VLZALwS3WVP3GMdc4cCmCSO1vL3z2HdbCx3vhAXq3TXdVl4+QnlGQaCOvfoW0xAUB3UNuhZYh4hL4p6ZgxDdfA=;
	5:ZxtErEjg5HnKHlr08DuT/IYbTq0A0yXjT1fggdmqYrS/JclSAPJjaXQq+ajNTyRc44Ku0u66HhbPEkBTvnOzoL66lidcvOnD6S33VK+Iz4sjQKsFpX9wvX+7Ax2fgpnmWkKzmHzZLNqZVE37QFG4l0CW3wzSx17MLoe9mIIn+sY=;
	24:lw6sD1sxxDXx0LAijuTefX7WVcju4BdMHwIYeela1QcjQQBLplemtmP+l9X7qjEB7tWueQ5tsLtFB1yGxzUZ8/LrHhuzXADVmLgQSicwXlI=;
	7:WxbOYf3zzUdvFvtqNdFpUa2fXxz3jAT/uIf6hD2kr+MsMnELD9VugMVwuh86HDb9yVXm1e0vk/k/f/cVctAeAEZhqJ60icfOrz26H7FyZWdPWfyGu4LjTnCYKzeqSoymbRtueqaAc+Iw/O05gHcakJJQqFh6eTopMQTnXVp7a03LBp6aTulPS+SMvRKM7OivHLfkuxI8Jib3kzaSZVF50hxZBSZ/dLMZhhD6Y488mPMh0ZeRax51dxYBaAEl5xFS
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2018 21:09:50.3573 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a3c7ab-07a8-46cf-65e0-08d56825cd01
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1329
Subject: [PATCH] ninja: Upgrade from 1.7.2 to major release 1.8.2
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
X-List-Received-Date: Tue, 30 Jan 2018 21:09:53 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>

---
  meta/recipes-devtools/ninja/ninja_1.7.2.bb | 30 -------------------------=
-----
  meta/recipes-devtools/ninja/ninja_1.8.2.bb | 30 +++++++++++++++++++++++++=
+++++
  2 files changed, 30 insertions(+), 30 deletions(-)
  delete mode 100644 meta/recipes-devtools/ninja/ninja_1.7.2.bb
  create mode 100644 meta/recipes-devtools/ninja/ninja_1.8.2.bb

diff --git a/meta/recipes-devtools/ninja/ninja_1.7.2.bb b/meta/recipes-devt=
ools/ninja/ninja_1.7.2.bb
deleted file mode 100644
index 4d3b272..0000000
--- a/meta/recipes-devtools/ninja/ninja_1.7.2.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY =3D "Ninja is a small build system with a focus on speed."
-HOMEPAGE =3D "http://martine.github.com/ninja/"
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da81586a64ad4e476c791cda7e2f2c52=
e"
-
-DEPENDS =3D "re2c-native ninja-native"
-
-SRCREV =3D "717b7b4a31db6027207588c0fb89c3ead384747b"
-
-SRC_URI =3D "git://github.com/martine/ninja.git;branch=3Drelease"
-UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.*)"
-
-S =3D "${WORKDIR}/git"
-
-do_configure[noexec] =3D "1"
-
-do_compile_class-native() {
-       ./configure.py --bootstrap
-}
-
-do_compile() {
-       ./configure.py
-       ninja
-}
-
-do_install() {
-       install -D -m 0755  ${S}/ninja ${D}${bindir}/ninja
-}
-
-BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/ninja/ninja_1.8.2.bb b/meta/recipes-devt=
ools/ninja/ninja_1.8.2.bb
new file mode 100644
index 0000000..c6fcfef
--- /dev/null
+++ b/meta/recipes-devtools/ninja/ninja_1.8.2.bb
@@ -0,0 +1,30 @@
+SUMMARY =3D "Ninja is a small build system with a focus on speed."
+HOMEPAGE =3D "http://martine.github.com/ninja/"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da81586a64ad4e476c791cda7e2f2c52=
e"
+
+DEPENDS =3D "re2c-native ninja-native"
+
+SRCREV =3D "253e94c1fa511704baeb61cf69995bbf09ba435e"
+
+SRC_URI =3D "git://github.com/ninja-build/ninja.git;branch=3Drelease"
+UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.*)"
+
+S =3D "${WORKDIR}/git"
+
+do_configure[noexec] =3D "1"
+
+do_compile_class-native() {
+       ./configure.py --bootstrap
+}
+
+do_compile() {
+       ./configure.py
+       ninja
+}
+
+do_install() {
+       install -D -m 0755  ${S}/ninja ${D}${bindir}/ninja
+}
+
+BBCLASSEXTEND =3D "native nativesdk"
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

