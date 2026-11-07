Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3489.1794025004182384362
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 20:16:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GBgcEwzE;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b2d14968c9so12405937b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 20:16:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794025003; cv=none;
        d=google.com; s=arc-20260327;
        b=Sg/LaGF9UfAkzuyStkz10R+sjnpCNXg1ENpETk6/E64tsETYgQWDnI5RWiBZurIORU
         IqRhx++Ui6pK/UICukebIEN5g9Hi281eK5aB/+xzrypuXamXIxtckvGzsjoZs6pKSyFL
         Fb83vogM/+otdALebexvizOYmR3OLAMu77wzc/vUpSGYp6JM6DZuhicru0XuX/Hu8vyV
         04WJwuM6apSjwRxTUtW0D3E7eP6bSTnLPd97Kj0RqP5+92pip1HwcJQh2nXE3CS6uDyZ
         h3VG4LzHumkK8tOCfjJLf9vGhtOYgmOqgeIZ5eVeoMcEIjaVIDfL5iXDRx7nHFavabL/
         Ojag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sCg+jjwooedHhz1jAIMQ1Gc4ZU2W6ZG7gHbRfvTcVFw=;
        fh=itggigTvMzfJmWrxIero4LVGgBsCztVn9XO+kT39w0E=;
        b=dyB8rtG8KR3wC4DBwWcGZjeGnDYdvznmloPUeVLo7Q5rHMzeKGDuZOEYsGg0U37SzT
         JSJId1SPd/XflDBaJRq6Vne4u99MvNuI9SfgALs6ZEqd1dFtv8yJjDwYls3/ePZA8T8q
         W6xNfO3RmVYoVzkOM+YPERdfCI1rC9H9PaUcg5yoksVHZHt3ZCkmaW4q7hPKNzohliMH
         NJtqCuppAqhMr4yCuprKqTb3TarYCxCA06vfdpA3rn9l5vlKUivPCSY6NUrkuRpgf5Pn
         wJ3TvxaeatkSKNRW23c1jlhNsmXKArKaRXY7Lsw2e7F1DDq6MAaY9yLXmjZACZZqEECy
         L4cg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794025003; x=1794629803; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCg+jjwooedHhz1jAIMQ1Gc4ZU2W6ZG7gHbRfvTcVFw=;
        b=GBgcEwzEtGWuqOBOoyjWpT/6xvSoNz/LG0tqCzwSq4IOa/LdZKqGw6BRyLH4F/NnMs
         hlol4w9IRy3Agke0x+yQy0wP1TmKitI3dkOInrrXOE2Og6B2yNYUuLeDdmkSpnTk72qI
         jPoGjHH8SyxpRvYmRUFVydz7gdZdmcw2KESpFuJ+jPxSRjCye/abHzC9ToDsF+XJ5Bpb
         uGfU///f77DeXuDIDUkpAK/NQbb5/6kQisuhHozp1FsbIu49reSOR0uVOcxM1t9dkZ6z
         AcWWjk+tCxygYb1ru43GZCw/4vwxv+SwEfyVcYEbWyfRYnch7SWSpbbJeFI2HZOQzjEK
         +crg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794025003; x=1794629803;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sCg+jjwooedHhz1jAIMQ1Gc4ZU2W6ZG7gHbRfvTcVFw=;
        b=2sN+FxuYvpKR8SZB+dMqaSJQ23DNdP/IdGdcJHZfKbyglODmbPpPjgpDze3YBSbBq3
         2dp9mBHSCRX1ik5oqw2Gr+fiMIOSFO3ggUqcUS8+m0hAe3C09L72zuc72TPICWVZO5mS
         VPp2qN/J1oSzTpf1MguFjTXBEG6BzSq9fimPAEWA0SNOjPDMKBJ4uJBQUtCk5ftBtdBQ
         MhoZogitWvqlSCa2KaoWNMM7YLhOtIkjG3WSEGrrKBZ/DCbCl4QwoNpC0wqjEsYY2Ho8
         6mdkYUy9jqv9V7Lm1UARIwdN3mnn94TWJ8p0dllmX4VOZb26QwbJev/v/GcUalc9sVEs
         WGYw==
X-Gm-Message-State: APuU4Z9HR7ooBa7tNQLlamAxiX/8PgCRXoK9nLLniaUhSShQ5TXseaIw
	VGI99Vq1ZNEchGnRXFBlZ9v2YjryT9UycfjnC5ycgvvPq3LAvTAa+IF7WofsohA99/NOwojUMLN
	i1hGv/M/lEnA+b+WogDoxjXI+BKZ8d/A=
