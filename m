Received: from eu1sys200aog107.obsmtp.com ([207.126.144.123])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@st.com>) id 1TwA48-0001Dj-8l
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 12:24:59 +0100
Received: from beta.dmz-eu.st.com ([164.129.1.35]) (using TLSv1) by
	eu1sys200aob107.postini.com ([207.126.147.11]) with SMTP
	ID DSNKUPktbU846WYlzvp0ZzIDhXCZaGZWEXXq@postini.com;
	Fri, 18 Jan 2013 11:09:34 UTC
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 257231DF;
	Fri, 18 Jan 2013 09:01:15 +0000 (GMT)
Received: from mail7.sgp.st.com (unknown [164.129.223.81])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2B9002C02;
	Fri, 18 Jan 2013 09:01:15 +0000 (GMT)
Received: from CTN005027 (pcmdt30.ctn.st.com [164.130.129.192])
	by mail7.sgp.st.com (MOS 4.3.3-GA)
	with ESMTP id AVO71104 (AUTH condorg);
	Fri, 18 Jan 2013 10:01:14 +0100
From: Giuseppe CONDORELLI <giuseppe.condorelli@st.com>
To: "'Martin Jansa'" <martin.jansa@gmail.com>
References: <1358345647-13274-1-git-send-email-giuseppe.condorelli@st.com>	<20130116150205.GE3002@jama>	<CAOHjBZsXebja8FB4GbQNwm5zxBCoEOPh40rE9b71EzXG5fGWdA@mail.gmail.com>	<20130117124209.GE3067@jama>	<065b01cdf4b6$e1510160$a3f30420$@st.com>	<20130117134619.GI3067@jama>	<068101cdf4d3$f2e58fa0$d8b0aee0$@st.com>	<20130117172817.GK3067@jama>	<06a101cdf556$5c273b80$1475b280$@st.com>
	<CA+chaQecHVmeRUmsJ1-guXMv7n8Y2B2AVF-bf4CxfyD3rdrYow@mail.gmail.com>
In-Reply-To: <CA+chaQecHVmeRUmsJ1-guXMv7n8Y2B2AVF-bf4CxfyD3rdrYow@mail.gmail.com>
Date: Fri, 18 Jan 2013 10:01:13 +0100
Message-ID: <06b101cdf55a$5ea8b970$1bfa2c50$@st.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQJd3UIgpWykE/uuKxds/KWg86Wy7AI8MptVAf37k6YCXM8t6gG5dPdSAgbRfn8CkCQuxwHX1DyQAhV/m64CUwI9qpaVuzzg
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc: fix as and ld check in libc dir
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
X-List-Received-Date: Fri, 18 Jan 2013 11:25:01 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_06B2_01CDF562.C06F9270"
Content-Language: it

------=_NextPart_000_06B2_01CDF562.C06F9270
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=20

=20

From: Martin Jansa [mailto:martin.jansa@gmail.com]=20
Sent: venerd=C3=AC 18 gennaio 2013 09:55
To: Giuseppe CONDORELLI
Cc: Giuseppe Condorelli; Patches and discussions about the oe-core layer
Subject: Re: [OE-core] [PATCH] eglibc: fix as and ld check in libc dir

=20

=20

On Fri, Jan 18, 2013 at 9:32 AM, Giuseppe CONDORELLI =
<giuseppe.condorelli@st.com> wrote:

Yes Martin,

but I discovered the issue building (erroneously because eglibc was =
actually
not required at all) an external-toolchain a little bit old (gcc and
binutils) against the master oe-core repository,
which contains eglic-2.16 as you know. And libc/configure comes with the
issue I highlighted.
So, please, think to my patch as a nice to have and not as a mandatory =
one.
I don't know if other people will fall in my same condition.

Thanks so much for your support.
Giuseppe


And are you using eglibc-2.16 built with binutils-2.19 in runtime on =
some targets?

=20

In fact I wrote it was my fault, indeed eglibc has not to be built at =
all given my external toolchain fully provides all the infrastructure.

However this mistake highlighted the possible issue

=20

