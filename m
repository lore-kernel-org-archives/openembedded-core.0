Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id A18F960621
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 08:30:55 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id m125so19468611wmm.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 01:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zO+H8+LVfB9XKaRad0MWkoluPv9SsNB5FbrQOMwY9iA=;
	b=HBuVy4mIuraMTatHTpbB5epbUWNvDKyBtAZ93oElkmVReW5edJurELeuFBc7uUbTjP
	8Skcpc7hdM8KDJ5NCwPIZV0XQHBXgnkU0veUcCCEt/cf3fL9bmJbFh4KWCjXbh6PTVf6
	12oiBlBreEeiOFakmStgJ/3ZZQCZ/PbWswZprahKri+BAg3bUgeTrd9Nv9gWX/zth9E/
	pkqFFYlN9b3Q1Tc7szkdTaKccLYTV9cB8jU9JhKykPRQZTfQns4fOa/rpymkzahfvArC
	gDpjhpXldwvSaCjzN/2kBlwNQVyqlJAQ1njNNUU/C9HjDRMXYTLz+KCG7Z+PXJelh6y3
	7cHg==
X-Gm-Message-State: AKS2vOy4ajJb8Nvz0iG5l4uRanHAJdA2/i3pEGhyIQ/q/U6faezU7i6p
	NWmtZYzHxsa3vwpysXE=
X-Received: by 10.80.186.120 with SMTP id 53mr6449166eds.47.1497601856867;
	Fri, 16 Jun 2017 01:30:56 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id y4sm1005082edc.40.2017.06.16.01.30.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Jun 2017 01:30:55 -0700 (PDT)
Message-ID: <1497601854.19546.29.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 09:30:54 +0100
In-Reply-To: <OFC3B840C2.31FE1246-ON88258141.0000F82B-88258141.00016B00@selinc.com>
References: <OFC3B840C2.31FE1246-ON88258141.0000F82B-88258141.00016B00@selinc.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: extensible SDK doesn't install when initramfs is bundled with kernel?
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
X-List-Received-Date: Fri, 16 Jun 2017 08:30:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-06-15 at 17:15 -0700, Aaron_Wright@selinc.com wrote:
> > Hi,
> > 
> > It looks like I can't install the extensible SDK if my initramfs is 
> 
> bundled
> > with the kernel.
> > 
> > I am building two images - my-image & my-image-initramfs (which are 
> 
> mostly
> > identical at the moment). I have also set
> > INITRAMFS_IMAGE = "my-image-initramfs"
> > INITRAMFS_IMAGE_BUNDLE = "1"
> > 
> > So far so good and things work as expected, I can build image +
> > kernel/initramfs fine.
> > 
> > 
> > Installation of the extensible SDK generated using
> > bitbake -c populate_sdk_ext my-image or
> > bitbake -c populate_sdk_ext my-image-initramfs
> > fails though:
> > 
> > 
...
> I'm running up against this problem right now on morty. Was this ever 
> resolved?

I never got this to work, and then had no time to look at it any further...
It'd definitely be nice to have that working.

That said, I don't know if it's working on master these days and something
could be cherry-picked.


Cheers,
Andre'



