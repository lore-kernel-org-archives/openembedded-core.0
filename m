Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C7EC433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 21:02:19 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.3983.1637787738372202297
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:02:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VzBcfxbr;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id 14so4920805ioe.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cVh6bsu6U+CrfiLGD1gC4hM6gMMqcdYooTZ/MnnGniA=;
        b=VzBcfxbr+pOlj21ajewhwi4CR+2fRqVpCfayYG5FYVyJT79fxQvWLDZqViVk1mK1qy
         jhU6Pnmk+bXcHlmlowFBIbN/9cnrDp0ZaEXKDdF4vVxdPfH1rd8VqWAfqu6V23iTdKG+
         YPbDf7DgRe859tsRXWdwWZ8SeJ9zQ3X9EnfEsVZs9iqyEZrCQ64QtYv1ZXP1FOW7+Llr
         DC3t5NFWwYHVJpiLAKv2fI04+TVgaC5e13iOpjNTA0iz/U84M8MxwV1ISeDi7WHp++RR
         X6mT5owKQm78J91pRDFe1G3Iu17Wd6PP9fhfIKCPHeltGop9AneES5fI1ObEV8DcPfWZ
         zfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cVh6bsu6U+CrfiLGD1gC4hM6gMMqcdYooTZ/MnnGniA=;
        b=69yt4strPzu+u37zr5UtkSch3o0758DzHM9LsARjlPOU3RNlkUpMfBxpNNqUKDFy/L
         2GuysuyjHiQtl0Ep6MOP+j1Uo5ZFzDePUPDzzP5apnVpOtJu2HR+J4dnhB38UL5re8h5
         ovpAT0uTcMG0Ps5eNvxwAW3/bbRg8v3TzCts89WzfjQKmAk2eX/y3geWh/EbJvRsHfKL
         dI3HPjzKzW/QrLH+tad+KUHt7qzymQUbfisUhJjheXdMRKc55DJGbiSXxHGGbFduD+GO
         nNYsq6kvjmAfdOOtoby/tP0M0LtZXohSFXksTW9mfiaSqmDDeeFX6FamdebSWlG/kjUR
         T23g==
X-Gm-Message-State: AOAM530gL9B7OlCoPaNG/u7oXp83Zvs5MeLCe0wk7Nl6U2D41VMqHy3z
	JULMB7N25f4jvwrAk0F5F4NAcLU7w8unNycW2Ek=
X-Google-Smtp-Source: 
 ABdhPJwLgbFijRHYQgXfs3XCB0wAMcwhpyQ93IcPO1cJxNhy1NaaSgoALjt+PyLsnUDYqIVhaF/rD2LqTCj/WRbHKJU=
X-Received: by 2002:a02:c053:: with SMTP id u19mr20406943jam.5.1637787737245;
 Wed, 24 Nov 2021 13:02:17 -0800 (PST)
MIME-Version: 1.0
References: 
 <AM9PR09MB46426836B8FC0FACE562A084A8619@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB46426836B8FC0FACE562A084A8619@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 24 Nov 2021 13:02:06 -0800
Message-ID: 
 <CANx9H-BnuuwVojhz5SGZqN97oj1VhoDLZ0W7ZBO=v5J0tXoS_w@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH 1/2] distutils3-legacy: fallback for
 missing setup.py
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004bca1d05d18f2c56"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 21:02:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158745

--0000000000004bca1d05d18f2c56
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 24, 2021 at 12:15 PM Konrad Weihmann <kweihmann@outlook.com>
wrote:

> add a bbclass to disutils3 that generates a fallback setup.py in case
> there is no setup.py available in the source dir, but a setup.cfg.
>

I=E2=80=99ll check this out later, but I do want to highlight that we will =
be
deprecating distutils bbclasses (and moving them to meta-python for
continuity).

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14610


We can refactor this series into the refactored setuptools3.bbclass (sans
distutils). I will do this if we merge these changes.

https://git.yoctoproject.org/poky-contrib/log/?h=3Dtimo/nodistutils_14610

I=E2=80=99d like to hear what concerns others have.


