Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D36C19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 17:26:30 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web08.608.1660238787018261671
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 10:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f5rkg8cY;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id e15so26539085lfs.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 10:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=3t/G+QgZ24mwFD3Hl81W1LG3BdF9M39ZsgNjUU0nJCc=;
        b=f5rkg8cY41LxyDJ3yCnPvyGOpfc86LBBoIEfhCdRZavouS9yE9pdOmdOGJxos2pnC+
         xoYZ7lV9ypXSvGnuv6rgwKC/rzVdA64sdLtm8M24+5mDiYUGSxmHc6y/kMwPshkW4ZeB
         u2Hgr3wa4+ykqnh/w4Co2u1IKTde7MBms31jhU14q8o14BJ3xSYeFAOCgerAHbCqJQCw
         1C8FdqIC9kyEM+b7Wwcv+L2E44ec3y5+J/mJ32/cnwKoVH/6Ko4n0Y60Jk6/8Nj3CRpF
         WY+t+5KVZ09dQ7YPAANWnJcVixYNLktGhh8nakUBVD86G4trXfFAi9lGMTMr0/MqSFrN
         15/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=3t/G+QgZ24mwFD3Hl81W1LG3BdF9M39ZsgNjUU0nJCc=;
        b=Ad7RKDMLqKOWQ/zQDJOpNyamsPZcUBfQKpjiffblqgeqSzmekv70Ofjh1BzAUQZFfT
         XvMXKb3avYewu44yyQxC8+oJtGzejly7tk//Jy22hB6TzIKIRqJYph+E6jVb3FZlDqpb
         W2Mr8BA821cJ7zhpf1S0+gBkZbafcbPtodazNKnivor9eaZ4Tp7rRsPlKFgi8X6JvBa4
         yDQQhV20S2KaaVxTBVYwnJG+GRi5yzNY8OMImRXm9JR0hbhLTFOO7cGj1tvVzZZTX244
         EAANO1sA7Ni7zuepOBblgPrtdT2koB0mAHLUMz48JKXiSS7STSxk0sAv3CaKZXDDJeN4
         hWCg==
X-Gm-Message-State: ACgBeo3QWYOUrC0/4WQch+YbwC4c6RJpCsX1x+lw9AEmZjQC9pHkqCJL
	X5+ct+qPUzLZMmF33btdn7GF0CExzgFw99DRkdo=
X-Google-Smtp-Source: 
 AA6agR5wwjaLQawHDo998TCfg/BRL3Qe4bNRquS6AquwbzIWc+JogOU4vD3P+mNPwX6FeXTJt9kgfiFOKNnf50PW1r8=
X-Received: by 2002:a05:6512:2984:b0:48b:2ef5:35d9 with SMTP id
 du4-20020a056512298400b0048b2ef535d9mr95194lfb.412.1660238785037; Thu, 11 Aug
 2022 10:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220811161757.278819-1-jose.quaresma@foundries.io>
 <CADkTA4PaFdRpyxko=bpRQ5CVoAVgD8g8Nt4SMW_0USAYme3RkQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PaFdRpyxko=bpRQ5CVoAVgD8g8Nt4SMW_0USAYme3RkQ@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 11 Aug 2022 18:26:13 +0100
Message-ID: 
 <CANPvuRmPVe_4D-hWkkZ93y=u6YuMVBu_KCADG1OH32aK-=OB_w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] module.bbclass: rebuild the modules when kernel
 change
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Ricardo Salveti <ricardo@foundries.io>, daiane.angolini@foundries.io,
	otavio@ossystems.com.br, Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000006494e05e5fa77e0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 17:26:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169260

--00000000000006494e05e5fa77e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia quinta,
11/08/2022 =C3=A0(s) 18:06:

