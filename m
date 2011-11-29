Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RVCyv-00053x-M9
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 02:59:38 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Nov 2011 17:52:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,588,1315206000"; d="scan'208,217";a="80029306"
Received: from orsmsx602.amr.corp.intel.com ([10.22.226.211])
	by azsmga001.ch.intel.com with ESMTP; 28 Nov 2011 17:52:58 -0800
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx602.amr.corp.intel.com ([10.22.226.211]) with mapi;
	Mon, 28 Nov 2011 17:52:58 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 28 Nov 2011 17:52:57 -0800
Thread-Topic: [OE-core] [PATCH 3/4] gmp: also generate the libgmpcxx library
	& package it properly
Thread-Index: AcyuMzLNhmNnXzTDR0eCd2fk0BXDbwABab8Q
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E3D06804@orsmsx504.amr.corp.intel.com>
References: <cover.1322526931.git.nitin.a.kamble@intel.com>
	<6b7fb8503d66ee4d4c3d43f3c368b8aa2d010add.1322526931.git.nitin.a.kamble@intel.com>
	<4f8425c0c7856dba2b3765407a97754c7b06aeb5.1322526931.git.nitin.a.kamble@intel.com>
	<CAP9ODKpm7jB4FhBuNC7biDyuhVg8Kdxf5wEcm+WwsAyRtZR+WQ@mail.gmail.com>
In-Reply-To: <CAP9ODKpm7jB4FhBuNC7biDyuhVg8Kdxf5wEcm+WwsAyRtZR+WQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] gmp: also generate the libgmpcxx library & package it properly
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
X-List-Received-Date: Tue, 29 Nov 2011 01:59:38 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_9DA5872FEF993D41B7173F58FCF6BE94E3D06804orsmsx504amrcor_"

--_000_9DA5872FEF993D41B7173F58FCF6BE94E3D06804orsmsx504amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Otavio Salvador
Sent: Monday, November 28, 2011 5:07 PM
To: Patches and discussions about the oe-core layer
Subject: Re: [OE-core] [PATCH 3/4] gmp: also generate the libgmpcxx library=
 & package it properly

On Mon, Nov 28, 2011 at 22:36, <nitin.a.kamble@intel.com<mailto:nitin.a.kam=
ble@intel.com>> wrote:
...
+PACKAGES =3D+ "libgmp10 libgmpxx4"
+FILES_libgmp10 =3D "${libdir}/libgmp.so.10*"
+FILES_libgmpxx4 =3D "${libdir}/libgmpxx.so.4*"

Why didn't you let the system to name the package using the soname by itsel=
f and avoid putting the soname on the glob matching?

Before the generation of libgmpxx library, there was only one library, libg=
mp, and it was getting packaged into libgmp10 package. After addition of th=
e libgmpxx library the package name changed to the recipe name (gmp), in or=
der to preserve the previous package name(for distro upgrades), and to let =
people avoid installation of libgmpxx if they don't need it in order to sav=
e the space on target, two packages are generated for each library with thi=
s scheme.

Nitin

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br<mailto:otavio@ossystems.com.br>  http://www=
.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--_000_9DA5872FEF993D41B7173F58FCF6BE94E3D06804orsmsx504amrcor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40"><head><meta http-equiv=3DContent-Type content=
=3D"text/html; charset=3Dus-ascii"><meta name=3DGenerator content=3D"Micros=
oft Word 12 (filtered medium)"><style><!--
/* Font Definitions */
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
span.EmailStyle17
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;}
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
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue vli=
nk=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span style=3D'f=
ont-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'><o:p>&nbs=
p;</o:p></span></p><p class=3DMsoNormal><span style=3D'font-size:11.0pt;fon=
t-family:"Calibri","sans-serif";color:#1F497D'><o:p>&nbsp;</o:p></span></p>=
<div style=3D'border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt'><div><div style=3D'border:none;border-top:solid #B5C4DF 1.0pt;paddin=
g:3.0pt 0in 0in 0in'><p class=3DMsoNormal><b><span style=3D'font-size:10.0p=
t;font-family:"Tahoma","sans-serif"'>From:</span></b><span style=3D'font-si=
ze:10.0pt;font-family:"Tahoma","sans-serif"'> openembedded-core-bounces@lis=
ts.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.or=
g] <b>On Behalf Of </b>Otavio Salvador<br><b>Sent:</b> Monday, November 28,=
 2011 5:07 PM<br><b>To:</b> Patches and discussions about the oe-core layer=
<br><b>Subject:</b> Re: [OE-core] [PATCH 3/4] gmp: also generate the libgmp=
cxx library &amp; package it properly<o:p></o:p></span></p></div></div><p c=
lass=3DMsoNormal><o:p>&nbsp;</o:p></p><div><p class=3DMsoNormal>On Mon, Nov=
 28, 2011 at 22:36, &lt;<a href=3D"mailto:nitin.a.kamble@intel.com">nitin.a=
.kamble@intel.com</a>&gt; wrote:<o:p></o:p></p><p class=3DMsoNormal>...<o:p=
></o:p></p><blockquote style=3D'border:none;border-left:solid #CCCCCC 1.0pt=
;padding:0in 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in'><p class=3DM=
soNormal>+PACKAGES =3D+ &quot;libgmp10 libgmpxx4&quot;<br>+FILES_libgmp10 =
=3D &quot;${libdir}/libgmp.so.10*&quot;<br>+FILES_libgmpxx4 =3D &quot;${lib=
dir}/libgmpxx.so.4*&quot;<o:p></o:p></p></blockquote><div><p class=3DMsoNor=
mal><o:p>&nbsp;</o:p></p></div><div><p class=3DMsoNormal>Why didn't you let=
 the system to name the package using the soname by itself and avoid puttin=
g the soname on the glob matching?<o:p></o:p></p></div><div><p class=3DMsoN=
ormal>&nbsp;<o:p></o:p></p><p class=3DMsoNormal><span style=3D'font-size:11=
.0pt;font-family:"Calibri","sans-serif";color:#1F497D'>Before the generatio=
n of libgmpxx library, there was only one library, libgmp, and it was getti=
ng packaged into libgmp10 package. After addition of the libgmpxx library t=
he package name changed to the recipe name (gmp), in order to preserve the =
previous package name(for distro upgrades), and to let people avoid install=
ation of libgmpxx if they don&#8217;t need it in order to save the space on=
 target, two packages are generated for each library with this scheme.<o:p>=
</o:p></span></p><p class=3DMsoNormal><span style=3D'font-size:11.0pt;font-=
family:"Calibri","sans-serif";color:#1F497D'><o:p>&nbsp;</o:p></span></p><p=
 class=3DMsoNormal><span style=3D'font-size:11.0pt;font-family:"Calibri","s=
ans-serif";color:#1F497D'>Nitin<o:p></o:p></span></p><p class=3DMsoNormal><=
span style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F=
497D'><o:p>&nbsp;</o:p></span></p></div></div><p class=3DMsoNormal style=3D=
'margin-bottom:12.0pt'>-- <br>Otavio Salvador&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;O=
.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D=
"_blank">otavio@ossystems.com.br</a>&nbsp; <a href=3D"http://www.ossystems.=
com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53=
 9981-7854&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<a href=3D"=
http://projetos.ossystems.com.br" target=3D"_blank">http://projetos.ossyste=
ms.com.br</a><o:p></o:p></p></div></div></body></html>=

--_000_9DA5872FEF993D41B7173F58FCF6BE94E3D06804orsmsx504amrcor_--
