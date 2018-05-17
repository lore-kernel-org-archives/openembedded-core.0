Return-Path: <Vignesh.Rajendran@in.bosch.com>
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
	by mail.openembedded.org (Postfix) with ESMTP id 1EB5860402
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 05:55:23 +0000 (UTC)
Received: from si0vm1947.rbesz01.com (unknown [139.15.230.188])
	by si0vms0216.rbdmz01.com (Postfix) with ESMTPS id 40mgWb6BrGz1XLH5S
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 07:55:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
	s=2015-01-21; t=1526536523;
	bh=bbX22arBcWcpCirZVXZaVZjeRweTwPze+jCz0NMT/HQ=; l=10;
	h=From:From:Reply-To:Sender;
	b=LxbQ8vWUhvp/3wbyD4A5Vk4J953UXjKUKF5ocelQAC5OCOQKn3GG7VNFQuh3xGFJx
	gb98PFaBq8TpJ7XNwW7u5EJYV4JVovtBn8QIJ/cmZ6K4FpcaUTXDwv6ymXodBmjRVt
	4cU+c6bZ3SriIW/LaqJAlXsFGKD6tgLy1deCP3B8=
Received: from si0vm2082.rbesz01.com (unknown [10.58.172.176])
	by si0vm1947.rbesz01.com (Postfix) with ESMTP id 40mgWb5sd9z6CjQSM
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 07:55:23 +0200 (CEST)
X-AuditID: 0a3aad16-be7ff70000000413-e1-5afd1949c5b2
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
	(using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by si0vm2082.rbesz01.com (SMG Outbound) with SMTP id
	F8.44.01043.9491DFA5; Thu, 17 May 2018 07:55:21 +0200 (CEST)
Received: from FE-MBX2038.de.bosch.com (fe-mbx2038.de.bosch.com [10.3.231.48])
	by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 40mgWb3pj8zBpBW
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 07:55:23 +0200 (CEST)
Received: from SGPMBX2018.APAC.bosch.com (10.187.83.36) by
	FE-MBX2038.de.bosch.com (10.3.231.48) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1466.3; Thu, 17 May 2018 07:55:22 +0200
Received: from SGPMBX2020.APAC.bosch.com (10.187.83.43) by
	SGPMBX2018.APAC.bosch.com (10.187.83.36) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1466.3; Thu, 17 May 2018 13:55:20 +0800
Received: from SGPMBX2020.APAC.bosch.com ([fe80::b526:b737:7eb9:3a96]) by
	SGPMBX2020.APAC.bosch.com ([fe80::b526:b737:7eb9:3a96%6]) with mapi id
	15.01.1466.003; Thu, 17 May 2018 13:55:20 +0800
From: "Vignesh Rajendran (RBEI/ECF3)" <Vignesh.Rajendran@in.bosch.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] package.bbclass: provide debug sources in
	externalsrc -dbg packages
Thread-Index: AQHT7aL1NBdDeQv1gUOwAbts2z5YlqQzarAg
Date: Thu, 17 May 2018 05:55:20 +0000
Message-ID: <e96bbd22524e41818b17e50de126492d@in.bosch.com>
References: <1526536200-26106-1-git-send-email-vignesh.rajendran@in.bosch.com>
In-Reply-To: <1526536200-26106-1-git-send-email-vignesh.rajendran@in.bosch.com>
Accept-Language: en-US, en-SG
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.56.218]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA21Te0xbdRTm19vHbcMdl1vaHjq6aBPjohmDurllQ7LoYvQfxz9mo5poWa+0
	rg/sLWTMF7pIpMBUYIx1DTAoSwNoMnyxaSZ2EzfGClJcH0PjQt2rU2plCPKYvdyy9g//OfnO
	953vnPM7NxfHqEu4Ejda7LTNojOphRK+ZMenqk3P5y5rCwJjRdunFv4U7ULP+U57UAnSSor0
	tMlYRds2F78qMXj8Pqxi7D108F40LqpBp95wIDEO5Bb4o+tHoQNJcIps48HJnxsxLoki6L57
	W8AlMQS1I+6k8jeC2LkbfC65gCDaPYrYZkLyWehreZ/H4hzyJehpOy5yIBzHyN0QXt7I0lJy
	P5xp/QBxJXqoOzKXLNeAf/b3VcwnH4F4UwBjMUHuhLlj91d5inwBej8fErJYTO6B8GWvgMWI
	VEFXqInPYoxUQDjSwePeRoL72zGMwzK4Pb0i4PDDcD40hLj6MmhvvoW4Wdlw6XiE/zFSONNa
	OdPKnGllHJ8PwaMtQg4/DqdORjEOb4K2FS8/ne9Eol4kY4wFVWZNwXZNvq2MZg4VFObvt5oH
	EPcl5YPo8Pd6LyJxpM4kHpUvaymBroqpNnvRVpynlhFHVha11Loyq77aoGMMr9gqTTSjVhIo
	IyODkj6gmcoys5FhjFaLFwGOqXOILbNLWorQ66oP0TYrZ/Oi9ThfrSAiu2JaiizX2ekDNF1B
	29bUnTiuBuJJSOyQbaPL6YOvGU32NVmt4mbK05X0sTxc7EVP4JmJ2c1sC4Kp0JkZY3nSnsvZ
	qTU2ZR1BL+J3axsaMNw705KIvtU47G9twCi+xWqhlQpCyHYkWa+h0vJgJ2UesVmREGRpQqrv
	HRRCiatKCZo1ZyZ+odQ2QAxKXaVUdpJMmTQ9CQ95ZR24RgMI2gfvIZiYrcdgfPI6H67NXRDA
	Z7UTApg46xTB5OK0CDydNWKYHzosBsdCnRg80fuZ0PXLvwRc/SieBV9NukkYXF7IBveJExQ0
	1PVJYcY1ngPz8VEZ/HqjVg5O/4gc2vunAJocH+ZCf+yoEr78py8Plr74Og+CZ86q4Jrvpgr6
	XfUbINyZCPPulQ13EqfmJU6NhhbZU9t19v85dZJNvU5Zgx4qfd0+oO/w/xUUmbcei4Zufjf5
	dl7bu7891R2+3kvs1rtCe/y+rNiolsf4a4ozpm81Xl3PxAH1Nj+j/KE08JYpeGBf/ba9hQ0d
	geC2pweK7XBl6eLFrJLIudDGEtnld6ZOD6tnbOMvNzblykQ9e/E3v/nJ4PlEBMOt+4o053dE
	1HzGoCt8DLMxuv8ABAo/iNwEAAA=
