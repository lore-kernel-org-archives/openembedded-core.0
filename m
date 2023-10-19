Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 090ECCDB482
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 14:16:41 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.29068.1697724997931293311
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 07:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WznlgSnJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5a7d532da4bso100109227b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 07:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697724997; x=1698329797; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EEnmpqO1G5e5NUw9YNSdfjEeHP5HREaaKmxcwLPxrJU=;
        b=WznlgSnJw9Bre3HbsfI2nkjYqt+lLFhEUU0hWXR+xSG8xp0iYWXEoPTvJ9z73Easr2
         T3p0JiY5pOLJEo34fIN/zbvPv1KaMuZjMXtbKK2pBtTHh/q7KX4wfQpQv+VGsiYbSFr2
         gIewRvRXtF5pGPcRoqrhzkWkBwUlictizRZ8QgCWC8A34pRa/74qrEBICNphDGlsYOi8
         Hg52rfUICt5o2fprxfo9uwgFd6sephTgSozg0BQ826kz67a6RRvVvaG4aluI5ismHYEh
         TANv9BPkLM7DufEJaMq/660FFvku5degMnVnFTLz7IXYu00xfM9x+M+jRTyjevchjxR2
         wjqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697724997; x=1698329797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EEnmpqO1G5e5NUw9YNSdfjEeHP5HREaaKmxcwLPxrJU=;
        b=F/+V//Ks81k1LPHQHVku3hksJCb5eQyIHCKlvylLVEqd1VD6bfUpd2eXQxYd6PKHFy
         yyCMnJxYWzab52hxH4BW1ck4J2SSxTy1saJYLqCuTMjtav57I5VN4+hiuX97Q8U5tUwM
         GXuO0HcYklkbF9vcoAdPo2/DUdg2CLNHm+7blXuUmTJJKdcqLKUMzvIB/tGNmX3Qs6xa
         US8LEbGDMsY5L9NAYkABWGtmWLkAcByh5R333xcQTiwuzHLJn7oVRzDyK13O+jdaF9Vo
         vpFi9ObpEEx5iwYGdj2V5IPgCX+vfkzgv8DxVjM/fkKaoYi6v/Jf1UGsSALEOWHUkYiY
         bCEA==
X-Gm-Message-State: AOJu0Yz8IspTveBJ7FXbdNZ0DV3Rio4Ca1T+g8lcuOIKwzPxgrjwcXb2
	S+Y6MCkTBvigHC1iVFhvj9F+tKVhrC5HQJ17FvE=
X-Google-Smtp-Source: AGHT+IFIVfOrmLx6KlTN8hgDViLEq4Zux76HT+oKsrkGk7i5Clx1UEqJoUfLrjKlnWiXonmlShSHNU9Y6qsxWK7+3zo=
X-Received: by 2002:a0d:d704:0:b0:59a:b70e:5c13 with SMTP id
 z4-20020a0dd704000000b0059ab70e5c13mr2540206ywd.29.1697724996901; Thu, 19 Oct
 2023 07:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <20231019073653.1280730-1-jstephan@baylibre.com>
 <20231019073653.1280730-4-jstephan@baylibre.com> <202310191349040c7271da@mail.local>
In-Reply-To: <202310191349040c7271da@mail.local>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 19 Oct 2023 07:16:25 -0700
Message-ID: <CANx9H-C_32h6426c=QzqEWnzC6RPRXFoG8UC+zsedwbnCGPrQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 4/4] scripts:recipetool:create_buildsys_python:
 add PEP517 support
To: alexandre.belloni@bootlin.com
Cc: Julien Stephan <jstephan@baylibre.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005de2a20608126785"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 14:16:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189464

--0000000000005de2a20608126785
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 6:49=E2=80=AFAM Alexandre Belloni via lists.openemb=
edded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:

