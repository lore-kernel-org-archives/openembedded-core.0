Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F210C4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 14:32:31 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.13198.1668781946231439959
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 06:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Wo1BndfE;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id j4so8544675lfk.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 06:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CzUNqDmphmtvDxqszNoWHBH32XmzrX7ZE4zOkyW+fMY=;
        b=Wo1BndfEyEayaQLMdPGpfHeZbg3Hz01wUto2omQcCI3Ji3wsKfXoWZLP3ICmeVbwWX
         OsW8kJOQuvbmHRtHjhN0vhpCfwwsWeCd8NP8cQhFfajGCpnAUufsYnv2ULaTWWgO8mvd
         TDhBE4SMxactUilcjbyvaX/YDoQ8sxWPE7WhdPvVRb98slry7MgNN2/T/6YPCwZ2RbFa
         oZPhHRybXhngZ4AF1xNZyC6M9PFZUaqxnxlxA9O1QKzBPpeQiI4RM5UCA2HGPTpxIzaf
         8ZxxYGO+4+xGYQolC/Gl+1b+mJHkdtVtMP6e7z8GQIYM00FgsXOzIZLX4HEkR5T0aua6
         NjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzUNqDmphmtvDxqszNoWHBH32XmzrX7ZE4zOkyW+fMY=;
        b=Ibdt/Lk+DRP3f+rEPagSPtDDvciuu/30m9MVaCmVAVPQT5L9EHsH8flmUVG6+Bs7mW
         /rUS1R9hFWBufxOousgsCh93V/lPwnQJoNwSNsKLfbDdqS20vxayIPiTxmpMIVn0u5w+
         6BhS3CHfV6c2VBiBHDEOVz7FS18s0Jig1W8VLQAiPH7ntDayGqafUDejNMl5KAeTsjSU
         smu7gRE6U05WyzIbkdJnpkFQNWj0QGIR/psMqoD5M28XOJJpwnEbArLd3sULgJszE/Ge
         9eiezD35w8mWr0+j2ahUvzBxBq/828/oWEj0jSr7WfsEnxuZxphEeKC4VOErIKBZnp8y
         M3tA==
X-Gm-Message-State: ANoB5pn0XO3wQN26/67v0unxJFMC38D3fF8zB9eGajiFE9WeBUkG1FAD
	lsDBOfoK66pgZVgltx4hgzW8dA==
X-Google-Smtp-Source: AA0mqf6Hedu0lWVFLPQuWPEC5Vb/p/azt2eMe7R8sQrsCD3aVUJjTT+RilhHM/qzpHIsSIMqTQKUOQ==
X-Received: by 2002:a05:6512:158c:b0:4a2:3ba8:fae9 with SMTP id bp12-20020a056512158c00b004a23ba8fae9mr2484809lfb.440.1668781944253;
        Fri, 18 Nov 2022 06:32:24 -0800 (PST)
Received: from nuoska (dsl-olubng12-54fa1d-36.dhcp.inet.fi. [84.250.29.36])
        by smtp.gmail.com with ESMTPSA id n25-20020a2e9059000000b002770d8625ffsm673875ljg.88.2022.11.18.06.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 06:32:23 -0800 (PST)
Date: Fri, 18 Nov 2022 16:32:21 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/2] image specific configuration with oeqa
 runtime tests
Message-ID: <Y3eXdWibCGQBV6Wt@nuoska>
References: <20221117071223.107064-1-mikko.rapeli@linaro.org>
 <5b79cba0817750882a0ef1f1dd9b9581abc9db28.camel@linuxfoundation.org>
 <Y3ZVup8YKv6LQzuF@nuoska>
 <4f16ed270c2b979839830929c703494d221b2228.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f16ed270c2b979839830929c703494d221b2228.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 14:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173462

Hi,

