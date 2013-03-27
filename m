Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UKrYI-00026R-DN
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 15:42:14 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Mar 2013 07:25:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,919,1355126400"; 
	d="scan'208,217";a="309200161"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by fmsmga001.fm.intel.com with ESMTP; 27 Mar 2013 07:25:06 -0700
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.244]) by
	IRSMSX104.ger.corp.intel.com ([169.254.5.19]) with mapi id
	14.01.0355.002; Wed, 27 Mar 2013 14:25:05 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pb@pbcl.net" <pb@pbcl.net>,
	"raj.khem@gmail.com" <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] iproute2: add bash runtime dependence
Thread-Index: Ac4qzCb0AOJF8H+MS0adIXthb8ZuMQAGZZdA
Date: Wed, 27 Mar 2013 14:25:04 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB1621B099@IRSMSX102.ger.corp.intel.com>
References: <019d01ce2acc$289b89a0$79d29ce0$@st.com>
In-Reply-To: <019d01ce2acc$289b89a0$79d29ce0$@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Re: [PATCH] iproute2: add bash runtime dependence
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
X-List-Received-Date: Wed, 27 Mar 2013 14:42:22 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_969F26A8BAB325438E7EB80D3C3134FB1621B099IRSMSX102gercor_"

--_000_969F26A8BAB325438E7EB80D3C3134FB1621B099IRSMSX102gercor_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

Are the three bash scripts related to iproute base functionality?

Regards,
Cristian

From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Giuseppe CONDORELLI
Sent: Wednesday, March 27, 2013 11:19 AM
To: openembedded-core@lists.openembedded.org; pb@pbcl.net; raj.khem@gmail.c=
om
Subject: Re: [OE-core] [PATCH] iproute2: add bash runtime dependence

Hi All,


=D8  Where does this dependency come from?
The dependency comes from the "ip" subdirs, where there are three bash scri=
pts.
Also there are few scripts as examples.

Khem,
do you think it is however the case to split the package creating the ip on=
e?
This problem appeared when I tried to install iproute2, previously packaged=
 as rpm.

Best Regards,
Giuseppe


From: Giuseppe Condorelli [mailto:giuseppe.condorelli@gmail.com]
Sent: mercoled=EC 27 marzo 2013 10:14
To: Giuseppe CONDORELLI
Subject: Fwd: [OE-core] [PATCH] iproute2: add bash runtime dependence


---------- Forwarded message ----------
From: Phil Blundell <pb@pbcl.net<mailto:pb@pbcl.net>>
Date: 2013/3/26
Subject: Re: [OE-core] [PATCH] iproute2: add bash runtime dependence
To: Giuseppe CONDORELLI <giuseppe.condorelli@st.com<mailto:giuseppe.condore=
lli@st.com>>
Cc: openembedded-core@lists.openembedded.org<mailto:openembedded-core@lists=
.openembedded.org>
On Tue, 2013-03-26 at 17:17 +0100, Giuseppe CONDORELLI wrote:
> Add bash runtime dependence, required at package install time.
Where does this dependency come from?

p.



_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org<mailto:Openembedded-core@lists.ope=
nembedded.org>
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--_000_969F26A8BAB325438E7EB80D3C3134FB1621B099IRSMSX102gercor_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
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
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
span.hoenzb
	{mso-style-name:hoenzb;}
span.EmailStyle21
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle22
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:70.85pt 56.7pt 56.7pt 56.7pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:875774935;
	mso-list-type:hybrid;
	mso-list-template-ids:181808130 1764363520 67698691 67698693 67698689 6769=
8691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0D8;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;
	mso-fareast-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
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
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Hello,<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Are the three bash script=
s related to iproute base functionality?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Regards,<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Cristian<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> openembe=
dded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@=
lists.openembedded.org]
<b>On Behalf Of </b>Giuseppe CONDORELLI<br>
<b>Sent:</b> Wednesday, March 27, 2013 11:19 AM<br>
<b>To:</b> openembedded-core@lists.openembedded.org; pb@pbcl.net; raj.khem@=
gmail.com<br>
<b>Subject:</b> Re: [OE-core] [PATCH] iproute2: add bash runtime dependence=
<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Hi All,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo2"><![if !supportLists]><span style=3D"font-size:11.0pt;font-family:Wi=
ngdings;color:#1F497D"><span style=3D"mso-list:Ignore">=D8<span style=3D"fo=
nt:7.0pt &quot;Times New Roman&quot;">&nbsp;
</span></span></span><![endif]>Where does this dependency come from?<span s=
tyle=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&q=
uot;;color:#1F497D"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">The dependency comes from=
 the &#8220;ip&#8221; subdirs, where there are three bash scripts.<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Also there are few script=
s as examples.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Khem,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">do you think it is howeve=
r the case to split the package creating the ip one?
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">This problem appeared whe=
n I tried to install iproute2, previously packaged as rpm.<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Best Regards,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Giuseppe<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Giuseppe=
 Condorelli [<a href=3D"mailto:giuseppe.condorelli@gmail.com">mailto:giusep=
pe.condorelli@gmail.com</a>]
<br>
<b>Sent:</b> mercoled=EC 27 marzo 2013 10:14<br>
<b>To:</b> Giuseppe CONDORELLI<br>
<b>Subject:</b> Fwd: [OE-core] [PATCH] iproute2: add bash runtime dependenc=
e<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">---------- Forwarded =
message ----------<br>
From: <b>Phil Blundell</b> &lt;<a href=3D"mailto:pb@pbcl.net">pb@pbcl.net</=
a>&gt;<br>
Date: 2013/3/26<br>
Subject: Re: [OE-core] [PATCH] iproute2: add bash runtime dependence<br>
To: Giuseppe CONDORELLI &lt;<a href=3D"mailto:giuseppe.condorelli@st.com">g=
iuseppe.condorelli@st.com</a>&gt;<br>
Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openembedde=
d-core@lists.openembedded.org</a><o:p></o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">On Tue, 2013-03-26 at=
 17:17 &#43;0100, Giuseppe CONDORELLI wrote:<br>
&gt; Add bash runtime dependence, required at package install time.<o:p></o=
:p></p>
</div>
<p class=3D"MsoNormal">Where does this dependency come from?<br>
<span style=3D"color:#888888"><br>
<span class=3D"hoenzb">p.</span></span><o:p></o:p></p>
<div>
<div>
<p class=3D"MsoNormal"><br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><o:p></o:p></p>
</div>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</body>
</html>

--_000_969F26A8BAB325438E7EB80D3C3134FB1621B099IRSMSX102gercor_--
