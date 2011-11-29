Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RVTeV-00029H-49
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 20:47:39 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Nov 2011 11:40:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,592,1315206000"; d="scan'208,217";a="80337866"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by azsmga001.ch.intel.com with ESMTP; 29 Nov 2011 11:40:58 -0800
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx603.amr.corp.intel.com ([10.22.226.49]) with mapi;
	Tue, 29 Nov 2011 11:40:58 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2011 11:40:58 -0800
Thread-Topic: [OE-core] [PATCH 4/4] libx11-trip_1.4.4: fix the source tarall
	checksums
Thread-Index: Acyuzntb4SVW4CUcRnCAyA2zTeerNwAAD65Q
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E3D9E6A3@orsmsx504.amr.corp.intel.com>
References: <cover.1322594901.git.nitin.a.kamble@intel.com>
	<48bd68cce53c87c7f9296a0a0ad5286efef7d5cc.1322594901.git.nitin.a.kamble@intel.com>
	<31da063f85416b31c137b5026029c0660e7e3b7a.1322594902.git.nitin.a.kamble@intel.com>
	<CAP9ODKpiRUg_vKmcuE9rewV4wUpK23MSLj6V3QCe1y_r5pqH0A@mail.gmail.com>
In-Reply-To: <CAP9ODKpiRUg_vKmcuE9rewV4wUpK23MSLj6V3QCe1y_r5pqH0A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] libx11-trip_1.4.4: fix the source tarall checksums
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
X-List-Received-Date: Tue, 29 Nov 2011 19:47:39 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_9DA5872FEF993D41B7173F58FCF6BE94E3D9E6A3orsmsx504amrcor_"

--_000_9DA5872FEF993D41B7173F58FCF6BE94E3D9E6A3orsmsx504amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thank you for catching the typo. I have fixed it in the contrib branch.
Nitin

From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Otavio Salvador
Sent: Tuesday, November 29, 2011 11:38 AM
To: Patches and discussions about the oe-core layer
Subject: Re: [OE-core] [PATCH 4/4] libx11-trip_1.4.4: fix the source tarall=
 checksums

Typo on commit log. It is libx11-trim not trip ;)
On Tue, Nov 29, 2011 at 17:30, <nitin.a.kamble@intel.com<mailto:nitin.a.kam=
ble@intel.com>> wrote:
From: Nitin A Kamble <nitin.a.kamble@intel.com<mailto:nitin.a.kamble@intel.=
com>>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com<mailto:nitin.a.kamb=
le@intel.com>>
---
 .../recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb<http://libx11-trim_1.4.=
4.bb> |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb<http://lib=
x11-trim_1.4.4.bb> b/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb<ht=
tp://libx11-trim_1.4.4.bb>
index 7aed308..c94a3a8 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb<http://libx11-tri=
m_1.4.4.bb>
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb<http://libx11-tri=
m_1.4.4.bb>
@@ -13,8 +13,7 @@ SRC_URI +=3D "file://x11_disable_makekeys.patch \
            file://keysymdef_include.patch \
            file://makekeys_crosscompile.patch"

-
-SRC_URI[md5sum] =3D "f65c9c7ecbfb64c19dbd7927160d63fd"
-SRC_URI[sha256sum] =3D "88d7238ce5f7cd123450567de7a3b56a43556e4ccc45df38b8=
324147c889a844"
+SRC_URI[md5sum] =3D "ed7c382cbf8c13425b6a66bcac0ca5d9"
+SRC_URI[sha256sum] =3D "7fe62180f08ef5f0a0062fb444591e349cae2ab5af6ad83459=
9f5c654e6c840d"

 EXTRA_OECONF +=3D "--with-keysymdef=3D${STAGING_INCDIR}/X11/ --disable-xcm=
s "
--
1.7.6.4


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org<mailto:Openembedded-core@lists.ope=
nembedded.org>
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br<mailto:otavio@ossystems.com.br>  http://www=
.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--_000_9DA5872FEF993D41B7173F58FCF6BE94E3D9E6A3orsmsx504amrcor_
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
span.hoenzb
	{mso-style-name:hoenzb;}
span.EmailStyle18
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
ont-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'>Thank you=
 for catching the typo. I have fixed it in the contrib branch.<o:p></o:p></=
