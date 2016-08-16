Return-Path: <prvs=0294233f6=kyle.unice@L-3com.com>
X-Greylist: delayed 302 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 16 Aug 2016 19:58:47 UTC
Received: from smtp8out.l-3com.com (smtp8out.l-3com.com [128.170.207.117])
	by mail.openembedded.org (Postfix) with ESMTP id DF7DA7318D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 19:58:47 +0000 (UTC)
X-filenames: 
X-filesizes: None
X-filetypes: 
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,529,1464652800"; 
	d="scan'208,217";a="292236500"
Received: from slxhub01.csw.l-3com.com ([128.170.35.31])
	by smtp8out.l-3com.com with ESMTP; 16 Aug 2016 19:53:45 +0000
Received: from SLXMBX01.csw.l-3com.com ([fe80::d1ac:3ec4:a328:a9c3]) by
	SLXHUB01.csw.l-3com.com ([fe80::6cc7:6feb:72e8:3b67%16]) with mapi id
	14.03.0301.000; Tue, 16 Aug 2016 13:53:46 -0600
From: <kyle.unice@L-3com.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: 'Daisy' problem bitbake -c do_populate_sdk fsl-image-full
Thread-Index: AdH39+VjzRlgwSEFTmeRiwDZAB8ONQ==
Date: Tue, 16 Aug 2016 19:53:45 +0000
Message-ID: <25D6125FB568F54699E315276ED4D36C614E157B@SLXMBX01.csw.l-3com.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.170.35.58]
MIME-Version: 1.0
Subject: 'Daisy' problem bitbake -c do_populate_sdk fsl-image-full
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
X-List-Received-Date: Tue, 16 Aug 2016 19:58:48 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_25D6125FB568F54699E315276ED4D36C614E157BSLXMBX01cswl3co_"

--_000_25D6125FB568F54699E315276ED4D36C614E157BSLXMBX01cswl3co_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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





Installing packages (19):

  binutils-2.23.2-r4@lib32_ppce6500<mailto:binutils-2.23.2-r4@lib32_ppce650=
0>      libgcc-s-dev-4.9.2-r0@lib32_ppce6500<mailto:libgcc-s-dev-4.9.2-r0@l=
ib32_ppce6500>

  cpp-4.9.2-r0@lib32_ppce6500<mailto:cpp-4.9.2-r0@lib32_ppce6500>          =
  libgcc1-4.9.2-r0@lib32_ppce6500<mailto:libgcc1-4.9.2-r0@lib32_ppce6500>

  eglibc-2.19-r0@lib32_ppce6500<mailto:eglibc-2.19-r0@lib32_ppce6500>      =
    libgcov-dev-4.9.2-r0@lib32_ppce6500<mailto:libgcov-dev-4.9.2-r0@lib32_p=
pce6500>

  eglibc-dbg-2.19-r0@lib32_ppce6500<mailto:eglibc-dbg-2.19-r0@lib32_ppce650=
0>      libgmp10-5.1.1-r0@lib32_ppce6500<mailto:libgmp10-5.1.1-r0@lib32_ppc=
e6500>

  eglibc-dev-2.19-r0@lib32_ppce6500<mailto:eglibc-dev-2.19-r0@lib32_ppce650=
0>      libmpc3-1.0.2-r0@lib32_ppce6500<mailto:libmpc3-1.0.2-r0@lib32_ppce6=
500>

  eglibc-utils-2.19-r0@lib32_ppce6500<mailto:eglibc-utils-2.19-r0@lib32_ppc=
e6500>    libmpfr4-3.1.2-r0@lib32_ppce6500<mailto:libmpfr4-3.1.2-r0@lib32_p=
pce6500>

  g++-4.9.2-r0@lib32_ppce6500<mailto:g++-4.9.2-r0@lib32_ppce6500>          =
  libstdc++6-4.9.2-r0@lib32_ppce6500<mailto:libstdc++6-4.9.2-r0@lib32_ppce6=
500>

  gcc-4.9.2-r0@lib32_ppce6500<mailto:gcc-4.9.2-r0@lib32_ppce6500>          =
  libz1-1.2.8-r0@lib32_ppce6500<mailto:libz1-1.2.8-r0@lib32_ppce6500>

  gcov-4.9.2-r0@lib32_ppce6500<mailto:gcov-4.9.2-r0@lib32_ppce6500>        =
   valgrind-3.10.1-r1@lib32_ppce6500<mailto:valgrind-3.10.1-r1@lib32_ppce65=
