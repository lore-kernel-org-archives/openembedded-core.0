Return-Path: <brgl@bgdev.pl>
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
	[209.85.166.49])
	by mail.openembedded.org (Postfix) with ESMTP id BBA7E60267
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 08:03:16 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id f21so953358iol.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 01:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=koVd+OZMtCXDqJ7aBPbsDtpTLfWRH63YjpfVsdJZT0U=;
	b=X6smInn+yqIQAWmUFhMUJwPGh1nwY5l+5tYqbOLu6wNn97q7z2sqZ+AFdptmpzhUIg
	LwivsuPRO6NQs8t9ojmRSuCQKZ7j22SVLdB4GnExagLegwRXsGkdpDV14DTxxh+mN8cn
	d5pjouwoDvG8KCYEZIDklPwac/ordG+5tU4VuYhPVuvZD+8z99zStqfJ3p5GjtI9d47+
	TdeCeszEF4J7a0Ado2ZLWv4xGKF/s/meThxvqfpKCtztYkalhuCoTd/g75u88eI6qZnx
	ULBQO/fRGD78s6lnp0+c4Sj6R4DEGdn9i8c23aGPLFRs+LSpi4im5teBF9OfWaWCNiXz
	efHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=koVd+OZMtCXDqJ7aBPbsDtpTLfWRH63YjpfVsdJZT0U=;
	b=s9uw1HQzFnvkPJkoqyzmnqtDmIEo9wcVss6NWQcDqykkkBgKcVDuAYxcvVjBxvdVEC
	4llw4eX1lT7STYKDWvXucwcmcQUmmZipB6lOBQSqfiIowLwBgvCNVICfM/v4/Tc1Y9hs
	8NSAvLVtUeFrB8uuWMd/dZ0mQchxrcLwLC7FFk2prHN0Ozg4XUHiNX1yuv694gLKlZQg
	IVOz2XJSHGk6VTPzuid6U+G6d4OaQHzfJF7Gdv40T+eyX3EjZPlrLhBj02RsxA7aubtH
	a8iWWInYqZ45zlP+wGdDpeeQvVEBzfyIaY7StcfKosKOlKp/bcAoIGpNOIs9aFMhS4/5
	91lQ==
X-Gm-Message-State: ANhLgQ0XAomruwOUwdaJilWdmO1do3AJn/3fr6Mg6mEsHS7L0qr8tx30
	Vb7sbFsH1bNBOGJtLEjmEjOO9/PXBBFiebpPPdHMweJcUxk=
X-Google-Smtp-Source: ADFU+vtYbfc49vVbKRmNjELAWB6ugWbW2QwxY/xP2OcR5i6/iF9t5I+z5j38Ka+9QNmolKCtjy2xW6vuhvIaepUn3o8=
X-Received: by 2002:a5e:c70c:: with SMTP id f12mr1854076iop.130.1583913797458; 
	Wed, 11 Mar 2020 01:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRc=Mf_Ld80=Egf3jPBGYoGGZScSG3JHKL7cVArLihJSC8P0g@mail.gmail.com>
	<a571c00e-5c90-462b-2402-d82b5f0b8cf9@embexus.com>
	<CAMRc=MdizEv6uB_Z+zyCYjtZuoYVWK5LP9jBAGBazkWoCXr4EA@mail.gmail.com>
	<e17ac6c1-2be8-f383-ee2d-b357322db84d@embexus.com>
In-Reply-To: <e17ac6c1-2be8-f383-ee2d-b357322db84d@embexus.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Mar 2020 09:03:06 +0100
Message-ID: <CAMRc=McZTDzO7xhXfELL24-HW1CkE2OYW-Y5dW7jNxRMtNSRmQ@mail.gmail.com>
To: Ayoub Zaki <ayoub.zaki@embexus.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Solving a circular dependency issue between the main image and initramfs
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
X-List-Received-Date: Wed, 11 Mar 2020 08:03:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

wt., 10 mar 2020 o 23:54 Ayoub Zaki <ayoub.zaki@embexus.com> napisa=C5=82(a=
):
>
>
> On 10.03.20 23:02, Bartosz Golaszewski wrote:
>
> wt., 10 mar 2020 o 22:33 Ayoub Zaki <ayoub.zaki@embexus.com> napisa=C5=82=
(a):
>
> Do I implement do_install in image.bbclass so that initramfs can
> depend on core-image-full-cmdline:do_populate_sysroot and have the
> artifacts installed locally? But this would mean that the initramfs
> recipe deploys the main image artifact. Should we deploy the images
> earlier (before do_image_complete) for the initramfs recipe to fetch
> from DEPLOY_DIR_IMAGE? Any other ideas?
>
> I think that best thing is to implement the dm-verity stuffs as a wic
> plugin, check this example:
>
>
> https://github.com/intel/intel-iot-refkit/blob/master/meta-refkit-core/sc=
ripts/lib/wic/plugins/source/dm-verity.py
>
> This doesn't look like a correct solution. For starters: not every
> platform uses wic. The platform I'm aiming this at uses fastboot and
> requires separate images for each partition.
>
>
> My proposition was refering to your example :
>

The example is there just to include support for one of the reference
boards - BBB in this case. The initramfs itself as well as the rest
should be generic though.

>
> https://github.com/brgl/meta-security/commit/83c8e8fba6988249c9d351aa2ad6=
e02a71b010df#diff-33f7c29b373860ec45379a5f2dc42a75
>
>
> your are trying to include the dm-verity conversion output to your wic wk=
s using the following:
>
>
> part / --source rawcopy --ondisk mmcblk --sourceparams=3D"file=3D${IMGDEP=
LOYDIR}/${DM_VERITY_IMAGE}-${MACHINE}.${DM_VERITY_TYPE}"
>
>
> In this case you will definitely stuck in a circular dependency unless us=
ing a Wic plugin.
>

Actually this isn't a problem. The dm-verity class makes do_image_wic
depend on do_image_ext[234] and do_image_btrfs and since do_image_wic
is part of the same recipe, we can fetch the image from IMGDEPLOYDIR
before it's deployed.

Best regards,
Bartosz Golaszewski

