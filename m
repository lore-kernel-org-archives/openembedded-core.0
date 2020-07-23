Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.8719.1595496853497162151
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 02:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SqjcO/Jg;
 spf=pass (domain: linaro.org, ip: 209.85.160.170, mailfrom: ryan.harkin@linaro.org)
Received: by mail-qt1-f170.google.com with SMTP id j10so3879603qtq.11
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2020 02:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XOy6zyp0FmK5VcBK5A+4e3DAYdRJljJBIsIuSbqh5BM=;
        b=SqjcO/JgDMHFuFeF3UuKHJfQ6T9570xIohiB12PCzhPubx/c2m/IIR/ZbGkhutHpYz
         Ts8/fJ2vx3+iMqHuoStu3fClxfS0IrBB3cFtl0/UnwX2ss5V97CfqcRCL2Z5lXd55ksu
         I25TlsyLBged0UtelxomLF+cefA5ojJ+QkDXAjIDt8X4vsYhpKuFhnH7CEyftNPfgT2V
         TlnQXqAOHvwRY28MxKHJXH/RZKv4gM85cPDXnW+oBtj/9lVqeuBToRGYyqdRIYzitZ2J
         9uITK5QjV7CfeRay1eFlSLGA6yRWzhWzwp1GSTKMrLEYa52+kCY75nWYFtb0Zqb+5x3a
         Kt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XOy6zyp0FmK5VcBK5A+4e3DAYdRJljJBIsIuSbqh5BM=;
        b=NUk1jmh25I4ZoV5sgwOcxUy248tt75A/JeGWJkNoTieQn/uqyj0o0ah7DsryXcVVoz
         x+v0NZxp7blUqJxVYUSZjSQ+w0aSOTzL0nS+NTs9PIsf1bPajyyR6X2JxtHO1sApaDBg
         XYuLJPrqwDg2ZauDJU4ex4Jr1Q8PLT3ie3v+zWtTaNCGsR+wuf3VoGhVegc2HtaI2g3a
         F6YKdjEeAJkdXgtzIbhip9ErtTw8GS4Jn6y+s0Q+VNSt3MQ+Fo8EGlIQ6ZyAVTn2nR7n
         jU2CwF9f2jR7yq3qWEfejNuj2r5TVC894MoIbvGhoKquq0hy3c6PoPHeYCuRTPJL989q
         lJrQ==
X-Gm-Message-State: AOAM532ZLM8T9OCPhBf+pdJ/YQ/ndsVSNcOPia3Y35LO/05eA3V0qAKC
	TbIEw3tWPyGgDjTCs+jJnWVqDzoWDvx0mD3TaQf4nA==
X-Google-Smtp-Source: ABdhPJyHTf8yjGx8cF/gjSYoCqd0z2e6VfyuV2H1iPDOG+NeoHfmreJGyB+FX6aM/WN2yXw7eT+yL1dd6GeLkjLjKoI=
X-Received: by 2002:aed:3b29:: with SMTP id p38mr3498564qte.350.1595496852428;
 Thu, 23 Jul 2020 02:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594050175.git.steve@sakoman.com> <7a8612998a367dd3a54344ae75983cb210db813d.1594050175.git.steve@sakoman.com>
 <CADkTA4Nyy_=+bXfiaXoHPzZHDsdHmfAX=tjzarrz3_y-Sw=3tw@mail.gmail.com>
 <CAOSpxdYXtK=5=QhGEGiJbx1_zzQp2LmnnHBfAbZ8uL1W01hTdg@mail.gmail.com>
 <CAD0U-h+oBmDGQ3DipQJNdTBYi6QjX0JgCWDAM5UTz4W8=pN6Gg@mail.gmail.com>
 <CADkTA4N8u0_VK6dhCX2t9Hyfgzif3sR6jCHOi9Y-OvZyHhOe+Q@mail.gmail.com> <CAOSpxdZ-OQZ--5q3Y5EdCW=Pv=HhncVy_osbDmcZYs13LeHnqQ@mail.gmail.com>
In-Reply-To: <CAOSpxdZ-OQZ--5q3Y5EdCW=Pv=HhncVy_osbDmcZYs13LeHnqQ@mail.gmail.com>
From: "Ryan Harkin" <ryan.harkin@linaro.org>
Date: Thu, 23 Jul 2020 10:34:01 +0100
Message-ID: <CAD0U-hK0upC8OpXCU_FsHt_46gmcfMKO32Y2zjVKf-d27dviFw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 04/25] kernel/yocto: ensure that defconfigs are processed first
To: Steve Sakoman <steve@sakoman.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000021300705ab188fb2"

--00000000000021300705ab188fb2
Content-Type: text/plain; charset="UTF-8"

