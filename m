Return-Path: <zhenhua.luo@nxp.com>
X-Greylist: delayed 10797 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 23 Aug 2016 14:37:09 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0054.outbound.protection.outlook.com [104.47.2.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2954C75E2D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 14:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=SoCbn3E2tLxxKZ+Tne7ZGwdLMFHjkSkFoaqmPERBL+M=;
	b=eT38LHW8/4G3hZkibY+BXxs4LzaXXiJph/6nuUkSk3gWQ4Nn+HZWi2dcFIUfi4zYbOCn+vT77yvVXXSWF2+E3Y0byg0j73EppyBaDUcIr6ZLbS3HWXAzjzMbIfkr8DQ3JE6CMvca+n7r7QBvmy48XvtqYTrF+YwfAF0NbLMsy9I=
Received: from DB6PR0401MB2630.eurprd04.prod.outlook.com (10.169.225.139) by
	DB6PR0401MB2631.eurprd04.prod.outlook.com (10.169.225.140) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384)
	id 15.1.557.8; Tue, 23 Aug 2016 10:05:26 +0000
Received: from DB6PR0401MB2630.eurprd04.prod.outlook.com ([10.169.225.139]) by
	DB6PR0401MB2630.eurprd04.prod.outlook.com ([10.169.225.139]) with
	mapi id 15.01.0557.027; Tue, 23 Aug 2016 10:05:26 +0000
From: Zhenhua Luo <zhenhua.luo@nxp.com>
To: "kyle.unice@L-3com.com" <kyle.unice@L-3com.com>
Thread-Topic: Problem building eglibc
Thread-Index: AdH4l/OrwL+NE4tVQxeq66YPc2rk4AEgFZhA
Date: Tue, 23 Aug 2016 10:05:26 +0000
Message-ID: <DB6PR0401MB2630D1365AC2C82F9079AF34EEEB0@DB6PR0401MB2630.eurprd04.prod.outlook.com>
References: <25D6125FB568F54699E315276ED4D36C614E19DF@SLXMBX01.csw.l-3com.com>
In-Reply-To: <25D6125FB568F54699E315276ED4D36C614E19DF@SLXMBX01.csw.l-3com.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=zhenhua.luo@nxp.com; 
x-originating-ip: [199.59.231.64]
x-ms-office365-filtering-correlation-id: 6bbd2538-4fd6-4637-8018-08d3cb3d014e
x-microsoft-exchange-diagnostics: 1; DB6PR0401MB2631;
	6:fW/tU76XohEkWhT98smIfKAX49or2NnDW/Vz0YZNwwYB0IxQsIAXx6FYZay7NAyzKCuxqaKtQ2Lhx1ntS5L8z6bfBGjHQ59Rdm1+DMgiHVRRmVJw1tbfhAPi4Pxq1Fi4Hb2GiMNw8sk+62LztbJXP1ZyUbsH4kQB+f2gCxekPYYvC6iET7sbIhJTpD9RGdIYIqX/Br5eDQU7Yy5BVoEt66loK++u8vJdifz3UOfBus5ccghRwM3ovCXqSWV7NeEncSIbnGMYUo1YUvlenVO0Iz4wPI2wH1Bkypggb23jBY5+9TAuB4G6BEF7ypuQuv9fsajg8hgicVktj4Rh/QmCmw==;
	5:TtqQs9c0/VKJRUXn3DcLjDAikRea8YiY1qbXc9BfdYoIbeZyHmtXhgqnAdn5wOu+5ivIJJjwbc2YjaWJDeVk0xMl5zrCRu4NSS7HJpDycI9h+p3qJrSQ9tgudWI5BWZaakgTkRDb32jsObElglV5Bw==;
	24:pkYFtWlCEcv9tWXjGr1n5HymV0bZGXOKNuyd3Vi1UVcXCkr/tDXXeG+l7XgN7K8qRFKdzUT5Iz8NsasClWwr/+pVigRC0Qz5+sdtl9M0dM0=;
	7:fEl931MzSjkxR7lfujO4E/3LXqQ3JHrDBMg8J9ToQWfieHF8oaV+zumSAD4vYrr473nok7apkKSxPlvVnuNfPCjmV74T9n+vbSjNqOsj0k0Dzc5UFG1qDJNRek4xq2VYrNjnfTmGZgVIRSu/OwNikMn3cuZl1lS/HqFlW6rCiM5zJsn9X6jg/BrLDz3OwCsO7iP+VevCJJOqaXMtfkeigA+wsTmi+fMxC4VCCT/VMf0TSKVpylWVip/Y7hxV7fnP
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB6PR0401MB2631;
x-microsoft-antispam-prvs: <DB6PR0401MB26316038D9CCA3D35D852BEDEEEB0@DB6PR0401MB2631.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(264703809997249)(21748063052155); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:DB6PR0401MB2631; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0401MB2631; 
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(7916002)(24454002)(199003)(189002)(377424004)(377454003)(3846002)(102836003)(6116002)(790700001)(86362001)(76576001)(50986999)(575784001)(101416001)(7116003)(3660700001)(5660300001)(19625215002)(54356999)(586003)(87936001)(11100500001)(76176999)(68736007)(189998001)(5640700001)(9686002)(4326007)(122556002)(3280700002)(2351001)(5630700001)(110136002)(3480700004)(2906002)(19300405004)(66066001)(19580405001)(19580395003)(74316002)(7736002)(7696003)(7846002)(16236675004)(7906003)(10400500002)(19609705001)(2501003)(8676002)(81156014)(33656002)(81166006)(105586002)(9326002)(92566002)(19617315012)(551934003)(8936002)(106356001)(2950100001)(97736004)(2900100001)(15975445007)(77096005)(5002640100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0401MB2631;
	H:DB6PR0401MB2630.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2016 10:05:26.3331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2631
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problem building eglibc
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
X-List-Received-Date: Tue, 23 Aug 2016 14:37:12 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB6PR0401MB2630D1365AC2C82F9079AF34EEEB0DB6PR0401MB2630_"

--_000_DB6PR0401MB2630D1365AC2C82F9079AF34EEEB0DB6PR0401MB2630_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Kyle,

You can try to check if the top 2 commits of libc-common.bbclass can solve =
the issue.

http://git.yoctoproject.org/cgit/cgit.cgi/poky/log/meta/classes/libc-common=
.bbclass
2016-05-13

libc-common.bbclass: Use sed instead of grep<http://git.yoctoproject.org/cg=
it/cgit.cgi/poky/commit/meta/classes/libc-common.bbclass?id=3Df99fb6a16781d=
543292558b1000014a0148da005>

Khem Raj

2014-08-23

libc-common.bbclass: rename ALL the packages<http://git.yoctoproject.org/cg=
it/cgit.cgi/poky/commit/meta/classes/libc-common.bbclass?id=3D65fa712ae9832=
4bc0182bc23b3bcdb957c3a21d9>

Peter Seebach



Best Regards,

Zhenhua

From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of kyle.unice@L-3com.com
Sent: Wednesday, August 17, 2016 10:59 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] Problem building eglibc

