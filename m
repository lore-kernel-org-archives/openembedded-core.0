Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDC6C10DCE
	for <webhook@archiver.kernel.org>; Sat,  9 Dec 2023 01:15:31 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.1055.1702084525406481762
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 17:15:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bdn+IDBB;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: ticotimo@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3b8903f7192so1782739b6e.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 17:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702084524; x=1702689324; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0Jk1vNMCFTIBoD20x4rHhF5wOoeb50OvJdp8t5czE0=;
        b=Bdn+IDBBeof1B63bX5nrAGEJil/ru0dTX0qAudmhtUqD5cyGFEtbspLYjrslSoVbfq
         uwgQzO6OFRJhxhSjMBv04Bed1Q4iT8AAaSIPf79HzaVgOMM9x1QL1ghrOdCnVi91QGd/
         xuY+a2HYxl5CMYFozC0ze/xSXhuEGabWRzANkkMJJ3K8sd2V5GWxswgRH4u+kyx6n83o
         EQiII2uZMjWIcR6EIbrPonkSq3S0Sk4Qww0biPo8P7sOF1b7fZs1dfFdHm+Hd3rC5SBF
         wA+Qi6DBJFGwd25wexSm9f6aYHR4zX3c2hU9FGGCKMC4HeePMNuPX6nUT4ZyXmU87P4o
         E7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702084524; x=1702689324;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0Jk1vNMCFTIBoD20x4rHhF5wOoeb50OvJdp8t5czE0=;
        b=aUGh70Cb45IsszbjdKv8b55HZ4pR5qfetfqmHjMKQeCN4g/AzD5WQRwl5WxWH3WRjk
         Plol+k8GJ2WB0gU5jsLKHfjzS6qBOiGHbxFkO6Ld4pkEThgab4T0Co2KeWMsnMsZaHs5
         5WDzpxNJZmlmOSR4wUFbSw53TSkBzqBIRxczskjU9/bc7nJPbRNwRGGF5K3Xkvssjpa0
         u0qMTMeiozwisVztwBYhO6n1coZxvlUC8VxWSErhaICO699uDcGO7iz0Z9DJKjQcoQKN
         CsgbSrxNn1CT/37rm4ypOAqUxaLg//hkXoeW3bJy+mqlitfjBEqkz5dF+T7nGHzuvlj2
         ISWA==
X-Gm-Message-State: AOJu0Yzfvw2gOyhtrP7QbHLmklZtaoIvxjfHvlzleRMfNpb6582vt5oL
	fl2A2rohwSqBmkXfqGzKSrfM9NnH1PtDrEF6KwU=
X-Google-Smtp-Source: AGHT+IHlNQ+ViWdr20nlJNvUmL1LfEtCG2J6+Jdc5QbLDhkKJdefiquvRet0PbrDQ38AGr0hfG/nrOPVrQYbiIxyEbM=
X-Received: by 2002:a05:6808:220c:b0:3b9:d8bb:8ff6 with SMTP id
 bd12-20020a056808220c00b003b9d8bb8ff6mr1202443oib.31.1702084524567; Fri, 08
 Dec 2023 17:15:24 -0800 (PST)
MIME-Version: 1.0
References: <20231204155934.836992-1-jstephan@baylibre.com> <20231204155934.836992-6-jstephan@baylibre.com>
In-Reply-To: <20231204155934.836992-6-jstephan@baylibre.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 8 Dec 2023 17:15:13 -0800
Message-ID: <CANx9H-DjDi8VApDYzH1tLxrrqY2tm2Nj3oNBB5bkdnNMV_4HGA@mail.gmail.com>
Subject: Re: [OE-core] [RESEND][PATCH 5/7] recipetool: create_buildsys_python:
 add pypi support
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000076eef1060c096f5d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Dec 2023 01:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192092

--00000000000076eef1060c096f5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 7:59=E2=80=AFAM Julien Stephan <jstephan@baylibre.co=
m> wrote:

