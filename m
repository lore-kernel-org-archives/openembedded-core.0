Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1F7DC60B9B;
	Sun, 30 Mar 2014 04:17:51 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id rl12so6495087iec.36
	for <multiple recipients>; Sat, 29 Mar 2014 21:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=LSzDWOR1aZKndf+wo2l1XB+HOzk49oTtbjGB2zx0czw=;
	b=HSPnYFSAEXwu7kPMWsuGH6ag5u0QSvf2RmBbGeihBMiRzOmMzvmHk512iANSfDd6Ji
	ivarna/XuYo+Jc1siTueb3cbQepRGTZtSNWmsw/zKzieAqj9/ou5rFEMqydSiInnbZbf
	yI5UJM1uaU8UmqUdi4JvyIU0CrLZH9osB+aHkFLZP9BNwwMjhviIbmvggqXsRvUSB72t
	TsGvck0TqDFJn15mKX/gF3LPB7qgBRQwLyCN5t1yOBU6s9sHfAGRhUtRbPEnOhzzLD9Q
	rcR2inDRjPQB2MFpTASPzDoyq3P9PYhs2w9kkpyYkFsCFtpp2gqBnMZR73mzzYiMmWcF
	StNA==
X-Received: by 10.43.50.65 with SMTP id vd1mr457582icb.79.1396153072097; Sat,
	29 Mar 2014 21:17:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Sat, 29 Mar 2014 21:17:22 -0700 (PDT)
In-Reply-To: <CANyK_8deVKbC6xOUQHubvphfwQCQefHGWCt7Mp1QM4DUVXja5g@mail.gmail.com>
References: <CAMKF1soKZqqmQUVCQnUqS1GV1FO5KictTO+=up=d7Jw3+QhXMw@mail.gmail.com>
	<CAJTo0LYF0VNwy7=rhmr7U_=tXwJtPOax3AKttn66q3qD_QXd2w@mail.gmail.com>
	<CANyK_8deVKbC6xOUQHubvphfwQCQefHGWCt7Mp1QM4DUVXja5g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 29 Mar 2014 21:17:22 -0700
Message-ID: <CAMKF1sqPB+QCvPHHcxsU+ExBmNWg9jPXajkAR_FdKpJ76-x9dg@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] initial support for musl libc with OE/Yocto Project
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
X-List-Received-Date: Sun, 30 Mar 2014 04:17:53 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 27, 2014 at 5:53 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
> On 26 March 2014 22:12, Burton, Ross <ross.burton@intel.com> wrote:
>> On 26 March 2014 22:04, Khem Raj <raj.khem@gmail.com> wrote:
>>> There were interest in other threads in having musl as an alternative
>>> to eglibc/uclibc that we already have in OE, in that direction I have
>>> poured in my on and off work and put it into a contrib tree
>>
>> Blimey Khem that was quick. :)
>>
>
> Agreed!
>
> I wonder if it's worth splitting this out into its own layer though

I thought about it and since class/conf changes that need to go in into OE-core
first I kept it as it is (lazyness too). I think once the core support
is available in OE-core
we can spin the recipes into a layer of its own.

> (with fixes done via bbappends) so that it's easy for multiple people
> to contribute to. It would also mean it doesn't need rebasing onto
> master all the time.
>
> I'd definitely like to get involved with this. In particular I can
> ensure opkg (both current release and development branch) work with
> musl and see if some of my preferred software from meta-oe will build
> (vim, htop, etc).

start with what we have. Once master opens up I would propose the needed
changes to OE-core and spin a layer

>
> Many thanks,
>
> --
> Paul Barker
>
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