I previously posted this issue:

---------------------------------------------------------------------------=
----------------
On Aug 16, 2016, at 12:53 PM, kyle.unice@L-3com.com<mailto:kyle.unice@l-3co=
m.com> wrote:

Folks,

I am having a problem doing the 'bitbake -c do_populate_sdk fsl-image-full'=
 command using the daisy branch of Yocto with the freescale b4860qds-64b ev=
aluation board.

Here is the error I get:

ERROR: Unable to install packages. Command '/opt/QorIQ-SDK-V1.8-20150619-yo=
cto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/smart --da=
ta-dir=3D/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/=
work/b4860qds_64b-fsl-linux/fsl-image-full/1.0-r0/sdk/image/opt/fsl-network=
ing/QorIQ-SDK-V1.8/sysroots/ppc64e6500-fsl-linux/var/lib/smart install -y l=
ibgcc1@lib32_ppce6500 gcc@lib32_ppce6500 libgcov-dev@lib32_ppce6500 libgcc-=
s-dev@lib32_ppce6500 valgrind@lib32_ppce6500 binutils@lib32_ppce6500 g++@li=
b32_ppce6500 ldd@lib32_ppce6500 gcov@lib32_ppce6500 cpp@lib32_ppce6500 egli=
bc-utils@lib32_ppce6500 eglibc-dev@lib32_ppce6500' returned 1:
Loading cache...
Updating cache...               ######################################## [1=
00%]

Committing transaction...
Preparing...                    ######################################## [ =
 0%]
error: file /usr/include/gnu/lib-names.h from install of eglibc-dev-2.19-r0=
.lib32_ppce6500 conflicts with file from package libc6-dev-2.19-r0.ppc64e65=
00
---------------------------------------------------------------------------=
----------------

I got some help and was told to apply this patch -

