Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <f428d42d-3a74-778f-1f6a-2d980c7f717d@gmail.com>
Date: Wed, 5 Jan 2022 06:20:37 +0100
MIME-Version: 1.0
Subject: Re: [OE-core] do_prepare_recipe_sysroot takes >5min @100% CPU
References: <CALbNGRR2505FQJDcO9ydqaiW==uM7O-RpdFJmKyWZbw=yqXfLw@mail.gmail.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
In-Reply-To: <CALbNGRR2505FQJDcO9ydqaiW==uM7O-RpdFJmKyWZbw=yqXfLw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>, Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>

Den 2022-01-04 kl. 18:47, skrev Andreas Müller:
> Hi,
> 
> with relatively actual states of layers/bitbake I see huge delays in
> my builds on tasks do_prepare_recipe_sysroot and sometimes or do_patch
> - even if recipe does not have patches.
> 
> The time the tasks take is 5-10min and each of them load one CPU with
> 100%. Is this something others have noticed or even better: any hint
> how to get over?
> 

Some years ago I ran into

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13843

It is probably not related, but maybe you can use gdb/py-bt in a similar 
way and get a Python backtrace so as to at least get a hint of why it is 
taking so long.

Jacob
