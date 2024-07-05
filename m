Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C61C30658
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 11:55:07 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web11.15626.1720180504846827611
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 04:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AFJKFQ6J;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-810177d1760so524277241.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 04:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720180503; x=1720785303; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B88yQgx9xct79rM3fSknHRvasvIAgn6VMrtFgXAsI1E=;
        b=AFJKFQ6JQL04mMojHV2vWOPqwA2/cwoDDCdjNUqx9G2szKOQp7oPBMi82flS2dR4t1
         KpQHCAOTi799GfbSVGj46PLGGuIiWhdmtRWdJ15j2OqhM6BBnYyECWbBeFMUlOdFiDBH
         x83cT971trolGu0SFy6+dRnBAWHaEPNzGEFMfvHYHAr9jyfFzIZ5p2u89nBAGtOrRNxG
         GHs5x8vRWYfBsJRkWvp1w0Gfvsm3kA61kUvIpfJ5z6clInYH0+GYohuSJAdYIE4ZiUvg
         /0riWNM+TToRwKMN0K9R7pzjhRr/+lu+0S12TUpUTvbwzVapXHUAZoFsx1SESYLYQovS
         mkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720180503; x=1720785303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B88yQgx9xct79rM3fSknHRvasvIAgn6VMrtFgXAsI1E=;
        b=xNHABlmT/W26vK5Tskxq9es5jTRwhcOjwrMSXvaQsJ57uBWdXBjvxR+9Dx4ncsSpcW
         vxChk6IGQRO/EHIk7zZO7o4OaXVmvmkH8pzv7xGNSa6gm8UTPanr8qMcriuO/PRXNw7s
         kx63G+ooKqw9U8Myaa/T6UOvlQcdpdeG/TkFnis2toOT1i84Mo46VB0bztQcKBVoeSy7
         DivJq7Fndlj2lB4ZyMBs/s8hITy7mdWdL+x/droKvbQrLd/LT1aeFIbqJLM37UrxTXVy
         9ihaKl5B5OS4qV2SSxDLgYPoioizur80VTJh9bct97XJAVzvKCrZM5ChvB50gLqoif04
         RWrw==
X-Gm-Message-State: AOJu0YxLdgbt/cFHT+Q9MduqGStAyhR9hFvmrQkuWiRoWvltActg3DnL
	/enrEiCLMxi6xy1kEB07k/dUfbsW86Td9Z1EBhFb9vxhKkWigiVjt9PxEnd8mFPlQa19kCjG/3n
	riHWdcpWlIeeNGI/W3Ufu4W0NDkA=
X-Google-Smtp-Source: AGHT+IF/wXxlZx9O+HPq4aaHoMnt6CjCzQ3K6hG7fOZqkONAxod+uo+iUPwBZRKsOXYWQ6uuBSSJVhuLVk1vraMVFdE=
X-Received: by 2002:a67:f4d1:0:b0:48f:e77d:6e72 with SMTP id
 ada2fe7eead31-48fee91a1a6mr4847400137.33.1720180503524; Fri, 05 Jul 2024
 04:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240705113129.1798725-1-jstephan@baylibre.com>
In-Reply-To: <20240705113129.1798725-1-jstephan@baylibre.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 5 Jul 2024 12:54:52 +0100
Message-ID: <CANPvuRmCL4duNDDuMRiEm_T_vYE86fdmMkbqL8d4mgXd98-www@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: fix do_symlink_kernsrc function
To: jstephan@baylibre.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000dcbd0b061c7ebb83"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 11:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201603

--000000000000dcbd0b061c7ebb83
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Julien Stephan via lists.openembedded.org <jstephan=3D
baylibre.com@lists.openembedded.org> escreveu (sexta, 5/07/2024 =C3=A0(s) 1=
2:31):

