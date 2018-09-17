Return-Path: <leon@sidebranch.com>
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail.openembedded.org (Postfix) with ESMTP id 161C6607AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 18:05:33 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id l5so13677444edw.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 11:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=coOFTZH3uYUwTJXRXrHxwwit7wZGWjwFdhw49kzmo78=;
	b=V7wOeVKcIvitbYOUsMB+eo/3ZnqqOvltJstJaQdbxEtBJI6HA/hp1XQc+WtyOiYqUk
	mGzDzCgMco6m4ZSr3W19JZ7jZXSbGv0KC34bACwvnm/LgsucbmgheSvKWWW1ca3juOtD
	NfugIoY6kFuLZ4KmefaSk2eU3EQiOhJr3YnS2CUz/YzyMjT9wt2U+uu7/XGLRALFtVhi
	Y+GR5qdXEzcdoDvaweoIzfvOZDnuCdsqkB3mIzb6Ho0/dsnRMz54tamzZCyJQLzjmSiN
	Y7UpBqtA4E2yE9ETQ9k9hcrSdkNZeiZQsITj0CLDfdedcDwQjPosjnMQVVoirhJj8Y/Y
	V/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=coOFTZH3uYUwTJXRXrHxwwit7wZGWjwFdhw49kzmo78=;
	b=RY5ZJMQxBWzr0xH/XGJ7GWMgz10aTLz8jyJ7BGmHYB0GO0z0fA16RECefZt3AB/J/a
	rgwMSFd/3I/SKejkZw2jgIP+rzTpvad4bmNVmOG0iLf6eq0jvl1s/dj+DftC9F7IhUW/
	/Ty7Kq4JpEg+kmPkecEwk5xmltRNzpGe1T15KVC4eK3ei1lAigBkC98dSxstMYVjdusG
	LpMqiHfArLGAthwg41t7FCIDb4TCBTVIz5aUtIG1PAimcDruHFOa6McxQ9RjtKQU9Kxj
	nGIllQ1T39+wdUCmcZJZfRTtJ7LfoVsQntYqkhhdSt0oF7t1KT4/ELhXfcDC4+/aaINp
	5p4Q==
X-Gm-Message-State: APzg51ChY5q373H93oQEGIk18927CWQ1ij8zjTEOby2Lgfv5tnQXlG67
	4Cd7C7jlZMA2rFgYC6Xjk8JSFXZenb4=
X-Google-Smtp-Source: ANB0VdbHkYVjlf/wzuZdiyRVOaIOhatBQ+sHDWgNDAcxeFGzAFXqfeIzIJAsXnygEMnDC3LapbjTxg==
X-Received: by 2002:aa7:d391:: with SMTP id
	x17-v6mr43860589edq.144.1537207534461; 
	Mon, 17 Sep 2018 11:05:34 -0700 (PDT)
Received: from [100.83.13.144] ([188.207.81.133])
	by smtp.gmail.com with ESMTPSA id
	v14-v6sm7578528edm.97.2018.09.17.11.05.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Sep 2018 11:05:33 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Leon Woestenberg <leon@sidebranch.com>
X-Mailer: iPhone Mail (15G77)
In-Reply-To: <CAO5Uq5Rws0YP5_y-CSXhKKSrHe1BZiSQsYFQHH9AABFgjKWv=g@mail.gmail.com>
Date: Mon, 17 Sep 2018 20:05:29 +0200
Message-Id: <4F5C8364-78D3-41EF-B239-B641651A2F64@sidebranch.com>
References: <1536616603-9502-1-git-send-email-leon@sidebranch.com>
	<CAO5Uq5S43E3cXUSEVJP8-dKtuqR-XaqrN+6fhHfy6QESLRh7_w@mail.gmail.com>
	<AB33E724-81C2-43BC-8169-6100CABAA375@sidebranch.com>
	<CAO5Uq5ToXbUR2Pv9PwQOPp-F+5CbwvuPwy84Kfz7HWUzx2ohFA@mail.gmail.com>
	<CAO5Uq5Rws0YP5_y-CSXhKKSrHe1BZiSQsYFQHH9AABFgjKWv=g@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 17 Sep 2018 18:05:34 -0000
X-Groupsio-MsgNum: 116357
Content-Type: multipart/signed;
	boundary=Apple-Mail-6873695F-1D38-44C6-A7EE-8A6BB3E5F360;
	protocol="application/pkcs7-signature"; micalg=sha1
Content-Transfer-Encoding: 7bit

--Apple-Mail-6873695F-1D38-44C6-A7EE-8A6BB3E5F360
Content-Type: multipart/alternative;
	boundary=Apple-Mail-89A5FFDB-F1C8-4EF5-B494-805AF1B49DFF
Content-Transfer-Encoding: 7bit

--Apple-Mail-89A5FFDB-F1C8-4EF5-B494-805AF1B49DFF
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Alex,

I expected it to be kernel-fitimage.bbclass=E2=80=99s responsibility to depl=
oy the fitImage.

Regards, Leon




> On 16 Sep 2018, at 16:22, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>=20
>> On Sun, Sep 16, 2018 at 11:41 AM Alex Kiernan <alex.kiernan@gmail.com> wr=
ote:
>>=20
>> Hi Leon
>>=20
>>> On Sun, Sep 16, 2018 at 10:18 AM Leon Woestenberg <leon@sidebranch.com> w=
rote:
>>>=20
>>> Hi Alex,
>>>=20
>>>>> On 15 Sep 2018, at 19:45, Alex Kiernan <alex.kiernan@gmail.com> wrote:=

