Return-Path: <ola.x.nilsson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 426DE776C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 18:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 644722E138;
	Thu, 22 Dec 2016 19:11:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id gzZgd6ul-NIJ; Thu, 22 Dec 2016 19:11:16 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 61BBC2E314;
	Thu, 22 Dec 2016 19:11:16 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 230AE1E083;
	Thu, 22 Dec 2016 19:11:16 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E30E1E082;
	Thu, 22 Dec 2016 19:11:16 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu, 22 Dec 2016 19:11:16 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 02214359;
	Thu, 22 Dec 2016 19:11:16 +0100 (CET)
Received: from xbox11.axis.com (10.0.5.25) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 22 Dec 2016 19:11:16 +0100
Received: from XBOX01.axis.com (10.0.5.15) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 22 Dec 2016 19:11:15 +0100
Received: from XBOX01.axis.com ([fe80::9cb5:b14b:16f8:ddd6]) by
	XBOX01.axis.com ([fe80::9cb5:b14b:16f8:ddd6%22]) with mapi id
	15.00.1210.000; Thu, 22 Dec 2016 19:11:15 +0100
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Ola x Nilsson <olani@axis.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] externalsrc.bbclass: Add task buildclean
Thread-Index: AQHSXFdG+Gags1TyBkquc3dHjf7IzKEUJf6AgAAe5bw=
Date: Thu, 22 Dec 2016 18:11:15 +0000
Message-ID: <784sqc7dbvu8vfgphhuk2djn.1482430329669@email.android.com>
References: <1482413283-25405-1-git-send-email-ola.x.nilsson@axis.com>,
	<2932563.snhXiro51n@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <2932563.snhXiro51n@peggleto-mobl.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] externalsrc.bbclass: Add task buildclean
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
X-List-Received-Date: Thu, 22 Dec 2016 18:11:32 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_784sqc7dbvu8vfgphhuk2djn1482430329669emailandroidcom_"

--_000_784sqc7dbvu8vfgphhuk2djn1482430329669emailandroidcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



---- Paul Eggleton wrote ----

> Hi Ola,
>
> I like this, thanks. Just one thing commented below.
>
> On Thu, 22 Dec 2016 14:28:03 Ola x Nilsson wrote:

> >
> > + bb.build.addtask('do_makeclean', 'do_clean', None, d)
> > +
>
> Shouldn't this be do_buildclean here?
>

Of course it should. The danger of last minute changes. I'll send a v2 patc=
h after the holidays.

--
Ola
Hi Ola,

I like this, thanks. Just one thing commented below.