Subject: Re: [meta-oe][PATCH] package.bbclass: provide debug sources in externalsrc -dbg packages
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
X-List-Received-Date: Thu, 17 May 2018 05:55:24 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_e96bbd22524e41818b17e50de126492dinboschcom_"

--_000_e96bbd22524e41818b17e50de126492dinboschcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi OE-Core members,



As per the wiki notes,  This is a reminder and re-submission again the same=
 patch posted some weeks before.



https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

If your patch has not had any feedback after a few days it may have been mi=
ssed or the appropriate reviewers may not currently be around; it is perfec=
tly fine to reply to it yourself with a "ping" / reminder request for feedb=
ack. NOTE: patch review for feature / recipe upgrade patches will likely be=
 delayed during a feature freeze because these types of patches aren't merg=
ed during this time - you may have to wait until after the freeze is lifted=
.



I have noted that the patch not available in master and may have been misse=
d.



Mit freundlichen Gr=FC=DFen / Best regards



Rajendran Vignesh

RBEI/ECF33



Tel. +91 422 67-65103







-----Original Message-----
From: Vignesh Rajendran (RBEI/ECF3)
Sent: Thursday, May 17, 2018 11:20 AM
To: openembedded-core@lists.openembedded.org
Cc: Vignesh Rajendran (RBEI/ECF3) <Vignesh.Rajendran@in.bosch.com>
Subject: [meta-oe][PATCH] package.bbclass: provide debug sources in externa=
lsrc -dbg packages



The recipes which are using externalsrc method doesn't contain the

debug sources in their -dbg packages.



Add a handling in copydebugsources function to copy the debugsources for

externalsrc -dbg packages.



Signed-off-by: Vignesh Rajendran <vignesh.rajendran@in.bosch.com<mailto:vig=
nesh.rajendran@in.bosch.com>>

---

meta/classes/externalsrc.bbclass |  3 +++

meta/classes/package.bbclass     | 12 ++++++++++--

2 files changed, 13 insertions(+), 2 deletions(-)



diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bb=
class

index c9f5cf7..135670d 100644

--- a/meta/classes/externalsrc.bbclass

+++ b/meta/classes/externalsrc.bbclass

