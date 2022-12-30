Return-Path: <luis.pinto.martins@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E85CC4332F
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 23:28:07 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.31132.1672442886798812634
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 15:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W3EEYBLo;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: luis.pinto.martins@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id w37so15005034pga.5
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 15:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Et7zhma7HvxgBJAvd07gW9IgN6fN2gmMsgiDm4rMHZ8=;
        b=W3EEYBLoX9IkqCtTJ+k5YsO5gIVz4MfrpxaLXUxe1H7bmYQSKFMzA9YGoQodukdYmm
         6egE+geGe77KuZ0WD12mO+VLEDoV4oyHNdqYI35yJTybOnsg91LYptCylNL+0dj9L/c7
         WvkkbLkeVHyby8DJwi0iuztyj8e0R/BDc63FCbwu46fzGJoOR+hotLGQJwNGFYNXMvWq
         I2c193+cPOfqWVguZ8fVNb/vQ7J90Z9qv/rzSGpNLDYJqxRH05k02hORqO5m0dV/QoKW
         OtTDyRmDTiMVITMxw95m99pF43vBsSeAeW24QiDeUPZHDgK1FWctenbstSG86gRXsAN9
         i2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Et7zhma7HvxgBJAvd07gW9IgN6fN2gmMsgiDm4rMHZ8=;
        b=CzJdR66IpIDkhkCDGA+WL2nNuqKQ5/Pmb+v+vaJiiXIj+TPjGUHdr+kBFtoXyfSx9Z
         2pIF5O2LeZc513/8KwqeferJZwzzu8kAA2efLv859si3HexH/1E8G5tizabFyyONnjwK
         p/IrEtuc+PsGvd+piNxwWfmcZtXqoRk4uo5bEhE/Aj3OiWSFkJVWwWyMzxP882f4/vwl
         COKXSMerexxA5PqwTro4bHv5xS/BuQfx8EsG6FsIPf+hsXPBUn/VmjBR10L6Qqk3rweM
         /gdrKK2GtiRaKS0IzAX4AsvhERiy+M+xnxhApQfXSi8ZHWWuxuhw446WH1YrrPHxPhuT
         Khmg==
X-Gm-Message-State: AFqh2ko6PD0XfJPzdjHwXn9jLsRhk6voDr+LUtWqVH7VK6i8zQqfTf/K
	phca+Sne9K0xeJA1/06qrpc1bP6eZ5tKMs+qyYYmtWQ20jU=
X-Google-Smtp-Source: AMrXdXtjriy1tpTNluXXbgtqGw4QKCYHLMd6Rc3by8EqTcSdyvO0DUtrxL/RcLfNp0mmjt12HhhY2bmesVW+panOKPU=
X-Received: by 2002:a63:e254:0:b0:478:7743:901e with SMTP id
 y20-20020a63e254000000b004787743901emr1876217pgj.375.1672442885879; Fri, 30
 Dec 2022 15:28:05 -0800 (PST)
MIME-Version: 1.0
References: <20221224014946.2644943-1-luis.pinto.martins@gmail.com>
In-Reply-To: <20221224014946.2644943-1-luis.pinto.martins@gmail.com>
From: =?UTF-8?Q?Lu=C3=ADs_Martins?= <luis.pinto.martins@gmail.com>
Date: Fri, 30 Dec 2022 23:27:53 +0000
Message-ID: <CAHeZdFwNF1yM871oBBuRQ=z6d_wfk25QGhm7c_N83ShRaxby+A@mail.gmail.com>
Subject: Re: [PATCH] rm_work.bbclass: use HOSTTOOLS 'rm' binary exclusively
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001eba1b05f113f43f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 23:28:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175179

--0000000000001eba1b05f113f43f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, I see this was accepted for master, is it okay to port this to dunfell
and kirkstone as well ?

Best regards,
Lu=C3=ADs Martins


On Sat, 24 Dec 2022 at 01:49, Luis Martins <luis.pinto.martins@gmail.com>
wrote:

