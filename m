Return-Path: <naresh.bhat@linaro.org>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id A45696AC43
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 11:59:42 +0000 (UTC)
Received: by obfv9 with SMTP id v9so33414465obf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 04:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=P8R86TESm0BE2byHmNqzfNhg6eSzWUW3dIgPzPqM1ks=;
	b=d7Y28HzVhxq2Rg1NLA5kDDQIe7ni/6MdWpxd6bMD18x7rlwihwnCDYnBuTIvZSNMMu
	hw+T8JzBcFHyRYk2gZWcZ6n2ZiwlPaRhi/F1x+/spqFi7cwGscsK8aEKQBDfbVRD0IOd
	mmWAk8LBouGiMC5k5S/BxRsNTVWGFQ3UXJeCKxgLxlkhn8JcM9l7kaqofoszjn2I/s8Z
	J1iZfkONBm40wOgLA1BSXshBWGNWzMpo1HhlIlD4HjNcjqIO0GtVFSwR5m3EiIzbJBZU
	q3VB2wrPZ81YbHrehOo5PU1vGlZk3XVicGZ4svIJQUgtHkFLpXgu2uiwc+rpGUp/w9gn
	0Fyg==
X-Gm-Message-State: ALoCoQni/2swwgcTp5KdK8Zsh2Nwflu+4y01tC2r3y+SGPynumIxOUlA2eEmDVxr5/HJ/hII23nn
MIME-Version: 1.0
X-Received: by 10.202.97.130 with SMTP id v124mr45090180oib.34.1426507183661; 
	Mon, 16 Mar 2015 04:59:43 -0700 (PDT)
Received: by 10.60.99.6 with HTTP; Mon, 16 Mar 2015 04:59:43 -0700 (PDT)
In-Reply-To: <1426262721.9114.216.camel@linuxfoundation.org>
References: <1426258527-2329-1-git-send-email-naresh.bhat@linaro.org>
	<1426258527-2329-5-git-send-email-naresh.bhat@linaro.org>
	<1426262721.9114.216.camel@linuxfoundation.org>
Date: Mon, 16 Mar 2015 17:29:43 +0530
Message-ID: <CAFoFrHaq4htnj6+aniz0tNLsfOkJyRLFgMFPBVSmWdAgkbuD1w@mail.gmail.com>
From: Naresh Bhat <naresh.bhat@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Matt Fleming <matt.fleming@intel.com>,
	oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core v1 PATCH 4/5] grub: Update grub git recipe
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
X-List-Received-Date: Mon, 16 Mar 2015 11:59:45 -0000
Content-Type: multipart/alternative; boundary=001a113d5966f3baa30511669539

--001a113d5966f3baa30511669539
Content-Type: text/plain; charset=UTF-8

Hi Richard,

Thank you very much.

On 13 March 2015 at 21:35, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2015-03-13 at 20:25 +0530, Naresh Bhat wrote:
> > Update the grub git recipe with the following actions for native and
> target
> > - Base class extend to native
> > - do_configure_prepend
> > - do_install_append
> > - do_mkimage native
> > - do_deploy
> >
> > Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
> > ---
> >  meta/recipes-bsp/grub/grub_git.bb |   48
> +++++++++++++++++++++++++++++++------
> >  1 file changed, 41 insertions(+), 7 deletions(-)
>
> This commit message isn't up to the job. You listed some things you
> changed but didn't say why these are necessary or how this helps.


My apologies, I will try to update more description.


> Some
> of the changes in here may be better split up a bit too, there seems to
> be a lot going on.
>
I will appreciate if you point me to the changes which needs to be split
up.  I will definitely try to split up in my next series.