@@ -129,6 +129,9 @@ python () {

             d.setVar('CONFIGURESTAMPFILE', configstamp)

             d.setVar('STAMP', '${STAMPS_DIR}/work-shared/${PN}/${EXTENDPE}=
${PV}-${PR}')

             d.setVar('STAMPCLEAN', '${STAMPS_DIR}/work-shared/${PN}/*-*')

+

+             # set DEBUG_PREFIX_MAP to external source path

+             d.appendVar("DEBUG_PREFIX_MAP", "-fdebug-prefix-map=3D${EXTER=
NALSRC}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}")

}

 python externalsrc_configure_prefunc() {

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass

index edeffa9..f071a2e 100644

--- a/meta/classes/package.bbclass

+++ b/meta/classes/package.bbclass

@@ -420,6 +420,7 @@ def copydebugsources(debugsrcdir, d):

         workdir =3D d.getVar("WORKDIR")

         workparentdir =3D os.path.dirname(os.path.dirname(workdir))

         workbasedir =3D os.path.basename(os.path.dirname(workdir)) + "/" +=
 os.path.basename(workdir)

+        externalsrc =3D d.getVar('EXTERNALSRC', True)

         # If build path exists in sourcefile, it means toolchain did not u=
se

         # -fdebug-prefix-map to compile

@@ -444,9 +445,16 @@ def copydebugsources(debugsrcdir, d):

         processdebugsrc +=3D "fgrep -zw '%s' | "

         # Remove prefix in the source paths

         processdebugsrc +=3D "sed 's#%s##g' | "

-        processdebugsrc +=3D "(cd '%s' ; cpio -pd0mlL --no-preserve-owner =
'%s%s' 2>/dev/null)"

+        # handle external sources to provide sources in -dbg packages

+        if externalsrc:

+            localsrc_prefix =3D "/usr/src/debug/"

+            processdebugsrc +=3D "sed 's#%s/##g' | "

+            processdebugsrc +=3D "(cd '%s' ; cpio -pd0mlL --no-preserve-ow=
ner '%s%s/%s' 2>/dev/null)"

+            cmd =3D processdebugsrc % (sourcefile, workbasedir, localsrc_p=
refix, workbasedir, externalsrc, dvar, debugsrcdir, workbasedir)

+        else:

+            processdebugsrc +=3D "(cd '%s' ; cpio -pd0mlL --no-preserve-ow=
ner '%s%s' 2>/dev/null)"

+            cmd =3D processdebugsrc % (sourcefile, workbasedir, localsrc_p=
refix, workparentdir, dvar, debugsrcdir)

-        cmd =3D processdebugsrc % (sourcefile, workbasedir, localsrc_prefi=
x, workparentdir, dvar, debugsrcdir)

         (retval, output) =3D oe.utils.getstatusoutput(cmd)

         # Can "fail" if internal headers/transient sources are attempted

         #if retval:

--

2.7.4



--_000_e96bbd22524e41818b17e50de126492dinboschcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText">Hi OE-Core members,<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">As per the wiki notes, &nbsp;This is a reminder a=
nd re-submission again the same patch posted some weeks before.<o:p></o:p><=
/p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-left:solid win=
dowtext 1.0pt;padding:0in 0in 0in 4.0pt">
<p class=3D"MsoPlainText" style=3D"border:none;padding:0in"><a href=3D"http=
s://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded">https:=
//www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded</a> &nbsp=
;<o:p></o:p></p>
<p class=3D"MsoPlainText" style=3D"border:none;padding:0in">If your patch h=
as not had any feedback after a few days it may have been missed or the app=
ropriate reviewers may not currently be around; it is perfectly fine to rep=
ly to it yourself with a &quot;ping&quot; / reminder
 request for feedback. NOTE: patch review for feature / recipe upgrade patc=
