Return-Path: <Vignesh.Rajendran@in.bosch.com>
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
	by mail.openembedded.org (Postfix) with ESMTP id 05394744F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 09:36:22 +0000 (UTC)
Received: from si0vm1947.rbesz01.com (unknown [139.15.230.188])
	by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 42DLbn5RYsz4f3klP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 11:36:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
	s=2015-01-21; t=1537176981;
	bh=xhLwTM6DBk7enajaKJxpogJR8dahU0R64smaA4er4b4=; l=10;
	h=From:From:Reply-To:Sender;
	b=VuBfpF5RazUHCgIcse4frJijqhHQlBOt1idZlsxZH7ey02fayLPva6FOasnQuJ6aB
	5PDosPCOjNQDQpF8qDWblWqH1c9HYXQ2/iiiqHiKGTISKRWasiAkUVBCOf/E59TtOM
	bDbXzMvRDYCN6bJ7fueuk0WJa6Pe2YyuQpjqoG4Q=
Received: from si0vm4642.rbesz01.com (unknown [10.58.172.176])
	by si0vm1947.rbesz01.com (Postfix) with ESMTPS id 42DLbn5FXGz6CjRq5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 11:36:21 +0200 (CEST)
X-AuditID: 0a3aad12-92fff70000000ca7-25-5b9f7563395e
Received: from fe0vm1651.rbesz01.com ( [10.58.173.29])
	(using TLS with cipher AES128-SHA (128/128 bits))
	(Client did not present a certificate)
	by si0vm4642.rbesz01.com (SMG Outbound) with SMTP id
	08.3D.03239.3657F9B5; Mon, 17 Sep 2018 11:35:31 +0200 (CEST)
Received: from FE-MBX2032.de.bosch.com (fe-mbx2032.de.bosch.com [10.3.231.42])
	by fe0vm1651.rbesz01.com (Postfix) with ESMTPS id 42DLbn3qgPzp6Cl
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 11:36:21 +0200 (CEST)
Received: from SGPMBX2018.APAC.bosch.com (10.187.83.36) by
	FE-MBX2032.de.bosch.com (10.3.231.42) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1466.3; Mon, 17 Sep 2018 11:36:20 +0200
Received: from SGPMBX2020.APAC.bosch.com (10.187.83.43) by
	SGPMBX2018.APAC.bosch.com (10.187.83.36) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1466.3; Mon, 17 Sep 2018 17:36:19 +0800
Received: from SGPMBX2020.APAC.bosch.com ([fe80::b526:b737:7eb9:3a96]) by
	SGPMBX2020.APAC.bosch.com ([fe80::b526:b737:7eb9:3a96%6]) with mapi id
	15.01.1466.009; Mon, 17 Sep 2018 17:36:19 +0800