>
> > diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/
> grub_git.bb
> > index 3ab675b..a5ab649 100644
> > --- a/meta/recipes-bsp/grub/grub_git.bb
> > +++ b/meta/recipes-bsp/grub/grub_git.bb
> > @@ -8,6 +8,7 @@ DEFAULT_PREFERENCE_arm = "1"
> >  PV = "2.00+${SRCPV}"
> >  SRCREV = "87de66d9d83446ecddb29cfbdf7369102c8e209e"
> >  SRC_URI = "git://git.savannah.gnu.org/grub.git \
> > +           file://cfg \
> >             file://grub-2.00-fpmath-sse-387-fix.patch \
> >             file://autogen.sh-exclude-pc.patch \
> >             file://grub-2.00-add-oe-kernel.patch \
> > @@ -18,7 +19,7 @@ S = "${WORKDIR}/git"
> >
> >  COMPATIBLE_HOST =
> '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
> >
> > -inherit autotools gettext texinfo
> > +inherit autotools-brokensep gettext texinfo deploy
>
> Why do we need brokensep? It appears to work at the moment?
>
> >  PACKAGECONFIG ??= ""
> >  PACKAGECONFIG[grub-mount] =
> "--enable-grub-mount,--disable-grub-mount,fuse"
> > @@ -31,24 +32,57 @@ GRUBPLATFORM_arm = "uboot"
> >  GRUBPLATFORM_aarch64 = "efi"
> >  GRUBPLATFORM ??= "pc"
> >
> > +CACHED_CONFIGUREVARS += "ac_cv_path_HELP2MAN="
> >  EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} --disable-grub-mkfont
> --program-prefix="" \
> >                  --enable-liblzma=no --enable-device-mapper=no
> --enable-libzfs=no"
> >
> > +export ac_cv_path_HELP2MAN=""
> > +
>
> You need both an export and a CACHED_CONFIGUREVARS?
>

I am not very sure.  I will check and update. Thanks for pointing.


> >  do_configure_prepend() {
> > -    ( cd ${S}
> > -      ${S}/autogen.sh )
> > +      ./autogen.sh
> > +}
>
> This is probably why you now need brokensep. Why change the above?
>
Yes, this is the reason I need brokensep.  The recipe fails to build on our
luvOS distribution.

