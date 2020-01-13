Return-Path: <maxim.uvarov@linaro.org>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id 20D8B7FCE3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 13:14:19 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id i190so5960598ywc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 05:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9egG1fSqWo3ZQnrqx25VXkuU75cgAp1DYyZpTxSdHm4=;
	b=PndcBgufyIoX2yzkkQo/vcjMd1TxhTfOrogm3jRvwXCYhmqDYPiHW+IYyguaQCCg4I
	h/9OvlKHvSvWxmNEpKwNleNP5QPBynbgVTJQ2gGZebxuX9YDfo8Ud/8g3VADYh5Nzyr0
	eKXd5wENV0F8Pj2WRXTwBkyouJLbZcSRHemsCTt6DkrI8JMzsZBpgMVg7PIjOC1j2qQ4
	917j+3rlXvGFzLjIkM13uEXI+fl10Q2NET2QRX+NKBPgujWs0p7aW/VfJ5EwmAmiSOIm
	UwPMWTY/zNAKRsfsN/tVhY2wYAh3bIr2uCLhU1WkyHXfUbpRRr1GTAJThRJ8Yskekr/U
	jbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9egG1fSqWo3ZQnrqx25VXkuU75cgAp1DYyZpTxSdHm4=;
	b=Yokc5fzaIbfcY9UUXnGYUGLC01ZpWNeVvl45AoMSWN9W1WggszVbhC54bCJwmX3Yfb
	WOfYy7wqjLPYkbckV0aZ1CG/zcDUAL6pLzsV6gY9YXGMgNRPJDPClsvh6oSSZTPqfgAq
	/tNj8gaguOuSEId+k2iuV5skwubbqQ40ARZLwKjA3MYc91gNTnJauzx/dSVS76yoqWA3
	RZd12vPDcMwQ/lIu7OkhlXKO20FjkEbdkUV8LNanstILnODnygI+cq3RpsiwwaDK91N0
	qpGy/G+p2yzBwKf3LwiYbQgOoC4WLKx06VgAjaE2Na95bwQ8duoQmiRJygE8y8h/jxLA
	Fn1Q==
X-Gm-Message-State: APjAAAXY6KHQ9ri37YCDDePlDvi/7JmALL3SZYc2k8lpaGWYIbW5bEUK
	/eJkcKhPn8dZYQqn+y3Ae8PDfVnRhPojz3lthTVGqQ==
X-Google-Smtp-Source: APXvYqy3optccEdz0wbM+IPTn+gAmNK0LF9XBglI4o4KgYZAihv9ylzybtOrEpbKnQ/ocoyZERopfqt/kZi164yd4mU=
X-Received: by 2002:a81:9e02:: with SMTP id m2mr13179695ywj.292.1578921259964; 
	Mon, 13 Jan 2020 05:14:19 -0800 (PST)
MIME-Version: 1.0
References: <20200104200703.6758-1-maxim.uvarov@linaro.org>
	<8b3eab92db8c79d69bff5eee95f1b9498bc96d65.camel@linuxfoundation.org>
	<CAD8XO3YiX7Xj8z7s0AzDeAcR530RrCOixYjw+myd0Nim90pv7A@mail.gmail.com>
In-Reply-To: <CAD8XO3YiX7Xj8z7s0AzDeAcR530RrCOixYjw+myd0Nim90pv7A@mail.gmail.com>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Mon, 13 Jan 2020 16:14:09 +0300
Message-ID: <CAD8XO3Z2X6m7EnCbAxhJDsoc-GuFfNUbfvP19WRhp9ow0qEQTg@mail.gmail.com>
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
X-List-Received-Date: Mon, 13 Jan 2020 13:14:19 -0000
Content-Type: text/plain; charset="UTF-8"

Can this patch be applied without embedded test?

On Thu, 9 Jan 2020 at 14:47, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> On Sun, 5 Jan 2020 at 17:52, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Sat, 2020-01-04 at 23:07 +0300, Maxim Uvarov wrote:
> > > Linux kernel can be compiled as UEFI stub and loaded directly
> > > with UEFI firmware without grub or other UEFI shell.
> > >
> > > Tested with wic file:
> > > bootloader  --ptable gpt --timeout=0  --append="rootwait"
> > > part /boot --source bootimg-efi --sourceparams="loader=kernel" \
> > >  --ondisk sda  --fstype=vfat --label bootfs \
> > >   --active --align 1024 --use-uuid
> > > part / --source rootfs --fstype=ext4 --label rootfs \
> > >   --align 1024 --exclude-path boot/ --use-label
> > > The same wic file for armv7, armv8 and x86_64.
> > >
> > > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > > ---
> > >  scripts/lib/wic/plugins/source/bootimg-efi.py | 27
> > > +++++++++++++++++++
> > >  1 file changed, 27 insertions(+)
> >
> > wic has fairly complete tests, do we need to add a test for the new
> > functionality?
> >
> > ("oe-selftest -r wic")
> >
> > Cheers,
> >
> > Richard
> >
> I'm currently looking to zeus branch and it looks like test uses this file:
> openembedded-core/meta-selftest/./recipes-test/images/wic-image-minimal.wks
>
> I think it will be good to add test for --source bootimg-efi
> --sourceparams="loader=kernel".
> Do you want to change wic-image-minimal.wks? Or just put this file to
> openembedded-core/meta-selftest/wic/
> directory and somehow it will be tested?
>
> Maxim.

