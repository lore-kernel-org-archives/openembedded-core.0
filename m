Return-Path: <Awais_Belal@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1ECC433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 18:45:47 +0000 (UTC)
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 by mx.groups.io with SMTP id smtpd.web12.3845.1636656346407391584
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 10:45:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: mentor.com, ip: 68.232.141.98, mailfrom: awais_belal@mentor.com)
IronPort-SDR: 
 8UbL5Yx2kTH0806wnWShV8si9UrTFZn33E3ccngTdUtBlokzdwqBZOmRqBx+txppPTD2Lsew44
 iMWQv2AfQRhSiNwLNepJ9Iy8BX1Jf0gk/wKqWQme8CFIz+VHncVqUTWikohvbTKGK20T0I8cfg
 K72n8Yuqia2ua9vCCcbnCrVTbatmGFkVXm5be6nbniveymFov5MpL8ma/5ZS04F/HDsKZVLBpO
 M0/3CGjR7gEnbKNmtpdFnPxONw24876PXI4KSb/JY4e0pbZ/Vm44N7d5MNZg9QxYQ49TesIth+
 cLtu9SxySW08gKdXhmoG/CJV
X-IronPort-AV: E=Sophos;i="5.87,226,1631606400";
   d="scan'208,217";a="68382634"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 11 Nov 2021 10:45:42 -0800
IronPort-SDR: 
 Jg8+tGzwyIDlU1bKuyvTQvbVXItwC8h1h0DBZGVVIK/ePKqVB3Uni3x2gnEx+O13u3Ex0Q6awO
 YdJIfvPp9nL+uaRzCpnhkh7AqJkVRzIBbsvzZyRhWKGZV7aLRim3Lq4O9y7WInSHX537Ieljbf
 6dRUqZFfZAslc1RNs0fRQLzp78t0/k0U/1XE3cNmreRLOSZrntuCithtFLsKm/JOJUU1Csg5Hl
 68WvX3qHNoI6n2G1Bp8JeV18j+WeYVlkG05kw6LpA3vzuCm+HaCg6pDSgRdoWrk1ujhHL5b6+J
 Nag=
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: linux-firmware: discrepancy around the brcmfmac/cyfmac43430
Thread-Topic: linux-firmware: discrepancy around the brcmfmac/cyfmac43430
Thread-Index: AQHX1ysgwkUk4YGLnUGG232Q0DG0fw==
Date: Thu, 11 Nov 2021 18:45:37 +0000
Message-ID: <1636656337497.93588@mentor.com>
Accept-Language: en-US, en-IE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: multipart/alternative;
	boundary="_000_163665633749793588mentorcom_"
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 18:45:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158199

--_000_163665633749793588mentorcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,


It seems like there's a discrepancy regarding the license of the brcmfmac/c=
yfmac43430 firmware or maybe I am misunderstanding something. If I look at =
the original source (kernel git) for the linux-firmware components the WHEN=
CE file mentions

File: cypress/cyfmac43430-sdio.bin
Link: brcm/brcmfmac43430-sdio.bin -> ../cypress/cyfmac43430-sdio.bin


under the LICENCE.broadcom_bcm43xx (https://git.kernel.org/pub/scm/linux/ke=
rnel/git/firmware/linux-firmware.git/tree/WHENCE#n2830) however the OE-core=
 recipe uses a cypress license for these


https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/lin=
ux-firmware/linux-firmware_20211027.bb#n743
https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/lin=
ux-firmware/linux-firmware_20211027.bb#n762


Maybe I do not have a clear background on this and someone can explain a li=
ttle. Any comments on this will be appreciated.


BR,
Awais

--_000_163665633749793588mentorcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none"><!--P{margin-top:0;margin-b=
ottom:0;} --></style>
</head>
<body dir=3D"ltr" style=3D"font-size:10pt;color:#000000;background-color:#F=
FFFFF;font-family:Tahoma,Geneva,sans-serif;">
<p>Hi all,</p>
<p><br>
</p>
<p>It seems like there's a discrepancy regarding the license of the brcmfma=
c/cyfmac43430 firmware or maybe I am misunderstanding something. If I look =
at the original source (kernel git) for the linux-firmware components the W=
HENCE file mentions
<br>
</p>
<div><br>
</div>
<div>File: cypress/cyfmac43430-sdio.bin</div>
Link: brcm/brcmfmac43430-sdio.bin -&gt; ../cypress/cyfmac43430-sdio.bin
<p><br>
</p>
<p>under the LICENCE.broadcom_bcm43xx (<a href=3D"https://git.kernel.org/pu=
b/scm/linux/kernel/git/firmware/linux-firmware.git/tree/WHENCE#n2830">https=
://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree=
/WHENCE#n2830</a>) however the OE-core
 recipe uses a cypress license for these</p>
<p><br>
</p>
<div><a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/re=
cipes-kernel/linux-firmware/linux-firmware_20211027.bb#n743">https://git.op=
enembedded.org/openembedded-core/tree/meta/recipes-kernel/linux-firmware/li=
nux-firmware_20211027.bb#n743</a></div>
<a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/recipes=
-kernel/linux-firmware/linux-firmware_20211027.bb#n762">https://git.openemb=
edded.org/openembedded-core/tree/meta/recipes-kernel/linux-firmware/linux-f=
irmware_20211027.bb#n762</a><br>
<p><br>
</p>
<p>Maybe I do not have a clear background on this and someone can explain a=
 little. Any comments on this will be appreciated.<br>
</p>
<p><br>
</p>
<div id=3D"Signature">
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
</body>
</html>

--_000_163665633749793588mentorcom_--

