Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 388D86010D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 12:31:37 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id s37so2640536ioe.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 04:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H+VAHXHmklzqrKGQzWZQSuVXoLKsWFTfb71l/EDI5A8=;
	b=q2OVRz2ya9ckYnpqmRQde2GkEnUiZbudw6OcaNSANkYLKsYfA8X9wgVxiCFX9stMiN
	V8z/OippeDgC3T5/hLOTojKkGe1pFLzQqqadDL/2j2ozAmLrKsaXCClqTQJ2/wAW3Xz8
	8FzTwxSiimo+bmHwBAlCrB0ysJoocE2MkOoQu+HJmys5eW8d3Qpn05O2WViZqGrwTkwy
	7MDORMlXPDn7HfOQGbKLPoZCk7EsEI14UQuYW5FPJPdt3T+fKhieEDYHAXuzom/ItsRU
	+wQUb2nuOdKkysODP74iIBTbdcnn3YzXTUNI4ZatcuVdP/r6I4DJ52mJJ6uQSOMW2SLz
	fXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H+VAHXHmklzqrKGQzWZQSuVXoLKsWFTfb71l/EDI5A8=;
	b=l88C3UIj3Wt7L1BqfJ/3hmvJZp9V680azDBpuOhVtopF98NFCJ2jfxcShf9nG+tg80
	lIpl/QLKZ/wjhH8JARw36Kxdk066ElupQedMyTSwnnK7ltsJ2zEXoX2qLyL4zsxS09P7
	RWOeogAfzyiNQFoSZtJznDePCuQFEop10hJ15TbqHjnMm5yGygBVux6UD3adaLTwiI1W
	3c/2KbYbE6rmIgYUzKoBwTGr8d/B4/YQB5JhR6YJPRKjGixYEyRm96oMywoFRE+I68fF
	HbJWxoTFI2VV4dGW/TWbbflacP1ljWt38mqAWaCH99YfBcWSK2Tnt2mqEBqbJ3qeuCRy
	INag==
X-Gm-Message-State: AKGB3mJQtcPaZ85Je78q4CPTvF6uqPldFfL40nN9RSJRlQs4WZ6bTVjM
	n85c5wSV83S66zBZ1F6Xzq6jOq7e/pVFeTnc9IBg3Q==
X-Google-Smtp-Source: ACJfBotbK1OzOR/lQ0V8GbAOwfvdqgQtocDWIoq6HJ4uoZ+5xo2+Y8Z8oyxni4FWvkJJ6StZtgKLZnlVrlYg7LKdib8=
X-Received: by 10.107.47.1 with SMTP id j1mr2610579ioo.217.1513168299244; Wed,
	13 Dec 2017 04:31:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Wed, 13 Dec 2017 04:31:18 -0800 (PST)
In-Reply-To: <47b7ee7a-938e-a893-10ba-f766a3f16060@ni.com>
References: <1500479806.27323.202.camel@intel.com>
	<20171107184039.31164-1-haris.okanovic@ni.com>
	<1510179606.1903.92.camel@intel.com>
	<f65277d0-e056-5181-9cc9-1e78e4e97c6b@ni.com>
	<CAJTo0LaZ7cQFyvMazuZ9PAFMdFgptBHovLBpsHsBmQbmo+19qw@mail.gmail.com>
	<47b7ee7a-938e-a893-10ba-f766a3f16060@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Dec 2017 12:31:18 +0000
Message-ID: <CAJTo0LZ-vib0jUNyZP7Eaf9SrtJkQ4fiof9PdzOrR16kqJ_hsw@mail.gmail.com>
To: Haris Okanovic <haris.okanovic@ni.com>
Cc: "Ashfield, Bruce \(Wind River\)" <bruce.ashfield@windriver.com>,
	"josh.hernstrom@ni.com" <josh.hernstrom@ni.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Wold,
	Saul" <saul.wold@intel.com>
Subject: Re: [PATCH v9] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Wed, 13 Dec 2017 12:31:38 -0000
Content-Type: multipart/alternative; boundary="001a11377fbcf657f4056037f202"

--001a11377fbcf657f4056037f202
Content-Type: text/plain; charset="UTF-8"

