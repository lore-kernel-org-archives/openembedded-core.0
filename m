Return-Path: <Vignesh.Rajendran@in.bosch.com>
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
	by mail.openembedded.org (Postfix) with ESMTP id 27F5C6FF78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 03:14:04 +0000 (UTC)
Received: from fe0vm1649.rbesz01.com (unknown [139.15.230.188])
	by si0vms0216.rbdmz01.com (Postfix) with ESMTPS id 41vbP83LJGz1XLH5V;
	Tue, 21 Aug 2018 05:14:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
	s=2015-01-21; t=1534821244;
	bh=ckgAMoDPDsDixSrxZWZkYGvt5FOk9N4NFZUJOI+lVnY=; l=10;
	h=From:From:Reply-To:Sender;
	b=UmQe2qXG4n14GQ+AaQqOaIkY4ni4bfkYdwjhiedktWEZC4mErG/O7/n28KBYHnu2C
	fv23aKylxDYweIE5VT29NZaUSH7OLHMmoyfpxZDY0on1Z0Xt5kpij0OJD0pmeiL87E
	f1qYTKSi3Zh8Uf2XWdtAPNWR4OUECOkWbyP7CaTE=
Received: from si0vm4642.rbesz01.com (unknown [10.58.172.176])
	by fe0vm1649.rbesz01.com (Postfix) with ESMTPS id 41vbP82xs5z2K2;
	Tue, 21 Aug 2018 05:14:04 +0200 (CEST)
X-AuditID: 0a3aad12-92fff70000000ca7-be-5b7b836ea192
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
	(using TLS with cipher AES128-SHA (128/128 bits))
	(Client did not present a certificate)
	by si0vm4642.rbesz01.com (SMG Outbound) with SMTP id
	75.B2.03239.E638B7B5; Tue, 21 Aug 2018 05:13:50 +0200 (CEST)
Received: from FE-MBX2016.de.bosch.com (fe-mbx2016.de.bosch.com [10.3.231.22])
	by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 41vbP80hXCz6D6mNf; 
	Tue, 21 Aug 2018 05:14:04 +0200 (CEST)
Received: from SGPMBX2020.APAC.bosch.com (10.187.83.43) by
	FE-MBX2016.de.bosch.com (10.3.231.22) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1466.3; Tue, 21 Aug 2018 05:14:03 +0200
Received: from SGPMBX2020.APAC.bosch.com (10.187.83.43) by
	SGPMBX2020.APAC.bosch.com (10.187.83.43) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1466.3; Tue, 21 Aug 2018 11:14:00 +0800
Received: from SGPMBX2020.APAC.bosch.com ([fe80::b526:b737:7eb9:3a96]) by
	SGPMBX2020.APAC.bosch.com ([fe80::b526:b737:7eb9:3a96%6]) with mapi id
	15.01.1466.009; Tue, 21 Aug 2018 11:14:00 +0800
From: "Vignesh Rajendran (RBEI/ECF3)" <Vignesh.Rajendran@in.bosch.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, Khem Raj
	<raj.khem@gmail.com>
