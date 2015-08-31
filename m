Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4261876D28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 14:39:20 +0000 (UTC)
Received: by igui7 with SMTP id i7so55576520igu.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 07:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Qh/ZI/jh07GqW211X3JVPCL2qmLx+9zkbPRHYsDBYrg=;
	b=j3IfF5jjHEkSYSZhLKW1MQwVbkEybTV47FtOAegfEuv9jnFpShedT0Z1G4ZRU5KWdT
	mOpfEp4WoEiGCU8xxb5sUKHaeyr0uE7JtRbwRL7AOcjTGY9J93soNTr4KxFnOV0Fb3Dm
	6QGFJzOoez8LV5dh8rVHjMr78Zpu/sIoWTr/W3EfrQheTp/QEh+H8pn6RAhAFJNPXVS7
	DWn/oQHYC0K1MZJTv/ERJoOyt96/HNofwoWCyyNpFKeIG0hNwQtkLrfzMrUqTNjLbqTH
	qOZ8WQmwOFYPWm7GBXzZor3QIxzUSnx/g5F/OlNehvDrRGiUGRmhrLZ849ZXhBdHawBq
	/K1w==
X-Received: by 10.50.55.73 with SMTP id q9mr12750306igp.11.1441031960850; Mon,
	31 Aug 2015 07:39:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.202 with HTTP; Mon, 31 Aug 2015 07:38:51 -0700 (PDT)
In-Reply-To: <1441029218.26554.21.camel@linuxfoundation.org>
References: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
	<cover.1440680489.git.jussi.kukkonen@intel.com>
	<694e679ee04cff2ca5029720b316cf1c6fb55496.1440680489.git.jussi.kukkonen@intel.com>
	<7D73CC7E-2609-4B6F-8E92-6A71CB25983F@gmail.com>
	<CAHiDW_GULRgXqOMkAyPFFEU0ROdTmL+tc93w40eLwOvnrFsd2A@mail.gmail.com>
	<CAHiDW_FTdPR1gP12VLfVtijg5NVpYPCm_3vmDga-O_8KoHkDag@mail.gmail.com>
	<CA+chaQe6ayG9k1Hh9sqN+EaBr8GskHMWVQ_L9LqycVhSJN3YqA@mail.gmail.com>
	<1440843517.32588.7.camel@linuxfoundation.org>
	<CAP9ODKrn8285URXOwLeR2Z_M=sAj0Y0MR_ZsL_D4mbA=UHi_zQ@mail.gmail.com>
	<1441029218.26554.21.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Aug 2015 07:38:51 -0700
Message-ID: <CAMKF1sphYcMNjCOqgT5+yc0uWnpmjrAVBcxhbnczAZT1prY1qw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] gmp: Bring back version 4.2.1 (LGPL 2.1+)
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
X-List-Received-Date: Mon, 31 Aug 2015 14:39:21 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2015 at 6:53 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2015-08-31 at 10:22 -0300, Otavio Salvador wrote:
>> On Sat, Aug 29, 2015 at 7:18 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Sat, 2015-08-29 at 10:43 +0200, Martin Jansa wrote:
>> >> Did you enable thumb in that qemuarm build?
>> >>
>> >>
>> >> It's disabled by default and multiple components are broken when you
>> >> enable it, see:
>> >> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
>> >
>> > I'm going to draw a line here. People are asking that the old version of
>> > gmp be brought back due license issues, fine. It doesn't mean that all
>> > the bugs in said old release should be fixed.
>> >
>> > If thumb on arm with old gmp is an issue for people, I'd suggest that
>> > those people figure out which patches are needed and send the patches.
>> > Asking Jussi to deal with this isn't right/fair though.
>>
>> I disagree. If it will be merged it ought to support what we are
>> testing nowadays otherwise the backlog will be kept growing forever...
>
> We cannot reasonably expect Jussi to do this work.
>
> OE needs to move onward, be it with kernel versions, compiler versions
> or library versions since not to do so effectively will result in OE
> becoming obsolete and out of touch.
>
> The GNU world moving to *GPLv3 is unfortunate in some ways but isn't
> something I/we have any choice over.
>
> We have a commitment right now to have some older licenced recipes. To
> make those work, *someone* is going to have to step up and work on them.
> Who is going to do it?
>
> By your comment, I should just refuse the old gmp version entirely?

There is alternative suggestion. I think all this is happening for
nettle which we have GPLv2 version in core. There doesnt seem to be a
full use of libgmp elsewhere.
nettle can be built using mini-gmp, as well I think that route should
be explored. That also keeps the us honest with our motive of moving
all
gplv2 legacy packages to layer of its own in future.

>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

