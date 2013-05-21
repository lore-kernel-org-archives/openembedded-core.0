Return-Path: <B40527@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe005.messaging.microsoft.com [207.46.163.28])
	by mail.openembedded.org (Postfix) with ESMTP id 5D2A8696A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 11:20:52 +0000 (UTC)
Received: from mail180-co9-R.bigfish.com (10.236.132.232) by
	CO9EHSOBE036.bigfish.com (10.236.130.99) with Microsoft SMTP Server id
	14.1.225.23; Tue, 21 May 2013 11:20:52 +0000
Received: from mail180-co9 (localhost [127.0.0.1])	by
	mail180-co9-R.bigfish.com (Postfix) with ESMTP id BE5B4C80835;
	Tue, 21 May 2013 11:20:52 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(z3e12hz98dIc89bhc857hzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz177df4h17326ah18c673h1c8fb4h8275bh8275dhz2dh2a8h5c0h668h839hd24hd2bhf0ah1288h12a5h12bdh137ah139eh1441h1504h1537h162dh1631h1751h1758h17f1h1898h18e1h1946h19b5h1ad9h1b0ah1bceh1d0ch1d2eh1d3fh1155h)
Received: from mail180-co9 (localhost.localdomain [127.0.0.1]) by mail180-co9
	(MessageSwitch) id 136913525143543_22869;
	Tue, 21 May 2013 11:20:51 +0000 (UTC)
Received: from CO9EHSMHS007.bigfish.com (unknown [10.236.132.245])	by
	mail180-co9.bigfish.com (Postfix) with ESMTP id 00B76C0007A;
	Tue, 21 May 2013 11:20:51 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS007.bigfish.com
	(10.236.130.17) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 21 May 2013 11:20:49 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Tue, 21 May 2013 11:21:27 +0000
Received: from b40527c60e6e6f (b40527-c60e6e6f.ap.freescale.net
	[10.192.208.151])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r4LBKftS009405;	Tue, 21 May 2013 04:20:43 -0700
From: Zongchun YU <b40527@freescale.com>
To: "'Burton, Ross'" <ross.burton@intel.com>, 'OE-core'
	<openembedded-core@lists.openembedded.org>
References: <1369119875-4984-1-git-send-email-b40527@freescale.com>
	<CAJTo0LZA89rPdGy65ShyfxjS4jenHsinO5JPsTbWNi3sgOD=Eg@mail.gmail.com>
In-Reply-To: <CAJTo0LZA89rPdGy65ShyfxjS4jenHsinO5JPsTbWNi3sgOD=Eg@mail.gmail.com>
Date: Tue, 21 May 2013 19:20:43 +0800
Message-ID: <002d01ce5615$3eac1510$bc043f30$@com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Ac5WBfoI0pp2nb90TrmO5jmBt/iTTgABkI/g
X-OriginatorOrg: freescale.com
Subject: =?UTF-8?B?562U5aSNOiBbUEFUQ0hdIGJhc2UtZmlsZXM6Zml4IHRoZSBjb21tYW5kIGxpbmUgd3JhcCBhcm91bmQgaXNzdWU=?=
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
X-List-Received-Date: Tue, 21 May 2013 11:20:52 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_002E_01CE5658.4CCF5510"
Content-Language: zh-cn

------=_NextPart_000_002E_01CE5658.4CCF5510
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Ross.

Thanks for your comments, I am sorry. the description is not clear.  =
please see the below content:

Sometimes we may use long commands. For example:

Normal display:

user@host:~cmd arg1 arg2 arg3 arg4 =
arg5=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=A6argn-1 argn

|                                                                        =
                              |

1                                                                        =
                             80

Our board display:

argn@host:~cmd arg1 arg2 arg3 arg4 =
arg5=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=A6argn-1

|                                                                        =
                              |

1                                                                        =
                             80

=20

When the number of character is more than 80, the following character

will cover the character before. I.e =E2=80=9Cargn=E2=80=9D cover =
=E2=80=9Cuser=E2=80=9D.

=20

We tried to add "if [ -f /usr/bin/resize ]; then /usr/bin/resize > =
/dev/null; fi" to /etc/profile before.

But when we boot up the board and login using our test tool, we met some =
invalid characters.

So we give up the choice and only add =E2=80=9CCOLUMNS=3D2000=E2=80=9D =
to /etc/profile.

=20

I know it is a bad workaround, Do you have a good method to overcome the =
issue?

=20

Best Regards

Zongchun

=E5=8F=91=E4=BB=B6=E4=BA=BA: Burton, Ross [mailto:ross.burton@intel.com] =

=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2013=E5=B9=B45=E6=9C=8821=E6=97=A5 =
17:31
=E6=94=B6=E4=BB=B6=E4=BA=BA: b40527@freescale.com; OE-core
=E4=B8=BB=E9=A2=98: Re: [OE-core] [PATCH] base-files:fix the command =
line wrap around issue

