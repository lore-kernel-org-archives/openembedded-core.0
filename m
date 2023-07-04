Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A44EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 10:36:18 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web10.55684.1688466972731180149
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 03:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Kb1nALTc;
 spf=pass (domain: gmail.com, ip: 209.85.222.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-783eef15004so1308339241.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 03:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688466971; x=1691058971;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yv52wGKG4/2vBdVv79ihVksW+WWdWl3j7ZPkxxW5bCs=;
        b=Kb1nALTcdBLxlTa//Og/f81xJnLBEjpGq/x15IFNh3QXzl8fCUiz5vbTIGEIPrMKs4
         qeiECGIucxaU6ufNWDRuONWnTu5nJDzerYPWfkxIa95HIyXPj48ozhFUFg6Bgf2ETVZl
         I3r78b7VxKbBTg2EvuNTAVfW1uZgJ62GJ7PCBmTWJBXsFApo8H4XTL/7tikrr1DgS3NB
         f1iwFPIDw+NyRi+1lzMj7jGnIOK1a61l/0q8yLaGa94AKCFpFXfFGKGO3+5vj0WjBdDP
         LEKBFSeOxWa9yYVS/HR4OryhppyMoVDCnGBW/tHOu1sCfsE1mYRS8lGFqrCD5Jr7nBpF
         +Kkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688466971; x=1691058971;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yv52wGKG4/2vBdVv79ihVksW+WWdWl3j7ZPkxxW5bCs=;
        b=A7XUGQqdqLAXuMTMcjSk580jRuYi0bCZ069Yx9rQKPSiPP7JsNkDUMwV9624nwePmg
         kjRi2vOSZGsCPMGb6zb/l75cE5Akf43YR2gOhtT+ZfmIs7KENK/ao7xmC/j52PolPCIH
         2q2jK/4+YCu6YPjA9mdMTSXlQ0rynLuerylxm3JZ8PharXaJ9zkc1d0ehFriKazDU5/x
         /t7xqWv+qT5mc2JU5Ke0z3fyXcgAvLM4UR8g7lEasA7U+di5ZqnCOea++fiKhzmcM91A
         N73elgs05ohWeaMEdxUK4sQBygBosgeSc3ou/EVyLk/oSZmXwYmdAe+TPOHhZfZiqy9M
         NpPA==
X-Gm-Message-State: ABy/qLYZMiGWb6k6OORFfxnlvz8lwI4HaSZdlSJ+GvNjKyCLHtXG0XN5
	RF+QM2OZOqhcg4jOpVcjd7bYPy9r2vtuyM3HzmM=
X-Google-Smtp-Source: APBJJlFetNxKlxGWkRMsjbX72mXee9BL7Q89Vt4UhkNgzrPns7AVn6tqXpSeRzcvNuIY+0+rC9KY55V+B2qhCFfz8jw=
X-Received: by 2002:a05:6102:50d:b0:443:621e:d138 with SMTP id
 l13-20020a056102050d00b00443621ed138mr4219721vsa.5.1688466971444; Tue, 04 Jul
 2023 03:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <176D7A91B0AC29AF.23465@lists.openembedded.org>
 <CANPvuRnKUisRu9CgkQgv2d1WAr1+hmC_1yr8orLToPw3tcMqmg@mail.gmail.com> <6E876A4F-1E4A-4520-A978-7EA0E142E267@arm.com>
In-Reply-To: <6E876A4F-1E4A-4520-A978-7EA0E142E267@arm.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 4 Jul 2023 11:36:00 +0100
Message-ID: <CANPvuRmHjpoVsjDyXpSkKZw-UhaGcYbfhKyDMSMB0aVVC6Ao7g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-module-split add systemd modulesloaddir
 and modprobedir config
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000c489605ffa6dae3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 10:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183822

--0000000000000c489605ffa6dae3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ross Burton <Ross.Burton@arm.com> escreveu no dia ter=C3=A7a, 4/07/2023 =C3=
=A0(s)
11:03:

> The colon can be fixed but a rationale for this change would be useful.
>

Sure, I will send a v2 explaining:

Because busybox doesn't support other path than /etc [1] we can't
change the default path unconditionally so change it only for systemd.

Jose


>
> Ross
>
> > On 4 Jul 2023, at 10:03, Jose Quaresma via lists.openembedded.org
> <quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > gentle ping
> >
> > Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
> gmail.com@lists.openembedded.org> escreveu no dia sexta, 30/06/2023 =C3=
=A0(s)
> 16:50:
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  meta/classes-recipe/kernel-module-split.bbclass | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes-recipe/kernel-module-split.bbclass
> b/meta/classes-recipe/kernel-module-split.bbclass
> > index 0e4f9a6ec3..c1208d55e0 100644
> > --- a/meta/classes-recipe/kernel-module-split.bbclass
> > +++ b/meta/classes-recipe/kernel-module-split.bbclass
> > @@ -30,8 +30,8 @@ fi
> >
> >  PACKAGE_WRITE_DEPS +=3D "kmod-native depmodwrapper-cross"
> >
> > -modulesloaddir ??=3D "${sysconfdir}/modules-load.d"
> > -modprobedir ??=3D "${sysconfdir}/modprobe.d"
> > +modulesloaddir ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd=
',
> '${nonarch_libdir}', '${sysconfdir}', d)}/modules-load.d"
> > +modprobedir ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> '${nonarch_base_libdir}', '${sysconfdir}', d)}/modprobe.d"
> >
> >  KERNEL_SPLIT_MODULES ?=3D "1"
> >  PACKAGESPLITFUNCS =3D+ "split_kernel_module_packages"
> > --
> > 2.34.1
> >
> >
> >
> >
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#183818):
> https://lists.openembedded.org/g/openembedded-core/message/183818
> > Mute This Topic: https://lists.openembedded.org/mt/99875687/6875888
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ross.burton@arm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000000c489605ffa6dae3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Ross Burton &lt;<a href=3D"mailto:Ros=
s.Burton@arm.com">Ross.Burton@arm.com</a>&gt; escreveu no dia ter=C3=A7a, 4=
/07/2023 =C3=A0(s) 11:03:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">The colon can be fixed but a rationale for this change would be =
useful.<br></blockquote><div><br></div><div>Sure, I will send a v2 explaini=
ng:<br><br>Because busybox doesn&#39;t support other path than /etc [1] we =
can&#39;t<br>change the default path unconditionally so change it only for =
systemd.<br><br>Jose<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Ross<br>
<br>
&gt; On 4 Jul 2023, at 10:03, Jose Quaresma via <a href=3D"http://lists.ope=
nembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org<=
/a> &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org"=
 target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; gentle ping<br>
