Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id F359E601D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 13:56:50 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id e1-v6so19805849wrt.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 06:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=B2kt1pRcAeIrbY61Vb/YlmTl8en7h9Kxx7aq/sHGRwo=;
	b=Xy0lBlsyYeGlLcjoPfPD8MHsGsLcL/t2SAqACZ1chnlVLFYbOQRXoaiNJWxF+8W/Yc
	d0hJ7j1EBf6NDUlqzOj0Kro+/vo8UWVrpb8f1ueyjOSHtZOlRgAAVLXzEtQTJC7m0834
	l4xHSuUL0OHIpGR3rG/rDpU8lubZuCe6T8PTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=B2kt1pRcAeIrbY61Vb/YlmTl8en7h9Kxx7aq/sHGRwo=;
	b=m7KpC4a2fTApT3dMizB+TMQu+Q65C7OuAve7dV51VvHgAKArB+E+Uy2R7dcnV5msc6
	sE6NUgWq/L7LpH+rSToSKCfjpy4MhM0ZpVT/VaB2G7ifbcPG/WUjwMKX3M2fy8/pbQpc
	8XJreroyvBmD7NzsF8jOPcEzcprHi6DWab+5UM0Zvb1OE0+4mzkBO5ljQ88euYVcTTtv
	rh7KAQmHEs9X6cZRWmxw1KGp1zSTq8zCiY6bs2qswE6AT0iorgQy4qmTfB+p7c31/hl8
	S3dgXL+4oQXPMVTKT4MHYAN75sGOb7JakFcwRhjjm0SyXD7CQZedx+HAtlQO2DDlT1hC
	8X8A==
X-Gm-Message-State: ABuFfoj1PUF6OrERB8XUFVvJroPtPZes6c3p5jGokEwVgEgFBHqhVPdC
	f5nDZp3CJe7Q22maGtEbvelSGA==
X-Google-Smtp-Source: ACcGV63vEkXF64TKVJ9C2Y35AcHDNqPBDQ26GzfbDwbr5Tpjt6bP7QEL4MwEIOnYgQ5pFuR+7/S+gA==
X-Received: by 2002:adf:eb87:: with SMTP id
	t7-v6mr9042492wrn.123.1537797411584; 
	Mon, 24 Sep 2018 06:56:51 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a11-v6sm32972361wrr.81.2018.09.24.06.56.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 24 Sep 2018 06:56:50 -0700 (PDT)
Message-ID: <6e907abfede0cad4292c4c44ea74f4f8bbe90093.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 24 Sep 2018 14:56:49 +0100
In-Reply-To: <CADkTA4OOvw7xqYs0Pd9eOwY3pmELhnk8ThnyuhdermCrhpmRGw@mail.gmail.com>
References: <1537530567-8604-1-git-send-email-mikko.rapeli@bmw.de>
	<20180924072539.GE9430@hiutale>
	<CADkTA4MBwLt_7AHDqVfh79KNB_sG58+gGWLz=4KqMg1Qpk1Ngg@mail.gmail.com>
	<20180924121927.GI9430@hiutale>
	<045ad825c6999fe4876a7aa90cb427ca2d0d8c87.camel@linuxfoundation.org>
	<20180924132013.GJ9430@hiutale>
	<36b0c47b199a55e4c385f437aad964980c20dd61.camel@linuxfoundation.org>
	<CADkTA4OOvw7xqYs0Pd9eOwY3pmELhnk8ThnyuhdermCrhpmRGw@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: allow exporting files from kernel recipes to sysroot
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
X-List-Received-Date: Mon, 24 Sep 2018 13:56:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-09-24 at 09:43 -0400, Bruce Ashfield wrote:
> > On Mon, 2018-09-24 at 13:20 +0000, Mikko.Rapeli@bmw.de wrote:
> > > On Mon, Sep 24, 2018 at 02:11:13PM +0100, Richard Purdie wrote:
> > > > On Mon, 2018-09-24 at 12:19 +0000, Mikko.Rapeli@bmw.de wrote:
> > > > > > That was one old way, but not the only. And not for
> > > > > > exposing
> > > > > > non
> > > > > > uapi
> > > > > > headers.
> > > > > 
> > > > > What other ways exist?
> > > > > 
> > > > > I don't care how, but I must export custom kernel specific
> > > > > headers
> > > > > and
> > > > > other files to other recipes in a build in ways which are
> > > > > compatible
> > > > > with
> > > > > yocto upstream.
> > > > > 
> > > > > I have not seen any documented ways for this.
> > > > 
> > > > It may not be documented, perhaps because its actually very
> > > > simple.
> > > > 
> > > > Any recipe can expose headers into the recipe sysroot, they
> > > > simply
> > > > install them where needed in do_install as normal.
> > > > 
> > > > So all you need is a recipe which installs the right headers
> > > > and
> > > > then
> > > > you DEPEND on that recipe. Where that recipe gets the headers
> > > > isn't
> > > > relevant.
> > > 
> > > No, this does not work on sumo. My patch is needed for this to
> > > work.
> > > 
> > > Without my patch, users of kernel.bbclass have zero files in
> > > tmp/sysroot-components even if they install extra files and extra
> > > header only binary packages.
> > > 
> > > A generated image or SDK will have the files if the binary
> > > package is
> > > installed but sysroot not.
> > 
> > I was replying from the perspective of how this should work in
> > general.
> > I agree that for this to work with a kernel recipe we do need the
> > change that started this thread and that is probably a reasonable
> > thing
> > to do.
> 
> We have a Yocto bugzilla that can be closed if you are ok with the
> approach.
> 
> To answer the other question about what I've done (and proposed
> before) was
> to maintain the kernel.bbclass protections, all call the staging
> routines myself.
> 
> i.e.
> 
> do_install_append() {
>         make headers_install
> INSTALL_HDR_PATH=${D}${KERNEL_ALT_HEADER_DIR}
> 
>         # remove export artifacts
>         find ${D}${KERNEL_ALT_HEADER_DIR} -name .install -exec rm {}
> \;
>         find ${D}${KERNEL_ALT_HEADER_DIR} -name ..install.cmd -exec
> rm {} \;
> }
> 
> sysroot_stage_all_append() {
>     sysroot_stage_dir ${D}${KERNEL_ALT_HEADER_DIR}
> ${SYSROOT_DESTDIR}${KERNEL_ALT_HEADER_DIR}
> }
> 
> And that works to get things exported.

I'm fine with this approach, I'm kind of surprised anyone thinks
otherwise as I've always assumed this was what people were doing!

I'd propose that:

a) We document the above approach. I prefer it to Mikko's patch since
it doesn't mess with the blacklist and installs exactly what the recipe
wants to install which is how we normally write recipes.
b) To document it, I suggest a comment/reference in kernel.bbclass and
we add something somewhere in the manual. Adding Scott Rifenbark to cc
so he can help us sort this out.
c) Close out the bug Bruce mentions with this documentation as a
reference.

I think this means we probably don't need Mikko's patch and it is
mainly a documentation issue?

In case people wonder, the thing I really care about in this is people
are not patching linux-libc-headers. That warning still very much
applies.

I did also check and the code in question was introduced by Bruce:
http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/classes/kernel.bb
class?id=46cdaf1c7bc597735d926af6a46f9483f7e57ce5 3.5 years ago, there
were not reasons we were not installing headers there afaict, we have
just been assuming people append to sysroot_stage_all.

Cheers,

Richard