patch https://github.com/kraj/glibc/commit/93ae1ebaa6df1a0c188614bd0a601ab6=
e26711c5

---------------------------------------------------------------------------=
----------------

But now I am getting this error.  Looks like the patch did not include the =
64-bit build option for generating ld64.so.1.

ERROR: Unable to install packages. Command '/opt/QorIQ-SDK-V1.8-20150619-yo=
cto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/smart --da=
ta-dir=3D/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/=
work/b4860qds_64b-fsl-linux/fsl-image-full/1.0-r0/sdk/image/opt/fsl-network=
ing/QorIQ-SDK-V1.8/sysroots/ppc64e6500-fsl-linux/var/lib/smart install -y l=
ibgcc1@ppc64e6500 gcc@ppc64e6500 libgcc-s-dev@ppc64e6500 run-postinsts@all =
usdpaa-apps-staticdev@b4860qds_64b ldd@ppc64e6500 usdpaa-apps@b4860qds_64b =
packagegroup-core-ssh-openssh@all tcf-qoriqdbg@ppc64e6500 apptrk@ppc64e6500=
 asf@b4860qds_64b udev-extraconf@ppc64e6500 pme-tools@ppc64e6500 rpm@ppc64e=
6500 eth-config@ppc64e6500 mtd-utils@ppc64e6500 packagegroup-core-standalon=
e-sdk-target-dbg@all usdpaa-staticdev@b4860qds_64b util-linux@ppc64e6500 fm=
-ucode-image@ppc64e6500 dpa-offload-dev@b4860qds_64b mtd-utils-jffs2@ppc64e=
6500 smartpm@ppc64e6500 e2fsprogs-tune2fs@ppc64e6500 packagegroup-core-ecli=
pse-debug@all eglibc-utils@ppc64e6500 g++@ppc64e6500 gcov@ppc64e6500 dosfst=
ools@ppc64e6500 e2fsprogs-e2fsck@ppc64e6500 gnuradio-dev@ppc64e6500 package=
group-fsl-core@all packagegroup-fsl-extend@all packagegroup-core-boot@b4860=
qds_64b packagegroup-core-full-cmdline@all sysklogd@ppc64e6500 merge-files@=
all packagegroup-core-buildessential@all rcw-image@b4860qds_64b packagegrou=
p-core-x11-base@all kmod@ppc64e6500 usdpaa@b4860qds_64b packagegroup-core-n=
fs-server@all hypervisor-partman@ppc64e6500 ceetm@b4860qds_64b dpa-offload-=
staticdev@b4860qds_64b libc6-dev@ppc64e6500 usdpaa-dev@b4860qds_64b e2fspro=
gs-mke2fs@ppc64e6500 libgcov-dev@ppc64e6500 sysfsutils@ppc64e6500 qoriq-deb=
ug@b4860qds_64b mtd-utils-ubifs@ppc64e6500 kernel-image-3.12.37-rt51-qoriq-=
sdk-v1.8+gf488de6@b4860qds_64b<mailto:kernel-image-3.12.37-rt51-qoriq-sdk-v=
1.8+gf488de6@b4860qds_64b> fmc@b4860qds_64b bash@ppc64e6500 packagegroup-co=
re-standalone-sdk-target@all e2fsprogs@ppc64e6500 packagegroup-core-tools-d=
ebug@b4860qds_64b hyperrelay@ppc64e6500 valgrind@ppc64e6500 sysstat@ppc64e6=
500 packagegroup-core-x11@all net-tools@ppc64e6500 cpp@ppc64e6500 kernel-de=
vicetree@b4860qds_64b binutils@ppc64e6500 u-boot-qoriq-images@b4860qds_64b'=
 returned 1:
Loading cache...
Updating cache...               ######################################## [1=
00%]

Computing transaction...error: Can't install libstdc++6-4.9.2-r0@ppc64e6500=
<mailto:libstdc++6-4.9.2-r0@ppc64e6500>: no package provides ld64.so.1()(64=
bit)


ERROR: Function failed: do_populate_sdk
ERROR: Logfile of failure stored in: /opt/QorIQ-SDK-V1.8-20150619-yocto/bui=
ld_b4860qds-64b_release/tmp/work/b4860qds_64b-fsl-linux/fsl-image-full/1.0-=
r0/temp/log.do_populate_sdk.98993
ERROR: Task 9 (/opt/QorIQ-SDK-V1.8-20150619-yocto/meta-fsl-networking/image=
s/fsl-image-full.bb, do_populate_sdk) failed with exit code '1'
NOTE: Tasks Summary: Attempted 6311 tasks of which 2955 didn't need to be r=
erun and 1 failed.

