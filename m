Return-Path: <B40527@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe003.messaging.microsoft.com [207.46.163.26])
	by mail.openembedded.org (Postfix) with ESMTP id 29FE66A36E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 04:27:45 +0000 (UTC)
Received: from mail22-co9-R.bigfish.com (10.236.132.233) by
	CO9EHSOBE007.bigfish.com (10.236.130.70) with Microsoft SMTP Server id
	14.1.225.23; Tue, 28 May 2013 04:27:45 +0000
Received: from mail22-co9 (localhost [127.0.0.1])	by mail22-co9-R.bigfish.com
	(Postfix) with ESMTP id 696AC1C028B;
	Tue, 28 May 2013 04:27:45 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -8
X-BigFish: VS-8(zz98dI9371Ic89bhc85bh11f6Nzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz18c58eh17326ah18c673h1c8fb4h1954cbh8275bh8275dhz2dh2a8h5c0h668h839hd24hd2bhf0ah1288h12a5h12bdh137ah139eh1441h1504h1537h162dh1631h1751h1758h17f1h1898h18e1h1946h19b5h1ad9h1b0ah1bceh1d0ch1d2eh1d3fh1155h)
Received: from mail22-co9 (localhost.localdomain [127.0.0.1]) by mail22-co9
	(MessageSwitch) id 1369715263151080_22896;
	Tue, 28 May 2013 04:27:43 +0000 (UTC)
Received: from CO9EHSMHS032.bigfish.com (unknown [10.236.132.241])	by
	mail22-co9.bigfish.com (Postfix) with ESMTP id 2114130027A;
	Tue, 28 May 2013 04:27:43 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS032.bigfish.com
	(10.236.130.42) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 28 May 2013 04:27:42 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Tue, 28 May 2013 04:28:37 +0000
Received: from b40527c60e6e6f (b40527-c60e6e6f.ap.freescale.net
	[10.192.208.151])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r4S4Rb2i021768;	Mon, 27 May 2013 21:27:39 -0700
From: Zongchun YU <b40527@freescale.com>
To: 'Otavio Salvador' <otavio@ossystems.com.br>
References: <1369119875-4984-1-git-send-email-b40527@freescale.com>	<CAJTo0LZA89rPdGy65ShyfxjS4jenHsinO5JPsTbWNi3sgOD=Eg@mail.gmail.com>	<000701ce5b4e$3c7684e0$b5638ea0$@com>
	<CAP9ODKo8453_vw-9u+8308vsvy3zRoSk0ptoEzgo8gFpwp76SQ@mail.gmail.com>
In-Reply-To: <CAP9ODKo8453_vw-9u+8308vsvy3zRoSk0ptoEzgo8gFpwp76SQ@mail.gmail.com>
Date: Tue, 28 May 2013 12:28:13 +0800
Message-ID: <000f01ce5b5b$c64e39d0$52eaad70$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Ac5bUaPdmXz3lOt2TR+zD0FnlcMetwACNF4w
X-OriginatorOrg: freescale.com
Cc: 'OE-core' <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files:fix the command line wrap around issue
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
X-List-Received-Date: Tue, 28 May 2013 04:27:45 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0010_01CE5B9E.D47179D0"
Content-Language: en-us

------=_NextPart_000_0010_01CE5B9E.D47179D0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

It seems that setting it in environment is a workaround for the real =
issue.
Can't the same be accomplished changing busybox settings?

=20

Can you explain your idea in detail? Do you mean changing the setting of
=A1=B0resize=A1=B1 in busybox or other?

Thank you very much!

=20

Best Regards

Zongchun

=B7=A2=BC=FE=C8=CB: otavio.salvador@gmail.com =
[mailto:otavio.salvador@gmail.com] =B4=FA=B1=ED
Otavio Salvador
=B7=A2=CB=CD=CA=B1=BC=E4: Tuesday, May 28, 2013 11:15 AM
=CA=D5=BC=FE=C8=CB: Zongchun YU
=B3=AD=CB=CD: Burton, Ross; OE-core
=D6=F7=CC=E2: Re: [OE-core] [PATCH] base-files:fix the command line wrap =
around
issue

=20

=20

=20

On Mon, May 27, 2013 at 11:51 PM, Zongchun YU <b40527@freescale.com> =
wrote:

Hello Ross.

=20

Do you have any other comments about this patch?

=20

It seems that setting it in environment is a workaround for the real =
issue.
Can't the same be accomplished changing busybox settings?=20

=20

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


------=_NextPart_000_0010_01CE5B9E.D47179D0
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; charset=3Dgb2312">
<meta name=3DGenerator content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Microsoft YaHei";
	panose-1:2 11 5 3 2 2 4 2 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@Microsoft YaHei";
	panose-1:2 11 5 3 2 2 4 2 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page Section1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.Section1
	{page:Section1;}
