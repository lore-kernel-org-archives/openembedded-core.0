Return-Path: <george.l.musat@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 25E6D72150
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 07:43:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 18 Nov 2014 23:40:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,415,1413270000"; 
	d="scan'208,217";a="639524621"
Received: from irsmsx151.ger.corp.intel.com ([163.33.192.59])
	by orsmga002.jf.intel.com with ESMTP; 18 Nov 2014 23:43:34 -0800
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.93]) by
	IRSMSX151.ger.corp.intel.com ([163.33.192.59]) with mapi id
	14.03.0195.001; Wed, 19 Nov 2014 07:43:33 +0000
From: "Musat, George L" <george.l.musat@intel.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] meta-yocto/distro: Updated SANITY_TESTED_DISTROS.
Thread-Index: AdADzGUpFwCg2LaKRRye7fbIBD9x8w==
Date: Wed, 19 Nov 2014 07:43:32 +0000
Message-ID: <042E875E1B5D414CA9BB78B7D4FA691C13CE6FEE@IRSMSX102.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: [PATCH] meta-yocto/distro: Updated SANITY_TESTED_DISTROS.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Nov 2014 07:43:36 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_042E875E1B5D414CA9BB78B7D4FA691C13CE6FEEIRSMSX102gercor_"

--_000_042E875E1B5D414CA9BB78B7D4FA691C13CE6FEEIRSMSX102gercor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Removed Poky-1.4, Poky-1.5, Ubuntu-13.10, Fedora-19, CentOs-6.4,Suse-LINUX-=
12.2. Replaced the list of Debian-7.x with wildcard.



Signed-off-by: Lucian Musat <george.l.musat@intel.com<mailto:george.l.musat=
@intel.com>>

---

meta-yocto/conf/distro/poky.conf | 14 +-------------

1 file changed, 1 insertion(+), 13 deletions(-)



diff --git a/meta-yocto/conf/distro/poky.conf b/meta-yocto/conf/distro/poky=
.conf

index eaf06d3..295895f 100644

--- a/meta-yocto/conf/distro/poky.conf

+++ b/meta-yocto/conf/distro/poky.conf

@@ -73,25 +73,13 @@ CONNECTIVITY_CHECK_URIS ?=3D " \

              http://bugzilla.yoctoproject.org/report.cgi"



 SANITY_TESTED_DISTROS ?=3D " \

-            Poky-1.4 \n \

-            Poky-1.5 \n \

             Poky-1.6 \n \

             Poky-1.7 \n \

             Ubuntu-12.04 \n \

-            Ubuntu-13.10 \n \

             Ubuntu-14.04 \n \

-            Fedora-19 \n \

             Fedora-20 \n \

-            CentOS-6.4 \n \

             CentOS-6.5 \n \

-            Debian-7.0 \n \

-            Debian-7.1 \n \

-            Debian-7.2 \n \

-            Debian-7.3 \n \

-            Debian-7.4 \n \

-            Debian-7.5 \n \

-            Debian-7.6 \n \

-            SUSE-LINUX-12.2 \n \

+            Debian-7.* \n \

             openSUSE-project-12.3 \n \

             openSUSE-project-13.1 \n \

             "

--

1.9.1


--_000_042E875E1B5D414CA9BB78B7D4FA691C13CE6FEEIRSMSX102gercor_
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri","sans-serif";}
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
<p class=3D"MsoPlainText">Removed Poky-1.4, Poky-1.5, Ubuntu-13.10, Fedora-=
19, CentOs-6.4,Suse-LINUX-12.2. Replaced the list of Debian-7.x with wildca=
rd.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Signed-off-by: Lucian Musat &lt;<a href=3D"mailto=
:george.l.musat@intel.com">george.l.musat@intel.com</a>&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">---<o:p></o:p></p>
<p class=3D"MsoPlainText">meta-yocto/conf/distro/poky.conf | 14 &#43;------=
-------<o:p></o:p></p>
<p class=3D"MsoPlainText">1 file changed, 1 insertion(&#43;), 13 deletions(=
-)<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">diff --git a/meta-yocto/conf/distro/poky.conf b/m=
eta-yocto/conf/distro/poky.conf<o:p></o:p></p>
<p class=3D"MsoPlainText">index eaf06d3..295895f 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">--- a/meta-yocto/conf/distro/poky.conf<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&#43;&#43;&#43; b/meta-yocto/conf/distro/poky.con=
f<o:p></o:p></p>
<p class=3D"MsoPlainText">@@ -73,25 &#43;73,13 @@ CONNECTIVITY_CHECK_URIS ?=
=3D &quot; \<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"http://bugzilla.yoctoproject.org/r=
eport.cgi">
http://bugzilla.yoctoproject.org/report.cgi</a>&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&nbsp;SANITY_TESTED_DISTROS ?=3D &quot; \<o:p></o=
:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; Poky-1.4 \n \<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; Poky-1.5 \n \<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; Poky-1.6 \n \<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; Poky-1.7 \n \<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; Ubuntu-12.04 \n \<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; Ubuntu-13.10 \n \<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; Ubuntu-14.04 \n \<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; Fedora-19 \n \<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; Fedora-20 \n \<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; CentOS-6.4 \n \<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; CentOS-6.5 \n \<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; Debian-7.0 \n \<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; Debian-7.1 \n \<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; Debian-7.2 \n \<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; Debian-7.3 \n \<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; Debian-7.4 \n \<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; Debian-7.5 \n \<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; Debian-7.6 \n \<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; SUSE-LINUX-12.2 \n \<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; Debian-7.* \n \<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; openSUSE-project-12.3 \n \<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; openSUSE-project-13.1 \n \<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">-- <o:p></o:p></p>
<p class=3D"MsoPlainText">1.9.1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_042E875E1B5D414CA9BB78B7D4FA691C13CE6FEEIRSMSX102gercor_--
