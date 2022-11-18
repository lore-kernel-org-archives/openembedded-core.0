Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37883C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 11:10:50 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.9083.1668769848098823219
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 03:10:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=chulMxTP;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id l8so6316293ljh.13
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 03:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tdtLcZr2gmlxdNd61vg4kQK0eTQn/FGCM+G6Y/n21/k=;
        b=chulMxTPfALb/BL0igG5mJZTpdHEahRN49dp8t/YxT8rbaXbdn0Lr18z9YjfceLURt
         6PN1+oyHTv+J/jsE45jkVBQAxcigV3xFntMC0TnXDiErXoh/Xwq9hjUUgOlC+9dV8Gvy
         0kSMSZy5gY2Gwt1rrX2IRkKS+iPVGH8aaYjw+c8KDDP0GyvxBZVaaZjvGcQl3eP6EZG/
         ZsFCUag7Nzx9BLO+sjW4Q3OVL12PhU9NDdJp206Oi+H+nG2hX3r0PMzYEUX3D4rjek3j
         v8FUguGHVjHG/7zTmboM/ZY5Ic2D1WKyOzY0guYZhQX4JKXh1aHOO6KCvJZbWuHBkcyr
         ud/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdtLcZr2gmlxdNd61vg4kQK0eTQn/FGCM+G6Y/n21/k=;
        b=ANp99HMiagRwU63Q9t4HU48Xv41vJ8qLT1NZ3SH+4D7QjEONzyZGDOvPAzQS1rZsWG
         favjmmLJXZQes8sxF72CfRTjToqKMZ+vRbaIEREQK9KBaH7cvKFyMGM6AG6A+GFTQDPT
         VJwV9Rb+Zd7f3IDhCCFD9dAaDxKQ/zA0Ro4QHAbHBm5X5F9vy2je4XAyD4ScLCSQcybH
         z+iPt4xHVflExTcYm9J5SidRKLlYbLCYjxJG9a62ncmkhfC0lYNkoSWp7Z0xq+UpL/ck
         rdI7SJDwUCMsBq6+eglNoXnCmhfWwhC8q4prbp19GRgXJglIFzdCr7R59It+Nw4yKwd/
         lr5Q==
X-Gm-Message-State: ANoB5pk0Qm9p7MxFKUhLNjf1fP3ZU1hg7HE4T7He5GdhAvA2mku6+T/w
	xBXGoq9tocHUMf1SFdkuaQiAHxRWKVkXX80Bqlhx0X5G5Z8=
X-Google-Smtp-Source: AA0mqf6c1Q3Zbws5rAt+/UhGf9yidUyImGsZrOc8PAJNU5w3rLF6Cyal4ejZ7l5prJkzAdgVN2uZkQ6BuM6MoIHvoYQ=
X-Received: by 2002:a05:651c:158a:b0:26f:c160:6dde with SMTP id
 h10-20020a05651c158a00b0026fc1606ddemr2191859ljq.20.1668769846089; Fri, 18
 Nov 2022 03:10:46 -0800 (PST)
MIME-Version: 1.0
References: <20221117041155.22632-1-Qi.Chen@windriver.com>
In-Reply-To: <20221117041155.22632-1-Qi.Chen@windriver.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 18 Nov 2022 11:10:34 +0000
Message-ID: <CANPvuRmp3+krC+Uj0ZmG7VF_L54ywUQt-FUkKxDBXVMB7iZVZA@mail.gmail.com>
Subject: Re: [OE-core][master][kirkstone][PATCH V2] kernel.bbclass: make
 KERNEL_DEBUG_TIMESTAMPS work at rebuild
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e35c9f05edbcc1fb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 11:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173453

--000000000000e35c9f05edbcc1fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chen Qi <Qi.Chen@windriver.com> escreveu no dia quinta, 17/11/2022 =C3=A0(s=
)
04:12:

