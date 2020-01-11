Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 92A987FB43
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 23:44:58 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f129so5787548wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 15:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=q8kFllMT/53ROzGe83zlVBxrY4uBeGTsL5eM8ihcOyE=;
	b=Ax/WflMoqhi9M/P/yCfkuyzfbefIlaSiTwUq8udh4OJ7lmgBDwJXa2RYdBqvvbr3vr
	LC9fk9mTHygf6rS0IPhNc2xXGdeSsXwxCOCQYIJu6YPI/092shezIJnL5XCK7zfxLrAS
	dTFtkuQg26RceMv3wKLuF4Q6d0reQoYBUckuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=q8kFllMT/53ROzGe83zlVBxrY4uBeGTsL5eM8ihcOyE=;
	b=SO50dp4sMBZJtLfdLWwC8sZT5CcpBBj6vu8WRxY0+I5YgxXqFUt18MegOlGF3iiJt8
	jTnIw8w/YlVQ6YEM4GAiXSEVUchOGBVXSpZDenqs/xG4fmsTBccml0r7is444Ipb8+me
	BNhWLTHWKaVPfYyeJNjqhpAiUe8ydj7mJY622FSQNC0tG4tsfN80ruOClm6yAQTwT6R1
	9TeIHn9fUs/PpiKvXnBEn4BgeNWcQUazRRLuh/OF1JIFNjsaELnoB9OeO4Xl/pNfvPfE
	K3F5Qhp0GOzsSeAv7HTmNRy2bSaHaXZbr2paQ/YtJuskBn4I10fZTRGb6ixgiGwr8MlW
	6I5Q==
X-Gm-Message-State: APjAAAX4XKoEx3Rqz3Wih6LwJeZjWr/OJwqVqKm1wljsmLpoqXZWgFtZ
	XxoFkAzK084RnZso+eMni6Ar4A==
X-Google-Smtp-Source: APXvYqymfqpa6eRbe1sHnZUapW5lGwrh637dUNqOeoGSFKEToJ8l8oskTyA9fQwoYJDchZJe2rowIQ==
X-Received: by 2002:a1c:b456:: with SMTP id d83mr11637875wmf.172.1578786299185;
	Sat, 11 Jan 2020 15:44:59 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i16sm8466720wmb.36.2020.01.11.15.44.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 11 Jan 2020 15:44:58 -0800 (PST)
Message-ID: <31d38c3225adc5bd463669b92b9b168fa7610be4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Jan 2020 23:44:57 +0000
In-Reply-To: <CAMKF1srd9c8+yQO640y2rDFG=z17-9yAfsozYv7QPHMq44GprQ@mail.gmail.com>
References: <20200110172938.3060002-1-raj.khem@gmail.com>
	<b5b04e547e8c4816109af537260e5cbdb86e3c0d.camel@linuxfoundation.org>
	<CAMKF1srd9c8+yQO640y2rDFG=z17-9yAfsozYv7QPHMq44GprQ@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Sat, 11 Jan 2020 23:44:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-01-11 at 12:25 -0800, Khem Raj wrote:
> 
> 
> On Sat, Jan 11, 2020 at 1:16 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2020-01-10 at 09:29 -0800, Khem Raj wrote:
> > > This helps in booting weston images ( core-image-weston ) with
> > fbdev
> > > backend, without this westons initialization of fbdev backend
> > fails
> > > because it does not get correct frame buffer settings and exits
> > > pre-maturely
> > > 
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/conf/machine/include/qemuboot-mips.inc | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/meta/conf/machine/include/qemuboot-mips.inc
> > b/meta/conf/machine/include/qemuboot-mips.inc
> > > index 978820a2e0..52cb28a5d2 100644
> > > --- a/meta/conf/machine/include/qemuboot-mips.inc
> > > +++ b/meta/conf/machine/include/qemuboot-mips.inc
> > > @@ -5,3 +5,8 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyS0
> > console=tty"
> > >  QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
> > >  # Add the 'virtio-rng-pci' device otherwise the guest may run
> > out of entropy
> > >  QB_OPT_APPEND += "-object rng-
> > random,filename=/dev/urandom,id=rng0 -device virtio-rng-
> > pci,rng=rng0"
> > > +
> > > +# For graphics to work we need to define the VGA device as well
> > as the necessary USB devices
> > > +QB_OPT_APPEND = "-show-cursor -device VGA,edid=on"
> > > +QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device
> > usb-kbd"
> > > +
> > 
> > The change is probably good but it causes consistent failures in
> > out
> > testimage runs for mips and mips64:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/1429
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/196
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/1431
> > 
> > all due to errors appearing in the logs.
> 
> Is it due to glibc 2.31 that we were discussing or a separate issue 

Separate, there are two issues.

Cheers,

Richard


