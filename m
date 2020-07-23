Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.5109.1595475211146293421
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 20:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=m8YPdty4;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.67, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f67.google.com with SMTP id bm28so3457937edb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2020 20:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8pFbEehqk7S/nXxL94XyBeQKL10MgSYhRoGZ68W7SYw=;
        b=m8YPdty4Q9nmDqeutTQrlNFIC1wOhler54/dPNxpotKDYyRibGCVhgkyn6Ir0b3AY0
         5s0jTa3QVB8sqRZudRw16n/4dANSjKbScfMgGPVhS/2Tb0IV2AcwK+t+ETvBdkfgEq7b
         kiK3BfRDnrNrUWNIAlV+rKtZkPSdJYV8tIEsJNeJAzyEbxBeISv79n8FhrytYjpn0RTF
         h0YvoWie8mKolQOBMhJJBuYEUVzoUs3PLRK7DfejrCfHpGvUy5yQl7iI2cFIL3cAJqej
         g9ko3G19RlPxw7/i+gSj5UvoYbx+2xKWzpi0dr5GGd1VSuFN+7aCEl4Soo78N/FONfwK
         3IBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8pFbEehqk7S/nXxL94XyBeQKL10MgSYhRoGZ68W7SYw=;
        b=p2+q0CYfun9qPtDoMx+25bATz4AKa4839HUHacyI9L5tv3OJ7InQQzfhWPynAfrfRq
         cf8UreyMcj+dwG8ygVVYG8C+ZOLZmgFO7F2l9x7WJmowv02lsUED8ez7m/n6ZNRjsO9f
         Nrfcjnd03SBBxx85sNV9XjKzQOWSyEMAq+3R5PT5bSsCmBIx2P2+tx33H/r0MBFJiih3
         1TkPWDa6o3fW6lI2F0ad6IviNmqHqGIk4/wKtamhO/05SvVnBvyqC7HxLxAsvGdx6bem
         vtjg6YGX0lnbugc+P0XQeUiGqNuqbdCxBHRcdOpXyrH4hfTh+IKFOlO1S7Fz4F7GqIj1
         TsPg==
X-Gm-Message-State: AOAM531fEFwBxeLl9ZXx0W8CcfxBDLDlGvw7RsvAwUmwKwFUPcp7p2zE
	/vWoKQp+WfXRDx/jFCBWhyNhJyMprkBRc+3nzXAYTQ==
X-Google-Smtp-Source: ABdhPJzqFRzWbBQrGByhOy++dfhfC7wPRBKTW2zd04tcxAlOoZYX+tcjMjM7bCEuwSsDgGkRlYvmp2woAu0hc8Bm2zg=
X-Received: by 2002:a50:bb48:: with SMTP id y66mr2214095ede.147.1595475209345;
 Wed, 22 Jul 2020 20:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594050175.git.steve@sakoman.com> <7a8612998a367dd3a54344ae75983cb210db813d.1594050175.git.steve@sakoman.com>
 <CADkTA4Nyy_=+bXfiaXoHPzZHDsdHmfAX=tjzarrz3_y-Sw=3tw@mail.gmail.com>
 <CAOSpxdYXtK=5=QhGEGiJbx1_zzQp2LmnnHBfAbZ8uL1W01hTdg@mail.gmail.com>
 <CAD0U-h+oBmDGQ3DipQJNdTBYi6QjX0JgCWDAM5UTz4W8=pN6Gg@mail.gmail.com> <CADkTA4N8u0_VK6dhCX2t9Hyfgzif3sR6jCHOi9Y-OvZyHhOe+Q@mail.gmail.com>
In-Reply-To: <CADkTA4N8u0_VK6dhCX2t9Hyfgzif3sR6jCHOi9Y-OvZyHhOe+Q@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 22 Jul 2020 17:33:18 -1000
Message-ID: <CAOSpxdZ-OQZ--5q3Y5EdCW=Pv=HhncVy_osbDmcZYs13LeHnqQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell 04/25] kernel/yocto: ensure that defconfigs are processed first
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Ryan Harkin <ryan.harkin@linaro.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 3:58 PM Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
>
> On Wed, Jul 22, 2020 at 5:27 PM Ryan Harkin <ryan.harkin@linaro.org> wro=
te:
> >
> > Just an FYI, but when this was submitted, my imx7s-warp builds began t=
o fail when building linux-fslc from meta-freescale / meta-freescale-3rdpar=
ty.
> >
> > I'm not sure why yet, I've only discovered the problem, but I thought =
I'd report it in case anyone else sees the problem.
> >
>
> Someone already sent a dunfell backport request for a follow up patch to=
 this.
>
> It went to the poky list, but I just replied to it and copied oe-core.

Both patches are already in dunfell!

https://git.openembedded.org/openembedded-core/commit/?h=3Ddunfell&id=3D7e=
cc81baeacaa1149a4947791200e8819c3df677
https://git.openembedded.org/openembedded-core/commit/?h=3Ddunfell&id=3D11=
089e06bfb3d0defb52825ffba978d085385569

Steve