Hi Bruce, Steve,

Thanks for your replies and the help.

On Thu, 23 Jul 2020 at 04:33, Steve Sakoman <steve@sakoman.com> wrote:

> On Wed, Jul 22, 2020 at 3:58 PM Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> >
> > On Wed, Jul 22, 2020 at 5:27 PM Ryan Harkin <ryan.harkin@linaro.org>
> wrote:
> > >
> > > Just an FYI, but when this was submitted, my imx7s-warp builds began
> to fail when building linux-fslc from meta-freescale /
> meta-freescale-3rdparty.
> > >
> > > I'm not sure why yet, I've only discovered the problem, but I thought
> I'd report it in case anyone else sees the problem.
> > >
> >
> > Someone already sent a dunfell backport request for a follow up patch to
> this.
> >
> > It went to the poky list, but I just replied to it and copied oe-core.
>
> Both patches are already in dunfell!
>
>
> https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=7ecc81baeacaa1149a4947791200e8819c3df677
>
> https://git.openembedded.org/openembedded-core/commit/?h=dunfell&id=11089e06bfb3d0defb52825ffba978d085385569


Yes, they are present. I guess I should have checked the error messages
more closely during git bisect rather than stopping as soon as the build
failed.

After Bruce's 7ecc81baea patch, I see this error:

ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_metadata: Could
not locate BSP definition for imx7s-warp/standard and no defconfig was
provided

