Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kishore.k.bodke@intel.com>) id 1T63yF-00062k-4j
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Aug 2012 20:23:31 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Aug 2012 11:10:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,322,1344236400"; 
	d="scan'208,217";a="185445066"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by azsmga001.ch.intel.com with ESMTP; 27 Aug 2012 11:10:13 -0700
Received: from orsmsx151.amr.corp.intel.com (10.22.226.38) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 27 Aug 2012 11:10:12 -0700
Received: from orsmsx105.amr.corp.intel.com ([169.254.4.178]) by
	ORSMSX151.amr.corp.intel.com ([169.254.7.3]) with mapi id
	14.01.0355.002; Mon, 27 Aug 2012 11:10:12 -0700
From: "Bodke, Kishore K" <kishore.k.bodke@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: compiling package with bitbake with CROSS_COMPILE  flag
Thread-Index: Ac2EfqesoyeWEbrGTva7fa8DjlZPPA==
Date: Mon, 27 Aug 2012 18:10:12 +0000
Message-ID: <D956029D25CF204F948EA0FB515E1EE20AD6186E@ORSMSX105.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Subject: compiling package with bitbake with CROSS_COMPILE flag
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
X-List-Received-Date: Mon, 27 Aug 2012 18:23:31 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_D956029D25CF204F948EA0FB515E1EE20AD6186EORSMSX105amrcor_"

--_000_D956029D25CF204F948EA0FB515E1EE20AD6186EORSMSX105amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

I hope I am asking this question to the right mailing list, since it is rel=
ated to meta modules classes.

I have a package trying to compile using bitbake.

When you inherit module, I think CROSS_COMPILE option is enabled by module-=
base.bbclass.

I get below error because of this CROSS_COMPILE flag.

error: inlining failed in call to always_inline 'icp_adf_pollQueue': functi=
on body not available

I disabled the flag in my recipe by export CROSS_COMPILE=3D"".
Then it compiled fine.

My question is
what this CROSS_COMPILE flag  does when bitbake runs?  Does it set any extr=
a compiler flags, which is not accepted by my package I am building using b=
itbake?
How do you avoid this inlining issue when CROSS_COMPILE flag is enabled?

Thanks
Kishore.


--_000_D956029D25CF204F948EA0FB515E1EE20AD6186EORSMSX105amrcor_
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
<p class=3D"MsoNormal">Hi <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I hope I am asking this question to the right mailin=
g list, since it is related to meta modules classes.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have a package trying to compile using bitbake.<o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">When you inherit module, I think CROSS_COMPILE optio=
n is enabled by module-base.bbclass.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I get below error because of this CROSS_COMPILE flag=
.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b>error: inlining failed in call to always_inline '=
icp_adf_pollQueue': function body not available<o:p></o:p></b></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I disabled the flag in my recipe by export CROSS_COM=
PILE=3D&#8221;&#8221;.&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal">Then it compiled fine.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">My question is <o:p></o:p></p>
<p class=3D"MsoNormal">what this CROSS_COMPILE flag &nbsp;does when bitbake=
 runs? &nbsp;Does it set any extra compiler flags, which is not accepted by=
 my package I am building using bitbake?<o:p></o:p></p>
<p class=3D"MsoNormal">How do you avoid this inlining issue when CROSS_COMP=
ILE flag is enabled?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal">Kishore.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_D956029D25CF204F948EA0FB515E1EE20AD6186EORSMSX105amrcor_--