On Thu, Nov 17, 2022 at 04:57:36PM +0000, Richard Purdie wrote:
> On Thu, 2022-11-17 at 17:39 +0200, Mikko Rapeli wrote:
> > Hi,
> > 
> > On Thu, Nov 17, 2022 at 03:17:43PM +0000, Richard Purdie wrote:
> > > On Thu, 2022-11-17 at 09:12 +0200, Mikko Rapeli wrote:
> > > > Many runtime tests would need customization for different
> > > > machines and images. Currently some tests like parselogs.py are hard
> > > > coding machine specific exceptions into the test itself. I think these
> > > > machine specific exceptions fit better as image specific ones, since a
> > > > single machine config can generate multiple images which behave
> > > > differently. Thus create a "testimage_data.json" file format which image
> > > > recipes can deploy. This is then used by tests like parselogs.py to find
> > > > the image specific exception list.
> > > > 
> > > > Same approach would fit other runtime tests too. For example systemd
> > > > tests could include a test case which checks that an image specific list of
> > > > services are running.
> > > > 
> > > > I don't know how this data storage would be used with SDK or selftests,
> > > > but maybe it could work there too with some small tweaks.
> > > > 
> > > > Mikko Rapeli (2):
> > > >   oeqa: add utils/data.py with get_data() function
> > > >   oeqa parselogs.py: use get_data() to fetch image specific error list
> > > > 
> > > >  meta/lib/oeqa/runtime/cases/parselogs.py | 17 +++++++---
> > > >  meta/lib/oeqa/utils/data.py              | 41 ++++++++++++++++++++++++
> > > >  2 files changed, 54 insertions(+), 4 deletions(-)
> > > >  create mode 100644 meta/lib/oeqa/utils/data.py
> > > 
> > > This patch looks like it is one side of the equation, i.e. importing
> > > the data into the tests. How does the data get into the deploy
> > > directory in the first place? I assume there are other patches which do
> > > that?
> > 
> > Patches in other layers do that, yes.

Note to self and anyone else interested in this, it is rather
tricky to get SRC_URI and do_deploy() working in image recipes.
Something like this will do it though:

SUMMARY = "Test image"
LICENSE = "MIT"

SRC_URI = "file://testimage_data.json"

inherit deploy

# re-enable SRC_URI handling, it's disabled in image.bbclass
python __anonymous() {
    d.delVarFlag("do_fetch", "noexec")
    d.delVarFlag("do_unpack", "noexec")
}
...
do_deploy() {
    # to customise oeqa tests
    mkdir -p "${DEPLOYDIR}"
    install "${WORKDIR}/testimage_data.json" "${DEPLOYDIR}"
}
# do_unpack needed to run do_fetch and do_unpack which are disabled by image.bbclass.
addtask deploy before do_build after do_rootfs do_unpack

> > > We have a bit of contention with two approaches to data management in
> > > OEQA. One is where the runtime tests are directly run against an image,
> > > in which case the datastore is available. You could therefore have
> > > markup in the recipe as normal variables and access them directly in
> > > the tests.
> > 
> > My use case is running tests right after build, but I would like to export
> > them to execute later as well.
> 
> When you execute later, are you going to use testexport or will the
> metadata still be available? As I mentioned, removing testexport would
> be desirable for a number of reasons but I suspect there are people who
> might want it.

I was planning to use testexport and also make sure all images and other
things needed for running tests are in the output of a build.

> > > The second is the "testexport" approach where the tests are run without
> > > the main metadata. I know Ross and I would like to see testexport
> > > dropped as it complicates things and is a pain.
> > > 
> > > This new file "feels" a lot like more extensions in the testexport
> > > direction and I'm not sure we need to do that. Could we handle this
> > > with more markup in the image recipe?
> > 
> > For simple variables this would do but how about a long list of strings
> > like poky/meta/lib/oeqa/runtime/cases/parselogs.py:
> > 
> > common_errors = [
> >     "(WW) warning, (EE) error, (NI) not implemented, (??) unknown.",
> >     "dma timeout",
> >     "can\'t add hid device:",
> >     "usbhid: probe of ",
> >     "_OSC failed (AE_ERROR)",
> >     "_OSC failed (AE_SUPPORT)",
> >     "AE_ALREADY_EXISTS",
> >     "ACPI _OSC request failed (AE_SUPPORT)",
> >     "can\'t disable ASPM",
> >     "Failed to load module \"vesa\"",
> >     "Failed to load module vesa",
> >     "Failed to load module \"modesetting\"",
> >     "Failed to load module modesetting",
> >     "Failed to load module \"glx\"",
> >     "Failed to load module \"fbdev\"",
> >     "Failed to load module fbdev",
> >     "Failed to load module glx"
> > ]
> > 
> > Embed json into a bitbake variable? Or embed directly as python code?
> 
> I've wondered if we could add some new syntax to bitbake to support
> this somehow, does anyone have any ideas to propose?
> 
> I'd wondered about both python data and/or json format (at which point
> someone will want yaml :/).

This sounds pretty far fetched currently. json files are quite simple
to work with in python so I'd just stick to this. If this approach is ok
I could update the testimage.bbclass documentation with these details.
I really want to re-use tests and infratructure for running them but I need
to customize various details.

Cheers,

-Mikko