On Thu, 22 Dec 2016 14:28:03 Ola x Nilsson wrote:
> The buildclean task should call the package build system clean
> command, just implemented for Make for now.
>
> This is meant for recipes where S =3D=3D B, but can be useful as a
> standalone task for other recipes too.
>
> Setting it to run before do_clean will do what most developers expect
> when calling bitbake -c clean.
>
> Signed-off-by: Ola x Nilsson <ola.x.nilsson@axis.com>
> ---
>  meta/classes/externalsrc.bbclass | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/externalsrc.bbclass
> b/meta/classes/externalsrc.bbclass index e115a47..bc82f1f 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -4,7 +4,7 @@
>  # Copyright (C) 2009 Chris Larson <clarson@kergoth.com>
>  # Released under the MIT license (see COPYING.MIT for the terms)
>  #
> -# externalsrc.bbclass enables use of an existing source tree, usually
> external to
> +# externalsrc.bbclass enables use of an existing source tree,
> usually external to
> # the build system to build a piece of software rather
> than the usual fetch/unpack/patch # process.
>  #
> @@ -108,6 +108,8 @@ python () {
>          # We don't want the workdir to go away
>          d.appendVar('RM_WORK_EXCLUDE', ' ' + d.getVar('PN'))
>
> +        bb.build.addtask('do_makeclean', 'do_clean', None, d)
> +

Shouldn't this be do_buildclean here?

>          # If B=3DS the same builddir is used even for different
> architectures. # Thus, use a shared CONFIGURESTAMPFILE and STAMP director=
y
> so that # change of do_configure task hash is correctly detected and stam=
ps
> are @@ -142,6 +144,17 @@ python externalsrc_compile_prefunc() {
>      bb.plain('NOTE: %s: compiling from external source tree %s' %
> (d.getVar('PN'), d.getVar('EXTERNALSRC'))) }
>
> +do_buildclean[dirs] =3D "${S} ${B}"
> +do_buildclean[nostamp] =3D "1"
> +do_buildclean[doc] =3D "Call 'make clean' or equivalent in ${B}"
> +externalsrc_do_buildclean() {
> +     if [ -e Makefile -o -e makefile -o -e GNUmakefile ]; then
> +             oe_runmake clean || die "make failed"
> +     else
> +             bbnote "nothing to compile - no makefile found"
> +     fi
> +}
> +
>  def srctree_hash_files(d):
>      import shutil
>      import subprocess
> @@ -188,3 +201,5 @@ def srctree_configure_hash_files(d):
>                  if f in search_files:
>                      out_items.append('%s:True' % os.path.join(root, f))
>      return ' '.join(out_items)
> +
> +EXPORT_FUNCTIONS do_buildclean

Cheers,
Paul

--

Paul Eggleton
Intel Open Source Technology Centre

--_000_784sqc7dbvu8vfgphhuk2djn1482430329669emailandroidcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div><br>
<br>
---- Paul Eggleton wrote ----<br>
<br>
&gt; Hi Ola,<br>
&gt; <br>
&gt; I like this, thanks. Just one thing commented below.<br>
&gt; <br>
&gt; On Thu, 22 Dec 2016 14:28:03 Ola x Nilsson wrote:<br>
<br>
&gt; &gt; <br>
&gt; &gt; &#43; bb.build.addtask('do_makeclean', 'do_clean', None, d)<br>
&gt; &gt; &#43;<br>
&gt; <br>
&gt; Shouldn't this be do_buildclean here?<br>
&gt; <br>
<br>
Of course it should. The danger of last minute changes. I'll send a v2 patc=
h after the holidays.
<br>
<br>
-- <br>
Ola </div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Hi Ola,<br>
<br>
I like this, thanks. Just one thing commented below.<br>
<br>
On Thu, 22 Dec 2016 14:28:03 Ola x Nilsson wrote:<br>
&gt; The buildclean task should call the package build system clean<br>
&gt; command, just implemented for Make for now.<br>
&gt; <br>
&gt; This is meant for recipes where S =3D=3D B, but can be useful as a<br>
&gt; standalone task for other recipes too.<br>
&gt; <br>
&gt; Setting it to run before do_clean will do what most developers expect<=
br>
&gt; when calling bitbake -c clean.<br>
&gt; <br>
&gt; Signed-off-by: Ola x Nilsson &lt;ola.x.nilsson@axis.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/classes/externalsrc.bbclass | 17 &#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-<br>
&gt;&nbsp; 1 file changed, 16 insertions(&#43;), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/externalsrc.bbclass<br>
&gt; b/meta/classes/externalsrc.bbclass index e115a47..bc82f1f 100644<br>
&gt; --- a/meta/classes/externalsrc.bbclass<br>
&gt; &#43;&#43;&#43; b/meta/classes/externalsrc.bbclass<br>
&gt; @@ -4,7 &#43;4,7 @@<br>
&gt;&nbsp; # Copyright (C) 2009 Chris Larson &lt;clarson@kergoth.com&gt;<br=
>
&gt;&nbsp; # Released under the MIT license (see COPYING.MIT for the terms)=
<br>
&gt;&nbsp; #<br>
&gt; -# externalsrc.bbclass enables use of an existing source tree, usually=
<br>
&gt; external to <br>
&gt; &#43;# externalsrc.bbclass enables use of an existing source tree,<br>
&gt; usually external to <br>
&gt; # the build system to build a piece of software rather<br>
&gt; than the usual fetch/unpack/patch # process.<br>
&gt;&nbsp; #<br>
&gt; @@ -108,6 &#43;108,8 @@ python () {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # We don't want =
the workdir to go away<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d.appendVar('RM_=
WORK_EXCLUDE', ' ' &#43; d.getVar('PN'))<br>
&gt; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.build.addtask('do_m=
akeclean', 'do_clean', None, d)<br>
&gt; &#43;<br>
<br>
Shouldn't this be do_buildclean here?<br>
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # If B=3DS the s=
ame builddir is used even for different<br>
&gt; architectures. # Thus, use a shared CONFIGURESTAMPFILE and STAMP direc=
tory<br>
&gt; so that # change of do_configure task hash is correctly detected and s=
tamps<br>
&gt; are @@ -142,6 &#43;144,17 @@ python externalsrc_compile_prefunc() {<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bb.plain('NOTE: %s: compiling from exter=
nal source tree %s' %<br>
&gt; (d.getVar('PN'), d.getVar('EXTERNALSRC'))) }<br>
&gt; <br>
&gt; &#43;do_buildclean[dirs] =3D &quot;${S} ${B}&quot;<br>
&gt; &#43;do_buildclean[nostamp] =3D &quot;1&quot;<br>
&gt; &#43;do_buildclean[doc] =3D &quot;Call 'make clean' or equivalent in $=
{B}&quot;<br>
&gt; &#43;externalsrc_do_buildclean() {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if [ -e Makefile -o -e makefile -o -e GN=
Umakefile ]; then<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; oe_runmake clean || die &quot;make failed&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; bbnote &quot;nothing to compile - no makefile found&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt;&nbsp; def srctree_hash_files(d):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; import shutil<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; import subprocess<br>
&gt; @@ -188,3 &#43;201,5 @@ def srctree_configure_hash_files(d):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if f in search_files:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; out_items.append('%=
s:True' % os.path.join(root, f))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ' '.join(out_items)<br>
&gt; &#43;<br>
&gt; &#43;EXPORT_FUNCTIONS do_buildclean<br>
<br>
Cheers,<br>
Paul<br>
<br>
-- <br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</div>
</span></font>
</body>
</html>

--_000_784sqc7dbvu8vfgphhuk2djn1482430329669emailandroidcom_--
