Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 31C2A79101
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 13:43:11 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id t22-v6so6937598lfb.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 06:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PB0R1DGE+NF56xDk+I7zsVrnGof92KsQTsh9UKIMW50=;
	b=DqRGR3tJwBOz2SftCfiSKm/HixGg6B8CmKgsgcwrFu8+3LT8MB/EWBfOCkR3oB2nt2
	TaI/vKjdq23NgUl0TmCyrMklb2uDJYR5h7K4dk2xa+iCPbKjx3i27NlJvhwthEsxlDqr
	x0bKGXiXd648j3JSepNseAA2DPXLSWhvi+n4o8C8/svuZw/U97DUxnamQKTnZwJM/WXu
	47xyUz371CmFid3v7RlN7kAI2fIrDXE/mCfn18fNY4N8qU1gc6MH+ENkQAv1en98rVjC
	BCnC8lemmyJkTDHD73cotJxUfYeABYdYRz9DMqfqxqii45dOTSognmJW5SLwQfDTg41R
	Rhdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PB0R1DGE+NF56xDk+I7zsVrnGof92KsQTsh9UKIMW50=;
	b=V5rQDsN4lqzyyX58aDG4EEsaGoTBpWCtcm3JrdErsOtkhR44sXi7YJn+qdZtNDWOKt
	A/22J/DblHM+1xN6oNl8levSLkQYdbw4t7fgrBmG6VafOI37xdUYp/xlrnGlMBHd/rW/
	fynZQEcMLv266SKygM15ike71iMvt8xCnQ8ndFNWOSzKiC9of5vlhunrfAnVAsw2SxvC
	IVKSS3GGcBBnksIA5yxIw6m9wIWBBWD+eTCrwPFNmWZ0Cn6zm7dulgdg+DTx6dDfCypu
	Ekvv6JmcgHBcNsD7X2NYivOfr0rJKqbVBGsZtSZn7NOOnAI36Aidkky01xNlNibIU+fa
	ysIQ==
X-Gm-Message-State: APzg51BKRq3JqmUGOnd/oto/cKfIhT//vFRccgts/vY4WZES6ftbOgSN
	5tn2PxeSvZ+yTAPaW1dGFxibjoU8PQvJcqu7z9w=
X-Google-Smtp-Source: ANB0Vdb59BOrITra4bQBQywyLppWPB1naPuSH0yqe30Ad31vrU3s0/+PeswHAORXx8tl+TwyVftQEEpyZ+/ekyo/EqY=
X-Received: by 2002:a19:d3c4:: with SMTP id
	k187-v6mr6646808lfg.101.1537796591503; 
	Mon, 24 Sep 2018 06:43:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP; Mon, 24 Sep 2018 06:43:10
	-0700 (PDT)
In-Reply-To: <36b0c47b199a55e4c385f437aad964980c20dd61.camel@linuxfoundation.org>
References: <1537530567-8604-1-git-send-email-mikko.rapeli@bmw.de>
	<20180924072539.GE9430@hiutale>
	<CADkTA4MBwLt_7AHDqVfh79KNB_sG58+gGWLz=4KqMg1Qpk1Ngg@mail.gmail.com>
	<20180924121927.GI9430@hiutale>
	<045ad825c6999fe4876a7aa90cb427ca2d0d8c87.camel@linuxfoundation.org>
	<20180924132013.GJ9430@hiutale>
	<36b0c47b199a55e4c385f437aad964980c20dd61.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 24 Sep 2018 09:43:10 -0400
Message-ID: <CADkTA4OOvw7xqYs0Pd9eOwY3pmELhnk8ThnyuhdermCrhpmRGw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Mon, 24 Sep 2018 13:43:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 24, 2018 at 9:38 AM,  <richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2018-09-24 at 13:20 +0000, Mikko.Rapeli@bmw.de wrote:
>> On Mon, Sep 24, 2018 at 02:11:13PM +0100, Richard Purdie wrote:
>> > On Mon, 2018-09-24 at 12:19 +0000, Mikko.Rapeli@bmw.de wrote:
>> > > > That was one old way, but not the only. And not for exposing
>> > > > non
>> > > > uapi
>> > > > headers.
>> > >
>> > > What other ways exist?
>> > >
>> > > I don't care how, but I must export custom kernel specific
>> > > headers
>> > > and
>> > > other files to other recipes in a build in ways which are
>> > > compatible
>> > > with
>> > > yocto upstream.
>> > >
>> > > I have not seen any documented ways for this.
>> >
>> > It may not be documented, perhaps because its actually very simple.
>> >
>> > Any recipe can expose headers into the recipe sysroot, they simply
>> > install them where needed in do_install as normal.
>> >
>> > So all you need is a recipe which installs the right headers and
>> > then
>> > you DEPEND on that recipe. Where that recipe gets the headers isn't
>> > relevant.
>>
>> No, this does not work on sumo. My patch is needed for this to work.
>>
>> Without my patch, users of kernel.bbclass have zero files in
>> tmp/sysroot-components even if they install extra files and extra
>> header only binary packages.
>>
>> A generated image or SDK will have the files if the binary package is
>> installed but sysroot not.
>
> I was replying from the perspective of how this should work in general.
> I agree that for this to work with a kernel recipe we do need the
> change that started this thread and that is probably a reasonable thing
> to do.

We have a Yocto bugzilla that can be closed if you are ok with the approach.

To answer the other question about what I've done (and proposed before) was
to maintain the kernel.bbclass protections, all call the staging
routines myself.

i.e.

do_install_append() {
        make headers_install INSTALL_HDR_PATH=${D}${KERNEL_ALT_HEADER_DIR}

        # remove export artifacts
        find ${D}${KERNEL_ALT_HEADER_DIR} -name .install -exec rm {} \;
        find ${D}${KERNEL_ALT_HEADER_DIR} -name ..install.cmd -exec rm {} \;
}

sysroot_stage_all_append() {
    sysroot_stage_dir ${D}${KERNEL_ALT_HEADER_DIR}
${SYSROOT_DESTDIR}${KERNEL_ALT_HEADER_DIR}
}

And that works to get things exported.

Bruce

>
> Cheers,
>
> Richard
>
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

