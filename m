Return-Path: <Vignesh.Rajendran@in.bosch.com>
Received: from de-deferred2.bosch-org.com (de-deferred2.bosch-org.com
	[139.15.180.217])
	by mail.openembedded.org (Postfix) with ESMTP id 6564C60800
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 12:11:25 +0000 (UTC)
Received: from de-out1.bosch-org.com (unknown [139.15.180.215])
	by fe0vms0193.rbdmz01.com (Postfix) with ESMTPS id 40mCvy1qfLz1lh
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 14:11:26 +0200 (CEST)
Received: from si0vm1948.rbesz01.com (unknown [139.15.230.188])
	by si0vms0216.rbdmz01.com (Postfix) with ESMTPS id 40mCvq1NVxz1XLGGQ
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 14:11:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
	s=2015-01-21; t=1526472679;
	bh=U33/JuKheQoQjFasHgNVl9kQ4iC9nnevwHVqX+M2ue0=; l=10;
	h=From:From:Reply-To:Sender;
	b=CWUg0jV/LMkaFWppT/wU681/gzT8lSknYNGm757JURH00ri54MiVb3pY2gu8jbIH7
	2JIO/y13DbyG1q9Cz5KOsVjO1+FpbOL/UTHl/vm7/jDLccnOPsd4N/1bpj1Cja0nvU
	PqK9TAICpIjVXeEYdlUMUkjqHbMWxSpnyGXKcRew=
