Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.2459.1617127221733221355
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Mar 2021 11:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JMpV7JIa;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id ap14so13012541ejc.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Mar 2021 11:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=trbSmzla8C88qcHT41kkOy4UFBgrw41LjCv8Q/uHQ1s=;
        b=JMpV7JIachWgzJKd324AQkRjW8KQZh5n5GFsH/a7VE6N74yrVnlcxp7D7HILxPCmPj
         f8Ly9zihy8iFhanZGiDjrMtRboCFznx2SNI1vwLwQ5WtMcU2UBOIjx5Aa4IuiPcGHPV0
         /mLGZwcuClKp7p6PHULnk0ZL5lD+15I2TIMK6H40o1H5TcR/J7hM/ErFDlJ/KNgwIxKe
         2Qo6UID/uzDT2hfopGuOOfrhk8xnxHaEcrevI9txb8rxpLfksvast1CxLW8cHaRSCon8
         UbKOs0xpDXD0ygd0y5SiIiKZqvxUQzeXGGKuxKlN0XZ97udQ1rHVkpGTRfr91A0GFCBM
         06Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=trbSmzla8C88qcHT41kkOy4UFBgrw41LjCv8Q/uHQ1s=;
        b=d0IPaL2CBaw9+tDZfrq5GkNEtn6YQs8UsTm9q+sJZDFLc6Ly9SaV4sEbZ8s0jlqVS5
         02R/JYmy/zC1chD6Pg/GLAc7wwVLvqA8dpC2XzZ5wq/gFLaKnczU33jdFHhO2HSHbI+J
         xhp+gfaDmNOJK1I8616YLA68xD7eHVI3Oa0TJmw1wTok/7+lOUKVeuCliEajcnlQtKn3
         I7MiqkCREpU4yT3r1zq4nmcCN6Wj0TZGdrV9mTfmKaRU/Gs5wdQhgMZzUuF1Pa6YgEUp
         flY45COVRjKcMUSXxRzL4ac81kL4/Ef0zefSaUwkx6RFSq2fhsVQLXm4F/oDnZKBBX66
         Cfag==
X-Gm-Message-State: AOAM533Ms/0oiyNj2TACBYA/iHD3CNSn8QZ04DemigiUifHbwFMz7Zo9
	sX2xhaP7vDro6mohid9HnYoNwixpoXg9BxTKNkQ=
X-Google-Smtp-Source: ABdhPJyShycDCv+yedwP7E1niWBgHYc1owhWY4SUxCL9MBmFC/94cAkR09XU7ixcVk3f6GGizAvDUk5C/EfDAmNDexI=
X-Received: by 2002:a17:906:5689:: with SMTP id am9mr33241095ejc.298.1617127220166;
 Tue, 30 Mar 2021 11:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210330172713.753008-1-yann@blade-group.com> <16712FEA8C3C17AC.15414@lists.openembedded.org>
In-Reply-To: <16712FEA8C3C17AC.15414@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 30 Mar 2021 14:00:08 -0400
Message-ID: <CADkTA4OvgSVMU983CoocHaejqrSH4ZAraV4McpjU_mGspp4LxA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto: log some kmeta information to assist in developing a bsp
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Yann Dirson <yann.dirson@blade-group.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 30, 2021 at 1:47 PM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
> On Tue, Mar 30, 2021 at 1:27 PM Yann Dirson <yann.dirson@blade-group.com> wrote:
> >
> > From: Yann Dirson <yann@blade-group.com>
> >
> > This is not quite enough for the lack of a BSP to stand out clearly to
> > an unsuspecting user's eyes, but at least this line in the logs should
> > help some of us to get a clue:
> >
> >   NOTE: Using kmeta BSP ''
>
> Sorry, but no on this.
>
> There are already logs that are kept in the build directories
> themselves. They can be further exposed via some of the existing debug
> knobs that I have, but this is just noise in the general logs.

I should clarify that I can come up with some different logging, after
the upcoming release is done. I have old patches that have a variety
of different debug/development modes and I can resurrect them.

I'll open a feature in bugzilla to track it.

Bruce

>
> Cheers,
>
> Bruce
>
> >
> > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > ---
> >  meta/classes/kernel-yocto.bbclass | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> > index 35587dd564..c6228ad0b8 100644
> > --- a/meta/classes/kernel-yocto.bbclass
> > +++ b/meta/classes/kernel-yocto.bbclass
> > @@ -234,6 +234,7 @@ do_kernel_metadata() {
> >                     KMETA_EXTERNAL_BSPS="t"
> >                 fi
> >         fi
> > +       bbnote "Using kmeta BSP '$bsp_definition'"
> >         meta_dir=$(kgit --meta)
> >
> >         KERNEL_FEATURES_FINAL=""
> > @@ -264,6 +265,7 @@ do_kernel_metadata() {
> >         if [ "$mode" = "config" ]; then
> >                 # run1: pull all the configuration fragments, no matter where they come from
> >                 elements="`echo -n ${bsp_definition} $sccs_defconfig ${sccs} ${patches} $KERNEL_FEATURES_FINAL`"
> > +               bbnote "config: kmeta configuration fragments: $elements"
> >                 if [ -n "${elements}" ]; then
> >                         echo "${bsp_definition}" > ${S}/${meta_dir}/bsp_definition
> >                         scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} $sccs_defconfig $bsp_definition $sccs $patches $KERNEL_FEATURES_FINAL
> > @@ -283,6 +285,7 @@ do_kernel_metadata() {
> >         if [ "$mode" = "patch" ]; then
> >                 # run2: only generate patches for elements that have been passed on the SRC_URI
> >                 elements="`echo -n ${sccs} ${patches} $KERNEL_FEATURES_FINAL`"
> > +               bbnote "patch: kmeta configuration fragments: $elements"
> >                 if [ -n "${elements}" ]; then
> >                         scc --force -o ${S}/${meta_dir}:patch --cmds patch ${includes} ${sccs} ${patches} $KERNEL_FEATURES_FINAL
> >                         if [ $? -ne 0 ]; then
> > --
> > 2.30.2
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