> Today, we can use devtool/recipetool to create recipes for python project=
s
> using the github url or the direct release tarball of the project, but th=
e
> create_buildsys_python plugin doesn't support the pypi class, since we
> cannot
> know from the extracted source if the package is available on pypi or not=
.
>
> By implementing the new optional process_url callback, we can detect
> that the url is a pypi one (i.e 'https://pypi.org/project/<package>')
> and retrieve the release tarball location.
> Also detect if the url points to a release tarball hosted on
> "files.pythonhosted.iorg" (i.e https://files.pythonhosted.org/packages/..
> .)
>
> In both cases, adds the pypi class, remove 'S' and 'SRC_URIxxx'
> variables from the created recipe as they will be handled by the pypi cla=
ss
> and add the PYPI_PACKAGE variable
>
> This helps to produce cleaner recipes when package is hosted on pypi.
>
> If the url points to a github url or a release tarball not coming from
> "files.pythonhosted.org", the created recipe is the same as before.
> One can also use the newly added "--no-pypi" switch to NOT inherit
> from pypi class on matching url, to keep legacy behaviour.
>
> To create a recipe for a pypi package, one can now use one of the
> new following syntax (using recipetool create / devtool add):
>
> * recipetool create https://pypi.org/project/<package>
> * recipetool create https://pypi.org/project/<package>/<version>
> * recipetool create https://pypi.org/project/<package> --version <version=
>
>
> or the old syntax:
> * recipetool create https://files.pythonhosted.org/packages/<...>
>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  scripts/lib/devtool/standard.py               |  3 +
>  scripts/lib/recipetool/create.py              |  1 +
>  .../lib/recipetool/create_buildsys_python.py  | 72 +++++++++++++++++++
>  3 files changed, 76 insertions(+)
>
> diff --git a/scripts/lib/devtool/standard.py
> b/scripts/lib/devtool/standard.py
> index d53fb810071..f18ebaa70d3 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -147,6 +147,8 @@ def add(args, config, basepath, workspace):
>          extracmdopts +=3D ' -a'
>      if args.npm_dev:
>          extracmdopts +=3D ' --npm-dev'
> +    if args.no_pypi:
> +        extracmdopts +=3D ' --no-pypi'
>      if args.mirrors:
>          extracmdopts +=3D ' --mirrors'
>      if args.srcrev:
> @@ -2260,6 +2262,7 @@ def register_commands(subparsers, context):
>      group.add_argument('--no-same-dir', help=3D'Force build in a separat=
e
> build directory', action=3D"store_true")
>      parser_add.add_argument('--fetch', '-f', help=3D'Fetch the specified
> URI and extract it to create the source tree (deprecated - pass as
> positional argument instead)', metavar=3D'URI')
>      parser_add.add_argument('--npm-dev', help=3D'For npm, also fetch
> devDependencies', action=3D"store_true")
> +    parser_add.add_argument('--no-pypi', help=3D'Do not inherit pypi
> class', action=3D"store_true")
>      parser_add.add_argument('--version', '-V', help=3D'Version to use
> within recipe (PV)')
>      parser_add.add_argument('--no-git', '-g', help=3D'If fetching source=
,
> do not set up source tree as a git repository', action=3D"store_true")
>      group =3D parser_add.add_mutually_exclusive_group()
> diff --git a/scripts/lib/recipetool/create.py
> b/scripts/lib/recipetool/create.py
> index 5c5ac7ae403..963aa91421e 100644
> --- a/scripts/lib/recipetool/create.py
> +++ b/scripts/lib/recipetool/create.py
> @@ -1413,6 +1413,7 @@ def register_commands(subparsers):
>      parser_create.add_argument('-B', '--srcbranch', help=3D'Branch in
> source repository if fetching from an SCM such as git (default master)')
>      parser_create.add_argument('--keep-temp', action=3D"store_true",
> help=3D'Keep temporary directory (for debugging)')
>      parser_create.add_argument('--npm-dev', action=3D"store_true",
> help=3D'For npm, also fetch devDependencies')
> +    parser_create.add_argument('--no-pypi', action=3D"store_true", help=
=3D'Do
> not inherit pypi class')
>      parser_create.add_argument('--devtool', action=3D"store_true",
> help=3Dargparse.SUPPRESS)
>      parser_create.add_argument('--mirrors', action=3D"store_true",
> help=3D'Enable PREMIRRORS and MIRRORS for source tree fetching (disabled =
by
> default).')
>      parser_create.set_defaults(func=3Dcreate_recipe)
> diff --git a/scripts/lib/recipetool/create_buildsys_python.py
> b/scripts/lib/recipetool/create_buildsys_python.py
> index b620e3271b1..5e07222ece1 100644
> --- a/scripts/lib/recipetool/create_buildsys_python.py
> +++ b/scripts/lib/recipetool/create_buildsys_python.py
> @@ -18,7 +18,11 @@ import os
>  import re
>  import sys
>  import subprocess
> +import json
> +import urllib.request
>  from recipetool.create import RecipeHandler
> +from urllib.parse import urldefrag
> +from recipetool.create import determine_from_url
>
>  logger =3D logging.getLogger('recipetool')
>
> @@ -111,6 +115,74 @@ class PythonRecipeHandler(RecipeHandler):
>      def __init__(self):
>          pass
>
> +    def process_url(self, args, classes, handled, extravalues):
> +        """
> +        Convert any pypi url https://pypi.org/project/<package>/<version=
>
> into https://files.pythonhosted.org/packages/source/...
> +        which corresponds to the archive location, and add pypi class
> +        """
> +
> +        if 'url' in handled:
> +            return None
> +
> +        fetch_uri =3D None
> +        source =3D args.source
> +        required_version =3D args.version if args.version else None
> +        match =3D re.match(r'https?://pypi.org/project/([
> <http://pypi.org/project/(%5B>^/]+)(?:/([^/]+))?/?$',
> urldefrag(source)[0])
> +        if match:
> +            package =3D match.group(1)
> +            version =3D match.group(2) if match.group(2) else
> required_version
> +
> +            json_url =3D f"https://pypi.org/pypi/%s/json" % package
> +            response =3D urllib.request.urlopen(json_url)
> +            if response.status =3D=3D 200:
> +                data =3D json.loads(response.read())
> +                if not version:
> +                    # grab latest version
> +                    version =3D data["info"]["version"]
> +                pypi_package =3D data["info"]["name"]
> +                for release in reversed(data["releases"][version]):
> +                    if release["packagetype"] =3D=3D "sdist":
> +                        fetch_uri =3D release["url"]
> +                        break
> +            else:
> +                logger.warning("Cannot handle pypi url %s: cannot fetch
> package information using %s", source, json_url)
> +                return None
> +        else:
> +            match =3D re.match(r'^https?://
> files.pythonhosted.org/packages.*/(.*)-.*$', source)
> +            if match:
> +                fetch_uri =3D source
> +                pypi_package =3D match.group(1)
> +                _, version =3D determine_from_url(fetch_uri)
> +
> +        if match and not args.no_pypi:
> +            if required_version and version !=3D required_version:
> +                raise Exception("Version specified using --version/-V
> (%s) and version specified in the url (%s) do not match" %
> (required_version, version))
> +            # This is optionnal if BPN looks like "python-<pypi_package>=
"
> or "python3-<pypi_package>" (see pypi.bbclass)
> +            # but at this point we cannot know because because user can
> specify the output name of the recipe on the command line
> +            extravalues["PYPI_PACKAGE"] =3D pypi_package
> +            # If the tarball extension is not 'tar.gz' (default value in
> pypi.bblcass) whe should set PYPI_PACKAGE_EXT in the recipe
> +            pypi_package_ext =3D re.match(r'.*%s-%s\.(.*)$' %
> (pypi_package, version), fetch_uri)
> +            if pypi_package_ext:
> +                pypi_package_ext =3D pypi_package_ext.group(1)
> +                if pypi_package_ext !=3D "tar.gz":
> +                    extravalues["PYPI_PACKAGE_EXT"] =3D pypi_package_ext
> +
> +            # Pypi class will handle S and SRC_URIxxx variables, so
> remove them
> +            # TODO: allow oe.recipeutils.patch_recipe_lines() to accept
> regexp so we can simplify the following to:
> +            # extravalues['SRC_URI(?:\[.*?\])?'] =3D None
> +            extravalues['S'] =3D None
> +            extravalues['SRC_URI'] =3D None
> +            extravalues['SRC_URI[md5sum]'] =3D None
> +            extravalues['SRC_URI[sha1sum]'] =3D None
> +            extravalues['SRC_URI[sha256sum]'] =3D None
> +            extravalues['SRC_URI[sha384sum]'] =3D None
> +            extravalues['SRC_URI[sha512sum]'] =3D None
> +

this was not correct. The pypi.bbclass does not create the
SRC_URI[sha256sum]. It does create the SRC_URI. So new recipes will not
have any check on the validity of the downloaded tarball.

The only test case which checked for this was with =E2=80=94nopypi
https://git.yoctoproject.org/poky-contrib/tree/meta/lib/oeqa/selftest/cases=
/recipetool.py#n752


> +            classes.append('pypi')
> +
> +        handled.append('url')
> +        return fetch_uri
> +
>      def handle_classifier_license(self, classifiers,
> existing_licenses=3D""):
>
>          licenses =3D []
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191759):
> https://lists.openembedded.org/g/openembedded-core/message/191759
> Mute This Topic: https://lists.openembedded.org/mt/102972952/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000076eef1060c096f5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Dec 4, 2023 at 7:59=E2=80=AFAM Julien Stephan &lt;<=
a href=3D"mailto:jstephan@baylibre.com">jstephan@baylibre.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-l=
eft-color:rgb(204,204,204)">Today, we can use devtool/recipetool to create =
recipes for python projects<br>
using the github url or the direct release tarball of the project, but the<=
br>
create_buildsys_python plugin doesn&#39;t support the pypi class, since we =
cannot<br>
know from the extracted source if the package is available on pypi or not.<=
br>
<br>
By implementing the new optional process_url callback, we can detect<br>
that the url is a pypi one (i.e &#39;<a href=3D"https://pypi.org/project/" =
rel=3D"noreferrer" target=3D"_blank">https://pypi.org/project/</a>&lt;packa=
ge&gt;&#39;)<br>
and retrieve the release tarball location.<br>
Also detect if the url points to a release tarball hosted on<br>
&quot;files.pythonhosted.iorg&quot; (i.e <a href=3D"https://files.pythonhos=
ted.org/packages/.." rel=3D"noreferrer" target=3D"_blank">https://files.pyt=
honhosted.org/packages/..</a>.)<br>
<br>
In both cases, adds the pypi class, remove &#39;S&#39; and &#39;SRC_URIxxx&=
#39;<br>
variables from the created recipe as they will be handled by the pypi class=
<br>
and add the PYPI_PACKAGE variable<br>
<br>
This helps to produce cleaner recipes when package is hosted on pypi.<br>
<br>
If the url points to a github url or a release tarball not coming from<br>
&quot;<a href=3D"http://files.pythonhosted.org" rel=3D"noreferrer" target=
=3D"_blank">files.pythonhosted.org</a>&quot;, the created recipe is the sam=
e as before.<br>
One can also use the newly added &quot;--no-pypi&quot; switch to NOT inheri=
t<br>
from pypi class on matching url, to keep legacy behaviour.<br>
<br>
To create a recipe for a pypi package, one can now use one of the<br>
new following syntax (using recipetool create / devtool add):<br>
<br>
* recipetool create <a href=3D"https://pypi.org/project/" rel=3D"noreferrer=
" target=3D"_blank">https://pypi.org/project/</a>&lt;package&gt;<br>
* recipetool create <a href=3D"https://pypi.org/project/" rel=3D"noreferrer=
" target=3D"_blank">https://pypi.org/project/</a>&lt;package&gt;/&lt;versio=
n&gt;<br>
* recipetool create <a href=3D"https://pypi.org/project/" rel=3D"noreferrer=
" target=3D"_blank">https://pypi.org/project/</a>&lt;package&gt; --version =
&lt;version&gt;<br>
<br>
or the old syntax:<br>
* recipetool create <a href=3D"https://files.pythonhosted.org/packages/" re=
l=3D"noreferrer" target=3D"_blank">https://files.pythonhosted.org/packages/=
</a>&lt;...&gt;<br>
<br>
Signed-off-by: Julien Stephan &lt;<a href=3D"mailto:jstephan@baylibre.com" =
target=3D"_blank">jstephan@baylibre.com</a>&gt;<br>
---<br>
=C2=A0scripts/lib/devtool/standard.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 3 +<br>
=C2=A0scripts/lib/recipetool/create.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0.../lib/recipetool/create_buildsys_python.py=C2=A0 | 72 +++++++++++++=
++++++<br>
=C2=A03 files changed, 76 insertions(+)<br>
<br>
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py<br>
index d53fb810071..f18ebaa70d3 100644<br>
--- a/scripts/lib/devtool/standard.py<br>
+++ b/scripts/lib/devtool/standard.py<br>
@@ -147,6 +147,8 @@ def add(args, config, basepath, workspace):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extracmdopts +=3D &#39; -a&#39;<br>
=C2=A0 =C2=A0 =C2=A0if args.npm_dev:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extracmdopts +=3D &#39; --npm-dev&#39;<br=
>
+=C2=A0 =C2=A0 if args.no_pypi:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 extracmdopts +=3D &#39; --no-pypi&#39;<br>
=C2=A0 =C2=A0 =C2=A0if args.mirrors:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extracmdopts +=3D &#39; --mirrors&#39;<br=
>
=C2=A0 =C2=A0 =C2=A0if args.srcrev:<br>
@@ -2260,6 +2262,7 @@ def register_commands(subparsers, context):<br>
=C2=A0 =C2=A0 =C2=A0group.add_argument(&#39;--no-same-dir&#39;, help=3D&#39=
;Force build in a separate build directory&#39;, action=3D&quot;store_true&=
quot;)<br>
=C2=A0 =C2=A0 =C2=A0parser_add.add_argument(&#39;--fetch&#39;, &#39;-f&#39;=
, help=3D&#39;Fetch the specified URI and extract it to create the source t=
ree (deprecated - pass as positional argument instead)&#39;, metavar=3D&#39=
;URI&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser_add.add_argument(&#39;--npm-dev&#39;, help=3D&#3=
9;For npm, also fetch devDependencies&#39;, action=3D&quot;store_true&quot;=
)<br>
+=C2=A0 =C2=A0 parser_add.add_argument(&#39;--no-pypi&#39;, help=3D&#39;Do =
not inherit pypi class&#39;, action=3D&quot;store_true&quot;)<br>
=C2=A0 =C2=A0 =C2=A0parser_add.add_argument(&#39;--version&#39;, &#39;-V&#3=
9;, help=3D&#39;Version to use within recipe (PV)&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser_add.add_argument(&#39;--no-git&#39;, &#39;-g&#39=
;, help=3D&#39;If fetching source, do not set up source tree as a git repos=
itory&#39;, action=3D&quot;store_true&quot;)<br>
=C2=A0 =C2=A0 =C2=A0group =3D parser_add.add_mutually_exclusive_group()<br>
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py<br>
index 5c5ac7ae403..963aa91421e 100644<br>
--- a/scripts/lib/recipetool/create.py<br>
+++ b/scripts/lib/recipetool/create.py<br>
@@ -1413,6 +1413,7 @@ def register_commands(subparsers):<br>
=C2=A0 =C2=A0 =C2=A0parser_create.add_argument(&#39;-B&#39;, &#39;--srcbran=
ch&#39;, help=3D&#39;Branch in source repository if fetching from an SCM su=
ch as git (default master)&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser_create.add_argument(&#39;--keep-temp&#39;, actio=
n=3D&quot;store_true&quot;, help=3D&#39;Keep temporary directory (for debug=
ging)&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser_create.add_argument(&#39;--npm-dev&#39;, action=
=3D&quot;store_true&quot;, help=3D&#39;For npm, also fetch devDependencies&=
#39;)<br>
+=C2=A0 =C2=A0 parser_create.add_argument(&#39;--no-pypi&#39;, action=3D&qu=
ot;store_true&quot;, help=3D&#39;Do not inherit pypi class&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser_create.add_argument(&#39;--devtool&#39;, action=
=3D&quot;store_true&quot;, help=3Dargparse.SUPPRESS)<br>
=C2=A0 =C2=A0 =C2=A0parser_create.add_argument(&#39;--mirrors&#39;, action=
=3D&quot;store_true&quot;, help=3D&#39;Enable PREMIRRORS and MIRRORS for so=
urce tree fetching (disabled by default).&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser_create.set_defaults(func=3Dcreate_recipe)<br>
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib=
/recipetool/create_buildsys_python.py<br>
index b620e3271b1..5e07222ece1 100644<br>
--- a/scripts/lib/recipetool/create_buildsys_python.py<br>
+++ b/scripts/lib/recipetool/create_buildsys_python.py<br>
@@ -18,7 +18,11 @@ import os<br>
=C2=A0import re<br>
=C2=A0import sys<br>
=C2=A0import subprocess<br>
+import json<br>
+import urllib.request<br>
=C2=A0from recipetool.create import RecipeHandler<br>
+from urllib.parse import urldefrag<br>
+from recipetool.create import determine_from_url<br>
<br>
=C2=A0logger =3D logging.getLogger(&#39;recipetool&#39;)<br>
<br>
@@ -111,6 +115,74 @@ class PythonRecipeHandler(RecipeHandler):<br>
=C2=A0 =C2=A0 =C2=A0def __init__(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass<br>
<br>
+=C2=A0 =C2=A0 def process_url(self, args, classes, handled, extravalues):<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Convert any pypi url <a href=3D"https://pypi.o=
rg/project/" rel=3D"noreferrer" target=3D"_blank">https://pypi.org/project/=
</a>&lt;package&gt;/&lt;version&gt; into <a href=3D"https://files.pythonhos=
ted.org/packages/source/." rel=3D"noreferrer" target=3D"_blank">https://fil=
es.pythonhosted.org/packages/source/.</a>..<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 which corresponds to the archive location, and=
 add pypi class<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;url&#39; in handled:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fetch_uri =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 source =3D args.source<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 required_version =3D args.version if args.vers=
ion else None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D re.match(r&#39;https?://<a href=3D"h=
ttp://pypi.org/project/(%5B" rel=3D"noreferrer" target=3D"_blank">pypi.org/=
project/([</a>^/]+)(?:/([^/]+))?/?$&#39;, urldefrag(source)[0])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if match:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 package =3D match.group(1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 version =3D match.group(2) if ma=
tch.group(2) else required_version<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 json_url =3D f&quot;<a href=3D"h=
ttps://pypi.org/pypi/%s/json" rel=3D"noreferrer" target=3D"_blank">https://=
pypi.org/pypi/%s/json</a>&quot; % package<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 response =3D urllib.request.urlo=
pen(json_url)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if response.status =3D=3D 200:<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data =3D json.load=
s(response.read())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not version:<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # gr=
ab latest version<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vers=
ion =3D data[&quot;info&quot;][&quot;version&quot;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pypi_package =3D d=
ata[&quot;info&quot;][&quot;name&quot;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for release in rev=
ersed(data[&quot;releases&quot;][version]):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if r=
elease[&quot;packagetype&quot;] =3D=3D &quot;sdist&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fetch_uri =3D release[&quot;url&quot;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.warning(&qu=
ot;Cannot handle pypi url %s: cannot fetch package information using %s&quo=
t;, source, json_url)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D re.match(r&#39;^https?=
://<a href=3D"http://files.pythonhosted.org/packages.*/(.*)-.*$" rel=3D"nor=
eferrer" target=3D"_blank">files.pythonhosted.org/packages.*/(.*)-.*$</a>&#=
39;, source)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if match:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fetch_uri =3D sour=
ce<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pypi_package =3D m=
atch.group(1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _, version =3D det=
ermine_from_url(fetch_uri)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if match and not args.no_pypi:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if required_version and version =
!=3D required_version:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise Exception(&q=
uot;Version specified using --version/-V (%s) and version specified in the =
url (%s) do not match&quot; % (required_version, version))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # This is optionnal if BPN looks=
 like &quot;python-&lt;pypi_package&gt;&quot; or &quot;python3-&lt;pypi_pac=
kage&gt;&quot; (see pypi.bbclass)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # but at this point we cannot kn=
ow because because user can specify the output name of the recipe on the co=
mmand line<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extravalues[&quot;PYPI_PACKAGE&q=
uot;] =3D pypi_package<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # If the tarball extension is no=
t &#39;tar.gz&#39; (default value in pypi.bblcass) whe should set PYPI_PACK=
AGE_EXT in the recipe<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pypi_package_ext =3D re.match(r&=
#39;.*%s-%s\.(.*)$&#39; % (pypi_package, version), fetch_uri)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if pypi_package_ext:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pypi_package_ext =
=3D pypi_package_ext.group(1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if pypi_package_ex=
t !=3D &quot;tar.gz&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extr=
avalues[&quot;PYPI_PACKAGE_EXT&quot;] =3D pypi_package_ext<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Pypi class will handle S and S=
RC_URIxxx variables, so remove them<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO: allow oe.recipeutils.pat=
ch_recipe_lines() to accept regexp so we can simplify the following to:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # extravalues[&#39;SRC_URI(?:\[.=
*?\])?&#39;] =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extravalues[&#39;S&#39;] =3D Non=
e<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extravalues[&#39;SRC_URI&#39;] =
=3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extravalues[&#39;SRC_URI[md5sum]=
&#39;] =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extravalues[&#39;SRC_URI[sha1sum=
]&#39;] =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extravalues[&#39;SRC_URI[sha256s=
um]&#39;] =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extravalues[&#39;SRC_URI[sha384s=
um]&#39;] =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extravalues[&#39;SRC_URI[sha512s=
um]&#39;] =3D None<br>
+</blockquote><div dir=3D"auto">this was not correct. The pypi.bbclass does=
 not create the SRC_URI[sha256sum]. It does create the SRC_URI. So new reci=
pes will not have any check on the validity of the downloaded tarball.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">The only test case which che=
cked for this was with =E2=80=94nopypi</div><div dir=3D"auto"><div><a href=
=3D"https://git.yoctoproject.org/poky-contrib/tree/meta/lib/oeqa/selftest/c=
ases/recipetool.py#n752">https://git.yoctoproject.org/poky-contrib/tree/met=
a/lib/oeqa/selftest/cases/recipetool.py#n752</a></div><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,=
204)" dir=3D"auto"><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 classes.append(&#39;pypi&#39;)<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 handled.append(&#39;url&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return fetch_uri<br>
+<br>
=C2=A0 =C2=A0 =C2=A0def handle_classifier_license(self, classifiers, existi=
ng_licenses=3D&quot;&quot;):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0licenses =3D []<br>
-- <br>
2.42.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#191759): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/191759" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/191759</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102972952/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/102972952/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000076eef1060c096f5d--

