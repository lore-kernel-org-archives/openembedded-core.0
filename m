Return-Path: <michael.davis@essvote.com>
X-Greylist: delayed 900 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 08 Oct 2018 13:58:26 UTC
Received: from mail1.essvote.com (mail1.essvote.com [66.37.226.19])
	by mail.openembedded.org (Postfix) with ESMTP id 1AE78799B1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Oct 2018 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=essvote.com; s=omaha.092018;
	c=relaxed/relaxed; 
	q=dns/txt; i=@essvote.com; t=1539006207; x=1541598207;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=auSsKadGKILPzhKFUf8YgtFlEQ5crM7LkS2c3Dhygbw=;
	b=QzRksPnCfNHz0+s79hPdWZbW6kP7ywx7mJKVMxeVgvWTFUpb9L9WbQgXuw5ouWW3
	iIEhMKx+ioWvD5QZj6pltpAxLZdv4sX/BjMgQdnSQwkww6+kYgwgjpB+5joKJaTb
	7RbHkSLccM7rHQ3WG7L74VqCj1+/vytlX/3UvAub0fog+V9Ct7BRY4VJSq2WPIqX
	55LOOEB/Kd+q0W6uA+T5ytor7nCCC2Q2GZl0Yzejfa6KMtohehUDK4z8zsH+3vKr
	Jf5YGGgg/6QRkVCi+1yv4wJBH7DSJGXnWsFZhtXwOMrfXafrhkXWfYgfbHnpGh56
	NBM+aXJNODbvOdWnQluzxQ==;
X-AuditID: 0a000213-0fbff700000067f8-25-5bbb5efe4977
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by mail1.essvote.com (Symantec Messaging Gateway) with SMTP id
	7D.72.26616.EFE5BBB5; Mon,  8 Oct 2018 08:43:27 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([fe80::b1d4:5b04:bc85:956e]) by
	ESS-EX01.essvote.corp.local ([fe80::b1d4:5b04:bc85:956e%16]) with mapi
	id 14.03.0301.000; Mon, 8 Oct 2018 08:43:26 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] Support for changing the imager used in wic.
Thread-Index: AdRfDOMfZNJ5lI+RR+6vWw46bhcPjg==
Date: Mon, 8 Oct 2018 13:43:25 +0000
Message-ID: <655290B7709079438B7932553958E60DA15843CA@ESS-EX01.essvote.corp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.33]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJLMWRmVeSWpSXmKPExsWyRiBPQ/d/3O5og8Z5PBZ3fr5jd2D0OLdx
	BWMAYxSXTUpqTmZZapG+XQJXxrfdnxkL7nhV9E0/ztrA2OfUxcjJISFgItHfeZ+5i5GLQ0jg
	BKPElMMrmUASYM765QEgNpuAkcS565sYQWwRgWiJpTNmsoPYwgJuEhsfHmCCiHtL/Fr3AKiG
	A8jWk7i6yxfEZBFQkVj1OQ2kglcgSGJm+01mEJtRQEzi+6k1YJ3MAuISt57MZ4I4R0BiyZ7z
	zBC2qMTLx/9YQcZICMhJHL4VCVGeL3F++XsWiJGCEidnPmGZwCg4C8mkWUjKZiEpg4jrSCzY
	/YkNwtaWWLbwNTOMfebAYyZk8QWM7KsYBXMTM3MM9VKLi8vyS1L1kvNzNzECg52LgUl4B+OC
	GbGHGAU4GJV4eA8H7o4WYk0sK67MPcQozcGiJM67vWtztJBAemJJanZqakFqUXxRaU5q8SFG
	Jg5OEMEl1cA4wdFWtT38w30BtRl86rnTdjUqf2WoKT4ZPOmN+D7lmw/OXG+/pFAuVZf1WCfR
	vJApZtpK5z2ztj5273H+7RtYo9gtuP/eaknTeveSAytrFr+u0dKuOXVr52e5f6IlTlk+1zpm
	Mv9//1tuVpKB+cNrJg/aixVOfT2z3ipYeemCBO/KWI7HOk5KLMUZiYZazEXFiQAjhPByXAIA
	AA==
