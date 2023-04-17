Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A52DC77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 22:31:43 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web11.11421.1681770699879162400
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 15:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=nsMXDtEA;
 spf=pass (domain: gmail.com, ip: 209.85.222.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id x8so9952366uau.9
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 15:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681770699; x=1684362699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KJvi8gC6xYCeb9ImzZ7XI9ROCgydpEHxuoACLKk27YA=;
        b=nsMXDtEA4IN93JEX7b7m6fe+cKHmtHw3jbrMTO6h5MvZAcSnxXzCF8704O8Z3yzpRP
         IxiAuH86YW5y1BOjmbcg2oZ3OmAqNBFBtRSbDwlT3uZZ0GWbfyDW7IX8UIZKerkEXG0o
         E1IKjCjMzubfLMtT1FGNwK5uvfxmvNb8ek/76WHAkpZ4z1OVypLLzEvVzuITsI72ADsZ
         QULlw0Nh/LBYMcJ+/tlyKJ40tktJRhpoNh4ip1j1hzSjfgja9GUujVTiAh6nbnrWl+T4
         w3hrWrIObqRNYI8gRmswaHFR4RUIfM+e0/K53uiezDHKY8GqRWOapUvdYqk5nlSbfW/q
         XsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681770699; x=1684362699;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJvi8gC6xYCeb9ImzZ7XI9ROCgydpEHxuoACLKk27YA=;
        b=ORorfhRw9XFMUwKyjRpF5opd9RJrTU/xC9F1YcIbLeF1AM4KAV688flgAwX+rGOw3/
         ulZPF68WyB+jcuvQVoDx4GZgLWziMAdIgkIXKPXWcqC9y4EjeM8+1KW3aM6mGERVlA2W
         juj4bjhlnrhs6kf4kN0GDQunbs3mejjUVpumXQn0S/aPRbJAkUk5AwL8Irzp3/SEcLJv
         fO82rFPevTrWZG/h0wWUCRAzG3QwmpEkPLmx87UFafyVJ5qZDKZ4/eBDqUgY6wMMohpj
         NMm1BN/T+Ogt5nqXDuya5eeSSD75K5MV0dUpWQ3EUWLzB7dpdUJitV0LU1cTV7bjfqFb
         ieug==
X-Gm-Message-State: AAQBX9ekjVuKpYm/gxRw9Krx8dTWKZPEOocOLFVHO2Mn9iTsoz1/KlBO
	DVkPnIWC8e4FG2ISBtJIZ1J7LOUsFWTolkKHHZQ=
X-Google-Smtp-Source: AKy350Z6Fbvx7C9tm5P8MaHM++o4hJp1dhhdXex0se3wcDwza4GGZn6DbAKeIx98W+vbHB3/b6NHeuTv8Bti9XSAeIo=
X-Received: by 2002:ab0:559c:0:b0:68b:9eed:1c7d with SMTP id
 v28-20020ab0559c000000b0068b9eed1c7dmr10402159uaa.0.1681770698713; Mon, 17
 Apr 2023 15:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230416103052.28268-1-christoph.lauer@email.de> <27b6976546dae12e92dd3af28f657c02eca4afe8.camel@linuxfoundation.org>
In-Reply-To: <27b6976546dae12e92dd3af28f657c02eca4afe8.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 17 Apr 2023 23:31:27 +0100
Message-ID: <CANPvuRnSPULJzxC0qt=sQLWS5jyx4OkJ2cQobDzHs0LmmBG6MQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: preserve libraries when
 rm_work is used
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Christoph Lauer <christoph.lauer@email.de>, openembedded-core@lists.openembedded.org, 
	Christoph Lauer <christoph.lauer@xtronic.de>
Content-Type: multipart/alternative; boundary="000000000000172e1705f98fc1e0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 22:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180169

--000000000000172e1705f98fc1e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
segunda, 17/04/2023 =C3=A0(s) 20:51:

> On Sun, 2023-04-16 at 12:30 +0200, Christoph Lauer wrote:
> > From: Christoph Lauer <christoph.lauer@xtronic.de>
> >
> > With rm_work active, external module signing throws an error:
> > scripts/sign-file: error while loading shared libraries: libcrypto.so.3=
:
> cannot open shared object file: No such file or directory
> > Preserve libraries that sign-file script needs during runtime.
> >
> > Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
> > ---
> >  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/recipes-kernel/make-mod-scripts/
> make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/
> make-mod-scripts_1.0.bb
> > index 28e0807d1d..0e24efc597 100644
> > --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > @@ -32,3 +32,6 @@ do_configure() {
> >               -C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR} $=
t
> >       done
> >  }
> > +
> > +# keep native libraries required for module signing
> > +RM_WORK_EXCLUDE_ITEMS +=3D "recipe-sysroot-native"
>
> I'm really reluctant to take this change as it isn't the way
> dependencies are meant to work.
>
> It sounds like something in a shared workdir is depending on something
> in a recipe workdir and we simply don't support that. Everything needed
> should be in the shared workdir. At best this is a bandaid and there
> will be other ways to make this fail such as cleaning make-mod-scripts.
>

The problem is because for signing the kernel modules the sign-file.c [1]
is linked dynamically with openssl-native.
This works when building the in tree kernel modules but will fail when we
try to sing any out of tree kernel module.
To sign the out of tree kernel we will use the binaries from the shared
workdir but the native libcrypto.so.3 is removed by
the rm_work bbclass. We need to link the sign-file statically otherwise it
will not work with the rm_work bbclass.

[1] https://github.com/torvalds/linux/blob/master/scripts/sign-file.c

