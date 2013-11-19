Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 43A276B4BD;
	Tue, 19 Nov 2013 16:01:05 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id q8so4981442lbi.40
	for <multiple recipients>; Tue, 19 Nov 2013 08:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZHC1JSxUJ3s2Wb+cMkQOimYAnmD4lsVkyMO63+ZJxFQ=;
	b=qyTmzRwIeJ6UOm2PpMp0nQTUQOpxi30OstVU2TVaJafgKtkWYvC5zwuYeRBKH3kkRH
	XRk+ik8dCq8MoDzlAVZcF8FJrc6vBGKI9X7yMqnH/70ySI35dBJncSOF02fshcTuLRYP
	cldKC+XOTPrX8j5o4MNIXUsUX2K2u3ZlyS1an5BdnvueizNfYtMsOvsmzgGR7VWmK/XB
	crkOpl7KYGg1+NJzhlUupwhNhYXXz8yujxagnOBXdCT4d0wn+5GHDDTgNFaUVXo7N9WL
	9L+qDCfZqCvMmoZaCtTDQIFnIb+KStxOH6SXM6IO9/6tYiZW1uVdd5TORyBC3KmsTC/K
	G9Og==
MIME-Version: 1.0
X-Received: by 10.152.23.137 with SMTP id m9mr19248967laf.17.1384876866469;
	Tue, 19 Nov 2013 08:01:06 -0800 (PST)
Received: by 10.112.52.74 with HTTP; Tue, 19 Nov 2013 08:01:06 -0800 (PST)
In-Reply-To: <20131119155622.GA10619@deserted.net>
References: <20130603151008.GC3279@jama> <20130611160434.GI3233@jama>
	<20130622181656.GK14021@jama> <20130725162341.GA3280@jama>
	<20130808225419.GB17945@jama> <20130811114403.GG17945@jama>
	<20130917123058.GC7313@jama> <20131020194345.GB3709@jama>
	<20131030230825.GB32015@jama> <20131119155040.GD3708@jama>
	<20131119155622.GA10619@deserted.net>
Date: Tue, 19 Nov 2013 17:01:06 +0100
Message-ID: <CAAQYJAvoXz-n7XiZEATZ3kfkWv0XTMdONCegiL3DMMmJQbkcXw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world
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
X-List-Received-Date: Tue, 19 Nov 2013 16:01:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 19, 2013 at 4:56 PM, Joe MacDonald <joe@deserted.net> wrote:
> [Re: [OE-core] State of bitbake world] On 13.11.19 (Tue 16:50) Martin Jansa wrote:
>
>> On Thu, Oct 31, 2013 at 12:08:25AM +0100, Martin Jansa wrote:
>> > Starting now I'll use
>> > http://openembedded.org/wiki/Bitbake_World_Status
>> > to post results from my bitbake world buils.
>>
>> It was updated few times since this e-mail and I've received no
>> feedback.
>>
>> Should I continue to post them or nobody except me is really interested?
>
> I'm interested.  I've not had nearly as much time to hunt down the ones
> I own as I'd like, but I do appreciate the mail and I flag them in my
> mailboxes for easy reference later.
>
> -J.
>
>>
>> The stats also show that nobody is interested in fixing them, some issues are
>> there for 6+ months.
>>

Martin,

thanks for the time you're spending on it.
About the failure concerning my maintainance fields, I see:

| Logfile is clean
| makedevs: No entry for root in search list
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_rootfs (log file is located at
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-linux/initramfs-kexecboot-klibc-image/1.0-r0/temp/log.do_rootfs.5623)


So I grep in oe-core for " makedevs: No entry for root in search list"
and find a serie of commits touching it...

Most probable origin of the issue. Starnge that itfails only on x86, though.

Cheers

Andrea










>> Date                   Failed tasks            QA     QA-w/o-unrecognized
>>                 qemuarm       qemux86 qemux86_64      qemuarm qemux86 qemux86_64      qemuarm qemux86 qemux86_64
>> 2013-11-19    12      17      19      141     142     131     29      27      18
>> 2013-11-03    11      18      19      96      127     123     22      21      16
>> 2013-10-31    9       17      19      74      114     107     23      21      14
>> 2013-10-30    11      16      18      224     191     184     28      23      16
>>
>>
> --
> -Joe MacDonald.
> :wq
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

