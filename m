Received: from eu1sys200aog117.obsmtp.com ([207.126.144.143])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@st.com>) id 1UKxup-0006YM-Lp
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 22:29:55 +0100
Received: from beta.dmz-eu.st.com ([164.129.1.35]) (using TLSv1) by
	eu1sys200aob117.postini.com ([207.126.147.11]) with SMTP
	ID DSNKUVNg0xB/l4vTbVrk6qgbJ/ZqE7p3D9ti@postini.com;
	Wed, 27 Mar 2013 21:12:52 UTC
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 530B2166;
	Wed, 27 Mar 2013 14:51:21 +0000 (GMT)
Received: from mail7.sgp.st.com (unknown [164.129.223.81])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1DED9513A;
	Wed, 27 Mar 2013 14:51:21 +0000 (GMT)
Received: from CTN005027 (pcmdt30.ctn.st.com [164.130.129.192])
	by mail7.sgp.st.com (MOS 4.3.3-GA)
	with ESMTP id BAL24463 (AUTH condorg);
	Wed, 27 Mar 2013 15:51:20 +0100
From: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
To: "'Khem Raj'" <raj.khem@gmail.com>
References: <019d01ce2acc$289b89a0$79d29ce0$@st.com>
	<91A9D013-4F74-40F0-B6BB-6FFB647B3991@gmail.com>
In-Reply-To: <91A9D013-4F74-40F0-B6BB-6FFB647B3991@gmail.com>
Date: Wed, 27 Mar 2013 15:51:20 +0100
Message-ID: <01c001ce2afa$8b56b870$a2042950$@st.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQGhK5HCc9pjEX0oQuh2L5R4E4LUcQItg796mQIxhFA=
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 27 Mar 2013 21:29:55 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_01C1_01CE2B02.ED1D6A60"
Content-Language: it

------=_NextPart_000_01C1_01CE2B02.ED1D6A60
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

What=92s about ifcfg and rtpr contained in ip dir?

=20

From: Khem Raj [mailto:raj.khem@gmail.com]=20
Sent: mercoled=EC 27 marzo 2013 15:48
To: Giuseppe CONDORELLI
Cc: openembedded-core@lists.openembedded.org; pb@pbcl.net
Subject: Re: [OE-core] [PATCH] iproute2: add bash runtime dependence

=20

=20

On Mar 27, 2013, at 2:19 AM, Giuseppe CONDORELLI
<giuseppe.condorelli@st.com> wrote:





Hi All,

=20

=D8  Where does this dependency come from?

The dependency comes from the =93ip=94 subdirs, where there are three =
bash
scripts.

Also there are few scripts as examples.

=20

=20

yeah create a new package something like iproute2-examples and package =
these
scripts there





Khem,

do you think it is however the case to split the package creating the ip
one?

This problem appeared when I tried to install iproute2, previously =
packaged
as rpm.

=20

Best Regards,

Giuseppe

=20

=20

From: Giuseppe Condorelli [mailto:giuseppe.condorelli@ =
<http://gmail.com>
gmail.com]=20
Sent: mercoled=EC 27 marzo 2013 10:14
To: Giuseppe CONDORELLI
Subject: Fwd: [OE-core] [PATCH] iproute2: add bash runtime dependence

=20

=20

---------- Forwarded message ----------
From: Phil Blundell < <mailto:pb@pbcl.net> pb@pbcl.net>
Date: 2013/3/26
Subject: Re: [OE-core] [PATCH] iproute2: add bash runtime dependence
To: Giuseppe CONDORELLI < <mailto:giuseppe.condorelli@st.com>
giuseppe.condorelli@st.com>
Cc:  <mailto:openembedded-core@lists.openembedded.org>
openembedded-core@lists.openembedded.org




On Tue, 2013-03-26 at 17:17 +0100, Giuseppe CONDORELLI wrote:
> Add bash runtime dependence, required at package install time.

Where does this dependency come from?

p.




_______________________________________________
Openembedded-core mailing list
 <mailto:Openembedded-core@lists.openembedded.org>
Openembedded-core@lists.openembedded.org
 <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

=20

=20


------=_NextPart_000_01C1_01CE2B02.ED1D6A60
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
14 (filtered medium)"><base href=3D"x-msg://1289/"><style><!--
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
span.apple-converted-space
	{mso-style-name:apple-converted-space;}