hes will likely be delayed during a feature freeze because these types of p=
atches aren't merged during this time - you may have to wait until after th=
e freeze is lifted.<o:p></o:p></p>
</div>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">I have noted that the patch not available in mast=
er and may have been missed.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Mit freundlichen Gr=FC=DFen / Best regards<o:p></=
o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Rajendran Vignesh<o:p></o:p></p>
<p class=3D"MsoPlainText">RBEI/ECF33&nbsp; <o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Tel. &#43;91 422 67-65103 <o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">-----Original Message-----<br>
From: Vignesh Rajendran (RBEI/ECF3) <br>
Sent: Thursday, May 17, 2018 11:20 AM<br>
To: openembedded-core@lists.openembedded.org<br>
Cc: Vignesh Rajendran (RBEI/ECF3) &lt;Vignesh.Rajendran@in.bosch.com&gt;<br=
>
Subject: [meta-oe][PATCH] package.bbclass: provide debug sources in externa=
lsrc -dbg packages</p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">The recipes which are using externalsrc method do=
esn't contain the<o:p></o:p></p>
<p class=3D"MsoPlainText">debug sources in their -dbg packages.<o:p></o:p><=
/p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Add a handling in copydebugsources function to co=
py the debugsources for<o:p></o:p></p>
<p class=3D"MsoPlainText">externalsrc -dbg packages.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Signed-off-by: Vignesh Rajendran &lt;<a href=3D"m=
ailto:vignesh.rajendran@in.bosch.com"><span style=3D"color:windowtext;text-=
decoration:none">vignesh.rajendran@in.bosch.com</span></a>&gt;<o:p></o:p></=
p>
<p class=3D"MsoPlainText">---<o:p></o:p></p>
<p class=3D"MsoPlainText">meta/classes/externalsrc.bbclass |&nbsp; 3 &#43;&=
#43;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">meta/classes/package.bbclass&nbsp;&nbsp;&nbsp;&nb=
sp; | 12 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--<o:p></o:p></p=
>
<p class=3D"MsoPlainText">2 files changed, 13 insertions(&#43;), 2 deletion=
s(-)<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">diff --git a/meta/classes/externalsrc.bbclass b/m=
eta/classes/externalsrc.bbclass<o:p></o:p></p>
<p class=3D"MsoPlainText">index c9f5cf7..135670d 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">--- a/meta/classes/externalsrc.bbclass<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&#43;&#43;&#43; b/meta/classes/externalsrc.bbclas=
s<o:p></o:p></p>
<p class=3D"MsoPlainText">@@ -129,6 &#43;129,9 @@ python () {<o:p></o:p></p=
>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; d.setVar('CONFIGURESTAMPFILE', configstamp)<o:p></o=
:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; d.setVar('STAMP', '${STAMPS_DIR}/work-shared/${PN}/=
${EXTENDPE}${PV}-${PR}')<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; d.setVar('STAMPCLEAN', '${STAMPS_DIR}/work-shared/$=
{PN}/*-*')<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; # set DEBUG_PREFIX_MAP to external source path=
<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; d.appendVar(&quot;DEBUG_PREFIX_MAP&quot;, &quo=
t;-fdebug-prefix-map=3D${EXTERNALSRC}=3D/usr/src/debug/${PN}/${EXTENDPE}${P=
V}-${PR}&quot;)<o:p></o:p></p>
<p class=3D"MsoPlainText">}<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;python externalsrc_configure_prefunc() {<o:=
p></o:p></p>
<p class=3D"MsoPlainText">diff --git a/meta/classes/package.bbclass b/meta/=
classes/package.bbclass<o:p></o:p></p>
<p class=3D"MsoPlainText">index edeffa9..f071a2e 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">--- a/meta/classes/package.bbclass<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&#43;&#43; b/meta/classes/package.bbclass<o:=
p></o:p></p>
<p class=3D"MsoPlainText">@@ -420,6 &#43;420,7 @@ def copydebugsources(debu=
gsrcdir, d):<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
workdir =3D d.getVar(&quot;WORKDIR&quot;)<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
workparentdir =3D os.path.dirname(os.path.dirname(workdir))<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
workbasedir =3D os.path.basename(os.path.dirname(workdir)) &#43; &quot;/&qu=
ot; &#43; os.path.basename(workdir)<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e=
xternalsrc =3D d.getVar('EXTERNALSRC', True)<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;# If build path exists in sourcefile, it means toolchain did not use<o=
:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
# -fdebug-prefix-map to compile<o:p></o:p></p>
<p class=3D"MsoPlainText">@@ -444,9 &#43;445,16 @@ def copydebugsources(deb=
ugsrcdir, d):<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
processdebugsrc &#43;=3D &quot;fgrep -zw '%s' | &quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
# Remove prefix in the source paths<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
processdebugsrc &#43;=3D &quot;sed 's#%s##g' | &quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; proce=
ssdebugsrc &#43;=3D &quot;(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s=
' 2&gt;/dev/null)&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #=
 handle external sources to provide sources in -dbg packages<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f externalsrc:<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; localsrc_prefix =3D &quot;/usr/src/debug/&quot;<o:p>=
</o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; processdebugsrc &#43;=3D &quot;sed 's#%s/##g' | &quo=
t;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; processdebugsrc &#43;=3D &quot;(cd '%s' ; cpio -pd0m=
lL --no-preserve-owner '%s%s/%s' 2&gt;/dev/null)&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; cmd =3D processdebugsrc % (sourcefile, workbasedir, =
localsrc_prefix, workbasedir, externalsrc, dvar, debugsrcdir, workbasedir)<=
o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e=
lse:<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; processdebugsrc &#43;=3D &quot;(cd '%s' ; cpio -pd0m=
lL --no-preserve-owner '%s%s' 2&gt;/dev/null)&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; cmd =3D processdebugsrc % (sourcefile, workbasedir, =
localsrc_prefix, workparentdir, dvar, debugsrcdir)<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p></o:p></p>
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cmd =
=3D processdebugsrc % (sourcefile, workbasedir, localsrc_prefix, workparent=
dir, dvar, debugsrcdir)<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
(retval, output) =3D oe.utils.getstatusoutput(cmd)<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
# Can &quot;fail&quot; if internal headers/transient sources are attempted<=
o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
#if retval:<o:p></o:p></p>
<p class=3D"MsoPlainText">-- <o:p></o:p></p>
<p class=3D"MsoPlainText">2.7.4<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_e96bbd22524e41818b17e50de126492dinboschcom_--
