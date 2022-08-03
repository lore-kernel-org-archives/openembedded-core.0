Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E64C19F2B
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 11:29:13 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web12.7362.1659526143192790594
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 04:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BDgXODAH;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id f20so18734196lfc.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 04:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=yaEaJqU5P0g4gW0qbstWBv615KES2nP2Vg2e3UeWGH0=;
        b=BDgXODAH7I9lFMGmlZQ2Q61P6JZHM28shAkSMbZMQch/rRjNH9aY8iWNajZ1fSQO9x
         ZMYC1vQz8tfv/JHx0mrAeeEQrHYT7tn5RJk89YYgyQ85rdzZlHLcGi5EIPcHgPvjq+O6
         XasG0L9DCS8namyFEHWHReEDZPauEMiphJJLh9L0qN8mRX2qy6iM/uDD28iZsmY92q+P
         vosaYuUgxNZpb+cxZC4ULVFyiMUvhhMowfMNg/U0o21qmU2ZpY3KPgY7Uul4lM4Ql2zj
         Pz/Mtg1IxbyfB0OrTpTu2A1if0BaZGL9CnlTS/GDumaB3HYoVgbz87k04thVdaBBDpfY
         Yebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=yaEaJqU5P0g4gW0qbstWBv615KES2nP2Vg2e3UeWGH0=;
        b=6cy3W/+njJ6k52jO804oTlgm5spHneHNww86tdnu8j9vGwvW69Bx6F8ozi7F93k88W
         LkAEj1wigkH/VgO7QbUGWdF7Sr7f+N0IZbKw9zez0nkYp4Xj37kjSYrPFlg70h8Avfcf
         1X3JD2HiNjRuo61DArKyOvtGCpKmjsux4BK6Qd1IG+Rdmwq7bblnaTk/jEZp9HiixHQL
         GUznTSoxAXOVIUG+KpP2rviz1s5vhfPLo1/hpLtFvmkWnAPnQsYFhHBxg07C8eI0N0rh
         IuexdzE8Q0mw1RUZzPkm2+iUIlxXwebAeMJWODbMXly9u2BPfVq3S0nf8SEGgal2dEve
         TjpQ==
X-Gm-Message-State: ACgBeo2++GMFFy9zKsh2VGj8sJ385SM2bjLKKSztTwyDCOG48s96/em0
	jb56Dswl+jL1VEV3KW0PAPwovkBl6sDaw/knhWw=
X-Google-Smtp-Source: 
 AA6agR4TWYxywszFJC4WsZzkdx9g7YxuZ9hUBgzGE6VEZ9YgCWX+IyG0rzEbsATZTw3XviHzvewOduE0WqaXqZ+Eyn8=
X-Received: by 2002:a05:6512:1082:b0:48a:f9b5:a563 with SMTP id
 j2-20020a056512108200b0048af9b5a563mr5124242lfg.471.1659526141202; Wed, 03
 Aug 2022 04:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220720113043.196185-1-jose.quaresma@foundries.io>
 <5eca86e2-e690-3547-c35a-624fe2afc6b2@gmail.com>
In-Reply-To: <5eca86e2-e690-3547-c35a-624fe2afc6b2@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 3 Aug 2022 12:28:50 +0100
Message-ID: 
 <CANPvuRkPta0nrScGcaA-++L7f3-U9BhEZdV6WaShyO_JuzXR=g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kernel.bbclass: Add shared_workdir_prepare task
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Ricardo Salveti <ricardo@foundries.io>,
 Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000002454b305e5548a35"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 11:29:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168813

--0000000000002454b305e5548a35
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jacob,

Jacob Kroon <jacob.kroon@gmail.com> escreveu no dia ter=C3=A7a, 2/08/2022 =
=C3=A0(s)
17:19:

> On 7/20/22 13:30, Jose Quaresma wrote:
> > The task do_compile_kernelmodules runs after the shared_workdir and
> > is installing some files in STAGING_KERNEL_BUILDDIR, this can races
> > in other recipes that depends on "virtual/kernel:do_shared_workdir"
> > as the STAGING_KERNEL_BUILDDIR is not fully populated when the
> > shared_workdir task ends.
> >
> > To address this issue a new task is added in place of the previows one
> > so the shared_workdir will run after the do_compile_kernelmodules and
> > the new shared_workdir_prepare will replce of the old shared_workdir.
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >   meta/classes/kernel.bbclass | 11 +++++++++--
> >   1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 5d2f17c3be..5558769c92 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -504,7 +504,8 @@ do_kernel_version_sanity_check() {
> >       exit 0
> >   }
> >
> > -addtask shared_workdir after do_compile before do_compile_kernelmodule=
s
> > +addtask shared_workdir_prepare after do_compile before
> do_compile_kernelmodules
> > +addtask shared_workdir after do_compile_kernelmodules
> >   addtask shared_workdir_setscene
> >
> >   do_shared_workdir_setscene () {
> > @@ -520,10 +521,16 @@ emit_depmod_pkgdata() {
> >
> >   PACKAGEFUNCS +=3D "emit_depmod_pkgdata"
> >
> > -do_shared_workdir[cleandirs] +=3D " ${STAGING_KERNEL_BUILDDIR}"
> >   do_shared_workdir () {
> >       cd ${B}
> >
> > +     kerneldir=3D${STAGING_KERNEL_BUILDDIR}
> > +}
>
> Does the above do anything actually useful ? I thought neither the
> current workdir or a variable set in a shell function would be preserved
> for the next task ?
>

It is strictly necessary to be backward compatible with what we have before=
,
otherwise any possible do_shared_workdir:appends that may exist in other
layers would stop working.

For setting the task work dir you can use the [dirs] flag in the task where
the last directory will be the task workdir.
https://docs.yoctoproject.org/bitbake/2.0/bitbake-user-manual/bitbake-user-=
manual-metadata.html#variable-flags

Without it the work dir of the task is the current directory where you run
bitbake.
About the variable created during tasks it only exists until the end of the
task where they were created.
You can check that inside $WORKDIR/temp/run.TASK, in each case is
$WORKDIR/temp/run.do_shared_workdir

So we have to keep the working directory as well as the variables from
the do_shared_workdir_prepare
that are expected at the end of the do_shared_workdir.

Jose


> > +
> > +do_shared_workdir_prepare[cleandirs] +=3D " ${STAGING_KERNEL_BUILDDIR}=
"
> > +do_shared_workdir_prepare () {
> > +     cd ${B}
> > +
> >       kerneldir=3D${STAGING_KERNEL_BUILDDIR}
> >       install -d $kerneldir
> >
>
> Jacob
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000002454b305e5548a35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Jacob,</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Jacob Kroon &lt;<a href=3D"mailto:jacob.kroo=
n@gmail.com">jacob.kroon@gmail.com</a>&gt; escreveu no dia ter=C3=A7a, 2/08=
/2022 =C3=A0(s) 17:19:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On 7/20/22 13:30, Jose Quaresma wrote:<br>
&gt; The task do_compile_kernelmodules runs after the shared_workdir and<br=
>
&gt; is installing some files in STAGING_KERNEL_BUILDDIR, this can races<br=
>
&gt; in other recipes that depends on &quot;virtual/kernel:do_shared_workdi=
r&quot;<br>
&gt; as the STAGING_KERNEL_BUILDDIR is not fully populated when the<br>
&gt; shared_workdir task ends.<br>
&gt; <br>
&gt; To address this issue a new task is added in place of the previows one=
<br>
&gt; so the shared_workdir will run after the do_compile_kernelmodules and<=
br>
&gt; the new shared_workdir_prepare will replce of the old shared_workdir.<=
br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/classes/kernel.bbclass | 11 +++++++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 9 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass=
<br>
&gt; index 5d2f17c3be..5558769c92 100644<br>
&gt; --- a/meta/classes/kernel.bbclass<br>
&gt; +++ b/meta/classes/kernel.bbclass<br>
&gt; @@ -504,7 +504,8 @@ do_kernel_version_sanity_check() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0exit 0<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -addtask shared_workdir after do_compile before do_compile_kernelmodul=
es<br>
&gt; +addtask shared_workdir_prepare after do_compile before do_compile_ker=
nelmodules<br>
&gt; +addtask shared_workdir after do_compile_kernelmodules<br>
&gt;=C2=A0 =C2=A0addtask shared_workdir_setscene<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0do_shared_workdir_setscene () {<br>
&gt; @@ -520,10 +521,16 @@ emit_depmod_pkgdata() {<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0PACKAGEFUNCS +=3D &quot;emit_depmod_pkgdata&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -do_shared_workdir[cleandirs] +=3D &quot; ${STAGING_KERNEL_BUILDDIR}&q=
uot;<br>
&gt;=C2=A0 =C2=A0do_shared_workdir () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${B}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0kerneldir=3D${STAGING_KERNEL_BUILDDIR}<br>
&gt; +}<br>
<br>
Does the above do anything actually useful ? I thought neither the <br>
current workdir or a variable set in a shell function would be preserved <b=
r>
for the next task ?<br></blockquote><div><br></div><div>It is strictly nece=
ssary to be backward compatible with what we have before,<br>otherwise any =
possible do_shared_workdir:appends that may exist in other layers would sto=
p working.</div><div><br>For setting the task work dir you can use the [dir=
s] flag in the task where the last directory will be the task workdir.</div=
><div><a href=3D"https://docs.yoctoproject.org/bitbake/2.0/bitbake-user-man=
ual/bitbake-user-manual-metadata.html#variable-flags">https://docs.yoctopro=
ject.org/bitbake/2.0/bitbake-user-manual/bitbake-user-manual-metadata.html#=
variable-flags</a><br></div><br class=3D"gmail-Apple-interchange-newline"><=
div>Without it the work dir of the task is the current directory where you =
run bitbake.<br></div><div>About the variable created during tasks it only =
exists until the end of the task where they were created.</div><div>You can=
 check that inside $WORKDIR/temp/run.TASK, in each case is $WORKDIR/temp/ru=
n.do_shared_workdir</div><div><br></div><div>So we=C2=A0have to keep the=C2=
=A0working directory as well as the=C2=A0variables=C2=A0from the=C2=A0do_sh=
ared_workdir_prepare</div><div>that are expected at the end of the do_share=
d_workdir.</div><div><br></div><div>Jose</div><div><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +do_shared_workdir_prepare[cleandirs] +=3D &quot; ${STAGING_KERNEL_BUI=
LDDIR}&quot;<br>
&gt; +do_shared_workdir_prepare () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cd ${B}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0kerneldir=3D${STAGING_KERNEL_BUILDDIR}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d $kerneldir<br>
&gt;=C2=A0 =C2=A0<br>
<br>
Jacob<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000002454b305e5548a35--

