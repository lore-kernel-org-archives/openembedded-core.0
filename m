Received: from eu1sys200aog102.obsmtp.com ([207.126.144.113])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@st.com>) id 1UKojr-0002Gw-PO
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 12:41:59 +0100
Received: from beta.dmz-eu.st.com ([164.129.1.35]) (using TLSv1) by
	eu1sys200aob102.postini.com ([207.126.147.11]) with SMTP
	ID DSNKUVLXBPrPUevdmjndI4mUgnKPqvFbzLex@postini.com;
	Wed, 27 Mar 2013 11:24:56 UTC
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9174412B;
	Wed, 27 Mar 2013 09:19:19 +0000 (GMT)
Received: from mail7.sgp.st.com (unknown [164.129.223.81])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 34A33451F;
	Wed, 27 Mar 2013 09:19:19 +0000 (GMT)
Received: from CTN005027 (pcmdt30.ctn.st.com [164.130.129.192])
	by mail7.sgp.st.com (MOS 4.3.3-GA)
	with ESMTP id BAK60746 (AUTH condorg);
	Wed, 27 Mar 2013 10:19:18 +0100
From: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
To: <openembedded-core@lists.openembedded.org>, <pb@pbcl.net>,
	<raj.khem@gmail.com>
Date: Wed, 27 Mar 2013 10:19:17 +0100
Message-ID: <019d01ce2acc$289b89a0$79d29ce0$@st.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Ac4qzCb0AOJF8H+MS0adIXthb8ZuMQ==
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
X-List-Received-Date: Wed, 27 Mar 2013 11:42:07 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_019E_01CE2AD4.8A61C660"
Content-Language: it

------=_NextPart_000_019E_01CE2AD4.8A61C660
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi All,

=20

=D8  Where does this dependency come from?

The dependency comes from the =93ip=94 subdirs, where there are three =
bash
scripts.

Also there are few scripts as examples.

=20

Khem,

do you think it is however the case to split the package creating the ip
one?=20

This problem appeared when I tried to install iproute2, previously =
packaged
as rpm.

=20

Best Regards,

Giuseppe

=20

=20

From: Giuseppe Condorelli [mailto:giuseppe.condorelli@gmail.com]=20
Sent: mercoled=EC 27 marzo 2013 10:14
To: Giuseppe CONDORELLI
Subject: Fwd: [OE-core] [PATCH] iproute2: add bash runtime dependence

=20

=20

---------- Forwarded message ----------
From: Phil Blundell <pb@pbcl.net>
Date: 2013/3/26
Subject: Re: [OE-core] [PATCH] iproute2: add bash runtime dependence
To: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
Cc: openembedded-core@lists.openembedded.org



On Tue, 2013-03-26 at 17:17 +0100, Giuseppe CONDORELLI wrote:
> Add bash runtime dependence, required at package install time.

Where does this dependency come from?

p.




_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

=20


------=_NextPart_000_019E_01CE2AD4.8A61C660
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1"><meta name=3DGenerator content=3D"Microsoft Word =
14 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
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
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
span.hoenzb
	{mso-style-name:hoenzb;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 2.0cm 2.0cm 2.0cm;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:875774935;
	mso-list-type:hybrid;
	mso-list-template-ids:181808130 1764363520 67698691 67698693 67698689 =
67698691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0D8;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;
	mso-fareast-font-family:Calibri;
	mso-bidi-font-family:"Times New Roman";}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue =
vlink=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>Hi All,<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoListParagraph =
style=3D'text-indent:-18.0pt;mso-list:l0 level1 lfo1'><![if =
!supportLists]><span =
style=3D'font-size:11.0pt;font-family:Wingdings;color:#1F497D'><span =
style=3D'mso-list:Ignore'>=D8<span style=3D'font:7.0pt "Times New =
Roman"'>&nbsp; </span></span></span><![endif]>Where does this dependency =
come from?<span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'><o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>The dependency comes from the &#8220;ip&#8221; subdirs, where there =
are three bash scripts.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>Also there are few scripts as examples.<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>Khem,<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>do you think it is however the case to split the package creating the =
ip one? <o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>This problem appeared when I tried to install iproute2, previously =
packaged as rpm.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>Best Regards,<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>Giuseppe<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'><o:p>&nbsp;</o:p></span></p><div =
style=3D'border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt'><div><div style=3D'border:none;border-top:solid #B5C4DF =
1.0pt;padding:3.0pt 0cm 0cm 0cm'><p class=3DMsoNormal><b><span =
style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'>From:</span>=
</b><span style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'> =
Giuseppe Condorelli [mailto:giuseppe.condorelli@gmail.com] =
<br><b>Sent:</b> mercoled=EC 27 marzo 2013 10:14<br><b>To:</b> Giuseppe =
CONDORELLI<br><b>Subject:</b> Fwd: [OE-core] [PATCH] iproute2: add bash =
runtime dependence<o:p></o:p></span></p></div></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal =
style=3D'margin-bottom:12.0pt'><o:p>&nbsp;</o:p></p><div><p =
class=3DMsoNormal style=3D'margin-bottom:12.0pt'>---------- Forwarded =
message ----------<br>From: <b>Phil Blundell</b> &lt;<a =
href=3D"mailto:pb@pbcl.net">pb@pbcl.net</a>&gt;<br>Date: =
2013/3/26<br>Subject: Re: [OE-core] [PATCH] iproute2: add bash runtime =
dependence<br>To: Giuseppe CONDORELLI &lt;<a =
href=3D"mailto:giuseppe.condorelli@st.com">giuseppe.condorelli@st.com</a>=
&gt;<br>Cc: <a =
href=3D"mailto:openembedded-core@lists.openembedded.org">openembedded-cor=
e@lists.openembedded.org</a><br><br><o:p></o:p></p><div><p =
class=3DMsoNormal style=3D'margin-bottom:12.0pt'>On Tue, 2013-03-26 at =
17:17 +0100, Giuseppe CONDORELLI wrote:<br>&gt; Add bash runtime =
dependence, required at package install time.<o:p></o:p></p></div><p =
class=3DMsoNormal>Where does this dependency come from?<br><span =
style=3D'color:#888888'><br><span =
class=3Dhoenzb>p.</span></span><o:p></o:p></p><div><div><p =
class=3DMsoNormal><br><br><br>___________________________________________=
____<br>Openembedded-core mailing list<br><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-cor=
e@lists.openembedded.org</a><br><a =
href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
core" =
target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/ope=
nembedded-core</a><o:p></o:p></p></div></div></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></div></body></html>

------=_NextPart_000_019E_01CE2AD4.8A61C660--