> Hello,
>
> On 19/10/2023 09:36:53+0200, Julien Stephan wrote:
> > add support for PEP517 [1]
> >
> > if a pyproject.toml file is found, use it to create the recipe,
> > otherwise fallback to the old setup.py method.
> >
> > [YOCTO #14737]
> >
> > [1]: https://peps.python.org/pep-0517/
> >
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> >  .../lib/recipetool/create_buildsys_python.py  | 234 +++++++++++++++++-
> >  1 file changed, 233 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/lib/recipetool/create_buildsys_python.py
> b/scripts/lib/recipetool/create_buildsys_python.py
> > index 69f6f5ca511..0b601d50a4b 100644
> > --- a/scripts/lib/recipetool/create_buildsys_python.py
> > +++ b/scripts/lib/recipetool/create_buildsys_python.py
> > @@ -18,6 +18,7 @@ import os
> >  import re
> >  import sys
> >  import subprocess
> > +import toml
>
> This fails on the autobuilders because we don't have the toml module
> installed so I guess you need to add a dependency.
>
>
Starting in Python 3.11, we have tomllib
https://docs.python.org/3/library/tomllib.html

However, we currently pin the minimum Python version at 3.8:
https://git.yoctoproject.org/poky/tree/bitbake/lib/bb/__init__.py#n15

>  from recipetool.create import RecipeHandler
> >
> >  logger =3D logging.getLogger('recipetool')
> > @@ -656,6 +657,235 @@ class
> PythonSetupPyRecipeHandler(PythonRecipeHandler):
> >
> >          handled.append('buildsystem')
> >
> > +class PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):
> > +    """Base class to support PEP517 and PEP518
> > +
> > +    PEP517 https://peps.python.org/pep-0517/#source-trees
> > +    PEP518 https://peps.python.org/pep-0518/#build-system-table
> > +    """
> > +
> > +    # PEP621:
> https://packaging.python.org/en/latest/specifications/declaring-project-m=
etadata/
> > +    # add only the ones that map to a BB var
> > +    # potentially missing: optional-dependencies
> > +    bbvar_map =3D {
> > +        "name": "PN",
> > +        "version": "PV",
> > +        "Homepage": "HOMEPAGE",
> > +        "description": "SUMMARY",
> > +        "license": "LICENSE",
> > +        "dependencies": "RDEPENDS:${PN}",
> > +        "requires": "DEPENDS",
> > +    }
> > +
> > +    replacements =3D [
> > +        ("license", r" +$", ""),
> > +        ("license", r"^ +", ""),
> > +        ("license", r" ", "-"),
> > +        ("license", r"^GNU-", ""),
> > +        ("license", r"-[Ll]icen[cs]e(,?-[Vv]ersion)?", ""),
> > +        ("license", r"^UNKNOWN$", ""),
> > +        # Remove currently unhandled version numbers from these
> variables
> > +        ("requires", r"\[[^\]]+\]$", ""),
> > +        ("requires", r"^([^><=3D ]+).*", r"\1"),
> > +        ("dependencies", r"\[[^\]]+\]$", ""),
> > +        ("dependencies", r"^([^><=3D ]+).*", r"\1"),
> > +    ]
> > +
> > +    build_backend_map =3D {
> > +        "setuptools.build_meta": "python_setuptools_build_meta",
> > +        "poetry.core.masonry.api": "python_poetry_core",
> > +        "flit_core.buildapi": "python_flit_core",
> > +    }
> > +
> > +    excluded_native_pkgdeps =3D [
> > +        # already provided by python_setuptools_build_meta.bbclass
> > +        "python3-setuptools-native",
> > +        "python3-wheel-native",
> > +        # already provided by python_poetry_core.bbclass
> > +        "python3-poetry-core-native",
> > +        # already provided by python_flit_core.bbclass
> > +        "python3-flit-core-native",
> > +    ]
> > +
> > +    # add here a list of known and often used packages and the
> corresponding bitbake package
> > +    known_deps_map =3D {
> > +        "setuptools": "python3-setuptools",
> > +        "wheel": "python3-wheel",
> > +        "poetry-core": "python3-poetry-core",
> > +        "flit_core": "python3-flit-core",
> > +        "setuptools-scm": "python3-setuptools-scm",
> > +    }
> > +
> > +    def __init__(self):
> > +        pass
> > +
> > +    def process(self, srctree, classes, lines_before, lines_after,
> handled, extravalues):
> > +        info =3D {}
> > +
> > +        if 'buildsystem' in handled:
> > +            return False
> > +
> > +        # Check for non-zero size setup.py files
> > +        setupfiles =3D RecipeHandler.checkfiles(srctree,
> ["pyproject.toml"])
> > +        for fn in setupfiles:
> > +            if os.path.getsize(fn):
> > +                break
> > +        else:
> > +            return False
> > +
> > +        setupscript =3D os.path.join(srctree, "pyproject.toml")
> > +
> > +        try:
> > +            config =3D self.parse_pyproject_toml(setupscript)
> > +            build_backend =3D config["build-system"]["build-backend"]
> > +            if build_backend in self.build_backend_map:
> > +                classes.append(self.build_backend_map[build_backend])
> > +            else:
> > +                logger.error(
> > +                    "Unsupported build-backend: %s, cannot use
> pyproject.toml. Will try to use legacy setup.py"
> > +                    % build_backend
> > +                )
> > +                return False
> > +
> > +            licfile =3D ""
> > +            if "project" in config:
> > +                for field, values in config["project"].items():
> > +                    if field =3D=3D "license":
> > +                        value =3D values.get("text", "")
> > +                        if not value:
> > +                            licfile =3D values.get("file", "")
> > +                    elif isinstance(values, dict):
> > +                        for k, v in values.items():
> > +                            info[k] =3D v
> > +                        continue
> > +                    else:
> > +                        value =3D values
> > +
> > +                    info[field] =3D value
> > +
> > +            # Grab the license value before applying replacements
> > +            license_str =3D info.get("license", "").strip()
> > +
> > +            if license_str:
> > +                for i, line in enumerate(lines_before):
> > +                    if line.startswith("##LICENSE_PLACEHOLDER##"):
> > +                        lines_before.insert(
> > +                            i, "# NOTE: License in pyproject.toml is:
> %s" % license_str
> > +                        )
> > +                        break
> > +
> > +            info["requires"] =3D config["build-system"]["requires"]
> > +
> > +            self.apply_info_replacements(info)
> > +
> > +            if "classifiers" in info:
> > +                license =3D self.handle_classifier_license(
> > +                    info["classifiers"], info.get("license", "")
> > +                )
> > +                if license:
> > +                    if licfile:
> > +                        lines =3D []
> > +                        md5value =3D
> bb.utils.md5_file(os.path.join(srctree, licfile))
> > +                        lines.append('LICENSE =3D "%s"' % license)
> > +                        lines.append(
> > +                            'LIC_FILES_CHKSUM =3D "file://%s;md5=3D%s"=
'
> > +                            % (licfile, md5value)
> > +                        )
> > +                        lines.append("")
> > +
> > +                        # Replace the placeholder so we get the values
> in the right place in the recipe file
> > +                        try:
> > +                            pos =3D
> lines_before.index("##LICENSE_PLACEHOLDER##")
> > +                        except ValueError:
> > +                            pos =3D -1
> > +                        if pos =3D=3D -1:
> > +                            lines_before.extend(lines)
> > +                        else:
> > +                            lines_before[pos : pos + 1] =3D lines
> > +
> > +                        handled.append(("license", [license, licfile,
> md5value]))
> > +                    else:
> > +                        info["license"] =3D license
> > +
> > +            provided_packages =3D self.parse_pkgdata_for_python_packag=
es()
> > +            provided_packages.update(self.known_deps_map)
> > +            native_mapped_deps, native_unmapped_deps =3D set(), set()
> > +            mapped_deps, unmapped_deps =3D set(), set()
> > +
> > +            if "requires" in info:
> > +                for require in info["requires"]:
> > +                    mapped =3D provided_packages.get(require)
> > +
> > +                    if mapped:
> > +                        logger.error("Mapped %s to %s" % (require,
> mapped))
> > +                        native_mapped_deps.add(mapped)
> > +                    else:
> > +                        logger.error("Could not map %s" % require)
> > +                        native_unmapped_deps.add(require)
> > +
> > +                info.pop("requires")
> > +
> > +                if native_mapped_deps !=3D set():
> > +                    native_mapped_deps =3D {
> > +                        item + "-native" for item in native_mapped_dep=
s
> > +                    }
> > +                    native_mapped_deps -=3D
> set(self.excluded_native_pkgdeps)
> > +                    if native_mapped_deps !=3D set():
> > +                        info["requires"] =3D "
> ".join(sorted(native_mapped_deps))
> > +
> > +                if native_unmapped_deps:
> > +                    lines_after.append("")
> > +                    lines_after.append(
> > +                        "# WARNING: We were unable to map the followin=
g
> python package/module"
> > +                    )
> > +                    lines_after.append(
> > +                        "# dependencies to the bitbake packages which
> include them:"
> > +                    )
> > +                    lines_after.extend(
> > +                        "#    {}".format(d) for d in
> sorted(native_unmapped_deps)
> > +                    )
> > +
> > +            if "dependencies" in info:
> > +                for dependency in info["dependencies"]:
> > +                    mapped =3D provided_packages.get(dependency)
> > +                    if mapped:
> > +                        logger.error("Mapped %s to %s" % (dependency,
> mapped))
> > +                        mapped_deps.add(mapped)
> > +                    else:
> > +                        logger.error("Could not map %s" % dependency)
> > +                        unmapped_deps.add(dependency)
> > +
> > +                info.pop("dependencies")
> > +
> > +                if mapped_deps !=3D set():
> > +                    if mapped_deps !=3D set():
> > +                        info["dependencies"] =3D "
> ".join(sorted(mapped_deps))
> > +
> > +                if unmapped_deps:
> > +                    lines_after.append("")
> > +                    lines_after.append(
> > +                        "# WARNING: We were unable to map the followin=
g
> python package/module"
> > +                    )
> > +                    lines_after.append(
> > +                        "# runtime dependencies to the bitbake package=
s
> which include them:"
> > +                    )
> > +                    lines_after.extend(
> > +                        "#    {}".format(d) for d in
> sorted(unmapped_deps)
> > +                    )
> > +
> > +            self.map_info_to_bbvar(info, extravalues)
> > +
> > +            handled.append("buildsystem")
> > +        except Exception:
> > +            logger.exception("Failed to parse pyproject.toml")
> > +            return False
> > +
> > +    def parse_pyproject_toml(self, setupscript):
> > +        with open(setupscript, "r") as f:
> > +            config =3D toml.load(f)
> > +        return config
> > +
> > +
> >  def gather_setup_info(fileobj):
> >      parsed =3D ast.parse(fileobj.read(), fileobj.name)
> >      visitor =3D SetupScriptVisitor()
> > @@ -769,5 +999,7 @@ def has_non_literals(value):
> >
> >
> >  def register_recipe_handlers(handlers):
> > -    # We need to make sure this is ahead of the makefile fallback
> handler
> > +    # We need to make sure these are ahead of the makefile fallback
> handler
> > +    # and the pyproject.toml handler ahead of the setup.py handler
> > +    handlers.append((PythonPyprojectTomlRecipeHandler(), 75))
> >      handlers.append((PythonSetupPyRecipeHandler(), 70))
> > --
> > 2.42.0
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189462):
> https://lists.openembedded.org/g/openembedded-core/message/189462
> Mute This Topic: https://lists.openembedded.org/mt/102055999/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005de2a20608126785
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 19, 2023 at 6:49=E2=80=AF=
AM Alexandre Belloni via <a href=3D"http://lists.openembedded.org">lists.op=
enembedded.org</a> &lt;alexandre.belloni=3D<a href=3D"mailto:bootlin.com@li=
sts.openembedded.org">bootlin.com@lists.openembedded.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On 19/10/2023 09:36:53+0200, Julien Stephan wrote:<br>
&gt; add support for PEP517 [1]<br>
&gt; <br>
&gt; if a pyproject.toml file is found, use it to create the recipe,<br>
&gt; otherwise fallback to the old setup.py method.<br>
&gt; <br>
&gt; [YOCTO #14737]<br>
&gt; <br>
&gt; [1]: <a href=3D"https://peps.python.org/pep-0517/" rel=3D"noreferrer" =
target=3D"_blank">https://peps.python.org/pep-0517/</a><br>
&gt; <br>
&gt; Signed-off-by: Julien Stephan &lt;<a href=3D"mailto:jstephan@baylibre.=
com" target=3D"_blank">jstephan@baylibre.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../lib/recipetool/create_buildsys_python.py=C2=A0 | 234 +++++++=
++++++++++-<br>
&gt;=C2=A0 1 file changed, 233 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/script=
s/lib/recipetool/create_buildsys_python.py<br>
&gt; index 69f6f5ca511..0b601d50a4b 100644<br>
&gt; --- a/scripts/lib/recipetool/create_buildsys_python.py<br>
&gt; +++ b/scripts/lib/recipetool/create_buildsys_python.py<br>
&gt; @@ -18,6 +18,7 @@ import os<br>
&gt;=C2=A0 import re<br>
&gt;=C2=A0 import sys<br>
&gt;=C2=A0 import subprocess<br>
&gt; +import toml<br>
<br>
This fails on the autobuilders because we don&#39;t have the toml module in=
stalled so I guess you need to add a dependency.<br>
<br></blockquote><div><br></div><div>Starting in Python 3.11, we have tomll=
ib</div><div><a href=3D"https://docs.python.org/3/library/tomllib.html">htt=
ps://docs.python.org/3/library/tomllib.html</a></div><div><br></div><div>Ho=
wever, we currently pin the minimum Python version at 3.8:</div><div><a hre=
f=3D"https://git.yoctoproject.org/poky/tree/bitbake/lib/bb/__init__.py#n15"=
>https://git.yoctoproject.org/poky/tree/bitbake/lib/bb/__init__.py#n15</a><=
br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 from recipetool.create import RecipeHandler<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 logger =3D logging.getLogger(&#39;recipetool&#39;)<br>
&gt; @@ -656,6 +657,235 @@ class PythonSetupPyRecipeHandler(PythonRecipeHan=
dler):<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 handled.append(&#39;buildsystem&#39;=
)<br>
&gt;=C2=A0 <br>
&gt; +class PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;Base class to support PEP517 and PEP5=
18<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 PEP517 <a href=3D"https://peps.python.org/pep-0517/#sou=
rce-trees" rel=3D"noreferrer" target=3D"_blank">https://peps.python.org/pep=
-0517/#source-trees</a><br>
&gt; +=C2=A0 =C2=A0 PEP518 <a href=3D"https://peps.python.org/pep-0518/#bui=
ld-system-table" rel=3D"noreferrer" target=3D"_blank">https://peps.python.o=
rg/pep-0518/#build-system-table</a><br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # PEP621: <a href=3D"https://packaging.python.org/en/la=
test/specifications/declaring-project-metadata/" rel=3D"noreferrer" target=
=3D"_blank">https://packaging.python.org/en/latest/specifications/declaring=
-project-metadata/</a><br>
&gt; +=C2=A0 =C2=A0 # add only the ones that map to a BB var<br>
&gt; +=C2=A0 =C2=A0 # potentially missing: optional-dependencies<br>
&gt; +=C2=A0 =C2=A0 bbvar_map =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;PN&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;version&quot;: &quot;PV&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Homepage&quot;: &quot;HOMEPAGE&quot=
;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;description&quot;: &quot;SUMMARY&qu=
ot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;license&quot;: &quot;LICENSE&quot;,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;dependencies&quot;: &quot;RDEPENDS:=
${PN}&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;requires&quot;: &quot;DEPENDS&quot;=
,<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 replacements =3D [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;license&quot;, r&quot; +$&quot;, &=
quot;&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;license&quot;, r&quot;^ +&quot;, &=
quot;&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;license&quot;, r&quot; &quot;, &qu=
ot;-&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;license&quot;, r&quot;^GNU-&quot;,=
 &quot;&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;license&quot;, r&quot;-[Ll]icen[cs=
]e(,?-[Vv]ersion)?&quot;, &quot;&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;license&quot;, r&quot;^UNKNOWN$&qu=
ot;, &quot;&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove currently unhandled version numb=
ers from these variables<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;requires&quot;, r&quot;\[[^\]]+\]$=
&quot;, &quot;&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;requires&quot;, r&quot;^([^&gt;&lt=
;=3D ]+).*&quot;, r&quot;\1&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;dependencies&quot;, r&quot;\[[^\]]=
+\]$&quot;, &quot;&quot;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;dependencies&quot;, r&quot;^([^&gt=
;&lt;=3D ]+).*&quot;, r&quot;\1&quot;),<br>
&gt; +=C2=A0 =C2=A0 ]<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 build_backend_map =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;setuptools.build_meta&quot;: &quot;=
python_setuptools_build_meta&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;poetry.core.masonry.api&quot;: &quo=
t;python_poetry_core&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;flit_core.buildapi&quot;: &quot;pyt=
hon_flit_core&quot;,<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 excluded_native_pkgdeps =3D [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # already provided by python_setuptools_b=
uild_meta.bbclass<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;python3-setuptools-native&quot;,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;python3-wheel-native&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # already provided by python_poetry_core.=
bbclass<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;python3-poetry-core-native&quot;,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # already provided by python_flit_core.bb=
class<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;python3-flit-core-native&quot;,<br>
&gt; +=C2=A0 =C2=A0 ]<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # add here a list of known and often used packages and =
the corresponding bitbake package<br>
&gt; +=C2=A0 =C2=A0 known_deps_map =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;setuptools&quot;: &quot;python3-set=
uptools&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;wheel&quot;: &quot;python3-wheel&qu=
ot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;poetry-core&quot;: &quot;python3-po=
etry-core&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;flit_core&quot;: &quot;python3-flit=
-core&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;setuptools-scm&quot;: &quot;python3=
-setuptools-scm&quot;,<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def __init__(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def process(self, srctree, classes, lines_before, lines=
_after, handled, extravalues):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 info =3D {}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;buildsystem&#39; in handled:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return False<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check for non-zero size setup.py files<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 setupfiles =3D RecipeHandler.checkfiles(s=
rctree, [&quot;pyproject.toml&quot;])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for fn in setupfiles:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.getsize(fn):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return False<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 setupscript =3D os.path.join(srctree, &qu=
ot;pyproject.toml&quot;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config =3D self.parse_pypro=
ject_toml(setupscript)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build_backend =3D config[&q=
uot;build-system&quot;][&quot;build-backend&quot;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if build_backend in self.bu=
ild_backend_map:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 classes.appen=
d(self.build_backend_map[build_backend])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.error(=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;Unsupported build-backend: %s, cannot use pyproject.toml. Will try t=
o use legacy setup.py&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 % build_backend<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return False<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 licfile =3D &quot;&quot;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;project&quot; in c=
onfig:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for field, va=
lues in config[&quot;project&quot;].items():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if field =3D=3D &quot;license&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 value =3D values.get(&quot;text&quot;, &quot;&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 if not value:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 licfile =3D values.get(&quot;file&quot;, &quot=
;&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 elif isinstance(values, dict):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 for k, v in values.items():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info[k] =3D v<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 continue<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 value =3D values<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 info[field] =3D value<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Grab the license value be=
fore applying replacements<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 license_str =3D info.get(&q=
uot;license&quot;, &quot;&quot;).strip()<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if license_str:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i, line i=
n enumerate(lines_before):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if line.startswith(&quot;##LICENSE_PLACEHOLDER##&quot;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 lines_before.insert(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i, &quot;# NOTE: License in pyproject.toml is:=
 %s&quot; % license_str<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 break<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info[&quot;requires&quot;] =
=3D config[&quot;build-system&quot;][&quot;requires&quot;]<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.apply_info_replacement=
s(info)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;classifiers&quot; =
in info:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 license =3D s=
elf.handle_classifier_license(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 info[&quot;classifiers&quot;], info.get(&quot;license&quot;, &quot;&quot;)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if license:<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if licfile:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 lines =3D []<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 md5value =3D bb.utils.md5_file(os.path.join(srctree, licfile=
))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 lines.append(&#39;LICENSE =3D &quot;%s&quot;&#39; % license)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 lines.append(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;LIC_FILES_CHKSUM =3D &quot;file://%s;md5=
=3D%s&quot;&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 % (licfile, md5value)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 lines.append(&quot;&quot;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 # Replace the placeholder so we get the values in the right =
place in the recipe file<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pos =3D lines_before.index(&quot;##LICENSE_PLA=
CEHOLDER##&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 except ValueError:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pos =3D -1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 if pos =3D=3D -1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lines_before.extend(lines)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lines_before[pos : pos + 1] =3D lines<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 handled.append((&quot;license&quot;, [license, licfile, md5v=
alue]))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 info[&quot;license&quot;] =3D license<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 provided_packages =3D self.=
parse_pkgdata_for_python_packages()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 provided_packages.update(se=
lf.known_deps_map)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 native_mapped_deps, native_=
unmapped_deps =3D set(), set()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mapped_deps, unmapped_deps =
=3D set(), set()<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;requires&quot; in =
info:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for require i=
n info[&quot;requires&quot;]:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 mapped =3D provided_packages.get(require)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if mapped:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 logger.error(&quot;Mapped %s to %s&quot; % (require, mapped)=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 native_mapped_deps.add(mapped)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 logger.error(&quot;Could not map %s&quot; % require)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 native_unmapped_deps.add(require)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.pop(&quo=
t;requires&quot;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if native_map=
ped_deps !=3D set():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 native_mapped_deps =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 item + &quot;-native&quot; for item in native_mapped_deps<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 native_mapped_deps -=3D set(self.excluded_native_pkgdeps)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if native_mapped_deps !=3D set():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 info[&quot;requires&quot;] =3D &quot; &quot;.join(sorted(nat=
ive_mapped_deps))<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if native_unm=
apped_deps:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 lines_after.append(&quot;&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 lines_after.append(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;# WARNING: We were unable to map the following python =
package/module&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 lines_after.append(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;# dependencies to the bitbake packages which include t=
hem:&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 lines_after.extend(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;#=C2=A0 =C2=A0 {}&quot;.format(d) for d in sorted(nati=
ve_unmapped_deps)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 )<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;dependencies&quot;=
 in info:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for dependenc=
y in info[&quot;dependencies&quot;]:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 mapped =3D provided_packages.get(dependency)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if mapped:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 logger.error(&quot;Mapped %s to %s&quot; % (dependency, mapp=
ed))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 mapped_deps.add(mapped)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 logger.error(&quot;Could not map %s&quot; % dependency)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 unmapped_deps.add(dependency)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.pop(&quo=
t;dependencies&quot;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if mapped_dep=
s !=3D set():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if mapped_deps !=3D set():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 info[&quot;dependencies&quot;] =3D &quot; &quot;.join(sorted=
(mapped_deps))<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if unmapped_d=
eps:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 lines_after.append(&quot;&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 lines_after.append(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;# WARNING: We were unable to map the following python =
package/module&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 lines_after.append(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;# runtime dependencies to the bitbake packages which i=
nclude them:&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 lines_after.extend(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &quot;#=C2=A0 =C2=A0 {}&quot;.format(d) for d in sorted(unma=
pped_deps)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 )<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.map_info_to_bbvar(info=
, extravalues)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 handled.append(&quot;builds=
ystem&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.exception(&quot;Fail=
ed to parse pyproject.toml&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return False<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def parse_pyproject_toml(self, setupscript):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(setupscript, &quot;r&quot;) as =
f:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config =3D toml.load(f)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return config<br>
&gt; +<br>
&gt; +<br>
&gt;=C2=A0 def gather_setup_info(fileobj):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 parsed =3D ast.parse(fileobj.read(), <a href=3D"ht=
tp://fileobj.name" rel=3D"noreferrer" target=3D"_blank">fileobj.name</a>)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 visitor =3D SetupScriptVisitor()<br>
&gt; @@ -769,5 +999,7 @@ def has_non_literals(value):<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 def register_recipe_handlers(handlers):<br>
&gt; -=C2=A0 =C2=A0 # We need to make sure this is ahead of the makefile fa=
llback handler<br>
&gt; +=C2=A0 =C2=A0 # We need to make sure these are ahead of the makefile =
fallback handler<br>
&gt; +=C2=A0 =C2=A0 # and the pyproject.toml handler ahead of the setup.py =
handler<br>
&gt; +=C2=A0 =C2=A0 handlers.append((PythonPyprojectTomlRecipeHandler(), 75=
))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 handlers.append((PythonSetupPyRecipeHandler(), 70)=
)<br>
&gt; -- <br>
&gt; 2.42.0<br>
&gt; <br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#189462): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/189462" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/189462</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102055999/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/102055999/924729</a><br>
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

--0000000000005de2a20608126785--

