Return-Path: <zhenhua.luo@nxp.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0098.outbound.protection.outlook.com [157.55.234.98])
	by mail.openembedded.org (Postfix) with ESMTP id 8ED8B6212F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 07:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Bve5GvT54pzGRNbB0gUd59NPmASmUxNuHzL+0ErEw5w=;
	b=wM4ZotVz2OOU+6lwdEjaslqJDEqKLG3dVaz0zcAtViNTnghV4WAu9wIlyogI5HzUzQgQWpGOT6pCdHgkEfgCg3LFgsai4ZGp4lR4GMheLor4j0/cHMlXxrIDvkUhY9MRjTHAn5cAIsht7SSosw/4XNR8LePHFUlhRma07frYgxs=
Received: from DB3PR04MB0684.eurprd04.prod.outlook.com
	(2a01:111:e400:943c::14) by DB3PR04MB0681.eurprd04.prod.outlook.com
	(2a01:111:e400:943c::11) with Microsoft SMTP Server (TLS) id
	15.1.427.16; Mon, 14 Mar 2016 06:46:23 +0000
Received: from DB3PR04MB0684.eurprd04.prod.outlook.com
	([fe80::5d5f:4faf:f854:c77e]) by
	DB3PR04MB0684.eurprd04.prod.outlook.com
	([fe80::5d5f:4faf:f854:c77e%16]) with mapi id 15.01.0427.020;
	Mon, 14 Mar 2016 06:46:23 +0000
From: Zhenhua Luo <zhenhua.luo@nxp.com>
To: Hongxu Jia <hongxu.jia@windriver.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] Status of M3
Thread-Index: AQHRdVhGsXvrFyBNX0Gn620r+EcAUp9JCDuwgAALawCABiVIgIAJTDyAgAAKJsA=
Date: Mon, 14 Mar 2016 06:46:23 +0000
Message-ID: <DB3PR04MB0684E9E6C6B1A610036B5814EE880@DB3PR04MB0684.eurprd04.prod.outlook.com>
References: <1457014986.25131.69.camel@linuxfoundation.org>
	<DB3PR04MB068422B10C54A685417DCE3AEEBE0@DB3PR04MB0684.eurprd04.prod.outlook.com>
	<1457086698.2804.9.camel@linuxfoundation.org>
	<56DE88AD.7090902@windriver.com>
	<DB3PR04MB068479840363DCBF812FD0E9EE880@DB3PR04MB0684.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR04MB068479840363DCBF812FD0E9EE880@DB3PR04MB0684.eurprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: windriver.com; dkim=none (message not signed)
	header.d=none; windriver.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [199.59.226.141]
x-ms-office365-filtering-correlation-id: 1b2fe4b3-ee5d-4f1e-7c9c-08d34bd45ba9
x-microsoft-exchange-diagnostics: 1; DB3PR04MB0681;
	5:0GLT3XbaGkVx6oV60kHZG9rVvmlkMapvhgCmM+gzh1oD3j5g3pmrnVPZQ4hG2a5e9+FM+Aj9KXrillYI3sw4PHbSmhz8UG0dtdfi3uP8lHi5kmwsIu25HTs4BmknLljxkIsrHewlKT2HKOejj6Syqw==;
	24:aLE0rGFB9y2D2sVQPlZHD30UNAmq8Jnsvblw2PTqwCu/zWI7MT+Dfz63c7HBzwojEBOy6btv2EoKbL92Go05kYc/5hNoFWTt5ikohEEZ2d8=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB3PR04MB0681;