=20

On Tuesday, 21 May 2013, wrote:

+export COLUMNS=3D2000

=20

But there are not 2000 columns, you're just hard-coding a value that is =
expected to dynamically change.

=20

i.e, on my desktop in a gnome-terminal:

=20

$ echo $COLUMNS

80

=20

Then if I resize the window:

=20

$ echo $COLUMNS

117

=20

This is a bad workaround, can you explain the actual problem?  Are you =
not seeing wrapping at a VT, in a terminal, or what?

=20

Ross


------=_NextPart_000_002E_01CE5658.4CCF5510
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" =
xmlns:p=3D"urn:schemas-microsoft-com:office:powerpoint" =
xmlns:a=3D"urn:schemas-microsoft-com:office:access" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" =
xmlns:s=3D"uuid:BDC6E3F0-6DA3-11d1-A2A3-00AA00C14882" =
xmlns:rs=3D"urn:schemas-microsoft-com:rowset" xmlns:z=3D"#RowsetSchema" =
xmlns:b=3D"urn:schemas-microsoft-com:office:publisher" =
xmlns:ss=3D"urn:schemas-microsoft-com:office:spreadsheet" =
xmlns:c=3D"urn:schemas-microsoft-com:office:component:spreadsheet" =
xmlns:odc=3D"urn:schemas-microsoft-com:office:odc" =
xmlns:oa=3D"urn:schemas-microsoft-com:office:activation" =
xmlns:html=3D"http://www.w3.org/TR/REC-html40" =
xmlns:q=3D"http://schemas.xmlsoap.org/soap/envelope/" =
xmlns:rtc=3D"http://microsoft.com/officenet/conferencing" =
xmlns:D=3D"DAV:" xmlns:Repl=3D"http://schemas.microsoft.com/repl/" =
xmlns:mt=3D"http://schemas.microsoft.com/sharepoint/soap/meetings/" =
xmlns:x2=3D"http://schemas.microsoft.com/office/excel/2003/xml" =
xmlns:ppda=3D"http://www.passport.com/NameSpace.xsd" =
xmlns:ois=3D"http://schemas.microsoft.com/sharepoint/soap/ois/" =
xmlns:dir=3D"http://schemas.microsoft.com/sharepoint/soap/directory/" =
xmlns:ds=3D"http://www.w3.org/2000/09/xmldsig#" =
xmlns:dsp=3D"http://schemas.microsoft.com/sharepoint/dsp" =
xmlns:udc=3D"http://schemas.microsoft.com/data/udc" =
xmlns:xsd=3D"http://www.w3.org/2001/XMLSchema" =
xmlns:sub=3D"http://schemas.microsoft.com/sharepoint/soap/2002/1/alerts/"=
 xmlns:ec=3D"http://www.w3.org/2001/04/xmlenc#" =
xmlns:sp=3D"http://schemas.microsoft.com/sharepoint/" =
xmlns:sps=3D"http://schemas.microsoft.com/sharepoint/soap/" =
xmlns:xsi=3D"http://www.w3.org/2001/XMLSchema-instance" =
xmlns:udcs=3D"http://schemas.microsoft.com/data/udc/soap" =
xmlns:udcxf=3D"http://schemas.microsoft.com/data/udc/xmlfile" =
xmlns:udcp2p=3D"http://schemas.microsoft.com/data/udc/parttopart" =
xmlns:wf=3D"http://schemas.microsoft.com/sharepoint/soap/workflow/" =
xmlns:dsss=3D"http://schemas.microsoft.com/office/2006/digsig-setup" =
xmlns:dssi=3D"http://schemas.microsoft.com/office/2006/digsig" =
xmlns:mdssi=3D"http://schemas.openxmlformats.org/package/2006/digital-sig=
nature" =
xmlns:mver=3D"http://schemas.openxmlformats.org/markup-compatibility/2006=
" xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns:mrels=3D"http://schemas.openxmlformats.org/package/2006/relationshi=
ps" xmlns:spwp=3D"http://microsoft.com/sharepoint/webpartpages" =
xmlns:ex12t=3D"http://schemas.microsoft.com/exchange/services/2006/types"=
 =
