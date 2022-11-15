Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A6C5C4332F
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 21:56:17 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.7591.1668549372949564544
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 13:56:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=AiT/cRGO;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.52, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f52.google.com with SMTP id gv23so6845297ejb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n+aE0f4g9nPAiSaoSkg33AHNwEHnVwtQX6Kzoa2qIkU=;
        b=AiT/cRGOiu7GgJGPinKJZ2QBbVrW2ari/qevgdyLi9mZYAp70k0B2epCDBvE8Pvc5l
         MWuxcLpnHuOSFJUCWhVSrUxNFGjYo6QLPR3RUOAGTSSaZ4XNhsANRE+fm3zYsg3yInoQ
         bbcfZEgguS3innLh0bgQoaL8BvE3K6UbpznwhPLpcnLTTL18EhKyMlwULV3jsmxAhX1f
         hZXxWfbxP7LFgq/7PxJocqWkh8err/99YAVHn3ZRTFweoiDZ9Hdo14lFCgbESdHvzYZZ
         YghNPBunvPHotsGloY0h2mRSy4DJAMtOUm4Vaxi8dy4F3qB1cudOa1VjSGIV2WiKaP4Z
         +Ahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+aE0f4g9nPAiSaoSkg33AHNwEHnVwtQX6Kzoa2qIkU=;
        b=h5rnmJms/5VYyOt2JgXuCfSMoP/crfOzY36/UK/jxsvOHyhZeGQKfFPu/QVKAhqZbc
         w3+S/IE6PFnZSoEnXMkihimkfK8ZK85UxpdocTSbrPy5dqKQ9ZjU200GRQhBfgKxk9So
         9GmKxgNGFUQ0KN6fpl7z1poeL0HjV5x15wpYbB3rGATv75StkDp77HWmzMKtsTSokfRs
         BJALBm4eo6RC1oyApjiCccqXR3r/HRKvZrEoIG+Fw+x3Hbh3gIBcs1cSwMljIcmOY7X1
         NjrX/lcWWezdzsVQzg/zFHZMvAoZDi6nE5aaG8KXVx+c6j0N8CDhzyuTpOOPlpAQyiO9
         5Mwg==
X-Gm-Message-State: ANoB5pkJAyoII4ZETPFn4EVvALTSTV7d0Q1//zJtEfbydTjITRIuITEK
	v1aK46Q+ufPhyro2iETajK9JGQY1/cm8l8pe8Ru0/Q==
X-Google-Smtp-Source: AA0mqf4asuvmU4hqzNn7Cv4YiZwOnCr7RXkzrhFKufdoUCpPIKy32XzrvtskiYHxKmrpoQG5XAmNWebTDFR+ZYx7KlE=
X-Received: by 2002:a17:906:a0d0:b0:7ac:2e16:a8d2 with SMTP id
 bh16-20020a170906a0d000b007ac2e16a8d2mr15279259ejb.584.1668549371130; Tue, 15
 Nov 2022 13:56:11 -0800 (PST)
MIME-Version: 1.0
References: <20221111145551.1115391-1-JPEWhacker@gmail.com> <CAJdd5GaYZNrHT8Ki3-M7yNuHcGbdz38O04aGJJspu=86PC2-Ag@mail.gmail.com>
In-Reply-To: <CAJdd5GaYZNrHT8Ki3-M7yNuHcGbdz38O04aGJJspu=86PC2-Ag@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 15 Nov 2022 11:56:00 -1000
Message-ID: <CAOSpxdY9h1f4dRVMzbc__eHZ-cPrd7RivFVtO_VGn0VNsWzAmQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] scripts: convert-overrides: Allow command-line customizations
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008e8d8b05ed896c30"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 21:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173357

--0000000000008e8d8b05ed896c30
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 15, 2022, 9:42 AM Joshua Watt <jpewhacker@gmail.com> wrote:

> Steve,
>
> Please backport this to kirkstone and langdale.
>
> Thanks!
>

Ok, will do!

Steve