> > Here's a link to my failing build for reference:
> > https://ci.linaro.org/job/warp7-openembedded-dunfell/67/DISTRO=3Drpb,M=
ACHINE=3Dimx7s-warp,label=3Ddocker-buster-amd64/consoleText
> >
> > And a snippet from the failure:
> >
> > ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_configme: =
Execution of '/srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnue=
abi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_kernel_configme.=
7123' failed with exit code 1:
> > WARNING: exit code 1 from a shell command.
> >
> > ERROR: Logfile of failure stored in: /srv/oe/build/tmp-rpb-glibc/work/=
imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/=
temp/log.do_kernel_configme.7123
> > Log data follows:
> > | DEBUG: Executing python function extend_recipe_sysroot
> > | NOTE: Direct dependencies are ['virtual:native:/srv/oe/build/conf/..=
/../layers/openembedded-core/meta/recipes-devtools/bison/bison_3.5.3.bb:do_=
populate_sysroot', '/srv/oe/build/conf/../../layers/openembedded-core/meta/=
recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot', '/=
srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devtools/binu=
tils/binutils-cross_2.34.bb:do_populate_sysroot', '/srv/oe/build/conf/../..=
/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.66.bb:=
do_populate_sysroot', 'virtual:native:/srv/oe/build/conf/../../layers/opene=
mbedded-core/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot=
', 'virtual:native:/srv/oe/build/conf/../../layers/openembedded-core/meta/r=
ecipes-extended/bc/bc_1.07.1.bb:do_populate_sysroot', '/srv/oe/build/conf/.=
./../layers/meta-arm/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-=
9.2.bb:do_populate_sysroot']
> > | NOTE: Installed into sysroot: []
> > | NOTE: Skipping as already exists in sysroot: ['bison-native', 'kern-=
tools-native', 'binutils-cross-arm', 'quilt-native', 'patch-native', 'bc-na=
tive', 'gcc-cross-arm', 'flex-native', 'texinfo-dummy-native', 'gnu-config-=
native', 'readline-native', 'libtool-native', 'automake-native', 'autoconf-=
native', 'xz-native', 'linux-libc-headers', 'gmp-native', 'libmpc-native', =
'mpfr-native', 'zlib-native', 'gettext-minimal-native', 'attr-native', 'm4-=
native', 'ncurses-native', 'pkgconfig-native']
> > | DEBUG: Python function extend_recipe_sysroot finished
> > | DEBUG: Executing shell function do_kernel_configme
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Execution of '/srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-lin=
aro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_ke=
rnel_configme.7123' failed with exit code 1:
> > | WARNING: exit code 1 from a shell command.
> > |
> > NOTE: recipe linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0: task do_kerne=
l_configme: Failed
> > ERROR: Task (/srv/oe/build/conf/../../layers/meta-freescale/recipes-ke=
rnel/linux/linux-fslc_5.4.bb:do_kernel_configme) failed with exit code '1'
> >
> >
> >
> > On Mon, 6 Jul 2020 at 17:38, Steve Sakoman <steve@sakoman.com> wrote:
> >>
> >> On Mon, Jul 6, 2020 at 6:29 AM Bruce Ashfield <bruce.ashfield@gmail.c=
om> wrote:
> >> >
> >> > We have a fixup patch for this one in test right now, so we don't w=
ant
> >> > this patch, without the follow up.
> >> >
> >> > But this is useful for dunfell, since it was an unexpected behaviou=
r
> >> > that needed to be fixed.
> >>
> >> Thanks, I'll drop this patch from the pull request and include it
> >> along with the fixup patch in next week's patch set.
> >>
> >> Steve
> >>
> >> > On Mon, Jul 6, 2020 at 12:11 PM Steve Sakoman <steve@sakoman.com> w=
rote:
> >> > >
> >> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> > >
> >> > > It is uncommon that a BSP definition and a defconfig are used in
> >> > > a single configuration. That being said, it is a valid way to
> >> > > organize kernel configuration meta data.
> >> > >
> >> > > When a defconfig is used, either on the src_uri or from in
> >> > > the kernel tree, it is normally expected that it is the baseline,
> >> > > with all options applied on top of it.
> >> > >
> >> > > With this commit, we detect either type of defconfig and ensure
> >> > > that it is used first, followed by the fragments in their
> >> > > previous order. This allows existing configuration stacks to
> >> > > remain the same, while ensuring that a defconfig combined stack
> >> > > works as expected.
> >> > >
> >> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org=
>
> >> > > (cherry picked from commit e6845327b69396d843a2f3c4c3ac9400ae9cae=
df)
> >> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> >> > > ---
> >> > >  meta/classes/kernel-yocto.bbclass | 33 ++++++++++++++++++++-----=
------
> >> > >  1 file changed, 21 insertions(+), 12 deletions(-)
> >> > >
> >> > > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/ker=
nel-yocto.bbclass
> >> > > index 5bc627066e..41d8620e67 100644
> >> > > --- a/meta/classes/kernel-yocto.bbclass
> >> > > +++ b/meta/classes/kernel-yocto.bbclass
> >> > > @@ -131,7 +131,7 @@ do_kernel_metadata() {
> >> > >                         else
> >> > >                                 cp -f ${S}/arch/${ARCH}/configs/$=
{KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
> >> > >                         fi
> >> > > -                       sccs=3D"${WORKDIR}/defconfig"
> >> > > +                       in_tree_defconfig=3D"${WORKDIR}/defconfig=
"
> >> > >                 else
> >> > >                         bbfatal "A KBUILD_DEFCONFIG '${KBUILD_DEF=
CONFIG}' was specified, but not present in the source tree"
> >> > >                 fi
> >> > > @@ -153,14 +153,24 @@ do_kernel_metadata() {
> >> > >         patches=3D"${@" ".join(find_patches(d,''))}"
> >> > >         feat_dirs=3D"${@" ".join(find_kernel_feature_dirs(d))}"
> >> > >
> >> > > -       # a quick check to make sure we don't have duplicate defc=
onfigs
> >> > > -       # If there's a defconfig in the SRC_URI, did we also have=
 one from
> >> > > -       # the KBUILD_DEFCONFIG processing above ?
> >> > > -       if [ -n "$sccs" ]; then
> >> > > -           # we did have a defconfig from above. remove any that=
 might be in the src_uri
> >> > > -           sccs_from_src_uri=3D$(echo $sccs_from_src_uri | awk '=
{ if ($0!=3D"defconfig") { print $0 } }' RS=3D' ')
> >> > > +       # a quick check to make sure we don't have duplicate defc=
onfigs If
> >> > > +       # there's a defconfig in the SRC_URI, did we also have on=
e from the
> >> > > +       # KBUILD_DEFCONFIG processing above ?
> >> > > +       src_uri_defconfig=3D$(echo $sccs_from_src_uri | awk '{ if=
 ($0=3D=3D"defconfig") { print $0 } }' RS=3D' ')
> >> > > +       # drop and defconfig's from the src_uri variable, we capt=
ured it just above here if it existed
> >> > > +       sccs_from_src_uri=3D$(echo $sccs_from_src_uri | awk '{ if=
 ($0!=3D"defconfig") { print $0 } }' RS=3D' ')
> >> > > +       if [ -n "$in_tree_defconfig" ]; then
> >> > > +               sccs_defconfig=3D$in_tree_defconfig
> >> > > +               if [ -n "$src_uri_defconfig" ]; then
> >> > > +                       bbwarn "[NOTE]: defconfig was supplied bo=
th via KBUILD_DEFCONFIG and SRC_URI. Dropping SRC_URI defconfig"
> >> > > +               fi
> >> > > +       else
> >> > > +               # if we didn't have an in-tree one, make our defc=
onfig the one
> >> > > +               # from the src_uri. Note: there may not have been=
 one from the
> >> > > +               # src_uri, so this can be an empty variable.
> >> > > +               sccs_defconfig=3D$src_uri_defconfig
> >> > >         fi
> >> > > -       sccs=3D"$sccs $sccs_from_src_uri"
> >> > > +       sccs=3D"$sccs_from_src_uri"
> >> > >
> >> > >         # check for feature directories/repos/branches that were =
part of the
> >> > >         # SRC_URI. If they were supplied, we convert them into in=
clude directives
> >> > > @@ -187,11 +197,10 @@ do_kernel_metadata() {
> >> > >         # expand kernel features into their full path equivalents
> >> > >         bsp_definition=3D$(spp ${includes} --find -DKMACHINE=3D${=
KMACHINE} -DKTYPE=3D${LINUX_KERNEL_TYPE})
> >> > >         if [ -z "$bsp_definition" ]; then
> >> > > -               echo "$sccs" | grep -q defconfig
> >> > > -               if [ $? -ne 0 ]; then
> >> > > +               if [ -z "$sccs_defconfig" ]; then
> >> > >                         bbfatal_log "Could not locate BSP definit=
ion for ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconfig was provided"
> >> > >                 fi
> >> > > -
> >> > > +       else
> >> > >                 # if the bsp definition has "define KMETA_EXTERNA=
L_BSP t",
> >> > >                 # then we need to set a flag that will instruct t=
he next
> >> > >                 # steps to use the BSP as both configuration and =
patches.
> >> > > @@ -206,7 +215,7 @@ do_kernel_metadata() {
> >> > >         elements=3D"`echo -n ${bsp_definition} ${sccs} ${patches}=
 ${KERNEL_FEATURES}`"
> >> > >         if [ -n "${elements}" ]; then
> >> > >                 echo "${bsp_definition}" > ${S}/${meta_dir}/bsp_d=
efinition
> >> > > -               scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${=
includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
> >> > > +               scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${=
includes} $sccs_defconfig $bsp_definition $sccs $patches ${KERNEL_FEATURES}
> >> > >                 if [ $? -ne 0 ]; then
> >> > >                         bbfatal_log "Could not generate configura=
tion queue for ${KMACHINE}."
> >> > >                 fi
> >> > > --
> >> > > 2.17.1
> >> > >
> >> > >
> >> >
> >> >
> >> >
> >> > --
> >> > - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
> >> > thee at its end
> >> > - "Use the force Harry" - Gandalf, Star Trek II
> >>=20
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
