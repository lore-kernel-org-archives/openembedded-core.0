Return-Path: <twoerner@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7F9AA6FFED
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 15:11:09 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id m48so44906583qta.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2016 07:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TF+uDsXexBG+mYHA6Y6jCE/NYiDLOjDlkcucwVyJANg=;
	b=aCwNCz5jKWKnbXwyAraCoDZI2je4pWD36Ra+F1E4GdE9VfBIDFGb4jlPihnci4EP51
	gqL3y8D/NkRx4N9kWWJ9D6UY7fXW0M1P7pDmYn2JH3BLukkMXAFXi0yGJ/0Ku6MqtCC1
	WIVnh81JoFyPHCc52JQF18lTt84no+1y90cxGtBNFZZAV9TsJvVd1NblCZqqdcXtd9kG
	H9U64dn5UwVqYLNFoERBY5A2rDXYWWgBwKeCni3po46ifVIn+DXSzJQhwuqcDPBK+TpC
	1LePzvyNtDfFT2CettgHdRqjQWrvjePIxZAEnKatzQXe2xO2gSfNvVOARPpOPGyGgNEe
	+Ylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TF+uDsXexBG+mYHA6Y6jCE/NYiDLOjDlkcucwVyJANg=;
	b=ldqSWaaddmkFahC2qBDmhfo1eRzsiOsFLrVll/4h/dh+7x3c5uJ2MurzWhZVrwAmHd
	QRFptAZ6Hi51PNV6HuOocZm5Td5JDCJzNpnmdo/YeJukYr2xlx9iad78SF47HdUAeuQk
	JUUaVcGWZsaV1yFxEvyKPqAXZSO5/O+pHzZIYssRbELs/jKJc/zEft/wCWl/NmfVasx6
	x+Oa3tSvcy7EA/aHkwqrcQCcZjHM4eIlmh2offBVxNwWqI/uAANPsjiGFKyPu2f8VGXq
	cahiycc/NgahJkoxvHluFWYz/npHY12iPxs+14Pz4uP+EMu34G3NpaosiydzNKlA8Rn5
	j9fw==
X-Gm-Message-State: AKaTC02tUUeAL4Hj0I3H+kxoHIYopsx99JNa91As9riFJhuFmHjKPHTApvGT5jybnnXYB6LbeMdfoZgFQCKa7A==
X-Received: by 10.237.36.12 with SMTP id r12mr61672473qtc.97.1481123470374;
	Wed, 07 Dec 2016 07:11:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.46.162 with HTTP; Wed, 7 Dec 2016 07:11:09 -0800 (PST)
In-Reply-To: <20161206230222.5411d7b6@nuc.betafive.co.uk>
References: <cover.1480711764.git.bruce.ashfield@windriver.com>
	<48f1e3e16ca28e1194d6024689d000cb6ffc303c.1480711764.git.bruce.ashfield@windriver.com>
	<1481058881.17535.58.camel@intel.com>
	<20161206230222.5411d7b6@nuc.betafive.co.uk>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 7 Dec 2016 10:11:09 -0500
Message-ID: <CAHUNapQ847n7e=acLQ+hkLqziqaP8EQg5_0wrw5oJ9i9+Tw6tg@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] kern-tools: fix processing for no branch meta-data
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
X-List-Received-Date: Wed, 07 Dec 2016 15:11:09 -0000
Content-Type: text/plain; charset=UTF-8

This patch does fix the raspberrypi issue, and it has been pushed, thankfully.

But I'm still seeing hard-coded filenames in /tmp that are messing up
the ability for more than one person to use a given build machine.
E.g.:

/tmp/patch.standard.arm-versatile-926ejs.queue
/tmp/patch.standard.mti-malta32.queue
/tmp/patch.standard.mti-malta64.queue
/tmp/patch.standard.preempt-rt.base.queue
/tmp/patch.standard.preempt-rt.queue
/tmp/patch.standard.queue
/tmp/patch.unused.queue

I think the malta ones are used for qemumips64, which is still failing
for this reason (multiple users)

On Tue, Dec 6, 2016 at 6:02 PM, Paul Barker <paul@paulbarker.me.uk> wrote:
> On Tue, 06 Dec 2016 22:14:41 +0100
> Patrick Ohly <patrick.ohly@intel.com> wrote:
>
>> On Fri, 2016-12-02 at 16:09 -0500, Bruce Ashfield wrote:
>> > Lernel meta-data that has patches, but no branches, can trigger an
>> > error due to no branch specific patch queue.
>> >
>> > This error then cascades to more issues since the tools are using
>> > a named file in /tmp to store and display error messages to the
>> > user.
>> >
>> > We fix both issues though the following kern tools tweaks:
>> >
>> >   commit bd9e1d6c9b0a34ff3e19a06999aaf57ffadfd04c
>> >   Author: Bruce Ashfield <bruce.ashfield@windriver.com>
>> >   Date:   Fri Dec 2 13:09:40 2016 -0500
>> >
>> >     scc: use mktemp for consolidated output capture
>> >
>> >     To provide useful error messages the tools dump pre-processed
>> >     files and messages to a temporary file. If multiple users are
>> >     doing builds, this means they either race, or can have permissions
>> >     issues.
>> >
>> >     By creating the temporary file via mktemp, we avoid both issues.
>> >     (We also make sure to clean these up on exit, or /tmp will get
>> >     polluted quickly).
>> >
>> >   commit a287da4bfe0b4acb8f2b0627bd8e7abd1a1dde26
>> >   Author: Bruce Ashfield <bruce.ashfield@windriver.com>
>> >   Date:   Fri Dec 2 13:08:08 2016 -0500
>> >
>> >     patch: do not assume a branch specific patch queue is needed
>> >
>> >     When processing input files per-branch and global patch queues are
>> >     generated. If the meta-data has not created any branches in the
>> >     repo, no branch specific queue is required.
>> >
>> >     The tools assumed that one is always valid, and hence would throw a
>> >     non-zero exit code and stop processing.
>> >
>> >     By testing for a named per-branch queue, we avoid this issue.
>>
>> Ostro OS runs into the problem while trying to use current OE-core
>> master:
>>
>>  .../patch.cmd: line 29: : No such file or directory
>>
>> | ERROR: Function failed: do_kernel_metadata (log file is located ...)
>>
>> This commit here fixed it for me. I see that it is already in Ross' mut2
>> branch, so hopefully that'll land in master soon.
>>
>
> Ditto for meta-raspberrypi, the kernel doesn't build with current
> oe-core master as discussed on the yocto@ list. This patch is needed
> to fix things.
>
> Thanks,
> Paul Barker
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

