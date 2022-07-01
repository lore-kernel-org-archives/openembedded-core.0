Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3E1C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 11:06:17 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.36539.1656673567625795153
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 04:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ms8mskGX;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id r9so2170942ljp.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 04:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ITFGBT+PvvxedpmYmR8xvgGFdzv+8occIus3MSVRXQE=;
        b=ms8mskGXxIh1LegngYXjLWJhJseqRFNTdFeyOGKVncpwCZ17mS4P5JZKnxEIX5yZgT
         eekvQySm84Ipjbgl9C9vH/4fK7lIa+9YTw7+xMKD9iWjV/TRgwM+Oe1s9snU0kWUbN7D
         yOAK3VZPpCDij4w0CtFG0gIpRBrSmLUUwzw5Sa7Net/eCfhz0rkA4hifHgSJu1Hh/3Y9
         8IH/Vq8EObdR6CydVDXp6eps9XeYsPiqWFMCTnFOGDpxd13M9tJpWVEsmlIZQw7SvmHn
         n8/TlFJ5U9LuzLKzuXUlBI4XwDIorwHT9TRUR+pRGC3vW7V7jYwuu6H1N7VzIkH7v2TF
         ZqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ITFGBT+PvvxedpmYmR8xvgGFdzv+8occIus3MSVRXQE=;
        b=P6n00xTBeiFpL28lcoXOUNG2GQcuNcwu9PBdxB6A+LpD0HZxqDN9gP0vd4dUsVMkpF
         s/wSSFKsrhnfDB4itC+nJQA0srujAC6JOn0rqJV9pvE93bZ7KADArVoO8Kb/lXMhL6dv
         fLA7oi4ePQhGwdSp4cuagCjnmC0kZUz5iJEJTq0RV5AxkMZ2dnLu1huPkHZhocZPj9L2
         b57WBOC2D+6w+J4t0VxBp5vugqgBTa2l3AF04n/sWLbZEniqEXlMBWPu7f2IIHUvlRMi
         OHL60ygd9gQsMfvez2p7Zro3Pyz01vrvRN5ICPXwVf5227bus2qvnd6icNafkEBgtQ5n
         MySw==
X-Gm-Message-State: AJIora8Pik3eETodmrcI1keiOJvShYw8YaDBgxZJ7s42Q16mGwnw9It/
	afMsm0EYBHOFjqdtT0qnu0uJTCD0Yt2viPFdkw8=
X-Google-Smtp-Source: 
 AGRyM1ua2YABVL8HAIN9NdIZXtndcWn++nk6IoR7rvviOk3+R7WKxBmGiEiWo8CITGERrfxzz4BYZfuUmEoTzwix7ho=
X-Received: by 2002:a2e:98ca:0:b0:25a:76f4:bc8c with SMTP id
 s10-20020a2e98ca000000b0025a76f4bc8cmr7874187ljj.50.1656673565533; Fri, 01
 Jul 2022 04:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220701020939.62295-1-alhe@linux.microsoft.com>
In-Reply-To: <20220701020939.62295-1-alhe@linux.microsoft.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 1 Jul 2022 12:05:54 +0100
Message-ID: 
 <CANPvuR=RZJALd-1jx-yULntdcjUSyDBpaMdakXWmqetXOa6Zyg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package.bbclass: Fix base directory for
 debugsource files when using externalsrc
To: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000061e99605e2bc5fc9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 11:06:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167453

--00000000000061e99605e2bc5fc9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alejandro,

Alejandro Hernandez Samaniego <alhe@linux.microsoft.com> escreveu no dia
sexta, 1/07/2022 =C3=A0(s) 03:09:

> While executing do_package, bitbake checks for a list of
> debug source files and uses a pattern to match the ones
> to be included in copydebugsources.
>
> Previously when externalsrc was in use either directly or by
> using devtool, the source location changed and this pattern
> no longer matched, hence debug source files failed to be
> included in the corresponding package.
>
> Check when the source directory isnt the default (based on
> WORKDIR), and change the pattern used to match debug source
> files if that is the case, allowing us to perform do_package
> properly.
>
> Workaround debugsource.list containing paths from the host by
> moving debug source files away from the host directory
> structure  to avoid host contamination (this seems to happen
> when packages use $TMPDIR/work-shared and externalsrc is
> in use).
>
> Test matrix included using:
> - devtool to use externalsrc automatically
> - externalsrc with a non-devtool based source directory
> - No externalsrc at all
> Tested the following packages to be working:
> - glibc ($TMPDIR/work-shared based)
> - libxcrypt ($TMPDIR/work based)
>
> [YOCTO 8015]
>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alhe@linux.microsoft.com>
> ---
>  meta/classes/package.bbclass | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 62050a18b8..4850134022 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -553,13 +553,25 @@ def copydebugsources(debugsrcdir, sources, d):
>          strip =3D d.getVar("STRIP")
>          objcopy =3D d.getVar("OBJCOPY")
>          workdir =3D d.getVar("WORKDIR")
> +        sdir =3D d.getVar("S")
> +        sparentdir =3D os.path.dirname(os.path.dirname(sdir))
> +        sbasedir =3D os.path.basename(os.path.dirname(sdir)) + "/" +
> os.path.basename(sdir)
>          workparentdir =3D os.path.dirname(os.path.dirname(workdir))
>          workbasedir =3D os.path.basename(os.path.dirname(workdir)) + "/"=
 +
