Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A6BC001E0
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 12:45:58 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.14041.1690980348311738764
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 05:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=aKZUpGRB;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fe27849e6aso6842279e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 05:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690980346; x=1691585146;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y3CphaCKFqHRn3hQXd9svBI5Nf92+/E8EboniMSUrMs=;
        b=aKZUpGRBik6x50X0lWjWiRVn7O/NSxWwfCqeDpE0+druxozb0Xi7j0T4B8vXy8peFz
         m79I1wMCrH9NX1fD43C0OsT3r562HFfPfA4SPmUmCkiQLU3yO2Oin/w/uJHsML7KtVOd
         AjYVWZNuxfxeEfHEJkE1dCzONRs+qbZ88tqoJd2zA+Zwzx0MbZaXSq4Y5OJld+CMHFgR
         CEb0MiX+DVwl5eYrCoZdd2R4ZGUuu0hv3oyiFMJR3H+1elPxCoh4Hf4luULcn9e5h1Dz
         g75uSjXO7eu5ongTl2zlub31kPtQi7bEASTczgsKJDxPoU2O2xp7YxgSaQ+cf7SpvJzT
         Hrdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690980346; x=1691585146;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y3CphaCKFqHRn3hQXd9svBI5Nf92+/E8EboniMSUrMs=;
        b=aejlqV0/a0nIGQp+nowqo98YdvMfNunXCRSVelJzccjJCoCpHYoHUIcCW3K0345puB
         dBMWCIlwgQ4rFq8iDAGBEuN4npj0kPSA8FXsMe0gXVtlQM2rf92jwv09T4DiMItnef7o
         Vw6owDpv8Nr6Kk/DHt0M9XZiEAy5lLLUZFP6fth6mzcRohhtb0AQYWsOaXCF49DiimgB
         aUnJTGoZwBf7wqOoouIW7gEn52fNrHLbMsTuZnTfu44VZi1gftNFVUBI3EcBKDcFWg25
         qdvg1AIhd4LmT3MzkAbYiZADfyvjHZGWhk6uPS4tJ35fqyosXW7oQF8dCtpDwf8IsYM8
         r1TQ==
X-Gm-Message-State: ABy/qLZRIX3TMGGGHy2M/RhASCGzNyh5IqHkGWVUmNVjkIC4kCARXpBg
	Ms0fL4Sq9Nuh8N2PGSbIqrhGWzX0lz3C+eeUM/c=
X-Google-Smtp-Source: APBJJlEt7LVznPqv8LJYUt2lssfDiM11HVof4vbBuiEgg/ci1svNVMdR2Qv2kCRP+1erUTp3Dkaz3D+kjfEIJYuHm4I=
X-Received: by 2002:a05:6512:3d02:b0:4fa:6d62:9219 with SMTP id
 d2-20020a0565123d0200b004fa6d629219mr6536212lfv.62.1690980346185; Wed, 02 Aug
 2023 05:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230802114705.90137-1-joel@jms.id.au>
In-Reply-To: <20230802114705.90137-1-joel@jms.id.au>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 2 Aug 2023 14:45:34 +0200
Message-ID: <CA+cAkeqRRNUyPxDZrk_3kkQCT2xbE72S5vxrZ_VvHH-xcEB2YA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: Don't fail if Modules.symvers doesn't exist
To: Joel Stanley <joel@jms.id.au>
Cc: openembedded-core@lists.openembedded.org, 
	Andrew Geissler <geissonator@gmail.com>, mdmii@outlook.com
Content-Type: multipart/alternative; boundary="000000000000db4a7f0601f00a34"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 12:45:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185389

--000000000000db4a7f0601f00a34
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Aug 2023 at 13:47, Joel Stanley <joel@jms.id.au> wrote:

> The one liner tests using `[ ] && action` need to have || true after the
> action,
> otherwise the line returns false and the recipie fails.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  meta/classes-recipe/kernel.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index 247ef4a48aa7..f1bc41e82be8 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -486,7 +486,7 @@ kernel_do_install() {
>         install -m 0644 System.map
> ${D}/${KERNEL_IMAGEDEST}/System.map-${KERNEL_VERSION}
>         install -m 0644 .config
> ${D}/${KERNEL_IMAGEDEST}/config-${KERNEL_VERSION}
>         install -m 0644 vmlinux
> ${D}/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION}
> -       [ -e Module.symvers ] && install -m 0644 Module.symvers
> ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
> +       [ -e Module.symvers ] && install -m 0644 Module.symvers
> ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION} || true
>  }
>
>
By doing that, you simply silent possible error of the action after the
test, below is a little snippet showing that

 fmartinsons@work-pc:~$ touch foo
