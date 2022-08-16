Return-Path: <kergoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48B8C25B0E
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 21:25:00 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.21491.1660685095599021754
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 14:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JuvJw3s1;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: kergoth@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id k26so21259949ejx.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 14:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=6zRq5k3CP+OaE/ZW4OugCasTfouQE+HHRE7X8Pto9CU=;
        b=JuvJw3s1s6AAa58mVS/YpRZcUPAxL/sEuWXE5rXy8z5a6I6U1jrZRWvrSx8a+rIS0m
         9x3nK0CvCp/V1gUPgctCUySdECe3ipfWa0jfn16zunlUrwnveyop+/1lbE/Ko8yqeu9H
         F0ONXt9zzksR6Jk1U2ImkFYwMkQauGyqoqF92j8yAOjTg1CQd/U3zF3IjTRVk9L8Nf6t
         xvYET5O+ieLnIExgd7vjP0KM0kMp7nNdouY620XhDlGFrF6QpojwnlQYFQbaSpv4kweZ
         /ZszvssG7h7ZxAaKg60q/bsT4fZGdHMcHxa8L8b3KGlrydccHNx46fqe3teJjrG9mGxD
         SNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=6zRq5k3CP+OaE/ZW4OugCasTfouQE+HHRE7X8Pto9CU=;
        b=eiSU68O2Uf8l7tHseMAWD13V2HsD9TvXYtSzAhUuPrdAoqnGJST4GbL0r4JwWYdQDZ
         b0wQvyelqlPe9fOJEIcMDpu+lyOqPkpHTc9uBpXWjERJDcDXA7Pje8S1zSZyw49sWsZ0
         MLWRY6zX7rJyS9TuRhiRAVghh0YAWd0KBiTGgEDXFv4esPm19lwcZewCaH4y7YVjWJYI
         2krWIjv0jO0ikbF9btHfOnlpj9FssmdBPcDxF0gU4kjVXw7ebrrsWtP0fnGYrdSaP+yk
         u0GQ+HJ7YgOIskTd5nR0oZhU8YUk5mGv6fK5rLw8YNwJVyJWujU4djEzcP0LoP8d6l97
         VmVA==
X-Gm-Message-State: ACgBeo3CmyZGOfKcA0/hHPDkIJKL9M8PAUgClmxZVzc4nPvwYyWB8ARo
	sqDD71h12kK4YGSmtEI/dwq8wiahx96qJavdo9g=
X-Google-Smtp-Source: 
 AA6agR72YLwEkvq/E055Z0GUUs2V7mlV3df63fxR6nEMls2vGkB1fo5bINmGpsn8RVQFZeJz2W4cKHCLj5qg/rhnvew=
X-Received: by 2002:a17:907:eaa:b0:730:c780:f71e with SMTP id
 ho42-20020a1709070eaa00b00730c780f71emr14025780ejc.770.1660685093786; Tue, 16
 Aug 2022 14:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220816205746.1672987-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220816205746.1672987-1-richard.purdie@linuxfoundation.org>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 16 Aug 2022 14:24:42 -0700
Message-ID: 
 <CABcZAN=A7X5E1442ci-br2EJhX_hOwaNHFYmv1A+RhB73KRbEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/8] package: Switch debug source handling to
 use prefix map
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000019567105e662614a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 21:25:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169463

--00000000000019567105e662614a
Content-Type: text/plain; charset="UTF-8"

Looks like a good series, thanks for your work on this. LGTM.

