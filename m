Return-Path: <michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id 76EF377E8C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 22:46:56 +0000 (UTC)
X-AuditID: 0a00029b-5edff70000002b83-af-5a2721e0def1
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	50.98.11139.0E1272A5; Tue,  5 Dec 2017 16:46:56 -0600 (CST)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Tue, 5 Dec 2017 16:46:56 -0600
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Error caused by kernel-yocto: ensure that only valid BSPs are
	built
Thread-Index: AdNuGr+rCPF4JdIKS5Wr2G+lhqxOvQ==
Date: Tue, 5 Dec 2017 22:46:55 +0000
Message-ID: <655290B7709079438B7932553958E60DA138C4F9@ESS-EX01.essvote.corp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.61]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsWyRiBPQ/eBonqUwb632hZ3fr5jd2D0OLdx
	BWMAYxSXTUpqTmZZapG+XQJXxuozX1gL5ihXXPl8iKmBcZZ8FyMnh4SAicTHzhfMXYxcHEIC
	RxklGhecY4RwZjJK3OhcywhSxSZgJHHu+iYwW0QgWmLpjJnsILawgI/E1lX3oeLBEvvegkwC
	sfUk3p89AVbDIqAisXDaGTYQm1cgSOLAvGlMIDajgJjE91NrwGxmAXGJW0/mM0FcJCCxZM95
	ZghbVOLl43+sELacRN/Eh+wQ9fkSvxfeZ4WYKShxcuYTlgmMgrOQjJqFpGwWkjKIuI7Egt2f
	2CBsbYllC18zw9hnDjxmQhZfwMi+ipEv10gvtbi4LL8kVS85P3cTIzDcuRiYZu9g7GmKPcQo
	wMGoxMPr9VMtSog1say4MvcQozQHi5I4b+RBuSghgfTEktTs1NSC1KL4otKc1OJDjEwcnCCC
	S6qB0XDmtlV56zZH7C422a2s8F1+cbvvjeM3Y34G8ns8M1ZSTG54+EZq4kRzp5/Cj41DP7n0
	tE9bsyXiiv28M9pt7zXuJ0+zFTR/XBwmt+Ep55L61psr/S4u9Vh1mPeqrLSJgfPmjX9ffOWI
	kD6qtDZSKqzK+OG0JUxulhuNwxKn884uXH1umvXSSiWW4oxEQy3mouJEAF2jn/NdAgAA
Subject: Error caused by kernel-yocto: ensure that only valid BSPs are built
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
X-List-Received-Date: Tue, 05 Dec 2017 22:46:57 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_655290B7709079438B7932553958E60DA138C4F9ESSEX01essvotec_"

--_000_655290B7709079438B7932553958E60DA138C4F9ESSEX01essvotec_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

After upgrading rocko all my builds are failing with the following message.
ERROR: linux-yocto-4.12.14+gitAUTOINC+e3c9041f48_1d685baca1-r0.1 do_kernel_=
metadata: Could not locate BSP definition for test/standard and no defconfi=
g was provided
The source of the issue seems to be commit 44aea7b87307795fe4e089c51d45afcc=
aa2f6525.
This includes a fresh BSP I created with yocto-bsp create, so the helper to=
ols are generating examples that don't work.
bsp_definition=3D$(spp ${includes} --find -DKMACHINE=3D${KMACHINE} -DKTYPE=
=3D${LINUX_KERNEL_TYPE}) always returns nothing even though I have .scc fil=
es defined.
What is the new expected format to avoid this error?

Thanks,
Mike


--_000_655290B7709079438B7932553958E60DA138C4F9ESSEX01essvotec_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Helvetica;
	panose-1:2 11 6 4 2 2 2 2 2 4;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.Section1
	{page:Section1;}
-->
</style><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"Section1">
<p class=3D"MsoNormal">After upgrading rocko all my builds are failing with=
 the following message.<o:p></o:p></p>
<p class=3D"MsoNormal"><b><span style=3D"font-family:&quot;Courier New&quot=
;;color:#FF5454;
background:white">ERROR</span></b><span style=3D"font-family:&quot;Courier =
New&quot;;
color:black;background:white">:
</span><span style=3D"font-family:&quot;Courier New&quot;;
color:#B21818;background:white">linux-yocto-4.12.14&#43;gitAUTOINC&#43;e3c9=
041f48_1d685baca1-r0.1 do_kernel_metadata: Could not locate BSP definition =
for test/standard and no defconfig was provided<o:p></o:p></span></p>
<p class=3D"MsoNormal">The source of the issue seems to be commit <span sty=
le=3D"font-size:8.0pt;font-family:&quot;Helvetica&quot;,&quot;sans-serif&qu=
ot;;color:#333333;
background:white">
44aea7b87307795fe4e089c51d45afccaa2f6525.<o:p></o:p></span></p>
<p class=3D"MsoNormal">This includes a fresh BSP I created with yocto-bsp c=
reate, so the helper tools are generating examples that don&#8217;t work.<s=
pan style=3D"font-size:8.0pt;font-family:&quot;Helvetica&quot;,&quot;sans-s=
erif&quot;;color:#333333;
background:white"><o:p></o:p></span></p>
<p class=3D"MsoNormal">bsp_definition=3D$(spp ${includes} --find -DKMACHINE=
=3D${KMACHINE} -DKTYPE=3D${LINUX_KERNEL_TYPE}) always returns nothing even =
though I have .scc files defined.<o:p></o:p></p>
<p class=3D"MsoNormal">What is the new expected format to avoid this error?=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Mike<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_655290B7709079438B7932553958E60DA138C4F9ESSEX01essvotec_--