>>>>>=20
>>>>> On Mon, Sep 10, 2018 at 10:57 PM Leon Woestenberg <leon@sidebranch.com=
> wrote:
>>>>>=20
>>>>> kernel-fitimage.bbclass replaces an occurance of "fitImage" in
>>>>> KERNEL_IMAGETYPE_FOR_MAKE by an image type that is buildable for the
>>>>> architecture (such as zImage). The kernel-fitimage.bbclass packs that
>>>>> image as sub-image in a flattened image tree image (fitImage) and
>>>>> deploys this fitImage along with the image tree source file (.its).
>>>>>=20
>>>>> kernel-fitimage.bbclass does not alter KERNEL_IMAGETYPES, which thus
>>>>> also contains "fitImage", which kernel.bbclass will also deploy
>>>>> redundantly with different naming.
>>>>>=20
>>>>> The result is a dual deployment with slightly different naming,
>>>>> each with a set of symlinks.
>>>>>=20
>>>>> The solution chosen is to have fitImage deployment be handled by
>>>>> kernel-fitimage.bbclass, and have kernel.bbclass ignore fitImage
>>>>> types during deployment.
>>>>>=20
>>>>> Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
>>>>=20
>>>> This looks completely plausible, but the two "FIT" images that are
>>>> installed aren't identical... after this I end up with no FIT image
>>>> and only a bare image in the deploy dir.
>>>=20
>>> What was in your KERNEL_IMAGETYPES? Did it at least contain =E2=80=9Cfit=
Image=E2=80=9D??
>>>=20
>>=20
>> Yes, in fact only fitImage (and no initramfs).
>>=20
>>>> Digging into it, the logic between the two classes is a bit odd... in
>>>> the case of a non initramfs build, the fitImage is actually installed
>>>> here.
>>>=20
>>> If =E2=80=98here=E2=80=99 means kernel-fitimage, then I=E2=80=99ld say A=
LL versions of a FIT image containing AT LEAST a Linux kernel are installed b=
y kernel-fitimage.
>>>=20
>>>> The one that's installed in kernel-fitimage is the bare
>>>> linux.bin, but named fitImage-...
>>>=20
>>> which is totally broken. If you want the bare kernel binary (which namin=
g depends on architecture, so it should NOT be hard-coded to linux.bin anywa=
y), you would need to specify that type *also* in KERNEL_IMAGETYPES, next to=
 =E2=80=9CfitImage=E2=80=9D.
