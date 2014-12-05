Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id F08FD65DAC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 14:26:23 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-04.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Xwtpv-0000gJ-D4 from Awais_Belal@mentor.com ;
	Fri, 05 Dec 2014 06:26:23 -0800
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.55]) by
	SVR-IES-FEM-04.mgc.mentorg.com ([137.202.0.110]) with mapi id
	14.03.0181.006; Fri, 5 Dec 2014 14:26:22 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] libxcb: fix socket writes
Thread-Index: AQHQEIBUJq9RPrqydEKzD8wqNSn5EJyA+kGAgAATSNM=
Date: Fri, 5 Dec 2014 14:26:21 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28E9FDF811@EU-MBX-03.mgc.mentorg.com>
References: <1417779643-18350-1-git-send-email-awais_belal@mentor.com>,
	<CAJTo0LZ1=H4Gz90Ni0sFjL29LMgqMXR18ZTv0uOjLCtsziboEg@mail.gmail.com>
In-Reply-To: <CAJTo0LZ1=H4Gz90Ni0sFjL29LMgqMXR18ZTv0uOjLCtsziboEg@mail.gmail.com>
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
X-List-Received-Date: Fri, 05 Dec 2014 14:26:29 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_2021B186DC632746BD5A3CE32F12BD28E9FDF811EUMBX03mgcmento_"

--_000_2021B186DC632746BD5A3CE32F12BD28E9FDF811EUMBX03mgcmento_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I will look into the version upgrade. Can this be merged to dizzy?

BR,
Awais
________________________________
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Burton, Ross [ross.burton@intel=
.com]
Sent: Friday, December 05, 2014 6:16 PM
To: Awais Belal
Cc: OE-core
Subject: Re: [OE-core] [PATCH] libxcb: fix socket writes


On 5 December 2014 at 11:40, Awais Belal <awais.belal@gmail.com<mailto:awai=
s.belal@gmail.com>> wrote:
The patch has been picked up from libxcb git and is only
applicable to v1.10 while it gets fixed in mainstream v1.11.

If it's fixed in 1.11 then an upgrade to 1.11 is preferred.

Ross

--_000_2021B186DC632746BD5A3CE32F12BD28E9FDF811EUMBX03mgcmento_
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
10pt;">I will look into the version upgrade. Can this be merged to dizzy?<b=
r>
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
<div style=3D"direction: ltr;" id=3D"divRpF507926"><font size=3D"2" color=
=3D"#000000" face=3D"Tahoma"><b>From:</b> openembedded-core-bounces@lists.o=
penembedded.org [openembedded-core-bounces@lists.openembedded.org] on behal=
f of Burton, Ross [ross.burton@intel.com]<br>
<b>Sent:</b> Friday, December 05, 2014 6:16 PM<br>
<b>To:</b> Awais Belal<br>
<b>Cc:</b> OE-core<br>
<b>Subject:</b> Re: [OE-core] [PATCH] libxcb: fix socket writes<br>
</font><br>
</div>
<div></div>
<div>
<div dir=3D"ltr">
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">On 5 December 2014 at 11:40, Awais Belal <span d=
ir=3D"ltr">
&lt;<a href=3D"mailto:awais.belal@gmail.com" target=3D"_blank">awais.belal@=
gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex; border-left:1=
px #ccc solid; padding-left:1ex">
<div id=3D":3zy" class=3D"a3s" style=3D"overflow:hidden">The patch has been=
 picked up from libxcb git and is only<br>
applicable to v1.10 while it gets fixed in mainstream v1.11.</div>
</blockquote>
</div>
<br>
If it's fixed in 1.11 then an upgrade to 1.11 is preferred.</div>
<div class=3D"gmail_extra"><br>
</div>
<div class=3D"gmail_extra">Ross</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_2021B186DC632746BD5A3CE32F12BD28E9FDF811EUMBX03mgcmento_--