X-Gm-Gg: AYBFou0eYd0miyZi2zmGdZwkjs6hQflzeBc4TKpQaAi59X6jFIwXaOtBjRrEZj0XLet
	rSSxg0KSy9RhEjTvLKTkj65opswMUbUmvxDChoMboMHCOKnFUHuUiR9q1d7VFlyTSQXA3NnhRRi
	lIc7WdYt3rzOF3h68VZCf1wehPyMPZFnEiL0/YE+GTzKjCylLpOT1Cs6Xnv27NHKrH1bzRnMdZK
	v+srv8S29zhGEo7xlM+JE9jM4n0vaKq46PhQiHI9YyuTVsCwUa8APcfb0RvXvyLn9L8QwK4apaR
	Oe5gAdzNzZfogl8E4PHMjlxEJEen6z7YSKM0d0Zv8biB834J5XOSD65hfeILwopUOWH+dzGik51
	LpNemcZYSZ7AbtRKpLFBnMIM0awy9QRw+fbazSZ6/GPnDlEKwA3LZEZpKET1pYZZ5EqyezNkYG9
	WJe1TEsAoTHFlSN6kQPT5ffXVNxnTLeN4wTwX1gMIC/z+EQG0HrA/tJdwJOnYhEnrNpO3IZseB6
	Zx7hmP++8XuVF5lu5OFKelKDDLKr/QIx86I4ughaPWu8d1qSN7MTIf4DUN7aM8MSeQ0DFv/ozoE
	QWs1t5Y/hefO8ui/lMnMwSI/JIqFLuEmYN/491pckRZ0EfRZnCrn7UaRC2V3o6/Fq4+TzO4UejG
	cUGZ6YNS7
X-Received: by 2002:a05:690c:6287:b0:8ac:b167:4877 with SMTP id
 00721157ae682-8b34198a151mr22468197b3.36.1794025003065; Fri, 06 Nov 2026
 20:16:43 -0800 (PST)
MIME-Version: 1.0
References: <20261104224627.1280147-1-ricardo.salveti@oss.qualcomm.com>
In-Reply-To: <20261104224627.1280147-1-ricardo.salveti@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Nov 2026 20:16:16 -0800
X-Gm-Features: AclHuK_LHZTBmKJYicBrV7HcPO_dkEGsgGVH8Z82yOtHbLSBc2vhPlhJzpsCd2o
Message-ID: <CAMKF1srwqSR4Ebj1je7Q34GwS5cTfo-pwYzUK7juxgaoiQO1Yg@mail.gmail.com>
Subject: Re: [PATCH] llvm-project-source: make do_preconfigure re-entrant
To: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org, joaomarcos.costa@bootlin.com
Content-Type: multipart/alternative; boundary="00000000000006a453065fa7ffd5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2026 04:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249719

--00000000000006a453065fa7ffd5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 2:46=E2=80=AFPM Ricardo Salveti <
ricardo.salveti@oss.qualcomm.com> wrote:

