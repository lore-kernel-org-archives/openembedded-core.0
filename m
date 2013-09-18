Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f179.google.com (mail-ve0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id C7E686100F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 17:25:18 +0000 (UTC)
Received: by mail-ve0-f179.google.com with SMTP id c14so5693666vea.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 10:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=IzSKwCgrN3ajsLmwvtGtIDXJu3X+FqFCvPDJWpSG7rQ=;
	b=VvqWTXEZpJZ0jkcrNHhEmZ0O+SLYOM94UskZq7tNy+r+OsvdCLyOYCv1S/TQult0Wq
	hclFgEiVP3xStbdvBf4d5fsfpYa61hyoeXSMtyBlqcetwpnpBTMqSQt8gRsFeMEED7MP
	ipNG+aXRfmnG4gLRKQDIJgORl/drIkAwnOwRnCYQhsnLYPTeOfqCd1Ug/DaXIkucRd/U
	Py/nrK/NzUleSLqEt+a1/HWaUWSlPUmv85zJnwCeSGmlzFwAqH28xfoyYytWs/i3zF6n
	F+fZS6FmWQxdIm7W+TjJx6+L4vSR2C2ahA78+hgZJRAEA1j+vqridjzIqDDLepel2b9D
	sX2Q==
X-Received: by 10.58.198.13 with SMTP id iy13mr39000701vec.11.1379525120038;
	Wed, 18 Sep 2013 10:25:20 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.109.72 with HTTP; Wed, 18 Sep 2013 10:24:39 -0700 (PDT)
In-Reply-To: <1379522909.18603.52.camel@ted>
References: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
	<1376512209-11622-9-git-send-email-mark.hatle@windriver.com>
	<52125F35.10305@linux.intel.com> <521264DA.8010404@windriver.com>
	<CANyK_8cSzYGQHDCeCCz7HM5yWm=Uq_fkpyr6gbYMJXPxuQxy-Q@mail.gmail.com>
	<1379520447.18603.30.camel@ted>
	<CANyK_8e6OSe8KPvJ3uSEBdNBPMwZT7EsrRTZvLUgUTdyD1_p0g@mail.gmail.com>
	<1379522909.18603.52.camel@ted>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 18 Sep 2013 18:24:39 +0100
X-Google-Sender-Auth: fLVhg8cGM70zSxQ2A6tQuuW-upc
Message-ID: <CANyK_8fotVWZMkFO5kMJ_GFjGT2O79TsOWrCQV5Xez+rgdKbMg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/11] opkg: Add --no-install-recommends option.
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
X-List-Received-Date: Wed, 18 Sep 2013 17:25:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 18 September 2013 17:48, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2013-09-18 at 17:35 +0100, Paul Barker wrote:
>> As a side question - is there a specific maintainer for opkg-utils?
>> I'd like to discuss whether two separate repositories is a good idea
>> or whether we'd benefit from merging this into the opkg repo.
>
> I can probably speak for it. It was created out of necessity, we had the
> situation where patches were piling up against ipkg-utils and since that
> was dead, we created a new repository we could merge changes into rather
> than having piles of patches.
>
> There are some pretty horrific things in there and it probably needs a
> good clean  out, we only use a small part of it. If we have an actively
> maintained place for the in opkg, I'd be ok with that. Equally having
> them separate does better force sane API decisions (flag days where both
> need to change at the same time would be bad for example). If you wanted
> commit access to opkg-utils that could probably be arranged if that
> helps?
>

I'd rather have opkg and opkg-utils merged together or next to each
other on the same server if/when I move opkg to git. I think
OpenEmbedded/Yocto is probably the main user of opkg but there are
others and they'd also benefit from opkg-utils, so having everything
in one place would make them easier to find.

My personal preference would be to move opkg and opkg-utils to
Bitbucket/Github/similar, probably merged together, with at least one
of the core developers from the Yocto Project having admin access to
the repositories so that the bus factor is greater than 1. I know I
could probably ask for opkg to be hosted on git.yoctoproject.org but I
think that would make non-Yocto Project users feel a little bit too
much like second-class citizens.

I want to avoid flag days where possible, at least one will be needed
for the libopkg API but hopefully not for the command line interface
or package format. I am planning on proposing that opkg explicitly
follow semantic versioning (http://semver.org/) and I think a stable,
sane API is important regardless of whether opkg-utils is separate or
not.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