On Tue, Aug 16, 2022 at 1:57 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Reproducible builds are no longer a configuration option but are required.
> We also rely on the prefix mapping capability of the compilers now.
>
> As such, rewrite the source locating code to use the prefix maps instead
> of taking a guess about WORKDIR which isn't correct for kernels, gcc,
> externalsrc and probably more.
>
> Instead, iterate the maps to locate any matching source code, keeping
> in mind that multiple maps may map to one target location.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-global/package.bbclass | 68 ++++++++++++-----------------
>  1 file changed, 28 insertions(+), 40 deletions(-)
>
> diff --git a/meta/classes-global/package.bbclass
> b/meta/classes-global/package.bbclass
> index 418400da8c9..2d985d8affd 100644
> --- a/meta/classes-global/package.bbclass
> +++ b/meta/classes-global/package.bbclass
> @@ -565,26 +565,16 @@ def copydebugsources(debugsrcdir, sources, d):
>          objcopy = d.getVar("OBJCOPY")
>          workdir = d.getVar("WORKDIR")
>          sdir = d.getVar("S")
> -        sparentdir = os.path.dirname(os.path.dirname(sdir))
> -        sbasedir = os.path.basename(os.path.dirname(sdir)) + "/" +
> os.path.basename(sdir)
> -        workparentdir = os.path.dirname(os.path.dirname(workdir))
> -        workbasedir = os.path.basename(os.path.dirname(workdir)) + "/" +
> os.path.basename(workdir)
> -
> -        # If S isnt based on WORKDIR we can infer our sources are located
> elsewhere,
> -        # e.g. using externalsrc; use S as base for our dirs
> -        if workdir in sdir or 'work-shared' in sdir:
> -            basedir = workbasedir
> -            parentdir = workparentdir
> -        else:
> -            basedir = sbasedir
> -            parentdir = sparentdir
> +        cflags = d.expand("${CFLAGS}")
>
> -        # If build path exists in sourcefile, it means toolchain did not
> use
> -        # -fdebug-prefix-map to compile
> -        if checkbuildpath(sourcefile, d):
> -            localsrc_prefix = parentdir + "/"
> -        else:
> -            localsrc_prefix = "/usr/src/debug/"
> +        prefixmap = {}
> +        for flag in cflags.split():
> +            if not flag.startswith("-fdebug-prefix-map"):
> +                continue
> +            if "recipe-sysroot" in flag:
> +                continue
> +            flag = flag.split("=")
> +            prefixmap[flag[1]] = flag[2]
>
>          nosuchdir = []
>          basepath = dvar
> @@ -595,28 +585,26 @@ def copydebugsources(debugsrcdir, sources, d):
>          bb.utils.mkdirhier(basepath)
>          cpath.updatecache(basepath)
>
> -        # Ignore files from the recipe sysroots (target and native)
> -        processdebugsrc =  "LC_ALL=C ; sort -z -u '%s' | egrep -v -z
> '((<internal>|<built-in>)$|/.*recipe-sysroot.*/)' | "
> -        # We need to ignore files that are not actually ours
> -        # we do this by only paying attention to items from this package
> -        processdebugsrc += "fgrep -zw '%s' | "
> -        # Remove prefix in the source paths
> -        processdebugsrc += "sed 's#%s##g' | "
> -        processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner
> '%s%s' 2>/dev/null)"
> -
> -        cmd = processdebugsrc % (sourcefile, basedir, localsrc_prefix,
> parentdir, dvar, debugsrcdir)
> -        try:
> -            subprocess.check_output(cmd, shell=True,
> stderr=subprocess.STDOUT)
> -        except subprocess.CalledProcessError:
> -            # Can "fail" if internal headers/transient sources are
> attempted
> -            pass
> -
> -        # cpio seems to have a bug with -lL together and symbolic links
> are just copied, not dereferenced.
> -        # Work around this by manually finding and copying any symbolic
> links that made it through.
> -        cmd = "find %s%s -type l -print0 -delete | sed s#%s%s/##g | (cd
> '%s' ; cpio -pd0mL --no-preserve-owner '%s%s')" % \
> -                (dvar, debugsrcdir, dvar, debugsrcdir, parentdir, dvar,
> debugsrcdir)
> -        subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
> +        for pmap in prefixmap:
> +            # Ignore files from the recipe sysroots (target and native)
> +            cmd =  "LC_ALL=C ; sort -z -u '%s' | egrep -v -z
> '((<internal>|<built-in>)$|/.*recipe-sysroot.*/)' | " % sourcefile
> +            # We need to ignore files that are not actually ours
> +            # we do this by only paying attention to items from this
> package
> +            cmd += "fgrep -zw '%s' | " % prefixmap[pmap]
> +            # Remove prefix in the source paths
> +            cmd += "sed 's#%s/##g' | " % (prefixmap[pmap])
> +            cmd += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s'
> 2>/dev/null)" % (pmap, dvar, prefixmap[pmap])
>
> +            try:
> +                subprocess.check_output(cmd, shell=True,
> stderr=subprocess.STDOUT)
> +            except subprocess.CalledProcessError:
> +                # Can "fail" if internal headers/transient sources are
> attempted
> +                pass
> +            # cpio seems to have a bug with -lL together and symbolic
> links are just copied, not dereferenced.
> +            # Work around this by manually finding and copying any
> symbolic links that made it through.
> +            cmd = "find %s%s -type l -print0 -delete | sed s#%s%s/##g |
> (cd '%s' ; cpio -pd0mL --no-preserve-owner '%s%s')" % \
> +                    (dvar, prefixmap[pmap], dvar, prefixmap[pmap], pmap,
> dvar, prefixmap[pmap])
> +            subprocess.check_output(cmd, shell=True,
> stderr=subprocess.STDOUT)
>
>          # debugsources.list may be polluted from the host if we used
> externalsrc,
>          # cpio uses copy-pass and may have just created a directory
> structure
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169455):
> https://lists.openembedded.org/g/openembedded-core/message/169455
> Mute This Topic: https://lists.openembedded.org/mt/93068145/3617123
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> kergoth@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 
Christopher Larson
chris_larson@mentor.com, chris.larson@siemens.com, kergoth@gmail.com
Principal Software Engineer, Embedded Linux Solutions, Siemens Digital
Industries Software

