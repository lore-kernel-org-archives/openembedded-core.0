Return-Path: <Vignesh.Rajendran@in.bosch.com>
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
	by mail.openembedded.org (Postfix) with ESMTP id B161C601F2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 04:38:30 +0000 (UTC)
Received: from fe0vm1649.rbesz01.com (unknown [139.15.230.188])
	by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 42FRvC2QDbz4f3lwZ;
	Wed, 19 Sep 2018 06:38:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
	s=2015-01-21; t=1537331911;
	bh=oRA8Ex7hwwJA0ygpxI2AXvG7MfsImW5CrOPD0sgG07s=; l=10;
	h=From:From:Reply-To:Sender;
	b=Wksv8NegYKoiJWTm1Fs3eAuBK8iVypOEJbyxtBoJU0FlOhEoRaDp0MMsjC5CBcAUc
	+a/Gg1gjaq5aQhG9ZRYoS+fcEL1kFOk6HCuVRRGMBSg03hrmuJh9eJJdk95CE13V1x
	p0ID+5bl/I5QjLw6iYysdRKr679pzJLYEr1oTdzo=
Received: from si0vm4642.rbesz01.com (unknown [10.58.172.176])
	by fe0vm1649.rbesz01.com (Postfix) with ESMTPS id 42FRvC20n3z24J;
	Wed, 19 Sep 2018 06:38:31 +0200 (CEST)
X-AuditID: 0a3aad12-917ff70000000ca7-20-5ba1d29239ea
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
	(using TLS with cipher AES128-SHA (128/128 bits))
	(Client did not present a certificate)
	by si0vm4642.rbesz01.com (SMG Outbound) with SMTP id
	DE.71.03239.292D1AB5; Wed, 19 Sep 2018 06:37:38 +0200 (CEST)
Received: from FE-MBX2055.de.bosch.com (fe-mbx2055.de.bosch.com [10.3.231.149])
	by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 42FRvC0JJmz6D7FYc;
	Wed, 19 Sep 2018 06:38:31 +0200 (CEST)
Received: from SGPMBX2020.APAC.bosch.com (10.187.83.43) by
	FE-MBX2055.de.bosch.com (10.3.231.149) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1466.3; Wed, 19 Sep 2018 06:38:30 +0200
Received: from SGPMBX2020.APAC.bosch.com (10.187.83.43) by
	SGPMBX2020.APAC.bosch.com (10.187.83.43) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1466.3; Wed, 19 Sep 2018 12:38:28 +0800
Received: from SGPMBX2020.APAC.bosch.com ([fe80::b526:b737:7eb9:3a96]) by
	SGPMBX2020.APAC.bosch.com ([fe80::b526:b737:7eb9:3a96%6]) with mapi id
	15.01.1466.009; Wed, 19 Sep 2018 12:38:28 +0800
