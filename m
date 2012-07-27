Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1SukkQ-0006AQ-3P
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 15:38:30 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1SukIw-0007AZ-7B from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 06:10:06 -0700
Received: from SVR-IES-FEM-04.mgc.mentorg.com ([137.202.0.110]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 27 Jul 2012 06:10:06 -0700
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.57]) by
	SVR-IES-FEM-04.mgc.mentorg.com ([137.202.0.110]) with mapi id
	14.01.0289.001; Fri, 27 Jul 2012 14:10:04 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] dbus-glib: Conditionaly adds dbus-x11 to
	RDEPENDS_${PN}-tests
Thread-Index: Ac1r+LG+eXzIYFPAR2qUaAO9eEr3fQ==
Date: Fri, 27 Jul 2012 13:10:04 +0000
Message-ID: <365E1805BC95084CBE82381A0B8699945BD9B9B0@EU-MBX-03.mgc.mentorg.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
X-OriginalArrivalTime: 27 Jul 2012 13:10:06.0059 (UTC)
	FILETIME=[241E0BB0:01CD6BF9]
Cc: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
Subject: [PATCH] dbus-glib: Conditionaly adds dbus-x11 to RDEPENDS_${PN}-tests
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
X-List-Received-Date: Fri, 27 Jul 2012 13:38:30 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_365E1805BC95084CBE82381A0B8699945BD9B9B0EUMBX03mgcmento_"

--_000_365E1805BC95084CBE82381A0B8699945BD9B9B0EUMBX03mgcmento_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From: Noor Ahsan <noor_ahsan@mentor.com<mailto:noor_ahsan@mentor.com>>

*  Build was hitting an error "Nothing RPROVIDES 'dbus-x11'". dbus-glib RDE=
PENDS on it and
dbus was providing dbus-x11 when x11 was present in DISTRO FEATURES. So con=
ditionally
added dbus-x11 to RDEPENDS_${PN}-tests in dbus-glib recipe.
* Verified on qemuppc.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
meta/recipes-core/dbus/dbus-glib.inc |    2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/meta/recipes-core/dbus/=
dbus-glib.inc
index a8e6d42..9cfe796 100644
--- a/meta/recipes-core/dbus/dbus-glib.inc
+++ b/meta/recipes-core/dbus/dbus-glib.inc
@@ -35,7 +35,7 @@ FILES_${PN}-bash-completion =3D "${sysconfdir}/bash_compl=
etion.d/dbus-bash-complet
FILES_${PN}-dev +=3D "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
FILES_${PN}-dev +=3D "${bindir}/dbus-binding-tool"
-RDEPENDS_${PN}-tests +=3D "dbus-x11"
+RDEPENDS_${PN}-tests +=3D "${@base_contains('DISTRO_FEATURES', 'x11', 'dbu=
s-x11', '', d)}"
FILES_${PN}-tests =3D "${datadir}/${PN}/tests"
FILES_${PN}-tests-dbg =3D "${datadir}/${PN}/tests/.debug/* \
                          ${datadir}/${PN}/tests/core/.debug/* \
--
1.7.10.4

--_000_365E1805BC95084CBE82381A0B8699945BD9B9B0EUMBX03mgcmento_
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
<p class=3D"MsoNormal">From: Noor Ahsan &lt;<a href=3D"mailto:noor_ahsan@me=
ntor.com">noor_ahsan@mentor.com</a>&gt;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">*&nbsp; Build was hitting an error &quot;Nothing RPR=
OVIDES 'dbus-x11'&quot;. dbus-glib RDEPENDS on it and<o:p></o:p></p>
<p class=3D"MsoNormal">dbus was providing dbus-x11 when x11 was present in =
DISTRO FEATURES. So conditionally<o:p></o:p></p>
<p class=3D"MsoNormal">added dbus-x11 to RDEPENDS_${PN}-tests in dbus-glib =
recipe.<o:p></o:p></p>
<p class=3D"MsoNormal">* Verified on qemuppc.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Signed-off-by: Noor Ahsan &lt;noor_ahsan@mentor.com&=
gt;<o:p></o:p></p>
<p class=3D"MsoNormal">---<o:p></o:p></p>
<p class=3D"MsoNormal">meta/recipes-core/dbus/dbus-glib.inc |&nbsp;&nbsp;&n=
bsp; 2 &#43;-<o:p></o:p></p>
<p class=3D"MsoNormal">1 file changed, 1 insertion(&#43;), 1 deletion(-)<o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/=
meta/recipes-core/dbus/dbus-glib.inc<o:p></o:p></p>
<p class=3D"MsoNormal">index a8e6d42..9cfe796 100644<o:p></o:p></p>
<p class=3D"MsoNormal">--- a/meta/recipes-core/dbus/dbus-glib.inc<o:p></o:p=
></p>
<p class=3D"MsoNormal">&#43;&#43;&#43; b/meta/recipes-core/dbus/dbus-glib.i=
nc<o:p></o:p></p>
<p class=3D"MsoNormal">@@ -35,7 &#43;35,7 @@ FILES_${PN}-bash-completion =
=3D &quot;${sysconfdir}/bash_completion.d/dbus-bash-complet<o:p></o:p></p>
<p class=3D"MsoNormal">FILES_${PN}-dev &#43;=3D &quot;${libdir}/dbus-1.0/in=
clude ${bindir}/dbus-glib-tool&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">FILES_${PN}-dev &#43;=3D &quot;${bindir}/dbus-bindin=
g-tool&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">-RDEPENDS_${PN}-tests &#43;=3D &quot;dbus-x11&quot;<=
o:p></o:p></p>
<p class=3D"MsoNormal">&#43;RDEPENDS_${PN}-tests &#43;=3D &quot;${@base_con=
tains('DISTRO_FEATURES', 'x11', 'dbus-x11', '', d)}&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">FILES_${PN}-tests =3D &quot;${datadir}/${PN}/tests&q=
uot;<o:p></o:p></p>
<p class=3D"MsoNormal">FILES_${PN}-tests-dbg =3D &quot;${datadir}/${PN}/tes=
ts/.debug/* \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; ${datadir}/${PN}/tests/core/.debug/* \<o:p></o:p></=
p>
<p class=3D"MsoNormal">-- <o:p></o:p></p>
<p class=3D"MsoNormal">1.7.10.4<o:p></o:p></p>
</div>
</body>
</html>

--_000_365E1805BC95084CBE82381A0B8699945BD9B9B0EUMBX03mgcmento_--
