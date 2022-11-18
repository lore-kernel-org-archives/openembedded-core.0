Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9632C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 15:57:11 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.15661.1668787024991350078
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 07:57:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=tMDmm+AG;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id r12so8900373lfp.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 07:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7rspQ4KUSSPCjKlFklr9Y28AKRDxh6yOocFROC56EEg=;
        b=tMDmm+AGUCfcEeGZ2LJ/G3CkZD9w0Tg3fKBxfzYrBZM5l5P28YRAOar60y6IriQPaM
         uLPSe2ERHP6stgdjNZZ1jgYE9pXYug5rnGgKG/DYxpgdhXSN00HjGy15BeAU22BscGBJ
         xnvPgWg8msIEKDTRmfkXJaDZFf2s7/JT57ZIPvSmYx/Gkei+INcTg5B97smp9XKPcunB
         o80BJgX3If0pvJujd004sifuYVMlarkpBR37mwP11aFFIvqBSzlYqwnQILNmtN35E6pC
         o8pPIkjIQe4VuCFidRiVAOLKcy5IygxnWDb7YjIpPmHFAKjEk1d0CINXnlEi6QfaxiHv
         Ah1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7rspQ4KUSSPCjKlFklr9Y28AKRDxh6yOocFROC56EEg=;
        b=Q2dOonetJxc2I+6S8kUf5iXURwjJ9NmySox/98nUsJs6cQiLNo0mcerrYZMuwumd2C
         IWN5wWyvPLC9zaDqCx8ZrgmERSGH2GP/Ht5U3BGnNf1frY5IXIiARTAQNe8Fzmomp0iQ
         j0Qm8LKqYuXw0JlHdqbYrx5mPzBHWPLjrAYvCMzKYbCUrCVeO01KjNgNiEw6KA+/Puge
         aecKW9W588pH+guYr4/V27ZlX/+RcIwPQSdt8/D9z9zKgNPTrRnF4L5i7mo49uSQJEks
         yYWEu3xS7qoagsDkMHrcPCwiFFkDWGMBy1uLWX/VC0tbTGfsxoDywhs5xbhbg6twLoCi
         zhkA==
X-Gm-Message-State: ANoB5pnyXzG5Zs5iMq665o1T8CZwUlUnUhJtiFoCCJHhxgtHtJ+SKhgH
	1724hBX6F1dweVtwNQNBIQGnuA==
X-Google-Smtp-Source: AA0mqf4Y+eH4lXCI9ANj/KlZKzKkwZBy5RXTl2jkDoYWPF7YUzpOEJlcz5k3j1qC0+jZAzJMxHFkpQ==
X-Received: by 2002:ac2:4bc8:0:b0:4b3:9fcb:df92 with SMTP id o8-20020ac24bc8000000b004b39fcbdf92mr2490751lfq.607.1668787023024;
        Fri, 18 Nov 2022 07:57:03 -0800 (PST)
Received: from nuoska (dsl-olubng12-54fa1d-36.dhcp.inet.fi. [84.250.29.36])
        by smtp.gmail.com with ESMTPSA id f29-20020a05651c02dd00b002778a76a3c3sm703415ljo.112.2022.11.18.07.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 07:57:02 -0800 (PST)
Date: Fri, 18 Nov 2022 17:57:00 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/2] image specific configuration with oeqa
 runtime tests
Message-ID: <Y3erTB2Qulh8Wfn+@nuoska>
References: <20221117071223.107064-1-mikko.rapeli@linaro.org>
 <5b79cba0817750882a0ef1f1dd9b9581abc9db28.camel@linuxfoundation.org>
 <Y3ZVup8YKv6LQzuF@nuoska>
 <4f16ed270c2b979839830929c703494d221b2228.camel@linuxfoundation.org>
 <Y3eXdWibCGQBV6Wt@nuoska>
 <6b088587f876fd2cf76ad8b1b13fac6a7c92cfc6.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b088587f876fd2cf76ad8b1b13fac6a7c92cfc6.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 15:57:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173468