On 12 December 2017 at 22:19, Haris Okanovic <haris.okanovic@ni.com> wrote:

> I can see a reference to "/boot/bzImage" in both buildhistory and
> tmp-glibc/work/.../pkgdata [1] after running a clean rebuild of
> virtual/kernel [2].
>
> [1] file paths:
>
> "buildhistory/packages/qemux86-oe-linux/linux-yocto/kernel-
> image-bzimage/files-in-package.txt"
>
> "tmp-glibc/work/qemux86-oe-linux/linux-yocto/4.12.12+gitAUTO
> INC+eda4d18ce4_16de014967-r0/pkgdata/runtime/kernel-image-bzimage"
>
> [2] clean rebuild command:
>  bitbake -c cleanall virtual/kernel
>  bitbake virtual/kernel
>
> Which file are you diffing? Could you share the full path?
>

If I build a qemux86 virtual/kernel without and with this patch and then
run buildhistory-diff:

packages/qemux86-poky-linux/linux-yocto/kernel-image-bzimage: FILELIST:
removed "/boot/bzImage"
packages/qemux86-poky-linux/linux-yocto/kernel-image-bzimage: PKGSIZE
changed from 7020062 to 7020032 (0%)

kernel-image-bzimage contains /boot/bzImage-4.12.16-yocto-standard but not
the /boot/bzImage symlink:

$ cat
buildhistory/packages/qemux86-poky-linux/linux-yocto/kernel-image-bzimage/files-in-package.txt
drwxr-xr-x root       root               60 ./boot
-rw-r--r-- root       root          7020032
./boot/bzImage-4.12.16-yocto-standard

Ross

--001a11377fbcf657f4056037f202
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 12 December 2017 at 22:19, Haris Okanovic <span dir=3D"=
ltr">&lt;<a href=3D"mailto:haris.okanovic@ni.com" target=3D"_blank">haris.o=
kanovic@ni.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color=
:rgb(204,204,204);padding-left:1ex">I can see a reference to &quot;/boot/bz=
Image&quot; in both buildhistory and tmp-glibc/work/.../pkgdata [1] after r=
unning a clean rebuild of virtual/kernel [2].<br>
<br>
[1] file paths:<br>
<br>
&quot;buildhistory/packages/qemux86<wbr>-oe-linux/linux-yocto/kernel-<wbr>i=
mage-bzimage/files-in-package<wbr>.txt&quot;<br>
<br>
&quot;tmp-glibc/work/qemux86-oe-lin<wbr>ux/linux-yocto/4.12.12+gitAUTO<wbr>=
INC+eda4d18ce4_16de014967-r0/<wbr>pkgdata/runtime/kernel-image-<wbr>bzimage=
&quot;<br>
<br>
[2] clean rebuild command:<br>
=C2=A0bitbake -c cleanall virtual/kernel<br>
=C2=A0bitbake virtual/kernel<br>
<br>
Which file are you diffing? Could you share the full path?<br></blockquote>=
<div><br></div><div>If I build a qemux86 virtual/kernel without and with th=
is patch and then run buildhistory-diff:</div><div><br></div><div>packages/=
qemux86-poky-linux/linux-yocto/kernel-image-bzimage: FILELIST: removed &quo=
t;/boot/bzImage&quot;<br></div><div>packages/qemux86-poky-linux/linux-yocto=
/kernel-image-bzimage: PKGSIZE changed from 7020062 to 7020032 (0%)</div><d=
iv><br></div><div>kernel-image-bzimage contains=C2=A0/boot/bzImage-4.12.16-=
yocto-standard but not the /boot/bzImage symlink:</div><div><br></div><div>=
<div>$ cat buildhistory/packages/qemux86-poky-linux/linux-yocto/kernel-imag=
e-bzimage/files-in-package.txt</div><div>drwxr-xr-x root =C2=A0 =C2=A0 =C2=
=A0 root =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 60 ./boot</div><d=
iv>-rw-r--r-- root =C2=A0 =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A07020032 ./boot/bzImage-4.12.16-yocto-standard</div></div><div><br></d=
iv><div>Ross</div></div></div></div>

--001a11377fbcf657f4056037f202--
