Return-Path: <leon@sidebranch.com>
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45])
	by mail.openembedded.org (Postfix) with ESMTP id 698887964D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 09:40:32 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id z27-v6so1322646edb.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 02:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=U7p048CUMJSWRUMao2qebdzRnyPdkcYJjLmQ9UnN0Io=;
	b=tuy6efjy7CjaUO/qKnZKeGDdBVIy2k+u8Nb9TkFkZViLDV2OhVK4aI9fDsfslzInia
	PEtt6cBieHFHyYqc70HNA3jRZf+Oo8S3IesQbg4guxhwvZQJj3S65nNbsOPj+SJ3o5w0
	q5tAZQifEfbOiy3XW8i05/Q0E8oVAr7AOcI3fL98xko89hcqNSoVKw5QHP50mCR/B2RF
	5/J6OasPIvEmrQnJJh5BCewp5NeYYvJK3a4B3l9eHYqPrQr6e0qvEkw7bw8SnjPP/3en
	tk94kYYefEEJnVBIy9lvhipsonPTaezdbDKNpbE0Zo6qN+DQLuR9SSSkpgwfVpCArmYV
	v3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=U7p048CUMJSWRUMao2qebdzRnyPdkcYJjLmQ9UnN0Io=;
	b=dIOxHZrcY1HP0PgQ5EbryM+ynXqZNmHxf/+F2oFn7E2DCaQp7iQ3YwJNJ7HG98kMDF
	QP+mURwl2qXV4Sy1KgzaYK2DmbEXrQod1iScWx3jemRr8PF8WlsJANPFI0YqYCmAcIU9
	5TB+SR2kbuiW9To3Cncv72ASrl/DznyzG86A63l0+5gjw1PakhuBlnqjHNqFjOeXEJ/1
	7wZSmZH/MbF8+vE3mChDM4XqL5I245P7OUgIJ9zvID3ShdHp+ORylToH7bFlX5mPas5q
	fogKOFJERz++77gH4eRgl3bPOG/NeYxi+8o4P5g0vx00ZgNerOa/vwLSVLdnhgSWJ9DW
	CeHQ==
X-Gm-Message-State: APzg51DBsP8wmpsYsEd4UvfEg7YxZOngHTCpHlzp5erPsHV8TFpaJ5xn
	nRe8HkKH1T+bRJqtqKJXiQx7C+vZL0qYddOLHh70yVMd
X-Google-Smtp-Source: ANB0VdZo8YKatkT0mxlsEGBA2QY2iHHPZyc/6a1EWgcGuAWwZen8eKcJSdXZwUG0j+fTA8aHYypB9Qm2fhQ0JyWyJlE=
X-Received: by 2002:a50:b764:: with SMTP id
	g91-v6mr48152810ede.187.1537263632908; 
	Tue, 18 Sep 2018 02:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <1536616603-9502-1-git-send-email-leon@sidebranch.com>
	<CAO5Uq5S43E3cXUSEVJP8-dKtuqR-XaqrN+6fhHfy6QESLRh7_w@mail.gmail.com>
	<AB33E724-81C2-43BC-8169-6100CABAA375@sidebranch.com>
	<CAO5Uq5ToXbUR2Pv9PwQOPp-F+5CbwvuPwy84Kfz7HWUzx2ohFA@mail.gmail.com>
	<CAO5Uq5Rws0YP5_y-CSXhKKSrHe1BZiSQsYFQHH9AABFgjKWv=g@mail.gmail.com>
	<4F5C8364-78D3-41EF-B239-B641651A2F64@sidebranch.com>
	<CAO5Uq5TMF-dTZA=dS4QqioRGvycNWeZHC_QWh6FViohLrAy76w@mail.gmail.com>
In-Reply-To: <CAO5Uq5TMF-dTZA=dS4QqioRGvycNWeZHC_QWh6FViohLrAy76w@mail.gmail.com>
From: Leon Woestenberg <leon@sidebranch.com>
Date: Tue, 18 Sep 2018 11:40:21 +0200
Message-ID: <CAMjhiJi9awJ-WVs+Y4V=cqy8JT+qbb=5txQzFVM741inkmzFuQ@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>, Marek Vasut <marex@denx.de>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] kernel.bbclass: do not deploy fitImage; kernel-fitimage.bbclass does that.
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
X-List-Received-Date: Tue, 18 Sep 2018 09:40:33 -0000
Content-Type: multipart/alternative; boundary="000000000000c40fa40576221443"

--000000000000c40fa40576221443
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Adding Marek Vasut, original author of kernel-fitimage.bbclass.

> I guess the reason that the deployment happens in kernel.bbclass is so
> you only have all the symlinking logic in one place

The deployment happens in both kernel.bbclass and kernel-fitimage.bbclass.
That was exactly one of the bugs I wanted to solve. I am not sure what the
intention was, though.

Marek: can you comment of the exact purpose of the deploy task in
kernel-fitimage.bbclass?
Which class should deploy the FIT images themselves?

