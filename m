Return-Path: <vomegaz@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0F3C571B1D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 08:05:45 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id 101so70159ioj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 01:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JjAVifSXjAC5bBKgK+JFA/mHB3oop/1Eu9vbfcaZXjY=;
	b=NrtpF+b9dC+BAXH9Ci48r7IyCo/S4zBYQc+k0rXoCPk3MAbRSKa5Hv0FrxtaKIT5+9
	kA4mZMFGTrqLnyhEI42cFjth6E/XWluZ6c/JE9XtBvBYHsPvx1I0wQlQCy/wp58n5Jt8
	10DVHH4JNQ5dWMwZDw/z78jK6H1V+LT+hDKyIRpFL9wFPwTu3rdSQwnImgVAPqlbKkYi
	pJVCnEoO5BdcNxwAzME+zsImsP1LiooSFRF/9brOW5L+QeOKN3qj3zGp7hcg2DhUotmx
	ov9H7v6SfpPghzlDJKTNV+3yChDbcw8CZEFw2Ny3B+9HbTGB9yrh+RgJLPrtTiWb/8Cq
	iZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=JjAVifSXjAC5bBKgK+JFA/mHB3oop/1Eu9vbfcaZXjY=;
	b=VnAsjF8/vR3wjEcPgl0crWoHHyFKXPlQdQvoipsxHlgXrAi6SJwRzJgZCfMfShXm/b
	zAJxdhe1WfY4UtbP3ELKnPSQATMTXAOkMNLRvhV2/ktJ7TIr8fUjDvw7DYOt1pm0ZpM2
	6kpNuRYMhGNhjEOfJSZT77LSbs9voHnGPATN1IRZiIC3FbhFxQVKXEBvdhHiKOy0kin6
	6S2OKR8Bkr0b4Owh+7/DGnKWXJsyJsuO8wIU9E95isWWgd7+UVCAPfK9wLRvtlbbHh93
	XEHjdFwBXdwqm11NTX1QP6Pz72gqFjnz5tKIB9ZEkWqLlwni7jSMUgz0ah1hgj8fY/0s
	WPMQ==
X-Gm-Message-State: AMCzsaVK2GlxavONyB1894PaUxGq//heoSDwPww8/NroQ4PqeCCB81OI
	4hIW9kcqy3ebWJyn7x+ej1u0L5VMNel0SkB6Fso=
X-Google-Smtp-Source: ABhQp+Sxdqsjgi5bPI6WvbjPV18lM3rMDsO4nhoBcnyL+zURzAJa/GVovRLbfnaZbrllbSBBTmFHp+WPreirmY04Rs4=
X-Received: by 10.107.150.20 with SMTP id y20mr8571572iod.212.1508918747060;
	Wed, 25 Oct 2017 01:05:47 -0700 (PDT)
MIME-Version: 1.0
Reply-To: thomas.perrot@tupi.fr
Sender: vomegaz@gmail.com
Received: by 10.107.167.211 with HTTP; Wed, 25 Oct 2017 01:05:06 -0700 (PDT)
In-Reply-To: <1f7a9ec0-9493-140d-d811-e7782d52b7fa@gmail.com>
References: <20171020094709.27155-1-thomas.perrot@tupi.fr>
	<1f7a9ec0-9493-140d-d811-e7782d52b7fa@gmail.com>
From: Thomas PERROT <thomas.perrot@tupi.fr>
Date: Wed, 25 Oct 2017 10:05:06 +0200
X-Google-Sender-Auth: Os5KTgMBnMozI6Q5coMO9SOBYA4
Message-ID: <CAGXeWgmz8WV9Y4z2Sp6e=rYArQfNcpkB+Fqf=RpOK=u4K-CM=A@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta][pyro][PATCHv2] Fix some issues in the fitImage generation
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
X-List-Received-Date: Wed, 25 Oct 2017 08:05:46 -0000
Content-Type: multipart/alternative; boundary="001a11403262e9e23c055c5a85a8"

--001a11403262e9e23c055c5a85a8
Content-Type: text/plain; charset="UTF-8"

Hi,

It's done, I just submit the path for the master branch.

Best regards,
Thomas P.