Thread-Topic: [OE-core]: feedback on externalsrc patch
Thread-Index: AdQ4/IdfM9JcmdSdSbiERCsIg79S+A==
Date: Tue, 21 Aug 2018 03:14:00 +0000
Message-ID: <e1348b9c8f444b0ba01f0beea5f2f810@in.bosch.com>
Accept-Language: en-US, en-SG
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.56.214]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA21TbUwTZxzn6V3bo+HccbXrfx0sWyOwqWVUC2nG1r0kLsz4YdMsZpBsFjlo
	N9qSXukE+UAgClMHghRHGS9uk6CuTJCRbhKUqtjKwpjTAVUx07J1uIHzZZFldrvjwPbDvjz5
	3e/teZ7/kyMw2keoCLPVwditxmK1RIbLXvAka6zVO/My7tel6q8uzEn1l91K/e4JN3oFy/nG
	fU2a0x54K2estxu9ieXKXixgis1Oxv68YZvM5Ar4UYnv2R0X7nhQJdq/ag+KJ4DSwXzkNs5j
	mqoRwWDNtj1IxuEhBA336iSCcBtB2yGtINxF8OvDMCZ8nEVweF/loktCvQ7HmqpEPF5JbQZv
	2zDOmzDqNILAt39gvCCntOCKzGGCKQvGxgdwAafDXyeFIpxKgUhnZBGTVDa03LiOeIyoZPhs
	qnHRj1FKCIY6RMIdKPhi8HtMwAr47WZELOBnoKvjqFTw58NQcFQkdCZCoCWE70cKd0yVO8bm
	jrEJfDpMupokAl4DXYduYQLWwCcRHx7LdyLpUaRgzRlOiy5Lty7dns+w5Rna9O02Sx8SnpD2
	ot6fCn2IIpA6gfQ6d+bRYqOTLbP4UCYhUivIsUKOWpFvKygzGVnTe/bSYoZVq0gUFxdHyx/R
	bGm+xcyyZpvVh4DA1CtJA19FFhjLyhm7TYj50JMErlaS9w5Y8miqyOhgPmCYEsa+rGYThBrI
	3ioumGhnipgdheZix7KsThb2fDxWid1WRMT70Hoigdt7PV9BsiVGC2suWoo/IcTpZTYavYDe
	JoLV+xox4ux0E7eOL67/zLsaMRq32qyMSklW8I0UnzWVWh+dSZVESvs/zKMVMUK0dxZNIW6q
	ctLAhxO4fyd6GiC98k/foROXyGho3WEuQw2IYXa+H0F780ciCEcO4NCz+6IYwt4hKTw4XR0P
	M547JHx1bUQO3uYfVDB+6eckCHbufQqmu048Df7gyCr4fdSfyi0/PgeT3bVrYNf9I2thb2Qg
	A8KTHTqojXTroL2xNRNOzJ3LhH8f1mdBz/HmLHAdadXD4GSfHkZ7Bl6F2ettG2Dac3UD+Be+
	3AhXxmY2Qm+oZtMsN2oRN2qppIwftcPo+J9RL7HR26kqEbVpfOR44WNrkdj658ea8hWJFZ7K
	+teyPTOB4dSDqLXa37M95VTVqfPvXjm/5cb7Lz041ndxwhXaNbWlhS6f+PtkOO3S4HdJlCS3
	SXPuZYV3usHsDL3R0VSh3WxI84SUFf2Xh7eSuQZx3ddpaZrVxOcNt2xnzowu3L3ZWbs1VP9L
	Sp8aZ01G7WrMzhr/A+aAUDfVBAAA
Cc: Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: : feedback on externalsrc patch
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
X-List-Received-Date: Tue, 21 Aug 2018 03:14:05 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_e1348b9c8f444b0ba01f0beea5f2f810inboschcom_"

--_000_e1348b9c8f444b0ba01f0beea5f2f810inboschcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Khem, Paul,

I am waiting for any feedback for the patch changes.
https://patchwork.openembedded.org/patch/150819/


The approach suggested to use "DEBUG_PREFIX_MAP relative to S instead of WO=
RKDIR" seems not possible due to the package.bbclass approach.
https://github.com/openembedded/openembedded-core/blob/f9324af88a99eca28b16=
0fa31aa4516fd397e44b/meta/classes/package.bbclass#L449

the sources are explicitly copied from workparentdir path
cmd =3D processdebugsrc % (sourcefile, workbasedir, localsrc_prefix, workpa=
rentdir, dvar, debugsrcdir)

Can you please clarify if my view is correct or Do I am missing something?

Thanks in Advance.

Mit freundlichen Gr=FC=DFen / Best regards

Rajendran Vignesh
RBEI/ECF33

Tel. +91 422 67-65103


--_000_e1348b9c8f444b0ba01f0beea5f2f810inboschcom_
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
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
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
<p class=3D"MsoNormal">Hello Khem, Paul,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am waiting for any feedback for the patch changes.=
<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://patchwork.openembedded.org/patch/=
150819/">https://patchwork.openembedded.org/patch/150819/</a>
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<pre><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-s=
erif">The approach suggested to use</span> &#8220;DEBUG_PREFIX_MAP relative=
 to S instead of WORKDIR&#8221; <span style=3D"font-size:11.0pt;font-family=
:&quot;Calibri&quot;,sans-serif">seems not possible due to the package.bbcl=
ass approach.</span><o:p></o:p></pre>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openembedded/openembed=
ded-core/blob/f9324af88a99eca28b160fa31aa4516fd397e44b/meta/classes/package=
.bbclass#L449">https://github.com/openembedded/openembedded-core/blob/f9324=
af88a99eca28b160fa31aa4516fd397e44b/meta/classes/package.bbclass#L449</a>
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">the sources are explicitly copied from workparentdir=
 path<o:p></o:p></p>
<p class=3D"MsoNormal">cmd =3D processdebugsrc % (sourcefile, workbasedir, =
localsrc_prefix, workparentdir, dvar, debugsrcdir)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Can you please clarify if my view is correct or Do I=
 am missing something?<o:p></o:p></p>
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

--_000_e1348b9c8f444b0ba01f0beea5f2f810inboschcom_--