> os.path.basename(workdir)
>
> +        # If S isnt based on WORKDIR we can infer our sources are locate=
d
> elsewhere,
> +        # e.g. using externalsrc; use S as base for our dirs
>

This doesn't seem very safe imo, if the idea is to check if the externalsrc
in use it is better using:

if bb.data.inherits_class('externalsrc', d):

Jose

+        if workdir in sdir:
> +            basedir =3D workbasedir
> +            parentdir =3D workparentdir
> +        else:
> +            basedir =3D sbasedir
> +            parentdir =3D sparentdir
> +
>          # If build path exists in sourcefile, it means toolchain did not
> use
>          # -fdebug-prefix-map to compile
>          if checkbuildpath(sourcefile, d):
> -            localsrc_prefix =3D workparentdir + "/"
> +            localsrc_prefix =3D parentdir + "/"
>          else:
>              localsrc_prefix =3D "/usr/src/debug/"
>
> @@ -581,7 +593,7 @@ def copydebugsources(debugsrcdir, sources, d):
>          processdebugsrc +=3D "sed 's#%s##g' | "
>          processdebugsrc +=3D "(cd '%s' ; cpio -pd0mlL --no-preserve-owne=
r
> '%s%s' 2>/dev/null)"
>
> -        cmd =3D processdebugsrc % (sourcefile, workbasedir,
> localsrc_prefix, workparentdir, dvar, debugsrcdir)
> +        cmd =3D processdebugsrc % (sourcefile, basedir, localsrc_prefix,
> parentdir, dvar, debugsrcdir)
>          try:
>              subprocess.check_output(cmd, shell=3DTrue,
> stderr=3Dsubprocess.STDOUT)
>          except subprocess.CalledProcessError:
> @@ -591,9 +603,22 @@ def copydebugsources(debugsrcdir, sources, d):
>          # cpio seems to have a bug with -lL together and symbolic links
> are just copied, not dereferenced.
>          # Work around this by manually finding and copying any symbolic
> links that made it through.
>          cmd =3D "find %s%s -type l -print0 -delete | sed s#%s%s/##g | (c=
d
> '%s' ; cpio -pd0mL --no-preserve-owner '%s%s')" % \
> -                (dvar, debugsrcdir, dvar, debugsrcdir, workparentdir,
> dvar, debugsrcdir)
> +                (dvar, debugsrcdir, dvar, debugsrcdir, parentdir, dvar,
> debugsrcdir)
>          subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.S=
TDOUT)
>
> +
> +        # debugsources.list may be polluted from the host if we used
> externalsrc,
> +        # cpio uses copy-pass and may have just created a directory
> structure
> +        # matching the one from the host, if thats the case move those
> files to
> +        # debugsrcdir to avoid host contamination.
> +        # Empty dir structure will be deleted in the next step.
> +
> +        # Same check as above for externalsrc
> +        if workdir not in sdir:
> +            if os.path.exists(dvar + debugsrcdir + sdir):
> +                cmd =3D "mv %s%s%s/* %s%s" % (dvar, debugsrcdir, sdir,
> dvar,debugsrcdir)
> +                subprocess.check_output(cmd, shell=3DTrue,
> stderr=3Dsubprocess.STDOUT)
> +
>          # The copy by cpio may have resulted in some empty directories!
> Remove these
>          cmd =3D "find %s%s -empty -type d -delete" % (dvar, debugsrcdir)
>          subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.S=
TDOUT)
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167448):
> https://lists.openembedded.org/g/openembedded-core/message/167448
> Mute This Topic: https://lists.openembedded.org/mt/92100558/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000061e99605e2bc5fc9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alejandro,</div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">Alejandro Hernandez Samaniego &lt;<a hre=
f=3D"mailto:alhe@linux.microsoft.com">alhe@linux.microsoft.com</a>&gt; escr=
eveu no dia sexta, 1/07/2022 =C3=A0(s) 03:09:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">While executing do_package, bitbake checks fo=
r a list of<br>
debug source files and uses a pattern to match the ones<br>
to be included in copydebugsources.<br>
<br>
Previously when externalsrc was in use either directly or by<br>
using devtool, the source location changed and this pattern<br>
no longer matched, hence debug source files failed to be<br>
included in the corresponding package.<br>
<br>
Check when the source directory isnt the default (based on<br>
WORKDIR), and change the pattern used to match debug source<br>
files if that is the case, allowing us to perform do_package<br>
properly.<br>
<br>
Workaround debugsource.list containing paths from the host by<br>
moving debug source files away from the host directory<br>
structure=C2=A0 to avoid host contamination (this seems to happen<br>
when packages use $TMPDIR/work-shared and externalsrc is<br>
in use).<br>
<br>
Test matrix included using:<br>
- devtool to use externalsrc automatically<br>
- externalsrc with a non-devtool based source directory<br>
- No externalsrc at all<br>
Tested the following packages to be working:<br>
- glibc ($TMPDIR/work-shared based)<br>
- libxcrypt ($TMPDIR/work based)<br>
<br>
[YOCTO 8015]<br>
<br>
Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"mailto:=
alhe@linux.microsoft.com" target=3D"_blank">alhe@linux.microsoft.com</a>&gt=
;<br>
---<br>
=C2=A0meta/classes/package.bbclass | 31 ++++++++++++++++++++++++++++---<br>
=C2=A01 file changed, 28 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass<br=
>
index 62050a18b8..4850134022 100644<br>
--- a/meta/classes/package.bbclass<br>
+++ b/meta/classes/package.bbclass<br>
@@ -553,13 +553,25 @@ def copydebugsources(debugsrcdir, sources, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strip =3D d.getVar(&quot;STRIP&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0objcopy =3D d.getVar(&quot;OBJCOPY&quot;)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0workdir =3D d.getVar(&quot;WORKDIR&quot;)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sdir =3D d.getVar(&quot;S&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sparentdir =3D os.path.dirname(os.path.dirname=
(sdir))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sbasedir =3D os.path.basename(os.path.dirname(=
sdir)) + &quot;/&quot; + os.path.basename(sdir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0workparentdir =3D os.path.dirname(os.path=
.dirname(workdir))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0workbasedir =3D os.path.basename(os.path.=
dirname(workdir)) + &quot;/&quot; + os.path.basename(workdir)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If S isnt based on WORKDIR we can infer our =
sources are located elsewhere,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # e.g. using externalsrc; use S as base for ou=
r dirs<br></blockquote><div><br></div><div>This doesn&#39;t=C2=A0seem very =
safe imo, if the idea is to check if the externalsrc in use it is better us=
ing:</div><div><br></div><div>if bb.data.inherits_class(&#39;externalsrc&#3=
9;, d):</div><div><br></div><div>Jose</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if workdir in sdir:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 basedir =3D workbasedir<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parentdir =3D workparentdir<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 basedir =3D sbasedir<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parentdir =3D sparentdir<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# If build path exists in sourcefile, it =
means toolchain did not use<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# -fdebug-prefix-map to compile<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if checkbuildpath(sourcefile, d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 localsrc_prefix =3D workparentdi=
r + &quot;/&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 localsrc_prefix =3D parentdir + =
&quot;/&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0localsrc_prefix =3D &quot;/=
usr/src/debug/&quot;<br>
<br>
@@ -581,7 +593,7 @@ def copydebugsources(debugsrcdir, sources, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0processdebugsrc +=3D &quot;sed &#39;s#%s#=
#g&#39; | &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0processdebugsrc +=3D &quot;(cd &#39;%s&#3=
9; ; cpio -pd0mlL --no-preserve-owner &#39;%s%s&#39; 2&gt;/dev/null)&quot;<=
br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D processdebugsrc % (sourcefile, workbas=
edir, localsrc_prefix, workparentdir, dvar, debugsrcdir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D processdebugsrc % (sourcefile, basedir=
, localsrc_prefix, parentdir, dvar, debugsrcdir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.check_output(cmd=
, shell=3DTrue, stderr=3Dsubprocess.STDOUT)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except subprocess.CalledProcessError:<br>
@@ -591,9 +603,22 @@ def copydebugsources(debugsrcdir, sources, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# cpio seems to have a bug with -lL toget=
her and symbolic links are just copied, not dereferenced.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Work around this by manually finding an=
d copying any symbolic links that made it through.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D &quot;find %s%s -type l -print0 -=
delete | sed s#%s%s/##g | (cd &#39;%s&#39; ; cpio -pd0mL --no-preserve-owne=
r &#39;%s%s&#39;)&quot; % \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (dvar, debugsrcdir=
, dvar, debugsrcdir, workparentdir, dvar, debugsrcdir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (dvar, debugsrcdir=
, dvar, debugsrcdir, parentdir, dvar, debugsrcdir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.check_output(cmd, shell=3DTrue=
, stderr=3Dsubprocess.STDOUT)<br>
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # debugsources.list may be polluted from the h=
ost if we used externalsrc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # cpio uses copy-pass and may have just create=
d a directory structure<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # matching the one from the host, if thats the=
 case move those files to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # debugsrcdir to avoid host contamination.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Empty dir structure will be deleted in the n=
ext step.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Same check as above for externalsrc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if workdir not in sdir:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(dvar + debugsr=
cdir + sdir):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;mv %=
s%s%s/* %s%s&quot; % (dvar, debugsrcdir, sdir, dvar,debugsrcdir)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_o=
utput(cmd, shell=3DTrue, stderr=3Dsubprocess.STDOUT)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# The copy by cpio may have resulted in s=
ome empty directories!=C2=A0 Remove these<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D &quot;find %s%s -empty -type d -d=
elete&quot; % (dvar, debugsrcdir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.check_output(cmd, shell=3DTrue=
, stderr=3Dsubprocess.STDOUT)<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#167448): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/167448" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/167448</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92100558/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92100558/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000061e99605e2bc5fc9--