> On Fri, Nov 11, 2022 at 8:55 AM Joshua Watt <jpewhacker@gmail.com> wrote:
> >
> > Adds argument parsing to the conversion script so that the fields that
> > the script uses to do conversions can be customized on the command line.
> > The intention is to allows easier customization without having to fork
> > the script, and allow automated checking on 3rd party layers via CI
> > without false positives
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  scripts/contrib/convert-overrides.py | 103 +++++++++++++++------------
> >  1 file changed, 57 insertions(+), 46 deletions(-)
> >
> > diff --git a/scripts/contrib/convert-overrides.py
> b/scripts/contrib/convert-overrides.py
> > index 4d41a4c4759..1939757f1bc 100755
> > --- a/scripts/contrib/convert-overrides.py
> > +++ b/scripts/contrib/convert-overrides.py
> > @@ -22,50 +22,62 @@ import sys
> >  import tempfile
> >  import shutil
> >  import mimetypes
> > +import argparse
> >
> > -if len(sys.argv) < 2:
> > -    print("Please specify a directory to run the conversion script
> against.")
> > -    sys.exit(1)
> > +parser = argparse.ArgumentParser(description="Convert override syntax")
> > +parser.add_argument("--override", "-o", action="append", default=[],
> help="Add additional strings to consider as an override (e.g. custom
> machines/distros")
> > +parser.add_argument("--skip", "-s", action="append", default=[],
> help="Add additional string to skip and not consider an override")
> > +parser.add_argument("--skip-ext", "-e", action="append", default=[],
> help="Additional file suffixes to skip when processing (e.g. '.foo')")
> > +parser.add_argument("--package-vars", action="append", default=[],
> help="Additional variables to treat as package variables")
> > +parser.add_argument("--image-vars", action="append", default=[],
> help="Additional variables to treat as image variables")
> > +parser.add_argument("--short-override", action="append", default=[],
> help="Additional strings to treat as short overrides")
> > +parser.add_argument("path", nargs="+", help="Paths to convert")
> > +
> > +args = parser.parse_args()
> >
> >  # List of strings to treat as overrides
> > -vars = ["append", "prepend", "remove"]
> > -vars = vars + ["qemuarm", "qemux86", "qemumips", "qemuppc",
> "qemuriscv", "qemuall"]
> > -vars = vars + ["genericx86", "edgerouter", "beaglebone-yocto"]
> > -vars = vars + ["armeb", "arm", "armv5", "armv6", "armv4", "powerpc64",
> "aarch64", "riscv32", "riscv64", "x86", "mips64", "powerpc"]
> > -vars = vars + ["mipsarch", "x86-x32", "mips16e", "microblaze",
> "e5500-64b", "mipsisa32", "mipsisa64"]
> > -vars = vars + ["class-native", "class-target", "class-cross-canadian",
> "class-cross", "class-devupstream"]
> > -vars = vars + ["tune-",  "pn-", "forcevariable"]
> > -vars = vars + ["libc-musl", "libc-glibc",
> "libc-newlib","libc-baremetal"]
> > -vars = vars + ["task-configure", "task-compile", "task-install",
> "task-clean", "task-image-qa", "task-rm_work", "task-image-complete",
> "task-populate-sdk"]
> > -vars = vars + ["toolchain-clang", "mydistro", "nios2", "sdkmingw32",
> "overrideone", "overridetwo"]
> > -vars = vars + ["linux-gnux32", "linux-muslx32", "linux-gnun32",
> "mingw32", "poky", "darwin", "linuxstdbase"]
> > -vars = vars + ["linux-gnueabi", "eabi"]
> > -vars = vars + ["virtclass-multilib", "virtclass-mcextend"]
> > +vars = args.override
> > +vars += ["append", "prepend", "remove"]
> > +vars += ["qemuarm", "qemux86", "qemumips", "qemuppc", "qemuriscv",
> "qemuall"]
> > +vars += ["genericx86", "edgerouter", "beaglebone-yocto"]
> > +vars += ["armeb", "arm", "armv5", "armv6", "armv4", "powerpc64",
> "aarch64", "riscv32", "riscv64", "x86", "mips64", "powerpc"]
> > +vars += ["mipsarch", "x86-x32", "mips16e", "microblaze", "e5500-64b",
> "mipsisa32", "mipsisa64"]
> > +vars += ["class-native", "class-target", "class-cross-canadian",
> "class-cross", "class-devupstream"]
> > +vars += ["tune-",  "pn-", "forcevariable"]
> > +vars += ["libc-musl", "libc-glibc", "libc-newlib","libc-baremetal"]
> > +vars += ["task-configure", "task-compile", "task-install",
> "task-clean", "task-image-qa", "task-rm_work", "task-image-complete",
> "task-populate-sdk"]
> > +vars += ["toolchain-clang", "mydistro", "nios2", "sdkmingw32",
> "overrideone", "overridetwo"]
> > +vars += ["linux-gnux32", "linux-muslx32", "linux-gnun32", "mingw32",
> "poky", "darwin", "linuxstdbase"]
> > +vars += ["linux-gnueabi", "eabi"]
> > +vars += ["virtclass-multilib", "virtclass-mcextend"]
> >
> >  # List of strings to treat as overrides but only with whitespace
> following or another override (more restricted matching).
> >  # Handles issues with arc matching arch.
> > -shortvars = ["arc", "mips", "mipsel", "sh4"]
> > +shortvars = ["arc", "mips", "mipsel", "sh4"] + args.short_override
> >
> >  # Variables which take packagenames as an override
> >  packagevars = ["FILES", "RDEPENDS", "RRECOMMENDS", "SUMMARY",
> "DESCRIPTION", "RSUGGESTS", "RPROVIDES", "RCONFLICTS", "PKG", "ALLOW_EMPTY",
> >                "pkg_postrm", "pkg_postinst_ontarget", "pkg_postinst",
> "INITSCRIPT_NAME", "INITSCRIPT_PARAMS", "DEBIAN_NOAUTONAME", "ALTERNATIVE",
> >                "PKGE", "PKGV", "PKGR", "USERADD_PARAM",
> "GROUPADD_PARAM", "CONFFILES", "SYSTEMD_SERVICE", "LICENSE", "SECTION",
> "pkg_preinst",
> >                "pkg_prerm", "RREPLACES", "GROUPMEMS_PARAM",
> "SYSTEMD_AUTO_ENABLE", "SKIP_FILEDEPS", "PRIVATE_LIBS",
> "PACKAGE_ADD_METADATA",
> > -              "INSANE_SKIP", "DEBIANNAME", "SYSTEMD_SERVICE_ESCAPED"]
> > +              "INSANE_SKIP", "DEBIANNAME", "SYSTEMD_SERVICE_ESCAPED"] +
> args.package_vars
> >
> >  # Expressions to skip if encountered, these are not overrides
> > -skips = ["parser_append", "recipe_to_append", "extra_append",
> "to_remove", "show_appends", "applied_appends", "file_appends",
> "handle_remove"]
> > -skips = skips + ["expanded_removes", "color_remove", "test_remove",
> "empty_remove", "toaster_prepend", "num_removed", "licfiles_append",
> "_write_append"]
> > -skips = skips + ["no_report_remove", "test_prepend", "test_append",
> "multiple_append", "test_remove", "shallow_remove", "do_remove_layer",
> "first_append"]
> > -skips = skips + ["parser_remove", "to_append", "no_remove",
> "bblayers_add_remove", "bblayers_remove", "apply_append", "is_x86",
> "base_dep_prepend"]
> > -skips = skips + ["autotools_dep_prepend", "go_map_arm",
> "alt_remove_links", "systemd_append_file", "file_append",
> "process_file_darwin"]
> > -skips = skips + ["run_loaddata_poky", "determine_if_poky_env",
> "do_populate_poky_src", "libc_cv_include_x86_isa_level", "test_rpm_remove",
> "do_install_armmultilib"]
> > -skips = skips + ["get_appends_for_files", "test_doubleref_remove",
> "test_bitbakelayers_add_remove", "elf32_x86_64", "colour_remove",
> "revmap_remove"]
> > -skips = skips + ["test_rpm_remove", "test_bitbakelayers_add_remove",
> "recipe_append_file", "log_data_removed", "recipe_append",
> "systemd_machine_unit_append"]
> > -skips = skips + ["recipetool_append", "changetype_remove",
> "try_appendfile_wc", "test_qemux86_directdisk", "test_layer_appends",
> "tgz_removed"]
> > -
> > -imagevars = ["IMAGE_CMD", "EXTRA_IMAGECMD", "IMAGE_TYPEDEP",
> "CONVERSION_CMD", "COMPRESS_CMD"]
> > -packagevars = packagevars + imagevars
> > +skips = args.skip
> > +skips += ["parser_append", "recipe_to_append", "extra_append",
> "to_remove", "show_appends", "applied_appends", "file_appends",
> "handle_remove"]
> > +skips += ["expanded_removes", "color_remove", "test_remove",
> "empty_remove", "toaster_prepend", "num_removed", "licfiles_append",
> "_write_append"]
> > +skips += ["no_report_remove", "test_prepend", "test_append",
> "multiple_append", "test_remove", "shallow_remove", "do_remove_layer",
> "first_append"]
> > +skips += ["parser_remove", "to_append", "no_remove",
> "bblayers_add_remove", "bblayers_remove", "apply_append", "is_x86",
> "base_dep_prepend"]
> > +skips += ["autotools_dep_prepend", "go_map_arm", "alt_remove_links",
> "systemd_append_file", "file_append", "process_file_darwin"]
> > +skips += ["run_loaddata_poky", "determine_if_poky_env",
> "do_populate_poky_src", "libc_cv_include_x86_isa_level", "test_rpm_remove",
> "do_install_armmultilib"]
> > +skips += ["get_appends_for_files", "test_doubleref_remove",
> "test_bitbakelayers_add_remove", "elf32_x86_64", "colour_remove",
> "revmap_remove"]
> > +skips += ["test_rpm_remove", "test_bitbakelayers_add_remove",
> "recipe_append_file", "log_data_removed", "recipe_append",
> "systemd_machine_unit_append"]
> > +skips += ["recipetool_append", "changetype_remove",
> "try_appendfile_wc", "test_qemux86_directdisk", "test_layer_appends",
> "tgz_removed"]
> > +
> > +imagevars = ["IMAGE_CMD", "EXTRA_IMAGECMD", "IMAGE_TYPEDEP",
> "CONVERSION_CMD", "COMPRESS_CMD"] + args.image_vars
> > +packagevars += imagevars
> > +
> > +skip_ext = [".html", ".patch", ".m4", ".diff"] + args.skip_ext
> >
> >  vars_re = {}
> >  for exp in vars:
> > @@ -124,21 +136,20 @@ def processfile(fn):
> >  ourname = os.path.basename(sys.argv[0])
> >  ourversion = "0.9.3"
> >
> > -if os.path.isfile(sys.argv[1]):
> > -    processfile(sys.argv[1])
> > -    sys.exit(0)
> > -
> > -for targetdir in sys.argv[1:]:
> > -    print("processing directory '%s'" % targetdir)
> > -    for root, dirs, files in os.walk(targetdir):
> > -        for name in files:
> > -            if name == ourname:
> > -                continue
> > -            fn = os.path.join(root, name)
> > -            if os.path.islink(fn):
> > -                continue
> > -            if "/.git/" in fn or fn.endswith(".html") or
> fn.endswith(".patch") or fn.endswith(".m4") or fn.endswith(".diff"):
> > -                continue
> > -            processfile(fn)
> > +for p in args.path:
> > +    if os.path.isfile(p):
> > +        processfile(p)
> > +    else:
> > +        print("processing directory '%s'" % p)
> > +        for root, dirs, files in os.walk(p):
> > +            for name in files:
> > +                if name == ourname:
> > +                    continue
> > +                fn = os.path.join(root, name)
> > +                if os.path.islink(fn):
> > +                    continue
> > +                if "/.git/" in fn or any(fn.endswith(ext) for ext in
> skip_ext):
> > +                    continue
> > +                processfile(fn)
> >
> >  print("All files processed with version %s" % ourversion)
> > --
> > 2.33.0
> >
>

--0000000000008e8d8b05ed896c30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Nov 15, 2022, 9:42 AM Joshua Watt &lt;<a href=
=3D"mailto:jpewhacker@gmail.com">jpewhacker@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Steve,<br>
<br>
Please backport this to kirkstone and langdale.<br>
<br>
Thanks!<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Ok, will do!</div><div dir=3D"auto"><br></div><div dir=3D"auto">Stev=
e</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
On Fri, Nov 11, 2022 at 8:55 AM Joshua Watt &lt;<a href=3D"mailto:jpewhacke=
r@gmail.com" target=3D"_blank" rel=3D"noreferrer">jpewhacker@gmail.com</a>&=
gt; wrote:<br>
&gt;<br>
&gt; Adds argument parsing to the conversion script so that the fields that=
<br>
&gt; the script uses to do conversions can be customized on the command lin=
e.<br>
&gt; The intention is to allows easier customization without having to fork=
<br>
&gt; the script, and allow automated checking on 3rd party layers via CI<br=
>
&gt; without false positives<br>
&gt;<br>
&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">JPEWhacker@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/contrib/convert-overrides.py | 103 +++++++++++++++------=
------<br>
&gt;=C2=A0 1 file changed, 57 insertions(+), 46 deletions(-)<br>
&gt;<br>
&gt; diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/co=
nvert-overrides.py<br>
&gt; index 4d41a4c4759..1939757f1bc 100755<br>
&gt; --- a/scripts/contrib/convert-overrides.py<br>
&gt; +++ b/scripts/contrib/convert-overrides.py<br>
&gt; @@ -22,50 +22,62 @@ import sys<br>
&gt;=C2=A0 import tempfile<br>
&gt;=C2=A0 import shutil<br>
&gt;=C2=A0 import mimetypes<br>
&gt; +import argparse<br>
&gt;<br>
&gt; -if len(sys.argv) &lt; 2:<br>
&gt; -=C2=A0 =C2=A0 print(&quot;Please specify a directory to run the conve=
rsion script against.&quot;)<br>
&gt; -=C2=A0 =C2=A0 sys.exit(1)<br>
&gt; +parser =3D argparse.ArgumentParser(description=3D&quot;Convert overri=
de syntax&quot;)<br>
&gt; +parser.add_argument(&quot;--override&quot;, &quot;-o&quot;, action=3D=
&quot;append&quot;, default=3D[], help=3D&quot;Add additional strings to co=
nsider as an override (e.g. custom machines/distros&quot;)<br>
&gt; +parser.add_argument(&quot;--skip&quot;, &quot;-s&quot;, action=3D&quo=
t;append&quot;, default=3D[], help=3D&quot;Add additional string to skip an=
d not consider an override&quot;)<br>
&gt; +parser.add_argument(&quot;--skip-ext&quot;, &quot;-e&quot;, action=3D=
&quot;append&quot;, default=3D[], help=3D&quot;Additional file suffixes to =
skip when processing (e.g. &#39;.foo&#39;)&quot;)<br>
&gt; +parser.add_argument(&quot;--package-vars&quot;, action=3D&quot;append=
&quot;, default=3D[], help=3D&quot;Additional variables to treat as package=
 variables&quot;)<br>
&gt; +parser.add_argument(&quot;--image-vars&quot;, action=3D&quot;append&q=
uot;, default=3D[], help=3D&quot;Additional variables to treat as image var=
iables&quot;)<br>
&gt; +parser.add_argument(&quot;--short-override&quot;, action=3D&quot;appe=
nd&quot;, default=3D[], help=3D&quot;Additional strings to treat as short o=
verrides&quot;)<br>
&gt; +parser.add_argument(&quot;path&quot;, nargs=3D&quot;+&quot;, help=3D&=
quot;Paths to convert&quot;)<br>
&gt; +<br>
&gt; +args =3D parser.parse_args()<br>
&gt;<br>
&gt;=C2=A0 # List of strings to treat as overrides<br>
&gt; -vars =3D [&quot;append&quot;, &quot;prepend&quot;, &quot;remove&quot;=
]<br>
&gt; -vars =3D vars + [&quot;qemuarm&quot;, &quot;qemux86&quot;, &quot;qemu=
mips&quot;, &quot;qemuppc&quot;, &quot;qemuriscv&quot;, &quot;qemuall&quot;=
]<br>
&gt; -vars =3D vars + [&quot;genericx86&quot;, &quot;edgerouter&quot;, &quo=
t;beaglebone-yocto&quot;]<br>
&gt; -vars =3D vars + [&quot;armeb&quot;, &quot;arm&quot;, &quot;armv5&quot=
;, &quot;armv6&quot;, &quot;armv4&quot;, &quot;powerpc64&quot;, &quot;aarch=
64&quot;, &quot;riscv32&quot;, &quot;riscv64&quot;, &quot;x86&quot;, &quot;=
mips64&quot;, &quot;powerpc&quot;]<br>
&gt; -vars =3D vars + [&quot;mipsarch&quot;, &quot;x86-x32&quot;, &quot;mip=
s16e&quot;, &quot;microblaze&quot;, &quot;e5500-64b&quot;, &quot;mipsisa32&=
quot;, &quot;mipsisa64&quot;]<br>
&gt; -vars =3D vars + [&quot;class-native&quot;, &quot;class-target&quot;, =
&quot;class-cross-canadian&quot;, &quot;class-cross&quot;, &quot;class-devu=
pstream&quot;]<br>
&gt; -vars =3D vars + [&quot;tune-&quot;,=C2=A0 &quot;pn-&quot;, &quot;forc=
evariable&quot;]<br>
&gt; -vars =3D vars + [&quot;libc-musl&quot;, &quot;libc-glibc&quot;, &quot=
;libc-newlib&quot;,&quot;libc-baremetal&quot;]<br>
&gt; -vars =3D vars + [&quot;task-configure&quot;, &quot;task-compile&quot;=
, &quot;task-install&quot;, &quot;task-clean&quot;, &quot;task-image-qa&quo=
t;, &quot;task-rm_work&quot;, &quot;task-image-complete&quot;, &quot;task-p=
opulate-sdk&quot;]<br>
&gt; -vars =3D vars + [&quot;toolchain-clang&quot;, &quot;mydistro&quot;, &=
quot;nios2&quot;, &quot;sdkmingw32&quot;, &quot;overrideone&quot;, &quot;ov=
erridetwo&quot;]<br>
&gt; -vars =3D vars + [&quot;linux-gnux32&quot;, &quot;linux-muslx32&quot;,=
 &quot;linux-gnun32&quot;, &quot;mingw32&quot;, &quot;poky&quot;, &quot;dar=
win&quot;, &quot;linuxstdbase&quot;]<br>
&gt; -vars =3D vars + [&quot;linux-gnueabi&quot;, &quot;eabi&quot;]<br>
&gt; -vars =3D vars + [&quot;virtclass-multilib&quot;, &quot;virtclass-mcex=
tend&quot;]<br>
&gt; +vars =3D args.override<br>
&gt; +vars +=3D [&quot;append&quot;, &quot;prepend&quot;, &quot;remove&quot=
;]<br>
&gt; +vars +=3D [&quot;qemuarm&quot;, &quot;qemux86&quot;, &quot;qemumips&q=
uot;, &quot;qemuppc&quot;, &quot;qemuriscv&quot;, &quot;qemuall&quot;]<br>
&gt; +vars +=3D [&quot;genericx86&quot;, &quot;edgerouter&quot;, &quot;beag=
lebone-yocto&quot;]<br>
&gt; +vars +=3D [&quot;armeb&quot;, &quot;arm&quot;, &quot;armv5&quot;, &qu=
ot;armv6&quot;, &quot;armv4&quot;, &quot;powerpc64&quot;, &quot;aarch64&quo=
t;, &quot;riscv32&quot;, &quot;riscv64&quot;, &quot;x86&quot;, &quot;mips64=
&quot;, &quot;powerpc&quot;]<br>
&gt; +vars +=3D [&quot;mipsarch&quot;, &quot;x86-x32&quot;, &quot;mips16e&q=
uot;, &quot;microblaze&quot;, &quot;e5500-64b&quot;, &quot;mipsisa32&quot;,=
 &quot;mipsisa64&quot;]<br>
&gt; +vars +=3D [&quot;class-native&quot;, &quot;class-target&quot;, &quot;=
class-cross-canadian&quot;, &quot;class-cross&quot;, &quot;class-devupstrea=
m&quot;]<br>
&gt; +vars +=3D [&quot;tune-&quot;,=C2=A0 &quot;pn-&quot;, &quot;forcevaria=
ble&quot;]<br>
&gt; +vars +=3D [&quot;libc-musl&quot;, &quot;libc-glibc&quot;, &quot;libc-=
newlib&quot;,&quot;libc-baremetal&quot;]<br>
&gt; +vars +=3D [&quot;task-configure&quot;, &quot;task-compile&quot;, &quo=
t;task-install&quot;, &quot;task-clean&quot;, &quot;task-image-qa&quot;, &q=
uot;task-rm_work&quot;, &quot;task-image-complete&quot;, &quot;task-populat=
e-sdk&quot;]<br>
&gt; +vars +=3D [&quot;toolchain-clang&quot;, &quot;mydistro&quot;, &quot;n=
ios2&quot;, &quot;sdkmingw32&quot;, &quot;overrideone&quot;, &quot;override=
two&quot;]<br>
&gt; +vars +=3D [&quot;linux-gnux32&quot;, &quot;linux-muslx32&quot;, &quot=
;linux-gnun32&quot;, &quot;mingw32&quot;, &quot;poky&quot;, &quot;darwin&qu=
ot;, &quot;linuxstdbase&quot;]<br>
&gt; +vars +=3D [&quot;linux-gnueabi&quot;, &quot;eabi&quot;]<br>
&gt; +vars +=3D [&quot;virtclass-multilib&quot;, &quot;virtclass-mcextend&q=
uot;]<br>
&gt;<br>
&gt;=C2=A0 # List of strings to treat as overrides but only with whitespace=
 following or another override (more restricted matching).<br>
&gt;=C2=A0 # Handles issues with arc matching arch.<br>
&gt; -shortvars =3D [&quot;arc&quot;, &quot;mips&quot;, &quot;mipsel&quot;,=
 &quot;sh4&quot;]<br>
&gt; +shortvars =3D [&quot;arc&quot;, &quot;mips&quot;, &quot;mipsel&quot;,=
 &quot;sh4&quot;] + args.short_override<br>
&gt;<br>
&gt;=C2=A0 # Variables which take packagenames as an override<br>
&gt;=C2=A0 packagevars =3D [&quot;FILES&quot;, &quot;RDEPENDS&quot;, &quot;=
RRECOMMENDS&quot;, &quot;SUMMARY&quot;, &quot;DESCRIPTION&quot;, &quot;RSUG=
GESTS&quot;, &quot;RPROVIDES&quot;, &quot;RCONFLICTS&quot;, &quot;PKG&quot;=
, &quot;ALLOW_EMPTY&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pkg_postr=
m&quot;, &quot;pkg_postinst_ontarget&quot;, &quot;pkg_postinst&quot;, &quot=
;INITSCRIPT_NAME&quot;, &quot;INITSCRIPT_PARAMS&quot;, &quot;DEBIAN_NOAUTON=
AME&quot;, &quot;ALTERNATIVE&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;PKGE&quot=
;, &quot;PKGV&quot;, &quot;PKGR&quot;, &quot;USERADD_PARAM&quot;, &quot;GRO=
UPADD_PARAM&quot;, &quot;CONFFILES&quot;, &quot;SYSTEMD_SERVICE&quot;, &quo=
t;LICENSE&quot;, &quot;SECTION&quot;, &quot;pkg_preinst&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pkg_prerm=
&quot;, &quot;RREPLACES&quot;, &quot;GROUPMEMS_PARAM&quot;, &quot;SYSTEMD_A=
UTO_ENABLE&quot;, &quot;SKIP_FILEDEPS&quot;, &quot;PRIVATE_LIBS&quot;, &quo=
t;PACKAGE_ADD_METADATA&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;INSANE_SKIP&qu=
ot;, &quot;DEBIANNAME&quot;, &quot;SYSTEMD_SERVICE_ESCAPED&quot;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;INSANE_SKIP&qu=
ot;, &quot;DEBIANNAME&quot;, &quot;SYSTEMD_SERVICE_ESCAPED&quot;] + args.pa=
ckage_vars<br>
&gt;<br>
&gt;=C2=A0 # Expressions to skip if encountered, these are not overrides<br=
>
&gt; -skips =3D [&quot;parser_append&quot;, &quot;recipe_to_append&quot;, &=
quot;extra_append&quot;, &quot;to_remove&quot;, &quot;show_appends&quot;, &=
quot;applied_appends&quot;, &quot;file_appends&quot;, &quot;handle_remove&q=
uot;]<br>
&gt; -skips =3D skips + [&quot;expanded_removes&quot;, &quot;color_remove&q=
uot;, &quot;test_remove&quot;, &quot;empty_remove&quot;, &quot;toaster_prep=
end&quot;, &quot;num_removed&quot;, &quot;licfiles_append&quot;, &quot;_wri=
te_append&quot;]<br>
&gt; -skips =3D skips + [&quot;no_report_remove&quot;, &quot;test_prepend&q=
uot;, &quot;test_append&quot;, &quot;multiple_append&quot;, &quot;test_remo=
ve&quot;, &quot;shallow_remove&quot;, &quot;do_remove_layer&quot;, &quot;fi=
rst_append&quot;]<br>
&gt; -skips =3D skips + [&quot;parser_remove&quot;, &quot;to_append&quot;, =
&quot;no_remove&quot;, &quot;bblayers_add_remove&quot;, &quot;bblayers_remo=
ve&quot;, &quot;apply_append&quot;, &quot;is_x86&quot;, &quot;base_dep_prep=
end&quot;]<br>
&gt; -skips =3D skips + [&quot;autotools_dep_prepend&quot;, &quot;go_map_ar=
m&quot;, &quot;alt_remove_links&quot;, &quot;systemd_append_file&quot;, &qu=
ot;file_append&quot;, &quot;process_file_darwin&quot;]<br>
&gt; -skips =3D skips + [&quot;run_loaddata_poky&quot;, &quot;determine_if_=
poky_env&quot;, &quot;do_populate_poky_src&quot;, &quot;libc_cv_include_x86=
_isa_level&quot;, &quot;test_rpm_remove&quot;, &quot;do_install_armmultilib=
&quot;]<br>
&gt; -skips =3D skips + [&quot;get_appends_for_files&quot;, &quot;test_doub=
leref_remove&quot;, &quot;test_bitbakelayers_add_remove&quot;, &quot;elf32_=
x86_64&quot;, &quot;colour_remove&quot;, &quot;revmap_remove&quot;]<br>
&gt; -skips =3D skips + [&quot;test_rpm_remove&quot;, &quot;test_bitbakelay=
ers_add_remove&quot;, &quot;recipe_append_file&quot;, &quot;log_data_remove=
d&quot;, &quot;recipe_append&quot;, &quot;systemd_machine_unit_append&quot;=
]<br>
&gt; -skips =3D skips + [&quot;recipetool_append&quot;, &quot;changetype_re=
move&quot;, &quot;try_appendfile_wc&quot;, &quot;test_qemux86_directdisk&qu=
ot;, &quot;test_layer_appends&quot;, &quot;tgz_removed&quot;]<br>
&gt; -<br>
&gt; -imagevars =3D [&quot;IMAGE_CMD&quot;, &quot;EXTRA_IMAGECMD&quot;, &qu=
ot;IMAGE_TYPEDEP&quot;, &quot;CONVERSION_CMD&quot;, &quot;COMPRESS_CMD&quot=
;]<br>
&gt; -packagevars =3D packagevars + imagevars<br>
&gt; +skips =3D args.skip<br>
&gt; +skips +=3D [&quot;parser_append&quot;, &quot;recipe_to_append&quot;, =
&quot;extra_append&quot;, &quot;to_remove&quot;, &quot;show_appends&quot;, =
&quot;applied_appends&quot;, &quot;file_appends&quot;, &quot;handle_remove&=
quot;]<br>
&gt; +skips +=3D [&quot;expanded_removes&quot;, &quot;color_remove&quot;, &=
quot;test_remove&quot;, &quot;empty_remove&quot;, &quot;toaster_prepend&quo=
t;, &quot;num_removed&quot;, &quot;licfiles_append&quot;, &quot;_write_appe=
nd&quot;]<br>
&gt; +skips +=3D [&quot;no_report_remove&quot;, &quot;test_prepend&quot;, &=
quot;test_append&quot;, &quot;multiple_append&quot;, &quot;test_remove&quot=
;, &quot;shallow_remove&quot;, &quot;do_remove_layer&quot;, &quot;first_app=
end&quot;]<br>
&gt; +skips +=3D [&quot;parser_remove&quot;, &quot;to_append&quot;, &quot;n=
o_remove&quot;, &quot;bblayers_add_remove&quot;, &quot;bblayers_remove&quot=
;, &quot;apply_append&quot;, &quot;is_x86&quot;, &quot;base_dep_prepend&quo=
t;]<br>
&gt; +skips +=3D [&quot;autotools_dep_prepend&quot;, &quot;go_map_arm&quot;=
, &quot;alt_remove_links&quot;, &quot;systemd_append_file&quot;, &quot;file=
_append&quot;, &quot;process_file_darwin&quot;]<br>
&gt; +skips +=3D [&quot;run_loaddata_poky&quot;, &quot;determine_if_poky_en=
v&quot;, &quot;do_populate_poky_src&quot;, &quot;libc_cv_include_x86_isa_le=
vel&quot;, &quot;test_rpm_remove&quot;, &quot;do_install_armmultilib&quot;]=
<br>
&gt; +skips +=3D [&quot;get_appends_for_files&quot;, &quot;test_doubleref_r=
emove&quot;, &quot;test_bitbakelayers_add_remove&quot;, &quot;elf32_x86_64&=
quot;, &quot;colour_remove&quot;, &quot;revmap_remove&quot;]<br>
&gt; +skips +=3D [&quot;test_rpm_remove&quot;, &quot;test_bitbakelayers_add=
_remove&quot;, &quot;recipe_append_file&quot;, &quot;log_data_removed&quot;=
, &quot;recipe_append&quot;, &quot;systemd_machine_unit_append&quot;]<br>
&gt; +skips +=3D [&quot;recipetool_append&quot;, &quot;changetype_remove&qu=
ot;, &quot;try_appendfile_wc&quot;, &quot;test_qemux86_directdisk&quot;, &q=
uot;test_layer_appends&quot;, &quot;tgz_removed&quot;]<br>
&gt; +<br>
&gt; +imagevars =3D [&quot;IMAGE_CMD&quot;, &quot;EXTRA_IMAGECMD&quot;, &qu=
ot;IMAGE_TYPEDEP&quot;, &quot;CONVERSION_CMD&quot;, &quot;COMPRESS_CMD&quot=
;] + args.image_vars<br>
&gt; +packagevars +=3D imagevars<br>
&gt; +<br>
&gt; +skip_ext =3D [&quot;.html&quot;, &quot;.patch&quot;, &quot;.m4&quot;,=
 &quot;.diff&quot;] + args.skip_ext<br>
&gt;<br>
&gt;=C2=A0 vars_re =3D {}<br>
&gt;=C2=A0 for exp in vars:<br>
&gt; @@ -124,21 +136,20 @@ def processfile(fn):<br>
&gt;=C2=A0 ourname =3D os.path.basename(sys.argv[0])<br>
&gt;=C2=A0 ourversion =3D &quot;0.9.3&quot;<br>
&gt;<br>
&gt; -if os.path.isfile(sys.argv[1]):<br>
&gt; -=C2=A0 =C2=A0 processfile(sys.argv[1])<br>
&gt; -=C2=A0 =C2=A0 sys.exit(0)<br>
&gt; -<br>
&gt; -for targetdir in sys.argv[1:]:<br>
&gt; -=C2=A0 =C2=A0 print(&quot;processing directory &#39;%s&#39;&quot; % t=
argetdir)<br>
&gt; -=C2=A0 =C2=A0 for root, dirs, files in os.walk(targetdir):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 for name in files:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if name =3D=3D ourname:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn =3D os.path.join(root, n=
ame)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.islink(fn):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;/.git/&quot; in fn=
 or fn.endswith(&quot;.html&quot;) or fn.endswith(&quot;.patch&quot;) or fn=
.endswith(&quot;.m4&quot;) or fn.endswith(&quot;.diff&quot;):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 processfile(fn)<br>
&gt; +for p in args.path:<br>
&gt; +=C2=A0 =C2=A0 if os.path.isfile(p):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 processfile(p)<br>
&gt; +=C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 print(&quot;processing directory &#39;%s&=
#39;&quot; % p)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for root, dirs, files in os.walk(p):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for name in files:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if name =3D=
=3D ourname:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 continue<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn =3D os.pat=
h.join(root, name)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.is=
link(fn):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 continue<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;/.gi=
t/&quot; in fn or any(fn.endswith(ext) for ext in skip_ext):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 continue<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 processfile(f=
n)<br>
&gt;<br>
&gt;=C2=A0 print(&quot;All files processed with version %s&quot; % ourversi=
on)<br>
&gt; --<br>
&gt; 2.33.0<br>
&gt;<br>
</blockquote></div></div></div>

--0000000000008e8d8b05ed896c30--

