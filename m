Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id E729D723FA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Dec 2014 07:03:16 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XxVs9-0005LA-0v from Awais_Belal@mentor.com ;
	Sat, 06 Dec 2014 23:03:13 -0800
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.55]) by
	SVR-IES-FEM-03.mgc.mentorg.com ([137.202.0.108]) with mapi id
	14.03.0181.006; Sun, 7 Dec 2014 07:03:11 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] libxcb: fix socket writes
Thread-Index: AQHQEIBUJq9RPrqydEKzD8wqNSn5EJyA+kGAgAATSNOAAAlAAIACn8DV
Date: Sun, 7 Dec 2014 07:03:10 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28E9FDFB15@EU-MBX-03.mgc.mentorg.com>
References: <1417779643-18350-1-git-send-email-awais_belal@mentor.com>
	<CAJTo0LZ1=H4Gz90Ni0sFjL29LMgqMXR18ZTv0uOjLCtsziboEg@mail.gmail.com>
	<2021B186DC632746BD5A3CE32F12BD28E9FDF811@EU-MBX-03.mgc.mentorg.com>,
	<CAJTo0LY0-X-w2uarbL7bKKCjirw6JUi-w6GXO2Qm3f0zPmcJTA@mail.gmail.com>
In-Reply-To: <CAJTo0LY0-X-w2uarbL7bKKCjirw6JUi-w6GXO2Qm3f0zPmcJTA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxcb: fix socket writes
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
X-List-Received-Date: Sun, 07 Dec 2014 07:03:23 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_2021B186DC632746BD5A3CE32F12BD28E9FDFB15EUMBX03mgcmento_"

--_000_2021B186DC632746BD5A3CE32F12BD28E9FDFB15EUMBX03mgcmento_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

Do I need to resubmit this with [dizzy] tag or will this work?

BR,
Awais
________________________________
From: Burton, Ross [ross.burton@intel.com]
Sent: Friday, December 05, 2014 7:58 PM
To: Belal, Awais
Cc: OE-core
Subject: Re: [OE-core] [PATCH] libxcb: fix socket writes


On 5 December 2014 at 14:26, Belal, Awais <Awais_Belal@mentor.com<mailto:Aw=
ais_Belal@mentor.com>> wrote:
I will look into the version upgrade. Can this be merged to dizzy?

Dizzy would have to be a backported patch as you originally submitted.

Ross

--_000_2021B186DC632746BD5A3CE32F12BD28E9FDFB15EUMBX03mgcmento_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style id=3D"owaParaStyle" type=3D"text/css">P {margin-top:0;margin-bottom:=
0;}</style>
</head>
<body ocsi=3D"0" fpstyle=3D"1">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">Hi Ross,<br>
<br>
Do I need to resubmit this with [dizzy] tag or will this work?<br>
<div><br>
<div style=3D"font-family:Tahoma; font-size:13px"><font face=3D"Tahoma"></f=
ont>
<div style=3D"font-size:13px">
<div><font size=3D"2" face=3D"Tahoma"><span lang=3D"en-US">
<div style=3D"margin:0">BR,</div>
<div style=3D"margin:0"><i>Awais</i></div>
</span></font></div>
</div>
<font face=3D"Tahoma"></font></div>
</div>
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
">
<hr tabindex=3D"-1">
<div style=3D"direction: ltr;" id=3D"divRpF68939"><font size=3D"2" color=3D=
"#000000" face=3D"Tahoma"><b>From:</b> Burton, Ross [ross.burton@intel.com]=
<br>
<b>Sent:</b> Friday, December 05, 2014 7:58 PM<br>
<b>To:</b> Belal, Awais<br>
<b>Cc:</b> OE-core<br>
<b>Subject:</b> Re: [OE-core] [PATCH] libxcb: fix socket writes<br>
</font><br>
</div>
<div></div>
<div>
<div dir=3D"ltr">
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">On 5 December 2014 at 14:26, Belal, Awais <span =
dir=3D"ltr">
&lt;<a href=3D"mailto:Awais_Belal@mentor.com" target=3D"_blank">Awais_Belal=
@mentor.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left:1=
px #ccc solid; padding-left:1ex">
<div style=3D"direction:ltr; font-family:Tahoma; color:#000000; font-size:1=
0pt">I will look into the version upgrade. Can this be merged to dizzy?<br>
<div></div>
</div>
</blockquote>
</div>
<br>
Dizzy would have to be a backported patch as you originally submitted.</div=
>
<div class=3D"gmail_extra"><br>
</div>
<div class=3D"gmail_extra">Ross</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_2021B186DC632746BD5A3CE32F12BD28E9FDFB15EUMBX03mgcmento_--