Summary: 1 task failed:
  /opt/QorIQ-SDK-V1.8-20150619-yocto/meta-fsl-networking/images/fsl-image-f=
ull.bb, do_populate_sdk




W. Kyle Unice
Staff Engineer
MS F1H03
322 North 2200 West Dock 3
Salt Lake City, Utah 84116-0850

Voice: 801-594-2687


--_000_DB6PR0401MB2630D1365AC2C82F9079AF34EEEB0DB6PR0401MB2630_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Candara;
	panose-1:2 14 5 2 3 3 3 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal;
	font-family:"Candara",sans-serif;
	color:windowtext;}
span.apple-converted-space
	{mso-style-name:apple-converted-space;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Hi Kyle, <o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">You can try to check i=
f the top 2 commits of libc-common.bbclass can solve the issue.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><a href=3D"http://git.=
yoctoproject.org/cgit/cgit.cgi/poky/log/meta/classes/libc-common.bbclass">h=
ttp://git.yoctoproject.org/cgit/cgit.cgi/poky/log/meta/classes/libc-common.=
bbclass</a>
<o:p></o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"540" style=3D"width:405.0pt;background:#333333;border-colla=
pse:collapse">
<tbody>
<tr>
<td width=3D"90" nowrap=3D"" style=3D"width:67.5pt;padding:1.2pt 6.0pt 1.2p=
t 6.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:white">2016-05-13<o:p></o:p></span></p>
</td>
<td width=3D"336" nowrap=3D"" style=3D"width:3.5in;padding:1.2pt 6.0pt 1.2p=
t 6.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:white"><a href=3D"http://git.yoctoproject.org/cg=
it/cgit.cgi/poky/commit/meta/classes/libc-common.bbclass?id=3Df99fb6a16781d=
543292558b1000014a0148da005"><span style=3D"color:white;text-decoration:non=
e">libc-common.bbclass:
 Use sed instead of grep</span></a><o:p></o:p></span></p>
</td>
<td width=3D"114" nowrap=3D"" style=3D"width:85.5pt;padding:1.2pt 6.0pt 1.2=
pt 6.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:white">Khem Raj<o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"90" nowrap=3D"" style=3D"width:67.5pt;padding:1.2pt 6.0pt 1.2p=
t 6.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:white">2014-08-23<o:p></o:p></span></p>
</td>
<td width=3D"336" nowrap=3D"" style=3D"width:3.5in;padding:1.2pt 6.0pt 1.2p=
t 6.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:white"><a href=3D"http://git.yoctoproject.org/cg=
it/cgit.cgi/poky/commit/meta/classes/libc-common.bbclass?id=3D65fa712ae9832=
4bc0182bc23b3bcdb957c3a21d9"><span style=3D"color:white;text-decoration:non=
e">libc-common.bbclass:
 rename ALL the packages</span></a><o:p></o:p></span></p>
</td>
<td width=3D"114" nowrap=3D"" style=3D"width:85.5pt;padding:1.2pt 6.0pt 1.2=
pt 6.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:white">Peter Seebach<o:p></o:p></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Best Regards,<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Zhenhua<o:p></o:p></sp=
an></p>
</div>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> openembedded-core-bounces@lists.openemb=
edded.org [mailto:openembedded-core-bounces@lists.openembedded.org]
<b>On Behalf Of </b>kyle.unice@L-3com.com<br>
<b>Sent:</b> Wednesday, August 17, 2016 10:59 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org<br>
<b>Subject:</b> [OE-core] Problem building eglibc<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,sans-serif">I previously posted this issue:<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,sans-serif">---------------------------------------------------=
----------------------------------------<o:p></o:p></span></p>
<p class=3D"MsoNormal">On Aug 16, 2016, at 12:53 PM,<span class=3D"apple-co=
nverted-space">&nbsp;</span><a href=3D"mailto:kyle.unice@l-3com.com"><span =
style=3D"color:purple">kyle.unice@L-3com.com</span></a><span class=3D"apple=
-converted-space">&nbsp;</span>wrote:<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Candara&quot;,sans-=
serif">Folks,</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Candara&quot;,sans-=
serif">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Candara&quot;,sans-=
serif">I am having a problem doing the &#8216;bitbake &#8211;c do_populate_=
sdk fsl-image-full&#8217; command using the daisy branch of Yocto with the =
freescale b4860qds-64b evaluation board.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Candara&quot;,sans-=
serif">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Candara&quot;,sans-=
serif">Here is the error I get:</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Candara&quot;,sans-=
serif">&nbsp;</span><o:p></o:p></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,sa=
ns-serif">ERROR: Unable to install packages. Command '/opt/QorIQ-SDK-V1.8-2=
0150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-linux/usr/bin/=
smart --data-dir=3D/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_re=
lease/tmp/work/b4860qds_64b-fsl-linux/fsl-image-full/1.0-r0/sdk/image/opt/f=
sl-networking/QorIQ-SDK-V1.8/sysroots/ppc64e6500-fsl-linux/var/lib/smart
 install -y libgcc1@lib32_ppce6500 gcc@lib32_ppce6500 libgcov-dev@lib32_ppc=
e6500 libgcc-s-dev@lib32_ppce6500 valgrind@lib32_ppce6500 binutils@lib32_pp=
ce6500 g&#43;&#43;@lib32_ppce6500 ldd@lib32_ppce6500 gcov@lib32_ppce6500 cp=
p@lib32_ppce6500 eglibc-utils@lib32_ppce6500
 eglibc-dev@lib32_ppce6500' returned 1:</span></i><o:p></o:p></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,sa=
ns-serif">Loading cache...</span></i><o:p></o:p></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,sa=
ns-serif">Updating cache...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ######################################=
## [100%]</span></i><o:p></o:p></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,sa=
ns-serif">&nbsp;</span></i><o:p></o:p></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,sa=
ns-serif">Committing transaction...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></i><o:p></o:p></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,sa=
ns-serif">Preparing...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #############=
########################### [&nbsp; 0%]</span></i><o:p></o:p></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,sa=
ns-serif">error: file /usr/include/gnu/lib-names.h from install of eglibc-d=
ev-2.19-r0.lib32_ppce6500 conflicts with file from package libc6-dev-2.19-r=
0.ppc64e6500</span></i><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,sans-serif">---------------------------------------------------=
----------------------------------------<o:p></o:p></span></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,sa=
ns-serif"><o:p>&nbsp;</o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,sa=
ns-serif">I got some help and was told to apply this patch -&nbsp;</span></=
i><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal">patch&nbsp;<a href=3D"https://github.com/kraj/glibc/=
commit/93ae1ebaa6df1a0c188614bd0a601ab6e26711c5"><span style=3D"color:purpl=
e">https://github.com/kraj/glibc/commit/93ae1ebaa6df1a0c188614bd0a601ab6e26=
711c5</span></a><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,sans-serif">---------------------------------------------------=
----------------------------------------<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,sans-serif">But now I am getting this error.&nbsp; Looks like t=
he patch did not include the 64-bit build option for generating ld64.so.1.&=
nbsp;
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,sa=
ns-serif;color:#1F497D">ERROR: Unable to install packages. Command '/opt/Qo=
rIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_64-=
linux/usr/bin/smart --data-dir=3D/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b=
4860qds-64b_release/tmp/work/b4860qds_64b-fsl-linux/fsl-image-full/1.0-r0/s=
dk/image/opt/fsl-networking/QorIQ-SDK-V1.8/sysroots/ppc64e6500-fsl-linux/va=
r/lib/smart
 install -y libgcc1@ppc64e6500 gcc@ppc64e6500 libgcc-s-dev@ppc64e6500 run-p=
ostinsts@all usdpaa-apps-staticdev@b4860qds_64b ldd@ppc64e6500 usdpaa-apps@=
b4860qds_64b packagegroup-core-ssh-openssh@all tcf-qoriqdbg@ppc64e6500 appt=
rk@ppc64e6500 asf@b4860qds_64b udev-extraconf@ppc64e6500
 pme-tools@ppc64e6500 rpm@ppc64e6500 eth-config@ppc64e6500 mtd-utils@ppc64e=
6500 packagegroup-core-standalone-sdk-target-dbg@all usdpaa-staticdev@b4860=
qds_64b util-linux@ppc64e6500 fm-ucode-image@ppc64e6500 dpa-offload-dev@b48=
60qds_64b mtd-utils-jffs2@ppc64e6500
 smartpm@ppc64e6500 e2fsprogs-tune2fs@ppc64e6500 packagegroup-core-eclipse-=
debug@all eglibc-utils@ppc64e6500 g&#43;&#43;@ppc64e6500 gcov@ppc64e6500 do=
sfstools@ppc64e6500 e2fsprogs-e2fsck@ppc64e6500 gnuradio-dev@ppc64e6500 pac=
kagegroup-fsl-core@all packagegroup-fsl-extend@all
 packagegroup-core-boot@b4860qds_64b packagegroup-core-full-cmdline@all sys=
klogd@ppc64e6500 merge-files@all packagegroup-core-buildessential@all rcw-i=
mage@b4860qds_64b packagegroup-core-x11-base@all kmod@ppc64e6500 usdpaa@b48=
60qds_64b packagegroup-core-nfs-server@all
 hypervisor-partman@ppc64e6500 ceetm@b4860qds_64b dpa-offload-staticdev@b48=
60qds_64b libc6-dev@ppc64e6500 usdpaa-dev@b4860qds_64b e2fsprogs-mke2fs@ppc=
64e6500 libgcov-dev@ppc64e6500 sysfsutils@ppc64e6500 qoriq-debug@b4860qds_6=
4b mtd-utils-ubifs@ppc64e6500
<a href=3D"mailto:kernel-image-3.12.37-rt51-qoriq-sdk-v1.8&#43;gf488de6@b48=
60qds_64b">kernel-image-3.12.37-rt51-qoriq-sdk-v1.8&#43;gf488de6@b4860qds_6=
4b</a> fmc@b4860qds_64b bash@ppc64e6500 packagegroup-core-standalone-sdk-ta=
rget@all e2fsprogs@ppc64e6500 packagegroup-core-tools-debug@b4860qds_64b
 hyperrelay@ppc64e6500 valgrind@ppc64e6500 sysstat@ppc64e6500 packagegroup-=
core-x11@all net-tools@ppc64e6500 cpp@ppc64e6500 kernel-devicetree@b4860qds=
_64b binutils@ppc64e6500 u-boot-qoriq-images@b4860qds_64b' returned 1:<o:p>=
</o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,sa=
ns-serif;color:#1F497D">Loading cache...<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,sa=
ns-serif;color:#1F497D">Updating cache...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ########################=
################ [100%]<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,sa=
ns-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,sa=
ns-serif;color:#1F497D">Computing transaction...error: Can't install
<a href=3D"mailto:libstdc&#43;&#43;6-4.9.2-r0@ppc64e6500">libstdc&#43;&#43;=
6-4.9.2-r0@ppc64e6500</a>: no package provides ld64.so.1()(64bit)<o:p></o:p=
></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,sa=
ns-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,sa=
ns-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,sa=
ns-serif;color:#1F497D">ERROR: Function failed: do_populate_sdk<o:p></o:p><=
/span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,sa=
ns-serif;color:#1F497D">ERROR: Logfile of failure stored in: /opt/QorIQ-SDK=
-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/b4860qds_64b-fsl-l=
inux/fsl-image-full/1.0-r0/temp/log.do_populate_sdk.98993<o:p></o:p></span>=
</i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,sa=
ns-serif;color:#1F497D">ERROR: Task 9 (/opt/QorIQ-SDK-V1.8-20150619-yocto/m=
eta-fsl-networking/images/fsl-image-full.bb, do_populate_sdk) failed with e=
xit code '1'<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,sa=
ns-serif;color:#1F497D">NOTE: Tasks Summary: Attempted 6311 tasks of which =
2955 didn't need to be rerun and 1 failed.<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,sa=
ns-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,sa=
ns-serif;color:#1F497D">Summary: 1 task failed:<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><i><span style=3D"font-family:&quot;Candara&quot;,sa=
ns-serif;color:#1F497D">&nbsp; /opt/QorIQ-SDK-V1.8-20150619-yocto/meta-fsl-=
networking/images/fsl-image-full.bb, do_populate_sdk<o:p></o:p></span></i><=
/p>
<div style=3D"border:none;border-bottom:solid windowtext 1.0pt;padding:0in =
0in 1.0pt 0in">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal">W. Kyle Unice<o:p></o:p></p>
<p class=3D"MsoNormal">Staff Engineer<o:p></o:p></p>
<p class=3D"MsoNormal">MS F1H03<o:p></o:p></p>
<p class=3D"MsoNormal">322 North 2200 West Dock 3<o:p></o:p></p>
<p class=3D"MsoNormal">Salt Lake City, Utah 84116-0850<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Voice: 801-594-2687<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</body>
</html>

--_000_DB6PR0401MB2630D1365AC2C82F9079AF34EEEB0DB6PR0401MB2630_--