Subject: [PATCH] Support for changing the imager used in wic.
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
X-List-Received-Date: Mon, 08 Oct 2018 13:58:27 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_655290B7709079438B7932553958E60DA15843CAESSEX01essvotec_"

--_000_655290B7709079438B7932553958E60DA15843CAESSEX01essvotec_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From 136d6214b6fc2c1118dac5b7f3e029ed006fab8a Mon Sep 17 00:00:00 2001

From: Paul Knopf <pauldotknopf at gmail.com<https://lists.yoctoproject.org/=
listinfo/yocto>>

Date: Mon, 21 May 2018 16:56:51 -0400

Subject: [PATCH] Support for changing the imager used in wic.



---

 scripts/lib/wic/engine.py | 2 +-

 scripts/wic               | 1 +

 2 files changed, 2 insertions(+), 1 deletion(-)



diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py

index edcfab3..d7c5c11 100644

--- a/scripts/lib/wic/engine.py

+++ b/scripts/lib/wic/engine.py

@@ -191,7 +191,7 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir,

kernel_dir,

     if not os.path.exists(options.outdir):

         os.makedirs(options.outdir)



-    pname =3D 'direct'

+    pname =3D options.imager

     plugin_class =3D PluginMgr.get_plugins('imager').get(pname)

     if not plugin_class:

         raise WicError('Unknown plugin: %s' % pname)

diff --git a/scripts/wic b/scripts/wic

index 7392bc4..255e524 100755

--- a/scripts/wic

+++ b/scripts/wic

@@ -360,6 +360,7 @@ def wic_init_parser_create(subparser):

     subparser.add_argument("-v", "--vars", dest=3D'vars_dir',

                       help=3D"directory with <image>.env files that store =
"

                            "bitbake variables")

+    subparser.add_argument("-i", "--imager", dest=3D"imager",

default=3D"direct", help=3D"the wic imager plugin")

     subparser.add_argument("-D", "--debug", dest=3D"debug",

action=3D"store_true",

                       default=3DFalse, help=3D"output debug information")

     return

--

2.7.4


I found this patch that got sent to the yocto mailing list, but never made =
it to the correct mailing list.
I would really like to have the functionality if it is possible to get it p=
ulled in.