Another solution for this problem can be changing the make-mod-scripts to
be a native tool and in this way
they will be installed and the dependencies will be handled correctly.


> I'm even less keen to take it when I think it's going to be backported
> "everywhere" as if is the correct solution too.
>
> I don't know what the right fix is unfortunately. I'm sure people would
> like me to think about it and come up with one but there are simply too
> many different things people would like me to do that with and even for
> me, it does take a while to work these things out. I'm just out of
> bandwidth, sorry :(
>

It is true that it is not the correct solution but it is the most suitable
in my opinion.
I totally understand what you say and I'm a little sorry that I could still
help in this same fix.

This problem is something I would also like to fix because I am using the
RM_WORK_EXCLUDE
for quite some time to fix this issue on my distro.
I would like to convert the make-mod-scripts to be a native tool but I
haven't had time for that either.

Sorry and thank you for all your dedication and help.

Jose


> Cheers,
>
> Richard
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180167):
> https://lists.openembedded.org/g/openembedded-core/message/180167
> Mute This Topic: https://lists.openembedded.org/mt/98296212/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000172e1705f98fc1e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia segunda, 17/04/2023 =C3=A0(s) 20:51:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Sun, 2023-04-16 at 12:30 +0200,=
 Christoph Lauer wrote:<br>
&gt; From: Christoph Lauer &lt;<a href=3D"mailto:christoph.lauer@xtronic.de=
" target=3D"_blank">christoph.lauer@xtronic.de</a>&gt;<br>
&gt; <br>
&gt; With rm_work active, external module signing throws an error:<br>
&gt; scripts/sign-file: error while loading shared libraries: libcrypto.so.=
3: cannot open shared object file: No such file or directory<br>
&gt; Preserve libraries that sign-file script needs during runtime.<br>
&gt; <br>
&gt; Signed-off-by: Christoph Lauer &lt;<a href=3D"mailto:christoph.lauer@x=
tronic.de" target=3D"_blank">christoph.lauer@xtronic.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-mod-=
scripts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0.b=
b</a> | 3 +++<br>
&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-kernel/make-mod-scripts/<a href=3D"http://ma=
ke-mod-scripts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-script=
s_1.0.bb</a> b/meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-=
mod-scripts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1=
.0.bb</a><br>
&gt; index 28e0807d1d..0e24efc597 100644<br>
&gt; --- a/meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-mod-=
scripts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0.b=
b</a><br>
&gt; +++ b/meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-mod-=
scripts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0.b=
b</a><br>
&gt; @@ -32,3 +32,6 @@ do_configure() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-C ${STAGING_KER=
NEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR} $t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt;=C2=A0 }<br>
&gt; +<br>
&gt; +# keep native libraries required for module signing<br>
&gt; +RM_WORK_EXCLUDE_ITEMS +=3D &quot;recipe-sysroot-native&quot;<br>
<br>
I&#39;m really reluctant to take this change as it isn&#39;t the way<br>
dependencies are meant to work.<br>
<br>
It sounds like something in a shared workdir is depending on something<br>
in a recipe workdir and we simply don&#39;t support that. Everything needed=
<br>
should be in the shared workdir. At best this is a bandaid and there<br>
will be other ways to make this fail such as cleaning make-mod-scripts.<br>=
</blockquote><div><br></div><div>The problem is because for signing the ker=
nel modules the sign-file.c [1] is linked dynamically=C2=A0with openssl-nat=
ive.=C2=A0</div><div>This works when building the in tree kernel modules bu=
t will fail when we try to sing any out of=C2=A0tree kernel module.</div><d=
iv>To sign the out of=C2=A0tree kernel we will use the binaries from the sh=
ared workdir but the native libcrypto.so.3=C2=A0is removed by</div><div>the=
 rm_work bbclass. We need to link the sign-file statically=C2=A0otherwise i=
t will not work with the rm_work bbclass.</div><div>=C2=A0</div><div>[1] <a=
 href=3D"https://github.com/torvalds/linux/blob/master/scripts/sign-file.c"=
>https://github.com/torvalds/linux/blob/master/scripts/sign-file.c</a><br><=
/div><div><br>Another solution for this problem can be changing the make-mo=
d-scripts to be a native tool and in this way</div><div>they=C2=A0will be i=
nstalled and the dependencies will be handled correctly.<br><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
I&#39;m even less keen to take it when I think it&#39;s going to be backpor=
ted<br>
&quot;everywhere&quot; as if is the correct solution too.<br>
<br>
I don&#39;t know what the right fix is unfortunately. I&#39;m sure people w=
ould<br>
like me to think about it and come up with one but there are simply too<br>
many different things people would like me to do that with and even for<br>
me, it does take a while to work these things out. I&#39;m just out of<br>
bandwidth, sorry :(<br></blockquote><div><br>It is true that it is not the =
correct solution but it is the most suitable in my opinion.<br>I totally un=
derstand what you say=C2=A0and I&#39;m a little sorry that I could still he=
lp=C2=A0in this same fix.</div><div><br></div><div>This problem is somethin=
g I would also like to fix because=C2=A0I am using the=C2=A0<span style=3D"=
color:rgb(0,0,0)">RM_WORK_EXCLUDE</span><br>for quite some=C2=A0time to fix=
 this issue on=C2=A0my distro.</div><div>I would like to convert the make-m=
od-scripts to be a native tool=C2=A0but I haven&#39;t had time for that eit=
her.<br></div><div><br></div><div>Sorry and thank you for all your dedicati=
on and help.<br><br>Jose</div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#180167): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/180167" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/180167</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98296212/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98296212/5052612</a><br>
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

--000000000000172e1705f98fc1e0--

