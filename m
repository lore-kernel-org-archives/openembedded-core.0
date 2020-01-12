Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67])
	by mail.openembedded.org (Postfix) with ESMTP id A1A077FD12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 04:51:22 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id x1so2674816qvr.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 20:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JITjGOS7DPBNdihMufgaBEhVS4Xpl5yQ9Vw4o5PMoGg=;
	b=btHKqghCYQ5+GffC4QpQzm/HwnYwuedhIA906yduIKApH8GvEy81G2bC3x7uza4yyt
	BVPWYMOvgydaO8EMkHPEpr0KHL9pUKvDC0NBZ1T7Jet8Yx/lkqTpVHLgOI0RwXBStrRG
	5dgrBnrM8nJFQtNyJsc7pn4pOM+kGi6ewpz8oNryQc4Ye99aSypiux+naWR61kjBShRF
	oYVd2iVBCyVzY72fB4z/8/I2+deH4itMAS8f7Dh6pIbHsLquGMQfhrTYBjX1zxbR7Gq6
	3XSMcHG/xZorCEcs5sBpSzqRdhyIgVb0H9qw+T40hmX9OBDRFZzOQx6s9hjpLJMq38DE
	zqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JITjGOS7DPBNdihMufgaBEhVS4Xpl5yQ9Vw4o5PMoGg=;
	b=ULfTTJJukOQG7/966owqHXlZIcYxatVAPpi9Od/ze0v3PhxLb1zOzbezVJYRUZb5Ro
	rwahMM4ih2iXBsM5abMD5kgmxRvtuiRzEAsvE89FQhJRXf1VndHfACoM0kEL4niEAB+s
	+5/mFteHkwBx8RPaeqC9KJJY6LSSPJAVS4e3wU3giWC6hyzZfohqAwXpvwMDOyEUiAiK
	KsKALXkut69746tldHb4e7Aa5/hKVU1KdBXe5JMvUM4DR+lT8mD4xXicwo2hHFAqs4QT
	wJxEukA6vZFinovzw8yVVrBjByuK89avfyolmwmAnyJGL81p0QC/bcCrzLTZPqt1KTw3
	W4yQ==
X-Gm-Message-State: APjAAAUobxTrkxUxY+wTD+tNo3IkoBpQUylfQY+dol9ryTd0tsHlovbw
	wRRgk2T1/+JD6dKyNQibqnGgaI5S1KpREC3WgyezC+ni
X-Google-Smtp-Source: APXvYqw44kQXH8GLAimSMZvwleCFrllOk6t2NXMgYTr8VVKXLaE3f2T+CL1m9o8umjBrKR7EizEaApz3rZx3eoR54Cc=
X-Received: by 2002:ad4:478b:: with SMTP id z11mr6187605qvy.185.1578804683028; 
	Sat, 11 Jan 2020 20:51:23 -0800 (PST)
MIME-Version: 1.0
References: <20200110172938.3060002-1-raj.khem@gmail.com>
	<b5b04e547e8c4816109af537260e5cbdb86e3c0d.camel@linuxfoundation.org>
	<CAMKF1srd9c8+yQO640y2rDFG=z17-9yAfsozYv7QPHMq44GprQ@mail.gmail.com>
	<31d38c3225adc5bd463669b92b9b168fa7610be4.camel@linuxfoundation.org>
In-Reply-To: <31d38c3225adc5bd463669b92b9b168fa7610be4.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Jan 2020 20:50:55 -0800
Message-ID: <CAMKF1sr_Ckw7XS-P7Nz4Vpb+-bMrMsiqHZi_Bo9J7JjNxdGEUQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] qemuboot-mips: Enable VGA device
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
X-List-Received-Date: Sun, 12 Jan 2020 04:51:22 -0000
Content-Type: text/plain; charset="UTF-8"

OK I can reproduce atleast couple of them

On Sat, Jan 11, 2020 at 3:44 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2020-01-11 at 12:25 -0800, Khem Raj wrote:
> >
> >
> > On Sat, Jan 11, 2020 at 1:16 AM Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > > On Fri, 2020-01-10 at 09:29 -0800, Khem Raj wrote:
> > > > This helps in booting weston images ( core-image-weston ) with
> > > fbdev
> > > > backend, without this westons initialization of fbdev backend
> > > fails
> > > > because it does not get correct frame buffer settings and exits
> > > > pre-maturely
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  meta/conf/machine/include/qemuboot-mips.inc | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/meta/conf/machine/include/qemuboot-mips.inc
> > > b/meta/conf/machine/include/qemuboot-mips.inc
> > > > index 978820a2e0..52cb28a5d2 100644
> > > > --- a/meta/conf/machine/include/qemuboot-mips.inc
> > > > +++ b/meta/conf/machine/include/qemuboot-mips.inc
> > > > @@ -5,3 +5,8 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyS0
> > > console=tty"
> > > >  QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
> > > >  # Add the 'virtio-rng-pci' device otherwise the guest may run
> > > out of entropy
> > > >  QB_OPT_APPEND += "-object rng-
> > > random,filename=/dev/urandom,id=rng0 -device virtio-rng-
> > > pci,rng=rng0"
> > > > +
> > > > +# For graphics to work we need to define the VGA device as well
> > > as the necessary USB devices
> > > > +QB_OPT_APPEND = "-show-cursor -device VGA,edid=on"
> > > > +QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device
> > > usb-kbd"
> > > > +
> > >
> > > The change is probably good but it causes consistent failures in
> > > out
> > > testimage runs for mips and mips64:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/1429
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/196
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/1431
> > >
> > > all due to errors appearing in the logs.
> >
> > Is it due to glibc 2.31 that we were discussing or a separate issue
>
> Separate, there are two issues.
>
> Cheers,
>
> Richard
>