On Fri, Nov 18, 2022 at 03:04:29PM +0000, Richard Purdie wrote:
> On Fri, 2022-11-18 at 16:32 +0200, Mikko Rapeli wrote:
> > Hi,
> > 
> > On Thu, Nov 17, 2022 at 04:57:36PM +0000, Richard Purdie wrote:
> > > On Thu, 2022-11-17 at 17:39 +0200, Mikko Rapeli wrote:
> > > > Hi,
> > > > 
> > > > On Thu, Nov 17, 2022 at 03:17:43PM +0000, Richard Purdie wrote:
> > > > > On Thu, 2022-11-17 at 09:12 +0200, Mikko Rapeli wrote:
> > > > > > Many runtime tests would need customization for different
> > > > > > machines and images. Currently some tests like parselogs.py are hard
> > > > > > coding machine specific exceptions into the test itself. I think these
> > > > > > machine specific exceptions fit better as image specific ones, since a
> > > > > > single machine config can generate multiple images which behave
> > > > > > differently. Thus create a "testimage_data.json" file format which image
> > > > > > recipes can deploy. This is then used by tests like parselogs.py to find
> > > > > > the image specific exception list.
> > > > > > 
> > > > > > Same approach would fit other runtime tests too. For example systemd
> > > > > > tests could include a test case which checks that an image specific list of
> > > > > > services are running.
> > > > > > 
> > > > > > I don't know how this data storage would be used with SDK or selftests,
> > > > > > but maybe it could work there too with some small tweaks.
> > > > > > 
> > > > > > Mikko Rapeli (2):
> > > > > >   oeqa: add utils/data.py with get_data() function
> > > > > >   oeqa parselogs.py: use get_data() to fetch image specific error list
> > > > > > 
> > > > > >  meta/lib/oeqa/runtime/cases/parselogs.py | 17 +++++++---
> > > > > >  meta/lib/oeqa/utils/data.py              | 41 ++++++++++++++++++++++++
> > > > > >  2 files changed, 54 insertions(+), 4 deletions(-)
> > > > > >  create mode 100644 meta/lib/oeqa/utils/data.py
> > > > > 
> > > > > This patch looks like it is one side of the equation, i.e. importing
> > > > > the data into the tests. How does the data get into the deploy
> > > > > directory in the first place? I assume there are other patches which do
> > > > > that?
> > > > 
> > > > Patches in other layers do that, yes.
> > 
> > Note to self and anyone else interested in this, it is rather
> > tricky to get SRC_URI and do_deploy() working in image recipes.
> > Something like this will do it though:
> > 
> > SUMMARY = "Test image"
> > LICENSE = "MIT"
> > 
> > SRC_URI = "file://testimage_data.json"
> > 
> > inherit deploy
> > 
> > # re-enable SRC_URI handling, it's disabled in image.bbclass
> > python __anonymous() {
> >     d.delVarFlag("do_fetch", "noexec")
> >     d.delVarFlag("do_unpack", "noexec")
> > }
> > ...
> > do_deploy() {
> >     # to customise oeqa tests
> >     mkdir -p "${DEPLOYDIR}"
> >     install "${WORKDIR}/testimage_data.json" "${DEPLOYDIR}"
> > }
> > # do_unpack needed to run do_fetch and do_unpack which are disabled by image.bbclass.
> > addtask deploy before do_build after do_rootfs do_unpack
> 
> Since the image code doesn't need SRC_URI and has it's own handling of
> deployment, we didn't really anyone should be needing to do that :/.

Yep, but it can be done. Images can deploy files from SRC_URI too.

> > > > 
> > > When you execute later, are you going to use testexport or will the
> > > metadata still be available? As I mentioned, removing testexport would
> > > be desirable for a number of reasons but I suspect there are people who
> > > might want it.
> > 
> > I was planning to use testexport and also make sure all images and other
> > things needed for running tests are in the output of a build.
> 
> I guess that means if we were to propose patches removing testexport
> functionality you'd be very much opposed then? :(

An alternative would be nice. I like that build environment provides
full infrastructure for running tests also elsewhere. But if that is too
tricky then running tests only works on build machines after the build.

> > > > > The second is the "testexport" approach where the tests are run without
> > > > > the main metadata. I know Ross and I would like to see testexport
> > > > > dropped as it complicates things and is a pain.
> > > > > 
> > > > > This new file "feels" a lot like more extensions in the testexport
> > > > > direction and I'm not sure we need to do that. Could we handle this
> > > > > with more markup in the image recipe?
> > > > 
> > > > For simple variables this would do but how about a long list of strings
> > > > like poky/meta/lib/oeqa/runtime/cases/parselogs.py:
> > > > 
> > > > common_errors = [
> > > >     "(WW) warning, (EE) error, (NI) not implemented, (??) unknown.",
> > > >     "dma timeout",
> > > >     "can\'t add hid device:",
> > > >     "usbhid: probe of ",
> > > >     "_OSC failed (AE_ERROR)",
> > > >     "_OSC failed (AE_SUPPORT)",
> > > >     "AE_ALREADY_EXISTS",
> > > >     "ACPI _OSC request failed (AE_SUPPORT)",
> > > >     "can\'t disable ASPM",
> > > >     "Failed to load module \"vesa\"",
> > > >     "Failed to load module vesa",
> > > >     "Failed to load module \"modesetting\"",
> > > >     "Failed to load module modesetting",
> > > >     "Failed to load module \"glx\"",
> > > >     "Failed to load module \"fbdev\"",
> > > >     "Failed to load module fbdev",
> > > >     "Failed to load module glx"
> > > > ]
> > > > 
> > > > Embed json into a bitbake variable? Or embed directly as python code?
> > > 
> > > I've wondered if we could add some new syntax to bitbake to support
> > > this somehow, does anyone have any ideas to propose?
> > > 
> > > I'd wondered about both python data and/or json format (at which point
> > > someone will want yaml :/).
> > 
> > This sounds pretty far fetched currently.
> 
> Not really. If we can find a syntax that works, the rest of the code in
> bitbake can support that fairly easily. The datastore already handles
> objects of different types.
> 
> > json files are quite simple to work with in python so I'd just stick to�
> > this. If this approach is ok I could update the testimage.bbclass�
> > documentation with these details.
> > I really want to re-use tests and infratructure for running them but I need
> > to customize various details.
> 
> My concern is having multiple different file formats and data streams.
> It means we no longer have one definitive data mechanism but two, then
> the argument for people also shipping yaml and other files with recipes
> also becomes difficult. We'd also have people wanting to query from one
> to the other eventually.
> 
> The real issue here seems to be that our data format (.bb) is
> struggling with some forms of data. I've therefore a preference for
> fixing that rather than encouraging working around it.

For oeqa runtime tests I propose this json file. If tests have any
customization need they should use either image recipe variables or this
file format if recipe variables can't support the format. For other
alternatives I'd need pointers where to implement and what. ptests are
normal packages so they don't complicate this.

Additionally I'm currently interested in kirkstone LTS branch so would like
any changes to be there too...

Cheers,

-Mikko

> Cheers,
> 
> Richard
> 
> 
> 
> 
> 

