Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE14C27C47
	for <webhook@archiver.kernel.org>; Sat, 28 Oct 2023 13:46:07 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.18072.1698500765141798123
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Oct 2023 06:46:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z2QBzDhH;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: bhstalel@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-507b9408c61so4124655e87.0
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Oct 2023 06:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698500763; x=1699105563; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wcCru79QuH2Tj2e2sQMEXae4nonQ7a6UpNJ8aUEr+vA=;
        b=Z2QBzDhHY2lHwrbN9kjL/3b2wT2EQTNLxe5IKhmXFmNjSMjV/kC7ylDuCRnqlloDyT
         JrgdDzBE2uHZCXtLEUF9/vYYxy1P6o3itWbplj89GK4FPLZF93dynv/SlVnqaF9l+sVc
         OsE2IR9e4ai6MPsiM1BQVo9VbLIBYyhEVezwtUclatDZBxfg4Q9iC1nQJTLHoZQ0Iw1J
         TfYHWxcouIDErFLcbUQ1tarYx5mrlXW6bgPAoAjK1UGrvr8dQuy3jP2jJkiqv1Pmvus+
         tsja1h22YdUODutHc4HLd3cqWWWYu/yoJWEmQqrJBzmVmzWqdunyUosnsB2mwObPByjY
         sJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698500763; x=1699105563;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wcCru79QuH2Tj2e2sQMEXae4nonQ7a6UpNJ8aUEr+vA=;
        b=BB+sgo6BcNh1q3haSRgMbFpJ+AOoJ0uGK52W+0ZoeJCxke8VQR2MsofhsCnJIho9I2
         GnQMj3eDYsB8Aopq2lwg2QHGVvbY7NEFvDvf5CnrZxgN/f2Jxa8ZeaAxQYVyOrYqJlgv
         Hfl0QSct7ocIf5SubAFKHu70Px1YP3O+Xn/k4fKrZ3U3S/77mceNSvWk9fWwy+3Pecen
         hUufjADUuLV335cYXVV6qBPraKV/WG1hD388FOtshqPCJGPC2e7GheOJ1efFLOx5jZU4
         yjfx+vJvUEp2S8SBmm57z6yInboaJCXJCM8xQ6tTGqposYdGZF1xpUtIN9+qPMm9wo1p
         KZVQ==
X-Gm-Message-State: AOJu0Yx9fl1OVFZA7DReBqqJbnvY/05V3p5690h7eXAT5hpmGc4AZ0mX
	jJd+uch/MHfRn9K+ymxFhxdrhGL44JyaIqJElv8=
X-Google-Smtp-Source: AGHT+IELs8DKi0ly3tN6Lz5YCClmtFoopDu4k8bGapeW7AsXASFA2HlXMimSy3N74DpuIVKw2oX89HF/gqamYEGribo=
X-Received: by 2002:a05:6512:3f0f:b0:509:1033:c544 with SMTP id
 y15-20020a0565123f0f00b005091033c544mr1329258lfa.50.1698500762827; Sat, 28
 Oct 2023 06:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231028000738.968009-1-bhstalel@gmail.com> <CADkTA4PWe7-2GgsiyZMFqppje+hhY_3yUMrENF2DGaKv+pUwEw@mail.gmail.com>
In-Reply-To: <CADkTA4PWe7-2GgsiyZMFqppje+hhY_3yUMrENF2DGaKv+pUwEw@mail.gmail.com>
From: Talel BELHADJ SALEM <bhstalel@gmail.com>
Date: Sat, 28 Oct 2023 14:45:51 +0100
Message-ID: <CAOgG7m1h++9kkDR8Dc6PAPFw_YxX7x22QyRraLkOXOMWGsgHqQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] meta: classes-recipe: A class for simple Kernel modules
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009e7fd80608c70643"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Oct 2023 13:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189764

--0000000000009e7fd80608c70643
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Bruce,

Thanks for the feedback, I agree that this is more suitable for developers
that want to integrate a quick driver
or a driver that has no Makefile, but I think adding the class for now and
then improvements or other ideas
can come.

I will remove the example as I included some examples in the class comment
itself.

Kind Regards
Talel

On Sat, Oct 28, 2023 at 1:35=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:

