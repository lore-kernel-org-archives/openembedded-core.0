Received: from eu1sys200aog109.obsmtp.com ([207.126.144.127])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@st.com>) id 1TQeaw-0008GJ-NI
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 15:32:34 +0200
Received: from beta.dmz-eu.st.com ([164.129.1.35]) (using TLSv1) by
	eu1sys200aob109.postini.com ([207.126.147.11]) with SMTP
	ID DSNKUIaZTn+r4KKFvJgbkD5Lk0lIvZZEozQb@postini.com;
	Tue, 23 Oct 2012 13:19:10 UTC
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5D0CF115
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 07:23:31 +0000 (GMT)
Received: from mail7.sgp.st.com (mail7.sgp.st.com [164.129.223.81])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BDB3238F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 07:23:31 +0000 (GMT)
Received: from CTN005027 (pcmdt30.ctn.st.com [164.130.129.192])
	by mail7.sgp.st.com (MOS 4.3.3-GA)
	with ESMTP id APW43453 (AUTH condorg);
	Tue, 23 Oct 2012 09:23:30 +0200
From: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Oct 2012 09:23:29 +0200
Message-ID: <02f401cdb0ef$4d45ba20$e7d12e60$@st.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Ac2w70yaa2vjt43cQ3SJ1Tzg7zfPYQ==
Subject: Re: [PATCH DISCARD] base-files: do_install_basefilesissue error
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
X-List-Received-Date: Tue, 23 Oct 2012 13:32:34 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_02F5_01CDB100.10CE8A20"
Content-Language: it

------=_NextPart_000_02F5_01CDB100.10CE8A20
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Yes, you are right.

My mistake was because I had DISTRO_VERSION set to -${DATE} and the "-"
caused

the failure of the install. Please discard my patch.

Many thanks,

Giuseppe

 

From: Chris Larson < <mailto:clarson@kergoth.com> clarson@kergoth.com>
Date: 2012/10/23
Subject: Re: [OE-core] [OE-Core][PATCH] base-files:
do_install_basefilesissue error
To: Giuseppe CONDORELLI < <mailto:giuseppe.condorelli@st.com>
giuseppe.condorelli@st.com>
Cc:  <mailto:openembedded-core@lists.openembedded.org>
openembedded-core@lists.openembedded.org



On Mon, Oct 22, 2012 at 8:32 AM, Giuseppe CONDORELLI
<giuseppe.condorelli@st.com> wrote:
> Fixed error in do_install_basefilesissue, printf is now replaced by echo.
>
> Signed-off-by: Giuseppe Condorelli <giuseppe.condorelli@st.com>

What error? Also, this changes the behavior. printf doesn't print a
newline, echo does (unless you use echo -n). printf's behavior is much
more reliable and portable than echos is.
--
Christopher Larson


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

 


------=_NextPart_000_02F5_01CDB100.10CE8A20
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 14 =
(filtered medium)"><style><!--
/* Font Definitions */
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
span.hoenzb
	{mso-style-name:hoenzb;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";
	mso-fareast-language:IT;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
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
</o:shapelayout></xml><![endif]--></head><body lang=3DIT link=3Dblue =
vlink=3Dpurple><div class=3DWordSection1><div><p class=3DMsoNormal =
style=3D'margin-bottom:12.0pt'><span lang=3DEN-US =
style=3D'color:#1F497D'>Yes, you are right.<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'margin-bottom:12.0pt'><span lang=3DEN-US =
style=3D'color:#1F497D'>My mistake was because I had DISTRO_VERSION set =
to -${DATE} and the &#8220;-&#8220; caused<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'margin-bottom:12.0pt'><span lang=3DEN-US =
style=3D'color:#1F497D'>the failure of the install. Please discard my =
patch.<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'margin-bottom:12.0pt'><span lang=3DEN-US =
style=3D'color:#1F497D'>Many thanks,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'margin-bottom:12.0pt'><span lang=3DEN-US =
style=3D'color:#1F497D'>Giuseppe<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'margin-bottom:12.0pt'><span lang=3DEN-US =
style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal =
style=3D'margin-bottom:12.0pt'><span lang=3DEN-US>From: <b>Chris =
Larson</b> &lt;</span><a href=3D"mailto:clarson@kergoth.com"><span =
lang=3DEN-US>clarson@kergoth.com</span></a><span =
lang=3DEN-US>&gt;<br>Date: 2012/10/23<br>Subject: Re: [OE-core] =
[OE-Core][PATCH] base-files: do_install_basefilesissue error<br>To: =
Giuseppe CONDORELLI &lt;</span><a =
href=3D"mailto:giuseppe.condorelli@st.com"><span =
lang=3DEN-US>giuseppe.condorelli@st.com</span></a><span =
lang=3DEN-US>&gt;<br>Cc: </span><a =
href=3D"mailto:openembedded-core@lists.openembedded.org"><span =
lang=3DEN-US>openembedded-core@lists.openembedded.org</span></a><span =
lang=3DEN-US><br><br><o:p></o:p></span></p><div><p class=3DMsoNormal =
style=3D'margin-bottom:12.0pt'>On Mon, Oct 22, 2012 at 8:32 AM, Giuseppe =
CONDORELLI<br>&lt;<a =
href=3D"mailto:giuseppe.condorelli@st.com">giuseppe.condorelli@st.com</a>=
&gt; wrote:<br>&gt; Fixed error in do_install_basefilesissue, printf is =
now replaced by echo.<br>&gt;<br>&gt; Signed-off-by: Giuseppe Condorelli =
&lt;<a =
href=3D"mailto:giuseppe.condorelli@st.com">giuseppe.condorelli@st.com</a>=
&gt;<o:p></o:p></p></div><p class=3DMsoNormal>What error? Also, this =
changes the behavior. printf doesn't print a<br>newline, echo does =
(unless you use echo -n). printf's behavior is much<br>more reliable and =
portable than echos is.<br><span class=3Dhoenzb><span =
style=3D'color:#888888'>--</span></span><span =
style=3D'color:#888888'><br><span class=3Dhoenzb>Christopher =
Larson</span></span><o:p></o:p></p><div><div><p =
class=3DMsoNormal><br>_______________________________________________<br>=
Openembedded-core mailing list<br><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-cor=
e@lists.openembedded.org</a><br><a =
href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
core" =
target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/ope=
nembedded-core</a><o:p></o:p></p></div></div></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>

------=_NextPart_000_02F5_01CDB100.10CE8A20--