x-microsoft-antispam-prvs: <DB3PR04MB068134BFDCB89D1D35093A93EE880@DB3PR04MB0681.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:DB3PR04MB0681; BCL:0; PCL:0; RULEID:; SRVR:DB3PR04MB0681; 
x-forefront-prvs: 0881A7A935
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(377424004)(164054003)(479174004)(24454002)(377454003)(4326007)(189998001)(87936001)(19300405004)(5008740100001)(102836003)(586003)(5250100002)(106116001)(76176999)(74316001)(11100500001)(50986999)(76576001)(19580405001)(19580395003)(54356999)(16236675004)(15975445007)(33656002)(81166005)(86362001)(3660700001)(3280700002)(2950100001)(2900100001)(92566002)(19617315012)(3846002)(93886004)(790700001)(1096002)(6116002)(66066001)(19625215002)(1220700001)(2906002)(5003600100002)(5002640100001)(5001770100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB3PR04MB0681;
	H:DB3PR04MB0684.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2016 06:46:23.0793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR04MB0681
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Status of M3
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
X-List-Received-Date: Mon, 14 Mar 2016 07:00:55 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB3PR04MB0684E9E6C6B1A610036B5814EE880DB3PR04MB0684eurp_"

--_000_DB3PR04MB0684E9E6C6B1A610036B5814EE880DB3PR04MB0684eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am just aware that another patch was already merged to fix the issue, ple=
ase ignore my patch.


Best Regards,

Zhenhua

From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Zhenhua Luo
Sent: Monday, March 14, 2016 2:12 PM
To: Hongxu Jia <hongxu.jia@windriver.com>; Richard Purdie <richard.purdie@l=
inuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Status of M3

A patch is submitted to fix the issue.

http://patchwork.openembedded.org/patch/117783/


Best Regards,

Zhenhua

From: Hongxu Jia [mailto:hongxu.jia@windriver.com]
Sent: Tuesday, March 08, 2016 4:09 PM
To: Richard Purdie <richard.purdie@linuxfoundation.org<mailto:richard.purdi=
e@linuxfoundation.org>>; Zhenhua Luo <zhenhua.luo@nxp.com<mailto:zhenhua.lu=
o@nxp.com>>
Cc: openembedded-core <openembedded-core@lists.openembedded.org<mailto:open=
embedded-core@lists.openembedded.org>>
Subject: Re: [OE-core] Status of M3

On 03/04/2016 06:18 PM, Richard Purdie wrote:

On Fri, 2016-03-04 at 09:41 +0000, Zhenhua Luo wrote:

* meta-fsl-ppc breaks on eudev change (patch pending)

* meta-fsl-ppc breakage blocks AB artefact publishing

[Luo Zhenhua-B19537] The eudev patch is merged, http://git.yoctoproje

ct.org/cgit/cgit.cgi/meta-fsl

-ppc/commit/?id=3D2642cf5e8a6f8d11603acf016b8c075ebce00ec0, is there

any other blocker issue?



Thanks, I appreciate getting that sorted!



Unfortunately there is something else not quite right with meta-fsl

-ppc:



https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-ppc/buil

ds/667

Hi Richard,

In the log, we have do_configure failed on python3:
...
| checking for the platform triplet based on compiler characteristics... po=
werpc-linux-gnuspe
| configure: error: internal configure error for the platform triplet, plea=
se file a bug report
| NOTE: The following config.log files may provide further information.
...


vim configure.ac in python3 source
...
 852 if test x$PLATFORM_TRIPLET !=3D x && test x$MULTIARCH !=3D x; then
 853   if test x$PLATFORM_TRIPLET !=3D x$MULTIARCH; then
 854     AC_MSG_ERROR([internal configure error for the platform triplet, p=
lease file a bug report])
 855   fi
 856 fi
...

In this case, PLATFORM_TRIPLET is powerpc-linux-gnuspe, and MULTIARCH is
MULTIARCH=3D$($CC --print-multiarch 2>/dev/null), and both of them are not =
equivalent.

On my local build with MACHINE =3D "qemux86-64", the MULTIARCH is empty.

On my local build with MACHINE =3D "p1022ds", $CC --print-multiarch
powerpc-linux-gnuspev1

Extra 'v1' casued the failure.

I am going to see what happen on 'v1', file [YOCTO #9226] to trace it

//Hongxu




Seems something is not working in python3 do_configure? Everything else

is building python3 fine so not sure what is wrong there.



Cheers,



Richard


--_000_DB3PR04MB0684E9E6C6B1A610036B5814EE880DB3PR04MB0684eurp_
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
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;
	color:black;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";
	color:black;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;
	color:black;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body bgcolor=3D"white" lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D">I am just aware that another patch wa=
s already merged to fix the issue, please ignore my patch.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D">Best Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D">Zhenhua<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif;color:windowtext">From:</span></b><span style=3D"=
font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:windowtex=
t"> openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-c=
ore-bounces@lists.openembedded.org]
<b>On Behalf Of </b>Zhenhua Luo<br>
<b>Sent:</b> Monday, March 14, 2016 2:12 PM<br>
<b>To:</b> Hongxu Jia &lt;hongxu.jia@windriver.com&gt;; Richard Purdie &lt;=
richard.purdie@linuxfoundation.org&gt;<br>
<b>Cc:</b> openembedded-core &lt;openembedded-core@lists.openembedded.org&g=
t;<br>
<b>Subject:</b> Re: [OE-core] Status of M3<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D">A patch is submitted to fix the issue=
.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D"><a href=3D"http://patchwork.openembed=
ded.org/patch/117783/">http://patchwork.openembedded.org/patch/117783/</a><=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D">Best Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D">Zhenhua<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif;color:windowtext">From:</span></b><span style=3D"=
font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:windowtex=
t"> Hongxu Jia [<a href=3D"mailto:hongxu.jia@windriver.com">mailto:hongxu.j=
ia@windriver.com</a>]
<br>
<b>Sent:</b> Tuesday, March 08, 2016 4:09 PM<br>
<b>To:</b> Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundat=
ion.org">richard.purdie@linuxfoundation.org</a>&gt;; Zhenhua Luo &lt;<a hre=
f=3D"mailto:zhenhua.luo@nxp.com">zhenhua.luo@nxp.com</a>&gt;<br>
<b>Cc:</b> openembedded-core &lt;<a href=3D"mailto:openembedded-core@lists.=
openembedded.org">openembedded-core@lists.openembedded.org</a>&gt;<br>
<b>Subject:</b> Re: [OE-core] Status of M3<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On 03/04/2016 06:18 PM, Richard Purdie wrote:<o:p></=
o:p></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre>On Fri, 2016-03-04 at 09:41 &#43;0000, Zhenhua Luo wrote:<o:p></o:p></=
pre>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre>* meta-fsl-ppc breaks on eudev change (patch pending)<o:p></o:p></pre>
<pre>* meta-fsl-ppc breakage blocks AB artefact publishing<o:p></o:p></pre>
</blockquote>
<pre>[Luo Zhenhua-B19537] The eudev patch is merged, <a href=3D"http://git.=
yoctoproje">http://git.yoctoproje</a><o:p></o:p></pre>
<pre>ct.org/cgit/cgit.cgi/meta-fsl<o:p></o:p></pre>
<pre>-ppc/commit/?id=3D2642cf5e8a6f8d11603acf016b8c075ebce00ec0, is there<o=
:p></o:p></pre>
<pre>any other blocker issue? <o:p></o:p></pre>
</blockquote>
<pre><o:p>&nbsp;</o:p></pre>
<pre>Thanks, I appreciate getting that sorted! <o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>Unfortunately there is something else not quite right with meta-fsl<o:=
p></o:p></pre>
<pre>-ppc:<o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre><a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-=
fsl-ppc/buil">https://autobuilder.yoctoproject.org/main/builders/nightly-fs=
l-ppc/buil</a><o:p></o:p></pre>
<pre>ds/667<o:p></o:p></pre>
</blockquote>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><br>
Hi Richard,<br>
<br>
In the log, we have do_configure failed on python3:<br>
...<br>
| checking for the platform triplet based on compiler characteristics... po=
werpc-linux-gnuspe<br>
| configure: error: internal configure error for the platform triplet, plea=
se file a bug report<br>
| NOTE: The following config.log files may provide further information.<br>
...<br>
<br>
<br>
vim configure.ac in python3 source<br>
...<br>
&nbsp;852 if test x$PLATFORM_TRIPLET !=3D x &amp;&amp; test x$MULTIARCH !=
=3D x; then<br>
&nbsp;853&nbsp;&nbsp; if test x$PLATFORM_TRIPLET !=3D x$MULTIARCH; then<br>
&nbsp;854&nbsp;&nbsp;&nbsp;&nbsp; AC_MSG_ERROR([internal configure error fo=
r the platform triplet, please file a bug report])<br>
&nbsp;855&nbsp;&nbsp; fi<br>
&nbsp;856 fi<br>
...<br>
<br>
In this case, PLATFORM_TRIPLET is powerpc-linux-gnuspe, and MULTIARCH is<br=
>
MULTIARCH=3D$($CC --print-multiarch 2&gt;/dev/null), and both of them are n=
ot equivalent.<br>
<br>
On my local build with MACHINE =3D &quot;qemux86-64&quot;, the MULTIARCH is=
 empty.<br>
<br>
On my local build with MACHINE =3D &quot;p1022ds&quot;, $CC --print-multiar=
ch<br>
powerpc-linux-gnuspev1<br>
<br>
Extra 'v1' casued the failure.<br>
<br>
I am going to see what happen on 'v1', file [YOCTO #9226] to trace it<br>
<br>
//Hongxu<br>
<br>
<o:p></o:p></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre><o:p>&nbsp;</o:p></pre>
<pre>Seems something is not working in python3 do_configure? Everything els=
e<o:p></o:p></pre>
<pre>is building python3 fine so not sure what is wrong there.<o:p></o:p></=
pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>Cheers,<o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>Richard<o:p></o:p></pre>
</blockquote>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_DB3PR04MB0684E9E6C6B1A610036B5814EE880DB3PR04MB0684eurp_--
