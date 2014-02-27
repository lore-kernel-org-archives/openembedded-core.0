Return-Path: <alexandru.sardan@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1lp0140.outbound.protection.outlook.com [207.46.163.140])
	by mail.openembedded.org (Postfix) with ESMTP id 457016E89C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 12:21:11 +0000 (UTC)
Received: from DM2PR03MB368.namprd03.prod.outlook.com (10.141.55.22) by
	BY2PR03MB175.namprd03.prod.outlook.com (10.242.36.148) with Microsoft
	SMTP Server (TLS) id 15.0.883.10; Thu, 27 Feb 2014 12:21:10 +0000
Received: from DM2PR03MB368.namprd03.prod.outlook.com ([10.141.55.22]) by
	DM2PR03MB368.namprd03.prod.outlook.com ([10.141.55.22]) with mapi id
	15.00.0883.010; Thu, 27 Feb 2014 12:21:10 +0000
From: "alexandru.sardan@freescale.com" <alexandru.sardan@freescale.com>
To: =?iso-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>,
	=?iso-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] Revert "cross-canadian: Handle powerpc linux
	verses linux-gnuspe"
Thread-Index: AQHPDhbUXOT9PA+PXESDVVjRhy4ospqCnDKAgAABToCAAZ4SAIAExmYAgAFgVoCABReK0IAACoyAgAMsSfCAAcCFgIAHP+YAgAOMSPCAAAT4gIAAAF3wgBDDSgCAGB5SgIAARiWAgADlzoA=
Date: Thu, 27 Feb 2014 12:21:09 +0000
Message-ID: <35f08d5a28b44a5f95960eac853b3af6@DM2PR03MB368.namprd03.prod.outlook.com>
References: <1389365286-4830-1-git-send-email-david.nystrom@enea.com>
	<1389366908.19102.223.camel@ted>	<52D3DDFB.8080803@gmail.com>
	<1389616915.14987.4.camel@ted>	<52D53A6C.30808@gmail.com>
	<55ea22e5d71c47f3b812e845106f2d19@DM2PR03MB368.namprd03.prod.outlook.com>
	<1390044007.14987.151.camel@ted>
	<3ea5b5ff002e4f98b60997229cc31300@DM2PR03MB368.namprd03.prod.outlook.com>
	<1390326205.874.95.camel@ted>
	<c5873e086bd941e68daa26cbcdca573e@BLUPR03MB357.namprd03.prod.outlook.com>
	<1390596961.24755.21.camel@e130.pbcl.net>	<1390995512.24655.62.camel@ted>
	<da5289aa6e744c99ac4cb134483cdec9@DM2PR03MB368.namprd03.prod.outlook.com>
	<1391191631.28575.7.camel@ted>
	<fca6c32db2694c3c9c8a3f0130a3c039@DM2PR03MB368.namprd03.prod.outlook.com>
	<52F9F668.9020002@enea.com>
	<2704c8b5c1dd41bba04055ba98c436be@DM2PR03MB368.namprd03.prod.outlook.com>
	<530E6CA5.2000408@gmail.com>
In-Reply-To: <530E6CA5.2000408@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.88.166.1]
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(428001)(24454002)(13464003)(377454003)(164054003)(71364002)(199002)(189002)(377424004)(94946001)(18717965001)(74876001)(95666003)(95416001)(19580395003)(19580405001)(81816001)(92566001)(83072002)(85852003)(76576001)(81686001)(76786001)(83322001)(80976001)(15202345003)(56816005)(90146001)(81542001)(87266001)(19300405004)(4396001)(81342001)(33646001)(87936001)(54356001)(53806001)(79102001)(51856001)(77982001)(76482001)(56776001)(59766001)(54316002)(15975445006)(74502001)(31966008)(94316002)(65816001)(46102001)(2656002)(85306002)(86362001)(93516002)(93136001)(47736001)(47976001)(74366001)(47446002)(74316001)(49866001)(63696002)(80022001)(69226001)(16236675002)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR03MB175;
	H:DM2PR03MB368.namprd03.prod.outlook.com; CLIP:192.88.166.1;
	FPR:B2FDFB16.ACC95DEA.31F1B574.48EDA24D.202EA; MLV:sfv;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (: freescale.com does not designate permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "catalin.udma@freescale.com" <catalin.udma@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "cross-canadian: Handle powerpc linux verses linux-gnuspe"
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
X-List-Received-Date: Thu, 27 Feb 2014 12:21:12 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_35f08d5a28b44a5f95960eac853b3af6DM2PR03MB368namprd03pro_"

--_000_35f08d5a28b44a5f95960eac853b3af6DM2PR03MB368namprd03pro_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



Hi,

I've made the modifications and sent the patch with git send-mail to the oe=
-core list.

Regards,
Alex


From: David Nystr=F6m [mailto:david.c.nystrom@gmail.com]
Sent: Thursday, February 27, 2014 12:37 AM
To: Sardan Alexandru Cezar-B41700; David Nystr=F6m; Richard Purdie
Cc: Udma Catalin-Dan-B32721; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] Revert "cross-canadian: Handle powerpc linux=
 verses linux-gnuspe"