> The do_rm_work() task is using the first available 'rm' binary
> available in PATH to remove files and folders.
> However, depending on the PATH setup and RECIPE_SYSROOT_NATIVE
> contents, the function can be using the 'rm' binary available
> in RECIPE_SYSROOT_NATIVE, a folder that will get removed.
> This causes a sporadic race-condition when trying to access the
> 'rm' binary of a folder already deleted.
> Solve this by exclusively using the HOSTTOOLS 'rm' binary, as
> this folder will not get removed.
>
> Signed-off-by: Luis Martins <luis.pinto.martins@gmail.com>
> ---
>  meta/classes/rm_work.bbclass | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
> index 1f28bc7187..8b5fe1b808 100644
> --- a/meta/classes/rm_work.bbclass
> +++ b/meta/classes/rm_work.bbclass
> @@ -33,6 +33,13 @@ BB_SCHEDULER ?=3D "completion"
>  BB_TASK_IONICE_LEVEL:task-rm_work =3D "3.0"
>
>  do_rm_work () {
> +    # Force using the HOSTTOOLS 'rm' - otherwise the SYSROOT_NATIVE 'rm'
> can be selected depending on PATH
> +    # Avoids race-condition accessing 'rm' when deleting WORKDIR folders
> at the end of this function
> +    RM_BIN=3D"$(PATH=3D${HOSTTOOLS_DIR} command -v rm)"
> +    if [ -z "${RM_BIN}" ]; then
> +        bbfatal "Binary 'rm' not found in HOSTTOOLS_DIR, cannot remove
> WORKDIR data."
> +    fi
> +
>      # If the recipe name is in the RM_WORK_EXCLUDE, skip the recipe.
>      for p in ${RM_WORK_EXCLUDE}; do
>          if [ "$p" =3D "${PN}" ]; then
> @@ -79,7 +86,7 @@ do_rm_work () {
>              # sstate version since otherwise we'd need to leave
> 'plaindirs' around
>              # such as 'packages' and 'packages-split' and these can be
> large. No end
>              # of chain tasks depend directly on do_package anymore.
> -            rm -f -- $i;
> +            "${RM_BIN}" -f -- $i;
>              ;;
>          *_setscene*)
>              # Skip stamps which are already setscene versions
> @@ -96,7 +103,7 @@ do_rm_work () {
>                      ;;
>                  esac
>              done
> -            rm -f -- $i
> +            "${RM_BIN}" -f -- $i
>          esac
>      done
>
> @@ -106,9 +113,9 @@ do_rm_work () {
>          # Retain only logs and other files in temp, safely ignore
>          # failures of removing pseudo folers on NFS2/3 server.
>          if [ $dir =3D 'pseudo' ]; then
> -            rm -rf -- $dir 2> /dev/null || true
> +            "${RM_BIN}" -rf -- $dir 2> /dev/null || true
>          elif ! echo "$excludes" | grep -q -w "$dir"; then
> -            rm -rf -- $dir
> +            "${RM_BIN}" -rf -- $dir
>          fi
>      done
>  }
> --
> 2.25.1
>
>

--0000000000001eba1b05f113f43f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, I see this was accepted for master, is it okay to port=
 this to dunfell and kirkstone as well ?<br clear=3D"all"><div><div><div di=
r=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><br>=
</div><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Bes=
t regards,<br></div><div dir=3D"ltr" class=3D"gmail_signature" data-smartma=
il=3D"gmail_signature">Lu=C3=ADs Martins<br></div></div><br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 2=
4 Dec 2022 at 01:49, Luis Martins &lt;<a href=3D"mailto:luis.pinto.martins@=
gmail.com">luis.pinto.martins@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">The do_rm_work() task is using the f=
irst available &#39;rm&#39; binary<br>
available in PATH to remove files and folders.<br>
However, depending on the PATH setup and RECIPE_SYSROOT_NATIVE<br>
contents, the function can be using the &#39;rm&#39; binary available<br>
in RECIPE_SYSROOT_NATIVE, a folder that will get removed.<br>
This causes a sporadic race-condition when trying to access the<br>
&#39;rm&#39; binary of a folder already deleted.<br>
Solve this by exclusively using the HOSTTOOLS &#39;rm&#39; binary, as<br>
this folder will not get removed.<br>
<br>
Signed-off-by: Luis Martins &lt;<a href=3D"mailto:luis.pinto.martins@gmail.=
com" target=3D"_blank">luis.pinto.martins@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/rm_work.bbclass | 15 +++++++++++----<br>
=C2=A01 file changed, 11 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass<br=
>
index 1f28bc7187..8b5fe1b808 100644<br>
--- a/meta/classes/rm_work.bbclass<br>
+++ b/meta/classes/rm_work.bbclass<br>
@@ -33,6 +33,13 @@ BB_SCHEDULER ?=3D &quot;completion&quot;<br>
=C2=A0BB_TASK_IONICE_LEVEL:task-rm_work =3D &quot;3.0&quot;<br>
<br>
=C2=A0do_rm_work () {<br>
+=C2=A0 =C2=A0 # Force using the HOSTTOOLS &#39;rm&#39; - otherwise the SYS=
ROOT_NATIVE &#39;rm&#39; can be selected depending on PATH<br>
+=C2=A0 =C2=A0 # Avoids race-condition accessing &#39;rm&#39; when deleting=
 WORKDIR folders at the end of this function<br>
+=C2=A0 =C2=A0 RM_BIN=3D&quot;$(PATH=3D${HOSTTOOLS_DIR} command -v rm)&quot=
;<br>
+=C2=A0 =C2=A0 if [ -z &quot;${RM_BIN}&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal &quot;Binary &#39;rm&#39; not found in=
 HOSTTOOLS_DIR, cannot remove WORKDIR data.&quot;<br>
+=C2=A0 =C2=A0 fi<br>
+<br>
=C2=A0 =C2=A0 =C2=A0# If the recipe name is in the RM_WORK_EXCLUDE, skip th=
e recipe.<br>
=C2=A0 =C2=A0 =C2=A0for p in ${RM_WORK_EXCLUDE}; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$p&quot; =3D &quot;${PN}&quot;=
 ]; then<br>
@@ -79,7 +86,7 @@ do_rm_work () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# sstate version since othe=
rwise we&#39;d need to leave &#39;plaindirs&#39; around<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# such as &#39;packages&#39=
; and &#39;packages-split&#39; and these can be large. No end<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# of chain tasks depend dir=
ectly on do_package anymore.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f -- $i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${RM_BIN}&quot; -f -- $i;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*_setscene*)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Skip stamps which are alr=
eady setscene versions<br>
@@ -96,7 +103,7 @@ do_rm_work () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f -- $i<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${RM_BIN}&quot; -f -- $i<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
=C2=A0 =C2=A0 =C2=A0done<br>
<br>
@@ -106,9 +113,9 @@ do_rm_work () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Retain only logs and other files in tem=
p, safely ignore<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# failures of removing pseudo folers on N=
FS2/3 server.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $dir =3D &#39;pseudo&#39; ]; then<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf -- $dir 2&gt; /dev/null |=
| true<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${RM_BIN}&quot; -rf -- $di=
r 2&gt; /dev/null || true<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif ! echo &quot;$excludes&quot; | grep =
-q -w &quot;$dir&quot;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf -- $dir<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${RM_BIN}&quot; -rf -- $di=
r<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0}<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000001eba1b05f113f43f--