From: "Vignesh Rajendran (RBEI/ECF3)" <Vignesh.Rajendran@in.bosch.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: sdk_extraconf: usage
Thread-Index: AdROaTHLUpQhPdtwSGGrF0fqEAKcKQ==
Date: Mon, 17 Sep 2018 09:36:19 +0000
Message-ID: <8d2c15064d484397809e3b741fa405eb@in.bosch.com>
Accept-Language: en-US, en-SG
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.56.214]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA21Tf0wbZRjm613LrePIcaXwUoVkt6iIg3WjLG7gj6mZizHOODHbGnBXOGgD
	bcldwYH+sbHIHKuKrAyo24pl7hdjCmhGnC5rVxbLHJtYBwMlxtWtA4PEDc3iBK89WPuH/3x5
	vud5n+d9v/dyBEZ3EhrCZLFxvIWtZBRKXLmuOz27pNql1566p33yp3vT8c+ijUM9x9GraJuy
	oJSrNNVw/MqntyuNh33mqlPMjuCeY/KdqCujES0hgNLBadck1oiUBE3tkcG/nr0oLNDUFILO
	jkxJmEFQHzgvly53EAxM9yDp4hMvl/vxsEVBbYAuR70sjJOp7TD8fmOEV1Hp0NrgxiSegaZf
	nAs4B+7O9EXqceoR+PJWS4QnqXzobuiIYCR63debIzkYlQpjQZdMmpuCI19fwSSshts35uQS
	XgZHXSfjpXoDfBaYkkmZSeBvD+JNKNkZE+WMKXPGlEl8Doy2OBQSfgKOfjKFSTgb2ua8eCzf
	geJPIrVg0taYdWt0q3N4AyfUaVfllFjNvUj6RnQ/6rlW5kUUgZgE0sq59LScrRFqzV6UR8gY
	NVlkEqlEg7W01sgKxjf56kpOYDQkiouLo1UPaKHaYDYJgslq8SIgMCaZxBJFH1nK1tZxvFWy
	edFDBM6kknf3m/U0Vc7auAqOq+L4RTWfIBggv7KJxiSeK+d2lJkqbYsyky71TIlVYtvKiCVe
	lEskiL1TwhGkUMWaBVP5gj1NstOLbNQ6iAqJsd32ZozwTTjE82rkvP9HSzNG4xarhdOkkq+F
	E6mw11hteTCT5mHS8/lBPa2OEaK5k+g6EreqInPD5gTx54hOA2S/6uBWOmmBjJpWfyp6qCAG
	A+fmcDjdMCwH99+tBHzodyghcON8Mox17MuAob7RDPhi16Xl8O7siRUQGnXpYOLmuTzomx7I
	g9DV2bXw3geX18Pc/c7nYfZs4AUYH/rtJdh74M9N0BXcvxk+OjC1Bezd3+vB7xgoguMnbhdB
	r/9jAxzZd6sEDocaOZjf5S6H0D+HzDAx+K0F7vx1hoegf5yH+d3ddZPiqmXiqo3h95OCjbX9
	z6oX2OjrNDtRJh5YSq+92GZfsW5pU27Br/jLm7QX3/G9qPo9bfl3noqt9fYeVJz9Fn7Fc0l3
	Ux5a+eho4et9rta0ZW8XPJWo+GHbc4cuHMOznCPF875v7A3D7Y8PgqKM0l2gCttmPCMVG4fV
	BT8Gt9RteGzNz+3cmeL145kTKe6sVzZfO/vGM00j+b0MLhjZVVkYL7D/AaSSVnO2BAAA
Subject: sdk_extraconf: usage
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
X-List-Received-Date: Mon, 17 Sep 2018 09:36:23 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8d2c15064d484397809e3b741fa405ebinboschcom_"

--_000_8d2c15064d484397809e3b741fa405ebinboschcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello OE,

Can anyone please explain the usage of sdk_extraconf?
https://git.yoctoproject.org/cgit.cgi/poky/tree/meta/classes/populate_sdk_e=
xt.bbclass#n367

I am little bit confused that sdk_extraconf is really a function or variabl=
e?

And why it is intended to handle one extra conf file?
In my case, I want to have other configuration files based on something and=
 want to include by sdk_extraconf.

Is my approach/view is fine with the intention of sdk_extraconf?

Simply sdk_extraconf =3D> sdk_extraconf's

Thanks in Advance.

Mit freundlichen Gr=FC=DFen / Best regards

Rajendran Vignesh
RBEI/ECF33

Tel. +91 422 67-65103


--_000_8d2c15064d484397809e3b741fa405ebinboschcom_
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
<p class=3D"MsoNormal">Hello OE,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Can anyone please explain the usage of sdk_extraconf=
?<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://git.yoctoproject.org/cgit.cgi/pok=
y/tree/meta/classes/populate_sdk_ext.bbclass#n367">https://git.yoctoproject=
.org/cgit.cgi/poky/tree/meta/classes/populate_sdk_ext.bbclass#n367</a><o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am little bit confused that sdk_extraconf is reall=
y a function or variable?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">And why it is intended to handle one extra conf file=
? <o:p></o:p></p>
<p class=3D"MsoNormal">In my case, I want to have other configuration files=
 based on something and want to include by sdk_extraconf.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is my approach/view is fine with the intention of sd=
k_extraconf?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Simply sdk_extraconf =3D&gt; sdk_extraconf&#8217;s<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks in Advance.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;color:black">Mit freundlichen Gr=FC=DFen / Best regard=
s
<br>
<br>
<b>Rajendran Vignesh<br>
RBEI/ECF33<br>
</b><br>
Tel. &#43;91 422 67-65103 </span><span style=3D"font-size:8.0pt;font-family=
:&quot;Arial&quot;,sans-serif;color:black"><br>
<br>
</span><o:p></o:p></p>
</div>
</body>
</html>

--_000_8d2c15064d484397809e3b741fa405ebinboschcom_--
