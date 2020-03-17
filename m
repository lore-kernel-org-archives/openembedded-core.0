Return-Path: <brgl@bgdev.pl>
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
	[209.85.166.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1832C60225
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 14:05:25 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id y24so478143ioa.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 07:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=xjqK7wWKFERCfQCzwRo+ehjOiUgm/QUO73VKp3ihPmA=;
	b=u+q/eMl073f6MHE9AkUkwDlvcS68QDetBRtzy8gDqkKdp7/TaOCh/P5sPqb4GhpwSj
	S2ncyR8kWQpBGLgrLBtBBlBOINoLYgVhvjSmDxT/pbb6RVr+Tx8DIiGd+pQEGbrPwROc
	1LLrsN+UtSZqiEURNQvVw7DUwvdIW3pr6yBEMyhyvVGIIkw52jwekg7lxKclE8Gj5TRu
	HU/OVo4ZoIhHfqolFJU33nEfInd+Ue/pACQOL4hrOWlRDC0psbP0K0TR2zMhwnlD/mnz
	s87ruTAIvDcFoVesxoTyDdZ1fI2IdY1J3zmfUNCrZtgz3cMcnong76U2S3UutuaABHel
	+CVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=xjqK7wWKFERCfQCzwRo+ehjOiUgm/QUO73VKp3ihPmA=;
	b=ueUhiext9ywzSmpkoGA5smJvoP3UvL2Wn+6gp8wZDVjqu0fedHPfX8G53n9ickZ2a0
	OsR0e2AkJz+5i0SoDSIwooG7+9aWyClHo7nJLFviEYqVJYiCINxbj/Dt/nrQzOlVZ2bS
	XdCSJGB673qzwCm3+0ZgrJ+olVNkhxXzHof9TlvG+ivm2DJKtEi9PloK176e5dL1YR0N
	zeD7/c4EN+h1XA0UFP55AYtYs8H30ZWPGAbroHpuGLtyD8tzT8wywUl6muvuHqQYfaoX
	A2MoLRzNk8aXhA7UjyItIaK0OclS7KPdFdrKI2G6nRwkPGuvs9qtZ/l09wUrJctPECTt
	HgKw==
X-Gm-Message-State: ANhLgQ2S2yyJLUNy9uvB2rnU6+gEJQhbSkRFIiDdBPhAdoRpZUhc6Mae
	Wlo1iko6P06bt1lmWENE23jAg5Sd4OLxYVMSmcydkw==
X-Google-Smtp-Source: ADFU+vuSiFxUS+NVlgLBJ4a6TPihwP9FiZhWp0Oh704Lb4zC/k9LT+PFlsdz9uYz92ttjVQTvb/Xj941Z1JiXHC+Cwc=
X-Received: by 2002:a02:ce55:: with SMTP id y21mr3310243jar.24.1584453926749; 
	Tue, 17 Mar 2020 07:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRc=Mf_Ld80=Egf3jPBGYoGGZScSG3JHKL7cVArLihJSC8P0g@mail.gmail.com>
	<e9e9a9c8fc2a1895ace0e4f9d57df0b0c1f3f86b.camel@verisure.com>
In-Reply-To: <e9e9a9c8fc2a1895ace0e4f9d57df0b0c1f3f86b.camel@verisure.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Mar 2020 15:05:15 +0100
Message-ID: <CAMRc=MeoV1rVZDHv03SvPL4FvAT-G7X13nSznOcH8XN3eR76Fw@mail.gmail.com>
To: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernst.sjostrand@verisure.com>
Cc: "jneanne@baylibre.com" <jneanne@baylibre.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"gpain@baylibre.com" <gpain@baylibre.com>
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
X-List-Received-Date: Tue, 17 Mar 2020 14:05:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 16 mar 2020 o 15:03 Ernst Sj=C3=B6strand
<ernst.sjostrand@verisure.com> napisa=C5=82(a):
>
> Hi!
>
> I have done something very similar, here's what I did.
>
> My ramdisk is just a vanilla cpio.
> My kernel is just vanilla zImage.
>
> My main image does "inherit magic" and magic.bbclass does something like =
this, where create_custom_fitimage has a lot of kernel-fitimage.bbclass cop=
ied out.
> do_magic () {
> create_custom_fitimage
> install fitImage.bin ${IMAGE_ROOTFS}/boot/fitImage
> }
> do_magic[depends] +=3D "my-ramdisk:do_image_complete  virtual/kernel"
> addtask magic before do_image after do_pre_image_task
>
> It does read a lot of stuff from deploy but so does the main kernel-fitim=
age.bbclass so I don't think that's a problem.
>
> Regards
> //Ernst
>

There are probably many workarounds for this, but if we can't do this
with upstream OE-core then something is broken/missing upstream and we
should fix it. This is what I'm trying to do. I'm just looking for the
right way. I don't want to carry some non-upstreamable workaround over
to every other project I'm working on - optimally this should be made
part of OE-core/meta-security.

Best regards,
Bartosz Golaszewski