Whilst cleaning things up, my understanding was that
kernel_do_deploy_append() in kernel-fitimage.bbclass deploys the fitImages,
along with the .its file etc.
Maybe I was mistaken.

I have several other fixed piled up; for example initramfs's supposed to
get bundled inside the kernel get also packed into the FIT; this takes
double the amount of space in the FIT image...

Regards,

Leon.




On Tue, Sep 18, 2018 at 8:10 AM Alex Kiernan <alex.kiernan@gmail.com> wrote=
:

> Thanks Leon
>
> I guess the reason that the deployment happens in kernel.bbclass is so
> you only have all the symlinking logic in one place.
>
> Are in agreement that this change should be reverted and the
> "fitImage" deployed here:
>
>
> http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fi=
timage.bbclass#n495
>
> is the one which we should remove?
> On Mon, Sep 17, 2018 at 7:05 PM Leon Woestenberg <leon@sidebranch.com>
> wrote:
> >
> > Hi Alex,
> >
> > I expected it to be kernel-fitimage.bbclass=E2=80=99s responsibility to=
 deploy
> the fitImage.
> >
> > Regards, Leon
> >
> >
> >
> >
> > On 16 Sep 2018, at 16:22, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> > On Sun, Sep 16, 2018 at 11:41 AM Alex Kiernan <alex.kiernan@gmail.com>
> wrote:
> >
> >
> > Hi Leon
> >
> >
> > On Sun, Sep 16, 2018 at 10:18 AM Leon Woestenberg <leon@sidebranch.com>
> wrote:
> >
> >
> > Hi Alex,
> >
> >
> > On 15 Sep 2018, at 19:45, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> >
> > On Mon, Sep 10, 2018 at 10:57 PM Leon Woestenberg <leon@sidebranch.com>
> wrote:
> >
> >
> > kernel-fitimage.bbclass replaces an occurance of "fitImage" in
> >
> > KERNEL_IMAGETYPE_FOR_MAKE by an image type that is buildable for the
> >
> > architecture (such as zImage). The kernel-fitimage.bbclass packs that
> >
> > image as sub-image in a flattened image tree image (fitImage) and
> >
> > deploys this fitImage along with the image tree source file (.its).
> >
> >
> > kernel-fitimage.bbclass does not alter KERNEL_IMAGETYPES, which thus
> >
> > also contains "fitImage", which kernel.bbclass will also deploy
> >
> > redundantly with different naming.
> >
> >
> > The result is a dual deployment with slightly different naming,
> >
> > each with a set of symlinks.
> >
> >
> > The solution chosen is to have fitImage deployment be handled by
> >
> > kernel-fitimage.bbclass, and have kernel.bbclass ignore fitImage
> >
> > types during deployment.
> >
> >
> > Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
> >
> >
> > This looks completely plausible, but the two "FIT" images that are
> >
> > installed aren't identical... after this I end up with no FIT image
> >
> > and only a bare image in the deploy dir.
> >
> >
> > What was in your KERNEL_IMAGETYPES? Did it at least contain =E2=80=9Cfi=
tImage=E2=80=9D??
> >
> >
> >
> > Yes, in fact only fitImage (and no initramfs).
> >
> >
> > Digging into it, the logic between the two classes is a bit odd... in
> >
> > the case of a non initramfs build, the fitImage is actually installed
> >
> > here.
> >
> >
> > If =E2=80=98here=E2=80=99 means kernel-fitimage, then I=E2=80=99ld say =
ALL versions of a FIT
> image containing AT LEAST a Linux kernel are installed by kernel-fitimage=
.
> >
> >
> > The one that's installed in kernel-fitimage is the bare
> >
> > linux.bin, but named fitImage-...
> >
> >
> > which is totally broken. If you want the bare kernel binary (which
> naming depends on architecture, so it should NOT be hard-coded to linux.b=
in
> anyway), you would need to specify that type *also* in KERNEL_IMAGETYPES,
> next to =E2=80=9CfitImage=E2=80=9D.
> >
> >
> > Totally agree...
> >
> >
> >
> > I'll send a patch reverting this and removing the other one as I'd
> >
> > agree that it appears to have no purpose (and if you did want it, I
> >
> > guess you could list it in KERNEL_IMAGETYPES).
> >
> >
> > I=E2=80=99m sorry I cannot follow what this and the other one is, and i=
t. Let=E2=80=99s
> first understand all cases correctly.
> >
> >
> >
> > Sorry I've not described it well... the code in
> >
> > kernel-fitimage.bbclass that inserts the kernel into the its happens
> >
> > here
> http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fi=
timage.bbclass#n371
> >
> >
> > fitimage_emit_section_kernel ${1} "${kernelcount}" linux.bin
> "${linux_comp}"
> >
> >
> > inside fitimage_emit_section_kernel we create a kernel section which
> >
> > has `data =3D /incbin/("${3}");` so linux.bin is our bare image.
> >
> >
> > Then we have the installation of fitImage-linux-bin that happens here
> >
> >
> http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fi=
timage.bbclass#n495
> >
> >
> > echo "Copying linux.bin file..."
> >
> > install -m 0644 ${B}/linux.bin
> >
> > ${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
> >
> > ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
> >
> > ${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}
> >
> >
> > i.e. the bare linux.bin file which we used to pack into the FIT image,
> >
> > not a fitImage.
> >
> >
> > The output FIT image from kernel-fitimage.bbclass is created here
> >
> >
> http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fi=
timage.bbclass#n450
> >
> >
> > uboot-mkimage \
> >
> > ${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}')
> else ''} \
> >
> >  -f ${1} \
> >
> >  arch/${ARCH}/boot/${2}
> >
> >
> > i.e. in arch/${ARCH}/boot/${2}
> >
> >
> > It's that image which is then picked up by kernel.bbclass to install
> >
> > into deploydir (because KERNEL_OUTPUT_DIR ?=3D "arch/${ARCH}/boot"):
> >
> >
> > for imageType in ${KERNEL_IMAGETYPES} ; do
> >
> >  # kernel-fitimage class deploys fitImages, skip here
> >
> >  if [ "$imageType" !=3D "fitImage" ]; then
> >
> >    base_name=3D${imageType}-${KERNEL_IMAGE_NAME}
> >
> >    install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}
> >
> > $deployDir/${base_name}.bin
> >
> >  fi
> >
> > done
> >
> >
> > Only it's doesn't because of the filter against fitImage.
> >
> >
> >
> > To check I'm not seeing some strange artefact of our BSP or
> > linux-ti-staging (or any other layer we're using):
> >
> > $ git clone git://git.yoctoproject.org/poky
> > $ cd poky
> > $ . oe-init-build-env
> > $ cat << EOF >> conf/local.conf
> > MACHINE =3D "beaglebone-yocto"
> > KERNEL_CLASSES +=3D " kernel-fitimage"
> > KERNEL_IMAGETYPES =3D "fitImage"
> > EOF
> > $ bitbake linux-yocto
> >
> > The FIT images we then have:
> >
> > $ find tmp/deploy/images/beaglebone-yocto -name 'fit*.bin' -type f
> >
> tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+734172=
0391_eba03655e8-r0-beaglebone-yocto-20180916134100.bin
> >
> > And what is:
> >
> > $ bitbake u-boot-mkimage-native -caddto_recipe_sysroot
> > $ oe-run-native u-boot-mkimage-native mkimage -l
> >
> tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+734172=
0391_eba03655e8-r0-beaglebone-yocto-20180916134100.bin
> > Running bitbake -e u-boot-mkimage-native
> > GP Header: Size a0e1 LoadAddr a0e1
> >
> > Revert c2d00e2f83cdf3d2923660448756ed29296a06a6 and try again:
> >
> > $ git revert c2d00e2f83cdf3d2923660448756ed29296a06a6
> > $ bitbake linux-yocto
> >
> > This time there's two images:
> >
> > $ find tmp/deploy/images/beaglebone-yocto -name 'fit*.bin' -type f
> >
> tmp/deploy/images/beaglebone-yocto/fitImage--4.18.3+git0+7341720391_eba03=
655e8-r0-beaglebone-yocto-20180916141923.bin
> >
> tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+734172=
0391_eba03655e8-r0-beaglebone-yocto-20180916141923.bin
> >
> > And what they are:
> >
> > $ oe-run-native u-boot-mkimage-native mkimage -l
> >
> tmp/deploy/images/beaglebone-yocto/fitImage--4.18.3+git0+7341720391_eba03=
655e8-r0-beaglebone-yocto-20180916141923.bin
> > Running bitbake -e u-boot-mkimage-native
> > FIT description: U-Boot fitImage for Poky (Yocto Project Reference
> > Distro)/4.18.3+gitAUTOINC+7341720391_eba03655e8/beaglebone-yocto
> > Created:         Sun Sep 16 14:14:47 2018
> > Image 0 (kernel@1)
> >  Description:  Linux kernel
> >  Created:      Sun Sep 16 14:14:47 2018
> >  Type:         Kernel Image
> >  Compression:  uncompressed
> >  Data Size:    6381368 Bytes =3D 6231.80 KiB =3D 6.09 MiB
> >  Architecture: ARM
> >  OS:           Linux
> >  Load Address: 0x80008000
> >  Entry Point:  0x80008000
> >  Hash algo:    sha1
> >  Hash value:   909137524ffd28b5b0ac51ea39c648b09902dc18
> > Image 1 (fdt@am335x-bone.dtb)
> >  Description:  Flattened Device Tree blob
> >  Created:      Sun Sep 16 14:14:47 2018
> >  Type:         Flat Device Tree
> >  Compression:  uncompressed
> >  Data Size:    33030 Bytes =3D 32.26 KiB =3D 0.03 MiB
> >  Architecture: ARM
> >  Hash algo:    sha1
> >  Hash value:   0fece12f15fc5ac6c452d9308cd374c2c0cfea47
> > Image 2 (fdt@am335x-boneblack.dtb)
> >  Description:  Flattened Device Tree blob
> >  Created:      Sun Sep 16 14:14:47 2018
> >  Type:         Flat Device Tree
> >  Compression:  uncompressed
> >  Data Size:    34782 Bytes =3D 33.97 KiB =3D 0.03 MiB
> >  Architecture: ARM
> >  Hash algo:    sha1
> >  Hash value:   337f6843020cb8fbaf119b43fd748222d32e72df
> > Image 3 (fdt@am335x-bonegreen.dtb)
> >  Description:  Flattened Device Tree blob
> >  Created:      Sun Sep 16 14:14:47 2018
> >  Type:         Flat Device Tree
> >  Compression:  uncompressed
> >  Data Size:    33286 Bytes =3D 32.51 KiB =3D 0.03 MiB
> >  Architecture: ARM
> >  Hash algo:    sha1
> >  Hash value:   4974e8b1656cd7f52829ac3c01f6747bece87cbc
> > Default Configuration: 'conf@am335x-bone.dtb'
> > Configuration 0 (conf@am335x-bone.dtb)
> >  Description:  1 Linux kernel, FDT blob
> >  Kernel:       kernel@1
> >  FDT:          fdt@am335x-bone.dtb
> >  Hash algo:    sha1
> >  Hash value:   unavailable
> > Configuration 1 (conf@am335x-boneblack.dtb)
> >  Description:  0 Linux kernel, FDT blob
> >  Kernel:       kernel@1
> >  FDT:          fdt@am335x-boneblack.dtb
> >  Hash algo:    sha1
> >  Hash value:   unavailable
> > Configuration 2 (conf@am335x-bonegreen.dtb)
> >  Description:  0 Linux kernel, FDT blob
> >  Kernel:       kernel@1
> >  FDT:          fdt@am335x-bonegreen.dtb
> >  Hash algo:    sha1
> >  Hash value:   unavailable
> > $ oe-run-native u-boot-mkimage-native mkimage -l
> >
> tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+734172=
0391_eba03655e8-r0-beaglebone-yocto-20180916141923.bin
> > Running bitbake -e u-boot-mkimage-native
> > GP Header: Size a0e1 LoadAddr a0e1
> >
> > --
> > Alex Kiernan
>
>
>
> --
> Alex Kiernan
>


--=20
Leon Woestenberg
leon@sidebranch.com
T: +31 40 711 42 76
M: +31 6 472 30 372

Sidebranch
Embedded Systems
Eindhoven, The Netherlands
http://www.sidebranch.com

--000000000000c40fa40576221443
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Alex,</div><div><br></div><div>Ad=
ding Marek Vasut, original author of kernel-fitimage.bbclass.<br></div><div=
><br></div><div>&gt; I guess the reason that the deployment happens in kern=
el.bbclass is so<br>
&gt; you only have all the symlinking logic in one place</div><div><br></di=
v><div>The deployment happens in both kernel.bbclass and kernel-fitimage.bb=
class. That was exactly one of the bugs I wanted to solve. I am not sure wh=
at the intention was, though.<br></div><div><br></div><div>Marek: can you c=
omment of the exact purpose of the deploy task in kernel-fitimage.bbclass? =
<br></div><div>Which class should deploy the FIT images themselves?<br></di=
v><div><br></div><div>Whilst cleaning things up, my understanding was that =
kernel_do_deploy_append() in kernel-fitimage.bbclass deploys the fitImages,=
 along with the .its file etc.</div><div>Maybe I was mistaken.</div></div><=
div dir=3D"ltr"><br></div><div>I have several other fixed piled up; for exa=
mple initramfs&#39;s supposed to get bundled inside the kernel get also pac=
ked into the FIT; this takes double the amount of space in the FIT image...=
</div><div><br></div><div>Regards,</div><div><br></div><div>Leon.<br></div>=
<div dir=3D"ltr"><br><div><br></div><div><br></div></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr">On Tue, Sep 18, 2018 at 8:10 AM Alex Ki=
ernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com" target=3D"_blank">alex.=
kiernan@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Th=
anks Leon<br>
<br>
I guess the reason that the deployment happens in kernel.bbclass is so<br>
you only have all the symlinking logic in one place.<br>
<br>
Are in agreement that this change should be reverted and the<br>
&quot;fitImage&quot; deployed here:<br>
<br>
<a href=3D"http://git.openembedded.org/openembedded-core/tree/meta/classes/=
kernel-fitimage.bbclass#n495" rel=3D"noreferrer" target=3D"_blank">http://g=
it.openembedded.org/openembedded-core/tree/meta/classes/kernel-fitimage.bbc=
lass#n495</a><br>
<br>
is the one which we should remove?<br>
On Mon, Sep 17, 2018 at 7:05 PM Leon Woestenberg &lt;<a href=3D"mailto:leon=
@sidebranch.com" target=3D"_blank">leon@sidebranch.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Alex,<br>
&gt;<br>
&gt; I expected it to be kernel-fitimage.bbclass=E2=80=99s responsibility t=
o deploy the fitImage.<br>
&gt;<br>
&gt; Regards, Leon<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On 16 Sep 2018, at 16:22, Alex Kiernan &lt;<a href=3D"mailto:alex.kier=
nan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sun, Sep 16, 2018 at 11:41 AM Alex Kiernan &lt;<a href=3D"mailto:al=
ex.kiernan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt;<br>
&gt; Hi Leon<br>
&gt;<br>
&gt;<br>
&gt; On Sun, Sep 16, 2018 at 10:18 AM Leon Woestenberg &lt;<a href=3D"mailt=
o:leon@sidebranch.com" target=3D"_blank">leon@sidebranch.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt;<br>
&gt; Hi Alex,<br>
&gt;<br>
&gt;<br>
&gt; On 15 Sep 2018, at 19:45, Alex Kiernan &lt;<a href=3D"mailto:alex.kier=
nan@gmail.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Sep 10, 2018 at 10:57 PM Leon Woestenberg &lt;<a href=3D"mailt=
o:leon@sidebranch.com" target=3D"_blank">leon@sidebranch.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt;<br>
&gt; kernel-fitimage.bbclass replaces an occurance of &quot;fitImage&quot; =
in<br>
&gt;<br>
&gt; KERNEL_IMAGETYPE_FOR_MAKE by an image type that is buildable for the<b=
r>
&gt;<br>
&gt; architecture (such as zImage). The kernel-fitimage.bbclass packs that<=
br>
&gt;<br>
&gt; image as sub-image in a flattened image tree image (fitImage) and<br>
&gt;<br>
&gt; deploys this fitImage along with the image tree source file (.its).<br=
>
&gt;<br>
&gt;<br>
&gt; kernel-fitimage.bbclass does not alter KERNEL_IMAGETYPES, which thus<b=
r>
&gt;<br>
&gt; also contains &quot;fitImage&quot;, which kernel.bbclass will also dep=
loy<br>
&gt;<br>
&gt; redundantly with different naming.<br>
&gt;<br>
&gt;<br>
&gt; The result is a dual deployment with slightly different naming,<br>
&gt;<br>
&gt; each with a set of symlinks.<br>
&gt;<br>
&gt;<br>
&gt; The solution chosen is to have fitImage deployment be handled by<br>
&gt;<br>
&gt; kernel-fitimage.bbclass, and have kernel.bbclass ignore fitImage<br>
&gt;<br>
&gt; types during deployment.<br>
&gt;<br>
&gt;<br>
&gt; Signed-off-by: Leon Woestenberg &lt;<a href=3D"mailto:leon@sidebranch.=
com" target=3D"_blank">leon@sidebranch.com</a>&gt;<br>
&gt;<br>
&gt;<br>
&gt; This looks completely plausible, but the two &quot;FIT&quot; images th=
at are<br>
&gt;<br>
&gt; installed aren&#39;t identical... after this I end up with no FIT imag=
e<br>
&gt;<br>
&gt; and only a bare image in the deploy dir.<br>
&gt;<br>
&gt;<br>
&gt; What was in your KERNEL_IMAGETYPES? Did it at least contain =E2=80=9Cf=
itImage=E2=80=9D??<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Yes, in fact only fitImage (and no initramfs).<br>
&gt;<br>
&gt;<br>
&gt; Digging into it, the logic between the two classes is a bit odd... in<=
br>
&gt;<br>
&gt; the case of a non initramfs build, the fitImage is actually installed<=
br>
&gt;<br>
&gt; here.<br>
&gt;<br>
&gt;<br>
&gt; If =E2=80=98here=E2=80=99 means kernel-fitimage, then I=E2=80=99ld say=
 ALL versions of a FIT image containing AT LEAST a Linux kernel are install=
ed by kernel-fitimage.<br>
&gt;<br>
&gt;<br>
&gt; The one that&#39;s installed in kernel-fitimage is the bare<br>
&gt;<br>
&gt; linux.bin, but named fitImage-...<br>
&gt;<br>
&gt;<br>
&gt; which is totally broken. If you want the bare kernel binary (which nam=
ing depends on architecture, so it should NOT be hard-coded to linux.bin an=
yway), you would need to specify that type *also* in KERNEL_IMAGETYPES, nex=
t to =E2=80=9CfitImage=E2=80=9D.<br>
&gt;<br>
&gt;<br>
&gt; Totally agree...<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; I&#39;ll send a patch reverting this and removing the other one as I&#=
39;d<br>
&gt;<br>
&gt; agree that it appears to have no purpose (and if you did want it, I<br=
>
&gt;<br>
&gt; guess you could list it in KERNEL_IMAGETYPES).<br>
&gt;<br>
&gt;<br>
&gt; I=E2=80=99m sorry I cannot follow what this and the other one is, and =
it. Let=E2=80=99s first understand all cases correctly.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Sorry I&#39;ve not described it well... the code in<br>
&gt;<br>
&gt; kernel-fitimage.bbclass that inserts the kernel into the its happens<b=
r>
&gt;<br>
&gt; here <a href=3D"http://git.openembedded.org/openembedded-core/tree/met=
a/classes/kernel-fitimage.bbclass#n371" rel=3D"noreferrer" target=3D"_blank=
">http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fi=
timage.bbclass#n371</a><br>
&gt;<br>
&gt;<br>
&gt; fitimage_emit_section_kernel ${1} &quot;${kernelcount}&quot; linux.bin=
 &quot;${linux_comp}&quot;<br>
&gt;<br>
&gt;<br>
&gt; inside fitimage_emit_section_kernel we create a kernel section which<b=
r>
&gt;<br>
&gt; has `data =3D /incbin/(&quot;${3}&quot;);` so linux.bin is our bare im=
age.<br>
&gt;<br>
&gt;<br>
&gt; Then we have the installation of fitImage-linux-bin that happens here<=
br>
&gt;<br>
&gt; <a href=3D"http://git.openembedded.org/openembedded-core/tree/meta/cla=
sses/kernel-fitimage.bbclass#n495" rel=3D"noreferrer" target=3D"_blank">htt=
p://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fitimag=
e.bbclass#n495</a><br>
&gt;<br>
&gt;<br>
&gt; echo &quot;Copying linux.bin file...&quot;<br>
&gt;<br>
&gt; install -m 0644 ${B}/linux.bin<br>
&gt;<br>
&gt; ${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_NAME}.bin<br>
&gt;<br>
&gt; ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin<br>
&gt;<br>
&gt; ${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}<br>
&gt;<br>
&gt;<br>
&gt; i.e. the bare linux.bin file which we used to pack into the FIT image,=
<br>
&gt;<br>
&gt; not a fitImage.<br>
&gt;<br>
&gt;<br>
&gt; The output FIT image from kernel-fitimage.bbclass is created here<br>
&gt;<br>
&gt; <a href=3D"http://git.openembedded.org/openembedded-core/tree/meta/cla=
sses/kernel-fitimage.bbclass#n450" rel=3D"noreferrer" target=3D"_blank">htt=
p://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fitimag=
e.bbclass#n450</a><br>
&gt;<br>
&gt;<br>
&gt; uboot-mkimage \<br>
&gt;<br>
&gt; ${@&#39;-D &quot;${UBOOT_MKIMAGE_DTCOPTS}&quot;&#39; if len(&#39;${UBO=
OT_MKIMAGE_DTCOPTS}&#39;) else &#39;&#39;} \<br>
&gt;<br>
&gt;=C2=A0 -f ${1} \<br>
&gt;<br>
&gt;=C2=A0 arch/${ARCH}/boot/${2}<br>
&gt;<br>
&gt;<br>
&gt; i.e. in arch/${ARCH}/boot/${2}<br>
&gt;<br>
&gt;<br>
&gt; It&#39;s that image which is then picked up by kernel.bbclass to insta=
ll<br>
&gt;<br>
&gt; into deploydir (because KERNEL_OUTPUT_DIR ?=3D &quot;arch/${ARCH}/boot=
&quot;):<br>
&gt;<br>
&gt;<br>
&gt; for imageType in ${KERNEL_IMAGETYPES} ; do<br>
&gt;<br>
&gt;=C2=A0 # kernel-fitimage class deploys fitImages, skip here<br>
&gt;<br>
&gt;=C2=A0 if [ &quot;$imageType&quot; !=3D &quot;fitImage&quot; ]; then<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 base_name=3D${imageType}-${KERNEL_IMAGE_NAME}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}<br>
&gt;<br>
&gt; $deployDir/${base_name}.bin<br>
&gt;<br>
&gt;=C2=A0 fi<br>
&gt;<br>
&gt; done<br>
&gt;<br>
&gt;<br>
&gt; Only it&#39;s doesn&#39;t because of the filter against fitImage.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; To check I&#39;m not seeing some strange artefact of our BSP or<br>
&gt; linux-ti-staging (or any other layer we&#39;re using):<br>
&gt;<br>
&gt; $ git clone git://<a href=3D"http://git.yoctoproject.org/poky" rel=3D"=
noreferrer" target=3D"_blank">git.yoctoproject.org/poky</a><br>
&gt; $ cd poky<br>
&gt; $ . oe-init-build-env<br>
&gt; $ cat &lt;&lt; EOF &gt;&gt; conf/local.conf<br>
&gt; MACHINE =3D &quot;beaglebone-yocto&quot;<br>
&gt; KERNEL_CLASSES +=3D &quot; kernel-fitimage&quot;<br>
&gt; KERNEL_IMAGETYPES =3D &quot;fitImage&quot;<br>
&gt; EOF<br>
&gt; $ bitbake linux-yocto<br>
&gt;<br>
&gt; The FIT images we then have:<br>
&gt;<br>
&gt; $ find tmp/deploy/images/beaglebone-yocto -name &#39;fit*.bin&#39; -ty=
pe f<br>
&gt; tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+734=
1720391_eba03655e8-r0-beaglebone-yocto-20180916134100.bin<br>
&gt;<br>
&gt; And what is:<br>
&gt;<br>
&gt; $ bitbake u-boot-mkimage-native -caddto_recipe_sysroot<br>
&gt; $ oe-run-native u-boot-mkimage-native mkimage -l<br>
&gt; tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+734=
1720391_eba03655e8-r0-beaglebone-yocto-20180916134100.bin<br>
&gt; Running bitbake -e u-boot-mkimage-native<br>
&gt; GP Header: Size a0e1 LoadAddr a0e1<br>
&gt;<br>
&gt; Revert c2d00e2f83cdf3d2923660448756ed29296a06a6 and try again:<br>
&gt;<br>
&gt; $ git revert c2d00e2f83cdf3d2923660448756ed29296a06a6<br>
&gt; $ bitbake linux-yocto<br>
&gt;<br>
&gt; This time there&#39;s two images:<br>
&gt;<br>
&gt; $ find tmp/deploy/images/beaglebone-yocto -name &#39;fit*.bin&#39; -ty=
pe f<br>
&gt; tmp/deploy/images/beaglebone-yocto/fitImage--4.18.3+git0+7341720391_eb=
a03655e8-r0-beaglebone-yocto-20180916141923.bin<br>
&gt; tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+734=
1720391_eba03655e8-r0-beaglebone-yocto-20180916141923.bin<br>
&gt;<br>
&gt; And what they are:<br>
&gt;<br>
&gt; $ oe-run-native u-boot-mkimage-native mkimage -l<br>
&gt; tmp/deploy/images/beaglebone-yocto/fitImage--4.18.3+git0+7341720391_eb=
a03655e8-r0-beaglebone-yocto-20180916141923.bin<br>
&gt; Running bitbake -e u-boot-mkimage-native<br>
&gt; FIT description: U-Boot fitImage for Poky (Yocto Project Reference<br>
&gt; Distro)/4.18.3+gitAUTOINC+7341720391_eba03655e8/beaglebone-yocto<br>
&gt; Created:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Sun Sep 16 14:14:47 2018<br>
&gt; Image 0 (kernel@1)<br>
&gt;=C2=A0 Description:=C2=A0 Linux kernel<br>
&gt;=C2=A0 Created:=C2=A0 =C2=A0 =C2=A0 Sun Sep 16 14:14:47 2018<br>
&gt;=C2=A0 Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Kernel Image<br>
&gt;=C2=A0 Compression:=C2=A0 uncompressed<br>
&gt;=C2=A0 Data Size:=C2=A0 =C2=A0 6381368 Bytes =3D 6231.80 KiB =3D 6.09 M=
iB<br>
&gt;=C2=A0 Architecture: ARM<br>
&gt;=C2=A0 OS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux<br>
&gt;=C2=A0 Load Address: 0x80008000<br>
&gt;=C2=A0 Entry Point:=C2=A0 0x80008000<br>
&gt;=C2=A0 Hash algo:=C2=A0 =C2=A0 sha1<br>
&gt;=C2=A0 Hash value:=C2=A0 =C2=A0909137524ffd28b5b0ac51ea39c648b09902dc18=
<br>
&gt; Image 1 (fdt@am335x-bone.dtb)<br>
&gt;=C2=A0 Description:=C2=A0 Flattened Device Tree blob<br>
&gt;=C2=A0 Created:=C2=A0 =C2=A0 =C2=A0 Sun Sep 16 14:14:47 2018<br>
&gt;=C2=A0 Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Flat Device Tree<br>
&gt;=C2=A0 Compression:=C2=A0 uncompressed<br>
&gt;=C2=A0 Data Size:=C2=A0 =C2=A0 33030 Bytes =3D 32.26 KiB =3D 0.03 MiB<b=
r>
&gt;=C2=A0 Architecture: ARM<br>
&gt;=C2=A0 Hash algo:=C2=A0 =C2=A0 sha1<br>
&gt;=C2=A0 Hash value:=C2=A0 =C2=A00fece12f15fc5ac6c452d9308cd374c2c0cfea47=
<br>
&gt; Image 2 (fdt@am335x-boneblack.dtb)<br>
&gt;=C2=A0 Description:=C2=A0 Flattened Device Tree blob<br>
&gt;=C2=A0 Created:=C2=A0 =C2=A0 =C2=A0 Sun Sep 16 14:14:47 2018<br>
&gt;=C2=A0 Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Flat Device Tree<br>
&gt;=C2=A0 Compression:=C2=A0 uncompressed<br>
&gt;=C2=A0 Data Size:=C2=A0 =C2=A0 34782 Bytes =3D 33.97 KiB =3D 0.03 MiB<b=
r>
&gt;=C2=A0 Architecture: ARM<br>
&gt;=C2=A0 Hash algo:=C2=A0 =C2=A0 sha1<br>
&gt;=C2=A0 Hash value:=C2=A0 =C2=A0337f6843020cb8fbaf119b43fd748222d32e72df=
<br>
&gt; Image 3 (fdt@am335x-bonegreen.dtb)<br>
&gt;=C2=A0 Description:=C2=A0 Flattened Device Tree blob<br>
&gt;=C2=A0 Created:=C2=A0 =C2=A0 =C2=A0 Sun Sep 16 14:14:47 2018<br>
&gt;=C2=A0 Type:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Flat Device Tree<br>
&gt;=C2=A0 Compression:=C2=A0 uncompressed<br>
&gt;=C2=A0 Data Size:=C2=A0 =C2=A0 33286 Bytes =3D 32.51 KiB =3D 0.03 MiB<b=
r>
&gt;=C2=A0 Architecture: ARM<br>
&gt;=C2=A0 Hash algo:=C2=A0 =C2=A0 sha1<br>
&gt;=C2=A0 Hash value:=C2=A0 =C2=A04974e8b1656cd7f52829ac3c01f6747bece87cbc=
<br>
&gt; Default Configuration: &#39;conf@am335x-bone.dtb&#39;<br>
&gt; Configuration 0 (conf@am335x-bone.dtb)<br>
&gt;=C2=A0 Description:=C2=A0 1 Linux kernel, FDT blob<br>
&gt;=C2=A0 Kernel:=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel@1<br>
&gt;=C2=A0 FDT:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fdt@am335x-bone.dtb<br>
&gt;=C2=A0 Hash algo:=C2=A0 =C2=A0 sha1<br>
&gt;=C2=A0 Hash value:=C2=A0 =C2=A0unavailable<br>
&gt; Configuration 1 (conf@am335x-boneblack.dtb)<br>
&gt;=C2=A0 Description:=C2=A0 0 Linux kernel, FDT blob<br>
&gt;=C2=A0 Kernel:=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel@1<br>
&gt;=C2=A0 FDT:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fdt@am335x-boneblack.dtb<=
br>
&gt;=C2=A0 Hash algo:=C2=A0 =C2=A0 sha1<br>
&gt;=C2=A0 Hash value:=C2=A0 =C2=A0unavailable<br>
&gt; Configuration 2 (conf@am335x-bonegreen.dtb)<br>
&gt;=C2=A0 Description:=C2=A0 0 Linux kernel, FDT blob<br>
&gt;=C2=A0 Kernel:=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel@1<br>
&gt;=C2=A0 FDT:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fdt@am335x-bonegreen.dtb<=
br>
&gt;=C2=A0 Hash algo:=C2=A0 =C2=A0 sha1<br>
&gt;=C2=A0 Hash value:=C2=A0 =C2=A0unavailable<br>
&gt; $ oe-run-native u-boot-mkimage-native mkimage -l<br>
&gt; tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+734=
1720391_eba03655e8-r0-beaglebone-yocto-20180916141923.bin<br>
&gt; Running bitbake -e u-boot-mkimage-native<br>
&gt; GP Header: Size a0e1 LoadAddr a0e1<br>
&gt;<br>
&gt; --<br>
&gt; Alex Kiernan<br>
<br>
<br>
<br>
-- <br>
Alex Kiernan<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"m=
_8067782294451267538gmail_signature" data-smartmail=3D"gmail_signature"><di=
v dir=3D"ltr"><div style=3D"color:rgb(0,0,0);font-family:Helvetica">Leon Wo=
estenberg</div><div style=3D"color:rgb(0,0,0);font-family:Helvetica"><a hre=
f=3D"mailto:leon@sidebranch.com" style=3D"color:rgb(17,85,204)" target=3D"_=
blank">leon@sidebranch.com</a></div><div style=3D"color:rgb(0,0,0);font-fam=
ily:Helvetica"><div>T: +31 40 711 42 76</div><div>M: +31 6 472 30 372</div>=
</div><div style=3D"color:rgb(0,0,0);font-family:Helvetica"><br></div><div =
style=3D"color:rgb(0,0,0);font-family:Helvetica">Sidebranch</div><div style=
=3D"color:rgb(0,0,0);font-family:Helvetica">Embedded Systems</div><div styl=
e=3D"color:rgb(0,0,0);font-family:Helvetica">Eindhoven, The Netherlands</di=
v><a href=3D"http://www.sidebranch.com/" style=3D"color:rgb(17,85,204);font=
-family:Helvetica" target=3D"_blank">http://www.sidebranch.com</a><div><br>=
</div><div><img src=3D"http://www.sidebranch.nl/sites/default/files/images/=
unnamed.png" style=3D"color:rgb(0,0,0);font-family:Helvetica"><br></div><di=
v><br><div><br></div></div></div></div>

--000000000000c40fa40576221443--
