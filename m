Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id CA8BA6A468
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 15:03:15 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id lf11so2037093vcb.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2013 08:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=F9AfsdtvBWSX0DbzYuZnb4cMOCDaK9w2qOR+8Usqcos=;
	b=Hj8DvUceE/DRzlVDDciF3VYdZx4j6dQ95E5/IbeFlrGo0ZYsLP/QlL7FH8F8nnlx/p
	o6PAeLN7vyvJe+rUz6q/DETXK25Davz6VlKWrdeiCoo5gZVM8g/b6CwEG80K19EUmk3p
	fh9YwPPj8zLur9ZLgHFWzuLKpVLh++fMqRzz24TcDSvm9nGDRmXTtsWq6ZAo+E6k8wpR
	p2qWV8YHU7HPGKgHGA8ecCvHQWGunwitx7JI/0PTmrUsHIZ41IQgG9AuEYf6JfqOfGt1
	PGRBc2acqXSWZq7Xa6g9Izm13EoxvCXujLvdvnLdE7vzlVy9s38y1RvDbrnkNKE4lgsS
	4XDg==
X-Received: by 10.52.21.232 with SMTP id y8mr7902400vde.6.1372690996617; Mon,
	01 Jul 2013 08:03:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Mon, 1 Jul 2013 08:02:56 -0700 (PDT)
In-Reply-To: <6242225.xYeWPdnF8o@helios>
References: <1372372997-1604-1-git-send-email-sgw@linux.intel.com>
	<2393683.pgSWLXlTRj@helios>
	<CAJTo0LbtyiNhLKvfnn7dE-mUckef7c10wdpj2OKjb5UfrAek5Q@mail.gmail.com>
	<6242225.xYeWPdnF8o@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Jul 2013 16:02:56 +0100
Message-ID: <CAJTo0LZbiBPiVH2=rTi6ikr3DY0-WQU0GY32Wxi8jBQhhUsnQg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQmcegOc4xAaZzQR9zNaY2cbQmCnwAJfRIsMjlLlLFHHR9aQXdbmRY81aKPyKwPkRj1K0IDn
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] packagegroup-core-boot: used udev-cache for sysvinit
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
X-List-Received-Date: Mon, 01 Jul 2013 15:03:16 -0000
Content-Type: text/plain; charset=UTF-8

On 1 July 2013 15:58, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Monday 01 July 2013 15:49:00 Burton, Ross wrote:
>> On 28 June 2013 11:02, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>> > I appreciate the intention here but I'm not sure if this is really the
>> > appropriate place to put this; packagegroup-core-boot is supposed to only
>> > directly pull in the essentials required for booting. This will cause
>> > problems for those people using alternative device managers (e.g. busybox
>> > mdev) as well.
>> >
>> > I'm not sure where this should go, but adding it to VIRTUAL-
>> > RUNTIME_dev_manager (in the distro config?) could work. Anyone else have
>> > any better suggestion?
>>
>> How about making udev RRECOMMEND udev-cache?
>
> It's not that udev-cache might not be available, rather that packagegroup-
> core-boot shouldn't have any kind of reference to it. In any case unless udev
> is skipped somehow, an RRECOMMENDS on udev-cache will end up building udev
> even if you haven't selected it in VIRTUAL-RUNTIME_dev_manager so that won't
> help.

I mean add a recommends to the udev binary package itself, so you'll
get udev-cache if you build udev (and keep the existing udev-selection
logic as-is).

Ross