> do_preconfigure replaces the //CLANG_EXTRA_OE_* anchors in the shared
> source tree with the vendor and distro lists of the current
> configuration, consuming the anchors, so it only works on a freshly
> patched tree.
>
> When the configuration changes in an existing TMPDIR, for example from
> DISTRO=3Dnodistro to a DISTRO with TARGET_VENDOR =3D "-qcom", do_unpack a=
nd
> do_patch stay valid and only do_preconfigure re-runs. Its seds find
> nothing to replace, so the tree keeps the previous vendor list while
> the task hash promises the new one. llvm-native and clang-native are
> built from that tree and published to sstate under the new hash, from
> where pristine builds of the same configuration restore them. That
> clang does not treat aarch64-qcom-linux as an OpenEmbedded vendor,
> skips the <sysroot>/usr/lib/<triple>/<version> GCC layout and finds no
> libstdc++ headers; mesa's rusticl bindgen fails with "'cstddef' file
> not found".
>
> Keep the anchors in place and insert the generated lines before them,
> each tagged with a comment naming its anchor, so that a run first
> drops what the previous run inserted. The task can now run any number
> of times, with any configuration, and always leaves the tree that
> configuration describes, as suggested when adding vardeps was proposed
> instead [1]. The generated code is unchanged apart from whitespace and
> the tags; an empty CLANG_EXTRA_OE_DISTRO now yields an IsOpenEmbedded()
> that returns false instead of invalid C++.
>
> Move the Gnu.cpp anchor onto a line of its own like the others. The
> changed patch also makes existing build directories, whose tree has
> already lost its anchors, unpack and patch the sources again.
>
> [1]
> https://patchwork.yoctoproject.org/project/oe-core/patch/20260623120818.1=
10754-5-joaomarcos.costa@bootlin.com/
>
> Assisted-by: Claude Code:claude-fable-5-1
> Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
> ---
>  ...t-anchor-for-adding-OE-distro-vendor.patch | 11 +--
>  .../clang/llvm-project-source.inc             | 83 ++++++++++---------
>  2 files changed, 50 insertions(+), 44 deletions(-)
>
> diff --git
> a/meta/recipes-devtools/clang/clang/0013-llvm-clang-Insert-anchor-for-add=
ing-OE-distro-vendor.patch
> b/meta/recipes-devtools/clang/clang/0013-llvm-clang-Insert-anchor-for-add=
ing-OE-distro-vendor.patch
> index aba7488323..b7c8b8e536 100644
> ---
> a/meta/recipes-devtools/clang/clang/0013-llvm-clang-Insert-anchor-for-add=
ing-OE-distro-vendor.patch
> +++
> b/meta/recipes-devtools/clang/clang/0013-llvm-clang-Insert-anchor-for-add=
ing-OE-distro-vendor.patch
> @@ -98,10 +98,10 @@ Signed-off-by: Jo=C3=A3o Marcos Costa <
> joaomarcos.costa@bootlin.com>
>  ---
>   clang/include/clang/Driver/Distro.h   | 2 ++
>   clang/lib/Driver/Distro.cpp           | 1 +
> - clang/lib/Driver/ToolChains/Gnu.cpp   | 1 +
> + clang/lib/Driver/ToolChains/Gnu.cpp   | 2 ++
>   clang/lib/Driver/ToolChains/Linux.cpp | 2 ++
>   llvm/lib/TargetParser/Triple.cpp      | 1 +
> - 5 files changed, 7 insertions(+)
> + 5 files changed, 8 insertions(+)
>
>  diff --git a/clang/include/clang/Driver/Distro.h
> b/clang/include/clang/Driver/Distro.h
>  index aa4b3e1..2d77a2b 100644
> @@ -136,14 +136,15 @@ index 585497e..3b58ac7 100644
>     return Version;
>   }
>  diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp
> b/clang/lib/Driver/ToolChains/Gnu.cpp
> -index f44663f..73ff1f4 100644
> +index dfb0390..82a3bac 100644
>  --- a/clang/lib/Driver/ToolChains/Gnu.cpp
>  +++ b/clang/lib/Driver/ToolChains/Gnu.cpp
> -@@ -2371,6 +2371,7 @@ void
> Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
> +@@ -2383,6 +2383,8 @@ void
> Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
>         "x86_64-pc-linux-gnu",    "x86_64-redhat-linux6E",
>         "x86_64-redhat-linux",    "x86_64-suse-linux",
>         "x86_64-manbo-linux-gnu", "x86_64-slackware-linux",
> -+      "x86_64-oe-linux",//CLANG_EXTRA_OE_VENDORS_TRIPLES
> ++      "x86_64-oe-linux",
> ++      //CLANG_EXTRA_OE_VENDORS_TRIPLES
>         "x86_64-unknown-linux",   "x86_64-amazon-linux"};
>     static const char *const X32Triples[] =3D {"x86_64-linux-gnux32",
>                                              "x86_64-pc-linux-gnux32"};
> diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc
> b/meta/recipes-devtools/clang/llvm-project-source.inc
> index 5cd08d4085..370fbc493d 100644
> --- a/meta/recipes-devtools/clang/llvm-project-source.inc
> +++ b/meta/recipes-devtools/clang/llvm-project-source.inc
> @@ -31,14 +31,30 @@ CLANG_EXTRA_OE_DISTRO ?=3D "poky:poky"
>  # Match with MULTILIB_GLOBAL_VARIANTS
>  ML_VARIANTS =3D "lib32 lib64 libx32"
>
> +# Insert lines before the //<anchor> comment in path. The anchor stays i=
n
> +# place and every inserted line carries a comment naming it, so a later
> run
> +# of do_preconfigure on the same shared tree first drops what the previo=
us
> +# run inserted: the result only depends on the current configuration.
> +def clang_oe_generate(path, anchor, lines):
> +    anchor_comment =3D "//" + anchor
> +    marker =3D "// do_preconfigure: " + anchor
> +    with open(path) as f:
> +        content =3D [line for line in f.read().split("\n") if not
> line.rstrip().endswith(marker)]
> +    anchors =3D [i for i, line in enumerate(content) if
> line.rstrip().endswith(anchor_comment)]
> +    if len(anchors) !=3D 1:
> +        bb.fatal("Expected one %s anchor in %s, found %d" %
> (anchor_comment, path, len(anchors)))
> +    i =3D anchors[0]
> +    indent =3D content[i][:len(content[i]) - len(content[i].lstrip())]
> +    content[i:i] =3D [indent + line + " " + marker for line in lines]
> +    with open(path, "w") as f:
> +        f.write("\n".join(content))
> +
>

Looks good.
it  could skip the write when the content hasn't changed, so that
re-running the task doesn't bump
mtimes in the shared tree. That can be a follow-up as well.

Reviewed-by: Khem Raj <raj.khem@gmail.com>


