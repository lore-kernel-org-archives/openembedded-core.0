Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.29331.1595453247908995924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 14:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qnbXKE4f;
 spf=pass (domain: linaro.org, ip: 209.85.222.170, mailfrom: ryan.harkin@linaro.org)
Received: by mail-qk1-f170.google.com with SMTP id l6so3481222qkc.6
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2020 14:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vvXGn1ZCeBx86h3tbwevOUK71ma/PTQ92cYWNp8oav4=;
        b=qnbXKE4f+jBbi2l8nrGC5RQxokCZEB4RGDMq7M+2I63J2R4lRe3O3gIO7LzCcb/FdC
         YLDJ9NMUBP+vz9ZNkHVVArPO8sUoPhqScSvpOL46NlevWQRCXNyWvb6RpevtjN5hORSg
         Q3efpG/VxtM4gcbsWp46rnWGv0UYidgSYYC90Se01gHMLrEZP11XxAergbTZNaN67usW
         gbBKRwzHK9Zpt18UPhUBLhINILfwCrzYCWu6mtLq8fUoPz5En6JRMbfhcxpgOYwStCHq
         hffFNfqppsyL2Eegs7nccsLmIgr6qVxQ84097tRfLTxYQ0i2kMD6do+zGQ1AzEvKzcCN
         HNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vvXGn1ZCeBx86h3tbwevOUK71ma/PTQ92cYWNp8oav4=;
        b=cPOUatVIqc2nwViyJMn0JUamQxVtSQQD/lM0N5GwgYdI6368zR62Goh/pcV2tuLr70
         E0Wcjk6Eh0hunZR46c7AQMrEo4kkHm8u1T6eM0bECsJba1kJlmeTeX1AYvtMLh6vstL0
         eGoOkSfZFfmtgyzkBJp32pYMjCawoqcUM4o4WqNCBFmq15PMqVevFDR3l3BdwY03zaN+
         +xKeu+8xd/JUxPdsdjkFERtXgqsjJ6NXFfd2/O7aerllR/BL2xOqhbMPjQiNRsSZ3QH3
         j3eAFcrKabDBOfGdniQBN2jp84myLc8gXQGIerYbevj96pCYvouqxwYiAMnh9kWfpnwK
         ueLg==
X-Gm-Message-State: AOAM533Cv1XH3zOtUpgwNVQO95gussIFz9/GEHF5+shbdiZwoUjDZwm7
	5z7xVzZcntGngt/+mc/imRI3gyOGuOWdQj9m7UQnOg==
X-Google-Smtp-Source: ABdhPJzplrWxbZjAMfbhBdH91BwAUX2cW7bD0HNTRiJjRjJL5LxUW4ZB9E4EkGsHGjPlvTNlyQRO9Hqq7xe49Ifpkgo=
X-Received: by 2002:ae9:f002:: with SMTP id l2mr2094594qkg.437.1595453246741;
 Wed, 22 Jul 2020 14:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594050175.git.steve@sakoman.com> <7a8612998a367dd3a54344ae75983cb210db813d.1594050175.git.steve@sakoman.com>
 <CADkTA4Nyy_=+bXfiaXoHPzZHDsdHmfAX=tjzarrz3_y-Sw=3tw@mail.gmail.com> <CAOSpxdYXtK=5=QhGEGiJbx1_zzQp2LmnnHBfAbZ8uL1W01hTdg@mail.gmail.com>
In-Reply-To: <CAOSpxdYXtK=5=QhGEGiJbx1_zzQp2LmnnHBfAbZ8uL1W01hTdg@mail.gmail.com>
From: "Ryan Harkin" <ryan.harkin@linaro.org>
Date: Wed, 22 Jul 2020 22:27:16 +0100
Message-ID: <CAD0U-h+oBmDGQ3DipQJNdTBYi6QjX0JgCWDAM5UTz4W8=pN6Gg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 04/25] kernel/yocto: ensure that defconfigs are processed first
To: Steve Sakoman <steve@sakoman.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000007410105ab0e68a4"

--00000000000007410105ab0e68a4
Content-Type: text/plain; charset="UTF-8"

