Return-Path: <brgl@bgdev.pl>
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
	[209.85.166.178])
	by mail.openembedded.org (Postfix) with ESMTP id CB0FC60B2A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 22:03:01 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id g126so109218ilh.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 15:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=G2jJ5rvlpzEMAlLTiSzu8Ou2xTSDWX1eXk3LPCPiUfs=;
	b=ix9yZyZYj2IVb6rhmv+3kbcueqWXP8UzxAwqamQvMXTDzDmMtWJPLlX7viCXZHOdyI
	wd0fp7OPef/ME9Ke89JW/Bm0CKsQ4uMggT+8/nBfihDbOlo+oxP+Y+IkDW8XLS/Cy0Dd
	8SsTrsjiLNK48A8n9I87wd7AIZhfDQ49f/eTnBQ16h86xcHRAPHP+gCH8Y0gau55NeBT
	FA6PClX0rKO0GBG2b8l//WMSGHaQgmYpqLFauN2tmEf/Plz3byKn57bh1sMrC3vlgYXv
	qXcP7KSAYiB1PO9IHZqJAdosTuSfLZicuvCSgH8ACtnzrP3hNCiE/MV8ZhSWwlHJZ62s
	m1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=G2jJ5rvlpzEMAlLTiSzu8Ou2xTSDWX1eXk3LPCPiUfs=;
	b=Ie3K11Vg6EM11dKhDjBRljhH1FqBmoHWI/1GtTicozvaQefwnJLKGjCng7iC0WOJWW
	NNm+rkMJqk3VfhpkWr1J2aC409Wf5FMsekeAy8Jnh8iO1q+LYugRcdt6Z/it8zvnfH/o
	aA9S/c62x4xG0RB8K22bf7T8lE1wwcFCd7DZMnyVR0I8vsdAVGC8A/3wX7IJ8QH/pLDc
	BTJstcqi7bcaHr5XRmHAXXg/h/nrkZBz0Kzc/Mh6cVM3Cx489EH+vzMG8L5gh/mzA+d8
	8YlKi8VAeiwuxSNYg6nivpVE4KfIzUAcGuHfo7GM8VvtjHqhyC04ezAVkwcXu+0wbITW
	b6vw==
X-Gm-Message-State: ANhLgQ1DR2JotZsltqG6XTp/XVYwlRFkMRTDb2go+FS/Im/OAIEN21FP
	F5SBukZsnNCu3iJZy+07rfGDgNl2JDG2J/d7nUj6XZdl
X-Google-Smtp-Source: ADFU+vvS7s4VYHApPPqvFOz1lmivgaO8XOBf4A35Zkrr/kUW6D/9PHzmX4b79GsBKKKdDqjNW4BAPPKwww/iYxKP6Co=
X-Received: by 2002:a92:af8c:: with SMTP id v12mr210863ill.6.1583877782819;
	Tue, 10 Mar 2020 15:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRc=Mf_Ld80=Egf3jPBGYoGGZScSG3JHKL7cVArLihJSC8P0g@mail.gmail.com>
	<a571c00e-5c90-462b-2402-d82b5f0b8cf9@embexus.com>
In-Reply-To: <a571c00e-5c90-462b-2402-d82b5f0b8cf9@embexus.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Mar 2020 23:02:51 +0100
Message-ID: <CAMRc=MdizEv6uB_Z+zyCYjtZuoYVWK5LP9jBAGBazkWoCXr4EA@mail.gmail.com>
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
X-List-Received-Date: Tue, 10 Mar 2020 22:03:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

wt., 10 mar 2020 o 22:33 Ayoub Zaki <ayoub.zaki@embexus.com> napisa=C5=82(a=
):
>
> >
> > Do I implement do_install in image.bbclass so that initramfs can
> > depend on core-image-full-cmdline:do_populate_sysroot and have the
> > artifacts installed locally? But this would mean that the initramfs
> > recipe deploys the main image artifact. Should we deploy the images
> > earlier (before do_image_complete) for the initramfs recipe to fetch
> > from DEPLOY_DIR_IMAGE? Any other ideas?
>
>
> I think that best thing is to implement the dm-verity stuffs as a wic
> plugin, check this example:
>
>
> https://github.com/intel/intel-iot-refkit/blob/master/meta-refkit-core/sc=
ripts/lib/wic/plugins/source/dm-verity.py
>

This doesn't look like a correct solution. For starters: not every
platform uses wic. The platform I'm aiming this at uses fastboot and
requires separate images for each partition.

This plugin also seems to be unnecessarily complicated with additional
signature for the verity hash tree. This is not needed as long as the
root hash comes from a secure place - which it does in my case: the
fitImage containing the initramfs is signed and the key is appended to
u-boot's DTB. When do_image_wic starts, u-boot and initramfs assembly
are long completed - another reason for not using a wic plugin.

Best regards,
Bartosz Golaszewski