> On Thu, Aug 11, 2022 at 12:18 PM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> > When the kernel is rebuild or some of they tasks change the
> > kernel modules is not rebuild as well and will comes from
> > the sstate-cache.
> >
> > [YOCTO #14885] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1488=
5
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  meta/classes/module.bbclass | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> > index a09ec3ed1e..d377a08bc6 100644
> > --- a/meta/classes/module.bbclass
> > +++ b/meta/classes/module.bbclass
> > @@ -1,5 +1,7 @@
> >  inherit module-base kernel-module-split pkgconfig
> >
> > +DEPENDS +=3D "virtual/kernel"
>
> There's already a dependency on virtual/kernel:do_shared_workdir() throug=
h
> module-base.bbclass and the make-mod-scripts dependency.
>

I know that and imo the make-mod-scripts need to be cleaned up a bit as wel=
l
It is compile the the code do_configure and as a dependency in
"virtual/kernel:do_compile_kernelmodules"
for they do_compile anyway this is another history and I will submit some
patch when finished.
Another thing that I have in my mind is to make the  make-mod-scripts a
native recipe because they
don't build anything for the target.


>
> And that dependency was a change to this:
>
> -# This is instead of DEPENDS =3D "virtual/kernel"
> -do_configure[depends] +=3D "virtual/kernel:do_compile_kernelmodules"
>
> i.e. we've always had a finer grained dependency than what is being
> proposed here.
>
> We need to understand why that shared_workdir() dependency isn't
> doing the job any more, and if there's no way to fix it .. then going bac=
k
> to the older compile dependency is still lighter weight than depending
> on virtual/kernel (and the default of do_prepare_recipe_sysroot).
>

I can do another round in order to change another task, other than the
shared_workdir,
that I think will do the same i.e: get the modules from the sstate-cache.
I suspect this is unrelated to the task shared_workdir.

Thanks for the feedback and your time.

Jose


>
> It must (could?) be something with the shared workdir changing the
> interactions.
>
> Bruce
>
> > +
> >  EXTRA_OEMAKE +=3D "KERNEL_SRC=3D${STAGING_KERNEL_DIR}"
> >
> >  MODULES_INSTALL_TARGET ?=3D "modules_install"
> > --
> > 2.37.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#169253):
> https://lists.openembedded.org/g/openembedded-core/message/169253
> > Mute This Topic: https://lists.openembedded.org/mt/92962048/1050810
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000006494e05e5fa77e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; escreveu no dia =
quinta, 11/08/2022 =C3=A0(s) 18:06:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Thu, Aug 11, 2022 at 12:18 PM Jose Quaresma &lt;<a h=
ref=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmai=
l.com</a>&gt; wrote:<br>
&gt;<br>
&gt; When the kernel is rebuild or some of they tasks change the<br>
&gt; kernel modules is not rebuild as well and will comes from<br>
&gt; the sstate-cache.<br>
&gt;<br>
&gt; [YOCTO #14885] <a href=3D"https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D14885" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctop=
roject.org/show_bug.cgi?id=3D14885</a><br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/module.bbclass | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass=
<br>
&gt; index a09ec3ed1e..d377a08bc6 100644<br>
&gt; --- a/meta/classes/module.bbclass<br>
&gt; +++ b/meta/classes/module.bbclass<br>
&gt; @@ -1,5 +1,7 @@<br>
&gt;=C2=A0 inherit module-base kernel-module-split pkgconfig<br>
&gt;<br>
&gt; +DEPENDS +=3D &quot;virtual/kernel&quot;<br>
<br>
There&#39;s already a dependency on virtual/kernel:do_shared_workdir() thro=
ugh<br>
module-base.bbclass and the make-mod-scripts dependency.<br></blockquote><d=
iv><br></div><div>I know that and imo the make-mod-scripts need to be clean=
ed up a bit as well<br>It is compile the the code do_configure and as a dep=
endency in &quot;virtual/kernel:do_compile_kernelmodules&quot;<br>for they =
do_compile anyway this is another history and I will submit some patch when=
 finished.<br>Another thing that I have in my mind is to make the =C2=A0mak=
e-mod-scripts a native recipe because they<br>don&#39;t build anything for =
the target.<br></div></div><div class=3D"gmail_quote"><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
And that dependency was a change to this:<br>
<br>
-# This is instead of DEPENDS =3D &quot;virtual/kernel&quot;<br>
-do_configure[depends] +=3D &quot;virtual/kernel:do_compile_kernelmodules&q=
uot;<br>
<br>
i.e. we&#39;ve always had a finer grained dependency than what is being<br>
proposed here.<br>
<br>
We need to understand why that shared_workdir() dependency isn&#39;t<br>
doing the job any more, and if there&#39;s no way to fix it .. then going b=
ack<br>
to the older compile dependency is still lighter weight than depending<br>
on virtual/kernel (and the default of do_prepare_recipe_sysroot).<br></bloc=
kquote><div><br>I can do another round=C2=A0in order to change another task=
, other than the shared_workdir,</div><div>that I think will do the same i.=
e: get the modules from the sstate-cache.</div><div>I suspect this is unrel=
ated to the task shared_workdir.<br><br>Thanks for the feedback and your ti=
me.</div><div><br></div><div>Jose<br>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
It must (could?) be something with the shared workdir changing the interact=
ions.<br>
<br>
Bruce<br>
<br>
&gt; +<br>
&gt;=C2=A0 EXTRA_OEMAKE +=3D &quot;KERNEL_SRC=3D${STAGING_KERNEL_DIR}&quot;=
<br>
&gt;<br>
&gt;=C2=A0 MODULES_INSTALL_TARGET ?=3D &quot;modules_install&quot;<br>
&gt; --<br>
&gt; 2.37.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#169253): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/169253" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/169253</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92962048=
/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/92962048/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.=
com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
--<br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000006494e05e5fa77e0--