>  python do_preconfigure() {
> -    import subprocess
> -    case =3D ""
> -    triple =3D ""
> -    vendors =3D d.getVar('CLANG_EXTRA_OE_VENDORS')
> +    source =3D d.getVar("S")
>      multilib_variants =3D (d.getVar("ML_VARIANTS") or "").split()
> +
>      vendors_to_add =3D []
> -    for vendor in vendors.split():
> +    for vendor in (d.getVar('CLANG_EXTRA_OE_VENDORS') or "").split():
>          # convert -yoe into yoe
>          vendor =3D vendor.lstrip('-')
>          # generate possible multilib vendor names for yoe
> @@ -48,45 +64,34 @@ python do_preconfigure() {
>          if vendor !=3D "oe":
>              vendors_to_add.append(vendor)
>
> -    for vendor_to_add in vendors_to_add:
> -        case +=3D '\\n    .Case("' + vendor_to_add + '",
> Triple::OpenEmbedded)'
> -        triple +=3D ' "x86_64-' + vendor_to_add + '-linux",'
> -
>      bb.note("Adding support following TARGET_VENDOR values")
>      bb.note(str(vendors_to_add))
>      bb.note("in llvm/lib/TargetParser/Triple.cpp and
> ${S}/clang/lib/Driver/ToolChains/Gnu.cpp")
> -    source =3D d.getVar("S")
> -    cmd =3D ['sed', '-i', 's#//CLANG_EXTRA_OE_VENDORS_TRIPLES#%s#g' %
> triple, source + '/clang/lib/Driver/ToolChains/Gnu.cpp']
> -    subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)
> -    cmd =3D ['sed', '-i', 's#//CLANG_EXTRA_OE_VENDORS_CASES#%s#g' % case=
,
> source + '/llvm/lib/TargetParser/Triple.cpp']
> -    subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)
> -
> -    case =3D ""
> -    triple =3D ""
> -    name =3D ""
> -    check =3D ""
> -    oe_names =3D []
> -    distros =3D d.getVar('CLANG_EXTRA_OE_DISTRO')
> -    for distro in distros.split():
> -        distro_id_raw =3D distro.split(":")[0]
> -        distro_id =3D distro_id_raw.replace('-','_')
> -        distro_triple =3D distro.split(":")[1]
> -        case +=3D '\\n    .Case("' + distro_id_raw + '", Distro::' +
> distro_id.upper() + ')'
> -        triple +=3D '\\n   if (Distro.Is' + distro_id.upper() + '())\\n
>  return "x86_64-' + distro_triple + '-linux";'
> -        name +=3D '\\n    '+ distro_id.upper() + ','
> -        check +=3D '\\nbool Is' + distro_id.upper() + '() const { return
> DistroVal =3D=3D ' + distro_id.upper() + '; }'
> -        oe_names.append('DistroVal =3D=3D ' + distro_id.upper())
> +    clang_oe_generate(source + '/llvm/lib/TargetParser/Triple.cpp',
> 'CLANG_EXTRA_OE_VENDORS_CASES',
> +                      ['.Case("%s", Triple::OpenEmbedded)' % v for v in
> vendors_to_add])
> +    clang_oe_generate(source + '/clang/lib/Driver/ToolChains/Gnu.cpp',
> 'CLANG_EXTRA_OE_VENDORS_TRIPLES',
> +                      ['"x86_64-%s-linux",' % v for v in vendors_to_add]=
)
>
> -    check +=3D '\\nbool IsOpenEmbedded() const { return ' + ' ||
> '.join(oe_names) + '; }'
> +    names =3D []
> +    checks =3D []
> +    cases =3D []
> +    triples =3D []
> +    oe_checks =3D []
> +    for distro in (d.getVar('CLANG_EXTRA_OE_DISTRO') or "").split():
> +        distro_id, distro_triple =3D distro.split(":")
> +        # the ID doubles as a C++ enumerator name
> +        enum =3D distro_id.replace('-', '_').upper()
> +        names.append(enum + ",")
> +        checks.append("bool Is%s() const { return DistroVal =3D=3D %s; }=
" %
> (enum, enum))
> +        cases.append('.Case("%s", Distro::%s)' % (distro_id, enum))
> +        triples.append('if (Distro.Is%s()) return "x86_64-%s-linux";' %
> (enum, distro_triple))
> +        oe_checks.append("DistroVal =3D=3D " + enum)
> +    checks.append("bool IsOpenEmbedded() const { return %s; }" % (" ||
> ".join(oe_checks) or "false"))
>
> -    cmd =3D ['sed', '-i', 's#//CLANG_EXTRA_OE_DISTRO_NAME#%s#g' % name,
> source + '/clang/include/clang/Driver/Distro.h']
> -    subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)
> -    cmd =3D ['sed', '-i', 's#//CLANG_EXTRA_OE_DISTRO_CHECK#%s#g' % check=
,
> source + '/clang/include/clang/Driver/Distro.h']
> -    subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)
> -    cmd =3D ['sed', '-i', 's#//CLANG_EXTRA_OE_DISTRO_TRIPLE#%s#g' % trip=
le,
> source + '/clang/lib/Driver/ToolChains/Linux.cpp']
> -    subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)
> -    cmd =3D ['sed', '-i', 's#//CLANG_EXTRA_OE_DISTRO_CASE#%s#g' % case,
> source + '/clang/lib/Driver/Distro.cpp']
> -    subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)
> +    clang_oe_generate(source + '/clang/include/clang/Driver/Distro.h',
> 'CLANG_EXTRA_OE_DISTRO_NAME', names)
> +    clang_oe_generate(source + '/clang/include/clang/Driver/Distro.h',
> 'CLANG_EXTRA_OE_DISTRO_CHECK', checks)
> +    clang_oe_generate(source + '/clang/lib/Driver/Distro.cpp',
> 'CLANG_EXTRA_OE_DISTRO_CASE', cases)
> +    clang_oe_generate(source + '/clang/lib/Driver/ToolChains/Linux.cpp',
> 'CLANG_EXTRA_OE_DISTRO_TRIPLE', triples)
>  }
>
>  do_patch[vardepsexclude] +=3D "MULTILIBS MULTILIB_VARIANTS"
> --
> 2.43.0
>
>

