Return-Path: <twoerner@gmail.com>
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 949B86FF73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 16:03:06 +0000 (UTC)
Received: by mail-ua0-f176.google.com with SMTP id y4so12086892uay.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 09:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NYGnsvzETzuKa0NOmc3ZjMY5bJDZoE+vzzOKuoC1N+o=;
	b=tgkdeT2pNDhA8u0GiufIh0mArlYRss4LKQaKtnyZNsm7GjcL7++n739eOQEyPd7epj
	dr1sX1Hwq33YC5vuNJnCfOA54knbH1Yupde1D4U/t27nn+0Uja7o5NwBut8EeS0iY7dd
	1fnE6RSZ25GCXehO2GGpqrGQmG4dDLbhBEndKIV02zq8ZZBhHyVvoz88qnsfFPMgkxuE
	epS0mL4K8tUqgEbHROUxV1qzjjIm5PNmf12BwzOGydBsIA1q2lMQ7TmNgXXwnyHODFmi
	RvVLkz7D0CAUGeLXtTaX5sT5Iqzr6RQ2FJ3M4PGY/4Pb/mveAjerXgloi8NIcXNyvslf
	S3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NYGnsvzETzuKa0NOmc3ZjMY5bJDZoE+vzzOKuoC1N+o=;
	b=jGYaRE0O3unPZ1+UFHgsfNIs9ODzZKl0gp9qIb6sqV+H8U8nT8F0eGJ3QJ++nqVVSO
	TLSv5IxJUPc9IGWIdKSfo2NHIDlVgIXv1tWCEUMrfxNu/UCQVZwkKtMQ40l4wVUKT70l
	oQf6M5+xb/ylAqARysCs9bCq1tzIE8q9sXE2RnUZlNqyLdFJdBEhlBs+uX+Qr2QfKS67
	c3kvP1tbwUWXTliihERRQze1yBN6CMeCw/Q8SM0U3l5Vf1K13qWKpkNVDacW/aHJ5WAy
	MbKctjfHUvo0mub044WIlbwh9/QV+BS92i6IB24AJ7gm6EsPE+w4v8sQOL0nIYQfOcp0
	IN/Q==
X-Gm-Message-State: AODbwcANFrj1KVsGUDH8tjCXCEp6BX11sj+4jOn4qtwYlf8gBvJ+5Ml2
	zJTAsSK/c/mmqfOZy8IwLNrxeD13wg==
X-Received: by 10.176.71.25 with SMTP id h25mr13653000uac.140.1496246587325;
	Wed, 31 May 2017 09:03:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.199 with HTTP; Wed, 31 May 2017 09:03:06 -0700 (PDT)
In-Reply-To: <CAHiDW_EOrrVn+5FzMgGWSZP4=kOFfrWs_fc1bTBBx29a4HiqhQ@mail.gmail.com>
References: <20170526212248.16374-1-twoerner@gmail.com>
	<1496100337.25229.147.camel@linuxfoundation.org>
	<CAHUNapREVWXEaWYDYon8cYByzXcAdEu=_uWMAHCbOjU6VXrghg@mail.gmail.com>
	<1496130475.25229.160.camel@linuxfoundation.org>
	<20170530152738.GA24515@linux-uys3>
	<1496159050.6630.12.camel@linuxfoundation.org>
	<CAHUNapR0bPQq4qJnzK-ddPzn-m-0FCtVYLDBMsBuLY=eJUgmZg@mail.gmail.com>
	<1496161149.6630.14.camel@linuxfoundation.org>
	<CAHiDW_EOrrVn+5FzMgGWSZP4=kOFfrWs_fc1bTBBx29a4HiqhQ@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 31 May 2017 12:03:06 -0400
Message-ID: <CAHUNapRDjjg7cBSe3v1OSmsvQfAX0NmqCNZHpZ4gaO5C4UY-1g@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: potentially enable texture float for gallium
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
X-List-Received-Date: Wed, 31 May 2017 16:03:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 31, 2017 at 3:15 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> On 30 May 2017 at 19:19, Richard Purdie <richard.purdie@linuxfoundation.org>
> wrote:
>> If someone really wants to enable it, they can drop the patch. I'm open
>> to feedback from others like Ross/Jussi but IMO I think we can accept
>> the degraded piglit results for swrast...
>
> Sounds like a completely reasonable compromise to me.

Okay, thanks.

It looks like there's a patch in the pipe for mesa.inc, I'll wait
until that is in place before doing and sending this update.