> Use the mapping provided by
> https://setuptools.pypa.io/en/latest/userguide/declarative_config.html
> to translate the most essential items to legacy setuptools.setup
> dictitonary.
>
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/classes/distutils3-legacy.bbclass | 112 +++++++++++++++++++++++++
>  meta/classes/distutils3.bbclass        |   1 +
>  2 files changed, 113 insertions(+)
>  create mode 100644 meta/classes/distutils3-legacy.bbclass
>
> diff --git a/meta/classes/distutils3-legacy.bbclass
> b/meta/classes/distutils3-legacy.bbclass
> new file mode 100644
> index 0000000000..266d30138f
> --- /dev/null
> +++ b/meta/classes/distutils3-legacy.bbclass
> @@ -0,0 +1,112 @@
> +# Helper to create a trimmed down setup.py from information found in
> +# setup.cfg, in case there is no setup.py shipped with the sources
> +
> +# this functionality can be safely removed once the pypa community
> +# comes up with a safe replacement for the functionality found in
> distutils3.bbclass
> +
> +def distutils_legacy_package_name(d):
> +    # use pypi name or fall back to BPN
> +    return d.getVar("PYPI_PACKAGE") or d.getVar('BPN').replace('python-'=
,
> '').replace('python3-', '')
> +
> +DISTUTILS_LEGACY_VERSION ?=3D "${PV}"
> +DISTUTILS_LEGACY_NAME ?=3D "${@distutils_legacy_package_name(d)}"
> +
> +python do_create_setup_py_legacy() {
> +    import os
> +
> +    if os.path.exists(os.path.join(d.getVar("DISTUTILS_SETUP_PATH"),
> "setup.py")):
> +        return
> +
> +    from configparser import ConfigParser, NoOptionError, NoSectionError=
,
> ParsingError
> +    import re
> +
> +    config =3D ConfigParser()
> +    try:
> +        config.read(os.path.join(d.getVar("DISTUTILS_SETUP_PATH"),
> "setup.cfg"))
> +    except FileNotFoundError:
> +        return
> +
> +    def _strip(x):
> +        return re.sub(r"\s|\t|\n", "", x)
> +
> +    def get_section(section):
> +        try:
> +            return dict(config.items(section=3Dsection))
> +        except (NoSectionError, ParsingError):
> +            return None
> +
> +    def get_option(section, option):
> +        try:
> +            return config.get(section=3Dsection, option=3Doption)
> +        except (NoOptionError, NoSectionError, ParsingError):
> +            return None
> +
> +    def extract_bool(section, option, default):
> +        _option =3D get_option(section, option)
> +        if _option is None:
> +            return default
> +        return bool(_strip(_option))
> +
> +    def extract_str(section, option, default):
> +        _option =3D get_option(section, option)
> +        if _option is None:
> +            return default
> +        return _strip(_option)
> +
> +    def extract_dict_vallist(section, default, delim=3D""):
> +        _section =3D get_section(section)
> +        if _section is None:
> +            return default
> +        return {_strip(k): [_strip(x) for x in re.split(delim, v)] if
> delim else [ _strip(v) ] for k, v in _section.items()}
> +
> +    def extract_dict(section, default):
> +        _section =3D get_section(section)
> +        if _section is None:
> +            return default
> +        return {_strip(k): _strip(v) for k, v in _section.items()}
> +
> +    def extract_list(section, option, default, delim):
> +        _option =3D get_option(section, option)
> +        if _option is None:
> +            return default
> +        bb.warn("%s:%s -> %s" % (section, option, _option))
> +        _listitems =3D re.split(delim, _option) if delim else [_option]
> +        return [_strip(x) for x in _listitems]
> +
> +    def quote(x):
> +        return '"%s"' % x
> +
> +    _pkginfo =3D {
> +        "entry_points": extract_dict_vallist("options.entry_points", {})=
,
> +        "include_package_data": extract_bool("options",
> "include_package_data", False),
> +        "name": quote(extract_str("options", "name",
> d.getVar("DISTUTILS_LEGACY_NAME"))),
> +        "package_data": extract_dict_vallist("options.package_data", {},
> r"\s+|,"),
> +        "packages": extract_list("options", "packages", [], ""),
> +        "version": quote(d.getVar("DISTUTILS_LEGACY_VERSION")),
> +        "zip_safe": extract_bool("options", "zip_safe", False),
> +        "install_requires": extract_list("options", "install_requires",
> [], r"\t+|\n+"),
> +        "python_requires": quote(extract_str("options",
> "python_requires", ">0.0")),
> +        "package_dir": extract_dict("package_dir", {}),
> +        "py_modules": extract_list("options", "py_modules", [], r"\s+|,"=
),
> +    }
> +
> +    # In case packages is using :find module
> +    # we need to look for top level directories containing a __init__.py
> +    if _pkginfo["packages"] =3D=3D ["find:"]:
> +        # top level search dir can be adjusted by options.packages.find
> option
> +        _path =3D extract_str("options.packages.find", "where", "")
> +        _pkginfo["packages"] =3D set(x.name for x in
> os.scandir(os.path.join(
> +            d.getVar("DISTUTILS_SETUP_PATH"), _path)) if os.path.isdir(x=
)
> and os.path.exists(os.path.join(x, "__init__.py")))
> +
> +    with open(os.path.join(d.getVar("DISTUTILS_SETUP_PATH"), "setup.py")=
,
> "w") as o:
> +        o.write("import setuptools\n")
> +        o.write("setuptools.setup(\n")
> +        for k, v in _pkginfo.items():
> +            o.write("%s =3D %s,\n" % (str(k), str(v)))
> +        o.write(")")
> +
> +
> +}
> +
> +do_create_setup_py_legacy[doc] =3D "Create a fallback version of legacy
> setup.py if not existing"
> +addtask do_create_setup_py_legacy before do_configure after do_patch
> do_prepare_recipe_sysroot
> diff --git a/meta/classes/distutils3.bbclass
> b/meta/classes/distutils3.bbclass
> index be645d37bd..f26f0d5184 100644
> --- a/meta/classes/distutils3.bbclass
> +++ b/meta/classes/distutils3.bbclass
> @@ -1,4 +1,5 @@
>  inherit distutils3-base
> +inherit distutils3-legacy
>
>  B =3D "${WORKDIR}/build"
>  distutils_do_configure[cleandirs] =3D "${B}"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158741):
> https://lists.openembedded.org/g/openembedded-core/message/158741
> Mute This Topic: https://lists.openembedded.org/mt/87289428/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004bca1d05d18f2c56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div><br></div><div><br><div class=3D"gmail_quote"></div></div></div><=
div><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 24, 2021 at 12:15 PM =
Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com" target=3D"_bla=
nk">kweihmann@outlook.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">add a bb=
class to disutils3 that generates a fallback setup.py in case<br>
there is no setup.py available in the source dir, but a setup.cfg.<br>
</blockquote><div dir=3D"auto"><br></div></div><div><div dir=3D"auto">I=E2=
=80=99ll check this out later, but I do want to highlight that we will be d=
eprecating distutils bbclasses (and moving them to meta-python for continui=
ty).</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div><a href=3D"htt=
ps://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14610" target=3D"_blank">h=
ttps://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14610</a></div><br></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">We can refactor this series =
into the refactored setuptools3.bbclass (sans distutils). I will do this if=
 we merge these changes.</div></div><div><div><div class=3D"gmail_quote"><d=