> Currently, the KERNEL_DEBUG_TIMESTAMPS is not working as expected
> at rebuild. That is, even if we set it to "1", the kernel build time
> is not changed. The problem could be reproduced by the following steps.
>   1. bitbake core-image-minimal; start image and check `uname -a` output.
>   2. set in local.conf: KERNEL_DEBUG_TIMESTAMPS =3D "1"
>   3. bitbake core-image-minimal; start image and check `uname -a` output.
>
> It's expected that after enabling KERNEL_DEBUG_TIMESTAMPS, the kernel
> build time will be set to current date. But it's not. This is because
> the compile.h was not re-generated when do_compile task was re-executed.
>
> In mkcompile_h, we have:
> """
>  # Only replace the real compile.h if the new one is different,
>  # in order to preserve the timestamp and avoid unnecessary
>  # recompilations.
>  # We don't consider the file changed if only the date/time changed,
>  # unless KBUILD_BUILD_TIMESTAMP was explicitly set (e.g. for
>  # reproducible builds with that value referring to a commit timestamp).
>  # A kernel config change will increase the generation number, thus
>  # causing compile.h to be updated (including date/time) due to the
>  # changed comment in the
>  # first line.
> """
> It has made it very clear that it will not be re-generated unless
> we have KBUILD_BUILD_TIMESTAMP set explicitly. So we set this variable
> explicitly in do_compile to fix this issue.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index 3834a42fb9..3f6b40907f 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -367,6 +367,10 @@ kernel_do_compile() {
>                 export KBUILD_BUILD_TIMESTAMP=3D"$ts"
>                 export KCONFIG_NOTIMESTAMP=3D1
>                 bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
> +       else
> +               ts=3D`LC_ALL=3DC date`
> +               export KBUILD_BUILD_TIMESTAMP=3D"$ts"
> +               bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
>         fi
>         # The $use_alternate_initrd is only set from
>         # do_bundle_initramfs() This variable is specifically for the
> @@ -412,6 +416,10 @@ do_compile_kernelmodules() {
>                 export KBUILD_BUILD_TIMESTAMP=3D"$ts"
>                 export KCONFIG_NOTIMESTAMP=3D1
>                 bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
> +       else
> +               ts=3D`LC_ALL=3DC date`
> +               export KBUILD_BUILD_TIMESTAMP=3D"$ts"
> +               bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
>         fi
>         if (grep -q -i -e '^CONFIG_MODULES=3Dy$' ${B}/.config); then
>                 oe_runmake -C ${B} ${PARALLEL_MAKE} modules
> ${KERNEL_EXTRA_ARGS}
> --
> 2.17.1
>

Hi Chen,

I think this only works on the first time you run it and after that if the
kernel can be taken from the sstate-cache this timestamp will be bypassed.
To generate a new timestamp you need to invalidate the stamp and run the
task again with:

bitbake virtual/linux -C do_compile

Another possible issue is this will make this task indeterministic (not
reproducible) as it uses the command 'date' that generates a
different output in each run.

IMO the bitbake DATETIME is better and it is deterministic:

export KBUILD_BUILD_TIMESTAMP=3D"$DATETIME"

This also maybe introduces a new variable dependency exclusion on the tasks
that uses this variable:

kernel_do_compile[vardepsexclude] +=3D DATETIME
do_compile_kernelmodules[vardepsexclude] +=3D DATETIME

Jose


>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173401):
> https://lists.openembedded.org/g/openembedded-core/message/173401
> Mute This Topic: https://lists.openembedded.org/mt/95083712/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000e35c9f05edbcc1fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Chen Qi &lt;<a href=3D"mailto:Qi.Chen=
@windriver.com">Qi.Chen@windriver.com</a>&gt; escreveu no dia quinta, 17/11=
/2022 =C3=A0(s) 04:12:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Currently, the KERNEL_DEBUG_TIMESTAMPS is not working as expected<br=
>
at rebuild. That is, even if we set it to &quot;1&quot;, the kernel build t=
ime<br>
is not changed. The problem could be reproduced by the following steps.<br>
=C2=A0 1. bitbake core-image-minimal; start image and check `uname -a` outp=
ut.<br>
=C2=A0 2. set in local.conf: KERNEL_DEBUG_TIMESTAMPS =3D &quot;1&quot;<br>
=C2=A0 3. bitbake core-image-minimal; start image and check `uname -a` outp=
ut.<br>
<br>
It&#39;s expected that after enabling KERNEL_DEBUG_TIMESTAMPS, the kernel<b=
r>
build time will be set to current date. But it&#39;s not. This is because<b=
r>
the compile.h was not re-generated when do_compile task was re-executed.<br=
>
<br>
In mkcompile_h, we have:<br>
&quot;&quot;&quot;<br>
=C2=A0# Only replace the real compile.h if the new one is different,<br>
=C2=A0# in order to preserve the timestamp and avoid unnecessary<br>
=C2=A0# recompilations.<br>
=C2=A0# We don&#39;t consider the file changed if only the date/time change=
d,<br>
=C2=A0# unless KBUILD_BUILD_TIMESTAMP was explicitly set (e.g. for<br>
=C2=A0# reproducible builds with that value referring to a commit timestamp=
).<br>
=C2=A0# A kernel config change will increase the generation number, thus<br=
>
=C2=A0# causing compile.h to be updated (including date/time) due to the<br=
>
=C2=A0# changed comment in the<br>
=C2=A0# first line.<br>
&quot;&quot;&quot;<br>
It has made it very clear that it will not be re-generated unless<br>
we have KBUILD_BUILD_TIMESTAMP set explicitly. So we set this variable<br>
explicitly in do_compile to fix this issue.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel.bbclass | 8 ++++++++<br>
=C2=A01 file changed, 8 insertions(+)<br>
<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index 3834a42fb9..3f6b40907f 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -367,6 +367,10 @@ kernel_do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export KBUILD_BUILD=
_TIMESTAMP=3D&quot;$ts&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export KCONFIG_NOTI=
MESTAMP=3D1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbnote &quot;KBUILD=
_BUILD_TIMESTAMP: $ts&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ts=3D`LC_ALL=3DC da=
te`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export KBUILD_BUILD=
_TIMESTAMP=3D&quot;$ts&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbnote &quot;KBUILD=
_BUILD_TIMESTAMP: $ts&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # The $use_alternate_initrd is only set from<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # do_bundle_initramfs() This variable is specif=
ically for the<br>
@@ -412,6 +416,10 @@ do_compile_kernelmodules() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export KBUILD_BUILD=
_TIMESTAMP=3D&quot;$ts&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export KCONFIG_NOTI=
MESTAMP=3D1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbnote &quot;KBUILD=
_BUILD_TIMESTAMP: $ts&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ts=3D`LC_ALL=3DC da=
te`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export=C2=A0KBUILD_=
BUILD_TIMESTAMP=3D&quot;$ts&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbnote &quot;KBUILD=
_BUILD_TIMESTAMP: $ts&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grep -q -i -e &#39;^CONFIG_MODULES=3Dy$&#39=
; ${B}/.config); then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake -C ${B} =
${PARALLEL_MAKE} modules ${KERNEL_EXTRA_ARGS}<br>
-- <br>
2.17.1<br></blockquote><div><br></div><div>Hi Chen,<br><br>I think this onl=
y works on the first time you run it and after that if the kernel can be ta=
ken from the sstate-cache this timestamp will be bypassed.<br>To generate a=
 new timestamp you need to invalidate the stamp and run the task again with=
:<br><br>bitbake virtual/linux -C do_compile<br><br>Another possible issue =
is this will make this task indeterministic (not reproducible) as it uses t=
he command &#39;date&#39; that generates=C2=A0a different=C2=A0output=C2=A0=
in each run.</div><div><br>IMO the bitbake DATETIME is better and it is det=
erministic:<br><br>export KBUILD_BUILD_TIMESTAMP=3D&quot;$DATETIME&quot;<br=
><br>This also maybe introduces a new variable dependency exclusion on the =
tasks that uses this variable:</div><div><br>kernel_do_compile[vardepsexclu=
de] +=3D DATETIME</div><div>do_compile_kernelmodules[vardepsexclude] +=3D=
=C2=A0DATETIME<br><br>Jose</div><div><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#173401): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/173401" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/173401</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95083712/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95083712/5052612</a><br>
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

--000000000000e35c9f05edbcc1fb--