--00000000000006a453065fa7ffd5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 4, =
2026 at 2:46=E2=80=AFPM Ricardo Salveti &lt;<a href=3D"mailto:ricardo.salve=
ti@oss.qualcomm.com">ricardo.salveti@oss.qualcomm.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">do_preconfigure replac=
es the //CLANG_EXTRA_OE_* anchors in the shared<br>
source tree with the vendor and distro lists of the current<br>
configuration, consuming the anchors, so it only works on a freshly<br>
patched tree.<br>
<br>
When the configuration changes in an existing TMPDIR, for example from<br>
DISTRO=3Dnodistro to a DISTRO with TARGET_VENDOR =3D &quot;-qcom&quot;, do_=
unpack and<br>
do_patch stay valid and only do_preconfigure re-runs. Its seds find<br>
nothing to replace, so the tree keeps the previous vendor list while<br>
the task hash promises the new one. llvm-native and clang-native are<br>
built from that tree and published to sstate under the new hash, from<br>
where pristine builds of the same configuration restore them. That<br>
clang does not treat aarch64-qcom-linux as an OpenEmbedded vendor,<br>
skips the &lt;sysroot&gt;/usr/lib/&lt;triple&gt;/&lt;version&gt; GCC layout=
 and finds no<br>
libstdc++ headers; mesa&#39;s rusticl bindgen fails with &quot;&#39;cstddef=
&#39; file<br>
not found&quot;.<br>
<br>
Keep the anchors in place and insert the generated lines before them,<br>
each tagged with a comment naming its anchor, so that a run first<br>
drops what the previous run inserted. The task can now run any number<br>
of times, with any configuration, and always leaves the tree that<br>
configuration describes, as suggested when adding vardeps was proposed<br>
instead [1]. The generated code is unchanged apart from whitespace and<br>
the tags; an empty CLANG_EXTRA_OE_DISTRO now yields an IsOpenEmbedded()<br>
that returns false instead of invalid C++.<br>
<br>
Move the Gnu.cpp anchor onto a line of its own like the others. The<br>
changed patch also makes existing build directories, whose tree has<br>
already lost its anchors, unpack and patch the sources again.<br>
<br>
[1] <a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/202=
60623120818.110754-5-joaomarcos.costa@bootlin.com/" rel=3D"noreferrer" targ=
et=3D"_blank">https://patchwork.yoctoproject.org/project/oe-core/patch/2026=
0623120818.110754-5-joaomarcos.costa@bootlin.com/</a><br>
<br>
Assisted-by: Claude Code:claude-fable-5-1<br>
Signed-off-by: Ricardo Salveti &lt;<a href=3D"mailto:ricardo.salveti@oss.qu=
alcomm.com" target=3D"_blank">ricardo.salveti@oss.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0...t-anchor-for-adding-OE-distro-vendor.patch | 11 +--<br>
=C2=A0.../clang/llvm-project-source.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 83 ++++++++++---------<br>
=C2=A02 files changed, 50 insertions(+), 44 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/clang/clang/0013-llvm-clang-Insert-ancho=
r-for-adding-OE-distro-vendor.patch b/meta/recipes-devtools/clang/clang/001=
3-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch<br>
index aba7488323..b7c8b8e536 100644<br>
--- a/meta/recipes-devtools/clang/clang/0013-llvm-clang-Insert-anchor-for-a=
dding-OE-distro-vendor.patch<br>
+++ b/meta/recipes-devtools/clang/clang/0013-llvm-clang-Insert-anchor-for-a=
dding-OE-distro-vendor.patch<br>
@@ -98,10 +98,10 @@ Signed-off-by: Jo=C3=A3o Marcos Costa &lt;<a href=3D"ma=
ilto:joaomarcos.costa@bootlin.com" target=3D"_blank">joaomarcos.costa@bootl=
in.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 clang/include/clang/Driver/Distro.h=C2=A0 =C2=A0| 2 ++<br>
=C2=A0 clang/lib/Driver/Distro.cpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 1 +<br>
- clang/lib/Driver/ToolChains/Gnu.cpp=C2=A0 =C2=A0| 1 +<br>
+ clang/lib/Driver/ToolChains/Gnu.cpp=C2=A0 =C2=A0| 2 ++<br>
=C2=A0 clang/lib/Driver/ToolChains/Linux.cpp | 2 ++<br>
=C2=A0 llvm/lib/TargetParser/Triple.cpp=C2=A0 =C2=A0 =C2=A0 | 1 +<br>
- 5 files changed, 7 insertions(+)<br>
+ 5 files changed, 8 insertions(+)<br>
<br>
=C2=A0diff --git a/clang/include/clang/Driver/Distro.h b/clang/include/clan=
g/Driver/Distro.h<br>
=C2=A0index aa4b3e1..2d77a2b 100644<br>
@@ -136,14 +136,15 @@ index 585497e..3b58ac7 100644<br>
=C2=A0 =C2=A0 return Version;<br>
=C2=A0 }<br>
=C2=A0diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/T=
oolChains/Gnu.cpp<br>
-index f44663f..73ff1f4 100644<br>
+index dfb0390..82a3bac 100644<br>
=C2=A0--- a/clang/lib/Driver/ToolChains/Gnu.cpp<br>
=C2=A0+++ b/clang/lib/Driver/ToolChains/Gnu.cpp<br>
-@@ -2371,6 +2371,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaul=
tGCCPrefixes(<br>
+@@ -2383,6 +2383,8 @@ void Generic_GCC::GCCInstallationDetector::AddDefaul=
tGCCPrefixes(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;x86_64-pc-linux-gnu&quot;,=C2=A0 =C2=A0 &=
quot;x86_64-redhat-linux6E&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;x86_64-redhat-linux&quot;,=C2=A0 =C2=A0 &=
quot;x86_64-suse-linux&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;x86_64-manbo-linux-gnu&quot;, &quot;x86_6=
4-slackware-linux&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 &quot;x86_64-oe-linux&quot;,//CLANG_EXTRA_OE_VENDORS=
_TRIPLES<br>
++=C2=A0 =C2=A0 =C2=A0 &quot;x86_64-oe-linux&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 //CLANG_EXTRA_OE_VENDORS_TRIPLES<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;x86_64-unknown-linux&quot;,=C2=A0 =C2=A0&=
quot;x86_64-amazon-linux&quot;};<br>
=C2=A0 =C2=A0 static const char *const X32Triples[] =3D {&quot;x86_64-linux=
-gnux32&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;x86_64-pc-linux-gnux32&quot;};<br>
diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/rec=
ipes-devtools/clang/llvm-project-source.inc<br>
index 5cd08d4085..370fbc493d 100644<br>
--- a/meta/recipes-devtools/clang/llvm-project-source.inc<br>
+++ b/meta/recipes-devtools/clang/llvm-project-source.inc<br>
@@ -31,14 +31,30 @@ CLANG_EXTRA_OE_DISTRO ?=3D &quot;poky:poky&quot;<br>
=C2=A0# Match with MULTILIB_GLOBAL_VARIANTS<br>
=C2=A0ML_VARIANTS =3D &quot;lib32 lib64 libx32&quot;<br>
<br>
+# Insert lines before the //&lt;anchor&gt; comment in path. The anchor sta=
ys in<br>
+# place and every inserted line carries a comment naming it, so a later ru=
n<br>
+# of do_preconfigure on the same shared tree first drops what the previous=
<br>
+# run inserted: the result only depends on the current configuration.<br>
+def clang_oe_generate(path, anchor, lines):<br>
+=C2=A0 =C2=A0 anchor_comment =3D &quot;//&quot; + anchor<br>
+=C2=A0 =C2=A0 marker =3D &quot;// do_preconfigure: &quot; + anchor<br>
+=C2=A0 =C2=A0 with open(path) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 content =3D [line for line in f.read().split(&=
quot;\n&quot;) if not line.rstrip().endswith(marker)]<br>
+=C2=A0 =C2=A0 anchors =3D [i for i, line in enumerate(content) if line.rst=
rip().endswith(anchor_comment)]<br>
+=C2=A0 =C2=A0 if len(anchors) !=3D 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;Expected one %s anchor in %s, f=
ound %d&quot; % (anchor_comment, path, len(anchors)))<br>
+=C2=A0 =C2=A0 i =3D anchors[0]<br>
+=C2=A0 =C2=A0 indent =3D content[i][:len(content[i]) - len(content[i].lstr=
ip())]<br>
+=C2=A0 =C2=A0 content[i:i] =3D [indent + line + &quot; &quot; + marker for=
 line in lines]<br>
