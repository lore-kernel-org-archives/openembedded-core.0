Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fcooper@ti.com>) id 1SyVI7-0003FM-5k
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 23:56:47 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q76LhYmC017877
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 16:43:34 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q76LhYoC016445
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 16:43:34 -0500
Received: from DFLE30.ent.ti.com ([fe80::648b:2220:c6fb:4e6]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Mon, 6 Aug 2012 16:43:34 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-core] [denzil branch] Update to the latest version of psplash
Thread-Index: Ac10HIXwOd/Mdsc1Tta1IEx6SUop5A==
Date: Mon, 6 Aug 2012 21:43:33 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C28379D@DFLE30.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Cooper Jr., Franklin" <fcooper@ti.com>
Subject: [denzil branch] Update to the latest version of psplash
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
X-List-Received-Date: Mon, 06 Aug 2012 21:56:47 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8F29D6B095ED194EA1980491A5E029710C28379DDFLE30entticom_"

--_000_8F29D6B095ED194EA1980491A5E029710C28379DDFLE30entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

In the latest version of psplash (http://git.yoctoproject.org/cgit/cgit.cgi=
/psplash/)  there are two patches that are not in the version of psplash us=
ed in the oe-core denzil branch. The first patch called Make it easier to c=
ustomise colours<http://git.yoctoproject.org/cgit/cgit.cgi/psplash/commit/?=
id=3D84764337a584002a92940323d374b0e417c573a6> moves some color definitions=
 from being hardcoded into psplash.c and puts it in a new header file calle=
d psplash-colors.h.  The second patch Fix for psplash segmentation fault<ht=
tp://git.yoctoproject.org/cgit/cgit.cgi/psplash/commit/?id=3Dde9979aefbc56a=
f59b4d236a4b63dd19dcdcfb53> fixes a segment fault issue.

What I would like to do is update the psplash_git.bb recipe to use the late=
st version of psplash that pulls in these two tweaks. The second patch has =
zero impact on existing users of the pslash recipe. If a particular layer t=
weaks the color definitions in psplash by patching the psplash.c file then =
the second patch mentioned above could result in a minor tweak having to be=
 made to those layers to address the changes. In oe-classic noticed that th=
ere is a patch for psplash (http://cgit.openembedded.org/openembedded/tree/=
recipes/psplash/psplash-ti/0001-configurability-for-rev-422.patch) that pat=
ches psplash in almost the same exact way as the "Make it easier to customi=
ze colours" patch.

Are there any objections in bumping the version of psplash to incorporate t=
he above mentioned patches? I haven't seen any layer adjust the psplash col=
or definitions so I doubt there truly being any impact at all.

Regards,
Franklin Cooper Jr.
Texas Instruments
Application Engineer
fcooper@ti.com<mailto:fcooper@ti.com>


--_000_8F29D6B095ED194EA1980491A5E029710C28379DDFLE30entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
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
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
-->
</style><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">In the latest version of psplash (<a href=3D"http://=
git.yoctoproject.org/cgit/cgit.cgi/psplash/">http://git.yoctoproject.org/cg=
it/cgit.cgi/psplash/</a>) &nbsp;there are two patches that are not in the v=
ersion of psplash used in the oe-core denzil
 branch. The first patch called <span style=3D"font-size:10.0pt;
font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;color:#1F497D">
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/psplash/commit/?id=3D8=
4764337a584002a92940323d374b0e417c573a6"><span style=3D"color:#1F497D">Make=
 it easier to customise colours</span></a></span><span style=3D"font-size:1=
0.0pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;color:white">
</span><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;=
sans-serif&quot;">moves some color definitions from being hardcoded into ps=
plash.c and puts it in a new header file called psplash-colors.h. &nbsp;The=
 second patch
<span style=3D"color:#1F497D"><a href=3D"http://git.yoctoproject.org/cgit/c=
git.cgi/psplash/commit/?id=3Dde9979aefbc56af59b4d236a4b63dd19dcdcfb53"><spa=
n style=3D"color:#1F497D">Fix for psplash segmentation fault</span></a></sp=
an><span style=3D"color:white">
</span>fixes a segment fault issue. <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,&quot;sans-serif&quot;">What I would like to do is update the psp=
lash_git.bb recipe to use the latest version of psplash that pulls in these=
 two tweaks. The second patch has zero impact on existing
 users of the pslash recipe. If a particular layer tweaks the color definit=
ions in psplash by patching the psplash.c file then the second patch mentio=
ned above could result in a minor tweak having to be made to those layers t=
o address the changes. In oe-classic
 noticed that there is a patch for psplash (<a href=3D"http://cgit.openembe=
dded.org/openembedded/tree/recipes/psplash/psplash-ti/0001-configurability-=
for-rev-422.patch">http://cgit.openembedded.org/openembedded/tree/recipes/p=
splash/psplash-ti/0001-configurability-for-rev-422.patch</a>)
 that patches psplash in almost the same exact way as the &#8220;Make it ea=
sier to customize colours&#8221; patch.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,&quot;sans-serif&quot;">Are there any objections in bumping the v=
ersion of psplash to incorporate the above mentioned patches? I haven&#8217=
;t seen any layer adjust the psplash color definitions so I doubt
 there truly being any impact at all.</span><b><o:p></o:p></b></p>
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

--_000_8F29D6B095ED194EA1980491A5E029710C28379DDFLE30entticom_--