fmartinsons@work-pc:~$ [ -e foo ] && ls non_existent_file
ls: cannot access 'non_existent_file': No such file or directory
fmartinsons@work-pc:~$ echo $?
2
fmartinsons@work-pc:~$ [ -e foo ] && ls non_existent_file || true
ls: cannot access 'non_existent_file': No such file or directory
fmartinsons@work-pc:~$ echo $?
0
fmartinsons@work-pc:~$ touch existent_file
fmartinsons@work-pc:~$ [ -e foo ] && ls existent_file
existent_file
fmartinsons@work-pc:~$ echo $?
0
fmartinsons@work-pc:~$

I think the origin of your issue is that the action failed , having the log
of kernel_do_install task would help.

  # Must be ran no earlier than after do_kernel_checkout or else Makefile
> won't be in ${S}/Makefile
> @@ -555,7 +555,7 @@ do_shared_workdir () {
>
>         # Copy files required for module builds
>         cp System.map $kerneldir/System.map-${KERNEL_VERSION}
> -       [ -e Module.symvers ] && cp Module.symvers $kerneldir/
> +       [ -e Module.symvers ] && cp Module.symvers $kerneldir/ || true
>         cp .config $kerneldir/
>         mkdir -p $kerneldir/include/config
>         cp include/config/kernel.release
> $kerneldir/include/config/kernel.release
> --
> 2.40.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185386):
> https://lists.openembedded.org/g/openembedded-core/message/185386
> Mute This Topic: https://lists.openembedded.org/mt/100503145/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000db4a7f0601f00a34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 2 Aug 2023 at 13:47, Joel Sta=
nley &lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">The one liner test=
s using `[ ] &amp;&amp; action` need to have || true after the action,<br>
otherwise the line returns false and the recipie fails.<br>
<br>
Signed-off-by: Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au" target=3D=
"_blank">joel@jms.id.au</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel.bbclass | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index 247ef4a48aa7..f1bc41e82be8 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -486,7 +486,7 @@ kernel_do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 System.map ${D}/${KERNEL_IMAGED=
EST}/System.map-${KERNEL_VERSION}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 .config ${D}/${KERNEL_IMAGEDEST=
}/config-${KERNEL_VERSION}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 vmlinux ${D}/${KERNEL_IMAGEDEST=
}/vmlinux-${KERNEL_VERSION}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[ -e Module.symvers ] &amp;&amp; install -m 064=
4 Module.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ -e Module.symvers ] &amp;&amp; install -m 064=
4 Module.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION} =
|| true<br>
=C2=A0}<br>
<br></blockquote><div><br></div><div>By doing that, you simply silent possi=
ble error of the action after the test, below is a little snippet showing t=
hat</div><div><br></div><div>=C2=A0fmartinsons@work-pc:~$ touch foo</div>fm=
artinsons@work-pc:~$ [ -e foo ] &amp;&amp; ls non_existent_file<br>ls: cann=
ot access &#39;non_existent_file&#39;: No such file or directory<br>fmartin=
sons@work-pc:~$ echo $?<br>2<br>fmartinsons@work-pc:~$ [ -e foo ] &amp;&amp=
; ls non_existent_file || true<br>ls: cannot access &#39;non_existent_file&=
#39;: No such file or directory<br>fmartinsons@work-pc:~$ echo $?<br>0<br>f=
martinsons@work-pc:~$ touch existent_file<br>fmartinsons@work-pc:~$ [ -e fo=
o ] &amp;&amp; ls existent_file<br>existent_file<br>fmartinsons@work-pc:~$ =
echo $?<br>0<br>fmartinsons@work-pc:~$</div><div class=3D"gmail_quote"><br>=
</div><div class=3D"gmail_quote">I think the origin of your issue is that t=
he action failed , having the log of kernel_do_install task would help.</di=
v><div class=3D"gmail_quote"><br><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">=C2=A0 # Must be ran no earlier than after do_kernel_checkout or el=
se Makefile won&#39;t be in ${S}/Makefile<br>
@@ -555,7 +555,7 @@ do_shared_workdir () {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Copy files required for module builds<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp System.map $kerneldir/System.map-${KERNEL_VE=
RSION}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[ -e Module.symvers ] &amp;&amp; cp Module.symv=
ers $kerneldir/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ -e Module.symvers ] &amp;&amp; cp Module.symv=
ers $kerneldir/ || true<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp .config $kerneldir/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p $kerneldir/include/config<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp include/config/kernel.release $kerneldir/inc=
lude/config/kernel.release<br>
-- <br>
2.40.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#185386): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/185386" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/185386</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100503145/621=
3388" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100503145/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martinsons@gmail.=
com" target=3D"_blank">frederic.martinsons@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000db4a7f0601f00a34--