--00000000000019567105e662614a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks like a good series, thanks for your work on this. LG=
TM.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, Aug 16, 2022 at 1:57 PM Richard Purdie &lt;<a href=3D"mailto:ric=
hard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Reproduc=
ible builds are no longer a configuration option but are required.<br>
We also rely on the prefix mapping capability of the compilers now.<br>
<br>
As such, rewrite the source locating code to use the prefix maps instead<br=
>
of taking a guess about WORKDIR which isn&#39;t correct for kernels, gcc,<b=
r>
externalsrc and probably more.<br>
<br>
Instead, iterate the maps to locate any matching source code, keeping<br>
in mind that multiple maps may map to one target location.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/classes-global/package.bbclass | 68 ++++++++++++----------------=
-<br>
=C2=A01 file changed, 28 insertions(+), 40 deletions(-)<br>
<br>
diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pack=
age.bbclass<br>
index 418400da8c9..2d985d8affd 100644<br>
--- a/meta/classes-global/package.bbclass<br>
+++ b/meta/classes-global/package.bbclass<br>
@@ -565,26 +565,16 @@ def copydebugsources(debugsrcdir, sources, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0objcopy =3D d.getVar(&quot;OBJCOPY&quot;)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0workdir =3D d.getVar(&quot;WORKDIR&quot;)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sdir =3D d.getVar(&quot;S&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sparentdir =3D os.path.dirname(os.path.dirname=
(sdir))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sbasedir =3D os.path.basename(os.path.dirname(=
sdir)) + &quot;/&quot; + os.path.basename(sdir)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 workparentdir =3D os.path.dirname(os.path.dirn=
ame(workdir))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 workbasedir =3D os.path.basename(os.path.dirna=
me(workdir)) + &quot;/&quot; + os.path.basename(workdir)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If S isnt based on WORKDIR we can infer our =
sources are located elsewhere,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # e.g. using externalsrc; use S as base for ou=
r dirs<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if workdir in sdir or &#39;work-shared&#39; in=
 sdir:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 basedir =3D workbasedir<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parentdir =3D workparentdir<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 basedir =3D sbasedir<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parentdir =3D sparentdir<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cflags =3D d.expand(&quot;${CFLAGS}&quot;)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If build path exists in sourcefile, it means=
 toolchain did not use<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # -fdebug-prefix-map to compile<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if checkbuildpath(sourcefile, d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 localsrc_prefix =3D parentdir + =
&quot;/&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 localsrc_prefix =3D &quot;/usr/s=
rc/debug/&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 prefixmap =3D {}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for flag in cflags.split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not flag.startswith(&quot;-fd=
ebug-prefix-map&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;recipe-sysroot&quot; in=
 flag:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flag =3D flag.split(&quot;=3D&qu=
ot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prefixmap[flag[1]] =3D flag[2]<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nosuchdir =3D []<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0basepath =3D dvar<br>
@@ -595,28 +585,26 @@ def copydebugsources(debugsrcdir, sources, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(basepath)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpath.updatecache(basepath)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ignore files from the recipe sysroots (targe=
t and native)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 processdebugsrc =3D=C2=A0 &quot;LC_ALL=3DC ; s=
ort -z -u &#39;%s&#39; | egrep -v -z &#39;((&lt;internal&gt;|&lt;built-in&g=
t;)$|/.*recipe-sysroot.*/)&#39; | &quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We need to ignore files that are not actuall=
y ours<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # we do this by only paying attention to items=
 from this package<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 processdebugsrc +=3D &quot;fgrep -zw &#39;%s&#=
39; | &quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove prefix in the source paths<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 processdebugsrc +=3D &quot;sed &#39;s#%s##g&#3=
9; | &quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 processdebugsrc +=3D &quot;(cd &#39;%s&#39; ; =
cpio -pd0mlL --no-preserve-owner &#39;%s%s&#39; 2&gt;/dev/null)&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D processdebugsrc % (sourcefile, basedir=
, localsrc_prefix, parentdir, dvar, debugsrcdir)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_output(cmd, she=
ll=3DTrue, stderr=3Dsubprocess.STDOUT)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 except subprocess.CalledProcessError:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Can &quot;fail&quot; if intern=
al headers/transient sources are attempted<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # cpio seems to have a bug with -lL together a=
nd symbolic links are just copied, not dereferenced.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Work around this by manually finding and cop=
ying any symbolic links that made it through.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;find %s%s -type l -print0 -delet=
e | sed s#%s%s/##g | (cd &#39;%s&#39; ; cpio -pd0mL --no-preserve-owner &#3=
9;%s%s&#39;)&quot; % \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (dvar, debugsrcdir=
, dvar, debugsrcdir, parentdir, dvar, debugsrcdir)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_output(cmd, shell=3DTrue, std=
err=3Dsubprocess.STDOUT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for pmap in prefixmap:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ignore files from the recipe s=
ysroots (target and native)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D=C2=A0 &quot;LC_ALL=3DC ;=
 sort -z -u &#39;%s&#39; | egrep -v -z &#39;((&lt;internal&gt;|&lt;built-in=
&gt;)$|/.*recipe-sysroot.*/)&#39; | &quot; % sourcefile<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We need to ignore files that a=
re not actually ours<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # we do this by only paying atte=
ntion to items from this package<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd +=3D &quot;fgrep -zw &#39;%s=
&#39; | &quot; % prefixmap[pmap]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove prefix in the source pa=
ths<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd +=3D &quot;sed &#39;s#%s/##g=
&#39; | &quot; % (prefixmap[pmap])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd +=3D &quot;(cd &#39;%s&#39; =
; cpio -pd0mlL --no-preserve-owner &#39;%s%s&#39; 2&gt;/dev/null)&quot; % (=
pmap, dvar, prefixmap[pmap])<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_o=
utput(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except subprocess.CalledProcessE=
rror:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Can &quot;fail&q=
uot; if internal headers/transient sources are attempted<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # cpio seems to have a bug with =
-lL together and symbolic links are just copied, not dereferenced.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Work around this by manually f=
inding and copying any symbolic links that made it through.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;find %s%s -type l =
-print0 -delete | sed s#%s%s/##g | (cd &#39;%s&#39; ; cpio -pd0mL --no-pres=
erve-owner &#39;%s%s&#39;)&quot; % \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (dva=
r, prefixmap[pmap], dvar, prefixmap[pmap], pmap, dvar, prefixmap[pmap])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_output(cmd, she=
ll=3DTrue, stderr=3Dsubprocess.STDOUT)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# debugsources.list may be polluted from =
the host if we used externalsrc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# cpio uses copy-pass and may have just c=
reated a directory structure<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#169455): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/169455" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/169455</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93068145/3617=
123" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93068145/3617123</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:kergoth@gmail.com" target=
=3D"_blank">kergoth@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><font color=3D=
"#333333">Christopher Larson<br><a>chris_larson@mentor.com</a>,=C2=A0<a>chr=
is.larson@siemens.com</a>,=C2=A0<a>kergoth@gmail.com</a><br>Principal Softw=
are Engineer,=C2=A0Embedded Linux Solutions,=C2=A0Siemens Digital Industrie=
s Software</font><br></div></div></div>

--00000000000019567105e662614a--