span></p><p class=3DMsoNormal><span style=3D'font-size:11.0pt;font-family:"=
Calibri","sans-serif";color:#1F497D'>Nitin<o:p></o:p></span></p><p class=3D=
MsoNormal><span style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif=
";color:#1F497D'><o:p>&nbsp;</o:p></span></p><div style=3D'border:none;bord=
er-left:solid blue 1.5pt;padding:0in 0in 0in 4.0pt'><div><div style=3D'bord=
er:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in 0in 0in'><p class=
=3DMsoNormal><b><span style=3D'font-size:10.0pt;font-family:"Tahoma","sans-=
serif"'>From:</span></b><span style=3D'font-size:10.0pt;font-family:"Tahoma=
","sans-serif"'> openembedded-core-bounces@lists.openembedded.org [mailto:o=
penembedded-core-bounces@lists.openembedded.org] <b>On Behalf Of </b>Otavio=
 Salvador<br><b>Sent:</b> Tuesday, November 29, 2011 11:38 AM<br><b>To:</b>=
 Patches and discussions about the oe-core layer<br><b>Subject:</b> Re: [OE=
-core] [PATCH 4/4] libx11-trip_1.4.4: fix the source tarall checksums<o:p><=
/o:p></span></p></div></div><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p cl=
ass=3DMsoNormal style=3D'margin-bottom:12.0pt'>Typo on commit log. It is li=
bx11-trim not trip ;)<o:p></o:p></p><div><p class=3DMsoNormal>On Tue, Nov 2=
9, 2011 at 17:30, &lt;<a href=3D"mailto:nitin.a.kamble@intel.com">nitin.a.k=
amble@intel.com</a>&gt; wrote:<o:p></o:p></p><p class=3DMsoNormal>From: Nit=
in A Kamble &lt;<a href=3D"mailto:nitin.a.kamble@intel.com">nitin.a.kamble@=
intel.com</a>&gt;<br><br>Signed-off-by: Nitin A Kamble &lt;<a href=3D"mailt=
o:nitin.a.kamble@intel.com">nitin.a.kamble@intel.com</a>&gt;<br>---<br>&nbs=
p;.../recipes-graphics/xorg-lib/<a href=3D"http://libx11-trim_1.4.4.bb" tar=
get=3D"_blank">libx11-trim_1.4.4.bb</a> | &nbsp; &nbsp;5 ++---<br>&nbsp;1 f=
iles changed, 2 insertions(+), 3 deletions(-)<br><br>diff --git a/meta/reci=
pes-graphics/xorg-lib/<a href=3D"http://libx11-trim_1.4.4.bb" target=3D"_bl=
ank">libx11-trim_1.4.4.bb</a> b/meta/recipes-graphics/xorg-lib/<a href=3D"h=
ttp://libx11-trim_1.4.4.bb" target=3D"_blank">libx11-trim_1.4.4.bb</a><br>i=
ndex 7aed308..c94a3a8 100644<br>--- a/meta/recipes-graphics/xorg-lib/<a hre=
f=3D"http://libx11-trim_1.4.4.bb" target=3D"_blank">libx11-trim_1.4.4.bb</a=
><br>+++ b/meta/recipes-graphics/xorg-lib/<a href=3D"http://libx11-trim_1.4=
.4.bb" target=3D"_blank">libx11-trim_1.4.4.bb</a><br>@@ -13,8 +13,7 @@ SRC_=
URI +=3D &quot;file://x11_disable_makekeys.patch \<br>&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; file://keysymdef_include.patch \<br>&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; file://makekeys_crosscompile.patch&quot;<br><br>-<b=
r>-SRC_URI[md5sum] =3D &quot;f65c9c7ecbfb64c19dbd7927160d63fd&quot;<br>-SRC=
_URI[sha256sum] =3D &quot;88d7238ce5f7cd123450567de7a3b56a43556e4ccc45df38b=
8324147c889a844&quot;<br>+SRC_URI[md5sum] =3D &quot;ed7c382cbf8c13425b6a66b=
cac0ca5d9&quot;<br>+SRC_URI[sha256sum] =3D &quot;7fe62180f08ef5f0a0062fb444=
591e349cae2ab5af6ad834599f5c654e6c840d&quot;<br><br>&nbsp;EXTRA_OECONF +=3D=
 &quot;--with-keysymdef=3D${STAGING_INCDIR}/X11/ --disable-xcms &quot;<br><=
span class=3Dhoenzb><span style=3D'color:#888888'>--</span></span><span sty=
le=3D'color:#888888'><br><span class=3Dhoenzb>1.7.6.4</span><br><br><br><sp=
an class=3Dhoenzb>_______________________________________________</span><br=
><span class=3Dhoenzb>Openembedded-core mailing list</span><br><span class=
=3Dhoenzb><a href=3D"mailto:Openembedded-core@lists.openembedded.org">Opene=
mbedded-core@lists.openembedded.org</a></span><br><span class=3Dhoenzb><a h=
ref=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-cor=
e" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/op=
enembedded-core</a></span></span><o:p></o:p></p></div><p class=3DMsoNormal>=
<br><br clear=3Dall><o:p></o:p></p><div><p class=3DMsoNormal><o:p>&nbsp;</o=
:p></p></div><p class=3DMsoNormal style=3D'margin-bottom:12.0pt'>-- <br>Ota=
vio Salvador&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;O.S. Systems<br>E-mail: <a href=3D=
"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br<=
/a>&nbsp; <a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://=
www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854&nbsp; &nbsp; &nbsp; &n=
bsp;&nbsp; &nbsp; &nbsp; &nbsp;<a href=3D"http://projetos.ossystems.com.br"=
 target=3D"_blank">http://projetos.ossystems.com.br</a><o:p></o:p></p></div=
></div></body></html>=

--_000_9DA5872FEF993D41B7173F58FCF6BE94E3D9E6A3orsmsx504amrcor_--
