Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fcooper@ti.com>) id 1U30FO-00061h-VA
	for Openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 09:21:07 +0100
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1682VYi021203;
	Wed, 6 Feb 2013 02:02:31 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1682Vjd026279;
	Wed, 6 Feb 2013 02:02:31 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE73.ent.ti.com ([fe80::86e:fab6:cd95:e158%28]) with mapi id
	14.01.0323.003; Wed, 6 Feb 2013 02:02:31 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "ross.burton@intel.com" <ross.burton@intel.com>
Thread-Topic: Re: [OE-core] Multiple MACHINE building is broken in OE-core?
Thread-Index: Ac4EPH0DLgw0dpyLS7qCczLd7ak67w==
Date: Wed, 6 Feb 2013 08:02:31 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C38764C@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: Multiple MACHINE building is broken in OE-core?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Feb 2013 08:21:08 -0000
X-List-Received-Date: Wed, 06 Feb 2013 08:21:08 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8F29D6B095ED194EA1980491A5E029710C38764CDFLE09entticom_"

--_000_8F29D6B095ED194EA1980491A5E029710C38764CDFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Everyone,

While performing denzil to danny work I ran into this same issue that Mike =
mentioned. I have 4 machines that are armv7a based and previously in denzil=
 only very specific recipes that I deliberately made machine specific were =
being rebuilt. Now a significant amount of recipes are being unnecessarily =
rebuilt. I first noticed this when building Qt but this also occurs with so=
mething even simpler such as tslib. If I look at tslib's temp directory I e=
nd up seeing multiple logs for the majority of the tasks. For example I wil=
l see 4 log.do_compile logs.

I ran the sstate-diff-machines.sh script that Martin mentioned for machines=
 defined in meta-ti and I got the below output when using tslib as the -tar=
gets:

list.M am3517-evm

http://pastebin.com/zMH8PkmP

list.M am335x-evm
http://pastebin.com/6jbP6guA

The checksums differs for non-native recipes such as gettext, tslib and zli=
b.

If it matters I am using the 1.17.0 branch of bitbake since the master bran=
ch throws parsing errors.

Any suggestions on what could be the issue?

Regards,
Franklin Cooper Jr.
Texas Instruments
Application Engineer
fcooper@ti.com<mailto:fcooper@ti.com>


--_000_8F29D6B095ED194EA1980491A5E029710C38764CDFLE09entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
h1
	{mso-style-priority:9;
	mso-style-link:"Heading 1 Char";
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:24.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.Heading1Char
	{mso-style-name:"Heading 1 Char";
	mso-style-priority:9;
	mso-style-link:"Heading 1";
	font-family:"Times New Roman","serif";
	font-weight:bold;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Everyone,<o:p></o:p></p>
<p class=3D"MsoNormal"><br>
While performing denzil to danny work I ran into this same issue that Mike =
mentioned. I have 4 machines that are armv7a based and previously in denzil=
 only very specific recipes that I deliberately made machine specific were =
being rebuilt. Now a significant
 amount of recipes are being unnecessarily rebuilt. I first noticed this wh=
en building Qt but this also occurs with something even simpler such as tsl=
ib. If I look at tslib&#8217;s temp directory I end up seeing multiple logs=
 for the majority of the tasks. For example
 I will see 4 log.do_compile logs.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I ran the sstate-diff-machines.sh script that Martin=
 mentioned for machines defined in meta-ti and I got the below output when =
using tslib as the &#8211;targets:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">list.M am3517-evm<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"http://pastebin.com/zMH8PkmP">http://past=
ebin.com/zMH8PkmP</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">list.M am335x-evm<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"http://pastebin.com/6jbP6guA">http://past=
ebin.com/6jbP6guA</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The checksums differs for non-native recipes such as=
 gettext, tslib and zlib.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If it matters I am using the 1.17.0 branch of bitbak=
e since the master branch throws parsing errors.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Any suggestions on what could be the issue?<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Franklin Cooper Jr.<o:p></o:p></p>
<p class=3D"MsoNormal">Texas Instruments<o:p></o:p></p>
<p class=3D"MsoNormal">Application Engineer<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"mailto:fcooper@ti.com">fcooper@ti.com</a>=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_8F29D6B095ED194EA1980491A5E029710C38764CDFLE09entticom_--