My point is that if upstream developers decided to support =
binutils-2.20+ only, they probably had some reason to do it and failing =
configure check is better way to show you're building unsupported =
combination then something failing badly in runtime on target.

=20

http://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;f=3Dconfigure.in;h=3D=
bec039bcefe6a0494a249e2b78e112a0ab60893b

This commit also doesn't say why..

=20

Ok, no problem. The patch can remain unapplied if you think it could be =
useless. At any rate it will remain as document if other people will =
fall in that for any reason.

=20

Cheers,

Cheers,


------=_NextPart_000_06B2_01CDF562.C06F9270
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta =
name=3DGenerator content=3D"Microsoft Word 14 (filtered =
medium)"><style><!--
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
span.EmailStyle17
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
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue =
vlink=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'><o:p>&nbsp;</o:p></span></p><div =
style=3D'border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt'><div><div style=3D'border:none;border-top:solid #B5C4DF =
1.0pt;padding:3.0pt 0cm 0cm 0cm'><p class=3DMsoNormal><b><span =
style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'>From:</span>=
</b><span style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'> =
Martin Jansa [mailto:martin.jansa@gmail.com] <br><b>Sent:</b> =
venerd=C3=AC 18 gennaio 2013 09:55<br><b>To:</b> Giuseppe =
CONDORELLI<br><b>Cc:</b> Giuseppe Condorelli; Patches and discussions =
about the oe-core layer<br><b>Subject:</b> Re: [OE-core] [PATCH] eglibc: =
fix as and ld check in libc dir<o:p></o:p></span></p></div></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><p class=3DMsoNormal>On Fri, =
Jan 18, 2013 at 9:32 AM, Giuseppe CONDORELLI &lt;<a =
href=3D"mailto:giuseppe.condorelli@st.com" =
target=3D"_blank">giuseppe.condorelli@st.com</a>&gt; =
wrote:<o:p></o:p></p><div id=3D":6"><p class=3DMsoNormal>Yes =
Martin,<br><br>but I discovered the issue building (erroneously because =
eglibc was actually<br>not required at all) an external-toolchain a =
little bit old (gcc and<br>binutils) against the master oe-core =
repository,<br>which contains eglic-2.16 as you know. And libc/configure =
comes with the<br>issue I highlighted.<br>So, please, think to my patch =
as a nice to have and not as a mandatory one.<br>I don't know if other =
people will fall in my same condition.<br><br>Thanks so much for your =
support.<br>Giuseppe<o:p></o:p></p></div></div><p =
class=3DMsoNormal><br>And are you using eglibc-2.16 built with =
binutils-2.19 in runtime on some targets?<span =
style=3D'color:#1F497D'><o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>In fact I wrote it was my fault, indeed eglibc has not to be built at =
all given my external toolchain fully provides all the =
infrastructure.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>However this mistake highlighted the possible =
issue<o:p></o:p></span></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal>My point is that if upstream developers decided to =
support binutils-2.20+ only, they probably had some reason to do it and =
failing configure check is better way to show you're building =
unsupported combination then something failing badly in runtime on =
target.<o:p></o:p></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal><a =
href=3D"http://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;f=3Dconfigure=
.in;h=3Dbec039bcefe6a0494a249e2b78e112a0ab60893b">http://sourceware.org/g=
it/?p=3Dglibc.git;a=3Dcommit;f=3Dconfigure.in;h=3Dbec039bcefe6a0494a249e2=
b78e112a0ab60893b</a><o:p></o:p></p></div><div><p class=3DMsoNormal>This =
commit also doesn't say why..<o:p></o:p></p></div><div><p =
class=3DMsoNormal><span =
style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>Ok, no problem. The patch can remain unapplied if you think it could =
be useless. At any rate it will remain as document if other people will =
fall in that for any reason.<o:p></o:p></span></p></div><div><p =
class=3DMsoNormal><span =
style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal>Cheers,<o:p></o:p></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497=
D'>Cheers,<o:p></o:p></span></p></div></div></div></div></body></html>

------=_NextPart_000_06B2_01CDF562.C06F9270--