Just an FYI, but when this was submitted, my imx7s-warp builds began to
fail when building linux-fslc from meta-freescale / meta-freescale-3rdparty.

I'm not sure why yet, I've only discovered the problem, but I thought I'd
report it in case anyone else sees the problem.

Here's a link to my failing build for reference:
https://ci.linaro.org/job/warp7-openembedded-dunfell/67/DISTRO=rpb,MACHINE=imx7s-warp,label=docker-buster-amd64/consoleText

And a snippet from the failure:

ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_configme:
Execution of '/srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_kernel_configme.7123'
failed with exit code 1:
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in:
/srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/log.do_kernel_configme.7123
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are
['virtual:native:/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devtools/bison/bison_3.5.3.bb:do_populate_sysroot',
'/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot',
'/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.34.bb:do_populate_sysroot',
'/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot',
'virtual:native:/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot',
'virtual:native:/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_sysroot',
'/srv/oe/build/conf/../../layers/meta-arm/meta-arm-toolchain/recipes-devtools/gcc/gcc-cross_arm-9.2.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['bison-native',
'kern-tools-native', 'binutils-cross-arm', 'quilt-native',
'patch-native', 'bc-native', 'gcc-cross-arm', 'flex-native',
'texinfo-dummy-native', 'gnu-config-native', 'readline-native',
'libtool-native', 'automake-native', 'autoconf-native', 'xz-native',
'linux-libc-headers', 'gmp-native', 'libmpc-native', 'mpfr-native',
'zlib-native', 'gettext-minimal-native', 'attr-native', 'm4-native',
'ncurses-native', 'pkgconfig-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_kernel_configme
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of
'/srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_kernel_configme.7123'
failed with exit code 1:
| WARNING: exit code 1 from a shell command.
|
NOTE: recipe linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0: task
do_kernel_configme: Failed
ERROR: Task (/srv/oe/build/conf/../../layers/meta-freescale/recipes-kernel/linux/linux-fslc_5.4.bb:do_kernel_configme)
failed with exit code '1'



On Mon, 6 Jul 2020 at 17:38, Steve Sakoman <steve@sakoman.com> wrote:

> On Mon, Jul 6, 2020 at 6:29 AM Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> >
> > We have a fixup patch for this one in test right now, so we don't want
> > this patch, without the follow up.
> >
> > But this is useful for dunfell, since it was an unexpected behaviour
> > that needed to be fixed.
>
> Thanks, I'll drop this patch from the pull request and include it
> along with the fixup patch in next week's patch set.
>
> Steve
>
> > On Mon, Jul 6, 2020 at 12:11 PM Steve Sakoman <steve@sakoman.com> wrote:
> > >
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > It is uncommon that a BSP definition and a defconfig are used in
> > > a single configuration. That being said, it is a valid way to
> > > organize kernel configuration meta data.
> > >
> > > When a defconfig is used, either on the src_uri or from in
> > > the kernel tree, it is normally expected that it is the baseline,
> > > with all options applied on top of it.
> > >
> > > With this commit, we detect either type of defconfig and ensure
> > > that it is used first, followed by the fragments in their
> > > previous order. This allows existing configuration stacks to
> > > remain the same, while ensuring that a defconfig combined stack
> > > works as expected.
> > >
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > (cherry picked from commit e6845327b69396d843a2f3c4c3ac9400ae9caedf)
> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > ---
> > >  meta/classes/kernel-yocto.bbclass | 33 ++++++++++++++++++++-----------
> > >  1 file changed, 21 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> > > index 5bc627066e..41d8620e67 100644
> > > --- a/meta/classes/kernel-yocto.bbclass
> > > +++ b/meta/classes/kernel-yocto.bbclass
> > > @@ -131,7 +131,7 @@ do_kernel_metadata() {
> > >                         else
> > >                                 cp -f
> ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
> > >                         fi
> > > -                       sccs="${WORKDIR}/defconfig"
> > > +                       in_tree_defconfig="${WORKDIR}/defconfig"
> > >                 else
> > >                         bbfatal "A KBUILD_DEFCONFIG
> '${KBUILD_DEFCONFIG}' was specified, but not present in the source tree"
> > >                 fi
> > > @@ -153,14 +153,24 @@ do_kernel_metadata() {
> > >         patches="${@" ".join(find_patches(d,''))}"
> > >         feat_dirs="${@" ".join(find_kernel_feature_dirs(d))}"
> > >
> > > -       # a quick check to make sure we don't have duplicate defconfigs
> > > -       # If there's a defconfig in the SRC_URI, did we also have one
> from
> > > -       # the KBUILD_DEFCONFIG processing above ?
> > > -       if [ -n "$sccs" ]; then
> > > -           # we did have a defconfig from above. remove any that
> might be in the src_uri
> > > -           sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '{ if
> ($0!="defconfig") { print $0 } }' RS=' ')
> > > +       # a quick check to make sure we don't have duplicate
> defconfigs If
> > > +       # there's a defconfig in the SRC_URI, did we also have one
> from the
> > > +       # KBUILD_DEFCONFIG processing above ?
> > > +       src_uri_defconfig=$(echo $sccs_from_src_uri | awk '{ if
> ($0=="defconfig") { print $0 } }' RS=' ')
> > > +       # drop and defconfig's from the src_uri variable, we captured
> it just above here if it existed
> > > +       sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '{ if
> ($0!="defconfig") { print $0 } }' RS=' ')
> > > +       if [ -n "$in_tree_defconfig" ]; then
> > > +               sccs_defconfig=$in_tree_defconfig
> > > +               if [ -n "$src_uri_defconfig" ]; then
> > > +                       bbwarn "[NOTE]: defconfig was supplied both
> via KBUILD_DEFCONFIG and SRC_URI. Dropping SRC_URI defconfig"
> > > +               fi
> > > +       else
> > > +               # if we didn't have an in-tree one, make our defconfig
> the one
> > > +               # from the src_uri. Note: there may not have been one
> from the
> > > +               # src_uri, so this can be an empty variable.
> > > +               sccs_defconfig=$src_uri_defconfig
> > >         fi
> > > -       sccs="$sccs $sccs_from_src_uri"
> > > +       sccs="$sccs_from_src_uri"
> > >
> > >         # check for feature directories/repos/branches that were part
> of the
> > >         # SRC_URI. If they were supplied, we convert them into include
> directives
> > > @@ -187,11 +197,10 @@ do_kernel_metadata() {
> > >         # expand kernel features into their full path equivalents
> > >         bsp_definition=$(spp ${includes} --find -DKMACHINE=${KMACHINE}
> -DKTYPE=${LINUX_KERNEL_TYPE})
> > >         if [ -z "$bsp_definition" ]; then
> > > -               echo "$sccs" | grep -q defconfig
> > > -               if [ $? -ne 0 ]; then
> > > +               if [ -z "$sccs_defconfig" ]; then
> > >                         bbfatal_log "Could not locate BSP definition
> for ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconfig was provided"
> > >                 fi
> > > -
> > > +       else
> > >                 # if the bsp definition has "define KMETA_EXTERNAL_BSP
> t",
> > >                 # then we need to set a flag that will instruct the
> next
> > >                 # steps to use the BSP as both configuration and
> patches.
> > > @@ -206,7 +215,7 @@ do_kernel_metadata() {
> > >         elements="`echo -n ${bsp_definition} ${sccs} ${patches}
> ${KERNEL_FEATURES}`"
> > >         if [ -n "${elements}" ]; then
> > >                 echo "${bsp_definition}" >
> ${S}/${meta_dir}/bsp_definition
> > > -               scc --force -o ${S}/${meta_dir}:cfg,merge,meta
> ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
> > > +               scc --force -o ${S}/${meta_dir}:cfg,merge,meta
> ${includes} $sccs_defconfig $bsp_definition $sccs $patches
> ${KERNEL_FEATURES}
> > >                 if [ $? -ne 0 ]; then
> > >                         bbfatal_log "Could not generate configuration
> queue for ${KMACHINE}."
> > >                 fi
> > > --
> > > 2.17.1
> > >
> > >
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> 
>

--00000000000007410105ab0e68a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Just an FYI, but when this was submitted, my imx7s-wa=
rp builds began=C2=A0to fail when building linux-fslc from meta-freescale /=
 meta-freescale-3rdparty.</div><div><br></div><div>I&#39;m not sure why yet=
, I&#39;ve only discovered the problem, but I thought I&#39;d report it in =
case anyone else sees the problem.</div><div><br></div><div>Here&#39;s a li=
nk to my failing build for reference:</div><div><a href=3D"https://ci.linar=
o.org/job/warp7-openembedded-dunfell/67/DISTRO=3Drpb,MACHINE=3Dimx7s-warp,l=
abel=3Ddocker-buster-amd64/consoleText">https://ci.linaro.org/job/warp7-ope=
nembedded-dunfell/67/DISTRO=3Drpb,MACHINE=3Dimx7s-warp,label=3Ddocker-buste=
r-amd64/consoleText</a><br></div><div><br></div><div>And a snippet from the=
 failure:</div><div><br></div><div><pre style=3D"color:rgb(0,0,0);white-spa=
ce:pre-wrap">ERROR: linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0 do_kernel_co=
nfigme: Execution of &#39;/srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-linar=
o-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_kern=
el_configme.7123&#39; failed with exit code 1:
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: /srv/oe/build/tmp-rpb-glibc/work/imx7=
s_warp-linaro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp=
/log.do_kernel_configme.7123
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are [&#39;virtual:native:/srv/oe/build/conf/..=
/../layers/openembedded-core/meta/recipes-devtools/bison/bison_3.5.3.bb:do_=
populate_sysroot&#39;, &#39;/srv/oe/build/conf/../../layers/openembedded-co=
re/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysr=
oot&#39;, &#39;/srv/oe/build/conf/../../layers/openembedded-core/meta/recip=
es-devtools/binutils/binutils-cross_2.34.bb:do_populate_sysroot&#39;, &#39;=
/srv/oe/build/conf/../../layers/openembedded-core/meta/recipes-devtools/qui=
lt/quilt-native_0.66.bb:do_populate_sysroot&#39;, &#39;virtual:native:/srv/=
oe/build/conf/../../layers/openembedded-core/meta/recipes-devtools/patch/pa=
tch_2.7.6.bb:do_populate_sysroot&#39;, &#39;virtual:native:/srv/oe/build/co=
nf/../../layers/openembedded-core/meta/recipes-extended/bc/bc_1.07.1.bb:do_=
populate_sysroot&#39;, &#39;/srv/oe/build/conf/../../layers/meta-arm/meta-a=
rm-toolchain/recipes-devtools/gcc/gcc-cross_arm-9.2.bb:do_populate_sysroot&=
#39;]
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: [&#39;bison-native&#39;, &#=
39;kern-tools-native&#39;, &#39;binutils-cross-arm&#39;, &#39;quilt-native&=
#39;, &#39;patch-native&#39;, &#39;bc-native&#39;, &#39;gcc-cross-arm&#39;,=
 &#39;flex-native&#39;, &#39;texinfo-dummy-native&#39;, &#39;gnu-config-nat=
ive&#39;, &#39;readline-native&#39;, &#39;libtool-native&#39;, &#39;automak=
e-native&#39;, &#39;autoconf-native&#39;, &#39;xz-native&#39;, &#39;linux-l=
ibc-headers&#39;, &#39;gmp-native&#39;, &#39;libmpc-native&#39;, &#39;mpfr-=
native&#39;, &#39;zlib-native&#39;, &#39;gettext-minimal-native&#39;, &#39;=
attr-native&#39;, &#39;m4-native&#39;, &#39;ncurses-native&#39;, &#39;pkgco=
nfig-native&#39;]
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_kernel_configme
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of &#39;/srv/oe/build/tmp-rpb-glibc/work/imx7s_warp-lin=
aro-linux-gnueabi/linux-fslc/5.4.46+gitAUTOINC+38d6c3525e-r0/temp/run.do_ke=
rnel_configme.7123&#39; failed with exit code 1:
| WARNING: exit code 1 from a shell command.
|=20
NOTE: recipe linux-fslc-5.4.46+gitAUTOINC+38d6c3525e-r0: task do_kernel_co=
nfigme: Failed
ERROR: Task (/srv/oe/build/conf/../../layers/meta-freescale/recipes-kernel=
/linux/linux-fslc_5.4.bb:do_kernel_configme) failed with exit code &#39;1&#=
39;</pre><pre style=3D"color:rgb(0,0,0);white-space:pre-wrap"><br></pre></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Mon, 6 Jul 2020 at 17:38, Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman=
.com">steve@sakoman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Mon, Jul 6, 2020 at 6:29 AM Bruce Ashfield &lt;<a=
 href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@=
gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; We have a fixup patch for this one in test right now, so we don&#39;t=
 want<br>
&gt; this patch, without the follow up.<br>
&gt;<br>
&gt; But this is useful for dunfell, since it was an unexpected behaviour<=
br>
&gt; that needed to be fixed.<br>
<br>
Thanks, I&#39;ll drop this patch from the pull request and include it<br>
along with the fixup patch in next week&#39;s patch set.<br>
<br>
Steve<br>
<br>
&gt; On Mon, Jul 6, 2020 at 12:11 PM Steve Sakoman &lt;<a href=3D"mailto:s=
teve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.=
com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; It is uncommon that a BSP definition and a defconfig are used in=
<br>
&gt; &gt; a single configuration. That being said, it is a valid way to<br=
>
&gt; &gt; organize kernel configuration meta data.<br>
&gt; &gt;<br>
&gt; &gt; When a defconfig is used, either on the src_uri or from in<br>
&gt; &gt; the kernel tree, it is normally expected that it is the baseline=
,<br>
&gt; &gt; with all options applied on top of it.<br>
&gt; &gt;<br>
&gt; &gt; With this commit, we detect either type of defconfig and ensure<=
br>
&gt; &gt; that it is used first, followed by the fragments in their<br>
&gt; &gt; previous order. This allows existing configuration stacks to<br>
&gt; &gt; remain the same, while ensuring that a defconfig combined stack<=
br>
&gt; &gt; works as expected.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfie=
ld@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purd=
ie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.or=
g</a>&gt;<br>
&gt; &gt; (cherry picked from commit e6845327b69396d843a2f3c4c3ac9400ae9ca=
edf)<br>
&gt; &gt; Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman=
.com" target=3D"_blank">steve@sakoman.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/classes/kernel-yocto.bbclass | 33 +++++++++++++++++++=
+-----------<br>
&gt; &gt;=C2=A0 1 file changed, 21 insertions(+), 12 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/ke=
rnel-yocto.bbclass<br>
&gt; &gt; index 5bc627066e..41d8620e67 100644<br>
&gt; &gt; --- a/meta/classes/kernel-yocto.bbclass<br>
&gt; &gt; +++ b/meta/classes/kernel-yocto.bbclass<br>
&gt; &gt; @@ -131,7 +131,7 @@ do_kernel_metadata() {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -f ${S}/arch/${A=
RCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0sccs=3D&quot;${WORKDIR}/defconfig&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0in_tree_defconfig=3D&quot;${WORKDIR}/defconfig&quot;<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0els=
e<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal &quot;A KBUILD_DEFCONFIG &#39;${KBUILD_=
DEFCONFIG}&#39; was specified, but not present in the source tree&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<=
br>
&gt; &gt; @@ -153,14 +153,24 @@ do_kernel_metadata() {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patches=3D&quot;${@&quot; &quot=
;.join(find_patches(d,&#39;&#39;))}&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0feat_dirs=3D&quot;${@&quot; &qu=
ot;.join(find_kernel_feature_dirs(d))}&quot;<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# a quick check to make sure we don&=
#39;t have duplicate defconfigs<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# If there&#39;s a defconfig in the =
SRC_URI, did we also have one from<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# the KBUILD_DEFCONFIG processing ab=
ove ?<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;$sccs&quot; ]; then<br=
>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# we did have a defcon=
fig from above. remove any that might be in the src_uri<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sccs_from_src_uri=3D$(=
echo $sccs_from_src_uri | awk &#39;{ if ($0!=3D&quot;defconfig&quot;) { pri=
nt $0 } }&#39; RS=3D&#39; &#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# a quick check to make sure we don&=
#39;t have duplicate defconfigs If<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# there&#39;s a defconfig in the SRC=
_URI, did we also have one from the<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# KBUILD_DEFCONFIG processing above =
?<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0src_uri_defconfig=3D$(echo $sccs_fro=
m_src_uri | awk &#39;{ if ($0=3D=3D&quot;defconfig&quot;) { print $0 } }&#3=
9; RS=3D&#39; &#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# drop and defconfig&#39;s from the =
src_uri variable, we captured it just above here if it existed<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sccs_from_src_uri=3D$(echo $sccs_fro=
m_src_uri | awk &#39;{ if ($0!=3D&quot;defconfig&quot;) { print $0 } }&#39;=
 RS=3D&#39; &#39;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;$in_tree_defconfig&quo=
t; ]; then<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sccs_def=
config=3D$in_tree_defconfig<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n =
&quot;$src_uri_defconfig&quot; ]; then<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0bbwarn &quot;[NOTE]: defconfig was supplied both via K=
BUILD_DEFCONFIG and SRC_URI. Dropping SRC_URI defconfig&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# if we =
didn&#39;t have an in-tree one, make our defconfig the one<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# from t=
he src_uri. Note: there may not have been one from the<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# src_ur=
i, so this can be an empty variable.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sccs_def=
config=3D$src_uri_defconfig<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0sccs=3D&quot;$sccs $sccs_from_src_ur=
i&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sccs=3D&quot;$sccs_from_src_uri&quot=
;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# check for feature directories=
/repos/branches that were part of the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# SRC_URI. If they were supplie=
d, we convert them into include directives<br>
&gt; &gt; @@ -187,11 +197,10 @@ do_kernel_metadata() {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# expand kernel features into t=
heir full path equivalents<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bsp_definition=3D$(spp ${includ=
es} --find -DKMACHINE=3D${KMACHINE} -DKTYPE=3D${LINUX_KERNEL_TYPE})<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$bsp_definition&q=
uot; ]; then<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &qu=
ot;$sccs&quot; | grep -q defconfig<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? =
-ne 0 ]; then<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z =
&quot;$sccs_defconfig&quot; ]; then<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal_log &quot;Could not locate BSP definiti=
on for ${KMACHINE}/${LINUX_KERNEL_TYPE} and no defconfig was provided&quot;=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<=
br>
&gt; &gt; -<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# i=
f the bsp definition has &quot;define KMETA_EXTERNAL_BSP t&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# t=
hen we need to set a flag that will instruct the next<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# s=
teps to use the BSP as both configuration and patches.<br>
&gt; &gt; @@ -206,7 +215,7 @@ do_kernel_metadata() {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elements=3D&quot;`echo -n ${bsp=
_definition} ${sccs} ${patches} ${KERNEL_FEATURES}`&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;${elements}&quot;=
 ]; then<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ech=
o &quot;${bsp_definition}&quot; &gt; ${S}/${meta_dir}/bsp_definition<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scc --fo=
rce -o ${S}/${meta_dir}:cfg,merge,meta ${includes} ${bsp_definition} ${sccs=
} ${patches} ${KERNEL_FEATURES}<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scc --fo=
rce -o ${S}/${meta_dir}:cfg,merge,meta ${includes} $sccs_defconfig $bsp_def=
inition $sccs $patches ${KERNEL_FEATURES}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if =
[ $? -ne 0 ]; then<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0bbfatal_log &quot;Could not generate configurat=
ion queue for ${KMACHINE}.&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<=
br>
&gt; &gt; --<br>
&gt; &gt; 2.17.1<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await=
<br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
</blockquote></div></div>

--00000000000007410105ab0e68a4--