00>

  ldd-2.19-r0@lib32_ppce6500<mailto:ldd-2.19-r0@lib32_ppce6500>



206.4MB of package files are needed. 498.9MB will be used.



Saving cache...





ERROR: Function failed: do_populate_sdk

ERROR: Logfile of failure stored in: /opt/QorIQ-SDK-V1.8-20150619-yocto/bui=
ld_b4860qds-64b_release/tmp/work/b4860qds_64b-fsl-linux/fsl-image-full/1.0-=
r0/temp/log.do_populate_sdk.57975

ERROR: Task 9 (/opt/QorIQ-SDK-V1.8-20150619-yocto/meta-fsl-networking/image=
s/fsl-image-full.bb, do_populate_sdk) failed with exit code '1'

NOTE: Tasks Summary: Attempted 6311 tasks of which 6310 didn't need to be r=
erun and 1 failed.



Summary: 1 task failed:

  /opt/QorIQ-SDK-V1.8-20150619-yocto/meta-fsl-networking/images/fsl-image-f=
ull.bb, do_populate_sdk

Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

kyle@ubuntu:/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release$<=
mailto:kyle@ubuntu:/opt/QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_re=
lease$>


Is there a way to fix this issue?

Thanks,
Kyle


W. Kyle Unice
Staff Engineer
MS F1H03
322 North 2200 West Dock 3
Salt Lake City, Utah 84116-0850

Voice: 801-594-2687


--_000_25D6125FB568F54699E315276ED4D36C614E157BSLXMBX01cswl3co_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Candara;
	panose-1:2 14 5 2 3 3 3 2 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Candara","sans-serif";
	font-style:italic;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Candara","sans-serif";
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Candara","sans-serif";
	font-style:italic;}
.MsoChpDefault
	{mso-style-type:export-only;}
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
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;">Folks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;">I am having a problem doing the &#8216;=
bitbake &#8211;c do_populate_sdk fsl-image-full&#8217; command using the da=
isy branch of Yocto with the freescale b4860qds-64b evaluation board.<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;">Here is the error I get:<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText">ERROR: Unable to install packages. Command '/opt/=
QorIQ-SDK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/sysroots/x86_6=
4-linux/usr/bin/smart --data-dir=3D/opt/QorIQ-SDK-V1.8-20150619-yocto/build=
_b4860qds-64b_release/tmp/work/b4860qds_64b-fsl-linux/fsl-image-full/1.0-r0=
/sdk/image/opt/fsl-networking/QorIQ-SDK-V1.8/sysroots/ppc64e6500-fsl-linux/=
var/lib/smart
 install -y libgcc1@lib32_ppce6500 gcc@lib32_ppce6500 libgcov-dev@lib32_ppc=
e6500 libgcc-s-dev@lib32_ppce6500 valgrind@lib32_ppce6500 binutils@lib32_pp=
ce6500 g&#43;&#43;@lib32_ppce6500 ldd@lib32_ppce6500 gcov@lib32_ppce6500 cp=
p@lib32_ppce6500 eglibc-utils@lib32_ppce6500
 eglibc-dev@lib32_ppce6500' returned 1:<o:p></o:p></p>
