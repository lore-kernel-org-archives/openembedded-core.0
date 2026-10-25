Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21718.1792928672022212836
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 04:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aw8SyEiI;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b2232d8ef5so3683260a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 04:44:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792928670; cv=none;
        d=google.com; s=arc-20260327;
        b=grhVGWSKHL6hC3lCnOB8zNxzUGaLJqaIssyLha65XrpSW1OtBooia7AVuJ0e+tmT99
         WFopNOqEsMiDgC4qbatMTlZ35gPM/F4MYZxZETNl0uRgO8jkkxKGsvrwS3p5Odabd1ed
         nI36LMZD8EIu7bIMMguBB0T0qtS9h7v9nxd/YlpYyGzb/m7+DQhxzmxmB6A5qx+hTxlS
         7th7GWKvRcFd1I8AkqI0djKP6ZXX9ca0wsSH4aQ6TM4HGhLR+dKKFOrdtTXGl6oSGBef
         TKn8hPbLVqfgF5Y1hgAdLhq7rZDazI0U/YyqBLzweJnQx5hnGG237VXBHT9rE7OZ+uC6
         i/wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4hal0fSHl9ZjRyFl+2lOSJ/9yp8XJaZK+gLNJpU1HL8=;
        fh=RC+f0MDCDpy2YPiLj7RJliEH8iZ1Eg3yt4j6bjoY8GM=;
        b=QpK6QwOvj7LtIqDmT52HftedJA36fs2RFN+0e/1GtB8WRdZd3tGh8qRsydxjx9RbAs
         PxdiSSQRHBSJ50Ol1uV3t+HhDq36AP8nWeBHIalSRtfLkHNoehsE7TR6HuWvxzcLmiW2
         2qkOM4H+YxG70emeGZ7INkVIzvc18KwaZcuW4FfU/a/rJe8A7t2/CJe4rKnF+JubeUg/
         CYY6sukECOC9e7ONzpQi8+CGZD2eQ+OpInNiY6OAk6AGPEPkyoO1bfoVEtNRGOs4kbFz
         hbPpp4uxeWKU/nz5KzcVkOj/WZfEYyCiOvcvzkvyop2G8u3mWZZPjjzEofE5n/SPrmMd
         DRPw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792928670; x=1793533470; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4hal0fSHl9ZjRyFl+2lOSJ/9yp8XJaZK+gLNJpU1HL8=;
        b=aw8SyEiIsmcuwQ+dBxbFceulDhS8or1Un6AN/JxAZANUxnoRYEjoNTj6I6GizI0dPC
         Dm5JTAvgxmMFmA3Ulh2Bu/h3grUFzasdoDl94QVl75FmM6Qp51P8mn6vt//sW/O8UZ0L
         ni9CaX/OM4mpwaO+3CLoYq7fHVQVTfHgbkK24tQDu5e+zD5udgdPJu0Xqv1ftY2dWEwq
         Te/KcGEkJfTI/rB/5up7nv07/kXF6ay7vKYkVZ8dSpUDxMPEkCGlYYCw6ScuvWpSh/wg
         XoeSS3xKVs+6YOymgN6XpZJoy66VihZ+UECVQua870fEYWUWgWNjdQvymUCg9H8z7Ddx
         vqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792928670; x=1793533470;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4hal0fSHl9ZjRyFl+2lOSJ/9yp8XJaZK+gLNJpU1HL8=;
        b=PWx4mgCkrgsiOhQg8Z3EnW9zqiyiueLMeCtlxXOpSymLGubCTEkwrAzwYllkHE6RLR
         cxVK6KVah+sI+89sX4FR6qNxrMwAdIHPQrobcj/IpT2xVr98lwaZI1BD/iGWAiuulBdI
         pzVTEMryRTUVOC+xdlmYjWcwlqMBVignpA6hHO/UiAGv9gBRwQXS3M51Wu0kiFTYx6TY
         zUsKL+I61kTDGuXBlVcsGXAOUHhA4bXrt2NEnggF7BJGntQZRpYAxMv6v7kI5Y0ZMnTl
         07BYt288i8s7pIoGT+9akZtcfVwX47VW8CClGRjZEHzJSR6CMNOGhgf9+BpEhmv39zXN
         PQ7w==
X-Gm-Message-State: AFq9FYJZyCoIrOvUfub5Aa1vQNMePonenKqFDzW3/63v7HiI4lvZAUnX
	Pjmnlh7g8A/mtk5oGp5uAWurTKlJoH8lmIwg1dlqRIKiazzUdbhbDu6kfg1w6C7+HQ6bpJwTMNC
	nb8CYzndxTKALoQe3Z0QJsYt8SbVx+ds=