Received: from si0vm2082.rbesz01.com (unknown [10.58.172.176])
	by si0vm1948.rbesz01.com (Postfix) with ESMTP id 40mCvq10lSz1Tb
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 14:11:19 +0200 (CEST)
X-AuditID: 0a3aad16-bcfff70000000413-ca-5afc1fe54ddf
Received: from fe0vm1651.rbesz01.com ( [10.58.173.29])
	(using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by si0vm2082.rbesz01.com (SMG Outbound) with SMTP id
	C6.D6.01043.5EF1CFA5; Wed, 16 May 2018 14:11:17 +0200 (CEST)
Received: from FE-MBX2022.de.bosch.com (fe-mbx2022.de.bosch.com [10.3.231.32])
	by fe0vm1651.rbesz01.com (Postfix) with ESMTPS id 40mCvp5jL4zFNDX
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 14:11:18 +0200 (CEST)
Received: from SGPMBX2020.APAC.bosch.com (10.187.83.43) by
	FE-MBX2022.de.bosch.com (10.3.231.32) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1466.3; Wed, 16 May 2018 14:11:18 +0200
Received: from SGPMBX2020.APAC.bosch.com (10.187.83.43) by
	SGPMBX2020.APAC.bosch.com (10.187.83.43) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.1.1466.3; Wed, 16 May 2018 20:11:15 +0800
Received: from SGPMBX2020.APAC.bosch.com ([fe80::b526:b737:7eb9:3a96]) by
	SGPMBX2020.APAC.bosch.com ([fe80::b526:b737:7eb9:3a96%6]) with mapi id
	15.01.1466.003; Wed, 16 May 2018 20:11:15 +0800
From: "Vignesh Rajendran (RBEI/ECF3)" <Vignesh.Rajendran@in.bosch.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [meta-oe][PATCH] package.bbclass: provide debug sources in
	externalsrc -dbg packages
Thread-Index: AQHT5cdt/86lspL9BUq08fp0SPXhK6QyT4Bw
Date: Wed, 16 May 2018 12:11:15 +0000
Message-ID: <44ef14450ded42d4a6d74278de3ca3ad@in.bosch.com>
References: <1525672255-24026-1-git-send-email-vignesh.rajendran@in.bosch.com>
In-Reply-To: <1525672255-24026-1-git-send-email-vignesh.rajendran@in.bosch.com>
Accept-Language: en-US, en-SG
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.56.218]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA21TbUxbZRTmbW/b28o1t7e0HOqKoXFb3AKUismUaRZjlv0w6I/pshqDZb3S
	RtpibyFAjKni6trVTZpCWOnYh8URYX7MDdmCoVZER5ANhmHdxtQUpoMpbJOPssG87S1rf/jn
	5LnPeZ5zzntOLs6nenElbrLYaZtFX6kWSjDJsydV+VOP39dpHA/kW67F/hFtQzuGv+5AryCd
	ZKuBrjTV0LbC59+UGP+69StWFXKjWt+iV+RAv9W6kRgHshic/VGRG0lwimzhwcjPbaJ4giJn
	EKyekXKJOQSz0R8x7uMugqjz26SlH8Gi9yNB3CIkt0On7wNeHGeRr0N7y6FEKRm5B84270Uc
	bwDXgYWkRgvdU/sSGCPXw4npCBbHBFkCU64PWT3ONiiFpcBLcVpMvgyhg1eFcYxIFRyPeBNy
	PpkNVyaP8LjnkBDsvcDnsBxuRlcFHM6DHyIhxOnLITZxX8i1ksL5Q5PYJ0jhTyvlT5P502Qc
	XwCXm3xCDm+Gz47N8DmcDy2rYSydP4pEnyM5Y9LUmLWaLdoCWznN1GuKCvZYzacQdzxFD2r4
	3hBGJI7UmUQBe0hKoK9h6sxh9DTOU8uJA6v3dNSj5VZDnVHPGMts1ZU0o1YSKCMjg5I9pJnq
	crOJYUxWSxgBzldnESaC9REGfV09bbNytjB6DMfU2cTktjkdRVbo7fTbNF1F29ayJTiuBsKf
	y84gtdEVdO1bpkr7Wlqt4noq0jPpbXm4OIyewjPZ3okSBFOlNzOmiqQ9h7NTa2zKOohexW85
	PR4+Hp71sXE4EQcuNXv4FGaxWmhlNrEpvhgy7jVWWx7OpFxHbFTGdJQ8LZGqO40iiN2qjBiI
	j5PJ/jWpaYDokQV2U9IkmTJp21kP2S2DwNA4graeeQSj/+7ng2v5Uz5cHPsDg6sL/QL4wjkq
	AO/8n0IYPecXwdi9qAg6jjrEsBRqEIM75hJD4Njfj0DHzINMOD6xTED3WJCEu+39UuhZiUkh
	2NpKgcfVKWPF57NgNnAxC5bOjbPhzpAcrt9wKsB/aVAB88HWbGjrugbgde/Lga65JiWcWexc
	N82umseuGoXiZ2bsevv/rDrJpl6ndKAv399wO9K8uyxns3RlZ9/J0+YnLnz3+2ujK8YjTady
	u0+XDi+fDajKntvRdcf3jGPkuq5wosjnKK737L9p3l7Y8CL27tAbL/yChSZ2/bT3q0ZN7s6D
	JcFlf/76d/K+6X3PmTdyo8RuE23oi4w3lh6+clu1MLC1sXhQ27AxHOpTFT95+WNQY4xRX7SJ
	b2P0/wG6DPClzwQAAA==
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
X-List-Received-Date: Wed, 16 May 2018 12:11:27 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_44ef14450ded42d4a6d74278de3ca3adinboschcom_"

--_000_44ef14450ded42d4a6d74278de3ca3adinboschcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello OE-Core Members,



As I am new to the patch submission, anyone can explain how long this proce=
ss will take for acceptance in master/next release?

After several days of waiting by watching OE-mailing thread for any reply f=
or the patch, Now I had a feeling like the patch may have been missed.



From the below reference, I am just giving a ping back to the community.



https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

If your patch has not had any feedback after a few days it may have been mi=
ssed or the appropriate reviewers may not currently be around; it is perfec=
tly fine to reply to it yourself with a "ping" / reminder request for feedb=
ack. NOTE: patch review for feature / recipe upgrade patches will likely be=
 delayed during a feature freeze because these types of patches aren't merg=
ed during this time - you may have to wait until after the freeze is lifted=
.



Any feedback/acceptance will be highly appreciated.



