Return-Path: <maxim.uvarov@linaro.org>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id BC80B7FE81
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 11:47:57 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id u139so2538437ywf.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 03:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xFWULlcplddCeG9xPUUsq8r9CJcXZJQ4dUzZntBLe9I=;
	b=RXdRLuIsR88UUNQjXdMtO1797lAWEEO3pcbxj8qojqI/su+AzTprEJkgXjFfhJd/8D
	c2trmLnyxKE1dh0CD/taJIRxbh+BszwEyWIh/ShqZqxTy3JFaZsxssyCgOPEjYp/JGFN
	ZlcMCwhnlLuMFnjMf8r8hsmClBo52B3xZugQ+ZG5tG5rpQThHWrrcOspw6Tg+0J+JQCM
	nkv71fs7vm3nGEeydA3d8uHo9vMY+BGc7FuPiC4WTsWXPQtX/2JCHD/v4KRwD0e27CUA
	NXI8IrYavpimD2RBDHue4YaJyRRTR5haerTBNNCSRX5EuZZp0J93cLzYz50haeb5rYeX
	7qEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xFWULlcplddCeG9xPUUsq8r9CJcXZJQ4dUzZntBLe9I=;
	b=gawzCbaQ57EHOnOpJnmJzxIBifLqnxowhiVNS0WUmWPdZmUwPcXniD6u1C5Zt3ElTV
	8FuORutneF3CqQURBMqSvMjd6GCqwChLBJ1bO1VoonTnpmGAAiSCiIqRDQbNlmwnxEJZ
	wv+ne39UdUBc9+BSP1D9UCuV4Q8eXQBFh8DvBJRh+w87iyBe51+bA5c9M5WxhbvzTqQu
	baIWc+B789JkbevkYE3cLBnxL7ny+XIm8novW9jSrf6Yw+tOrYv4ylL6BiR717u48K4Y
	oBW+2y4aCoABB17YO5tNPzlCt/1o2YjVCZxJy0GGu+g7y0A34zMYu66plozn+dMS6swx
	AiXg==
X-Gm-Message-State: APjAAAV7Quu7WxkHFnSYUFtAhTiNBg6oUtrpJ7Vq9Mw1iGH7BxKBUllZ
	sqL4wO5onkc+O2jG5OajYigOCwCVC4IIkQtKDeMhkEAy4T4=
X-Google-Smtp-Source: APXvYqwIqwxk8qW9y7Q9QVQ/uxDL8IvqxgjG0ftIDswkRBbNPflDVmxYEBb9DIWwNSBZqutrjB/Lo2Zyusvn0jzU4j0=
X-Received: by 2002:a81:1c15:: with SMTP id c21mr7640320ywc.408.1578570478644; 
	Thu, 09 Jan 2020 03:47:58 -0800 (PST)
MIME-Version: 1.0
References: <20200104200703.6758-1-maxim.uvarov@linaro.org>
	<8b3eab92db8c79d69bff5eee95f1b9498bc96d65.camel@linuxfoundation.org>
In-Reply-To: <8b3eab92db8c79d69bff5eee95f1b9498bc96d65.camel@linuxfoundation.org>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Thu, 9 Jan 2020 14:47:47 +0300
Message-ID: <CAD8XO3YiX7Xj8z7s0AzDeAcR530RrCOixYjw+myd0Nim90pv7A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic: add UEFI kernel as UEFI stub
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
X-List-Received-Date: Thu, 09 Jan 2020 11:47:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, 5 Jan 2020 at 17:52, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2020-01-04 at 23:07 +0300, Maxim Uvarov wrote:
> > Linux kernel can be compiled as UEFI stub and loaded directly
> > with UEFI firmware without grub or other UEFI shell.
> >
> > Tested with wic file:
> > bootloader  --ptable gpt --timeout=0  --append="rootwait"
> > part /boot --source bootimg-efi --sourceparams="loader=kernel" \
> >  --ondisk sda  --fstype=vfat --label bootfs \
> >   --active --align 1024 --use-uuid
> > part / --source rootfs --fstype=ext4 --label rootfs \
> >   --align 1024 --exclude-path boot/ --use-label
> > The same wic file for armv7, armv8 and x86_64.
> >
> > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > ---
> >  scripts/lib/wic/plugins/source/bootimg-efi.py | 27
> > +++++++++++++++++++
> >  1 file changed, 27 insertions(+)
>
> wic has fairly complete tests, do we need to add a test for the new
> functionality?
>
> ("oe-selftest -r wic")
>
> Cheers,
>
> Richard
>
I'm currently looking to zeus branch and it looks like test uses this file:
openembedded-core/meta-selftest/./recipes-test/images/wic-image-minimal.wks

I think it will be good to add test for --source bootimg-efi
--sourceparams="loader=kernel".
Do you want to change wic-image-minimal.wks? Or just put this file to
openembedded-core/meta-selftest/wic/
directory and somehow it will be tested?

Maxim.