X-Gm-Gg: AYBFou0FJ+0AdXZDA8m1SrGpiBT3IugdEG8XKM+cUTnIw3IEokkucJCggMP7ClVbSiT
	O68/xptKkGaQpdZS4vFoB76JmjaivjYyg2EhkyT1rLlhfvexRzbeV56V8jyOILW3O271jgdwCvJ
	gMrhlwMrIs91tkcKESafklXl8TidGU5QVJz/tpaur9zx5qqqk9jmEy5GXCOYd1a6OFZN4l9FJLC
	NvZ/nE3PRWCe590bzKCXnrtgKyKyE02/jYUoFk+NK3FcHvREJrl1xda7evZpn1bAIvBiuouE9tu
	4D/8137xWGnFvP+uYm75vo7qabeQhWk5vbKymHH7f2tzByn8hB/JEe/sePcSzgBJ2kZ+t6tqJ6g
	033oStvwRu3Z2GuAW014/3PNX4/ahq3jIn1RJ0hOajMmj3lIoxeKeaGO2GdkJZLidZwdnRAUnM3
	JiympRhxVw/FM+2g+ri1cCfMyCQA==
X-Received: by 2002:a17:907:930e:b0:c42:bc58:f26 with SMTP id
 a640c23a62f3a-c46bde79f52mr458116066b.26.1792928669833; Sun, 25 Oct 2026
 04:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20261025101306.3845699-1-adrian.freihofer@siemens.com>
In-Reply-To: <20261025101306.3845699-1-adrian.freihofer@siemens.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Sun, 25 Oct 2026 11:44:17 +0000
X-Gm-Features: AclHuK_feyadCUSEuQSEXVjFZnUZ5IPVXyvX7YFuNu9oHeNPEJWRByS8Ix86gPg
Message-ID: <CANPvuRkJwDsGzJ_JssUGyAUwZPCCNBp5LRyWuT02KB283NPtxw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-fit-image: add FIT_LOADABLE_* variables
 to do_compile vardeps
To: adrian.freihofer@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000791f1f065ea8bc6e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 11:44:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248605

--000000000000791f1f065ea8bc6e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adrian Freihofer via lists.openembedded.org <adrian.freihofer=3D
siemens.com@lists.openembedded.org> escreveu (domingo, 25/10/2026 =C3=A0(s)
10:13):

> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> do_compile only reads the per-loadable flags of the FIT_LOADABLE_*
> variables with d.getVarFlag('FIT_LOADABLE_*', loadable), never their
> values. As the flag names are not literals, bitbake cannot track these
> accesses, so the flags are not part of the do_compile signature.
> Changing e.g. FIT_LOADABLE_LOADADDRESS[atf] did not trigger a rebuild
> and a stale FIT image was reused.
>
> When FIT_LOADABLES is set, add the FIT_LOADABLE_* variables to
> do_compile[vardeps] in the loop that already processes them.
> Referencing a variable includes all its flags in the signature.
>
> While at it, fix the duplicated word in the comment.
>
> This is a fixup for commit 2535427d8de0
> "kernel-fit-image: support arbitrary loadables"
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  meta/classes-recipe/kernel-fit-image.bbclass | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-fit-image.bbclass
> b/meta/classes-recipe/kernel-fit-image.bbclass
> index 7b2bcd4673..d6a41d4979 100644
> --- a/meta/classes-recipe/kernel-fit-image.bbclass
> +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> @@ -32,8 +32,12 @@ python () {
>      # Parse loadables config
>      loadables =3D d.getVar('FIT_LOADABLES')
>      if loadables:
> -        # Check that the loadables configuration variables are not set
> directly
> -        # directly, then assign them a synthetic value for testability
> purposes
> +        # Check that the loadables configuration variables are not set
> +        # directly, then assign them a synthetic value for testability
> purposes.
> +        # do_compile only reads the flags of these variables, never thei=
r
> +        # values, and as the flag names are not literals bitbake cannot
> track
> +        # these accesses. Add the variables to the do_compile vardeps to
> get
> +        # all their flags into the task signature.
>

I believe it's better to declare the below list in a new variable and add
it to vardeps in a single step.

Jose

         for v in ['FIT_LOADABLE_ARCH', 'FIT_LOADABLE_COMPRESSION',
>                    'FIT_LOADABLE_DESCRIPTION', 'FIT_LOADABLE_ENTRYPOINT',
>                    'FIT_LOADABLE_FILENAME', 'FIT_LOADABLE_LOADADDRESS',
> @@ -43,6 +47,7 @@ python () {
>
>              synt_value =3D " ? ".join([ d.getVarFlag(v, loadable) or "" =
for
> loadable in loadables.split() ])
>              d.setVar(v, synt_value)
> +            d.appendVarFlag('do_compile', 'vardeps', ' ' + v)
>  }
>
>  do_configure[noexec] =3D "1"
> --
> 2.56.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248604):
> https://lists.openembedded.org/g/openembedded-core/message/248604
> Mute This Topic: https://lists.openembedded.org/mt/121925246/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000791f1f065ea8bc6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Adrian Freihofe=
r via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> =
&lt;adrian.freihofer=3D<a href=3D"mailto:siemens.com@lists.openembedded.org=
">siemens.com@lists.openembedded.org</a>&gt; escreveu (domingo, 25/10/2026 =
=C3=A0(s) 10:13):<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">From: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@siemens.com=
" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
<br>
do_compile only reads the per-loadable flags of the FIT_LOADABLE_*<br>
variables with d.getVarFlag(&#39;FIT_LOADABLE_*&#39;, loadable), never thei=
r<br>
values. As the flag names are not literals, bitbake cannot track these<br>
accesses, so the flags are not part of the do_compile signature.<br>
Changing e.g. FIT_LOADABLE_LOADADDRESS[atf] did not trigger a rebuild<br>
and a stale FIT image was reused.<br>
<br>
When FIT_LOADABLES is set, add the FIT_LOADABLE_* variables to<br>
do_compile[vardeps] in the loop that already processes them.<br>
Referencing a variable includes all its flags in the signature.<br>
<br>
While at it, fix the duplicated word in the comment.<br>
<br>
This is a fixup for commit 2535427d8de0<br>
&quot;kernel-fit-image: support arbitrary loadables&quot;<br>
<br>
Signed-off-by: Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@siem=
ens.com" target=3D"_blank">adrian.freihofer@siemens.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel-fit-image.bbclass | 9 +++++++--<br>
=C2=A01 file changed, 7 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-re=
cipe/kernel-fit-image.bbclass<br>
index 7b2bcd4673..d6a41d4979 100644<br>
--- a/meta/classes-recipe/kernel-fit-image.bbclass<br>
+++ b/meta/classes-recipe/kernel-fit-image.bbclass<br>
@@ -32,8 +32,12 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0# Parse loadables config<br>
=C2=A0 =C2=A0 =C2=A0loadables =3D d.getVar(&#39;FIT_LOADABLES&#39;)<br>
=C2=A0 =C2=A0 =C2=A0if loadables:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check that the loadables configuration varia=
bles are not set directly<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # directly, then assign them a synthetic value=
 for testability purposes<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check that the loadables configuration varia=
bles are not set<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # directly, then assign them a synthetic value=
 for testability purposes.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # do_compile only reads the flags of these var=
iables, never their<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # values, and as the flag names are not litera=
ls bitbake cannot track<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # these accesses. Add the variables to the do_=
compile vardeps to get<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # all their flags into the task signature.<br>=
</blockquote><div><br></div><div>I believe=C2=A0it&#39;s better=C2=A0to dec=
lare the=C2=A0below list in a new variable and add it to=C2=A0<span style=
=3D"background-color:transparent">vardeps in a single step.</span></div><di=
v><br></div><div>Jose</div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for v in [&#39;FIT_LOADABLE_ARCH&#39;, &#=
39;FIT_LOADABLE_COMPRESSION&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;F=
IT_LOADABLE_DESCRIPTION&#39;, &#39;FIT_LOADABLE_ENTRYPOINT&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;F=
IT_LOADABLE_FILENAME&#39;, &#39;FIT_LOADABLE_LOADADDRESS&#39;,<br>
@@ -43,6 +47,7 @@ python () {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0synt_value =3D &quot; ? &qu=
ot;.join([ d.getVarFlag(v, loadable) or &quot;&quot; for loadable in loadab=
les.split() ])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(v, synt_value)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVarFlag(&#39;do_compile&=
#39;, &#39;vardeps&#39;, &#39; &#39; + v)<br>
=C2=A0}<br>
<br>
=C2=A0do_configure[noexec] =3D &quot;1&quot;<br>
-- <br>
2.56.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#248604): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/248604" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/248604</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121925246/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121925246/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--000000000000791f1f065ea8bc6e--