<p class=3D"MsoPlainText">Loading cache...<o:p></o:p></p>
<p class=3D"MsoPlainText">Updating cache...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ######################=
################## [100%]<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Committing transaction...&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"MsoPlainText">Preparing...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; ######################################## [&nbsp; 0%]<o:p></o:p></p>
<p class=3D"MsoPlainText">error: file /usr/include/gnu/lib-names.h from ins=
tall of eglibc-dev-2.19-r0.lib32_ppce6500 conflicts with file from package =
libc6-dev-2.19-r0.ppc64e6500<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Installing packages (19):<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp; <a href=3D"mailto:binutils-2.23.2-r4@lib32=
_ppce6500">binutils-2.23.2-r4@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
<a href=3D"mailto:libgcc-s-dev-4.9.2-r0@lib32_ppce6500">libgcc-s-dev-4.9.2-=
r0@lib32_ppce6500</a>&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;<a href=3D"mailto:cpp-4.9.2-r0@lib32_=
ppce6500">cpp-4.9.2-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href=3D"mailto:libgcc1-4.9.2-r0@lib32_ppce6500">libgcc1-4.9.2-r0@lib32_p=
pce6500</a>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;<a href=3D"mailto:eglibc-2.19-r0@lib3=
2_ppce6500">eglibc-2.19-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;
<a href=3D"mailto:libgcov-dev-4.9.2-r0@lib32_ppce6500">libgcov-dev-4.9.2-r0=
@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;<a href=3D"mailto:eglibc-dbg-2.19-r0@=
lib32_ppce6500">eglibc-dbg-2.19-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;
<a href=3D"mailto:libgmp10-5.1.1-r0@lib32_ppce6500">libgmp10-5.1.1-r0@lib32=
_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;<a href=3D"mailto:eglibc-dev-2.19-r0@=
lib32_ppce6500">eglibc-dev-2.19-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;
<a href=3D"mailto:libmpc3-1.0.2-r0@lib32_ppce6500">libmpc3-1.0.2-r0@lib32_p=
pce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;<a href=3D"mailto:eglibc-utils-2.19-r=
0@lib32_ppce6500">eglibc-utils-2.19-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;
<a href=3D"mailto:libmpfr4-3.1.2-r0@lib32_ppce6500">libmpfr4-3.1.2-r0@lib32=
_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;<a href=3D"mailto:g&#43;&#43;-4.9.2-r=
0@lib32_ppce6500">g&#43;&#43;-4.9.2-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href=3D"mailto:libstdc&#43;&#43;6-4.9.2-r0@lib32_ppce6500">libstdc&#43;&=
#43;6-4.9.2-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;<a href=3D"mailto:gcc-4.9.2-r0@lib32_=
ppce6500">gcc-4.9.2-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href=3D"mailto:libz1-1.2.8-r0@lib32_ppce6500">libz1-1.2.8-r0@lib32_ppce6=
500</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;<a href=3D"mailto:gcov-4.9.2-r0@lib32=
_ppce6500">gcov-4.9.2-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href=3D"mailto:valgrind-3.10.1-r1@lib32_ppce6500">valgrind-3.10.1-r1@lib=
32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;<a href=3D"mailto:ldd-2.19-r0@lib32_p=
pce6500">ldd-2.19-r0@lib32_ppce6500</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">206.4MB of package files are needed. 498.9MB will=
 be used.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Saving cache...<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">ERROR: Function failed: do_populate_sdk<o:p></o:p=
></p>
<p class=3D"MsoPlainText">ERROR: Logfile of failure stored in: /opt/QorIQ-S=
DK-V1.8-20150619-yocto/build_b4860qds-64b_release/tmp/work/b4860qds_64b-fsl=
-linux/fsl-image-full/1.0-r0/temp/log.do_populate_sdk.57975<o:p></o:p></p>
<p class=3D"MsoPlainText">ERROR: Task 9 (/opt/QorIQ-SDK-V1.8-20150619-yocto=
/meta-fsl-networking/images/fsl-image-full.bb, do_populate_sdk) failed with=
 exit code '1'<o:p></o:p></p>
<p class=3D"MsoPlainText">NOTE: Tasks Summary: Attempted 6311 tasks of whic=
h 6310 didn't need to be rerun and 1 failed.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Summary: 1 task failed:<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp; /opt/QorIQ-SDK-V1.8-20150619-yocto/meta-fs=
l-networking/images/fsl-image-full.bb, do_populate_sdk<o:p></o:p></p>
<p class=3D"MsoPlainText">Summary: There were 2 ERROR messages shown, retur=
ning a non-zero exit code.<o:p></o:p></p>
<p class=3D"MsoPlainText"><a href=3D"mailto:kyle@ubuntu:/opt/QorIQ-SDK-V1.8=
-20150619-yocto/build_b4860qds-64b_release$">kyle@ubuntu:/opt/QorIQ-SDK-V1.=
8-20150619-yocto/build_b4860qds-64b_release$</a><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;">Is there a way to fix this issue?<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;">Kyle<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ca=
ndara&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal">W. Kyle Unice<o:p></o:p></p>
<p class=3D"MsoNormal">Staff Engineer<o:p></o:p></p>
<p class=3D"MsoNormal">MS F1H03<o:p></o:p></p>
<p class=3D"MsoNormal">322 North 2200 West Dock 3<o:p></o:p></p>
<p class=3D"MsoNormal">Salt Lake City, Utah 84116-0850<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Voice: 801-594-2687<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_25D6125FB568F54699E315276ED4D36C614E157BSLXMBX01cswl3co_--