Then, after 11089e06bf, I see the error I originally posted from my CI job,
but reproduced here from a local build:

ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_configme:
Execution of
'/data/warp7/workspace-dunfell/build-rpb/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_kernel_configme.31899'
failed with exit code 1:
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in:
/data/warp7/workspace-dunfell/build-rpb/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/log.do_kernel_configme.31899
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are
['/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/meta-arm/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-9.2.bb:do_populate_sysroot',
'virtual:native:/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_sysroot',
'/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.34.bb:do_populate_sysroot',
'virtual:native:/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/bison/bison_3.5.3.bb:do_populate_sysroot',
'/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot',
'/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot',
'virtual:native:/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/patch/patch_2.7.6.bb:
do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gcc-cross-arm',
'bc-native', 'binutils-cross-arm', 'bison-native', 'quilt-native',
'kern-tools-native', 'patch-native', 'readline-native', 'flex-native',
'automake-native', 'texinfo-dummy-native', 'autoconf-native',
'libtool-native', 'gnu-config-native', 'xz-native',
'gettext-minimal-native', 'libmpc-native', 'gmp-native', 'zlib-native',
'mpfr-native', 'linux-libc-headers', 'attr-native', 'ncurses-native',
'm4-native', 'pkgconfig-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_kernel_configme
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of
'/data/warp7/workspace-dunfell/build-rpb/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_kernel_configme.31899'
failed with exit code 1:
| WARNING: exit code 1 from a shell command.

I haven't yet looked at what these patches do, but I'm expecting there's
something to update in the linux-fslc recipe, unless there's another issue
in the defconfig patches.

Regards,
Ryan.







>
>
> Steve
>
> > > Here's a link to my failing build for reference:
> > >
> https://ci.linaro.org/job/warp7-openembedded-dunfell/67/DISTRO=rpb,MACHINE=imx7s-warp,label=docker-buster-amd64/consoleText
> > >
> > > And a snippet from the failure:
> > >
> > > ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_configme:
> Execution of
> '/srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_kernel_configme.7123'
> failed with exit code 1:
> > > WARNING: exit code 1 from a shell command.
> > >
> > > ERROR: Logfile of failure stored in:
> /srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/log.do_kernel_configme.7123
> > > Log data follows:
> > > | DEBUG: Executing python function extend_recipe_sysroot
> > > | NOTE: Direct dependencies are
> ['virtual:native:/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devtools/bison/bison_3.5.3.bb:do_populate_sysroot',
> '/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot',
> '/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.34.bb:do_populate_sysroot',
> '/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot',
> 'virtual:native:/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot',
> 'virtual:native:/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_sysroot',
> '/srv/oe/build/conf/../../layers/meta-arm/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-9.2.bb:
> do_populate_sysroot']
> > > | NOTE: Installed into sysroot: []
> > > | NOTE: Skipping as already exists in sysroot: ['bison-native',
> 'kern-tools-native', 'binutils-cross-arm', 'quilt-native', 'patch-native',
> 'bc-native', 'gcc-cross-arm', 'flex-native', 'texinfo-dummy-native',
> 'gnu-config-native', 'readline-native', 'libtool-native',
> 'automake-native', 'autoconf-native', 'xz-native', 'linux-libc-headers',
> 'gmp-native', 'libmpc-native', 'mpfr-native', 'zlib-native',
> 'gettext-minimal-native', 'attr-native', 'm4-native', 'ncurses-native',
> 'pkgconfig-native']
> > > | DEBUG: Python function extend_recipe_sysroot finished
> > > | DEBUG: Executing shell function do_kernel_configme
> > > | WARNING: exit code 1 from a shell command.
> > > | ERROR: Execution of
> '/srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_kernel_configme.7123'
> failed with exit code 1:
> > > | WARNING: exit code 1 from a shell command.
> > > |
> > > NOTE: recipe linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0: task
> do_kernel_configme: Failed
> > > ERROR: Task
> (/srv/oe/build/conf/../../layers/meta-freescale/recipes-kernel/linux/linux-fslc_5.4.bb:do_kernel_configme)
> failed with exit code '1'
> > >
> > >
> > >
> > > On Mon, 6 Jul 2020 at 17:38, Steve Sakoman <steve@sakoman.com> wrote:
> > >>
> > >> On Mon, Jul 6, 2020 at 6:29 AM Bruce Ashfield <
> bruce.ashfield@gmail.com> wrote:
> > >> >
> > >> > We have a fixup patch for this one in test right now, so we don't
> want
> > >> > this patch, without the follow up.
> > >> >
> > >> > But this is useful for dunfell, since it was an unexpected behaviour
> > >> > that needed to be fixed.
> > >>
> > >> Thanks, I'll drop this patch from the pull request and include it
> > >> along with the fixup patch in next week's patch set.
> > >>
> > >> Steve
> > >>
> > >> > On Mon, Jul 6, 2020 at 12:11 PM Steve Sakoman <steve@sakoman.com>
> wrote:
> > >> > >
> > >> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >> > >
> > >> > > It is uncommon that a BSP definition and a defconfig are used in
> > >> > > a single configuration. That being said, it is a valid way to
> > >> > > organize kernel configuration meta data.
> > >> > >
> > >> > > When a defconfig is used, either on the src_uri or from in
> > >> > > the kernel tree, it is normally expected that it is the baseline,
> > >> > > with all options applied on top of it.
> > >> > >
> > >> > > With this commit, we detect either type of defconfig and ensure
> > >> > > that it is used first, followed by the fragments in their
> > >> > > previous order. This allows existing configuration stacks to
> > >> > > remain the same, while ensuring that a defconfig combined stack
> > >> > > works as expected.
> > >> > >
> > >> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> >
> > >> > > (cherry picked from commit
> e6845327b69396d843a2f3c4c3ac9400ae9caedf)
> > >> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > >> > > ---
> > >> > >  meta/classes/kernel-yocto.bbclass | 33
> ++++++++++++++++++++-----------
> > >> > >  1 file changed, 21 insertions(+), 12 deletions(-)
> > >> > >
> > >> > > diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> > >> > > index 5bc627066e..41d8620e67 100644
> > >> > > --- a/meta/classes/kernel-yocto.bbclass
> > >> > > +++ b/meta/classes/kernel-yocto.bbclass
> > >> > > @@ -131,7 +131,7 @@ do_kernel_metadata() {
> > >> > >                         else
> > >> > >                                 cp -f
> ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
> > >> > >                         fi
> > >> > > -                       sccs="${WORKDIR}/defconfig"
> > >> > > +                       in_tree_defconfig="${WORKDIR}/defconfig"
> > >> > >                 else
> > >> > >                         bbfatal "A KBUILD_DEFCONFIG
> '${KBUILD_DEFCONFIG}' was specified, but not present in the source tree"
> > >> > >                 fi
> > >> > > @@ -153,14 +153,24 @@ do_kernel_metadata() {
> > >> > >         patches="${@" ".join(find_patches(d,''))}"
> > >> > >         feat_dirs="${@" ".join(find_kernel_feature_dirs(d))}"
> > >> > >
> > >> > > -       # a quick check to make sure we don't have duplicate
> defconfigs
> > >> > > -       # If there's a defconfig in the SRC_URI, did we also have
> one from
> > >> > > -       # the KBUILD_DEFCONFIG processing above ?
> > >> > > -       if [ -n "$sccs" ]; then
> > >> > > -           # we did have a defconfig from above. remove any that
> might be in the src_uri
> > >> > > -           sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '{
> if ($0!="defconfig") { print $0 } }' RS=' ')
> > >> > > +       # a quick check to make sure we don't have duplicate
> defconfigs If
> > >> > > +       # there's a defconfig in the SRC_URI, did we also have
> one from the
> > >> > > +       # KBUILD_DEFCONFIG processing above ?
> > >> > > +       src_uri_defconfig=$(echo $sccs_from_src_uri | awk '{ if
> ($0=="defconfig") { print $0 } }' RS=' ')
> > >> > > +       # drop and defconfig's from the src_uri variable, we
> captured it just above here if it existed
> > >> > > +       sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '{ if
> ($0!="defconfig") { print $0 } }' RS=' ')
> > >> > > +       if [ -n "$in_tree_defconfig" ]; then
> > >> > > +               sccs_defconfig=$in_tree_defconfig
> > >> > > +               if [ -n "$src_uri_defconfig" ]; then
> > >> > > +                       bbwarn "[NOTE]: defconfig was supplied
> both via KBUILD_DEFCONFIG and SRC_URI. Dropping SRC_URI defconfig"
> > >> > > +               fi
> > >> > > +       else
> > >> > > +               # if we didn't have an in-tree one, make our
> defconfig the one
> > >> > > +               # from the src_uri. Note: there may not have been
> one from the
> > >> > > +               # src_uri, so this can be an empty variable.
> > >> > > +               sccs_defconfig=$src_uri_defconfig
> > >> > >         fi
> > >> > > -       sccs="$sccs $sccs_from_src_uri"
> > >> > > +       sccs="$sccs_from_src_uri"
> > >> > >
> > >> > >         # check for feature directories/repos/branches that were
> part of the
> > >> > >         # SRC_URI. If they were supplied, we convert them into
> include directives
> > >> > > @@ -187,11 +197,10 @@ do_kernel_metadata() {
> > >> > >         # expand kernel features into their full path equivalents
> > >> > >         bsp_definition=$(spp ${includes} --find
> -DKMACHINE=${KMACHINE} -DKTYPE=${LINUX_KERNEL_TYPE})
> > >> > >         if [ -z "$bsp_definition" ]; then
> > >> > > -               echo "$sccs" | grep -q defconfig
> > >> > > -               if [ $? -ne 0 ]; then
> > >> > > +               if [ -z "$sccs_defconfig" ]; then
> > >> > >                         bbfatal_log "Could not locate BSP
> definition for ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconfig was
> provided"
> > >> > >                 fi
> > >> > > -
> > >> > > +       else
> > >> > >                 # if the bsp definition has "define
> KMETA_EXTERNAL_BSP t",
> > >> > >                 # then we need to set a flag that will instruct
> the next
> > >> > >                 # steps to use the BSP as both configuration and
> patches.
> > >> > > @@ -206,7 +215,7 @@ do_kernel_metadata() {
> > >> > >         elements="`echo -n ${bsp_definition} ${sccs} ${patches}
> ${KERNEL_FEATURES}`"
> > >> > >         if [ -n "${elements}" ]; then
> > >> > >                 echo "${bsp_definition}" >
> ${S}/${meta_dir}/bsp_definition
> > >> > > -               scc --force -o ${S}/${meta_dir}:cfg,merge,meta
> ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
> > >> > > +               scc --force -o ${S}/${meta_dir}:cfg,merge,meta
> ${includes} $sccs_defconfig $bsp_definition $sccs $patches
> ${KERNEL_FEATURES}
> > >> > >                 if [ $? -ne 0 ]; then
> > >> > >                         bbfatal_log "Could not generate
> configuration queue for ${KMACHINE}."
> > >> > >                 fi
> > >> > > --
> > >> > > 2.17.1
> > >> > >
> > >> > >
> > >> >
> > >> >
> > >> >
> > >> > --
> > >> > - Thou shalt not follow the NULL pointer, for chaos and madness
> await
> > >> > thee at its end
> > >> > - "Use the force Harry" - Gandalf, Star Trek II
> > >> 
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>

--00000000000021300705ab188fb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Bruce, Steve,</div><div><br></div><div>Thanks for =
your replies and the help.</div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Thu, 23 Jul 2020 at 04:33, Steve Sakoman &lt;<=
a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Jul 22, 2020 a=
t 3:58 PM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" ta=
rget=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, Jul 22, 2020 at 5:27 PM Ryan Harkin &lt;<a href=3D"mailto:rya=
n.harkin@linaro.org" target=3D"_blank">ryan.harkin@linaro.org</a>&gt; wrote=
:<br>
&gt; &gt;<br>
&gt; &gt; Just an FYI, but when this was submitted, my imx7s-warp builds b=
egan to fail when building linux-fslc from meta-freescale / meta-freescale-=
3rdparty.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m not sure why yet, I&#39;ve only discovered the problem, =
but I thought I&#39;d report it in case anyone else sees the problem.<br>
&gt; &gt;<br>
&gt;<br>
&gt; Someone already sent a dunfell backport request for a follow up patch=
 to this.<br>
&gt;<br>
&gt; It went to the poky list, but I just replied to it and copied oe-core=
.<br>
<br>
Both patches are already in dunfell!<br>
<br>
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?h=3Ddunf=
ell&amp;id=3D7ecc81baeacaa1149a4947791200e8819c3df677" rel=3D"noreferrer" t=
arget=3D"_blank">https://git.openembedded.org/openembedded-core/commit/?h=
=3Ddunfell&amp;id=3D7ecc81baeacaa1149a4947791200e8819c3df677</a><br>
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?h=3Ddunf=
ell&amp;id=3D11089e06bfb3d0defb52825ffba978d085385569" rel=3D"noreferrer" t=
arget=3D"_blank">https://git.openembedded.org/openembedded-core/commit/?h=
=3Ddunfell&amp;id=3D11089e06bfb3d0defb52825ffba978d085385569</a></blockquo=
te><div><br></div><div>Yes, they are present. I guess I should have checked=
 the error messages more closely during git bisect rather than stopping as =
soon as the build failed.</div><div><br></div><div>After Bruce&#39;s 7ecc81=
baea patch, I see this error:</div><div><br></div>ERROR: linux-fslc-5.4.46+=
gitAUTOINC+38d6c3525e-r0 do_kernel_metadata: Could not locate BSP definitio=
n for imx7s-warp/standard and no defconfig was provided<br><div><br></div><=
div>Then, after=C2=A011089e06bf, I see the error I originally posted from m=
y=C2=A0CI job, but reproduced here from a local build:</div><div><br></div>=
<div>ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_configme: =
Execution of &#39;/data/warp7/workspace-dunfell/build-rpb/tmp-rpb-glibc/wor=
k/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r=
0/temp/run.do_kernel_configme.31899&#39; failed with exit code 1:<br>WARNIN=
G: exit code 1 from a shell command.<br><br>ERROR: Logfile of failure store=
d in: /data/warp7/workspace-dunfell/build-rpb/tmp-rpb-glibc/work/imx7s_warp=
-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/log.d=
o_kernel_configme.31899<br>Log data follows:<br>| DEBUG: Executing python f=
unction extend_recipe_sysroot<br>| NOTE: Direct dependencies are [&#39;/dat=
a/warp7/workspace-dunfell/build-rpb/conf/../../layers/meta-arm/meta-arm-too=
lchain/recipes-devtools/gcc/gcc-cross_arm-9.2.bb:do_populate_sysroot&#39;, =
&#39;virtual:native:/data/warp7/workspace-dunfell/build-rpb/conf/../../laye=
rs/openembedded-core/meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_sysr=
oot&#39;, &#39;/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/op=
enembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.34.bb:do_po=
pulate_sysroot&#39;, &#39;virtual:native:/data/warp7/workspace-dunfell/buil=
d-rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/bison/bison=
_3.5.3.bb:do_populate_sysroot&#39;, &#39;/data/warp7/workspace-dunfell/buil=
d-rpb/conf/../../layers/openembedded-core/meta/recipes-devtools/quilt/quilt=
-native_0.66.bb:do_populate_sysroot&#39;, &#39;/data/warp7/workspace-dunfel=
l/build-rpb/conf/../../layers/openembedded-core/meta/recipes-kernel/kern-to=
ols/kern-tools-native_git.bb:do_populate_sysroot&#39;, &#39;virtual:native:=
/data/warp7/workspace-dunfell/build-rpb/conf/../../layers/openembedded-core=
/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot&#39;]<br>| =
NOTE: Installed into sysroot: []<br>| NOTE: Skipping as already exists in s=
ysroot: [&#39;gcc-cross-arm&#39;, &#39;bc-native&#39;, &#39;binutils-cross-=
arm&#39;, &#39;bison-native&#39;, &#39;quilt-native&#39;, &#39;kern-tools-n=
ative&#39;, &#39;patch-native&#39;, &#39;readline-native&#39;, &#39;flex-na=
tive&#39;, &#39;automake-native&#39;, &#39;texinfo-dummy-native&#39;, &#39;=
autoconf-native&#39;, &#39;libtool-native&#39;, &#39;gnu-config-native&#39;=
, &#39;xz-native&#39;, &#39;gettext-minimal-native&#39;, &#39;libmpc-native=
&#39;, &#39;gmp-native&#39;, &#39;zlib-native&#39;, &#39;mpfr-native&#39;, =
&#39;linux-libc-headers&#39;, &#39;attr-native&#39;, &#39;ncurses-native&#3=
9;, &#39;m4-native&#39;, &#39;pkgconfig-native&#39;]<br>| DEBUG: Python fun=
ction extend_recipe_sysroot finished<br>| DEBUG: Executing shell function d=
o_kernel_configme<br>| WARNING: exit code 1 from a shell command.<br>| ERRO=
R: Execution of &#39;/data/warp7/workspace-dunfell/build-rpb/tmp-rpb-glibc/=
work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525=
e-r0/temp/run.do_kernel_configme.31899&#39; failed with exit code 1:<br>| W=
ARNING: exit code 1 from a shell command.<br></div><div><br></div><div>I ha=
ven&#39;t yet looked at what these patches do, but I&#39;m expecting there&=
#39;s something to update in the linux-fslc recipe, unless there&#39;s anot=
her issue in the defconfig patches.</div><div><br></div><div>Regards,</div>=
<div>Ryan.</div><div><br></div><div><br></div><div><br></div><div><br></div=
><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><br>
<br>
Steve<br>
<br>
&gt; &gt; Here&#39;s a link to my failing build for reference:<br>
&gt; &gt; <a href=3D"https://ci.linaro.org/job/warp7-openembedded-dunfell/=
67/DISTRO=3Drpb,MACHINE=3Dimx7s-warp,label=3Ddocker-buster-amd64/consoleTex=
t" rel=3D"noreferrer" target=3D"_blank">https://ci.linaro.org/job/warp7-ope=
nembedded-dunfell/67/DISTRO=3Drpb,MACHINE=3Dimx7s-warp,label=3Ddocker-buste=
r-amd64/consoleText</a><br>
&gt; &gt;<br>
&gt; &gt; And a snippet from the failure:<br>
&gt; &gt;<br>
&gt; &gt; ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_conf=
igme: Execution of &#39;/srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-linaro-=
linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_kernel=
_configme.7123&#39; failed with exit code 1:<br>
&gt; &gt; WARNING: exit code 1 from a shell command.<br>
&gt; &gt;<br>
&gt; &gt; ERROR: Logfile of failure stored in: /srv/oe/build/tmp-rpb-glibc=
/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c352=
5e-r0/temp/log.do_kernel_configme.7123<br>
&gt; &gt; Log data follows:<br>
&gt; &gt; | DEBUG: Executing python function extend_recipe_sysroot<br>
&gt; &gt; | NOTE: Direct dependencies are [&#39;virtual:native:/srv/oe/bui=
ld/conf/../../layers/openembedded-core/meta/recipes-devtools/bison/bison_3.=
5.3.bb:do_populate_sysroot&#39;, &#39;/srv/oe/build/conf/../../layers/opene=
mbedded-core/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_pop=
ulate_sysroot&#39;, &#39;/srv/oe/build/conf/../../layers/openembedded-core/=
meta/recipes-devtools/binutils/binutils-cross_2.34.bb:do_populate_sysroot&#=
39;, &#39;/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-de=
vtools/quilt/quilt-native_0.66.bb:do_populate_sysroot&#39;, &#39;virtual:na=
tive:/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devtool=
s/patch/patch_2.7.6.bb:do_populate_sysroot&#39;, &#39;virtual:native:/srv/o=
e/build/conf/../../layers/openembedded-core/meta/recipes-extended/bc/bc_1.0=
7.1.bb:do_populate_sysroot&#39;, &#39;/srv/oe/build/conf/../../layers/meta-=
arm/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-9.2.bb:do_populat=
e_sysroot&#39;]<br>
&gt; &gt; | NOTE: Installed into sysroot: []<br>
&gt; &gt; | NOTE: Skipping as already exists in sysroot: [&#39;bison-nativ=
e&#39;, &#39;kern-tools-native&#39;, &#39;binutils-cross-arm&#39;, &#39;qui=
lt-native&#39;, &#39;patch-native&#39;, &#39;bc-native&#39;, &#39;gcc-cross=
-arm&#39;, &#39;flex-native&#39;, &#39;texinfo-dummy-native&#39;, &#39;gnu-=
config-native&#39;, &#39;readline-native&#39;, &#39;libtool-native&#39;, &#=
39;automake-native&#39;, &#39;autoconf-native&#39;, &#39;xz-native&#39;, &#=
39;linux-libc-headers&#39;, &#39;gmp-native&#39;, &#39;libmpc-native&#39;, =
&#39;mpfr-native&#39;, &#39;zlib-native&#39;, &#39;gettext-minimal-native&#=
39;, &#39;attr-native&#39;, &#39;m4-native&#39;, &#39;ncurses-native&#39;, =
&#39;pkgconfig-native&#39;]<br>
&gt; &gt; | DEBUG: Python function extend_recipe_sysroot finished<br>
&gt; &gt; | DEBUG: Executing shell function do_kernel_configme<br>
&gt; &gt; | WARNING: exit code 1 from a shell command.<br>
&gt; &gt; | ERROR: Execution of &#39;/srv/oe/build/tmp-rpb-glibc/work/imx7=
s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp=
/run.do_kernel_configme.7123&#39; failed with exit code 1:<br>
&gt; &gt; | WARNING: exit code 1 from a shell command.<br>
&gt; &gt; |<br>
&gt; &gt; NOTE: recipe linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0: task do=
_kernel_configme: Failed<br>
&gt; &gt; ERROR: Task (/srv/oe/build/conf/../../layers/meta-freescale/reci=
pes-kernel/linux/linux-fslc_5.4.bb:do_kernel_configme) failed with exit cod=
e &#39;1&#39;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Mon, 6 Jul 2020 at 17:38, Steve Sakoman &lt;<a href=3D"mailto=
:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Mon, Jul 6, 2020 at 6:29 AM Bruce Ashfield &lt;<a href=3D=
"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.co=
m</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; We have a fixup patch for this one in test right now, s=
o we don&#39;t want<br>
&gt; &gt;&gt; &gt; this patch, without the follow up.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; But this is useful for dunfell, since it was an unexpec=
ted behaviour<br>
&gt; &gt;&gt; &gt; that needed to be fixed.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Thanks, I&#39;ll drop this patch from the pull request and i=
nclude it<br>
&gt; &gt;&gt; along with the fixup patch in next week&#39;s patch set.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Steve<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; On Mon, Jul 6, 2020 at 12:11 PM Steve Sakoman &lt;<a hr=
ef=3D"mailto:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt;=
 wrote:<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.a=
shfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; It is uncommon that a BSP definition and a defconf=
ig are used in<br>
&gt; &gt;&gt; &gt; &gt; a single configuration. That being said, it is a v=
alid way to<br>
&gt; &gt;&gt; &gt; &gt; organize kernel configuration meta data.<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; When a defconfig is used, either on the src_uri or=
 from in<br>
&gt; &gt;&gt; &gt; &gt; the kernel tree, it is normally expected that it i=
s the baseline,<br>
&gt; &gt;&gt; &gt; &gt; with all options applied on top of it.<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; With this commit, we detect either type of defconf=
ig and ensure<br>
&gt; &gt;&gt; &gt; &gt; that it is used first, followed by the fragments i=
n their<br>
&gt; &gt;&gt; &gt; &gt; previous order. This allows existing configuration=
 stacks to<br>
&gt; &gt;&gt; &gt; &gt; remain the same, while ensuring that a defconfig c=
ombined stack<br>
&gt; &gt;&gt; &gt; &gt; works as expected.<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailt=
o:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&=
gt;<br>
&gt; &gt;&gt; &gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailt=
o:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linu=
xfoundation.org</a>&gt;<br>
&gt; &gt;&gt; &gt; &gt; (cherry picked from commit e6845327b69396d843a2f3c=
4c3ac9400ae9caedf)<br>
&gt; &gt;&gt; &gt; &gt; Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto=
:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt;<br>
&gt; &gt;&gt; &gt; &gt; ---<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 meta/classes/kernel-yocto.bbclass | 33 +++++=
+++++++++++++++-----------<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 1 file changed, 21 insertions(+), 12 deletio=
ns(-)<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; diff --git a/meta/classes/kernel-yocto.bbclass b/m=
eta/classes/kernel-yocto.bbclass<br>
&gt; &gt;&gt; &gt; &gt; index 5bc627066e..41d8620e67 100644<br>
&gt; &gt;&gt; &gt; &gt; --- a/meta/classes/kernel-yocto.bbclass<br>
&gt; &gt;&gt; &gt; &gt; +++ b/meta/classes/kernel-yocto.bbclass<br>
&gt; &gt;&gt; &gt; &gt; @@ -131,7 +131,7 @@ do_kernel_metadata() {<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -f=
 ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sccs=3D&quot;${WORKDIR}/defconfig&quot;<=
br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in_tree_defconfig=3D&quot;${WORKDIR}/def=
config&quot;<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0else<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal &quot;A KBUILD_DEFCONFIG =
&#39;${KBUILD_DEFCONFIG}&#39; was specified, but not present in the source =
tree&quot;<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0fi<br>
&gt; &gt;&gt; &gt; &gt; @@ -153,14 +153,24 @@ do_kernel_metadata() {<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patches=3D&quot;$=
{@&quot; &quot;.join(find_patches(d,&#39;&#39;))}&quot;<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0feat_dirs=3D&quot=
;${@&quot; &quot;.join(find_kernel_feature_dirs(d))}&quot;<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# a quick check to mak=
e sure we don&#39;t have duplicate defconfigs<br>
&gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# If there&#39;s a def=
config in the SRC_URI, did we also have one from<br>
&gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# the KBUILD_DEFCONFIG=
 processing above ?<br>
&gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;$sccs&qu=
ot; ]; then<br>
&gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# we did=
 have a defconfig from above. remove any that might be in the src_uri<br>
&gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sccs_fro=
m_src_uri=3D$(echo $sccs_from_src_uri | awk &#39;{ if ($0!=3D&quot;defconfi=
g&quot;) { print $0 } }&#39; RS=3D&#39; &#39;)<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# a quick check to mak=
e sure we don&#39;t have duplicate defconfigs If<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# there&#39;s a defcon=
fig in the SRC_URI, did we also have one from the<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# KBUILD_DEFCONFIG pro=
cessing above ?<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0src_uri_defconfig=3D$(=
echo $sccs_from_src_uri | awk &#39;{ if ($0=3D=3D&quot;defconfig&quot;) { p=
rint $0 } }&#39; RS=3D&#39; &#39;)<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# drop and defconfig&#=
39;s from the src_uri variable, we captured it just above here if it existe=
d<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sccs_from_src_uri=3D$(=
echo $sccs_from_src_uri | awk &#39;{ if ($0!=3D&quot;defconfig&quot;) { pri=
nt $0 } }&#39; RS=3D&#39; &#39;)<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;$in_tree=
_defconfig&quot; ]; then<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0sccs_defconfig=3D$in_tree_defconfig<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0if [ -n &quot;$src_uri_defconfig&quot; ]; then<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;[NOTE]: defconfig was suppl=
ied both via KBUILD_DEFCONFIG and SRC_URI. Dropping SRC_URI defconfig&quot;=
<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0fi<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0# if we didn&#39;t have an in-tree one, make our defconfig the one<b=
r>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0# from the src_uri. Note: there may not have been one from the<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0# src_uri, so this can be an empty variable.<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0sccs_defconfig=3D$src_uri_defconfig<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sccs=3D&quot;$sccs $sc=
cs_from_src_uri&quot;<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sccs=3D&quot;$sccs_fro=
m_src_uri&quot;<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# check for featu=
re directories/repos/branches that were part of the<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# SRC_URI. If the=
y were supplied, we convert them into include directives<br>
&gt; &gt;&gt; &gt; &gt; @@ -187,11 +197,10 @@ do_kernel_metadata() {<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# expand kernel f=
eatures into their full path equivalents<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bsp_definition=3D=
$(spp ${includes} --find -DKMACHINE=3D${KMACHINE} -DKTYPE=3D${LINUX_KERNEL_=
TYPE})<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$bs=
p_definition&quot; ]; then<br>
&gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0echo &quot;$sccs&quot; | grep -q defconfig<br>
&gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0if [ $? -ne 0 ]; then<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0if [ -z &quot;$sccs_defconfig&quot; ]; then<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal_log &quot;Could not locat=
e BSP definition for ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconfig was =
provided&quot;<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0fi<br>
&gt; &gt;&gt; &gt; &gt; -<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0# if the bsp definition has &quot;define KMETA_EXTERNAL_BSP t=
&quot;,<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0# then we need to set a flag that will instruct the next<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0# steps to use the BSP as both configuration and patches.<br>
&gt; &gt;&gt; &gt; &gt; @@ -206,7 +215,7 @@ do_kernel_metadata() {<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elements=3D&quot;=
`echo -n ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}`&quot;<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;${e=
lements}&quot; ]; then<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0echo &quot;${bsp_definition}&quot; &gt; ${S}/${meta_dir}/bsp_=
definition<br>
&gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} ${bsp_def=
inition} ${sccs} ${patches} ${KERNEL_FEATURES}<br>
&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} $sccs_def=
config $bsp_definition $sccs $patches ${KERNEL_FEATURES}<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if [ $? -ne 0 ]; then<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal_log &quot;Could not gener=
ate configuration queue for ${KMACHINE}.&quot;<br>
&gt; &gt;&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0fi<br>
&gt; &gt;&gt; &gt; &gt; --<br>
&gt; &gt;&gt; &gt; &gt; 2.17.1<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; --<br>
&gt; &gt;&gt; &gt; - Thou shalt not follow the NULL pointer, for chaos and=
 madness await<br>
&gt; &gt;&gt; &gt; thee at its end<br>
&gt; &gt;&gt; &gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek =
II<br>
&gt; &gt;&gt; <br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await=
<br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div></div>

--00000000000021300705ab188fb2--
