Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8E8F278A2A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 09:18:29 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id z13-v6so4944964wma.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2018 02:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vyjsHJgByAi5kmG8MKv6VOjIxkw0PvtT88kIznP5E3o=;
	b=AdOK/6oL6Id5zOppKyhyuepIitRgz9sRjeLUfMuYearfPfGCSuQIDr2ADMxmeAkZcu
	wqeISwyuUkT83eD5/yu7nnv4j6Xg3OARbxQFLq28Hro8fytPtPlNgIdYwJhYADAsHCKd
	rQjcBdxgbwxitsHR1G6XiF2OWCz7yVzwAaAtttFNm7PNiEa5P6sNAnWYbpiILiPSqBg7
	agqnkhc4+xAUfHJLruL6/WOF6ayX4/aGsZraiVWKq/CkatWVvBJzSbvtJZ28ss57kpEU
	4O8S2RoR0voPrfp/0zbsbdzBODXl0qZvpV4IyEkoMvX9eFiNa++jWNT4vWrmO1Ntl52U
	NKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vyjsHJgByAi5kmG8MKv6VOjIxkw0PvtT88kIznP5E3o=;
	b=S0/9BK26QzOCSaNo1IOP2p4g6J35pwTd6iM1j+l4Mci5/EruwC4N5zOoKYg6oGT56z
	F9mTEgtjv1Xqu4IUUXOoXFgLKBoRGICZvLzdD4EWVPQuW5rwwnKXTxMWLQp8wmrJCPFi
	YQbBPWzesykiF1E6b7Z8T03girJdOMp3k77X/osicos/q2hw/xvUf6wVFuoIs0qHRfJG
	LrZFGt8nBGkCKtI0pNhvwedajqIVTIpstdrF4D9A/i4fXCiLMb0Mc2v4Kqf8fTg9BBnb
	ggiJuOZ0AZq2CKXR6nDtK9bdmPgTgL8QxK/ZowrJ7QmRZKSa7ogEtVs1JwYrg+vHFSsr
	7OGQ==
X-Gm-Message-State: APt69E3nqt8ql65gQmuVe5A3QDPPA/iy+a6rcQtEM+LM1Weq//4qhlga
	cHAB2WKTAEhubLgQVwRbW5dAZKKBd7a/vZqyErI=
X-Google-Smtp-Source: AAOMgpep1aHDLBzAzGtLgstnoNF5Bc12jBzCyhr/lYb0ARBTVXqoEMBpeqA5jDTLLRqZu9cwGJjS7DUpP+6OQ/67F/U=
X-Received: by 2002:a1c:d92:: with SMTP id 140-v6mr1004912wmn.32.1530695910275;
	Wed, 04 Jul 2018 02:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <CA+chaQd9otpzozM5DrifBUVdODogBsVdy2U8czAAd+Ys_6TBtA@mail.gmail.com>
	<20180704075924.24065-1-Martin.Jansa@gmail.com>
	<20180704075924.24065-2-Martin.Jansa@gmail.com>
	<CAJO0J4g_WEkU9iakDcoDpLLj9u0V_Cbddpb6ZCSQ1+xCkTsojw@mail.gmail.com>
In-Reply-To: <CAJO0J4g_WEkU9iakDcoDpLLj9u0V_Cbddpb6ZCSQ1+xCkTsojw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 4 Jul 2018 11:18:18 +0200
Message-ID: <CA+chaQdzimkj+=8K6FBe8a-0Q3kvC-_RNT4PbE3VsAm=QYvBHw@mail.gmail.com>
To: ptsneves@gmail.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 2/4] kernel-devicetree.bbclass: Fix and simplify instalation of DTB files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jul 2018 09:18:30 -0000
Content-Type: multipart/alternative; boundary="000000000000fdc031057028e93b"

--000000000000fdc031057028e93b
Content-Type: text/plain; charset="UTF-8"

The refactoring is already in the 3 previous patches from these 4. This is
just the final fix, what do you want to separate from this?

On Wed, Jul 4, 2018 at 10:54 AM Paulo Neves <ptsneves@gmail.com> wrote:

> Great work!
>
> The only issue I have with your changes is that this is basically a
> rewrite and you mix fixes with refactoring. Would it be possible to
> split the patch into smaller patches? This would make it much easier
> analyze.
>
>
>
> On Wed, Jul 4, 2018 at 9:59 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > * add 2 new variables:
> >   KERNEL_DTB_BASE_NAME
> >   KERNEL_DTB_SYMLINK_NAME
> >   instead of reusing KERNEL_IMAGE_SYMLINK_NAME and than expecting that
> >   default value ${MACHINE} was being used in e.g.:
> >   DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> >
> > * install normal DTB files only once even if there is multiple entries
> >   in KERNEL_IMAGETYPE_FOR_MAKE and don't prefix them with the type of
> >   the kernel image, use the KERNEL_IMAGETYPE_FOR_MAKE as a prefix only
> >   when installing them bundled with kernel or initramfs image.
> >
> > * deploy the files from ${D}/${KERNEL_IMAGEDEST}/ instead of kernel
> >   build directory, so that we don't need to call
> >   DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
> >   again in do_deploy
> >
> > * create all links in do_deploy task, because default
> KERNEL_DTB_BASE_NAME
> >   like KERNEL_IMAGE_BASE_NAME contains PKGR and PKGR is different in
> >   do_install and do_deploy, because kernel.bbclass calls
> >   meta/classes/kernel.bbclass:do_install[prefuncs] +=
> "package_get_auto_pr"
> >   meta/classes/kernel.bbclass:do_deploy[prefuncs] +=
> "package_get_auto_pr"
> >
> > * the filenames are a bit different, but with separate variable it
> >   should be easier for other bbclasses which use these DTB files to
> >   find them correctly, just use either the cannonical name
> >   $dtb_base_name.$dtb_ext or
> $dtb_base_name-${KERNEL_DTB_SYMLINK_NAME}.$dtb_ext
> >   because PKGR (and other PKG* variables) might be different in your
> >   task and kernel.do_deploy task.
> >
> > * fix DTB files being deployed with incorrect filenames when
> >   KERNEL_IMAGE_SYMLINK_NAME isn't set to ${MACHINE}, e.g. instead of
> >   the default:
> > -rw-r--r-- 2 bitbake bitbake 1.4K Nov 20 07:41
> deploy/images/raspberrypi3-64/Image-1-4.9.59+git0+e7976b2aff-r0.2-lirc-rpi-20171120043031.dtbo
> > lrwxrwxrwx 2 bitbake bitbake   64 Nov 20 07:41
> deploy/images/raspberrypi3-64/Image-lirc-rpi.dtbo ->
> Image-1-4.9.59+git0+e7976b2aff-r0.2-lirc-rpi-20171120043031.dtbo
> > lrwxrwxrwx 2 bitbake bitbake   64 Nov 20 07:41
> deploy/images/raspberrypi3-64/lirc-rpi.dtbo ->
> Image-1-4.9.59+git0+e7976b2aff-r0.2-lirc-rpi-20171120043031.dtbo
> >   I was getting:
> > -rw-r--r-- 2 bitbake bitbake 1348 Nov 20 10:28
> deploy/images/raspberrypi3-64/Image-linux-raspberrypi-lirc-rpi.dtbo
> > lrwxrwxrwx 2 bitbake bitbake   37 Nov 20 10:28
> deploy/images/raspberrypi3-64/Image-linux-raspberrypi-lirc-rpi-master-20171120102653.dtbo
> -> Image-linux-raspberrypi-lirc-rpi.dtbo
> > lrwxrwxrwx 2 bitbake bitbake   37 Nov 20 10:28
> deploy/images/raspberrypi3-64/lirc-rpi.dtbo ->
> Image-linux-raspberrypi-lirc-rpi.dtbo
> >   and e.g. sdcard_image-rpi.bbclass from meta-raspberrypi:
> >
> https://github.com/agherzan/meta-raspberrypi/blob/37e4e18f4a745ce8dc11f7e40a29da0859ff13c6/classes/sdcard_image-rpi.bbclass
> >   was failing in:
> >   mcopy -i ${WORKDIR}/boot.img -s
> ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${DTB_BASE_NAME}.dtb
> ::${DTB_BASE_NAME}.dtb
> >   because ${KERNEL_IMAGETYPE}-${DTB_BASE_NAME}.dtb doesn't exist in my
> >   build, due to
> >   DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> >   not replacing whole "${KERNEL_IMAGE_SYMLINK_NAME}" (read ${MACHINE})
> >   with just ${DTB_BASE_NAME}
> >
> > * with this change applied the deploy dir looks like this:
> > -rw-r--r-- 2 bitbake bitbake 1.4K Nov 20 15:49
> deploy/images/raspberrypi3-64/lirc-rpi-1-4.9.59+git0+e7976b2aff-r0.8-raspberrypi3-64-20171120154716.dtbo
> > lrwxrwxrwx 2 bitbake bitbake   74 Nov 20 15:49
> deploy/images/raspberrypi3-64/lirc-rpi.dtbo ->
> lirc-rpi-1-4.9.59+git0+e7976b2aff-r0.8-raspberrypi3-64-20171120154716.dtbo
> > lrwxrwxrwx 2 bitbake bitbake   74 Nov 20 15:49
> deploy/images/raspberrypi3-64/lirc-rpi-raspberrypi3-64.dtbo ->
> lirc-rpi-1-4.9.59+git0+e7976b2aff-r0.8-raspberrypi3-64-20171120154716.dtbo
> >   and works correctly even with DISTRO using different naming scheme
> >
> > * the sdcard_image-rpi.bbclass still needs to be modified, I've provided
> >   updated version here:
> >   https://github.com/agherzan/meta-raspberrypi/pull/159
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/kernel-devicetree.bbclass | 47 ++++++++------------------
> >  meta/classes/kernel.bbclass            |  3 ++
> >  2 files changed, 18 insertions(+), 32 deletions(-)
> >
> > diff --git a/meta/classes/kernel-devicetree.bbclass
> b/meta/classes/kernel-devicetree.bbclass
> > index 5d38d3760d..7faa869493 100644
> > --- a/meta/classes/kernel-devicetree.bbclass
> > +++ b/meta/classes/kernel-devicetree.bbclass
> > @@ -60,20 +60,9 @@ do_install_append() {
> >         for dtbf in ${KERNEL_DEVICETREE}; do
> >                 dtb=`normalize_dtb "$dtbf"`
> >                 dtb_ext=${dtb##*.}
> > +               dtb_base_name=`basename $dtb .$dtb_ext`
> >                 dtb_path=`get_real_dtb_path_in_kernel "$dtb"`
> > -               dtb_base_name=`basename $dtb ."$dtb_ext"`
> >                 install -m 0644 $dtb_path
> ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext
> > -               for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> > -
>  symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
> > -                       dtb_symlink_name=`echo ${symlink_name} | sed
> "s/${MACHINE}/$dtb_base_name/g"`
> > -                       ln -sf $dtb_base_name.$dtb_ext
> ${D}/${KERNEL_IMAGEDEST}/devicetree-$dtb_symlink_name.$dtb_ext
> > -
> > -                       if [ "$type" = "zImage" ] && [
> "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
> > -                               cat ${D}/${KERNEL_IMAGEDEST}/$type \
> > -
>  ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext \
> > -                                       >
> ${D}/${KERNEL_IMAGEDEST}/$type-$dtb_base_name.$dtb_ext.bin
> > -                       fi
> > -               done
> >         done
> >  }
> >
> > @@ -81,30 +70,24 @@ do_deploy_append() {
> >         for dtbf in ${KERNEL_DEVICETREE}; do
> >                 dtb=`normalize_dtb "$dtbf"`
> >                 dtb_ext=${dtb##*.}
> > -               dtb_base_name=`basename $dtb ."$dtb_ext"`
> > +               dtb_base_name=`basename $dtb .$dtb_ext`
> > +               install -d ${DEPLOYDIR}
> > +               install -m 0644
> ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext
> ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext
> > +               ln -sf $dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext
> ${DEPLOYDIR}/$dtb_base_name.$dtb_ext
> > +               ln -sf $dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext
> ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_SYMLINK_NAME}.$dtb_ext
> >                 for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
> > -                       base_name=${type}"-"${KERNEL_IMAGE_BASE_NAME}
> > -
>  symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
> > -                       dtb_name=`echo ${base_name} | sed
> "s/${MACHINE}/$dtb_base_name/g"`
> > -                       dtb_symlink_name=`echo ${symlink_name} | sed
> "s/${MACHINE}/$dtb_base_name/g"`
> > -                       dtb_path=`get_real_dtb_path_in_kernel "$dtb"`
> > -                       install -d ${DEPLOYDIR}
> > -                       install -m 0644 $dtb_path
> ${DEPLOYDIR}/$dtb_name.$dtb_ext
> > -                       ln -sf $dtb_name.$dtb_ext
> ${DEPLOYDIR}/$dtb_symlink_name.$dtb_ext
> > -                       ln -sf $dtb_name.$dtb_ext
> ${DEPLOYDIR}/$dtb_base_name.$dtb_ext
> > -
> >                         if [ "$type" = "zImage" ] && [
> "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
> > -                               cat ${DEPLOYDIR}/$type \
> > -                                       ${DEPLOYDIR}/$dtb_name.$dtb_ext \
> > -                                       >
> ${DEPLOYDIR}/$dtb_name.$dtb_ext.bin
> > -                               ln -sf $dtb_name.$dtb_ext.bin
> ${DEPLOYDIR}/$type-$dtb_base_name.$dtb_ext.bin
> > -
> > +                               cat ${D}/${KERNEL_IMAGEDEST}/$type \
> > +
>  ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext \
> > +                                       >
> ${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext.bin
> > +                               ln -sf
> $type-$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext.bin \
> > +
>  ${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_SYMLINK_NAME}.$dtb_ext.bin
> >                                 if [ -e
> "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
> >                                         cat
> ${KERNEL_OUTPUT_DIR}/${type}.initramfs \
> > -
>  ${DEPLOYDIR}/$dtb_name.$dtb_ext \
> > -                                               >
> ${DEPLOYDIR}/${type}-${INITRAMFS_BASE_NAME}-$dtb_base_name.$dtb_ext.bin
> > -                                       ln -sf
> ${type}-${INITRAMFS_BASE_NAME}-$dtb_base_name.$dtb_ext.bin \
> > -
> ${DEPLOYDIR}/${type}-initramfs-$dtb_base_name.$dtb_ext-${MACHINE}.bin
> > +
>  ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext
> > +                                               >
> ${DEPLOYDIR}/${type}-${INITRAMFS_BASE_NAME}-$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext.bin
> > +                                       ln -sf
> ${type}-${INITRAMFS_BASE_NAME}-$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext.bin
> \
> > +
>  ${DEPLOYDIR}/${type}-${INITRAMFS_BASE_NAME}-$dtb_base_name-${KERNEL_DTB_SYMLINK_NAME}.$dtb_ext.bin
> >                                 fi
> >                         fi
> >                 done
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 3213b932bf..7ce64fd19f 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -663,6 +663,9 @@ KERNEL_IMAGE_BASE_NAME ?=
> "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
> >  # Don't include the DATETIME variable in the sstate package signatures
> >  KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
> >  KERNEL_IMAGE_SYMLINK_NAME ?= "${MACHINE}"
> > +KERNEL_DTB_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
> > +KERNEL_DTB_BASE_NAME[vardepsexclude] = "DATETIME"
> > +KERNEL_DTB_SYMLINK_NAME ?= "${MACHINE}"
> >  MODULE_IMAGE_BASE_NAME ?=
> "modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
> >  MODULE_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
> >  MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000fdc031057028e93b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The refactoring is already in the 3 previous patches from =
these 4. This is just the final fix, what do you want to separate from this=
?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Jul 4, 2018 =
at 10:54 AM Paulo Neves &lt;<a href=3D"mailto:ptsneves@gmail.com">ptsneves@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Great wo=
rk!<br>
<br>
The only issue I have with your changes is that this is basically a<br>
rewrite and you mix fixes with refactoring. Would it be possible to<br>
split the patch into smaller patches? This would make it much easier<br>
analyze.<br>
<br>
<br>
<br>
On Wed, Jul 4, 2018 at 9:59 AM, Martin Jansa &lt;<a href=3D"mailto:martin.j=
ansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt; * add 2 new variables:<br>
&gt;=C2=A0 =C2=A0KERNEL_DTB_BASE_NAME<br>
&gt;=C2=A0 =C2=A0KERNEL_DTB_SYMLINK_NAME<br>
&gt;=C2=A0 =C2=A0instead of reusing KERNEL_IMAGE_SYMLINK_NAME and than expe=
cting that<br>
&gt;=C2=A0 =C2=A0default value ${MACHINE} was being used in e.g.:<br>
&gt;=C2=A0 =C2=A0DTB_SYMLINK_NAME=3D`echo ${symlink_name} | sed &quot;s/${M=
ACHINE}/${DTB_BASE_NAME}/g&quot;`<br>
&gt;<br>
&gt; * install normal DTB files only once even if there is multiple entries=
<br>
&gt;=C2=A0 =C2=A0in KERNEL_IMAGETYPE_FOR_MAKE and don&#39;t prefix them wit=
h the type of<br>
&gt;=C2=A0 =C2=A0the kernel image, use the KERNEL_IMAGETYPE_FOR_MAKE as a p=
refix only<br>
&gt;=C2=A0 =C2=A0when installing them bundled with kernel or initramfs imag=
e.<br>
&gt;<br>
&gt; * deploy the files from ${D}/${KERNEL_IMAGEDEST}/ instead of kernel<br=
>
&gt;=C2=A0 =C2=A0build directory, so that we don&#39;t need to call<br>
&gt;=C2=A0 =C2=A0DTB_PATH=3D`get_real_dtb_path_in_kernel &quot;${DTB}&quot;=
`<br>
&gt;=C2=A0 =C2=A0again in do_deploy<br>
&gt;<br>
&gt; * create all links in do_deploy task, because default KERNEL_DTB_BASE_=
NAME<br>
&gt;=C2=A0 =C2=A0like KERNEL_IMAGE_BASE_NAME contains PKGR and PKGR is diff=
erent in<br>
&gt;=C2=A0 =C2=A0do_install and do_deploy, because kernel.bbclass calls<br>
&gt;=C2=A0 =C2=A0meta/classes/kernel.bbclass:do_install[prefuncs] +=3D &quo=
t;package_get_auto_pr&quot;<br>
&gt;=C2=A0 =C2=A0meta/classes/kernel.bbclass:do_deploy[prefuncs] +=3D &quot=
;package_get_auto_pr&quot;<br>
&gt;<br>
&gt; * the filenames are a bit different, but with separate variable it<br>
&gt;=C2=A0 =C2=A0should be easier for other bbclasses which use these DTB f=
iles to<br>
&gt;=C2=A0 =C2=A0find them correctly, just use either the cannonical name<b=
r>
&gt;=C2=A0 =C2=A0$dtb_base_name.$dtb_ext or $dtb_base_name-${KERNEL_DTB_SYM=
LINK_NAME}.$dtb_ext<br>
&gt;=C2=A0 =C2=A0because PKGR (and other PKG* variables) might be different=
 in your<br>
&gt;=C2=A0 =C2=A0task and kernel.do_deploy task.<br>
&gt;<br>
&gt; * fix DTB files being deployed with incorrect filenames when<br>
&gt;=C2=A0 =C2=A0KERNEL_IMAGE_SYMLINK_NAME isn&#39;t set to ${MACHINE}, e.g=
. instead of<br>
&gt;=C2=A0 =C2=A0the default:<br>
&gt; -rw-r--r-- 2 bitbake bitbake 1.4K Nov 20 07:41 deploy/images/raspberry=
pi3-64/Image-1-4.9.59+git0+e7976b2aff-r0.2-lirc-rpi-20171120043031.dtbo<br>
&gt; lrwxrwxrwx 2 bitbake bitbake=C2=A0 =C2=A064 Nov 20 07:41 deploy/images=
/raspberrypi3-64/Image-lirc-rpi.dtbo -&gt; Image-1-4.9.59+git0+e7976b2aff-r=
0.2-lirc-rpi-20171120043031.dtbo<br>
&gt; lrwxrwxrwx 2 bitbake bitbake=C2=A0 =C2=A064 Nov 20 07:41 deploy/images=
/raspberrypi3-64/lirc-rpi.dtbo -&gt; Image-1-4.9.59+git0+e7976b2aff-r0.2-li=
rc-rpi-20171120043031.dtbo<br>
&gt;=C2=A0 =C2=A0I was getting:<br>
&gt; -rw-r--r-- 2 bitbake bitbake 1348 Nov 20 10:28 deploy/images/raspberry=
pi3-64/Image-linux-raspberrypi-lirc-rpi.dtbo<br>
&gt; lrwxrwxrwx 2 bitbake bitbake=C2=A0 =C2=A037 Nov 20 10:28 deploy/images=
/raspberrypi3-64/Image-linux-raspberrypi-lirc-rpi-master-20171120102653.dtb=
o -&gt; Image-linux-raspberrypi-lirc-rpi.dtbo<br>
&gt; lrwxrwxrwx 2 bitbake bitbake=C2=A0 =C2=A037 Nov 20 10:28 deploy/images=
/raspberrypi3-64/lirc-rpi.dtbo -&gt; Image-linux-raspberrypi-lirc-rpi.dtbo<=
br>
&gt;=C2=A0 =C2=A0and e.g. sdcard_image-rpi.bbclass from meta-raspberrypi:<b=
r>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/agherzan/meta-raspberrypi/bl=
ob/37e4e18f4a745ce8dc11f7e40a29da0859ff13c6/classes/sdcard_image-rpi.bbclas=
s" rel=3D"noreferrer" target=3D"_blank">https://github.com/agherzan/meta-ra=
spberrypi/blob/37e4e18f4a745ce8dc11f7e40a29da0859ff13c6/classes/sdcard_imag=
e-rpi.bbclass</a><br>
&gt;=C2=A0 =C2=A0was failing in:<br>
&gt;=C2=A0 =C2=A0mcopy -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/${KERN=
EL_IMAGETYPE}-${DTB_BASE_NAME}.dtb ::${DTB_BASE_NAME}.dtb<br>
&gt;=C2=A0 =C2=A0because ${KERNEL_IMAGETYPE}-${DTB_BASE_NAME}.dtb doesn&#39=
;t exist in my<br>
&gt;=C2=A0 =C2=A0build, due to<br>
&gt;=C2=A0 =C2=A0DTB_SYMLINK_NAME=3D`echo ${symlink_name} | sed &quot;s/${M=
ACHINE}/${DTB_BASE_NAME}/g&quot;`<br>
&gt;=C2=A0 =C2=A0not replacing whole &quot;${KERNEL_IMAGE_SYMLINK_NAME}&quo=
t; (read ${MACHINE})<br>
&gt;=C2=A0 =C2=A0with just ${DTB_BASE_NAME}<br>
&gt;<br>
&gt; * with this change applied the deploy dir looks like this:<br>
&gt; -rw-r--r-- 2 bitbake bitbake 1.4K Nov 20 15:49 deploy/images/raspberry=
pi3-64/lirc-rpi-1-4.9.59+git0+e7976b2aff-r0.8-raspberrypi3-64-2017112015471=
6.dtbo<br>
&gt; lrwxrwxrwx 2 bitbake bitbake=C2=A0 =C2=A074 Nov 20 15:49 deploy/images=
/raspberrypi3-64/lirc-rpi.dtbo -&gt; lirc-rpi-1-4.9.59+git0+e7976b2aff-r0.8=
-raspberrypi3-64-20171120154716.dtbo<br>
&gt; lrwxrwxrwx 2 bitbake bitbake=C2=A0 =C2=A074 Nov 20 15:49 deploy/images=
/raspberrypi3-64/lirc-rpi-raspberrypi3-64.dtbo -&gt; lirc-rpi-1-4.9.59+git0=
+e7976b2aff-r0.8-raspberrypi3-64-20171120154716.dtbo<br>
&gt;=C2=A0 =C2=A0and works correctly even with DISTRO using different namin=
g scheme<br>
&gt;<br>
&gt; * the sdcard_image-rpi.bbclass still needs to be modified, I&#39;ve pr=
ovided<br>
&gt;=C2=A0 =C2=A0updated version here:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/agherzan/meta-raspberrypi/pu=
ll/159" rel=3D"noreferrer" target=3D"_blank">https://github.com/agherzan/me=
ta-raspberrypi/pull/159</a><br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/kernel-devicetree.bbclass | 47 ++++++++------------=
------<br>
&gt;=C2=A0 meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 3 ++<br>
&gt;=C2=A0 2 files changed, 18 insertions(+), 32 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/ker=
nel-devicetree.bbclass<br>
&gt; index 5d38d3760d..7faa869493 100644<br>
&gt; --- a/meta/classes/kernel-devicetree.bbclass<br>
&gt; +++ b/meta/classes/kernel-devicetree.bbclass<br>
&gt; @@ -60,20 +60,9 @@ do_install_append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for dtbf in ${KERNEL_DEVICETREE}; do<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb=3D`no=
rmalize_dtb &quot;$dtbf&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb_ext=
=3D${dtb##*.}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb_base_name=
=3D`basename $dtb .$dtb_ext`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb_path=
=3D`get_real_dtb_path_in_kernel &quot;$dtb&quot;`<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb_base_name=
=3D`basename $dtb .&quot;$dtb_ext&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -=
m 0644 $dtb_path ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${=
KERNEL_IMAGETYPE_FOR_MAKE}; do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0symlink_name=3D${type}&quot;-&quot;${KERNEL_IMAGE_SYMLINK_NAM=
E}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0dtb_symlink_name=3D`echo ${symlink_name} | sed &quot;s/${MACH=
INE}/$dtb_base_name/g&quot;`<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ln -sf $dtb_base_name.$dtb_ext ${D}/${KERNEL_IMAGEDEST}/devic=
etree-$dtb_symlink_name.$dtb_ext<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if [ &quot;$type&quot; =3D &quot;zImage&quot; ] &amp;&amp; [ =
&quot;${KERNEL_DEVICETREE_BUNDLE}&quot; =3D &quot;1&quot; ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cat ${D}/${KERNEL_IMAGEDEST}/$typ=
e \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}/=
${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =
${D}/${KERNEL_IMAGEDEST}/$type-$dtb_base_name.$dtb_ext.bin<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; @@ -81,30 +70,24 @@ do_deploy_append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for dtbf in ${KERNEL_DEVICETREE}; do<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb=3D`no=
rmalize_dtb &quot;$dtbf&quot;`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb_ext=
=3D${dtb##*.}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb_base_name=
=3D`basename $dtb .&quot;$dtb_ext&quot;`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb_base_name=
=3D`basename $dtb .$dtb_ext`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D=
EPLOYDIR}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 064=
4 ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext ${DEPLOYDIR}/$dtb_base_n=
ame-${KERNEL_DTB_BASE_NAME}.$dtb_ext<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf $dtb_ba=
se_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext ${DEPLOYDIR}/$dtb_base_name.$dtb_e=
xt<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf $dtb_ba=
se_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext ${DEPLOYDIR}/$dtb_base_name-${KERN=
EL_DTB_SYMLINK_NAME}.$dtb_ext<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for type =
in ${KERNEL_IMAGETYPE_FOR_MAKE}; do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0base_name=3D${type}&quot;-&quot;${KERNEL_IMAGE_BASE_NAME}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0symlink_name=3D${type}&quot;-&quot;${KERNEL_IMAGE_SYMLINK_NAM=
E}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0dtb_name=3D`echo ${base_name} | sed &quot;s/${MACHINE}/$dtb_b=
ase_name/g&quot;`<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0dtb_symlink_name=3D`echo ${symlink_name} | sed &quot;s/${MACH=
INE}/$dtb_base_name/g&quot;`<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0dtb_path=3D`get_real_dtb_path_in_kernel &quot;$dtb&quot;`<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0install -d ${DEPLOYDIR}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0install -m 0644 $dtb_path ${DEPLOYDIR}/$dtb_name.$dtb_ext<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ln -sf $dtb_name.$dtb_ext ${DEPLOYDIR}/$dtb_symlink_name.$dtb=
_ext<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ln -sf $dtb_name.$dtb_ext ${DEPLOYDIR}/$dtb_base_name.$dtb_ex=
t<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if [ &quot;$type&quot; =3D &quot;zImage&quot; ] &amp;&a=
mp; [ &quot;${KERNEL_DEVICETREE_BUNDLE}&quot; =3D &quot;1&quot; ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cat ${DEPLOYDIR}/$type \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${DEP=
LOYDIR}/$dtb_name.$dtb_ext \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =
${DEPLOYDIR}/$dtb_name.$dtb_ext.bin<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf $dtb_name.$dtb_ext.bin ${D=
EPLOYDIR}/$type-$dtb_base_name.$dtb_ext.bin<br>
&gt; -<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cat ${D}/${KERNEL_IMAGEDEST}/$typ=
e \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${DEP=
LOYDIR}/$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; =
${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext.bin<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf $type-$dtb_base_name-${KER=
NEL_DTB_BASE_NAME}.$dtb_ext.bin \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${DEP=
LOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_SYMLINK_NAME}.$dtb_ext.bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e &quot;${KERNEL_OUTP=
UT_DIR}/${type}.initramfs&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0cat ${KERNEL_OUTPUT_DIR}/${type}.initramfs \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0${DEPLOYDIR}/$dtb_name.$dtb_ext \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&gt; ${DEPLOYDIR}/${type}-${INITRAMFS_BASE_NAME}-$d=
tb_base_name.$dtb_ext.bin<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s=
f ${type}-${INITRAMFS_BASE_NAME}-$dtb_base_name.$dtb_ext.bin \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ${DEPLOYDIR}/${type}-initramfs-$dtb_base_name.$dtb_ext-${=
MACHINE}.bin<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_BASE_NAME}=
.$dtb_ext<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 ${DEPLOYDIR}/${type}-${INITRAMFS_BASE_NA=
ME}-$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext.bin<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s=
f ${type}-${INITRAMFS_BASE_NAME}-$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dt=
b_ext.bin \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0${DEPLOYDIR}/${type}-${INITRAMFS_BASE_NAME}-$dtb_ba=
se_name-${KERNEL_DTB_SYMLINK_NAME}.$dtb_ext.bin<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt; diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass=
<br>
&gt; index 3213b932bf..7ce64fd19f 100644<br>
&gt; --- a/meta/classes/kernel.bbclass<br>
&gt; +++ b/meta/classes/kernel.bbclass<br>
&gt; @@ -663,6 +663,9 @@ KERNEL_IMAGE_BASE_NAME ?=3D &quot;${PKGE}-${PKGV}-=
${PKGR}-${MACHINE}-${DATETIME}&quot;<br>
&gt;=C2=A0 # Don&#39;t include the DATETIME variable in the sstate package =
signatures<br>
&gt;=C2=A0 KERNEL_IMAGE_BASE_NAME[vardepsexclude] =3D &quot;DATETIME&quot;<=
br>
&gt;=C2=A0 KERNEL_IMAGE_SYMLINK_NAME ?=3D &quot;${MACHINE}&quot;<br>
&gt; +KERNEL_DTB_BASE_NAME ?=3D &quot;${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${=
DATETIME}&quot;<br>
&gt; +KERNEL_DTB_BASE_NAME[vardepsexclude] =3D &quot;DATETIME&quot;<br>
&gt; +KERNEL_DTB_SYMLINK_NAME ?=3D &quot;${MACHINE}&quot;<br>
&gt;=C2=A0 MODULE_IMAGE_BASE_NAME ?=3D &quot;modules-${PKGE}-${PKGV}-${PKGR=
}-${MACHINE}-${DATETIME}&quot;<br>
&gt;=C2=A0 MODULE_IMAGE_BASE_NAME[vardepsexclude] =3D &quot;DATETIME&quot;<=
br>
&gt;=C2=A0 MODULE_TARBALL_BASE_NAME ?=3D &quot;${MODULE_IMAGE_BASE_NAME}.tg=
z&quot;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000fdc031057028e93b--