+=C2=A0 =C2=A0 with open(path, &quot;w&quot;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(&quot;\n&quot;.join(content))<br>
+<br></blockquote><div><br></div><div>Looks good.</div>it=C2=A0 could skip =
the write when the content hasn&#39;t changed, so that re-running the task =
doesn&#39;t bump<br>mtimes in the shared tree. That can be a follow-up as w=
ell.<br><br><div><span style=3D"background-color:transparent">Reviewed-by: =
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&g=
t;</span></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
=C2=A0python do_preconfigure() {<br>
-=C2=A0 =C2=A0 import subprocess<br>
-=C2=A0 =C2=A0 case =3D &quot;&quot;<br>
-=C2=A0 =C2=A0 triple =3D &quot;&quot;<br>
-=C2=A0 =C2=A0 vendors =3D d.getVar(&#39;CLANG_EXTRA_OE_VENDORS&#39;)<br>
+=C2=A0 =C2=A0 source =3D d.getVar(&quot;S&quot;)<br>
=C2=A0 =C2=A0 =C2=A0multilib_variants =3D (d.getVar(&quot;ML_VARIANTS&quot;=
) or &quot;&quot;).split()<br>
+<br>
=C2=A0 =C2=A0 =C2=A0vendors_to_add =3D []<br>
-=C2=A0 =C2=A0 for vendor in vendors.split():<br>
+=C2=A0 =C2=A0 for vendor in (d.getVar(&#39;CLANG_EXTRA_OE_VENDORS&#39;) or=
 &quot;&quot;).split():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# convert -yoe into yoe<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vendor =3D vendor.lstrip(&#39;-&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# generate possible multilib vendor names=
 for yoe<br>
@@ -48,45 +64,34 @@ python do_preconfigure() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if vendor !=3D &quot;oe&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vendors_to_add.append(vendo=
r)<br>
<br>
-=C2=A0 =C2=A0 for vendor_to_add in vendors_to_add:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case +=3D &#39;\\n=C2=A0 =C2=A0 .Case(&quot;&#=
39; + vendor_to_add + &#39;&quot;, Triple::OpenEmbedded)&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 triple +=3D &#39; &quot;x86_64-&#39; + vendor_=
to_add + &#39;-linux&quot;,&#39;<br>
-<br>
=C2=A0 =C2=A0 =C2=A0bb.note(&quot;Adding support following TARGET_VENDOR va=
lues&quot;)<br>
=C2=A0 =C2=A0 =C2=A0bb.note(str(vendors_to_add))<br>
=C2=A0 =C2=A0 =C2=A0bb.note(&quot;in llvm/lib/TargetParser/Triple.cpp and $=
{S}/clang/lib/Driver/ToolChains/Gnu.cpp&quot;)<br>
-=C2=A0 =C2=A0 source =3D d.getVar(&quot;S&quot;)<br>
-=C2=A0 =C2=A0 cmd =3D [&#39;sed&#39;, &#39;-i&#39;, &#39;s#//CLANG_EXTRA_O=
E_VENDORS_TRIPLES#%s#g&#39; % triple, source + &#39;/clang/lib/Driver/ToolC=
hains/Gnu.cpp&#39;]<br>
-=C2=A0 =C2=A0 subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)<br>
-=C2=A0 =C2=A0 cmd =3D [&#39;sed&#39;, &#39;-i&#39;, &#39;s#//CLANG_EXTRA_O=
E_VENDORS_CASES#%s#g&#39; % case, source + &#39;/llvm/lib/TargetParser/Trip=
le.cpp&#39;]<br>
-=C2=A0 =C2=A0 subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)<br>
-<br>
-=C2=A0 =C2=A0 case =3D &quot;&quot;<br>
-=C2=A0 =C2=A0 triple =3D &quot;&quot;<br>
-=C2=A0 =C2=A0 name =3D &quot;&quot;<br>
-=C2=A0 =C2=A0 check =3D &quot;&quot;<br>
-=C2=A0 =C2=A0 oe_names =3D []<br>
-=C2=A0 =C2=A0 distros =3D d.getVar(&#39;CLANG_EXTRA_OE_DISTRO&#39;)<br>
-=C2=A0 =C2=A0 for distro in distros.split():<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 distro_id_raw =3D distro.split(&quot;:&quot;)[=
0]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 distro_id =3D distro_id_raw.replace(&#39;-&#39=
;,&#39;_&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 distro_triple =3D distro.split(&quot;:&quot;)[=
1]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case +=3D &#39;\\n=C2=A0 =C2=A0 .Case(&quot;&#=
39; + distro_id_raw + &#39;&quot;, Distro::&#39; + distro_id.upper() + &#39=
;)&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 triple +=3D &#39;\\n=C2=A0 =C2=A0if (Distro.Is=
&#39; + distro_id.upper() + &#39;())\\n=C2=A0 =C2=A0 =C2=A0return &quot;x86=
_64-&#39; + distro_triple + &#39;-linux&quot;;&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 name +=3D &#39;\\n=C2=A0 =C2=A0 &#39;+ distro_=
id.upper() + &#39;,&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 check +=3D &#39;\\nbool Is&#39; + distro_id.up=
per() + &#39;() const { return DistroVal =3D=3D &#39; + distro_id.upper() +=
 &#39;; }&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_names.append(&#39;DistroVal =3D=3D &#39; + =
distro_id.upper())<br>
+=C2=A0 =C2=A0 clang_oe_generate(source + &#39;/llvm/lib/TargetParser/Tripl=
e.cpp&#39;, &#39;CLANG_EXTRA_OE_VENDORS_CASES&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 [&#39;.Case(&quot;%s&quot;, Triple::OpenEmbedded)&#39; % v for v in ven=
dors_to_add])<br>
+=C2=A0 =C2=A0 clang_oe_generate(source + &#39;/clang/lib/Driver/ToolChains=
/Gnu.cpp&#39;, &#39;CLANG_EXTRA_OE_VENDORS_TRIPLES&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 [&#39;&quot;x86_64-%s-linux&quot;,&#39; % v for v in vendors_to_add])<b=
r>
<br>
-=C2=A0 =C2=A0 check +=3D &#39;\\nbool IsOpenEmbedded() const { return &#39=
; + &#39; || &#39;.join(oe_names) + &#39;; }&#39;<br>
+=C2=A0 =C2=A0 names =3D []<br>
+=C2=A0 =C2=A0 checks =3D []<br>
+=C2=A0 =C2=A0 cases =3D []<br>
+=C2=A0 =C2=A0 triples =3D []<br>
+=C2=A0 =C2=A0 oe_checks =3D []<br>
+=C2=A0 =C2=A0 for distro in (d.getVar(&#39;CLANG_EXTRA_OE_DISTRO&#39;) or =
&quot;&quot;).split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 distro_id, distro_triple =3D distro.split(&quo=
t;:&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # the ID doubles as a C++ enumerator name<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 enum =3D distro_id.replace(&#39;-&#39;, &#39;_=
&#39;).upper()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 names.append(enum + &quot;,&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 checks.append(&quot;bool Is%s() const { return=
 DistroVal =3D=3D %s; }&quot; % (enum, enum))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cases.append(&#39;.Case(&quot;%s&quot;, Distro=
::%s)&#39; % (distro_id, enum))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 triples.append(&#39;if (Distro.Is%s()) return =
&quot;x86_64-%s-linux&quot;;&#39; % (enum, distro_triple))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_checks.append(&quot;DistroVal =3D=3D &quot;=
 + enum)<br>
+=C2=A0 =C2=A0 checks.append(&quot;bool IsOpenEmbedded() const { return %s;=
 }&quot; % (&quot; || &quot;.join(oe_checks) or &quot;false&quot;))<br>
<br>
-=C2=A0 =C2=A0 cmd =3D [&#39;sed&#39;, &#39;-i&#39;, &#39;s#//CLANG_EXTRA_O=
E_DISTRO_NAME#%s#g&#39; % name, source + &#39;/clang/include/clang/Driver/D=
istro.h&#39;]<br>
-=C2=A0 =C2=A0 subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)<br>
-=C2=A0 =C2=A0 cmd =3D [&#39;sed&#39;, &#39;-i&#39;, &#39;s#//CLANG_EXTRA_O=
E_DISTRO_CHECK#%s#g&#39; % check, source + &#39;/clang/include/clang/Driver=
/Distro.h&#39;]<br>
-=C2=A0 =C2=A0 subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)<br>
-=C2=A0 =C2=A0 cmd =3D [&#39;sed&#39;, &#39;-i&#39;, &#39;s#//CLANG_EXTRA_O=
E_DISTRO_TRIPLE#%s#g&#39; % triple, source + &#39;/clang/lib/Driver/ToolCha=
ins/Linux.cpp&#39;]<br>
-=C2=A0 =C2=A0 subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)<br>
-=C2=A0 =C2=A0 cmd =3D [&#39;sed&#39;, &#39;-i&#39;, &#39;s#//CLANG_EXTRA_O=
E_DISTRO_CASE#%s#g&#39; % case, source + &#39;/clang/lib/Driver/Distro.cpp&=
#39;]<br>
-=C2=A0 =C2=A0 subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT)<br>
+=C2=A0 =C2=A0 clang_oe_generate(source + &#39;/clang/include/clang/Driver/=
Distro.h&#39;, &#39;CLANG_EXTRA_OE_DISTRO_NAME&#39;, names)<br>
+=C2=A0 =C2=A0 clang_oe_generate(source + &#39;/clang/include/clang/Driver/=
Distro.h&#39;, &#39;CLANG_EXTRA_OE_DISTRO_CHECK&#39;, checks)<br>
+=C2=A0 =C2=A0 clang_oe_generate(source + &#39;/clang/lib/Driver/Distro.cpp=
&#39;, &#39;CLANG_EXTRA_OE_DISTRO_CASE&#39;, cases)<br>
+=C2=A0 =C2=A0 clang_oe_generate(source + &#39;/clang/lib/Driver/ToolChains=
/Linux.cpp&#39;, &#39;CLANG_EXTRA_OE_DISTRO_TRIPLE&#39;, triples)<br>
=C2=A0}<br>
<br>
=C2=A0do_patch[vardepsexclude] +=3D &quot;MULTILIBS MULTILIB_VARIANTS&quot;=
<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div></div>

--00000000000006a453065fa7ffd5--