span.hoenzb
	{mso-style-name:hoenzb;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 2.0cm 2.0cm 2.0cm;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue =
vlink=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>What&#8217;s about ifcfg and rtpr contained in ip =
dir?<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'><o:p>&nbsp;</o:p></span></p><div =
style=3D'border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt'><div><div style=3D'border:none;border-top:solid #B5C4DF =
1.0pt;padding:3.0pt 0cm 0cm 0cm'><p class=3DMsoNormal><b><span =
style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'>From:</span>=
</b><span style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'> =
Khem Raj [mailto:raj.khem@gmail.com] <br><b>Sent:</b> mercoled=EC 27 =
marzo 2013 15:48<br><b>To:</b> Giuseppe CONDORELLI<br><b>Cc:</b> =
openembedded-core@lists.openembedded.org; pb@pbcl.net<br><b>Subject:</b> =
Re: [OE-core] [PATCH] iproute2: add bash runtime =
dependence<o:p></o:p></span></p></div></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><div><p class=3DMsoNormal>On =
Mar 27, 2013, at 2:19 AM, Giuseppe CONDORELLI &lt;<a =
href=3D"mailto:giuseppe.condorelli@st.com">giuseppe.condorelli@st.com</a>=
&gt; wrote:<o:p></o:p></p></div><p =
class=3DMsoNormal><br><br><o:p></o:p></p><div><div><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>Hi All,</span><o:p></o:p></p></div><div><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>&nbsp;</span><o:p></o:p></p></div><div =
style=3D'margin-left:36.0pt'><p class=3DMsoNormal =
style=3D'text-indent:-18.0pt'><span =
style=3D'font-size:11.0pt;font-family:Wingdings;color:#1F497D'>=D8</span>=
<span style=3D'font-size:7.0pt;color:#1F497D'>&nbsp;<span =
class=3Dapple-converted-space>&nbsp;</span></span>Where does this =
dependency come from?<o:p></o:p></p></div><div><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>The dependency comes from the &#8220;ip&#8221; subdirs, where there =
are three bash scripts.</span><o:p></o:p></p></div><div><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>Also there are few scripts as =
examples.</span><o:p></o:p></p></div><div><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>&nbsp;</span><o:p></o:p></p></div></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal>yeah create a new package something like =
iproute2-examples and package these scripts there<o:p></o:p></p></div><p =
class=3DMsoNormal><br><br><o:p></o:p></p><div><div><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>Khem,</span><o:p></o:p></p></div><div><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>do you think it is however the case to split the package creating the =
ip one?</span><o:p></o:p></p></div><div><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>This problem appeared when I tried to install iproute2, previously =
packaged as rpm.</span><o:p></o:p></p></div><div><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>&nbsp;</span><o:p></o:p></p></div><div><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>Best Regards,</span><o:p></o:p></p></div><div><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>Giuseppe</span><o:p></o:p></p></div><div><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>&nbsp;</span><o:p></o:p></p></div><div><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>&nbsp;</span><o:p></o:p></p></div><div =
style=3D'border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt'><div><div style=3D'border:none;border-top:solid #B5C4DF =
1.0pt;padding:3.0pt 0cm 0cm 0cm'><div><p class=3DMsoNormal><b><span =
style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'>From:</span>=
</b><span class=3Dapple-converted-space><span =
style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'>&nbsp;</span=
></span><span =
style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'>Giuseppe =
Condorelli [mailto:giuseppe.condorelli@<a =
href=3D"http://gmail.com"><span =
style=3D'color:purple'>gmail.com</span></a>]<span =
class=3Dapple-converted-space>&nbsp;</span><br><b>Sent:</b><span =
class=3Dapple-converted-space>&nbsp;</span>mercoled=EC 27 marzo 2013 =
10:14<br><b>To:</b><span =
class=3Dapple-converted-space>&nbsp;</span>Giuseppe =
CONDORELLI<br><b>Subject:</b><span =
class=3Dapple-converted-space>&nbsp;</span>Fwd: [OE-core] [PATCH] =
iproute2: add bash runtime =
dependence</span><o:p></o:p></p></div></div></div><div><p =
class=3DMsoNormal>&nbsp;<o:p></o:p></p></div><p class=3DMsoNormal =
style=3D'margin-bottom:12.0pt'>&nbsp;<o:p></o:p></p><div><p =
class=3DMsoNormal style=3D'margin-bottom:12.0pt'>---------- Forwarded =
message ----------<br>From:<span =
class=3Dapple-converted-space>&nbsp;</span><b>Phil Blundell</b><span =
class=3Dapple-converted-space>&nbsp;</span>&lt;<a =
href=3D"mailto:pb@pbcl.net"><span =
style=3D'color:purple'>pb@pbcl.net</span></a>&gt;<br>Date: =
2013/3/26<br>Subject: Re: [OE-core] [PATCH] iproute2: add bash runtime =
dependence<br>To: Giuseppe CONDORELLI &lt;<a =
href=3D"mailto:giuseppe.condorelli@st.com"><span =
style=3D'color:purple'>giuseppe.condorelli@st.com</span></a>&gt;<br>Cc:<s=
pan class=3Dapple-converted-space>&nbsp;</span><a =
href=3D"mailto:openembedded-core@lists.openembedded.org"><span =
style=3D'color:purple'>openembedded-core@lists.openembedded.org</span></a=
><br><br><br><o:p></o:p></p><div><p class=3DMsoNormal =
style=3D'margin-bottom:12.0pt'>On Tue, 2013-03-26 at 17:17 +0100, =
Giuseppe CONDORELLI wrote:<br>&gt; Add bash runtime dependence, required =
at package install time.<o:p></o:p></p></div><div><p =
class=3DMsoNormal>Where does this dependency come from?<br><span =
style=3D'color:#888888'><br><span =
class=3Dhoenzb>p.</span></span><o:p></o:p></p></div><div><div><p =
class=3DMsoNormal><br><br><br>___________________________________________=
____<br>Openembedded-core mailing list<br><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org"><span =
style=3D'color:purple'>Openembedded-core@lists.openembedded.org</span></a=
><br><a =
href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
core" target=3D"_blank"><span =
style=3D'color:purple'>http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</span></a><o:p></o:p></p></div></div></div><div><p =
class=3DMsoNormal>&nbsp;<o:p></o:p></p></div></div></div></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></div></body></html>

------=_NextPart_000_01C1_01CE2B02.ED1D6A60--