On Tue, Oct 24, 2017 at 9:38 AM, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 10/20/2017 02:47 AM, Thomas Perrot wrote:
> > - Bad image type replacement for aarch64
> > - Fix DTB path in fitimage.its
> > - Ignore fitImage type in do_bundle_initramfs task because the packaging
> is made by do_assemble_fitimage_initramfs
> > - the images for arm64 are not compressed the linux_comp variable must
> therefore be none
> >
> > Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
> > ---
> >  meta/classes/kernel-fitimage.bbclass |  6 +++++-
> >  meta/classes/kernel-uboot.bbclass    | 11 ++++++++---
> >  meta/classes/kernel.bbclass          |  4 +++-
> I don't see this in master. Please resubmit for Master.
>
> - armin
> >  3 files changed, 16 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-
> fitimage.bbclass
> > index 2630b47316..abbc309b09 100644
> > --- a/meta/classes/kernel-fitimage.bbclass
> > +++ b/meta/classes/kernel-fitimage.bbclass
> > @@ -7,8 +7,11 @@ python __anonymous () {
> >          depends = "%s u-boot-mkimage-native dtc-native" % depends
> >          d.setVar("DEPENDS", depends)
> >
> > -        if d.getVar("UBOOT_ARCH") == "x86":
> > +        uarch = d.getVar("UBOOT_ARCH")
> > +        if uarch == "x86":
> >              replacementtype = "bzImage"
> > +        elif uarch == "arm64":
> > +            replacementtype = "Image"
> >          else:
> >              replacementtype = "zImage"
> >
> > @@ -351,6 +354,7 @@ fitimage_assemble() {
> >                               DTB_PATH="arch/${ARCH}/boot/${DTB}"
> >                       fi
> >
> > +                     DTB=$(echo "${DTB}" | tr '/' '_')
> >                       DTBS="${DTBS} ${DTB}"
> >                       fitimage_emit_section_dtb ${1} ${DTB} ${DTB_PATH}
> >               done
> > diff --git a/meta/classes/kernel-uboot.bbclass
> b/meta/classes/kernel-uboot.bbclass
> > index 868e97d7a7..940f91d90e 100644
> > --- a/meta/classes/kernel-uboot.bbclass
> > +++ b/meta/classes/kernel-uboot.bbclass
> > @@ -1,12 +1,17 @@
> >  uboot_prep_kimage() {
> > -     if [ -e arch/${ARCH}/boot/compressed/vmlinux ]; then
> > +     if [ -e arch/${ARCH}/boot/compressed/vmlinux ] ; then
> >               vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
> >               linux_suffix=""
> >               linux_comp="none"
> >       else
> >               vmlinux_path="vmlinux"
> > -             linux_suffix=".gz"
> > -             linux_comp="gzip"
> > +             if [ "${ARCH}" = "arm64" ] ; then
> > +                     linux_suffix=""
> > +                     linux_comp="none"
> > +             else
> > +                     linux_suffix=".gz"
> > +                     linux_comp="gzip"
> > +             fi
> >       fi
> >
> >       ${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}"
> linux.bin
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index ce2cab65ae..14677ac0fc 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -219,7 +219,9 @@ do_bundle_initramfs () {
> >               # Backing up kernel image relies on its type(regular file
> or symbolic link)
> >               tmp_path=""
> >               for type in ${KERNEL_IMAGETYPES} ; do
> > -                     if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
> > +                     if [ "$type" = "fitImage" ] ; then
> > +                             continue
> > +                     elif [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
> >                               linkpath=`readlink -n
> ${KERNEL_OUTPUT_DIR}/$type`
> >                               realpath=`readlink -fn
> ${KERNEL_OUTPUT_DIR}/$type`
> >                               mv -f $realpath $realpath.bak
>
>

--001a11403262e9e23c055c5a85a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi,<br><br></div><span id=3D"gmail-result_b=
ox" class=3D"gmail-" tabindex=3D"-1" lang=3D"en"><span>It&#39;s done, I jus=
t submit the path for the master branch.<br><br></span></span></div><span i=
d=3D"gmail-result_box" class=3D"gmail-" tabindex=3D"-1" lang=3D"en"><span>B=
est regards,<br></span></span></div><span id=3D"gmail-result_box" class=3D"=
gmail-" tabindex=3D"-1" lang=3D"en"><span>Thomas P.<br><br></span></span>On=
 Tue, Oct 24, 2017 at 9:38 AM, akuster808 <span dir=3D"ltr">&lt;<a href=3D"=
mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;=
</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><span class=3D""><br>
<br>
On 10/20/2017 02:47 AM, Thomas Perrot wrote:<br>
&gt; - Bad image type replacement for aarch64<br>
&gt; - Fix DTB path in fitimage.its<br>
&gt; - Ignore fitImage type in do_bundle_initramfs task because the packagi=
ng is made by do_assemble_fitimage_initramfs<br>
&gt; - the images for arm64 are not compressed the linux_comp variable must=
 therefore be none<br>
&gt;<br>
&gt; Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@tupi.=
fr">thomas.perrot@tupi.fr</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/kernel-fitimage.<wbr>bbclass |=C2=A0 6 +++++-<br>
&gt;=C2=A0 meta/classes/kernel-uboot.<wbr>bbclass=C2=A0 =C2=A0 | 11 +++++++=
+---<br>
&gt;=C2=A0 meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 +++-<br>
</span>I don&#39;t see this in master. Please resubmit for Master.<br>
<br>
- armin<br>
<div class=3D"HOEnZb"><div class=3D"h5">&gt;=C2=A0 3 files changed, 16 inse=
rtions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/kernel-<wbr>fitimage.bbclass b/meta/classes/=
kernel-<wbr>fitimage.bbclass<br>
&gt; index 2630b47316..abbc309b09 100644<br>
&gt; --- a/meta/classes/kernel-<wbr>fitimage.bbclass<br>
&gt; +++ b/meta/classes/kernel-<wbr>fitimage.bbclass<br>
&gt; @@ -7,8 +7,11 @@ python __anonymous () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depends =3D &quot;%s u-boot-mkimage-=
native dtc-native&quot; % depends<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;DEPENDS&quot;, depend=
s)<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&quot;UBOOT_ARCH&quot;) =3D=
=3D &quot;x86&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uarch =3D d.getVar(&quot;UBOOT_ARCH&quot;=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if uarch =3D=3D &quot;x86&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 replacementtype =3D &q=
uot;bzImage&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif uarch =3D=3D &quot;arm64&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 replacementtype =3D &quot;I=
mage&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 replacementtype =3D &q=
uot;zImage&quot;<br>
&gt;<br>
&gt; @@ -351,6 +354,7 @@ fitimage_assemble() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DTB_PATH=3D&quot;arch/${ARCH}/boot=
/${<wbr>DTB}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0fi<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DTB=3D$(echo &quot;${DTB}&quot; | tr &#39;/&#39; &#39;_&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0DTBS=3D&quot;${DTBS} ${DTB}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0fitimage_emit_section_dtb ${1} ${DTB} ${DTB_PATH}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt; diff --git a/meta/classes/kernel-uboot.<wbr>bbclass b/meta/classes/ker=
nel-uboot.<wbr>bbclass<br>
&gt; index 868e97d7a7..940f91d90e 100644<br>
&gt; --- a/meta/classes/kernel-uboot.<wbr>bbclass<br>
&gt; +++ b/meta/classes/kernel-uboot.<wbr>bbclass<br>
&gt; @@ -1,12 +1,17 @@<br>
&gt;=C2=A0 uboot_prep_kimage() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if [ -e arch/${ARCH}/boot/compressed/<wbr>vmlinux=
 ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ -e arch/${ARCH}/boot/compressed/<wbr>vmlinux=
 ] ; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmlinux_path=3D&=
quot;arch/${ARCH}/<wbr>boot/compressed/vmlinux&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux_suffix=3D&=
quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux_comp=3D&qu=
ot;none&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmlinux_path=3D&=
quot;vmlinux&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux_suffix=3D&quot;=
.gz&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux_comp=3D&quot;gz=
ip&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${ARCH}&qu=
ot; =3D &quot;arm64&quot; ] ; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0linux_suffix=3D&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0linux_comp=3D&quot;none&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0linux_suffix=3D&quot;.gz&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0linux_comp=3D&quot;gzip&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0${OBJCOPY} -O binary -R .note -R .comment -S=
 &quot;${vmlinux_path}&quot; linux.bin<br>
&gt; diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass=
<br>
&gt; index ce2cab65ae..14677ac0fc 100644<br>
&gt; --- a/meta/classes/kernel.bbclass<br>
&gt; +++ b/meta/classes/kernel.bbclass<br>
&gt; @@ -219,7 +219,9 @@ do_bundle_initramfs () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Backing up ker=
nel image relies on its type(regular file or symbolic link)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp_path=3D&quot=
;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${KE=
RNEL_IMAGETYPES} ; do<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if [ &quot;$type&quot; =3D &quot;fitImage&quot; ] ; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0elif [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linkpath=3D`readlink -n ${KERNEL_O=
UTPUT_DIR}/$type`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0realpath=3D`readlink -fn ${KERNEL_=
OUTPUT_DIR}/$type`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -f $realpath $realpath.bak<br>
<br>
</div></div></blockquote></div><br></div></div>

--001a11403262e9e23c055c5a85a8--
