Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86952C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 15:30:46 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.web09.82.1637767845703148913
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 07:30:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lHgm8WQS;
 spf=pass (domain: gmail.com, ip: 209.85.221.169,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f169.google.com with SMTP id f7so1764108vkf.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 07:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SR13LQYxt7Mn74lvbz8jb60W9ndhqyxIqpF1/lE22dY=;
        b=lHgm8WQSpoeiFcMMUm5hPBH5kLPMCgYJ0QfUImOPJPsZw9bZvnsMCgbBTzE7vzHwhr
         HZhQBwqow2XYPfk581v9oEu368Q/su7tAPJtBQfAfTaLukmyXhs9bRubULwkFpR81q1Q
         1LyuJ69IMQCmCS9NXfydREw99XSf/sOCHCqHJYQZURIVee8btcurMGxjBUnYsEaJugc/
         i1E3lA7ACe3Mzh2HwhquxMGIG36oNwae8Lo0epXVh9w1vgsbeHvbVIKbVKHt+il+Wzir
         ErvPcs/7TG9XZ0KdrkCmNZ6+8/aUQsOf5uRnwdBZQ1iN9qdkyHXDMUNSxcVVoP2D9r3V
         SS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SR13LQYxt7Mn74lvbz8jb60W9ndhqyxIqpF1/lE22dY=;
        b=NPDD33ix/Etkij4wEXj0D6g9s/sdo2U/+QADTnA38RQLY4tSSHEtySRLkEzfETn7+y
         6m7+BdMZCORBWktNU1nfupNhFQmUvDPR6VF8SCJHUXm1N5g8cAUd5mOKP1SjEuAhYIOE
         AL2XLAWVRlMiORVd+igWmvCaCSbBXKjVynNuQh3jBwn8Ne6ZmPW4NdhRAJ6Itwk6KrVr
         srubD3/6omd98T2bJsyzVCDAmirfn/9b03llRqH2qEAcUC+iL9hYCbyEoVdCxFfnCOC9
         hA5dQ/ELlAYu8CGZVV+DzzeefXp16S9FuEdPtmlxXH3J0RFfaiXOvUu8YQXDMqGH2SJ7
         ihmQ==
X-Gm-Message-State: AOAM533CMkv+E0RGAkpJ1bzKJGPClCeKN3n1Nq9XXAsmIGBC1lH+nq1z
	9fFuILSbVBZSi87K/OccmCoF6Ai/3IdRUZHlCxg=
X-Google-Smtp-Source: 
 ABdhPJw8Gf2HrQguZsFGybt57bOTq1tTOuGqKFg323G2uJ89y2tO5Cwd6md27o+WQdMKNfGooNVAN4zBJhmRohzeLkc=
X-Received: by 2002:a1f:b697:: with SMTP id g145mr28698510vkf.1.1637767844844;
 Wed, 24 Nov 2021 07:30:44 -0800 (PST)
MIME-Version: 1.0
References: <20211124144739.2250-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20211124144739.2250-13-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <20211124144739.2250-13-stefan.herbrechtsmeier-oss@weidmueller.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Nov 2021 16:30:32 +0100
Message-ID: 
 <CANNYZj8pXgO7FuwmzjXE_SU7PgYNbSTmZvSC86zFMwvz1sajag@mail.gmail.com>
Subject: Re: [RFC PATCH 12/15] recipetool: npm: Add dependencies to SRC_URI
 and auto select classes
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>,
 Konrad Weihmann <kweihmann@outlook.com>,
	Martin Koppehel <martin@mko.dev>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="0000000000009dd75a05d18a8a6b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 15:30:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158721

--0000000000009dd75a05d18a8a6b
Content-Type: text/plain; charset="UTF-8"

A description of the changes and how the new code works is missing. How is
the SRC_URI formed? How is the appropriate class selected?

Alex

On Wed, 24 Nov 2021 at 15:48, Stefan Herbrechtsmeier <
stefan.herbrechtsmeier-oss@weidmueller.com> wrote:

> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
> Signed-off-by: Stefan Herbrechtsmeier <
> stefan.herbrechtsmeier@weidmueller.com>
>
> ---
>
>  scripts/lib/recipetool/create_npm.py | 243 ++++++++++++++++++++++++---
>  1 file changed, 222 insertions(+), 21 deletions(-)
>
> diff --git a/scripts/lib/recipetool/create_npm.py
> b/scripts/lib/recipetool/create_npm.py
> index 3394a89970..296b84340e 100644
> --- a/scripts/lib/recipetool/create_npm.py
> +++ b/scripts/lib/recipetool/create_npm.py
> @@ -39,6 +39,14 @@ class NpmRecipeHandler(RecipeHandler):
>          name = name.strip("-")
>          return name
>
> +    @staticmethod
> +    def _node_recipe_name(name):
> +        """Generate a OE friendly Node.js recipe name"""
> +        name = NpmRecipeHandler._npm_name(name)
> +        if not name.startswith("node-"):
> +            name = "node-" + name
> +        return name
> +
>      @staticmethod
>      def _get_registry(lines):
>          """Get the registry value from the 'npm://registry' url"""
> @@ -54,6 +62,24 @@ class NpmRecipeHandler(RecipeHandler):
>
>          return registry
>
> +    @staticmethod
> +    def _get_srcdir(lines):
> +        """Get the source directory value from the url"""
> +        srcdir = ""
> +
> +        def _handle_srcdir(varname, origvalue, op, newlines):
> +            nonlocal srcdir
> +            if origvalue.startswith("${WORKDIR}"):
> +                srcdir = origvalue[11:]
> +            else:
> +                srcdir = "${BP}"
> +
> +            return origvalue, None, 0, True
> +
> +        bb.utils.edit_metadata(lines, ["S"], _handle_srcdir)
> +
> +        return srcdir
> +
>      @staticmethod
>      def _ensure_npm():
>          """Check if the 'npm' command is available in the recipes"""
> @@ -116,6 +142,118 @@ class NpmRecipeHandler(RecipeHandler):
>
>          return os.path.join(srctree, "npm-shrinkwrap.json")
>
> +    def _process_shrinkwrap(self, srctree, shrinkwrap, srcdir):
> +        """
> +            Extract package urls from shrinkwrap dependencies
> +        """
> +
> +        urls = []
> +
> +        def _populate_modules(name, params, deptree):
> +            from bb.fetch2 import URI
> +            from bb.fetch2.npm import npm_integrity
> +            from bb.fetch2.npm import npm_localfile
> +
> +            destsubdirs = [os.path.join("node_modules", dep) for dep in
> deptree]
> +            destsuffix = os.path.join(srcdir, *destsubdirs)
> +
> +            dev = params.get("dev", False)
> +            integrity = params.get("integrity")
> +            resolved = params.get("resolved")
> +            version = params.get("version")
> +            requires = params.get("requires", {})
> +
> +            # Handle registry sources
> +            if bb.utils.is_semver(version) and integrity:
> +                # Skip dependencies without url
> +                if not resolved:
> +                    return
> +
> +                pkgv = version
> +
> +                uri = URI(resolved)
> +                uri.params["downloadfilename"] = npm_localfile(name,
> version)
> +
> +                checksum_name, checksum_expected =
> npm_integrity(integrity)
> +                uri.params[checksum_name] = checksum_expected
> +
> +                uri.params["subdir"] = destsuffix
> +                uri.params["striplevel"] = "1"
> +
> +                url = str(uri)
> +
> +            # Handle http tarball sources
> +            elif version.startswith("http") and integrity:
> +                checksum_name, checksum_expected =
> npm_integrity(integrity)
> +
> +                pkgv = checksum_expected[:13]
> +
> +                uri = URI(version)
> +                uri.params["downloadfilename"] = npm_localfile(name, pkgv)
> +
> +                uri.params[checksum_name] = checksum_expected
> +
> +                uri.params["destsuffix"] = destsuffix
> +                uri.params["striplevel"] = "1"
> +
> +                url = str(uri)
> +
> +            # Handle git sources
> +            elif version.startswith("git"):
> +                if version.startswith("github:"):
> +                    version = "git+https://github.com/" +
> version[len("github:"):]
> +                regex = re.compile(r"""
> +                    ^
> +                    git\+
> +                    (?P<protocol>[a-z]+)
> +                    ://
> +                    (?P<url>[^#]+)
> +                    \#
> +                    (?P<rev>[0-9a-f]+)
> +                    $
> +                    """, re.VERBOSE)
> +
> +                match = regex.match(version)
> +
> +                if not match:
> +                    raise Exception("Invalid git url: %s - %s" %
> (version, url))
> +
> +                groups = match.groupdict()
> +
> +                pkgv = str(groups["rev"])[:10]
> +
> +                uri = URI("git://" + str(groups["url"]))
> +                uri.params["destsuffix"] = destsuffix
> +                uri.params["nobranch"] = "1"
> +                uri.params["protocol"] = str(groups["protocol"])
> +                uri.params["rev"] = str(groups["rev"])
> +
> +                url = str(uri)
> +
> +            else:
> +                raise Exception("Unsupported dependency: %s - %s" %
> (name, version))
> +
> +            # Set package version in shrinkwrap for dependency resolution
> +            params["pkgv"] = pkgv
> +
> +            urls.append(url)
> +
> +        def _foreach_shrinkwrap_dependency(shrinkwrap, callback):
> +            def _walk_dependencies(deps, deptree):
> +                for name in deps:
> +                    subtree = [*deptree, name]
> +                    _walk_dependencies(deps[name].get("dependencies",
> {}), subtree)
> +                    if deps[name].get("bundled", False):
> +                        continue
> +                    callback(name, deps[name], subtree)
> +
> +            _walk_dependencies(shrinkwrap.get("dependencies", {}), [])
> +
> +        _foreach_shrinkwrap_dependency(shrinkwrap, _populate_modules)
> +
> +        return urls
> +
> +
>      def _handle_licenses(self, srctree, shrinkwrap_file, dev):
>          """Return the extra license files and the list of packages"""
>          licfiles = []
> @@ -173,7 +311,7 @@ class NpmRecipeHandler(RecipeHandler):
>          if "name" not in data or "version" not in data:
>              return False
>
> -        extravalues["PN"] = self._npm_name(data["name"])
> +        extravalues["PN"] = self._node_recipe_name(data["name"])
>          extravalues["PV"] = data["version"]
>
>          if "description" in data:
> @@ -184,6 +322,24 @@ class NpmRecipeHandler(RecipeHandler):
>
>          dev = bb.utils.to_boolean(str(extravalues.get("NPM_INSTALL_DEV",
> "0")), False)
>          registry = self._get_registry(lines_before)
> +        srcdir = self._get_srcdir(lines_before)
> +        # Replace reserved directories
> +        if srcdir == "package":
> +            srcdir = "npm"
> +            def _handle_srcuri(varname, origvalue, op, newlines):
> +                """Update the version value"""
> +                values = "%s;subdir=%s;striplevel=1" % (origvalue, srcdir)
> +                return values, None, 4, False
> +
> +            (_, newlines) = bb.utils.edit_metadata(lines_before,
> ["SRC_URI"], _handle_srcuri)
> +            lines_before[:] = [line.rstrip('\n') for line in newlines]
> +
> +            def _handle_srcdir(varname, origvalue, op, newlines):
> +                value = "${WORKDIR}/%s" % (srcdir)
> +                return value, None, 0, True
> +
> +            (_, newlines) = bb.utils.edit_metadata(lines_before, ["S"],
> _handle_srcdir)
> +            lines_before[:] = [line.rstrip('\n') for line in newlines]
>
>          bb.note("Checking if npm is available ...")
>          # The native npm is used here (and not the host one) to ensure
> that the
> @@ -223,37 +379,65 @@ class NpmRecipeHandler(RecipeHandler):
>          if os.path.exists(lock_copy):
>              bb.utils.movefile(lock_copy, lock_file)
>
> -        # Add the shrinkwrap file as 'extrafiles'
> -        shrinkwrap_copy = shrinkwrap_file + ".copy"
> -        bb.utils.copyfile(shrinkwrap_file, shrinkwrap_copy)
> -        extravalues.setdefault("extrafiles", {})
> -        extravalues["extrafiles"]["npm-shrinkwrap.json"] = shrinkwrap_copy
> -
> -        url_local = "npmsw://%s" % shrinkwrap_file
> -        url_recipe= "npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json"
> -
> -        if dev:
> -            url_local += ";dev=1"
> -            url_recipe += ";dev=1"
> -
> -        # Add the npmsw url in the SRC_URI of the generated recipe
>          def _handle_srcuri(varname, origvalue, op, newlines):
> -            """Update the version value and add the 'npmsw://' url"""
> +            """Update the version value"""
>              value = origvalue.replace("version=" + data["version"],
> "version=${PV}")
>              value = value.replace("version=latest", "version=${PV}")
>              values = [line.strip() for line in
> value.strip('\n').splitlines()]
> -            if "dependencies" in shrinkwrap:
> -                values.append(url_recipe)
>              return values, None, 4, False
>
>          (_, newlines) = bb.utils.edit_metadata(lines_before, ["SRC_URI"],
> _handle_srcuri)
>          lines_before[:] = [line.rstrip('\n') for line in newlines]
>
> +        urls = self._process_shrinkwrap(srctree, shrinkwrap, srcdir)
> +
> +        # Add the package urls in the SRC_URI of the generated recipe
> +        def _handle_srcuri(varname, origvalue, op, newlines):
> +            """Add the package urls and git SRCREVs"""
> +            values = None
> +            # Handle SRCREVs
> +            if varname == "SRCREV":
> +                newlines.append('SRCREV_FORMAT = "main"')
> +                newlines.append('SRCREV_main = "%s"' % origvalue)
> +            # Handle urls
> +            elif varname == "SRC_URI":
> +                values = [line.strip() for line in origvalue.split()]
> +                values = ["%s;name=main" % (v) if v.startswith(("git",
> "http")) else v for v in values]
> +                values.extend(sorted(urls))
> +            # Handle hashes
> +            else:
> +                newvarname = varname.replace("[", "[main.")
> +                newlines.append('%s = "%s"' % (newvarname, origvalue))
> +            return values, None, 4, False
> +
> +        (_, newlines) = bb.utils.edit_metadata(lines_before, ["SRC_URI",
> "SRCREV", "SRC_URI\[\w*\]"], _handle_srcuri)
> +        lines_before[:] = [line.rstrip('\n') for line in newlines]
> +
> +
> +        # Add the package urls in the SRC_URI of the generated recipe
> +        def _handle_sums(varname, origvalue, op, newlines):
> +            """Add the package urls and git SRCREVs"""
> +            values = None
> +            if varname == "SRC_URI[md5sum]":
> +                # Add the urls
> +                values = [line.strip() for line in origvalue.split()]
> +                values = [v + ";name=main" if v.startswith("git", "http")
> else v for v in values]
> +                values.extend(sorted(urls))
> +            else:
> +                # Add git SRCREVs
> +                newlines.append('SRCREV_FORMAT = "main"')
> +                newlines.append('SRCREV_main = "%s"' % origvalue)
> +            return values, None, 4, False
> +
> +        (_, newlines) = bb.utils.edit_metadata(lines_before,
> ["SRC_URI[md5sum]", "SRCREV" ], _handle_sums)
> +        lines_before[:] = [line.rstrip('\n') for line in newlines]
> +
>          # In order to generate correct licence checksums in the recipe the
> -        # dependencies have to be fetched again using the npmsw url
> +        # dependencies have to be fetched agai  n using the urls
>          bb.note("Fetching npm dependencies ...")
>          bb.utils.remove(os.path.join(srctree, "node_modules"),
> recurse=True)
> -        fetcher = bb.fetch2.Fetch([url_local], d)
> +        srcurls = [url.replace("=%s/node_modules" % srcdir,
> "=node_modules") for url in urls]
> +        fetcher = bb.fetch2.Fetch(srcurls, d)
>          fetcher.download()
>          fetcher.unpack(srctree)
>
> @@ -289,7 +473,24 @@ class NpmRecipeHandler(RecipeHandler):
>          (licenses, extravalues["LIC_FILES_CHKSUM"]) =
> _guess_odd_license(licfiles)
>          split_pkg_licenses([*licenses, *guess_license(srctree, d)],
> packages, lines_after)
>
> -        classes.append("npm")
> +        # Add suitable npm class
> +        if dev:
> +            scripts = data.get("scripts", {})
> +            if scripts.get("build"):
> +                deps = data.get("devDependencies", {})
> +                if deps.get("@angular/cli"):
> +                    classes.append("angular")
> +                elif deps.get("karma"):
> +                    classes.append("karma")
> +                elif scripts.get("test"):
> +                    classes.append("npm_test")
> +                else:
> +                    classes.append("npm_build")
> +            else:
> +                classes.append("npm")
> +        else:
> +            classes.append("npm")
> +
>          handled.append("buildsystem")
>
>          return True
> --
> 2.20.1
>
>

--0000000000009dd75a05d18a8a6b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>A description of the changes and how the new code wor=
ks is missing. How is the SRC_URI formed? How is the appropriate class sele=
cted?</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 24 Nov 2021 at 15:48, =
Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrechtsmeier-oss@wei=
dmueller.com">stefan.herbrechtsmeier-oss@weidmueller.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">From: Stefan Herbre=
chtsmeier &lt;<a href=3D"mailto:stefan.herbrechtsmeier@weidmueller.com" tar=
get=3D"_blank">stefan.herbrechtsmeier@weidmueller.com</a>&gt;<br>
<br>
Signed-off-by: Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbrech=
tsmeier@weidmueller.com" target=3D"_blank">stefan.herbrechtsmeier@weidmuell=
er.com</a>&gt;<br>
<br>
---<br>
<br>
=C2=A0scripts/lib/recipetool/create_npm.py | 243 ++++++++++++++++++++++++--=
-<br>
=C2=A01 file changed, 222 insertions(+), 21 deletions(-)<br>
<br>
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/=
create_npm.py<br>
index 3394a89970..296b84340e 100644<br>
--- a/scripts/lib/recipetool/create_npm.py<br>
+++ b/scripts/lib/recipetool/create_npm.py<br>
@@ -39,6 +39,14 @@ class NpmRecipeHandler(RecipeHandler):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name =3D name.strip(&quot;-&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return name<br>
<br>
+=C2=A0 =C2=A0 @staticmethod<br>
+=C2=A0 =C2=A0 def _node_recipe_name(name):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Generate a OE friendly Node.=
js recipe name&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D NpmRecipeHandler._npm_name(name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not name.startswith(&quot;node-&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D &quot;node-&quot; + nam=
e<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return name<br>
+<br>
=C2=A0 =C2=A0 =C2=A0@staticmethod<br>
=C2=A0 =C2=A0 =C2=A0def _get_registry(lines):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Get the registry value =
from the &#39;npm://registry&#39; url&quot;&quot;&quot;<br>
@@ -54,6 +62,24 @@ class NpmRecipeHandler(RecipeHandler):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return registry<br>
<br>
+=C2=A0 =C2=A0 @staticmethod<br>
+=C2=A0 =C2=A0 def _get_srcdir(lines):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Get the source directory val=
ue from the url&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 srcdir =3D &quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def _handle_srcdir(varname, origvalue, op, new=
lines):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nonlocal srcdir<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if origvalue.startswith(&quot;${=
WORKDIR}&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srcdir =3D origval=
ue[11:]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srcdir =3D &quot;$=
{BP}&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return origvalue, None, 0, True<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.edit_metadata(lines, [&quot;S&quot;],=
 _handle_srcdir)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return srcdir<br>
+<br>
=C2=A0 =C2=A0 =C2=A0@staticmethod<br>
=C2=A0 =C2=A0 =C2=A0def _ensure_npm():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Check if the &#39;npm&#=
39; command is available in the recipes&quot;&quot;&quot;<br>
@@ -116,6 +142,118 @@ class NpmRecipeHandler(RecipeHandler):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return os.path.join(srctree, &quot;npm-sh=
rinkwrap.json&quot;)<br>
<br>
+=C2=A0 =C2=A0 def _process_shrinkwrap(self, srctree, shrinkwrap, srcdir):<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Extract package urls from shrink=
wrap dependencies<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 urls =3D []<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def _populate_modules(name, params, deptree):<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from bb.fetch2 import URI<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from bb.fetch2.npm import npm_in=
tegrity<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from bb.fetch2.npm import npm_lo=
calfile<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destsubdirs =3D [os.path.join(&q=
uot;node_modules&quot;, dep) for dep in deptree]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 destsuffix =3D os.path.join(srcd=
ir, *destsubdirs)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev =3D params.get(&quot;dev&quo=
t;, False)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 integrity =3D params.get(&quot;i=
ntegrity&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resolved =3D params.get(&quot;re=
solved&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 version =3D params.get(&quot;ver=
sion&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 requires =3D params.get(&quot;re=
quires&quot;, {})<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Handle registry sources<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.utils.is_semver(version) a=
nd integrity:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Skip dependencie=
s without url<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not resolved:<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgv =3D version<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uri =3D URI(resolv=
ed)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uri.params[&quot;d=
ownloadfilename&quot;] =3D npm_localfile(name, version)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 checksum_name, che=
cksum_expected =3D npm_integrity(integrity)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uri.params[checksu=
m_name] =3D checksum_expected<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uri.params[&quot;s=
ubdir&quot;] =3D destsuffix<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uri.params[&quot;s=
triplevel&quot;] =3D &quot;1&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 url =3D str(uri)<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Handle http tarball sources<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif version.startswith(&quot;ht=
tp&quot;) and integrity:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 checksum_name, che=
cksum_expected =3D npm_integrity(integrity)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgv =3D checksum_=
expected[:13]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uri =3D URI(versio=
n)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uri.params[&quot;d=
ownloadfilename&quot;] =3D npm_localfile(name, pkgv)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uri.params[checksu=
m_name] =3D checksum_expected<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uri.params[&quot;d=
estsuffix&quot;] =3D destsuffix<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uri.params[&quot;s=
triplevel&quot;] =3D &quot;1&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 url =3D str(uri)<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Handle git sources<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif version.startswith(&quot;gi=
t&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if version.startsw=
ith(&quot;github:&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vers=
ion =3D &quot;git+<a href=3D"https://github.com/" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/</a>&quot; + version[len(&quot;github:&quot;=
):]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 regex =3D re.compi=
le(r&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git\=
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (?P&=
lt;protocol&gt;[a-z]+)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ://<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (?P&=
lt;url&gt;[^#]+)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \#<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (?P&=
lt;rev&gt;[0-9a-f]+)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;&quot;&quot;, re.VERBOSE)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match =3D regex.ma=
tch(version)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not match:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rais=
e Exception(&quot;Invalid git url: %s - %s&quot; % (version, url))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 groups =3D match.g=
roupdict()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgv =3D str(group=
s[&quot;rev&quot;])[:10]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uri =3D URI(&quot;=
git://&quot; + str(groups[&quot;url&quot;]))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uri.params[&quot;d=
estsuffix&quot;] =3D destsuffix<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uri.params[&quot;n=
obranch&quot;] =3D &quot;1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uri.params[&quot;p=
rotocol&quot;] =3D str(groups[&quot;protocol&quot;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uri.params[&quot;r=
ev&quot;] =3D str(groups[&quot;rev&quot;])<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 url =3D str(uri)<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise Exception(&q=
uot;Unsupported dependency: %s - %s&quot; % (name, version))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Set package version in shrinkw=
rap for dependency resolution<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 params[&quot;pkgv&quot;] =3D pkg=
v<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 urls.append(url)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def _foreach_shrinkwrap_dependency(shrinkwrap,=
 callback):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 def _walk_dependencies(deps, dep=
tree):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for name in deps:<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subt=
ree =3D [*deptree, name]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _wal=
k_dependencies(deps[name].get(&quot;dependencies&quot;, {}), subtree)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if d=
eps[name].get(&quot;bundled&quot;, False):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 call=
back(name, deps[name], subtree)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _walk_dependencies(shrinkwrap.ge=
t(&quot;dependencies&quot;, {}), [])<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 _foreach_shrinkwrap_dependency(shrinkwrap, _po=
pulate_modules)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return urls<br>
+<br>
+<br>
=C2=A0 =C2=A0 =C2=A0def _handle_licenses(self, srctree, shrinkwrap_file, de=
v):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Return the extra licens=
e files and the list of packages&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0licfiles =3D []<br>
@@ -173,7 +311,7 @@ class NpmRecipeHandler(RecipeHandler):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &quot;name&quot; not in data or &quot;=
version&quot; not in data:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return False<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 extravalues[&quot;PN&quot;] =3D self._npm_name=
(data[&quot;name&quot;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 extravalues[&quot;PN&quot;] =3D self._node_rec=
ipe_name(data[&quot;name&quot;])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0extravalues[&quot;PV&quot;] =3D data[&quo=
t;version&quot;]<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &quot;description&quot; in data:<br>
@@ -184,6 +322,24 @@ class NpmRecipeHandler(RecipeHandler):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev =3D bb.utils.to_boolean(str(extravalu=
es.get(&quot;NPM_INSTALL_DEV&quot;, &quot;0&quot;)), False)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0registry =3D self._get_registry(lines_bef=
ore)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 srcdir =3D self._get_srcdir(lines_before)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Replace reserved directories<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if srcdir =3D=3D &quot;package&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srcdir =3D &quot;npm&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 def _handle_srcuri(varname, orig=
value, op, newlines):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;=
Update the version value&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 values =3D &quot;%=
s;subdir=3D%s;striplevel=3D1&quot; % (origvalue, srcdir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return values, Non=
e, 4, False<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (_, newlines) =3D bb.utils.edit_=
metadata(lines_before, [&quot;SRC_URI&quot;], _handle_srcuri)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lines_before[:] =3D [line.rstrip=
(&#39;\n&#39;) for line in newlines]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 def _handle_srcdir(varname, orig=
value, op, newlines):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D &quot;${=
WORKDIR}/%s&quot; % (srcdir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return value, None=
, 0, True<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (_, newlines) =3D bb.utils.edit_=
metadata(lines_before, [&quot;S&quot;], _handle_srcdir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lines_before[:] =3D [line.rstrip=
(&#39;\n&#39;) for line in newlines]<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quot;Checking if npm is availabl=
e ...&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# The native npm is used here (and not th=
e host one) to ensure that the<br>
@@ -223,37 +379,65 @@ class NpmRecipeHandler(RecipeHandler):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists(lock_copy):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.movefile(lock_copy=
, lock_file)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add the shrinkwrap file as &#39;extrafiles&#=
39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 shrinkwrap_copy =3D shrinkwrap_file + &quot;.c=
opy&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.copyfile(shrinkwrap_file, shrinkwrap_=
copy)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 extravalues.setdefault(&quot;extrafiles&quot;,=
 {})<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 extravalues[&quot;extrafiles&quot;][&quot;npm-=
shrinkwrap.json&quot;] =3D shrinkwrap_copy<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 url_local =3D &quot;npmsw://%s&quot; % shrinkw=
rap_file<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 url_recipe=3D &quot;npmsw://${THISDIR}/${BPN}/=
npm-shrinkwrap.json&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if dev:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 url_local +=3D &quot;;dev=3D1&qu=
ot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 url_recipe +=3D &quot;;dev=3D1&q=
uot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add the npmsw url in the SRC_URI of the gene=
rated recipe<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0def _handle_srcuri(varname, origvalue, op=
, newlines):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Update the ver=
sion value and add the &#39;npmsw://&#39; url&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Update the ver=
sion value&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value =3D origvalue.replace=
(&quot;version=3D&quot; + data[&quot;version&quot;], &quot;version=3D${PV}&=
quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value =3D value.replace(&qu=
ot;version=3Dlatest&quot;, &quot;version=3D${PV}&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0values =3D [line.strip() fo=
r line in value.strip(&#39;\n&#39;).splitlines()]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;dependencies&quot; in s=
hrinkwrap:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 values.append(url_=
recipe)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return values, None, 4, Fal=
se<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(_, newlines) =3D bb.utils.edit_metadata(=
lines_before, [&quot;SRC_URI&quot;], _handle_srcuri)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lines_before[:] =3D [line.rstrip(&#39;\n&=
#39;) for line in newlines]<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 urls =3D self._process_shrinkwrap(srctree, shr=
inkwrap, srcdir)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add the package urls in the SRC_URI of the g=
enerated recipe<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def _handle_srcuri(varname, origvalue, op, new=
lines):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Add the packag=
e urls and git SRCREVs&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 values =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Handle SRCREVs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if varname =3D=3D &quot;SRCREV&q=
uot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newlines.append(&#=
39;SRCREV_FORMAT =3D &quot;main&quot;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newlines.append(&#=
39;SRCREV_main =3D &quot;%s&quot;&#39; % origvalue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Handle urls<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif varname =3D=3D &quot;SRC_UR=
I&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 values =3D [line.s=
trip() for line in origvalue.split()]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 values =3D [&quot;=
%s;name=3Dmain&quot; % (v) if v.startswith((&quot;git&quot;, &quot;http&quo=
t;)) else v for v in values]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 values.extend(sort=
ed(urls))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Handle hashes<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newvarname =3D var=
name.replace(&quot;[&quot;, &quot;[main.&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newlines.append(&#=
39;%s =3D &quot;%s&quot;&#39; % (newvarname, origvalue))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return values, None, 4, False<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (_, newlines) =3D bb.utils.edit_metadata(lines=
_before, [&quot;SRC_URI&quot;, &quot;SRCREV&quot;, &quot;SRC_URI\[\w*\]&quo=
t;], _handle_srcuri)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lines_before[:] =3D [line.rstrip(&#39;\n&#39;)=
 for line in newlines]<br>
+<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add the package urls in the SRC_URI of the g=
enerated recipe<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 def _handle_sums(varname, origvalue, op, newli=
nes):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Add the packag=
e urls and git SRCREVs&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 values =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if varname =3D=3D &quot;SRC_URI[=
md5sum]&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add the urls<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 values =3D [line.s=
trip() for line in origvalue.split()]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 values =3D [v + &q=
uot;;name=3Dmain&quot; if v.startswith(&quot;git&quot;, &quot;http&quot;) e=
lse v for v in values]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 values.extend(sort=
ed(urls))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add git SRCREVs<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newlines.append(&#=
39;SRCREV_FORMAT =3D &quot;main&quot;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newlines.append(&#=
39;SRCREV_main =3D &quot;%s&quot;&#39; % origvalue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return values, None, 4, False<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (_, newlines) =3D bb.utils.edit_metadata(lines=
_before, [&quot;SRC_URI[md5sum]&quot;, &quot;SRCREV&quot; ], _handle_sums)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lines_before[:] =3D [line.rstrip(&#39;\n&#39;)=
 for line in newlines]<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# In order to generate correct licence ch=
ecksums in the recipe the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # dependencies have to be fetched again using =
the npmsw url<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # dependencies have to be fetched agai=C2=A0 n=
 using the urls<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quot;Fetching npm dependencies .=
..&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.remove(os.path.join(srctree, &qu=
ot;node_modules&quot;), recurse=3DTrue)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fetcher =3D bb.fetch2.Fetch([url_local], d)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 srcurls =3D [url.replace(&quot;=3D%s/node_modu=
les&quot; % srcdir, &quot;=3Dnode_modules&quot;) for url in urls]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fetcher =3D bb.fetch2.Fetch(srcurls, d)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fetcher.download()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fetcher.unpack(srctree)<br>
<br>
@@ -289,7 +473,24 @@ class NpmRecipeHandler(RecipeHandler):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(licenses, extravalues[&quot;LIC_FILES_CH=
KSUM&quot;]) =3D _guess_odd_license(licfiles)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0split_pkg_licenses([*licenses, *guess_lic=
ense(srctree, d)], packages, lines_after)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 classes.append(&quot;npm&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Add suitable npm class<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if dev:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 scripts =3D data.get(&quot;scrip=
ts&quot;, {})<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if scripts.get(&quot;build&quot;=
):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps =3D data.get(=
&quot;devDependencies&quot;, {})<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if deps.get(&quot;=
@angular/cli&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clas=
ses.append(&quot;angular&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif deps.get(&quo=
t;karma&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clas=
ses.append(&quot;karma&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif scripts.get(&=
quot;test&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clas=
ses.append(&quot;npm_test&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clas=
ses.append(&quot;npm_build&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 classes.append(&qu=
ot;npm&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 classes.append(&quot;npm&quot;)<=
br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0handled.append(&quot;buildsystem&quot;)<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return True<br>
-- <br>
2.20.1<br>
<br>
</blockquote></div>

--0000000000009dd75a05d18a8a6b--