> On Fri, Oct 27, 2023 at 8:07=E2=80=AFPM BELHADJ SALEM Talel <bhstalel@gma=
il.com>
> wrote:
> >
> > The module class provides what is needed to compile a Linux Kernel modu=
le
> > but since the Makefile is always the same for simple modules that have
> > their sources in one directory level, I thought of creating new class
> wrapper
> > to automatically prepare the Makefile.
> > Also, using variable flag feature, a recipe can provide multiple module=
s
> > and can be handled the same way as PACKAGECONFIG is used to
> enabled/disable
> > features.
>
> I find this method of preparing a kernel module much harder to follow
> (and debug).
>
> So Richard is ok with the class, I have no objections, it may serve a
> class of
> developers, but it isn't something I'd support as a first option.
>
> But please, create a separate example for it, not modifying hello-world,
> we want
> that simple and explicit example to persist.
>
> Bruce
>
> >
> > Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
> > ---
> >  .../recipes-kernel/hello-mod/hello-mod_0.1.bb |  11 +-
> >  meta/classes-recipe/simple-module.bbclass     | 116 ++++++++++++++++++
> >  2 files changed, 120 insertions(+), 7 deletions(-)
> >  create mode 100644 meta/classes-recipe/simple-module.bbclass
> >
> > diff --git a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
> b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
> > index a2fb212a68..f191b08be5 100644
> > --- a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
> > +++ b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
> > @@ -3,16 +3,13 @@ DESCRIPTION =3D "${SUMMARY}"
> >  LICENSE =3D "GPL-2.0-only"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c=
4ca7e"
> >
> > -inherit module
> > +inherit simple-module
> >
> > -SRC_URI =3D "file://Makefile \
> > -           file://hello.c \
> > +SRC_URI =3D "file://hello.c \
> >             file://COPYING \
> >            "
> >
> >  S =3D "${WORKDIR}"
> >
> > -# The inherit of module.bbclass will automatically name module package=
s
> with
> > -# "kernel-module-" prefix as required by the oe-core build environment=
.
> > -
> > -RPROVIDES:${PN} +=3D "kernel-module-hello"
> > +MODULE_SRC =3D "hello"
> > +MODULE_SRC[hello] =3D ""
> > \ No newline at end of file
> > diff --git a/meta/classes-recipe/simple-module.bbclass
> b/meta/classes-recipe/simple-module.bbclass
> > new file mode 100644
> > index 0000000000..a837dec848
> > --- /dev/null
> > +++ b/meta/classes-recipe/simple-module.bbclass
> > @@ -0,0 +1,116 @@
> > +#
> > +# Copyright OpenEmbedded Contributors
> > +#
> > +# SPDX-License-Identifier: MIT
> > +#
> > +
> > +# Class to generate Makefile for Linux Kernel modules
> > +#
> > +# The aim of this class is to provide a way to gain time
> > +# when creating recipes for Linux Kernel modules
> > +#
> > +# Required variable:
> > +#   MODULE_SRC
> > +#
> > +# This variable itself counts on flags to know what files
> > +# to use for .ko generation and their .o dependencies
> > +#
> > +# Usage:
> > +#   If you have the following module structure:
> > +#       |-- module.c
> > +#       |-- dep1.c
> > +#       `-- dep2.c
> > +#   then you set:
> > +#   MODULE_SRC[module] =3D "dep1 dep2"
> > +#
> > +# This will generate:
> > +#   obj-m +=3D module.o
> > +#   module-objs +=3D dep1.o dep2.o
> > +#
> > +# This class supports multiple modules as well
> > +# each module will be added to obj-m and if it has dependencies
> > +# an -objs variable will be created.
> > +#
> > +# A module can be enabled or disabled by adding or removing
> > +# the module name from MODULE_SRC
> > +#
> > +# Limitations:
> > +#   - All modules source files should exist in the same folder level
> > +
> > +inherit module
> > +
> > +python do_prepare_makefile() {
> > +
> > +    if not (d.getVar('MODULE_SRC') or "").split():
> > +        bb.warn("You inherited easy-module but did not set drivers in
> MODULE_SRC")
> > +
> > +    kernel_modules =3D (d.getVar('MODULE_SRC') or "").split()
> > +
> > +    if kernel_modules:
> > +        kernel_modules_flags =3D d.getVarFlags('MODULE_SRC') or []
> > +
> > +        objs_data =3D {}
> > +        for k_module in kernel_modules:
> > +
> > +            # Check if all enabled drivers have corresponding flag
> > +            if not k_module in kernel_modules_flags:
> > +                bb.fatal(f"Driver {k_module} is enabled but does not
> have a flag entry")
> > +
> > +            k_module_file =3D f"{k_module}.c"
> > +            if not os.path.isfile(k_module_file):
> > +                bb.fatal(f"Source file {k_module_file} is not found")
> > +
> > +            k_module_o =3D f"{k_module}.o"
> > +            objs_data[k_module] =3D []
> > +
> > +            k_module_deps =3D (d.getVarFlag('MODULE_SRC', k_module) or
> "").split()
> > +            for dep in k_module_deps:
> > +                dep_file =3D f"{dep}.c"
> > +                dep_o =3D f"{dep}.o"
> > +
> > +                if not os.path.isfile(dep_file):
> > +                    bb.fatal(f"Dependency file {dep_file} for the
> {k_module_file} is not found")
> > +
> > +                objs_data[k_module].append(dep_o)
> > +
> > +        with open('Makefile', 'w') as mf:
> > +            # Main modules
> > +            mf.write(
> > +                f"""
> > +# This Makefile is generated automatically by easy-module class
> > +obj-m +=3D {' '.join([objm + '.o' for objm in objs_data.keys()])}
> > +""")
> > +
> > +            # Modules dependencies
> > +            for k_module, deps in objs_data.items():
> > +                if deps:
> > +                    mf.write(
> > +                        f"""
> > +{k_module}-objs +=3D {' '.join([dep for dep in deps])}
> > +""")
> > +
> > +            # Rest of Makefile
> > +            mf.write(
> > +                """
> > +SRC :=3D $(shell pwd)
> > +
> > +all:
> > +\t$(MAKE) -C $(KERNEL_SRC) M=3D$(SRC)
> > +
> > +modules_install:
> > +\t$(MAKE) -C $(KERNEL_SRC) M=3D$(SRC) modules_install
> > +
> > +clean:
> > +\trm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
> > +\trm -f Module.markers Module.symvers modules.order
> > +\trm -rf .tmp_versions Modules.symvers
> > +""")
> > +}
> > +
> > +RPROVIDES:${PN} +=3D "kernel-module-${PN}"
> > +
> > +export SRC =3D "${B}"
> > +
> > +do_prepare_makefile[docs] =3D "Automate Makefile preparation for simpl=
e
> Kernel modules"
> > +do_prepare_makefile[dirs] =3D "${B}"
> > +addtask do_prepare_makefile before do_configure after do_patch
> > \ No newline at end of file
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#189756):
> https://lists.openembedded.org/g/openembedded-core/message/189756
> > Mute This Topic: https://lists.openembedded.org/mt/102233042/1050810
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

--0000000000009e7fd80608c70643
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello=C2=A0Bruce,<div><br></div><div>Thanks for the feedba=
ck, I agree that this is more suitable for developers that want to integrat=
e a quick driver</div><div>or a driver that has no Makefile, but I think ad=
ding the class for now and then improvements or other ideas</div><div>can c=
ome.</div><div><br></div><div>I will remove the example as I included some =
examples in the class comment itself.</div><div><br></div><div>Kind Regards=
</div><div>Talel=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, Oct 28, 2023 at 1:35=E2=80=AFPM Bruce=
 Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Fri, Oct 27, 2023 at 8:07=E2=80=AFPM BELHADJ SALEM Talel &lt;<a h=
ref=3D"mailto:bhstalel@gmail.com" target=3D"_blank">bhstalel@gmail.com</a>&=
gt; wrote:<br>
&gt;<br>
&gt; The module class provides what is needed to compile a Linux Kernel mod=
ule<br>
&gt; but since the Makefile is always the same for simple modules that have=
<br>
&gt; their sources in one directory level, I thought of creating new class =
wrapper<br>
&gt; to automatically prepare the Makefile.<br>
&gt; Also, using variable flag feature, a recipe can provide multiple modul=
es<br>
&gt; and can be handled the same way as PACKAGECONFIG is used to enabled/di=
sable<br>
&gt; features.<br>
<br>
I find this method of preparing a kernel module much harder to follow<br>
(and debug).<br>
<br>
So Richard is ok with the class, I have no objections, it may serve a class=
 of<br>
developers, but it isn&#39;t something I&#39;d support as a first option.<b=
r>
<br>
But please, create a separate example for it, not modifying hello-world, we=
 want<br>
that simple and explicit example to persist.<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; Signed-off-by: Talel BELHAJSALEM &lt;<a href=3D"mailto:bhstalel@gmail.=
com" target=3D"_blank">bhstalel@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-kernel/hello-mod/<a href=3D"http://hello-mod_0.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">hello-mod_0.1.bb</a> |=C2=A0 11 +-<br=
>
&gt;=C2=A0 meta/classes-recipe/simple-module.bbclass=C2=A0 =C2=A0 =C2=A0| 1=
16 ++++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 120 insertions(+), 7 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/classes-recipe/simple-module.bbclass<br>
&gt;<br>
&gt; diff --git a/meta-skeleton/recipes-kernel/hello-mod/<a href=3D"http://=
hello-mod_0.1.bb" rel=3D"noreferrer" target=3D"_blank">hello-mod_0.1.bb</a>=
 b/meta-skeleton/recipes-kernel/hello-mod/<a href=3D"http://hello-mod_0.1.b=
b" rel=3D"noreferrer" target=3D"_blank">hello-mod_0.1.bb</a><br>
&gt; index a2fb212a68..f191b08be5 100644<br>
&gt; --- a/meta-skeleton/recipes-kernel/hello-mod/<a href=3D"http://hello-m=
od_0.1.bb" rel=3D"noreferrer" target=3D"_blank">hello-mod_0.1.bb</a><br>
&gt; +++ b/meta-skeleton/recipes-kernel/hello-mod/<a href=3D"http://hello-m=
od_0.1.bb" rel=3D"noreferrer" target=3D"_blank">hello-mod_0.1.bb</a><br>
&gt; @@ -3,16 +3,13 @@ DESCRIPTION =3D &quot;${SUMMARY}&quot;<br>
&gt;=C2=A0 LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D12f884d2ae1ff87c=
09e5b7ccc2c4ca7e&quot;<br>
&gt;<br>
&gt; -inherit module<br>
&gt; +inherit simple-module<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;file://Makefile \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://hello.c \<br>
&gt; +SRC_URI =3D &quot;file://hello.c \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://COPYING \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}&quot;<br>
&gt;<br>
&gt; -# The inherit of module.bbclass will automatically name module packag=
es with<br>
&gt; -# &quot;kernel-module-&quot; prefix as required by the oe-core build =
environment.<br>
&gt; -<br>
&gt; -RPROVIDES:${PN} +=3D &quot;kernel-module-hello&quot;<br>
&gt; +MODULE_SRC =3D &quot;hello&quot;<br>
&gt; +MODULE_SRC[hello] =3D &quot;&quot;<br>
&gt; \ No newline at end of file<br>
&gt; diff --git a/meta/classes-recipe/simple-module.bbclass b/meta/classes-=
recipe/simple-module.bbclass<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a837dec848<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/classes-recipe/simple-module.bbclass<br>
&gt; @@ -0,0 +1,116 @@<br>
&gt; +#<br>
&gt; +# Copyright OpenEmbedded Contributors<br>
&gt; +#<br>
&gt; +# SPDX-License-Identifier: MIT<br>
&gt; +#<br>
&gt; +<br>
&gt; +# Class to generate Makefile for Linux Kernel modules<br>
&gt; +#<br>
&gt; +# The aim of this class is to provide a way to gain time<br>
&gt; +# when creating recipes for Linux Kernel modules<br>
&gt; +#<br>
&gt; +# Required variable:<br>
&gt; +#=C2=A0 =C2=A0MODULE_SRC<br>
&gt; +#<br>
&gt; +# This variable itself counts on flags to know what files<br>
&gt; +# to use for .ko generation and their .o dependencies<br>
&gt; +#<br>
&gt; +# Usage:<br>
&gt; +#=C2=A0 =C2=A0If you have the following module structure:<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0|-- module.c<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0|-- dep1.c<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0`-- dep2.c<br>
&gt; +#=C2=A0 =C2=A0then you set:<br>
&gt; +#=C2=A0 =C2=A0MODULE_SRC[module] =3D &quot;dep1 dep2&quot;<br>
&gt; +#<br>
&gt; +# This will generate:<br>
&gt; +#=C2=A0 =C2=A0obj-m +=3D module.o<br>
&gt; +#=C2=A0 =C2=A0module-objs +=3D dep1.o dep2.o<br>
&gt; +#<br>
&gt; +# This class supports multiple modules as well<br>
&gt; +# each module will be added to obj-m and if it has dependencies<br>
&gt; +# an -objs variable will be created.<br>
&gt; +#<br>
&gt; +# A module can be enabled or disabled by adding or removing<br>
&gt; +# the module name from MODULE_SRC<br>
&gt; +#<br>
&gt; +# Limitations:<br>
&gt; +#=C2=A0 =C2=A0- All modules source files should exist in the same fol=
der level<br>
&gt; +<br>
&gt; +inherit module<br>
&gt; +<br>
&gt; +python do_prepare_makefile() {<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if not (d.getVar(&#39;MODULE_SRC&#39;) or &quot;&quot;)=
.split():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;You inherited easy-module b=
ut did not set drivers in MODULE_SRC&quot;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 kernel_modules =3D (d.getVar(&#39;MODULE_SRC&#39;) or &=
quot;&quot;).split()<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if kernel_modules:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_modules_flags =3D d.getVarFlags(&#=
39;MODULE_SRC&#39;) or []<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 objs_data =3D {}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for k_module in kernel_modules:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check if all enabled driv=
ers have corresponding flag<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not k_module in kernel_m=
odules_flags:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(f&qu=
ot;Driver {k_module} is enabled but does not have a flag entry&quot;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k_module_file =3D f&quot;{k=
_module}.c&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.isfile(k_mod=
ule_file):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(f&qu=
ot;Source file {k_module_file} is not found&quot;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k_module_o =3D f&quot;{k_mo=
dule}.o&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 objs_data[k_module] =3D []<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k_module_deps =3D (d.getVar=
Flag(&#39;MODULE_SRC&#39;, k_module) or &quot;&quot;).split()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for dep in k_module_deps:<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_file =3D =
f&quot;{dep}.c&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_o =3D f&q=
uot;{dep}.o&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.pat=
h.isfile(dep_file):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 bb.fatal(f&quot;Dependency file {dep_file} for the {k_module_file} is not =
found&quot;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 objs_data[k_m=
odule].append(dep_o)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(&#39;Makefile&#39;, &#39;w&#39;=
) as mf:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Main modules<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mf.write(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&quot;&quot;=
&quot;<br>
&gt; +# This Makefile is generated automatically by easy-module class<br>
&gt; +obj-m +=3D {&#39; &#39;.join([objm + &#39;.o&#39; for objm in objs_da=
ta.keys()])}<br>
&gt; +&quot;&quot;&quot;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Modules dependencies<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for k_module, deps in objs_=
data.items():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if deps:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 mf.write(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 f&quot;&quot;&quot;<br>
&gt; +{k_module}-objs +=3D {&#39; &#39;.join([dep for dep in deps])}<br>
&gt; +&quot;&quot;&quot;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Rest of Makefile<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mf.write(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&=
quot;<br>
&gt; +SRC :=3D $(shell pwd)<br>
&gt; +<br>
&gt; +all:<br>
&gt; +\t$(MAKE) -C $(KERNEL_SRC) M=3D$(SRC)<br>
&gt; +<br>
&gt; +modules_install:<br>
&gt; +\t$(MAKE) -C $(KERNEL_SRC) M=3D$(SRC) modules_install<br>
&gt; +<br>
&gt; +clean:<br>
&gt; +\trm -f *.o *~ core .depend .*.cmd *.ko *.mod.c<br>
&gt; +\trm -f Module.markers Module.symvers modules.order<br>
&gt; +\trm -rf .tmp_versions Modules.symvers<br>
&gt; +&quot;&quot;&quot;)<br>
&gt; +}<br>
&gt; +<br>
&gt; +RPROVIDES:${PN} +=3D &quot;kernel-module-${PN}&quot;<br>
&gt; +<br>
&gt; +export SRC =3D &quot;${B}&quot;<br>
&gt; +<br>
&gt; +do_prepare_makefile[docs] =3D &quot;Automate Makefile preparation for=
 simple Kernel modules&quot;<br>
&gt; +do_prepare_makefile[dirs] =3D &quot;${B}&quot;<br>
&gt; +addtask do_prepare_makefile before do_configure after do_patch<br>
&gt; \ No newline at end of file<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#189756): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/189756" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/189756</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10223304=
2/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/102233042/1050810</a><br>
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
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--0000000000009e7fd80608c70643--