From: "Vignesh Rajendran (RBEI/ECF3)" <Vignesh.Rajendran@in.bosch.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: patch submission feedback
Thread-Index: AdRP0b75YQWZvui0ReOy9wAYqXvbrQ==
Date: Wed, 19 Sep 2018 04:38:28 +0000
Message-ID: <1b7867b1caee42cd88a5a94088106daf@in.bosch.com>
Accept-Language: en-US, en-SG
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.56.214]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA21TbUxbZRTm7S30tnCXy2XAsYCJV43ROWSzQxQ1OuNCzIIsYohrFmnl0jb2
	A3sLAjqDLGyOylagqFS2AhNk4yOjCrJoUlNmBJcM1oBjwPjohikjgSwDK8MVe7ll7Q//vHnO
	c87znPecNy+OUb/jUlyjNzFGvUJLR0mEkpe6U3bXuVvkabU30jOm15dFGeO2xIzj123oNSzr
	ku2mKOvs8KGsq70dKAc7LHm5gNFqShjjc6/mS9SDAz5BUVNS6dTMnLACVUI1EuNAymBo0RtZ
	jSQ4RZ4QQHfXLcQHTgQe82AwuIvg26Ffg8E9BF3X7geDywj6LzYJObMo8gB0WisFHN5J5oO7
	plrIFWHkVwi6e68gLhFH0jD10zTGFz0FjYtOxONUWHRbRRwWkk+C/dTdLSOCzASLczOKw4hM
	gdYbdVvNMDIRJm/bBfwUJHz3ywjG43hYvOWP5PFj0G6/IOLrldDz10gU7xkLw423hRYUbwuz
	soWV2cLKeD4VJhqsUTzeBe0tSxiPd8M3fpcwnG9GogsontWklehk6bK9qUYlw5an7Un9wKBz
	IP4RqQHU+2ehC5E4omMI32iLnIpUlLBlOhfahwvoeEJgC1A7lIaCMrWCVb9vLNYyLC0lUERE
	BBX3kGaLlToNy2oMehcCHKN3EmJts5wiChRl5YzRwMtcKAkX0onEar1OTpEqhYn5kGGKGON2
	NhPHaSDargUaxhoZFVNaqNGattN0Ct8zITwT3laAi13oeTwm0PtjzoJgixQ6VqMKyh/h5dQ2
	G5L+gd7FJ499WYfhl2esgXN06/x3paEOo4R6g56RJhKHOUeS06qL9Q/vJE0mctoDY8aHJUK+
	d9A0Cmw1jtBx4pjA7wndBoiBuKb3qNggGRLt7QhoyGUBuFfNGJy8fw6DnuPuSPDOjIihd24h
	AYbHWpNhdGw+GSabzY/C2uqpXVC1dv5Z8E7YZfCFv0MGPyz/tg/OWs69AlNXF96C+mPfZ0N9
	58VscGxY34YmjyMXxjpG82C20Z0HDeen5NB6xayE9VpHIWx+3qoC78YZHaz02Iuga73bCP4h
	z1FwOydOI/COrZzmPlqNBd0JbFsQ2Pa9Nu6lWZPC9D/bDrKhAaUV6DNneX7C6/4XTspnl+ej
	P/3RPfvOfKZ6auKMN26pZnPc94Tnxf0bB5c+6u4bqTqYlE33n8juLa78e2CwqG2H703qZl6S
	we87dOno0w+Ub/Skk3aVxWEqdeeWmL/O7Y++Ln78Z8FcRcRCVuc/ihzPfvXm+MonR/oe5K0d
	6auKJaja6FRayKoVe57BjKziP4YYXQ7aBAAA
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: patch submission feedback
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
X-List-Received-Date: Wed, 19 Sep 2018 04:38:31 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_1b7867b1caee42cd88a5a94088106dafinboschcom_"

--_000_1b7867b1caee42cd88a5a94088106dafinboschcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello OE members,

I have submitted a patch some months before and waiting for feedback after =
some discussion.
https://patchwork.openembedded.org/patch/150819/

But after some long wait, there was no response from anyone.
I personally feel there should be some support and motivation to contributo=
rs.

Please do the needful.

Mit freundlichen Gr=FC=DFen / Best regards

Rajendran Vignesh



--_000_1b7867b1caee42cd88a5a94088106dafinboschcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello OE members,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have submitted a patch some months before and wait=
ing for feedback after some discussion.<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://patchwork.openembedded.org/patch/=
150819/">https://patchwork.openembedded.org/patch/150819/</a>
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">But after some long wait, there was no response from=
 anyone.<o:p></o:p></p>
<p class=3D"MsoNormal">I personally feel there should be some support and m=
otivation to contributors.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please do the needful.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:black">Mit freundlichen Gr=FC=DFen / Best regard=
s
<br>
<br>
<b>Rajendran Vignesh<br>
<br>
<br>
</b></span><o:p></o:p></p>
</div>
</body>
</html>

--_000_1b7867b1caee42cd88a5a94088106dafinboschcom_--
