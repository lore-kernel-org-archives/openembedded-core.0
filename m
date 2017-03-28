Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2633577AE1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 19:01:27 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id t189so6734612wmt.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YLQV1/psMdY6/lnmMZsUIE4HGGuyVxTnJ5pIx0hB9WU=;
	b=Y+tNVkM9yf7TbXUhEdVNMXpgkvAGaES0htOImvWiJxwvP5W2pieKMqiXyL0d1747S+
	NxcwTvR/aPLLudyMbdJ0oFSdgNLyZkp843BXxWFHoRAaWfDPdc1x6jO7dxamsMB21V8W
	s4pGeUqUXOHmKIdR9BaqTlgAwKRjIvIQ7XjnyKolQ0Z0Fp1cs2T3MFAJbsz4wyub0+r5
	uetJKfU11Pz/p6/lNE+fTKruMTH8tX1US03ywR06YoX3qvbgfP3OdncT+Bg7e5SQSHLP
	y6tWskXzxLDXeu26gd/gZanwYVyIFUzY5dSZfx3ZOO5gSSvfPDGpRySnoBr75qh1gLpH
	2lSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YLQV1/psMdY6/lnmMZsUIE4HGGuyVxTnJ5pIx0hB9WU=;
	b=J8krmKHdtoJ1WPNM/SIaLPFvcPX7DQ2qRxmtNjmV07emf4RnAdx3uepHW1vL+ACSEM
	j8S6XIfem0hnkEbFX7Ibyx+Ad2RcoRM7r3ZNRVLCy4osQg59vOCLS9ykA4oKjjvLGmxa
	iyHmsZbLJD6MkVCTTz7oGFdnKvQlWS6WiPIVTQDmnQ50+XKUmNT+a2M3Lp8gmx3WhQGn
	QUxgy99vG8AxJuBeejr1Gx49U3dobLgv1cGOVzBW4lW54ci4Q1PC3KY0Gj2iy0Lue3fW
	5Xzrc5jj+PFlP+1hDm2V9Gj2iS4EwFLNJk3jncxKJMp1E3Vzkrqy6AJ3SYenQ+WhgVqP
	wz6g==
X-Gm-Message-State: AFeK/H2V9QroIqKScHTA7NfWhFNkNgH5qzvLlt46Os4uW6xzISPUAc8EIoQpU4gt6fEXCnbo7Vllf+PSimj2EA==
X-Received: by 10.28.137.208 with SMTP id l199mr15124825wmd.65.1490727688579; 
	Tue, 28 Mar 2017 12:01:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.152.55 with HTTP; Tue, 28 Mar 2017 12:01:27 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1703281010420.3894@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703281010420.3894@uk63952.mitel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 28 Mar 2017 12:01:27 -0700
Message-ID: <CAJ86T=UoP2sHmz9gYUpOTqDYy4Dg6i+DBuR97E9VrzVuMahW7A@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how to specify *just* the KERNEL_IMAGETYPES i want?
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
X-List-Received-Date: Tue, 28 Mar 2017 19:01:28 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 28, 2017 at 7:19 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   playing with building fit images, and i started with mpc8315e-rdb,
> built virtual/kernel using all defaults, and got this in images/:
>
> modules--4.9.8+git0+b65e9b6153_6b67f448d6-r0-mpc8315e-rdb-20170315095945.tgz
> uImage--4.9.8+git0+b65e9b6153_6b67f448d6-r0-mpc8315e-rdb-20170315095945.bin
> uImage--4.9.8+git0+b65e9b6153_6b67f448d6-r0-mpc8315erdb-20170315095945.dtb
>
> which is perfectly fine, since the machine conf file for that target
> includes the line:
>
>   KERNEL_IMAGETYPE = "uImage"
>
> now i start another (fresh) build, and add to local.conf the lines:
>
>   KERNEL_CLASSES = "kernel-fitimage"
>   KERNEL_IMAGETYPES = "fitImage"
>
> now my use of the above is my (alleged) way of saying, "i only want a
> fitImage", but given this snippet from kernel.bbclass:
>
>     # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES
>     type = d.getVar('KERNEL_IMAGETYPE') or ""
>     alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
>     types = d.getVar('KERNEL_IMAGETYPES') or ""
>     if type not in types.split():
>         types = (type + ' ' + types).strip()
>
> i apparently get both the default as specified in the machine .conf
> file, *as well as* the fitImage i ask for. and, sure enough, in my
> images/ directory, i have uImages and fitImages (and zImages, but i
> believe that's because fitImages require them, so no big deal).
>
>   i suspect i could prevent the generation of uImages by using:
>
>   KERNEL_IMAGETYPE_mpc8315e-rdb = "fitImage"
>
> but from a clarity point of view, would it not make more sense that if
> someone had a line:
>
>   KERNEL_IMAGETYPES = " ... list of types ..."
>
> that should override whatever KERNEL_IMAGETYPE is in the machine conf
> file and generate *just* those images? or am i missing something here?

KERNEL_IMAGETYPE is the legacy variable and it's added to
KERNEL_IMAGETYPES for backwards compatibility.

If you update your machine config and local.conf over-rides etc to all
consistently use KERNEL_IMAGETYPES then the behaviour should be closer
to what you expect.

> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

