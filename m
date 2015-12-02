Return-Path: <chris.trobridge@ultra-aep.com>
X-Greylist: delayed 370 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 02 Dec 2015 15:33:08 UTC
Received: from eu-smtp-delivery-154.mimecast.com
	(eu-smtp-delivery-154.mimecast.com [207.82.80.154])
	by mail.openembedded.org (Postfix) with ESMTP id 79C7E605FE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 15:33:08 +0000 (UTC)
Received: from AEP-CAS-UK-01.ULTRA-AEP.COM (86.188.236.241 [86.188.236.241])
	(Using TLS) by eu-smtp-1.mimecast.com with ESMTP id
	uk-mta-22-aH2YVtD8Raagop3A-__9yg-1; Wed, 02 Dec 2015 15:26:58 +0000
Received: from AEP-EXCH-UK-01.ULTRA-AEP.COM ([::1]) by
	AEP-CAS-UK-01.ULTRA-AEP.COM ([fe80::54ca:8df3:2d2c:8ab4%19]) with mapi
	id 14.02.0309.002; Wed, 2 Dec 2015 15:26:57 +0000
From: Chris Trobridge <Chris.Trobridge@ULTRA-AEP.COM>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: python3 dbus
Thread-Index: AdEtElIorLQ1wjPKTiKiNCgVS+7nZA==
Date: Wed, 2 Dec 2015 15:26:56 +0000
Message-ID: <C9B171200FE9514799693A59F76A8F1501A0949293@AEP-EXCH-UK-01.ULTRA-AEP.COM>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.43.10.45]
x-loop: 1
MIME-Version: 1.0
X-MC-Unique: aH2YVtD8Raagop3A-__9yg-1
Subject: python3 dbus
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
X-List-Received-Date: Wed, 02 Dec 2015 15:33:12 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_C9B171200FE9514799693A59F76A8F1501A0949293AEPEXCHUK01UL_"

--_000_C9B171200FE9514799693A59F76A8F1501A0949293AEPEXCHUK01UL_
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I have a dbus-based service written in python3 that I want run on a Yocto s=
ystem.

I can run python3 and have patched a few python module recipes to python3 b=
ut the big outstanding issue is dbus, and gi.repository.GObject in particul=
ar.

I can see various discussions about keeping this up to date on python2 (met=
a-gir).

I would like some advice on whether I would be better off back-porting the =
python3 service to 2.7 (which would be disappointing but not a major undert=
aking) or whether it would be reasonable to modify the existing python 2.7 =
dbus/gobject  recipes to python3.

I am tending to back-porting to 2.7 but I am not 100% confident that dbus/g=
object works with either version of python in Yocto?

All opinions welcome!

Regards,
Chris

Ultra Electronics AEP is a trading name of Ultra Electronics Ltd. This emai=
l and any attachments to it are confidential to the intended recipient and =
may also be privileged. If you have received it in error please notify the =
sender and delete it from your system. If you are not the intended recipien=
t you must not copy it or use it for any purpose nor disclose or distribute=
 its contents to any other person. All communications may be subject to int=
erception or monitoring for operational and/or security purposes. Please re=
ly on your own virus checking as the sender cannot accept any liability for=
 any damage arising from any bug or virus infection. Ultra Electronics Ltd =
is a company registered in England and Wales, registration number 02830644.=
 The Registered office address is 417 Bridport Road, Greenford, Middlesex, =
UB6 8UA.
---------------------------------------------------------------------------=
-----------
This email message has been delivered safely and archived online by Mimecas=
t.
For more information please visit http://www.mimecast.com=20
---------------------------------------------------------------------------=
------------

--_000_C9B171200FE9514799693A59F76A8F1501A0949293AEPEXCHUK01UL_
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style>
<!--
@font-face
=09{font-family:Calibri}
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0cm;
=09margin-bottom:.0001pt;
=09font-size:11.0pt;
=09font-family:"Calibri","sans-serif"}
a:link, span.MsoHyperlink
=09{color:blue;
=09text-decoration:underline}
a:visited, span.MsoHyperlinkFollowed
=09{color:purple;
=09text-decoration:underline}
span.EmailStyle17
=09{font-family:"Calibri","sans-serif";
=09color:windowtext}
.MsoChpDefault
=09{font-family:"Calibri","sans-serif"}
@page WordSection1
=09{margin:72.0pt 72.0pt 72.0pt 72.0pt}
div.WordSection1
=09{}
-->
</style>
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple">     =20
   =20
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">I have a dbus-based service written in python3 that =
I want run on a Yocto system.</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">I can run python3 and have patched a few python modu=
le recipes to python3 but the big outstanding issue is dbus, and gi.reposit=
ory.GObject in particular.</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">I can see various discussions about keeping this up =
to date on python2 (meta-gir).</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">I would like some advice on whether I would be bette=
r off back-porting the python3 service to 2.7 (which would be disappointing=
 but not a major undertaking) or whether it would be reasonable to modify t=
he existing python 2.7 dbus/gobject
 &nbsp;recipes to python3.</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">I am tending to back-porting to 2.7 but I am not 100=
% confident that dbus/gobject works with either version of python in Yocto?=
</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">All opinions welcome!</p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal">Regards,</p>
<p class=3D"MsoNormal">Chris</p>
<p class=3D"MsoNormal">&nbsp;</p>
</div>
Ultra Electronics AEP is a trading name of Ultra Electronics Ltd. This emai=
l and any attachments to it are confidential to the intended recipient and =
may also be privileged. If you have received it in error please notify the =
sender and delete it from your system.
 If you are not the intended recipient you must not copy it or use it for a=
ny purpose nor disclose or distribute its contents to any other person. All=
 communications may be subject to interception or monitoring for operationa=
l and/or security purposes. Please
 rely on your own virus checking as the sender cannot accept any liability =
for any damage arising from any bug or virus infection. Ultra Electronics L=
td is a company registered in England and Wales, registration number 028306=
44. The Registered office address
 is 417 Bridport Road, Greenford, Middlesex, UB6 8UA.

    <br />
    <br />
   <span style=3D"font-family:Arial; Font-size:10.0pt">
<hr width=3D"100%" />
This email message has been delivered safely and archived online by Mimecas=
t.<br />
For more information please visit <a href=3D"http://www.mimecast.com">http:=
//www.mimecast.com</a>
<hr width=3D"100%" />
  </span>
=20


</body>
</html>

--_000_C9B171200FE9514799693A59F76A8F1501A0949293AEPEXCHUK01UL_--
