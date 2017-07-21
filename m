Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 673017841B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 13:50:25 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id h199so7708196ith.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 06:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5TQHIE7wsydSnLK9/Mk5QE+fQArkXVElP6ZpbRRgC7k=;
	b=kP/OINjRVZJmHHRNSbelNVWF+63QPILvFQDjKu4ndQvljOdRiLUSi4vlmSWecCuT0D
	Dg38AoQ4le1DNn0xXIz6GDif8kTFtNxsY9yPzovEp/cbdVli5TSWVHrVJrz4uz8Vl3Em
	eNegqcA4A/6CKnvD2AyBZjiOsbVgTcHUjJM9JT5io5Z1geAd2ZWt1MleHDzohj1NGrHA
	1R1K7FMQzOBEhXovg/d7tLarqEq3m/rGmgFFDbfhB1TavoPDQKPoQ+vxk76gL31nBM7R
	hSSIA9pNSPjK5ZfkiWZrcFaLfyQssWbXhzrhlrvWOGOJCHu7l69mmDbGOH33lzWkl/NA
	jqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5TQHIE7wsydSnLK9/Mk5QE+fQArkXVElP6ZpbRRgC7k=;
	b=niKcI26GAU3UNZWuTe+o8pLHTbNX7Pi3PGX3nHxJU1z3E2xyp4Id/0uDTvdW6SRLCX
	ixqE4ZnbC9zYBoBfpoS+LmoW7+zZMCflIHw+GrxbPnAQ1j5qOokv3lgN3hQaP/45ATPo
	8oxkybVhoNBKtKd3gMipH8iSagHo4W7FrUqiamOfaBwa5rytg7nhBdjZh7lizy1OW6d0
	9H4NpqcY/wgGZT02zVZ/fU+MYcq/X2ywQevuNbjD7zOSKCNGwORHDWzfo9dnxmwudLaA
	WwO9HvMCO1AV0eJpsIfcPpZQ6vFBugQvo3jl8rBGeGGh60cd3uhsTslbo/xoPb4iEzf7
	LcuA==
X-Gm-Message-State: AIVw111TgLqaBm4e3s6hQZBnjfsECRF4PYDQCBKddYvUyWsqY5g/d8qx
	hgVrGCDop4lUxb836r+sAHAcke2BXWeP
X-Received: by 10.36.154.67 with SMTP id l64mr6573293ite.87.1500645026557;
	Fri, 21 Jul 2017 06:50:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Fri, 21 Jul 2017 06:50:05 -0700 (PDT)
In-Reply-To: <1500546720-145364-2-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1500546720-145364-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1500546720-145364-2-git-send-email-rebecca.swee.fun.chang@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Jul 2017 14:50:05 +0100
Message-ID: <CAJTo0LaBBKsOcKZPzzix28moHELz30gG=qat2iiJ=DDeqdKo2Q@mail.gmail.com>
To: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/4] recipetool: create: disable PREMIRRORS and MIRRORS by default
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
X-List-Received-Date: Fri, 21 Jul 2017 13:50:25 -0000
Content-Type: multipart/alternative; boundary="94eb2c11489ebe0e550554d4258e"

--94eb2c11489ebe0e550554d4258e
Content-Type: text/plain; charset="UTF-8"

Sorry, we're conflicting again.  Too many people working on the same bit of
code!  Can you rebase this onto origin/master-next?

Ross

On 20 July 2017 at 11:31, Chang Rebecca Swee Fun <
rebecca.swee.fun.chang@intel.com> wrote:

> When creating new recipes, we are almost certainly fetching a new
> source rather that something that has already been fetched. I have
> disable PREMIRRORS and MIRRORS settings from datastore while leaving
> an option for users to enable them manually if needed.
>
> Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
> ---
>  scripts/lib/recipetool/create.py | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/
> create.py
> index 8e63580..1015d02 100644
> --- a/scripts/lib/recipetool/create.py
> +++ b/scripts/lib/recipetool/create.py
> @@ -422,6 +422,7 @@ def create_recipe(args):
>      source = args.source
>      srcsubdir = ''
>      srcrev = '${AUTOREV}'
> +    mirrors = args.mirrors
>
>      if os.path.isfile(source):
>          source = 'file://%s' % os.path.abspath(source)
> @@ -442,6 +443,13 @@ def create_recipe(args):
>          tempsrc = tempfile.mkdtemp(prefix='recipetool-')
>          srctree = tempsrc
>          d = bb.data.createCopy(tinfoil.config_data)
> +        if not mirrors:
> +            # We do not need PREMIRRORS since we are almost certainly
> +            # fetching new source rather than something that has already
> +            # been fetched. Hence, we disable them by default.
> +            # However, we provide an option for users to enable it.
> +            d.setVar('PREMIRRORS', '')
> +            d.setVar('MIRRORS', '')
>          if fetchuri.startswith('npm://'):
>              # Check if npm is available
>              npm_bindir = check_npm(tinfoil, args.devtool)
> @@ -1180,6 +1188,7 @@ def register_commands(subparsers):
>      parser_create.add_argument('--keep-temp', action="store_true",
> help='Keep temporary directory (for debugging)')
>      parser_create.add_argument('--fetch-dev', action="store_true",
> help='For npm, also fetch devDependencies')
>      parser_create.add_argument('--devtool', action="store_true",
> help=argparse.SUPPRESS)
> +    parser_create.add_argument('--mirrors', action="store_true",
> help='Enable PREMIRRORS and MIRRORS for source tree fetching (disable by
> default).')
>      # FIXME I really hate having to set parserecipes for this, but given
> we may need
>      # to call into npm (and we don't know in advance if we will or not)
> and in order
>      # to do so we need to know npm's recipe sysroot path, there's not
> much alternative
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c11489ebe0e550554d4258e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, we&#39;re conflicting again.=C2=A0 Too many people =
working on the same bit of code!=C2=A0 Can you rebase this onto origin/mast=
er-next?<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On 20 July 2017 at 11:31, Chang Rebecca Swee Fun=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:rebecca.swee.fun.chang@intel.com" =
target=3D"_blank">rebecca.swee.fun.chang@intel.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">When creating new recipes, we are almost ce=
rtainly fetching a new<br>
source rather that something that has already been fetched. I have<br>
disable PREMIRRORS and MIRRORS settings from datastore while leaving<br>
an option for users to enable them manually if needed.<br>
<br>
Signed-off-by: Chang Rebecca Swee Fun &lt;<a href=3D"mailto:rebecca.swee.fu=
n.chang@intel.com">rebecca.swee.fun.chang@intel.<wbr>com</a>&gt;<br>
---<br>
=C2=A0scripts/lib/recipetool/create.<wbr>py | 9 +++++++++<br>
=C2=A01 file changed, 9 insertions(+)<br>
<br>
diff --git a/scripts/lib/recipetool/<wbr>create.py b/scripts/lib/recipetool=
/<wbr>create.py<br>
index 8e63580..1015d02 100644<br>
--- a/scripts/lib/recipetool/<wbr>create.py<br>
+++ b/scripts/lib/recipetool/<wbr>create.py<br>
@@ -422,6 +422,7 @@ def create_recipe(args):<br>
=C2=A0 =C2=A0 =C2=A0source =3D args.source<br>
=C2=A0 =C2=A0 =C2=A0srcsubdir =3D &#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0srcrev =3D &#39;${AUTOREV}&#39;<br>
+=C2=A0 =C2=A0 mirrors =3D args.mirrors<br>
<br>
=C2=A0 =C2=A0 =C2=A0if os.path.isfile(source):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source =3D &#39;file://%s&#39; % os.path.=
abspath(source)<br>
@@ -442,6 +443,13 @@ def create_recipe(args):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tempsrc =3D tempfile.mkdtemp(prefix=3D&#3=
9;<wbr>recipetool-&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srctree =3D tempsrc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d =3D bb.data.createCopy(tinfoil.<wbr>con=
fig_data)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not mirrors:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We do not need PREMIRRORS sinc=
e we are almost certainly<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # fetching new source rather tha=
n something that has already<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # been fetched. Hence, we disabl=
e them by default.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # However, we provide an option =
for users to enable it.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;PREMIRRORS&#39;, &=
#39;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;MIRRORS&#39;, &#39=
;&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if fetchuri.startswith(&#39;npm://&#39;):=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Check if npm is available=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npm_bindir =3D check_npm(ti=
nfoil, args.devtool)<br>
@@ -1180,6 +1188,7 @@ def register_commands(subparsers):<br>
=C2=A0 =C2=A0 =C2=A0parser_create.add_argument(&#39;--<wbr>keep-temp&#39;, =
action=3D&quot;store_true&quot;, help=3D&#39;Keep temporary directory (for =
debugging)&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser_create.add_argument(&#39;--<wbr>fetch-dev&#39;, =
action=3D&quot;store_true&quot;, help=3D&#39;For npm, also fetch devDepende=
ncies&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser_create.add_argument(&#39;--<wbr>devtool&#39;, ac=
tion=3D&quot;store_true&quot;, help=3Dargparse.SUPPRESS)<br>
+=C2=A0 =C2=A0 parser_create.add_argument(&#39;--<wbr>mirrors&#39;, action=
=3D&quot;store_true&quot;, help=3D&#39;Enable PREMIRRORS and MIRRORS for so=
urce tree fetching (disable by default).&#39;)<br>
=C2=A0 =C2=A0 =C2=A0# FIXME I really hate having to set parserecipes for th=
is, but given we may need<br>
=C2=A0 =C2=A0 =C2=A0# to call into npm (and we don&#39;t know in advance if=
 we will or not) and in order<br>
=C2=A0 =C2=A0 =C2=A0# to do so we need to know npm&#39;s recipe sysroot pat=
h, there&#39;s not much alternative<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c11489ebe0e550554d4258e--
