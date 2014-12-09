Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 71FE87250B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 11:33:05 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XyJ2O-0003Ed-Kc from Awais_Belal@mentor.com ;
	Tue, 09 Dec 2014 03:33:05 -0800
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.55]) by
	SVR-IES-FEM-03.mgc.mentorg.com ([137.202.0.108]) with mapi id
	14.03.0181.006; Tue, 9 Dec 2014 11:33:03 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "Burton, Ross" <ross.burton@intel.com>, Armin Kuster <akuster808@gmail.com>
Thread-Topic: [OE-core] [PATCH] libxcb: fix socket writes
Thread-Index: AQHQEIBUJq9RPrqydEKzD8wqNSn5EJyA+kGAgAATSNOAAAlAAIACn8DVgAHfwICAAZBHLA==
Date: Tue, 9 Dec 2014 11:33:02 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28E9FE0F71@EU-MBX-03.mgc.mentorg.com>
References: <1417779643-18350-1-git-send-email-awais_belal@mentor.com>
	<CAJTo0LZ1=H4Gz90Ni0sFjL29LMgqMXR18ZTv0uOjLCtsziboEg@mail.gmail.com>
	<2021B186DC632746BD5A3CE32F12BD28E9FDF811@EU-MBX-03.mgc.mentorg.com>
	<CAJTo0LY0-X-w2uarbL7bKKCjirw6JUi-w6GXO2Qm3f0zPmcJTA@mail.gmail.com>
	<2021B186DC632746BD5A3CE32F12BD28E9FDFB15@EU-MBX-03.mgc.mentorg.com>,
	<CAJTo0LbO4oz9vE5JWUKcaSyKycY2JnaCb3ZmZjmU8Q_cXqUAVA@mail.gmail.com>
In-Reply-To: <CAJTo0LbO4oz9vE5JWUKcaSyKycY2JnaCb3ZmZjmU8Q_cXqUAVA@mail.gmail.com>
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
X-List-Received-Date: Tue, 09 Dec 2014 11:33:10 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_2021B186DC632746BD5A3CE32F12BD28E9FE0F71EUMBX03mgcmento_"

--_000_2021B186DC632746BD5A3CE32F12BD28E9FE0F71EUMBX03mgcmento_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

Is this acceptable for the dizzy branch or do I need to resubmit with the t=
ag?

BR,
Awais
________________________________
From: Burton, Ross [ross.burton@intel.com]
Sent: Monday, December 08, 2014 4:39 PM
To: Belal, Awais; Armin Kuster
Cc: OE-core
Subject: Re: [OE-core] [PATCH] libxcb: fix socket writes


On 7 December 2014 at 07:03, Belal, Awais <Awais_Belal@mentor.com<mailto:Aw=
ais_Belal@mentor.com>> wrote:
Do I need to resubmit this with [dizzy] tag or will this work?

If you don't include the [dizzy] tag then you'll need to ping Armin Kuster,=
 who is the dizzy maintainer (I've CC'd him to this mail).

Ross

--_000_2021B186DC632746BD5A3CE32F12BD28E9FE0F71EUMBX03mgcmento_
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
10pt;">Hi Armin,<br>
<br>
Is this acceptable for the dizzy branch or do I need to resubmit with the t=
ag?<br>
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
<div style=3D"direction: ltr;" id=3D"divRpF734022"><font size=3D"2" color=
=3D"#000000" face=3D"Tahoma"><b>From:</b> Burton, Ross [ross.burton@intel.c=
om]<br>
<b>Sent:</b> Monday, December 08, 2014 4:39 PM<br>
<b>To:</b> Belal, Awais; Armin Kuster<br>
<b>Cc:</b> OE-core<br>
<b>Subject:</b> Re: [OE-core] [PATCH] libxcb: fix socket writes<br>
</font><br>
</div>
<div></div>
<div>
<div dir=3D"ltr">
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">On 7 December 2014 at 07:03, Belal, Awais <span =
dir=3D"ltr">
&lt;<a href=3D"mailto:Awais_Belal@mentor.com" target=3D"_blank">Awais_Belal=
@mentor.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left:1=
px #ccc solid; padding-left:1ex">
<div style=3D"direction:ltr; font-family:Tahoma; color:#000000; font-size:1=
0pt">Do I need to resubmit this with [dizzy] tag or will this work?<br>
<div></div>
</div>
</blockquote>
</div>
<br>
If you don't include the [dizzy] tag then you'll need to ping Armin Kuster,=
 who is the dizzy maintainer (I've CC'd him to this mail).</div>
<div class=3D"gmail_extra"><br>
</div>
<div class=3D"gmail_extra">Ross</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_2021B186DC632746BD5A3CE32F12BD28E9FE0F71EUMBX03mgcmento_--