xmlns:ex12m=3D"http://schemas.microsoft.com/exchange/services/2006/messag=
es" =
xmlns:pptsl=3D"http://schemas.microsoft.com/sharepoint/soap/SlideLibrary/=
" =
xmlns:spsl=3D"http://microsoft.com/webservices/SharePointPortalServer/Pub=
lishedLinksService" xmlns:Z=3D"urn:schemas-microsoft-com:" =
xmlns:st=3D"&#1;" xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8">
<meta name=3DGenerator content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:=E5=AE=8B=E4=BD=93;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:=E5=AE=8B=E4=BD=93;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=E5=AE=8B=E4=BD=93";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:=E5=AE=8B=E4=BD=93;}
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
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
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

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'>Hello Ross.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'>Thanks for your comments, I am sorry. the description is =
not
clear. =C2=A0please see the below content:<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'>Sometimes we may use long commands. For =
example:<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'>Normal display:<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:red'>user</span><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:
"Calibri","sans-serif";color:#1F497D'>@host:~cmd arg1 arg2 arg3 arg4 =
arg5=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=A6argn-1
</span><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#00B050'>argn</span><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:
"Calibri","sans-serif";color:#1F497D'><o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|<o:p></o:p><=
/span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'>1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A080<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'>Our board display:<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:red'>argn</span><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:
"Calibri","sans-serif";color:#1F497D'>@host:~cmd arg1 arg2 arg3 arg4 =
arg5=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=A6argn-1<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'>|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|<o:p></o:p><=
/span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'>1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A080<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'>When the number of character is more than 80, the =
following character<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'>will cover the character before. I.e =
=E2=80=9Cargn=E2=80=9D cover =
=E2=80=9Cuser=E2=80=9D.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'>We tried to add &quot;if [ -f /usr/bin/resize ]; then
/usr/bin/resize &gt; /dev/null; fi&quot; to /etc/profile =
before.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'>But when we boot up the board and login using our test =
tool, we
met some invalid characters.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'>So we give up the choice and only add =
=E2=80=9CCOLUMNS=3D2000=E2=80=9D to
/etc/profile.<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US =
style=3D'font-size:10.5pt;font-family:"Calibri","sans-serif";
color:#1F497D'>I know it is a bad workaround, Do you have a good method =
to
overcome the issue?<o:p></o:p></span></p>

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
style=3D'font-size:10.0pt'>=E5=8F=91=E4=BB=B6=E4=BA=BA<span =
lang=3DEN-US>:</span></span></b><span
lang=3DEN-US style=3D'font-size:10.0pt'> Burton, Ross
[mailto:ross.burton@intel.com] <br>
</span><b><span =
style=3D'font-size:10.0pt'>=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4<span =
lang=3DEN-US>:</span></span></b><span
lang=3DEN-US style=3D'font-size:10.0pt'> 2013</span><span =
style=3D'font-size:10.0pt'>=E5=B9=B4<span
lang=3DEN-US>5</span>=E6=9C=88<span lang=3DEN-US>21</span>=E6=97=A5<span =
lang=3DEN-US> 17:31<br>
</span><b>=E6=94=B6=E4=BB=B6=E4=BA=BA<span =
lang=3DEN-US>:</span></b><span lang=3DEN-US>
b40527@freescale.com; OE-core<br>
</span><b>=E4=B8=BB=E9=A2=98<span lang=3DEN-US>:</span></b><span =
lang=3DEN-US> Re: [OE-core]
[PATCH] base-files:fix the command line wrap around =
issue<o:p></o:p></span></span></p>

</div>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>On Tuesday, 21 May 2013, =
wrote:<o:p></o:p></span></p>

<p class=3DMsoNormal><span lang=3DEN-US>+export =
COLUMNS=3D2000<o:p></o:p></span></p>

<div>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

</div>

<div>

<p class=3DMsoNormal><span lang=3DEN-US>But there are not 2000 columns, =
you're just
hard-coding a value that is expected to dynamically =
change.<o:p></o:p></span></p>

</div>

<div>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

</div>

<div>

<p class=3DMsoNormal><span lang=3DEN-US>i.e, on my desktop in a =
gnome-terminal:<o:p></o:p></span></p>

</div>

<div>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

</div>

<div>

<div>

<p class=3DMsoNormal><span lang=3DEN-US>$ echo =
$COLUMNS<o:p></o:p></span></p>

</div>

<div>

<p class=3DMsoNormal><span lang=3DEN-US>80<o:p></o:p></span></p>

</div>

<div>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

</div>

<div>

<p class=3DMsoNormal><span lang=3DEN-US>Then if I resize the =
window:<o:p></o:p></span></p>

</div>

<div>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

</div>

<div>

<p class=3DMsoNormal><span lang=3DEN-US>$ echo =
$COLUMNS<o:p></o:p></span></p>

</div>

<div>

<p class=3DMsoNormal><span lang=3DEN-US>117<o:p></o:p></span></p>

</div>

</div>

<div>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

</div>

<div>

<p class=3DMsoNormal><span lang=3DEN-US>This is a bad workaround, can =
you explain
the actual problem? &nbsp;Are you not seeing wrapping at a VT, in a =
terminal,
or what?<o:p></o:p></span></p>

</div>

<div>

<p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p>

</div>

<div>

<p class=3DMsoNormal><span lang=3DEN-US>Ross<o:p></o:p></span></p>

</div>

</div>

</body>

</html>

------=_NextPart_000_002E_01CE5658.4CCF5510--
