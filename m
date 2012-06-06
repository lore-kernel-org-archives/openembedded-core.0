Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1ScJo6-0005WS-Nq
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 19:14:07 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 06 Jun 2012 10:02:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; 
	d="scan'208,217";a="108600334"
Received: from orsmsx606.amr.corp.intel.com ([10.22.226.128])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Jun 2012 10:02:30 -0700
Received: from orsmsx104.amr.corp.intel.com (10.22.225.131) by
	orsmsx606.amr.corp.intel.com (10.22.226.128) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 6 Jun 2012 10:02:16 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.60]) by
	ORSMSX104.amr.corp.intel.com ([169.254.3.64]) with mapi id
	14.01.0355.002; Wed, 6 Jun 2012 10:00:04 -0700
From: "Zhang, Jessica" <jessica.zhang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe-core] About sdk product
Thread-Index: AQHNQ+O94VcJRPmvxkWkQTYOrhgAzJbtgqcQ
Date: Wed, 6 Jun 2012 17:00:03 +0000
Message-ID: <C6510F6D410BB64A8C15398EDC6B847C46A606D9@ORSMSX101.amr.corp.intel.com>
References: <CAOHjBZu23roe2_TD474s6bthXAMGFy67PeJre3MS26hBST+GQQ@mail.gmail.com>
In-Reply-To: <CAOHjBZu23roe2_TD474s6bthXAMGFy67PeJre3MS26hBST+GQQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Subject: Re: About sdk product
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jun 2012 17:14:07 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_C6510F6D410BB64A8C15398EDC6B847C46A606D9ORSMSX101amrcor_"

--_000_C6510F6D410BB64A8C15398EDC6B847C46A606D9ORSMSX101amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Giuseppe,

We have sdk images which the package format can be rpm, ipk, or deb.  We al=
so provided a toolchain tarball that contains the cross dev toolchain.  For=
 cross dev, we're using sysroot which is extracted from the desired target =
image file.  For more details, you can refer to Yocto ADT manual.

Thanks,
Jessica

From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Giuseppe Condorelli
Sent: Wednesday, June 06, 2012 5:56 AM
To: Patches and discussions about the oe-core layer
Subject: [OE-core] [oe-core] About sdk product

Hi All,

I'm wondering about sdk packaging and installation process.
My question is: is the sdk image installed as for core images?
I mean, core images are installed (as rpm, ipk) and then a tar file is also=
 provided.
Is sdk process the same?

Please let me know, I'm asking this before investigating on sdk step to hav=
e a picture of the status.

Best Regards,
Giuseppe

--_000_C6510F6D410BB64A8C15398EDC6B847C46A606D9ORSMSX101amrcor_
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
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
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
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
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
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Hi Giuseppe,<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">We have sdk images which =
the package format can be rpm, ipk, or deb.&nbsp; We also provided a toolch=
ain tarball that contains the cross dev toolchain.&nbsp; For cross
 dev, we&#8217;re using sysroot which is extracted from the desired target =
image file.&nbsp; For more details, you can refer to Yocto ADT manual.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Thanks,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Jessica<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> openembe=
dded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@=
lists.openembedded.org]
<b>On Behalf Of </b>Giuseppe Condorelli<br>
<b>Sent:</b> Wednesday, June 06, 2012 5:56 AM<br>
<b>To:</b> Patches and discussions about the oe-core layer<br>
<b>Subject:</b> [OE-core] [oe-core] About sdk product<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I'm wondering about sdk packaging and installation p=
rocess.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">My question is: is the sdk image installed as for co=
re images?<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I mean, core images are installed (as rpm, ipk) and =
then a tar file is also provided.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Is sdk process the same?<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Please let me know, I'm asking this before investiga=
ting on sdk step to have a picture of the status.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Giuseppe<o:p></o:p></p>
</div>
</div>
</body>
</html>

--_000_C6510F6D410BB64A8C15398EDC6B847C46A606D9ORSMSX101amrcor_--
