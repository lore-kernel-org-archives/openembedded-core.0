Received: from smtp1.ingenico.com ([217.108.148.240])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Matthieu.CRAPET@ingenico.com>) id 1S7TMI-00057i-1s
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 16:09:54 +0100
X-IronPort-AV: E=Sophos;i="4.73,577,1325458800"; d="scan'208,217";a="8823888"
Received: from unknown (HELO COSNPREXC22.usr.ingenico.loc) ([10.31.16.112])
	by antispam1.usr.ingenico.loc with ESMTP; 13 Mar 2012 16:00:09 +0100
Received: from COSNPREXC3.usr.ingenico.loc (10.1.1.182) by
	COSNPREXC22.usr.ingenico.loc (10.31.16.112) with Microsoft SMTP Server
	id 14.1.355.2; Tue, 13 Mar 2012 16:00:09 +0100
Importance: normal
Priority: normal
Received: from FRSNPREXC1.usr.ingenico.loc ([10.23.2.11]) by
	COSNPREXC3.usr.ingenico.loc with Microsoft SMTPSVC(6.0.3790.1830);
	Tue, 13 Mar 2012 16:00:09 +0100
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.3790.3168
MIME-Version: 1.0
Date: Tue, 13 Mar 2012 16:00:08 +0100
Message-ID: <D9D7124626ED1E43963D86B2657D5CCD02EB625C@FRSNPREXC1.usr.ingenico.loc>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: gettext_0.18.1.1.bb (PR r7 => r8)
Thread-Index: Ac0BKc6+SUKlSxYERNKWrUthh9FuVg==
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
X-OriginalArrivalTime: 13 Mar 2012 15:00:09.0645 (UTC)
	FILETIME=[FBFB4DD0:01CD0129]
Subject: gettext_0.18.1.1.bb (PR r7 => r8)
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
X-List-Received-Date: Tue, 13 Mar 2012 15:09:54 -0000
Content-Transfer-Encoding: 7bit
Content-Class: urn:content-classes:message
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01CD0129.FBCF92F6"

------_=_NextPart_001_01CD0129.FBCF92F6
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Greetings,

=20

Updated my openembedded-core git repository.

Rebuilt world for my custom distro (compiling for a BeagleBoard).

=20

I've got an error on gettext.=20

=20

.../build/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv7a-vfp-neon-i
ng-linux-gnueabi/gcc/arm-ing-linux-gnueabi/4.6.4/ld: warning: library
search path "/usr/lib" is unsafe for cross-compilation

/usr/lib/libtinfo.so: file not recognized: File format not recognized

collect2: ld returned 1 exit status

=20

Reintroducing --with-libncurses-prefix line solves the issue.

Am I missing somthing here?

=20

Regards,

Matthieu


=20
About Ingenico: Ingenico is a leading provider of payment, transaction =
and business solutions, with over 17 million terminals deployed in more =
than 125 countries. Over 3,600 employees worldwide support merchants, =
banks and service providers to optimize and secure their electronic =
payments solutions, develop their offer of services and increase their =
point of sales revenue.
More information on http://www.ingenico.com/.
 This message may contain confidential and/or privileged information. If =
you are not the addressee or authorized to receive this for the =
addressee, you must not use, copy, disclose or take any action based on =
this message or any information herein. If you have received this =
message in error, please advise the sender immediately by reply e-mail =
and delete this message. Thank you for your cooperation.
 P Please consider the environment before printing this e-mail
=20
=20