Mit freundlichen Gr=FC=DFen / Best regards



Rajendran Vignesh

RBEI/ECF33



Tel. +91 422 67-65103







-----Original Message-----
From: Vignesh Rajendran (RBEI/ECF3)
Sent: Monday, May 07, 2018 11:21 AM
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

meta/classes/package.bbclass     | 14 +++++++++++---

2 files changed, 14 insertions(+), 3 deletions(-)



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

index edeffa9..2c4472d 100644

--- a/meta/classes/package.bbclass

+++ b/meta/classes/package.bbclass

@@ -420,6 +420,7 @@ def copydebugsources(debugsrcdir, d):

         workdir =3D d.getVar("WORKDIR")

         workparentdir =3D os.path.dirname(os.path.dirname(workdir))

         workbasedir =3D os.path.basename(os.path.dirname(workdir)) + "/" +=
 os.path.basename(workdir)

+             externalsrc =3D d.getVar('EXTERNALSRC', True)

         # If build path exists in sourcefile, it means toolchain did not u=
se

         # -fdebug-prefix-map to compile

@@ -444,10 +445,17 @@ def copydebugsources(debugsrcdir, d):

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

-        (retval, output) =3D oe.utils.getstatusoutput(cmd)

+             (retval, output) =3D oe.utils.getstatusoutput(cmd)

         # Can "fail" if internal headers/transient sources are attempted

         #if retval:

         #    bb.fatal("debug source copy failed with exit code %s (cmd was=
 %s)" % (retval, cmd))

--

2.7.4



--_000_44ef14450ded42d4a6d74278de3ca3adinboschcom_
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
<p class=3D"MsoPlainText">Hello OE-Core Members,<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">As I am new to the patch submission, anyone can e=
xplain how long this process will take for acceptance in master/next releas=
e?<o:p></o:p></p>
<p class=3D"MsoPlainText">After several days of waiting by watching OE-mail=
ing thread for any reply for the patch, Now I had a feeling like the patch =
may have been missed.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">From the below reference, I am just giving a ping=
 back to the community.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><a href=3D"https://www.openembedded.org/wiki/How_=
to_submit_a_patch_to_OpenEmbedded">https://www.openembedded.org/wiki/How_to=
_submit_a_patch_to_OpenEmbedded</a>
<o:p></o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-left:solid win=
dowtext 1.0pt;padding:0in 0in 0in 4.0pt">
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
<p class=3D"MsoPlainText">Any feedback/acceptance will be highly appreciate=
d. <o:p>
</o:p></p>
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
Sent: Monday, May 07, 2018 11:21 AM<br>
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
sp; | 14 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;---<o:p></o=
:p></p>
<p class=3D"MsoPlainText">2 files changed, 14 insertions(&#43;), 3 deletion=
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
<p class=3D"MsoPlainText">index edeffa9..2c4472d 100644<o:p></o:p></p>
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
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; externalsrc =3D d.getVar('EXTERNALSRC', True)<=
o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;# If build path exists in sourcefile, it means toolchain did not use<o=
:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
# -fdebug-prefix-map to compile<o:p></o:p></p>
<p class=3D"MsoPlainText">@@ -444,10 &#43;445,17 @@ def copydebugsources(de=
bugsrcdir, d):<o:p></o:p></p>
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
<p class=3D"MsoPlainText">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (retv=
al, output) =3D oe.utils.getstatusoutput(cmd)<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; (retval, output) =3D oe.utils.getstatusoutput(=
cmd)<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
# Can &quot;fail&quot; if internal headers/transient sources are attempted<=
o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
#if retval:<o:p></o:p></p>
<p class=3D"MsoPlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
#&nbsp;&nbsp;&nbsp; bb.fatal(&quot;debug source copy failed with exit code =
%s (cmd was %s)&quot; % (retval, cmd))<o:p></o:p></p>
<p class=3D"MsoPlainText">-- <o:p></o:p></p>
<p class=3D"MsoPlainText">2.7.4<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_44ef14450ded42d4a6d74278de3ca3adinboschcom_--
