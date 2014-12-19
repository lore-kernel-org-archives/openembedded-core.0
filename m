Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id F04DA7292E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 13:58:52 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id hz20so860619lab.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 05:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=kkeFoIU4GfLqxQ4nWycGxQipCBShUi4zferLjxyiP44=;
	b=QClWf0yYbF0tLVuJjpbrR2S6F1LX4mLALZNIGiM2AjGBFINbZ6sfbzCBs/6apeGjPZ
	RDjQN84bbeJ+MelhCZPV+EYsP/jGDLFiTF80oQe8U2aqNLnivWiFW7kEDUyZ/m1r8fst
	j8vbIa99wtoejaEUACaPlx1h9/uPc/wcfsimu423tXi4zkMMJ6d2+yRd3tIha2KRcirf
	lraXF07n0Adq0rQ8ygS9gn3048tT2lkuIZAzMDSr922Ym3b3uX2lZs200qAu34iopRKP
	x/sbFK7Wv6zVh4RC5Yo3glLLrwdO1qvrqsx/0WIu16HDmuvGbsAUoOwhI3rDnTPzo5sT
	LyIg==
MIME-Version: 1.0
X-Received: by 10.152.206.1 with SMTP id lk1mr6416790lac.92.1418997532505;
	Fri, 19 Dec 2014 05:58:52 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Fri, 19 Dec 2014 05:58:52 -0800 (PST)
In-Reply-To: <1418994949.13316.16.camel@linuxfoundation.org>
References: <1418984914.13316.6.camel@linuxfoundation.org>
	<1418992908.13316.14.camel@linuxfoundation.org>
	<54942326.8080806@windriver.com>
	<1418994949.13316.16.camel@linuxfoundation.org>
Date: Fri, 19 Dec 2014 08:58:52 -0500
Message-ID: <CADkTA4MBU0Pk8y=JjO5i-UK=eUatzi1ui5GNwVuqKiyc7m8YcA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Merging problems
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
X-List-Received-Date: Fri, 19 Dec 2014 13:59:00 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 19, 2014 at 8:15 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2014-12-19 at 08:07 -0500, Bruce Ashfield wrote:
>> On 2014-12-19, 7:41 AM, Richard Purdie wrote:
>> > On Fri, 2014-12-19 at 10:28 +0000, Richard Purdie wrote:
>> >> I want to give people a headsup that we're having problems merging
>> >> changes at the moment. We've been doing our best but the number of
>> >> things building up which are causing issues is overwheling our ability
>> >> to fix and stablise the build. It wasn't helped that I took a long
>> >> weekend's vacation last weekend. There are changes being made or tested
>> >> to the autobuilder which also isn't helping.
>> >>
>> >> The kernel series has several issues:
>> >>
>> >>    * a random failure in do_kernel_configme [i]
>> >
>> > I think I have a handle on this. If you look at the autobuilder failure
>> > it says:
>>
>> do you have a link to the actual failure ?
>
> It was in a previous mail:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/builds/129/steps/BuildImages/logs/stdio
>
>> > The fix is therefore probably to not run the fetch/unpack/patch tasks in
>> > kernelsrc.bbclass.
>>
>> Very likely. I'll have a look. I noticed about 6 months ago that a patches
>> directory was being created .. even when it was never going to be used.
>> I took steps to remove it before the linux-yocto builds continued, but
>> apparently it is sneaking back in through other means :)
>
> kernelsrc.bbclass sets ${S} to point at the directory so other recipes
> can create it.

aha yes. I'm familiar with doing battle with 'patches' being created
in the build
directory,  it broke the detection of the directory that is used to hold meta
data .. and cost me about a week in August fixing things up.

With your latest patch, which problems are still outstanding ? I can have a
look at them.

Bruce

>
> Cheers,
>
> Richard
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