On 2014-02-26 19:29, alexandru.sardan@freescale.com<mailto:alexandru.sardan=
@freescale.com> wrote:

Hi David,



Sorry for the late reply.

I'm not familiar with the procedure for submitting a patch to Poky.

Could you walk me through the process?



Meanwhile I've attached the patch to this e-mail. It's been tested

on e500v2, e5500 and e6500.



Kind regards,

Alex

Hi,

You patch looks fine to me. A couple of comments though:

You should use git send-mail to send it to oe-core, and your patch on GCC n=
eeds an upstream status.
i.e. Plans of how and if this will be upstreamed to GCC.

Details:
https://wiki.yoctoproject.org/wiki/Contribution_Guidelines

Was able to build a working SDK compiler for p1025twr.

When this has brewed in the Autobuilder for a while, it should be backporte=
d to dora as well.

Br,
David










-----Original Message-----

From: openembedded-core-bounces@lists.openembedded.org<mailto:openembedded-=
core-bounces@lists.openembedded.org>

[mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of

David Nystr=F6m

Sent: Tuesday, February 11, 2014 12:08 PM

To: Sardan Alexandru Cezar-B41700; Richard Purdie

Cc: Udma Catalin-Dan-B32721; openembedded-core@lists.openembedded.org<mailt=
o:openembedded-core@lists.openembedded.org>

Subject: Re: [OE-core] [PATCH] Revert "cross-canadian: Handle powerpc

linux verses linux-gnuspe"



On 2014-01-31 19:17, alexandru.sardan@freescale.com<mailto:alexandru.sardan=
@freescale.com> wrote:

Hi,



Sure, I'll do this and also some more extensive testing

on the boards.



Thanks,

Alex





Hi Alex,



Whats the status on this ?



Br,

David

_______________________________________________

Openembedded-core mailing list

Openembedded-core@lists.openembedded.org<mailto:Openembedded-core@lists.ope=
nembedded.org>

http://lists.openembedded.org/mailman/listinfo/openembedded-core








_______________________________________________

Openembedded-core mailing list

Openembedded-core@lists.openembedded.org<mailto:Openembedded-core@lists.ope=
nembedded.org>

http://lists.openembedded.org/mailman/listinfo/openembedded-core


--_000_35f08d5a28b44a5f95960eac853b3af6DM2PR03MB368namprd03pro_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
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
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";
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
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";
	color:black;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;
	color:black;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";
	color:black;}
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
<body bgcolor=3D"white" lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<div>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" align=3D"left">
<tbody>
<tr>
<td style=3D"padding:0in 0in 0in 0in">
<div>
<p class=3D"MsoNormal" style=3D"mso-element:frame;mso-element-frame-hspace:=
2.25pt;mso-element-wrap:around;mso-element-anchor-vertical:paragraph;mso-el=
ement-anchor-horizontal:column;mso-height-rule:exactly">
<span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-=
serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
</div>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">I&#8217;ve made the modif=
ications and sent the patch with git send-mail to the oe-core list.<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Regards,<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Alex<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;;color:windowtext">From:</span></b><spa=
n style=3D"font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif=
&quot;;color:windowtext"> David Nystr=F6m [mailto:david.c.nystrom@gmail.com=
]
<br>
<b>Sent:</b> Thursday, February 27, 2014 12:37 AM<br>
<b>To:</b> Sardan Alexandru Cezar-B41700; David Nystr=F6m; Richard Purdie<b=
r>
<b>Cc:</b> Udma Catalin-Dan-B32721; openembedded-core@lists.openembedded.or=
g<br>
<b>Subject:</b> Re: [OE-core] [PATCH] Revert &quot;cross-canadian: Handle p=
owerpc linux verses linux-gnuspe&quot;<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On 2014-02-26 19:29, <a href=3D"mailto:alexandru.sar=
dan@freescale.com">
alexandru.sardan@freescale.com</a> wrote:<o:p></o:p></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre>Hi David,<o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>Sorry for the late reply.<o:p></o:p></pre>
<pre>I'm not familiar with the procedure for submitting a patch to Poky. <o=
:p></o:p></pre>
<pre>Could you walk me through the process?<o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>Meanwhile I've attached the patch to this e-mail. It's been tested<o:p=
></o:p></pre>
<pre>on e500v2, e5500 and e6500.<o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>Kind regards,<o:p></o:p></pre>
<pre>Alex<o:p></o:p></pre>
</blockquote>
<p class=3D"MsoNormal"><br>
Hi,<br>
<br>
You patch looks fine to me. A couple of comments though:<br>
<br>
You should use git send-mail to send it to oe-core, and your patch on GCC n=
eeds an upstream status.<br>
i.e. Plans of how and if this will be upstreamed to GCC.<br>
<br>
Details:<br>
<a href=3D"https://wiki.yoctoproject.org/wiki/Contribution_Guidelines">http=
s://wiki.yoctoproject.org/wiki/Contribution_Guidelines</a><br>
<br>
Was able to build a working SDK compiler for p1025twr.<br>
<br>
When this has brewed in the Autobuilder for a while, it should be backporte=
d to dora as well.<br>
<br>
Br,<br>
David<br>
<br>
<br>
<br>
<o:p></o:p></p>
<pre><o:p>&nbsp;</o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre>-----Original Message-----<o:p></o:p></pre>
<pre>From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.o=
rg">openembedded-core-bounces@lists.openembedded.org</a><o:p></o:p></pre>
<pre>[<a href=3D"mailto:openembedded-core-bounces@lists.openembedded.org">m=
ailto:openembedded-core-bounces@lists.openembedded.org</a>] On Behalf Of<o:=
p></o:p></pre>
<pre>David Nystr=F6m<o:p></o:p></pre>
<pre>Sent: Tuesday, February 11, 2014 12:08 PM<o:p></o:p></pre>
<pre>To: Sardan Alexandru Cezar-B41700; Richard Purdie<o:p></o:p></pre>
<pre>Cc: Udma Catalin-Dan-B32721; <a href=3D"mailto:openembedded-core@lists=
.openembedded.org">openembedded-core@lists.openembedded.org</a><o:p></o:p><=
/pre>
<pre>Subject: Re: [OE-core] [PATCH] Revert &quot;cross-canadian: Handle pow=
erpc<o:p></o:p></pre>
<pre>linux verses linux-gnuspe&quot;<o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>On 2014-01-31 19:17, <a href=3D"mailto:alexandru.sardan@freescale.com"=
>alexandru.sardan@freescale.com</a> wrote:<o:p></o:p></pre>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre>Hi,<o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>Sure, I'll do this and also some more extensive testing<o:p></o:p></pr=
e>
<pre>on the boards.<o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>Thanks,<o:p></o:p></pre>
<pre>Alex<o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
</blockquote>
<pre><o:p>&nbsp;</o:p></pre>
<pre>Hi Alex,<o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>Whats the status on this ?<o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>Br,<o:p></o:p></pre>
<pre>David<o:p></o:p></pre>
<pre>_______________________________________________<o:p></o:p></pre>
<pre>Openembedded-core mailing list<o:p></o:p></pre>
<pre><a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><o:p></o:p></pre>
<pre><a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<o:p></o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
</blockquote>
<pre><o:p>&nbsp;</o:p></pre>
<p class=3D"MsoNormal"><br>
<br>
<br>
<o:p></o:p></p>
<pre>_______________________________________________<o:p></o:p></pre>
<pre>Openembedded-core mailing list<o:p></o:p></pre>
<pre><a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><o:p></o:p></pre>
<pre><a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<o:p></o:p></pre>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_35f08d5a28b44a5f95960eac853b3af6DM2PR03MB368namprd03pro_--