iv dir=3D"auto"><br></div><div dir=3D"auto"><div><a href=3D"https://git.yoc=
toproject.org/poky-contrib/log/?h=3Dtimo/nodistutils_14610">https://git.yoc=
toproject.org/poky-contrib/log/?h=3Dtimo/nodistutils_14610</a></div><div di=
r=3D"auto"><br></div></div><div dir=3D"auto">I=E2=80=99d like to hear what =
concerns others have.</div><div dir=3D"auto"><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br=
>
Use the mapping provided by<br>
<a href=3D"https://setuptools.pypa.io/en/latest/userguide/declarative_confi=
g.html" rel=3D"noreferrer" target=3D"_blank">https://setuptools.pypa.io/en/=
latest/userguide/declarative_config.html</a><br>
to translate the most essential items to legacy setuptools.setup<br>
dictitonary.<br>
<br>
Signed-off-by: Konrad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com"=
 target=3D"_blank">kweihmann@outlook.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/distutils3-legacy.bbclass | 112 ++++++++++++++++++++++++=
+<br>
=C2=A0meta/classes/distutils3.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
=C2=A02 files changed, 113 insertions(+)<br>
=C2=A0create mode 100644 meta/classes/distutils3-legacy.bbclass<br>
<br>
diff --git a/meta/classes/distutils3-legacy.bbclass b/meta/classes/distutil=
s3-legacy.bbclass<br>
new file mode 100644<br>
index 0000000000..266d30138f<br>
--- /dev/null<br>
+++ b/meta/classes/distutils3-legacy.bbclass<br>
@@ -0,0 +1,112 @@<br>
+# Helper to create a trimmed down setup.py from information found in<br>
+# setup.cfg, in case there is no setup.py shipped with the sources<br>
+<br>
+# this functionality can be safely removed once the pypa community<br>
+# comes up with a safe replacement for the functionality found in distutil=
s3.bbclass<br>
+<br>
+def distutils_legacy_package_name(d):<br>
+=C2=A0 =C2=A0 # use pypi name or fall back to BPN<br>
+=C2=A0 =C2=A0 return d.getVar(&quot;PYPI_PACKAGE&quot;) or d.getVar(&#39;B=
PN&#39;).replace(&#39;python-&#39;, &#39;&#39;).replace(&#39;python3-&#39;,=
 &#39;&#39;)<br>
+<br>
+DISTUTILS_LEGACY_VERSION ?=3D &quot;${PV}&quot;<br>
+DISTUTILS_LEGACY_NAME ?=3D &quot;${@distutils_legacy_package_name(d)}&quot=
;<br>
+<br>
+python do_create_setup_py_legacy() {<br>
+=C2=A0 =C2=A0 import os <br>
+<br>
+=C2=A0 =C2=A0 if os.path.exists(os.path.join(d.getVar(&quot;DISTUTILS_SETU=
P_PATH&quot;), &quot;setup.py&quot;)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 from configparser import ConfigParser, NoOptionError, NoSect=
ionError, ParsingError<br>
+=C2=A0 =C2=A0 import re<br>
+<br>
+=C2=A0 =C2=A0 config =3D ConfigParser()<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 config.read(os.path.join(d.getVar(&quot;DISTUT=
ILS_SETUP_PATH&quot;), &quot;setup.cfg&quot;))<br>
+=C2=A0 =C2=A0 except FileNotFoundError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
+=C2=A0 =C2=A0 def _strip(x):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return re.sub(r&quot;\s|\t|\n&quot;, &quot;&qu=
ot;, x)<br>
+<br>
+=C2=A0 =C2=A0 def get_section(section):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return dict(config.items(section=
=3Dsection))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except (NoSectionError, ParsingError):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
+<br>
+=C2=A0 =C2=A0 def get_option(section, option):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return config.get(section=3Dsect=
ion, option=3Doption)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 except (NoOptionError, NoSectionError, Parsing=
Error):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return None<br>
+<br>
+=C2=A0 =C2=A0 def extract_bool(section, option, default):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 _option =3D get_option(section, option)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if _option is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return bool(_strip(_option))<br>
+<br>
+=C2=A0 =C2=A0 def extract_str(section, option, default):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 _option =3D get_option(section, option)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if _option is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return _strip(_option)<br>
+<br>
+=C2=A0 =C2=A0 def extract_dict_vallist(section, default, delim=3D&quot;&qu=
ot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 _section =3D get_section(section)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if _section is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return {_strip(k): [_strip(x) for x in re.spli=
t(delim, v)] if delim else [ _strip(v) ] for k, v in _section.items()}<br>
+<br>
+=C2=A0 =C2=A0 def extract_dict(section, default):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 _section =3D get_section(section)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if _section is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return {_strip(k): _strip(v) for k, v in _sect=
ion.items()}<br>
+<br>
+=C2=A0 =C2=A0 def extract_list(section, option, default, delim):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 _option =3D get_option(section, option)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if _option is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return default<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;%s:%s -&gt; %s&quot; % (section,=
 option, _option))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 _listitems =3D re.split(delim, _option) if del=
im else [_option]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return [_strip(x) for x in _listitems]<br>
+<br>
+=C2=A0 =C2=A0 def quote(x):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;&quot;%s&quot;&#39; % x<br>
+<br>
+=C2=A0 =C2=A0 _pkginfo =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;entry_points&quot;: extract_dict_vallist=
(&quot;options.entry_points&quot;, {}),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;include_package_data&quot;: extract_bool=
(&quot;options&quot;, &quot;include_package_data&quot;, False),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: quote(extract_str(&quot;opti=
ons&quot;, &quot;name&quot;, d.getVar(&quot;DISTUTILS_LEGACY_NAME&quot;))),=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;package_data&quot;: extract_dict_vallist=
(&quot;options.package_data&quot;, {}, r&quot;\s+|,&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;packages&quot;: extract_list(&quot;optio=
ns&quot;, &quot;packages&quot;, [], &quot;&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;version&quot;: quote(d.getVar(&quot;DIST=
UTILS_LEGACY_VERSION&quot;)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;zip_safe&quot;: extract_bool(&quot;optio=
ns&quot;, &quot;zip_safe&quot;, False),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;install_requires&quot;: extract_list(&qu=
ot;options&quot;, &quot;install_requires&quot;, [], r&quot;\t+|\n+&quot;),<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;python_requires&quot;: quote(extract_str=
(&quot;options&quot;, &quot;python_requires&quot;, &quot;&gt;0.0&quot;)),<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;package_dir&quot;: extract_dict(&quot;pa=
ckage_dir&quot;, {}),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;py_modules&quot;: extract_list(&quot;opt=
ions&quot;, &quot;py_modules&quot;, [], r&quot;\s+|,&quot;),<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 # In case packages is using :find module<br>
+=C2=A0 =C2=A0 # we need to look for top level directories containing a __i=
nit__.py<br>
+=C2=A0 =C2=A0 if _pkginfo[&quot;packages&quot;] =3D=3D [&quot;find:&quot;]=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # top level search dir can be adjusted by opti=
ons.packages.find option<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 _path =3D extract_str(&quot;options.packages.f=
ind&quot;, &quot;where&quot;, &quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 _pkginfo[&quot;packages&quot;] =3D set(<a href=
=3D"http://x.name" rel=3D"noreferrer" target=3D"_blank">x.name</a> for x in=
 os.scandir(os.path.join(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar(&quot;DISTUTILS_SETUP_P=
ATH&quot;), _path)) if os.path.isdir(x) and os.path.exists(os.path.join(x, =
&quot;__init__.py&quot;)))<br>
+<br>
+=C2=A0 =C2=A0 with open(os.path.join(d.getVar(&quot;DISTUTILS_SETUP_PATH&q=
uot;), &quot;setup.py&quot;), &quot;w&quot;) as o:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 o.write(&quot;import setuptools\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 o.write(&quot;setuptools.setup(\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for k, v in _pkginfo.items():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 o.write(&quot;%s =3D %s,\n&quot;=
 % (str(k), str(v)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 o.write(&quot;)&quot;)<br>
+<br>
+=C2=A0 =C2=A0 <br>
+}<br>
+<br>
+do_create_setup_py_legacy[doc] =3D &quot;Create a fallback version of lega=
cy setup.py if not existing&quot;<br>
+addtask do_create_setup_py_legacy before do_configure after do_patch do_pr=
epare_recipe_sysroot<br>
diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbcl=
ass<br>
index be645d37bd..f26f0d5184 100644<br>
--- a/meta/classes/distutils3.bbclass<br>
+++ b/meta/classes/distutils3.bbclass<br>
@@ -1,4 +1,5 @@<br>
=C2=A0inherit distutils3-base<br>
+inherit distutils3-legacy<br>
<br>
=C2=A0B =3D &quot;${WORKDIR}/build&quot;<br>
=C2=A0distutils_do_configure[cleandirs] =3D &quot;${B}&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158741): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158741" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158741</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87289428/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
87289428/924729</a><br>
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
</div>

--0000000000004bca1d05d18f2c56--