&gt; <br>
&gt; Jose Quaresma via <a href=3D"http://lists.openembedded.org" rel=3D"nor=
eferrer" target=3D"_blank">lists.openembedded.org</a> &lt;quaresma.jose=3D<=
a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.=
com@lists.openembedded.org</a>&gt; escreveu no dia sexta, 30/06/2023 =C3=A0=
(s) 16:50:<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/kernel-module-split.bbclass | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/cl=
asses-recipe/kernel-module-split.bbclass<br>
&gt; index 0e4f9a6ec3..c1208d55e0 100644<br>
&gt; --- a/meta/classes-recipe/kernel-module-split.bbclass<br>
&gt; +++ b/meta/classes-recipe/kernel-module-split.bbclass<br>
&gt; @@ -30,8 +30,8 @@ fi<br>
&gt; <br>
&gt;=C2=A0 PACKAGE_WRITE_DEPS +=3D &quot;kmod-native depmodwrapper-cross&qu=
ot;<br>
&gt; <br>
&gt; -modulesloaddir ??=3D &quot;${sysconfdir}/modules-load.d&quot;<br>
&gt; -modprobedir ??=3D &quot;${sysconfdir}/modprobe.d&quot;<br>
&gt; +modulesloaddir ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&=
#39;, &#39;systemd&#39;, &#39;${nonarch_libdir}&#39;, &#39;${sysconfdir}&#3=
9;, d)}/modules-load.d&quot;<br>
&gt; +modprobedir ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39=
;, &#39;systemd&#39;, &#39;${nonarch_base_libdir}&#39;, &#39;${sysconfdir}&=
#39;, d)}/modprobe.d&quot;<br>
&gt; <br>
&gt;=C2=A0 KERNEL_SPLIT_MODULES ?=3D &quot;1&quot;<br>
&gt;=C2=A0 PACKAGESPLITFUNCS =3D+ &quot;split_kernel_module_packages&quot;<=
br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Best regards,<br>
&gt; <br>
&gt; Jos=C3=A9 Quaresma<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#183818): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/183818" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/183818</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99875687=
/6875888" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/99875687/6875888</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:ross.burton@arm.com" =
target=3D"_blank">ross.burton@arm.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000000c489605ffa6dae3--