--_000_655290B7709079438B7932553958E60DA15843CAESSEX01essvotec_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
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
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
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
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<pre><span style=3D"color:black">&gt;<i>From 136d6214b6fc2c1118dac5b7f3e029=
ed006fab8a Mon Sep 17 00:00:00 2001<o:p></o:p></i></span></pre>
<pre><span style=3D"color:black">From: Paul Knopf &lt;<a href=3D"https://li=
sts.yoctoproject.org/listinfo/yocto">pauldotknopf at gmail.com</a>&gt;<o:p>=
</o:p></span></pre>
<pre><span style=3D"color:black">Date: Mon, 21 May 2018 16:56:51 -0400<o:p>=
</o:p></span></pre>
<pre><span style=3D"color:black">Subject: [PATCH] Support for changing the =
imager used in wic.<o:p></o:p></span></pre>
<pre><span style=3D"color:black"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"color:black">---<o:p></o:p></span></pre>
<pre><span style=3D"color:black"> scripts/lib/wic/engine.py | 2 &#43;-<o:p>=
</o:p></span></pre>
<pre><span style=3D"color:black"> scripts/wic&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1 &#43;<o:p></o:p>=
</span></pre>
<pre><span style=3D"color:black"> 2 files changed, 2 insertions(&#43;), 1 d=
eletion(-)<o:p></o:p></span></pre>
<pre><span style=3D"color:black"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"color:black">diff --git a/scripts/lib/wic/engine.py b/s=
cripts/lib/wic/engine.py<o:p></o:p></span></pre>
<pre><span style=3D"color:black">index edcfab3..d7c5c11 100644<o:p></o:p></=
span></pre>
<pre><span style=3D"color:black">--- a/scripts/lib/wic/engine.py<o:p></o:p>=
</span></pre>
<pre><span style=3D"color:black">&#43;&#43;&#43; b/scripts/lib/wic/engine.p=
y<o:p></o:p></span></pre>
<pre><span style=3D"color:black">@@ -191,7 &#43;191,7 @@ def wic_create(wks=
_file, rootfs_dir, bootimg_dir,<o:p></o:p></span></pre>
<pre><span style=3D"color:black">kernel_dir,<o:p></o:p></span></pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp; if not os.path.ex=
ists(options.outdir):<o:p></o:p></span></pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; os.makedirs(options.outdir)<o:p></o:p></span></pre>
<pre><span style=3D"color:black"><o:p>&nbsp;</o:p></span></pre>
<pre><span style=3D"color:black">-&nbsp; &nbsp;&nbsp;pname =3D 'direct'<o:p=
></o:p></span></pre>
<pre><span style=3D"color:black">&#43;&nbsp;&nbsp;&nbsp; pname =3D options.=
imager<o:p></o:p></span></pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp; plugin_class =3D =
PluginMgr.get_plugins('imager').get(pname)<o:p></o:p></span></pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp; if not plugin_cla=
ss:<o:p></o:p></span></pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; raise WicError('Unknown plugin: %s' % pname)<o:p></o:p></span></pre>
<pre><span style=3D"color:black">diff --git a/scripts/wic b/scripts/wic<o:p=
></o:p></span></pre>
<pre><span style=3D"color:black">index 7392bc4..255e524 100755<o:p></o:p></=
span></pre>
<pre><span style=3D"color:black">--- a/scripts/wic<o:p></o:p></span></pre>
<pre><span style=3D"color:black">&#43;&#43;&#43; b/scripts/wic<o:p></o:p></=
span></pre>
<pre><span style=3D"color:black">@@ -360,6 &#43;360,7 @@ def wic_init_parse=
r_create(subparser):<o:p></o:p></span></pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp; subparser.add_arg=
ument(&quot;-v&quot;, &quot;--vars&quot;, dest=3D'vars_dir',<o:p></o:p></sp=
an></pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; help=3D&quot;directory with &lt;image&gt;.env files that st=
ore &quot;<o:p></o:p></span></pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;bitbake variables&quot;=
)<o:p></o:p></span></pre>
<pre><span style=3D"color:black">&#43;&nbsp;&nbsp;&nbsp; subparser.add_argu=
ment(&quot;-i&quot;, &quot;--imager&quot;, dest=3D&quot;imager&quot;,<o:p><=
/o:p></span></pre>
<pre><span style=3D"color:black">default=3D&quot;direct&quot;, help=3D&quot=
;the wic imager plugin&quot;)<o:p></o:p></span></pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp; subparser.add_arg=
ument(&quot;-D&quot;, &quot;--debug&quot;, dest=3D&quot;debug&quot;,<o:p></=
o:p></span></pre>
<pre><span style=3D"color:black">action=3D&quot;store_true&quot;,<o:p></o:p=
></span></pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; default=3DFalse, help=3D&quot;output debug information&quot=
;)<o:p></o:p></span></pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp; return<o:p></o:p>=
</span></pre>
<pre><span style=3D"color:black">-- <o:p></o:p></span></pre>
<pre><span style=3D"color:black">2.7.4<o:p></o:p></span></pre>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I found this patch that got sent to the yocto mailin=
g list, but never made it to the correct mailing list.<o:p></o:p></p>
<p class=3D"MsoNormal">I would really like to have the functionality if it =
is possible to get it pulled in.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_655290B7709079438B7932553958E60DA15843CAESSEX01essvotec_--