>
> > +
> > +do_install_append_class-native() {
> > +        install -m 755 -D grub-mkimage ${D}${bindir}
> >  }
> >
> > -do_install_append () {
> > -    install -d ${D}${sysconfdir}/grub.d
> > -
> > +do_install_append_class-target() {
> > +    # Search for the grub.cfg on the local boot media by using the
> > +    # built in cfg file provided via this recipe
> > +    grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
> > +        -O ${GRUB_TARGET}-${GRUBPLATFORM} -o ./${GRUB_IMAGE} \
> > +        boot linux ext2 fat serial part_msdos part_gpt \
> > +        normal efi_gop iso9660 search efinet tftp all_video chain \
> > +        gfxmenu jpeg gfxterm
> > +
> > +    install -m 0755 -D ${B}/${GRUB_IMAGE} ${D}${bindir}
> > +}
> > +
> > +GRUB_TARGET_aarch64 = "arm64"
> > +GRUB_IMAGE_aarch64 = "grubaa64.efi"
>
> What about the x86 case?
>
Right now the recipe builds for PC on x86 architecture. On x86 architecture
it is required to update.

>
> > +do_mkimage_class-native() {
> > +        :
> >  }
> >
> > +do_deploy() {
> > +    install -m 0755 -D ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
> > +}
> > +
> > +do_deploy_class-native() {
> > +        :
> > +}
> > +
> > +addtask deploy after do_install before do_build
>
> Why do we need to start deploying grub?
>
Probably I need to split up here.  Let me check

>
> >  # debugedit chokes on bare metal binaries
> >  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> >
> > -RDEPENDS_${PN} = "diffutils freetype"
> > +RDEPENDS_${PN}_class-target = "diffutils freetype"
> >  FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
> >
> >  INSANE_SKIP_${PN} = "arch"
> >  INSANE_SKIP_${PN}-dbg = "arch"
> > +
> > +DEPENDS_class-target += "grub-native"
>
> Why?
>
My mistake, If I understand properly the native recipe get build in first
place.  There is no need to add depends.

>
> > +BBCLASSEXTEND = "native"
>
> Cheers,
>
> Richard
>
>

--001a113d5966f3baa30511669539
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Richard,<br><br></div>Thank you very much.<br><div=
><div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 13 March=
 2015 at 21:35, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:rich=
ard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfound=
ation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><span class=3D"">On Fri, 2015-03-13 at 20:25 +0530, Naresh Bhat =
wrote:<br>
&gt; Update the grub git recipe with the following actions for native and t=
arget<br>
&gt; - Base class extend to native<br>
&gt; - do_configure_prepend<br>
&gt; - do_install_append<br>
&gt; - do_mkimage native<br>
&gt; - do_deploy<br>
&gt;<br>
&gt; Signed-off-by: Naresh Bhat &lt;<a href=3D"mailto:naresh.bhat@linaro.or=
g">naresh.bhat@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-bsp/grub/<a href=3D"http://grub_git.bb" target=3D"_=
blank">grub_git.bb</a> |=C2=A0 =C2=A048 +++++++++++++++++++++++++++++++----=
--<br>
&gt;=C2=A0 1 file changed, 41 insertions(+), 7 deletions(-)<br>
<br>
</span>This commit message isn&#39;t up to the job. You listed some things =
you<br>
changed but didn&#39;t say why these are necessary or how this helps. </blo=
ckquote><div><br>My apologies, I will try to update more description. <br>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Some<br>
of the changes in here may be better split up a bit too, there seems to<br>
be a lot going on.<br></blockquote><div>I will appreciate if you point me t=
o the changes which needs to be split up.=C2=A0 I will definitely try to sp=
lit up in my next series.<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<span class=3D""><br>
&gt; diff --git a/meta/recipes-bsp/grub/<a href=3D"http://grub_git.bb" targ=
et=3D"_blank">grub_git.bb</a> b/meta/recipes-bsp/grub/<a href=3D"http://gru=
b_git.bb" target=3D"_blank">grub_git.bb</a><br>
&gt; index 3ab675b..a5ab649 100644<br>
&gt; --- a/meta/recipes-bsp/grub/<a href=3D"http://grub_git.bb" target=3D"_=
blank">grub_git.bb</a><br>
&gt; +++ b/meta/recipes-bsp/grub/<a href=3D"http://grub_git.bb" target=3D"_=
blank">grub_git.bb</a><br>
&gt; @@ -8,6 +8,7 @@ DEFAULT_PREFERENCE_arm =3D &quot;1&quot;<br>
&gt;=C2=A0 PV =3D &quot;2.00+${SRCPV}&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;87de66d9d83446ecddb29cfbdf7369102c8e209e&quot;<=
br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://git.savannah.gnu.org/g=
rub.git" target=3D"_blank">git.savannah.gnu.org/grub.git</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cfg \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://grub-2.00-fpmath=
-sse-387-fix.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://autogen.sh-exclu=
de-pc.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://grub-2.00-add-oe=
-kernel.patch \<br>
&gt; @@ -18,7 +19,7 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt;=C2=A0 COMPATIBLE_HOST =3D &#39;(x86_64.*|i.86.*|arm.*|aarch64.*)-(linu=
x.*|freebsd.*)&#39;<br>
&gt;<br>
&gt; -inherit autotools gettext texinfo<br>
&gt; +inherit autotools-brokensep gettext texinfo deploy<br>
<br>
</span>Why do we need brokensep? It appears to work at the moment?<br>
<span class=3D""><br>
&gt;=C2=A0 PACKAGECONFIG ??=3D &quot;&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[grub-mount] =3D &quot;--enable-grub-mount,--disabl=
e-grub-mount,fuse&quot;<br>
&gt; @@ -31,24 +32,57 @@ GRUBPLATFORM_arm =3D &quot;uboot&quot;<br>
&gt;=C2=A0 GRUBPLATFORM_aarch64 =3D &quot;efi&quot;<br>
&gt;=C2=A0 GRUBPLATFORM ??=3D &quot;pc&quot;<br>
&gt;<br>
&gt; +CACHED_CONFIGUREVARS +=3D &quot;ac_cv_path_HELP2MAN=3D&quot;<br>
&gt;=C2=A0 EXTRA_OECONF =3D &quot;--with-platform=3D${GRUBPLATFORM} --disab=
le-grub-mkfont --program-prefix=3D&quot;&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable=
-liblzma=3Dno --enable-device-mapper=3Dno --enable-libzfs=3Dno&quot;<br>
&gt;<br>
&gt; +export ac_cv_path_HELP2MAN=3D&quot;&quot;<br>
&gt; +<br>
<br>
</span>You need both an export and a CACHED_CONFIGUREVARS?<br></blockquote>=
<div><br>I am not very sure.=C2=A0 I will check and update. Thanks for poin=
ting.<br><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D""><br>
&gt;=C2=A0 do_configure_prepend() {<br>
&gt; -=C2=A0 =C2=A0 ( cd ${S}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 ${S}/autogen.sh )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 ./autogen.sh<br>
&gt; +}<br>
<br>
</span>This is probably why you now need brokensep. Why change the above?<b=
r></blockquote><div>Yes, this is the reason I need brokensep.=C2=A0 The rec=
ipe fails to build on our luvOS distribution.<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<span class=3D""><br>
&gt; +<br>
&gt; +do_install_append_class-native() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 755 -D grub-mkimage ${D}${bind=
ir}<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -do_install_append () {<br>
&gt; -=C2=A0 =C2=A0 install -d ${D}${sysconfdir}/grub.d<br>
&gt; -<br>
&gt; +do_install_append_class-target() {<br>
&gt; +=C2=A0 =C2=A0 # Search for the grub.cfg on the local boot media by us=
ing the<br>
&gt; +=C2=A0 =C2=A0 # built in cfg file provided via this recipe<br>
&gt; +=C2=A0 =C2=A0 grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -O ${GRUB_TARGET}-${GRUBPLATFORM} -o ./${=
GRUB_IMAGE} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 boot linux ext2 fat serial part_msdos par=
t_gpt \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 normal efi_gop iso9660 search efinet tftp=
 all_video chain \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gfxmenu jpeg gfxterm<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 install -m 0755 -D ${B}/${GRUB_IMAGE} ${D}${bindir}<br>
&gt; +}<br>
&gt; +<br>
&gt; +GRUB_TARGET_aarch64 =3D &quot;arm64&quot;<br>
&gt; +GRUB_IMAGE_aarch64 =3D &quot;grubaa64.efi&quot;<br>
<br>
</span>What about the x86 case?<br></blockquote><div>Right now the recipe b=
uilds for PC on x86 architecture. On x86 architecture it is required to upd=
ate.=C2=A0 <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<span class=3D""><br>
&gt; +do_mkimage_class-native() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 :<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +do_deploy() {<br>
&gt; +=C2=A0 =C2=A0 install -m 0755 -D ${B}/${GRUB_IMAGE} ${DEPLOYDIR}<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_deploy_class-native() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 :<br>
&gt; +}<br>
&gt; +<br>
&gt; +addtask deploy after do_install before do_build<br>
<br>
</span>Why do we need to start deploying grub?<br></blockquote><div>Probabl=
y I need to split up here.=C2=A0 Let me check <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<span class=3D""><br>
&gt;=C2=A0 # debugedit chokes on bare metal binaries<br>
&gt;=C2=A0 INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
&gt;<br>
&gt; -RDEPENDS_${PN} =3D &quot;diffutils freetype&quot;<br>
&gt; +RDEPENDS_${PN}_class-target =3D &quot;diffutils freetype&quot;<br>
&gt;=C2=A0 FILES_${PN}-dbg +=3D &quot;${libdir}/${BPN}/*/.debug&quot;<br>
&gt;<br>
&gt;=C2=A0 INSANE_SKIP_${PN} =3D &quot;arch&quot;<br>
&gt;=C2=A0 INSANE_SKIP_${PN}-dbg =3D &quot;arch&quot;<br>
&gt; +<br>
&gt; +DEPENDS_class-target +=3D &quot;grub-native&quot;<br>
<br>
</span>Why?<br></blockquote><div>My mistake, If I understand properly the n=
ative recipe get build in first place.=C2=A0 There is no need to add depend=
s. <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br></div></div></div></div>

--001a113d5966f3baa30511669539--
