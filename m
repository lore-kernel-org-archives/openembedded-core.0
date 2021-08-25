Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.15400.1629899496172874744
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 06:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Pcf8slPX;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1629899496;
  x=1661435496;
  h=from:to:subject:date:message-id:mime-version;
  bh=oVhlbkPzEQNMGssaDt1MBz+HOTCFE8qr1ySfBzt4Fgc=;
  b=Pcf8slPXDdAK0y9w73h4ymRWTL5QEwJ+PvbxyyyRI5p5hhP8UuFnmE1k
   AdgPuoWu8UB4iO5jVS1rc19nae1lgtB41gGFg3dcYVr3vtAiZGBDmYRy+
   rnV5pv5GTXlNskuheEFFngq6d8b3d8iJMlIO9n9xetkOaUauIi5fXDwib
   /KzEtNqfzRK1tadAp+kcfiBoznbvToT4DsEIlo9GZYBivOsMFhxnMfrxX
   rhBLBH0hhCtufEm6X5qYMtrRGe22A5QP0dJHzIPv65LMTh+GqmWv0NWwe
   2HjXqtHQ0bnYE37TPzoeHtc8l5/NrBVDex2hGOKBBXA24zKP0BaoBOSL7
   A==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: "OE Core (openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
Subject: How to build a devupstream variant of a recipe?
Thread-Topic: How to build a devupstream variant of a recipe?
Thread-Index: AdeZtz02rhXaKMP3QRO/Zl41NJLL9A==
Date: Wed, 25 Aug 2021 13:51:34 +0000
Message-ID: <68ca10644e1b4a59b4888b72feb571d8@axis.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_68ca10644e1b4a59b4888b72feb571d8axiscom_"

--_000_68ca10644e1b4a59b4888b72feb571d8axiscom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

As I was recently looking at lttng-modules, which supports devupstream, I w=
anted to try to build the devupstream variant. However, neither the informa=
tion in devupstream.bbclass nor the documentation in the manual were of any=
 help. Since it uses the BBCLASSEXTEND mechanism, I thought it would be as =
simple as doing `bitbake lttng-modules-devupstream`, but that did not work.=
 So what is the correct way to build a devupstream variant of a recipe?

//Peter



--_000_68ca10644e1b4a59b4888b72feb571d8axiscom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from rtf -->
<style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left:=
 #800000 2px solid; } --></style>
</head>
<body>
<font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">
<div><font color=3D"#943634">As I was recently looking at lttng-modules, wh=
ich supports devupstream, I wanted to try to build the devupstream variant.=
 However, neither the information in devupstream.bbclass nor the documentat=
ion in the manual were of any help.
Since it uses the BBCLASSEXTEND mechanism, I thought it would be as simple =
as doing `bitbake lttng-modules-devupstream`, but that did not work. So wha=
t is the correct way to build a devupstream variant of a recipe?</font></di=
v>
<div><font face=3D"Calibri" color=3D"#943634">&nbsp;</font></div>
<div><font face=3D"Calibri" color=3D"#943634">//Peter</font></div>
<div><font face=3D"Calibri">&nbsp;</font></div>
<div><font face=3D"Calibri">&nbsp;</font></div>
</span></font>
</body>
</html>

--_000_68ca10644e1b4a59b4888b72feb571d8axiscom_--