>>=20
>> Totally agree...
>>=20
>>>>=20
>>>> I'll send a patch reverting this and removing the other one as I'd
>>>> agree that it appears to have no purpose (and if you did want it, I
>>>> guess you could list it in KERNEL_IMAGETYPES).
>>>=20
>>> I=E2=80=99m sorry I cannot follow what this and the other one is, and it=
. Let=E2=80=99s first understand all cases correctly.
>>>=20
>>=20
>> Sorry I've not described it well... the code in
>> kernel-fitimage.bbclass that inserts the kernel into the its happens
>> here http://git.openembedded.org/openembedded-core/tree/meta/classes/kern=
el-fitimage.bbclass#n371
>>=20
>> fitimage_emit_section_kernel ${1} "${kernelcount}" linux.bin "${linux_com=
p}"
>>=20
>> inside fitimage_emit_section_kernel we create a kernel section which
>> has `data =3D /incbin/("${3}");` so linux.bin is our bare image.
>>=20
>> Then we have the installation of fitImage-linux-bin that happens here
>> http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fi=
timage.bbclass#n495
>>=20
>> echo "Copying linux.bin file..."
>> install -m 0644 ${B}/linux.bin
>> ${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
>> ln -snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
>> ${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_LINK_NAME}
>>=20
>> i.e. the bare linux.bin file which we used to pack into the FIT image,
>> not a fitImage.
>>=20
>> The output FIT image from kernel-fitimage.bbclass is created here
>> http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel-fi=
timage.bbclass#n450
>>=20
>> uboot-mkimage \
>> ${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') els=
e ''} \
>>  -f ${1} \
>>  arch/${ARCH}/boot/${2}
>>=20
>> i.e. in arch/${ARCH}/boot/${2}
>>=20
>> It's that image which is then picked up by kernel.bbclass to install
>> into deploydir (because KERNEL_OUTPUT_DIR ?=3D "arch/${ARCH}/boot"):
>>=20
>> for imageType in ${KERNEL_IMAGETYPES} ; do
>>  # kernel-fitimage class deploys fitImages, skip here
>>  if [ "$imageType" !=3D "fitImage" ]; then
>>    base_name=3D${imageType}-${KERNEL_IMAGE_NAME}
>>    install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}
>> $deployDir/${base_name}.bin
>>  fi
>> done
>>=20
>> Only it's doesn't because of the filter against fitImage.
>>=20
>=20
> To check I'm not seeing some strange artefact of our BSP or
> linux-ti-staging (or any other layer we're using):
>=20
> $ git clone git://git.yoctoproject.org/poky
> $ cd poky
> $ . oe-init-build-env
> $ cat << EOF >> conf/local.conf
> MACHINE =3D "beaglebone-yocto"
> KERNEL_CLASSES +=3D " kernel-fitimage"
> KERNEL_IMAGETYPES =3D "fitImage"
> EOF
> $ bitbake linux-yocto
>=20
> The FIT images we then have:
>=20
> $ find tmp/deploy/images/beaglebone-yocto -name 'fit*.bin' -type f
> tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+7341720=
391_eba03655e8-r0-beaglebone-yocto-20180916134100.bin
>=20
> And what is:
>=20
> $ bitbake u-boot-mkimage-native -caddto_recipe_sysroot
> $ oe-run-native u-boot-mkimage-native mkimage -l
> tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+7341720=
391_eba03655e8-r0-beaglebone-yocto-20180916134100.bin
> Running bitbake -e u-boot-mkimage-native
> GP Header: Size a0e1 LoadAddr a0e1
>=20
> Revert c2d00e2f83cdf3d2923660448756ed29296a06a6 and try again:
>=20
> $ git revert c2d00e2f83cdf3d2923660448756ed29296a06a6
> $ bitbake linux-yocto
>=20
> This time there's two images:
>=20
> $ find tmp/deploy/images/beaglebone-yocto -name 'fit*.bin' -type f
> tmp/deploy/images/beaglebone-yocto/fitImage--4.18.3+git0+7341720391_eba036=
55e8-r0-beaglebone-yocto-20180916141923.bin
> tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+7341720=
391_eba03655e8-r0-beaglebone-yocto-20180916141923.bin
>=20
> And what they are:
>=20
> $ oe-run-native u-boot-mkimage-native mkimage -l
> tmp/deploy/images/beaglebone-yocto/fitImage--4.18.3+git0+7341720391_eba036=
55e8-r0-beaglebone-yocto-20180916141923.bin
> Running bitbake -e u-boot-mkimage-native
> FIT description: U-Boot fitImage for Poky (Yocto Project Reference
> Distro)/4.18.3+gitAUTOINC+7341720391_eba03655e8/beaglebone-yocto
> Created:         Sun Sep 16 14:14:47 2018
> Image 0 (kernel@1)
>  Description:  Linux kernel
>  Created:      Sun Sep 16 14:14:47 2018
>  Type:         Kernel Image
>  Compression:  uncompressed
>  Data Size:    6381368 Bytes =3D 6231.80 KiB =3D 6.09 MiB
>  Architecture: ARM
>  OS:           Linux
>  Load Address: 0x80008000
>  Entry Point:  0x80008000
>  Hash algo:    sha1
>  Hash value:   909137524ffd28b5b0ac51ea39c648b09902dc18
> Image 1 (fdt@am335x-bone.dtb)
>  Description:  Flattened Device Tree blob
>  Created:      Sun Sep 16 14:14:47 2018
>  Type:         Flat Device Tree
>  Compression:  uncompressed
>  Data Size:    33030 Bytes =3D 32.26 KiB =3D 0.03 MiB
>  Architecture: ARM
>  Hash algo:    sha1
>  Hash value:   0fece12f15fc5ac6c452d9308cd374c2c0cfea47
> Image 2 (fdt@am335x-boneblack.dtb)
>  Description:  Flattened Device Tree blob
>  Created:      Sun Sep 16 14:14:47 2018
>  Type:         Flat Device Tree
>  Compression:  uncompressed
>  Data Size:    34782 Bytes =3D 33.97 KiB =3D 0.03 MiB
>  Architecture: ARM
>  Hash algo:    sha1
>  Hash value:   337f6843020cb8fbaf119b43fd748222d32e72df
> Image 3 (fdt@am335x-bonegreen.dtb)
>  Description:  Flattened Device Tree blob
>  Created:      Sun Sep 16 14:14:47 2018
>  Type:         Flat Device Tree
>  Compression:  uncompressed
>  Data Size:    33286 Bytes =3D 32.51 KiB =3D 0.03 MiB
>  Architecture: ARM
>  Hash algo:    sha1
>  Hash value:   4974e8b1656cd7f52829ac3c01f6747bece87cbc
> Default Configuration: 'conf@am335x-bone.dtb'
> Configuration 0 (conf@am335x-bone.dtb)
>  Description:  1 Linux kernel, FDT blob
>  Kernel:       kernel@1
>  FDT:          fdt@am335x-bone.dtb
>  Hash algo:    sha1
>  Hash value:   unavailable
> Configuration 1 (conf@am335x-boneblack.dtb)
>  Description:  0 Linux kernel, FDT blob
>  Kernel:       kernel@1
>  FDT:          fdt@am335x-boneblack.dtb
>  Hash algo:    sha1
>  Hash value:   unavailable
> Configuration 2 (conf@am335x-bonegreen.dtb)
>  Description:  0 Linux kernel, FDT blob
>  Kernel:       kernel@1
>  FDT:          fdt@am335x-bonegreen.dtb
>  Hash algo:    sha1
>  Hash value:   unavailable
> $ oe-run-native u-boot-mkimage-native mkimage -l
> tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+7341720=
391_eba03655e8-r0-beaglebone-yocto-20180916141923.bin
> Running bitbake -e u-boot-mkimage-native
> GP Header: Size a0e1 LoadAddr a0e1
>=20
> --=20
> Alex Kiernan

--Apple-Mail-89A5FFDB-F1C8-4EF5-B494-805AF1B49DFF
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Alex,<div><br></div><div>I expected it t=
o be kernel-fitimage.bbclass=E2=80=99s responsibility to deploy the fitImage=
.</div><div><br></div><div>Regards, Leon</div><div><br></div><div><br><div><=
div style=3D"text-align: -webkit-auto; font-variant-ligatures: normal; font-=
variant-position: normal; font-variant-numeric: normal; font-variant-alterna=
tes: normal; font-variant-east-asian: normal; line-height: normal;"><span st=
yle=3D"background-color: rgba(255, 255, 255, 0);"><br></span></div></div><di=
v><br>On 16 Sep 2018, at 16:22, Alex Kiernan &lt;<a href=3D"mailto:alex.kier=
nan@gmail.com">alex.kiernan@gmail.com</a>&gt; wrote:<br><br></div><blockquot=
e type=3D"cite"><div><span>On Sun, Sep 16, 2018 at 11:41 AM Alex Kiernan &lt=
;<a href=3D"mailto:alex.kiernan@gmail.com">alex.kiernan@gmail.com</a>&gt; wr=
ote:</span><br><blockquote type=3D"cite"><span></span><br></blockquote><bloc=
kquote type=3D"cite"><span>Hi Leon</span><br></blockquote><blockquote type=3D=
"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>On Sun,=
 Sep 16, 2018 at 10:18 AM Leon Woestenberg &lt;<a href=3D"mailto:leon@sidebr=
anch.com">leon@sidebranch.com</a>&gt; wrote:</span><br></blockquote><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Hi Alex=
,</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>On 15 Sep 20=
18, at 19:45, Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com">ale=
x.kiernan@gmail.com</a>&gt; wrote:</span><br></blockquote></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><span></span><br></blockquote></blockquote></blockquote><blockquot=
e type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><span>On Mon, Sep 10, 2018 at 10:57 PM Leon Woestenberg &l=
t;<a href=3D"mailto:leon@sidebranch.com">leon@sidebranch.com</a>&gt; wrote:<=
/span><br></blockquote></blockquote></blockquote></blockquote><blockquote ty=
pe=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span></span><br></blockquote></blockquote></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>kernel-fitimage.bbclass replaces an o=
ccurance of "fitImage" in</span><br></blockquote></blockquote></blockquote><=
/blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>KERNEL_IMAGETYPE_FOR_MAKE by an=
 image type that is buildable for the</span><br></blockquote></blockquote></=
blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>architecture (such=
 as zImage). The kernel-fitimage.bbclass packs that</span><br></blockquote><=
/blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>image=
 as sub-image in a flattened image tree image (fitImage) and</span><br></blo=
ckquote></blockquote></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span>deploys this fitImage along with the image tree source file (.its).</sp=
an><br></blockquote></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span></span><br></blockquote></blockquote></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span>kernel-fitimage.bbclass does not alter KER=
NEL_IMAGETYPES, which thus</span><br></blockquote></blockquote></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><span>also contains "fitImage", whi=
ch kernel.bbclass will also deploy</span><br></blockquote></blockquote></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span>redundantly with diff=
erent naming.</span><br></blockquote></blockquote></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><span>The result is a dual d=
eployment with slightly different naming,</span><br></blockquote></blockquot=
e></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>each with a se=
t of symlinks.</span><br></blockquote></blockquote></blockquote></blockquote=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote></bl=
ockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span>The solution chosen i=
s to have fitImage deployment be handled by</span><br></blockquote></blockqu=
ote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"=
cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>kernel-fitim=
age.bbclass, and have kernel.bbclass ignore fitImage</span><br></blockquote>=
</blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>typ=
es during deployment.</span><br></blockquote></blockquote></blockquote></blo=
ckquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=
=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockquo=
te></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>Signed-off-by=
: Leon Woestenberg &lt;<a href=3D"mailto:leon@sidebranch.com">leon@sidebranc=
h.com</a>&gt;</span><br></blockquote></blockquote></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite=
"><span></span><br></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>This looks c=
ompletely plausible, but the two "FIT" images that are</span><br></blockquot=
e></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><blockquote type=3D"cite"><span>installed aren't identical... after this=
 I end up with no FIT image</span><br></blockquote></blockquote></blockquote=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><span>and only a bare image in the deploy dir.</span><br></blockquote></b=
lockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span></span><br></blockquote></blockquote><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><span>What was in your KERNEL_IMAGETYPES? Did it at least c=
ontain =E2=80=9CfitImage=E2=80=9D??</span><br></blockquote></blockquote><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquot=
e></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><bloc=
kquote type=3D"cite"><span>Yes, in fact only fitImage (and no initramfs).</s=
pan><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote=
><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><span>Digging into it, the logic between the two classes is a bit odd... i=
n</span><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"=
><blockquote type=3D"cite"><blockquote type=3D"cite"><span>the case of a non=
 initramfs build, the fitImage is actually installed</span><br></blockquote>=
</blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span>here.</span><br></blockquote></blockquote>=
</blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></spa=
n><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>If =E2=80=98here=E2=80=99 means kernel-fitimage, then I=E2=80=99=
ld say ALL versions of a FIT image containing AT LEAST a Linux kernel are in=
stalled by kernel-fitimage.</span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>The one that's installed in kernel-fitimage is the bare</span><=
br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span>linux.bin, but named fitIm=
age-...</span><br></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>which is totally b=
roken. If you want the bare kernel binary (which naming depends on architect=
ure, so it should NOT be hard-coded to linux.bin anyway), you would need to s=
pecify that type *also* in KERNEL_IMAGETYPES, next to =E2=80=9CfitImage=E2=80=
=9D.</span><br></blockquote></blockquote><blockquote type=3D"cite"><span></s=
pan><br></blockquote><blockquote type=3D"cite"><span>Totally agree...</span>=
<br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><bl=
ockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><=
span></span><br></blockquote></blockquote></blockquote><blockquote type=3D"c=
ite"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>I'll send a p=
atch reverting this and removing the other one as I'd</span><br></blockquote=
></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><span>agree that it appears to have no purpose (=
and if you did want it, I</span><br></blockquote></blockquote></blockquote><=
blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"=
><span>guess you could list it in KERNEL_IMAGETYPES).</span><br></blockquote=
></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cit=
e"><span></span><br></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><span>I=E2=80=99m sorry I cannot follow what this and t=
he other one is, and it. Let=E2=80=99s first understand all cases correctly.=
</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span></span><br></blockquote></blockquote><blockquote type=3D"=
cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>Sorry I'=
ve not described it well... the code in</span><br></blockquote><blockquote t=
ype=3D"cite"><span>kernel-fitimage.bbclass that inserts the kernel into the i=
ts happens</span><br></blockquote><blockquote type=3D"cite"><span>here <a hr=
ef=3D"http://git.openembedded.org/openembedded-core/tree/meta/classes/kernel=
-fitimage.bbclass#n371">http://git.openembedded.org/openembedded-core/tree/m=
eta/classes/kernel-fitimage.bbclass#n371</a></span><br></blockquote><blockqu=
ote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><s=
pan>fitimage_emit_section_kernel ${1} "${kernelcount}" linux.bin "${linux_co=
mp}"</span><br></blockquote><blockquote type=3D"cite"><span></span><br></blo=
ckquote><blockquote type=3D"cite"><span>inside fitimage_emit_section_kernel w=
e create a kernel section which</span><br></blockquote><blockquote type=3D"c=
ite"><span>has `data =3D /incbin/("${3}");` so linux.bin is our bare image.<=
/span><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquo=
te><blockquote type=3D"cite"><span>Then we have the installation of fitImage=
-linux-bin that happens here</span><br></blockquote><blockquote type=3D"cite=
"><span><a href=3D"http://git.openembedded.org/openembedded-core/tree/meta/c=
lasses/kernel-fitimage.bbclass#n495">http://git.openembedded.org/openembedde=
d-core/tree/meta/classes/kernel-fitimage.bbclass#n495</a></span><br></blockq=
uote><blockquote type=3D"cite"><span></span><br></blockquote><blockquote typ=
e=3D"cite"><span>echo "Copying linux.bin file..."</span><br></blockquote><bl=
ockquote type=3D"cite"><span>install -m 0644 ${B}/linux.bin</span><br></bloc=
kquote><blockquote type=3D"cite"><span>${DEPLOYDIR}/fitImage-linux.bin-${KER=
NEL_FIT_NAME}.bin</span><br></blockquote><blockquote type=3D"cite"><span>ln -=
snf fitImage-linux.bin-${KERNEL_FIT_NAME}.bin</span><br></blockquote><blockq=
uote type=3D"cite"><span>${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_LINK_N=
AME}</span><br></blockquote><blockquote type=3D"cite"><span></span><br></blo=
ckquote><blockquote type=3D"cite"><span>i.e. the bare linux.bin file which w=
e used to pack into the FIT image,</span><br></blockquote><blockquote type=3D=
"cite"><span>not a fitImage.</span><br></blockquote><blockquote type=3D"cite=
"><span></span><br></blockquote><blockquote type=3D"cite"><span>The output FI=
T image from kernel-fitimage.bbclass is created here</span><br></blockquote>=
<blockquote type=3D"cite"><span><a href=3D"http://git.openembedded.org/opene=
mbedded-core/tree/meta/classes/kernel-fitimage.bbclass#n450">http://git.open=
embedded.org/openembedded-core/tree/meta/classes/kernel-fitimage.bbclass#n45=
0</a></span><br></blockquote><blockquote type=3D"cite"><span></span><br></bl=
ockquote><blockquote type=3D"cite"><span>uboot-mkimage \</span><br></blockqu=
ote><blockquote type=3D"cite"><span>${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if le=
n('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \</span><br></blockquote><blockquote t=
ype=3D"cite"><span> &nbsp;-f ${1} \</span><br></blockquote><blockquote type=3D=
"cite"><span> &nbsp;arch/${ARCH}/boot/${2}</span><br></blockquote><blockquot=
e type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><spa=
n>i.e. in arch/${ARCH}/boot/${2}</span><br></blockquote><blockquote type=3D"=
cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>It's tha=
t image which is then picked up by kernel.bbclass to install</span><br></blo=
ckquote><blockquote type=3D"cite"><span>into deploydir (because KERNEL_OUTPU=
T_DIR ?=3D "arch/${ARCH}/boot"):</span><br></blockquote><blockquote type=3D"=
cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>for imag=
eType in ${KERNEL_IMAGETYPES} ; do</span><br></blockquote><blockquote type=3D=
"cite"><span> &nbsp;# kernel-fitimage class deploys fitImages, skip here</sp=
an><br></blockquote><blockquote type=3D"cite"><span> &nbsp;if [ "$imageType"=
 !=3D "fitImage" ]; then</span><br></blockquote><blockquote type=3D"cite"><s=
pan> &nbsp;&nbsp;&nbsp;base_name=3D${imageType}-${KERNEL_IMAGE_NAME}</span><=
br></blockquote><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;install -=
m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}</span><br></blockquote><blockquote t=
ype=3D"cite"><span>$deployDir/${base_name}.bin</span><br></blockquote><block=
quote type=3D"cite"><span> &nbsp;fi</span><br></blockquote><blockquote type=3D=
"cite"><span>done</span><br></blockquote><blockquote type=3D"cite"><span></s=
pan><br></blockquote><blockquote type=3D"cite"><span>Only it's doesn't becau=
se of the filter against fitImage.</span><br></blockquote><blockquote type=3D=
"cite"><span></span><br></blockquote><span></span><br><span>To check I'm not=
 seeing some strange artefact of our BSP or</span><br><span>linux-ti-staging=
 (or any other layer we're using):</span><br><span></span><br><span>$ git cl=
one git://git.yoctoproject.org/poky</span><br><span>$ cd poky</span><br><spa=
n>$ . oe-init-build-env</span><br><span>$ cat &lt;&lt; EOF &gt;&gt; conf/loc=
al.conf</span><br><span>MACHINE =3D "beaglebone-yocto"</span><br><span>KERNE=
L_CLASSES +=3D " kernel-fitimage"</span><br><span>KERNEL_IMAGETYPES =3D "fit=
Image"</span><br><span>EOF</span><br><span>$ bitbake linux-yocto</span><br><=
span></span><br><span>The FIT images we then have:</span><br><span></span><b=
r><span>$ find tmp/deploy/images/beaglebone-yocto -name 'fit*.bin' -type f</=
span><br><span>tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin--4.18.3=
+git0+7341720391_eba03655e8-r0-beaglebone-yocto-20180916134100.bin</span><br=
><span></span><br><span>And what is:</span><br><span></span><br><span>$ bitb=
ake u-boot-mkimage-native -caddto_recipe_sysroot</span><br><span>$ oe-run-na=
tive u-boot-mkimage-native mkimage -l</span><br><span>tmp/deploy/images/beag=
lebone-yocto/fitImage-linux.bin--4.18.3+git0+7341720391_eba03655e8-r0-beagle=
bone-yocto-20180916134100.bin</span><br><span>Running bitbake -e u-boot-mkim=
age-native</span><br><span>GP Header: Size a0e1 LoadAddr a0e1</span><br><spa=
n></span><br><span>Revert c2d00e2f83cdf3d2923660448756ed29296a06a6 and try a=
gain:</span><br><span></span><br><span>$ git revert c2d00e2f83cdf3d292366044=
8756ed29296a06a6</span><br><span>$ bitbake linux-yocto</span><br><span></spa=
n><br><span>This time there's two images:</span><br><span></span><br><span>$=
 find tmp/deploy/images/beaglebone-yocto -name 'fit*.bin' -type f</span><br>=
<span>tmp/deploy/images/beaglebone-yocto/fitImage--4.18.3+git0+7341720391_eb=
a03655e8-r0-beaglebone-yocto-20180916141923.bin</span><br><span>tmp/deploy/i=
mages/beaglebone-yocto/fitImage-linux.bin--4.18.3+git0+7341720391_eba03655e8=
-r0-beaglebone-yocto-20180916141923.bin</span><br><span></span><br><span>And=
 what they are:</span><br><span></span><br><span>$ oe-run-native u-boot-mkim=
age-native mkimage -l</span><br><span>tmp/deploy/images/beaglebone-yocto/fit=
Image--4.18.3+git0+7341720391_eba03655e8-r0-beaglebone-yocto-20180916141923.=
bin</span><br><span>Running bitbake -e u-boot-mkimage-native</span><br><span=
>FIT description: U-Boot fitImage for Poky (Yocto Project Reference</span><b=
r><span>Distro)/4.18.3+gitAUTOINC+7341720391_eba03655e8/beaglebone-yocto</sp=
an><br><span>Created: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sun Se=
p 16 14:14:47 2018</span><br><span> Image 0 (kernel@1)</span><br><span> &nbs=
p;Description: &nbsp;Linux kernel</span><br><span> &nbsp;Created: &nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;Sun Sep 16 14:14:47 2018</span><br><span> &nbsp;Type: &n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Kernel Image</span><br><span> &=
nbsp;Compression: &nbsp;uncompressed</span><br><span> &nbsp;Data Size: &nbsp=
;&nbsp;&nbsp;6381368 Bytes =3D 6231.80 KiB =3D 6.09 MiB</span><br><span> &nb=
sp;Architecture: ARM</span><br><span> &nbsp;OS: &nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Linux</span><br><span> &nbsp;Load Address: 0=
x80008000</span><br><span> &nbsp;Entry Point: &nbsp;0x80008000</span><br><sp=
an> &nbsp;Hash algo: &nbsp;&nbsp;&nbsp;sha1</span><br><span> &nbsp;Hash valu=
e: &nbsp;&nbsp;909137524ffd28b5b0ac51ea39c648b09902dc18</span><br><span> Ima=
ge 1 (<a href=3D"mailto:fdt@am335x-bone.dtb">fdt@am335x-bone.dtb</a>)</span>=
<br><span> &nbsp;Description: &nbsp;Flattened Device Tree blob</span><br><sp=
an> &nbsp;Created: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sun Sep 16 14:14:47 2018</s=
pan><br><span> &nbsp;Type: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fl=
at Device Tree</span><br><span> &nbsp;Compression: &nbsp;uncompressed</span>=
<br><span> &nbsp;Data Size: &nbsp;&nbsp;&nbsp;33030 Bytes =3D 32.26 KiB =3D 0=
.03 MiB</span><br><span> &nbsp;Architecture: ARM</span><br><span> &nbsp;Hash=
 algo: &nbsp;&nbsp;&nbsp;sha1</span><br><span> &nbsp;Hash value: &nbsp;&nbsp=
;0fece12f15fc5ac6c452d9308cd374c2c0cfea47</span><br><span> Image 2 (<a href=3D=
"mailto:fdt@am335x-boneblack.dtb">fdt@am335x-boneblack.dtb</a>)</span><br><s=
pan> &nbsp;Description: &nbsp;Flattened Device Tree blob</span><br><span> &n=
bsp;Created: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sun Sep 16 14:14:47 2018</span><b=
r><span> &nbsp;Type: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Flat De=
vice Tree</span><br><span> &nbsp;Compression: &nbsp;uncompressed</span><br><=
span> &nbsp;Data Size: &nbsp;&nbsp;&nbsp;34782 Bytes =3D 33.97 KiB =3D 0.03 M=
iB</span><br><span> &nbsp;Architecture: ARM</span><br><span> &nbsp;Hash algo=
: &nbsp;&nbsp;&nbsp;sha1</span><br><span> &nbsp;Hash value: &nbsp;&nbsp;337f=
6843020cb8fbaf119b43fd748222d32e72df</span><br><span> Image 3 (<a href=3D"ma=
ilto:fdt@am335x-bonegreen.dtb">fdt@am335x-bonegreen.dtb</a>)</span><br><span=
> &nbsp;Description: &nbsp;Flattened Device Tree blob</span><br><span> &nbsp=
;Created: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sun Sep 16 14:14:47 2018</span><br><=
span> &nbsp;Type: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Flat Devic=
e Tree</span><br><span> &nbsp;Compression: &nbsp;uncompressed</span><br><spa=
n> &nbsp;Data Size: &nbsp;&nbsp;&nbsp;33286 Bytes =3D 32.51 KiB =3D 0.03 MiB=
</span><br><span> &nbsp;Architecture: ARM</span><br><span> &nbsp;Hash algo: &=
nbsp;&nbsp;&nbsp;sha1</span><br><span> &nbsp;Hash value: &nbsp;&nbsp;4974e8b=
1656cd7f52829ac3c01f6747bece87cbc</span><br><span> Default Configuration: '<=
a href=3D"mailto:conf@am335x-bone.dtb">conf@am335x-bone.dtb</a>'</span><br><=
span> Configuration 0 (<a href=3D"mailto:conf@am335x-bone.dtb">conf@am335x-b=
one.dtb</a>)</span><br><span> &nbsp;Description: &nbsp;1 Linux kernel, FDT b=
lob</span><br><span> &nbsp;Kernel: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;kerne=
l@1</span><br><span> &nbsp;FDT: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;<a href=3D"mailto:fdt@am335x-bone.dtb">fdt@am335x-bone.dtb</a></sp=
an><br><span> &nbsp;Hash algo: &nbsp;&nbsp;&nbsp;sha1</span><br><span> &nbsp=
;Hash value: &nbsp;&nbsp;unavailable</span><br><span> Configuration 1 (<a hr=
ef=3D"mailto:conf@am335x-boneblack.dtb">conf@am335x-boneblack.dtb</a>)</span=
><br><span> &nbsp;Description: &nbsp;0 Linux kernel, FDT blob</span><br><spa=
n> &nbsp;Kernel: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;kernel@1</span><br><spa=
n> &nbsp;FDT: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=3D=
"mailto:fdt@am335x-boneblack.dtb">fdt@am335x-boneblack.dtb</a></span><br><sp=
an> &nbsp;Hash algo: &nbsp;&nbsp;&nbsp;sha1</span><br><span> &nbsp;Hash valu=
e: &nbsp;&nbsp;unavailable</span><br><span> Configuration 2 (<a href=3D"mail=
to:conf@am335x-bonegreen.dtb">conf@am335x-bonegreen.dtb</a>)</span><br><span=
> &nbsp;Description: &nbsp;0 Linux kernel, FDT blob</span><br><span> &nbsp;K=
ernel: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;kernel@1</span><br><span> &nbsp;FD=
T: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=3D"mailto:f=
dt@am335x-bonegreen.dtb">fdt@am335x-bonegreen.dtb</a></span><br><span> &nbsp=
;Hash algo: &nbsp;&nbsp;&nbsp;sha1</span><br><span> &nbsp;Hash value: &nbsp;=
&nbsp;unavailable</span><br><span>$ oe-run-native u-boot-mkimage-native mkim=
age -l</span><br><span>tmp/deploy/images/beaglebone-yocto/fitImage-linux.bin=
--4.18.3+git0+7341720391_eba03655e8-r0-beaglebone-yocto-20180916141923.bin</=
span><br><span>Running bitbake -e u-boot-mkimage-native</span><br><span>GP H=
eader: Size a0e1 LoadAddr a0e1</span><br><span></span><br><span>-- </span><b=
r><span>Alex Kiernan</span><br></div></blockquote></div></body></html>=

--Apple-Mail-89A5FFDB-F1C8-4EF5-B494-805AF1B49DFF--

--Apple-Mail-6873695F-1D38-44C6-A7EE-8A6BB3E5F360
Content-Type: application/pkcs7-signature;
	name=smime.p7s
Content-Disposition: attachment;
	filename=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIFNTCCBTEw
ggQZoAMCAQICEBiFfNjFoKh3iK1UZPIQ1iYwDQYJKoZIhvcNAQELBQAwgZcxCzAJBgNVBAYTAkdC
MRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoT
EUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50aWNh
dGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTE4MDQwODAwMDAwMFoXDTE5MDQwODIzNTk1OVow
JDEiMCAGCSqGSIb3DQEJARYTbGVvbkBzaWRlYnJhbmNoLmNvbTCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBAOW/MlYaqjBsCgks41RJm6ARAdqLWI3z3bbQ7GuCyNmFPn+UROVGIxPntzUr
PwZDJz59pmHoflIhbQgHIH38IkroxfjyN/2JH7mEfqpcGzvwav6bVgu3yd8qE3juUc/UvlE+2DUC
AzFj3rmtRmtpIk42B9aD7tMpMEz9o97S7qvnfkoEBcBzCkTQ5jwL6zXTXgN+p96ijOtHP1vkbbpX
y1+YZPMcZp5V9o46tOXFm3VYLyRqkmb0gbE6BwQevaDN/Yp8xHpSNAnWYEkhDE5gCirbYEnkliZT
G7swpqMsyLFXUrHuFoL90OaZhu+M7qpCPAcjsl7NVVUG+xgTvrW4pXECAwEAAaOCAekwggHlMB8G
A1UdIwQYMBaAFIKvbIz4xf6WYXzoHz0rcUhexIvAMB0GA1UdDgQWBBRKJ+NJdwyriZOifcpHIGTS
F1qIqDAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAgBgNVHSUEGTAXBggrBgEFBQcDBAYL
KwYBBAGyMQEDBQIwEQYJYIZIAYb4QgEBBAQDAgUgMEYGA1UdIAQ/MD0wOwYMKwYBBAGyMQECAQEB
MCswKQYIKwYBBQUHAgEWHWh0dHBzOi8vc2VjdXJlLmNvbW9kby5uZXQvQ1BTMFoGA1UdHwRTMFEw
T6BNoEuGSWh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0NPTU9ET1JTQUNsaWVudEF1dGhlbnRpY2F0
aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYsGCCsGAQUFBwEBBH8wfTBVBggrBgEFBQcwAoZJaHR0
cDovL2NydC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1
cmVFbWFpbENBLmNydDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29tb2RvY2EuY29tMB4GA1Ud
EQQXMBWBE2xlb25Ac2lkZWJyYW5jaC5jb20wDQYJKoZIhvcNAQELBQADggEBACA7m5k15RCPeDf4
5ti2arYdY0/NPY2Ge9GUoHWzpvNEyjnJ1X867im8hl1876Rz8f3P5EZvyOOpXz9MK6OHP+Fn9pVJ
+5ciIBXCNWQtUoQr1iy4Xxh6HWT3e8jToUkKnQpJ/Da9qSGCLFkIsmKxdHywxwB+9aUwMw4zus5a
G8oWCHVDTnEXJftuBXDvEHGj0Q2IfA6/TVQpes6bI0xUOQePgAlpsax0jbBZ8HAFyXVrjmu9LkuO
DT5iKiGBeeSpFcNPvCqAAcQv+oT6f1SBIPm2H2C0hlTVtqFNH4lesaOv2UaG8sdESR6jWsvts6wI
IhWZWYY65K/ketznMb0A7n4xggO3MIIDswIBATCBrDCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgT
EkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENB
IExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBT
ZWN1cmUgRW1haWwgQ0ECEBiFfNjFoKh3iK1UZPIQ1iYwCQYFKw4DAhoFAKCCAd8wGAYJKoZIhvcN
AQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTgwOTE3MTgwNTMwWjAjBgkqhkiG9w0B
CQQxFgQU33A72hzJVN6EeBS/g3IqtGnMEcYwgb0GCSsGAQQBgjcQBDGBrzCBrDCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEBiFfNjFoKh3iK1UZPIQ1iYwgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGXMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRowGAYDVQQKExFDT01PRE8gQ0EgTGltaXRlZDE9MDsGA1UEAxM0
Q09NT0RPIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIQGIV8
2MWgqHeIrVRk8hDWJjANBgkqhkiG9w0BAQEFAASCAQANSVqJ5nr6hjrb+GUKQTcMoX8xuN3y2oR6
GU2onEXQ0PXpZg5lHT2c5MxHJ+DaNQJJPteW3bRGmRBO9GqaZreuPFsMRWtnC/7n0aWZ8ipTmMhZ
TLi2Wu2N31fJQDf/fHJO7qVgkz2XXYUzTtWKEsyyqK5lCExJn9ySsnWsSj0ClKPiNaURtaWDmCTg
ad1erWaRw5fucyesAftgGa77I/T3iYxfX7Io1J2HP2SPL1JczdCTPfza/YXbC0PGuYzItTDXW6ja
X0j+nXgkqmvRtoYFYm8MKzgcUCSn9vvllFauskBaTBQZmK7KSrnaLPj6xfg6qzVCAwtI1dkuzn5z
pUcCAAAAAAAA

--Apple-Mail-6873695F-1D38-44C6-A7EE-8A6BB3E5F360--