------_=_NextPart_001_01CD0129.FBCF92F6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<HTML xmlns=3D"http://www.w3.org/TR/REC-html40" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns:o=3D"xmlns:o" xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word"><head><META =
content=3D"text/html; charset=3Dutf-8" http-equiv=3D"Content-Type">
<META content=3D"text/html; charset=3Dutf-8" =
HTTP-EQUIV=3D"Content-Type"><meta content=3D"Microsoft Word 14 (filtered =
medium)" name=3DGenerator><style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
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
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--><META content=3D"text/html; =
charset=3Dutf-8" http-equiv=3D"Content-Type"><TITLE>Notice</TITLE>
</head><BODY>
<DIV><div class=3DWordSection1><p =
class=3DMsoNormal>Greetings,<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Updated my =
openembedded-core git repository.<o:p></o:p></p><p =
class=3DMsoNormal>Rebuilt world for my custom distro (compiling for a =
BeagleBoard).<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>I've got an error on gettext. <o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>.../build/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/=
armv7a-vfp-neon-ing-linux-gnueabi/gcc/arm-ing-linux-gnueabi/4.6.4/ld: =
warning: library search path &quot;/usr/lib&quot; is unsafe for =
cross-compilation<o:p></o:p></p><p =
class=3DMsoNormal>/usr/lib/libtinfo.so: file not recognized: File format =
not recognized<o:p></o:p></p><p class=3DMsoNormal>collect2: ld returned =
1 exit status<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Reintroducing --with-libncurses-prefix line solves the =
issue.<o:p></o:p></p><p class=3DMsoNormal>Am I missing somthing =
here?<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Regards,<o:p></o:p></p><p =
class=3DMsoNormal>Matthieu<o:p></o:p></p></div></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT FACE=3D"Arial" SIZE=3D"1">
<P STYLE=3D"TEXT-ALIGN: justify"><SPAN><FONT FACE=3D"Arial" =
SIZE=3D"2"><STRONG><FONT COLOR=3D"#ff0000">About =
Ingenico</FONT>:</STRONG> </FONT><SPAN LANG=3D"EN-GB" =
STYLE=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB"><SPAN STYLE=3D"FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: Arial; =
mso-ansi-language: FR; mso-fareast-font-family: 'Times New Roman'; =
mso-fareast-language: FR; mso-bidi-language: AR-SA">Ingenico is a =
leading provider of payment, transaction and business solutions, with =
over 17 million terminals deployed in more than 125 countries. Over =
3,600 employees worldwide support merchants, banks and service providers =
to optimize and secure their electronic payments solutions, develop =
their offer of services and increase their point of sales revenue. =
</SPAN></SPAN></SPAN></P>
<P STYLE=3D"TEXT-ALIGN: justify"><SPAN><SPAN LANG=3D"EN-GB" =
STYLE=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB"><SPAN STYLE=3D"FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: Arial; =
mso-ansi-language: FR; mso-fareast-font-family: 'Times New Roman'; =
mso-fareast-language: FR; mso-bidi-language: =
AR-SA"></SPAN></SPAN></SPAN><SPAN><SPAN LANG=3D"EN-GB" =
STYLE=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB"><SPAN STYLE=3D"FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: Arial; =
mso-ansi-language: FR; mso-fareast-font-family: 'Times New Roman'; =
mso-fareast-language: FR; mso-bidi-language: AR-SA">More information =
on</SPAN></SPAN></SPAN><SPAN><STRONG><SPAN LANG=3D"EN-GB" =
STYLE=3D"FONT-SIZE: 10pt; FONT-FAMILY: Arial; mso-ansi-language: =
EN-GB"><SPAN STYLE=3D"COLOR: red"> <A =
HREF=3D"http://www.ingenico.com/"><SPAN STYLE=3D"COLOR: red"><FONT =
COLOR=3D"#ff0000">www.ingenico.com</FONT></SPAN></A></SPAN>.</SPAN></STRO=
NG></SPAN></P><SPAN></SPAN><SPAN STYLE=3D"FONT-SIZE: 7.5pt; FONT-FAMILY: =
'Arial','sans-serif'"></SPAN>
<P STYLE=3D"TEXT-ALIGN: justify"><SPAN STYLE=3D"FONT-SIZE: 7.5pt; =
FONT-FAMILY: 'Arial','sans-serif'">&nbsp;This message may contain =
confidential and/or privileged information. If you are not the addressee =
or authorized to receive this for the addressee, you must not use, copy, =
disclose or take any action based on this message or any information =
herein. If you have received this message in error, please advise the =
sender immediately by reply e-mail and delete this message. Thank you =
for your cooperation.</SPAN></P>
<P CLASS=3D"MsoNormal"><SPAN STYLE=3D"FONT-SIZE: 7.5pt; FONT-FAMILY: =
'Arial','sans-serif'">&nbsp;</SPAN><SPAN LANG=3D"EN-GB" =
STYLE=3D"FONT-SIZE: 12pt; COLOR: green; FONT-FAMILY: =
Webdings">P</SPAN><SPAN LANG=3D"EN-GB" STYLE=3D"COLOR: black; =
FONT-FAMILY: 'Arial','sans-serif'"> </SPAN><SPAN LANG=3D"EN-GB" =
STYLE=3D"FONT-SIZE: 7.5pt; COLOR: green; FONT-FAMILY: =
'Arial','sans-serif'">Please consider the environment before printing =
this e-mail</SPAN></P></FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><U><FONT COLOR=3D"#0000ff" SIZE=3D"1"></FONT></U><FONT =
COLOR=3D"#0000ff" FACE=3D"Times New Roman" SIZE=3D"1">
<P><U></U>&nbsp;</P></FONT></DIV></BODY></HTML>

------_=_NextPart_001_01CD0129.FBCF92F6--