-->
</style>
<!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]-->
</head>

<body lang=3DZH-CN link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><span lang=3DEN-US>It seems that setting it in =
environment is
a workaround for the real issue. Can't the same be accomplished changing
busybox settings?</span><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:
"Calibri","sans-serif";color:#1F497D'><o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'>Can you explain your idea in detail? Do you mean changing =
the
setting of &nbsp;=A1=B0resize=A1=B1 in busybox or =
other?<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'>Thank you very much!<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'>Best Regards<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'>Zongchun<o:p></o:p></span></p>

<div style=3D'border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt =
0cm 0cm 0cm'>

<p class=3DMsoNormal><b><span =
style=3D'font-size:10.0pt;font-family:"Microsoft =
YaHei","sans-serif"'>=B7=A2=BC=FE=C8=CB</span></b><b><span
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'>:</span></b>=
<span
lang=3DEN-US style=3D'font-size:10.0pt;font-family:SimSun'> =
otavio.salvador@gmail.com
[mailto:otavio.salvador@gmail.com] </span><b><span =
style=3D'font-size:10.0pt;
font-family:"Microsoft =
YaHei","sans-serif"'>=B4=FA=B1=ED</span></b><b><span
style=3D'font-size:10.0pt;font-family:SimSun'> </span></b><span =
lang=3DEN-US
style=3D'font-size:10.0pt;font-family:SimSun'>Otavio Salvador<br>
</span><b><span style=3D'font-size:10.0pt;font-family:"Microsoft =
YaHei","sans-serif"'>=B7=A2=CB=CD=CA=B1=BC=E4</span></b><b><span
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'>:</span></b>=
<span
lang=3DEN-US style=3D'font-size:10.0pt;font-family:SimSun'> Tuesday, May =
28, 2013
11:15 AM<br>
</span><b><span style=3D'font-size:10.0pt;font-family:"Microsoft =
YaHei","sans-serif"'>=CA=D5=BC=FE=C8=CB</span></b><b><span
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'>:</span></b>=
<span
lang=3DEN-US style=3D'font-size:10.0pt;font-family:SimSun'> Zongchun =
YU<br>
</span><b><span style=3D'font-size:10.0pt;font-family:"Microsoft =
YaHei","sans-serif"'>=B3=AD=CB=CD</span></b><b><span
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'>:</span></b>=
<span
lang=3DEN-US style=3D'font-size:10.0pt;font-family:SimSun'> Burton, =
Ross; OE-core<br>
</span><b><span style=3D'font-size:10.0pt;font-family:"Microsoft =
YaHei","sans-serif"'>=D6=F7=CC=E2</span></b><b><span
lang=3DEN-US =
style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'>:</span></b>=
<span
lang=3DEN-US style=3D'font-size:10.0pt;font-family:SimSun'> Re: =
[OE-core] [PATCH]
base-files:fix the command line wrap around issue<o:p></o:p></span></p>

</div>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<div>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<div>

<p class=3DMsoNormal style=3D'margin-bottom:12.0pt'><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<div>

<p class=3DMsoNormal><span lang=3DEN-US>On Mon, May 27, 2013 at 11:51 =
PM, Zongchun
YU &lt;<a href=3D"mailto:b40527@freescale.com" =
target=3D"_blank">b40527@freescale.com</a>&gt;
wrote:<o:p></o:p></span></p>

<div>

<div>

<div>

<p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span
lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'>Hello Ross.</span><span =
lang=3DEN-US><o:p></o:p></span></p>

<p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span
lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'>&nbsp;</span><span lang=3DEN-US><o:p></o:p></span></p>

<p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span
lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'>Do you have any other comments about this =
patch?</span><span
lang=3DEN-US><o:p></o:p></span></p>

</div>

</div>

</div>

<div>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

</div>

<div>

<p class=3DMsoNormal><span lang=3DEN-US>It seems that setting it in =
environment is
a workaround for the real issue. Can't the same be accomplished changing
busybox settings?&nbsp;<o:p></o:p></span></p>

</div>

</div>

<div>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

</div>

<p class=3DMsoNormal><span lang=3DEN-US>-- <br>
Otavio Salvador &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" =
target=3D"_blank">http://www.ossystems.com.br</a>
&nbsp; &nbsp; &nbsp; &nbsp;<a href=3D"http://projetos.ossystems.com.br"
target=3D"_blank">http://projetos.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;Mobile: +1
(347) 903-9750<o:p></o:p></span></p>

</div>

</div>

</div>

</body>

</html>

------=_NextPart_000_0010_01CE5B9E.D47179D0--