> According to the comment in do_symlink_kernsrc, this function exists
> for compatibility with old style kernel recipes:
>
>     # Old style kernels may set ${S} =3D ${WORKDIR}/git for example
>
> For such recipes  S will always be different from STAGING_KERNEL_DIR.
> This is fine for the first build or when unpack is rerun because new
> sources are in S. However the following command breaks the build:
>
>     bitbake -C do_symlink_kernsrc virtual/kernel
>
> At this point, S is a symlink to STAGING_KERNEL_DIR, (meaning S !=3D
> STAGING_KERNEL_DIR). We first remove the contents of STAGING_KERNEL_DIR
> without removing the folder itself causing us to lose kernel sources.
> Then we create a symlink from S to STAGING_KERNEL_DIR which results in th=
e
> following broken symlinks:
>
>     ${WORKDIR}/git -> <...>/build/tmp/work-shared/<machine>/kernel-source
>     kernel-source -> <...>/build/tmp/work-shared/<machine>/kernel-source
>
> The build fails with the following error:
>
>     ERROR: <linux_recipe> do_kernel_checkout: FileExistsError(17, 'File
> exists')
>     ERROR: Task (<linux_recipe>:do_kernel_checkout)
>     failed with exit code '1'
>
> Attempting to access the kernel-source directory results in:
>
>     ls: cannot access 'kernel-source': Too many levels of symbolic links
>
> Fix this by checking if S is a symlink, and if so, verifying whether the
> symlink
> points to STAGING_KERNEL_DIR to avoid losing sources
>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index 89badd90f18..e328151cb59 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -184,7 +184,12 @@ do_clean[cleandirs] +=3D " ${S} ${STAGING_KERNEL_DIR=
}
> ${B} ${STAGING_KERNEL_BUILDD
>  python do_symlink_kernsrc () {
>      s =3D d.getVar("S")
>      kernsrc =3D d.getVar("STAGING_KERNEL_DIR")
> -    if s !=3D kernsrc:
> +    if os.path.islink(s):
> +        _s =3D os.readlink(s)
> +    else:
> +        _s =3D s
> +
> +    if _s !=3D kernsrc:
>          bb.utils.mkdirhier(kernsrc)
>          bb.utils.remove(kernsrc, recurse=3DTrue)
>          if s[-1] =3D=3D '/':
> --
> 2.45.1
>

What kernel bbclass are you using to build your kernel?
Please note that a very similar logic was replicated on
the kernel-yocto.bbclass do_kernel_checkout function
so it will be good to test with and without the kernel-yocto.bbclass.
https://git.yoctoproject.org/poky/tree/meta/classes-recipe/kernel-yocto.bbc=
lass#n376

I recently came across this problem in a change that I ended up having to
revert.
https://github.com/Freescale/meta-freescale/pull/1843
https://github.com/Freescale/meta-freescale/pull/1857

Jose


>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201601):
> https://lists.openembedded.org/g/openembedded-core/message/201601
> Mute This Topic: https://lists.openembedded.org/mt/107052142/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000dcbd0b061c7ebb83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Julien Stephan via <a href=3D"http://=
lists.openembedded.org">lists.openembedded.org</a> &lt;jstephan=3D<a href=
=3D"mailto:baylibre.com@lists.openembedded.org">baylibre.com@lists.openembe=
dded.org</a>&gt; escreveu (sexta, 5/07/2024 =C3=A0(s) 12:31):<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">According to the comment in d=
o_symlink_kernsrc, this function exists<br>
for compatibility with old style kernel recipes:<br>
<br>
=C2=A0 =C2=A0 # Old style kernels may set ${S} =3D ${WORKDIR}/git for examp=
le<br>
<br>
For such recipes=C2=A0 S will always be different from STAGING_KERNEL_DIR.<=
br>
This is fine for the first build or when unpack is rerun because new<br>
sources are in S. However the following command breaks the build:<br>
<br>
=C2=A0 =C2=A0 bitbake -C do_symlink_kernsrc virtual/kernel<br>
<br>
At this point, S is a symlink to STAGING_KERNEL_DIR, (meaning S !=3D<br>
STAGING_KERNEL_DIR). We first remove the contents of STAGING_KERNEL_DIR<br>
without removing the folder itself causing us to lose kernel sources.<br>
Then we create a symlink from S to STAGING_KERNEL_DIR which results in the<=
br>
following broken symlinks:<br>
<br>
=C2=A0 =C2=A0 ${WORKDIR}/git -&gt; &lt;...&gt;/build/tmp/work-shared/&lt;ma=
chine&gt;/kernel-source<br>
=C2=A0 =C2=A0 kernel-source -&gt; &lt;...&gt;/build/tmp/work-shared/&lt;mac=
hine&gt;/kernel-source<br>
<br>
The build fails with the following error:<br>
<br>
=C2=A0 =C2=A0 ERROR: &lt;linux_recipe&gt; do_kernel_checkout: FileExistsErr=
or(17, &#39;File exists&#39;)<br>
=C2=A0 =C2=A0 ERROR: Task (&lt;linux_recipe&gt;:do_kernel_checkout)<br>
=C2=A0 =C2=A0 failed with exit code &#39;1&#39;<br>
<br>
Attempting to access the kernel-source directory results in:<br>
<br>
=C2=A0 =C2=A0 ls: cannot access &#39;kernel-source&#39;: Too many levels of=
 symbolic links<br>
<br>
Fix this by checking if S is a symlink, and if so, verifying whether the sy=
mlink<br>
points to STAGING_KERNEL_DIR to avoid losing sources<br>
<br>
Signed-off-by: Julien Stephan &lt;<a href=3D"mailto:jstephan@baylibre.com" =
target=3D"_blank">jstephan@baylibre.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel.bbclass | 7 ++++++-<br>
=C2=A01 file changed, 6 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index 89badd90f18..e328151cb59 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -184,7 +184,12 @@ do_clean[cleandirs] +=3D &quot; ${S} ${STAGING_KERNEL_=
DIR} ${B} ${STAGING_KERNEL_BUILDD<br>
=C2=A0python do_symlink_kernsrc () {<br>
=C2=A0 =C2=A0 =C2=A0s =3D d.getVar(&quot;S&quot;)<br>
=C2=A0 =C2=A0 =C2=A0kernsrc =3D d.getVar(&quot;STAGING_KERNEL_DIR&quot;)<br=
>
-=C2=A0 =C2=A0 if s !=3D kernsrc:<br>
+=C2=A0 =C2=A0 if os.path.islink(s):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 _s =3D os.readlink(s)<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 _s =3D s<br>
+<br>
+=C2=A0 =C2=A0 if _s !=3D kernsrc:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(kernsrc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.remove(kernsrc, recurse=3DTrue)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if s[-1] =3D=3D &#39;/&#39;:<br>
-- <br>
2.45.1<br></blockquote><div><br></div><div>What kernel bbclass are you usin=
g to build your kernel?<br>Please note that a very similar logic was replic=
ated on the=C2=A0kernel-yocto.bbclass=C2=A0<span style=3D"color:rgb(0,0,0);=
font-size:13.3333px">do_kernel_checkout function</span></div><div><span sty=
le=3D"color:rgb(0,0,0);font-size:13.3333px">so it will be good to test with=
 and without the=C2=A0</span>kernel-yocto.bbclass.<span style=3D"color:rgb(=
0,0,0);font-size:13.3333px"><br></span><a href=3D"https://git.yoctoproject.=
org/poky/tree/meta/classes-recipe/kernel-yocto.bbclass#n376">https://git.yo=
ctoproject.org/poky/tree/meta/classes-recipe/kernel-yocto.bbclass#n376</a><=
br><br>I recently came across this problem in a change that I ended up havi=
ng to revert.<br><a href=3D"https://github.com/Freescale/meta-freescale/pul=
l/1843">https://github.com/Freescale/meta-freescale/pull/1843</a><br><a hre=
f=3D"https://github.com/Freescale/meta-freescale/pull/1857">https://github.=
com/Freescale/meta-freescale/pull/1857</a><br><br></div><div>Jose</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#201601): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/201601" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/201601</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107052142/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107052142/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000dcbd0b061c7ebb83--

