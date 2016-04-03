Return-Path: <max.oss.09@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 67FAD76E3F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Apr 2016 22:54:56 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id s79so46174414oie.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Apr 2016 15:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=Ntl/hOfqH8EWqqTfpwneILfR3kncRP0rKfjVNeupAYk=;
	b=FnkZsChD+vg6jFx69M5ILS2/tJFQVW8Isa+0pedjTXslcpumI4zqDpOMsJVDdulzKv
	3uepE8mmxzDGjydLxp4qyQ7Tduo+10a4mREDSCVmS5pV02JI3cBq/R9CzVHaXg1UujcF
	2p4BFKyiWdP9uHGg88yb36WtcTSPwitRI5H3d8jfCq1KWCBCgWfEBz2DTgp6KG6kOipx
	koYFznMXdpliHcQc1Ua2yjTSwgA4AlnZ311O+LyUlBhuSkL/Kj6Yhni7f88EJ8AP2LyP
	PIKMF7GJ5Wgej/ewv7kKoEljrWjRO7C7JcN/b9X2K1eV0qs7Uqgm4QETtBoGBhdGcDVd
	C1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=Ntl/hOfqH8EWqqTfpwneILfR3kncRP0rKfjVNeupAYk=;
	b=f2qJ5yy2giWko9Jqi+kPLHeB7/66g+UqlVRuZR1IiImy8Rbi5S4Lu+A7gBid8tYM7a
	5WpeIiIuubk4bYToqvc8ofce6jTzXE+jDr6sqfINCTWiVDynx/+Mzfop4DDFeIreZN1W
	X1ZNvGF49KO5Ctx0Gq5iBzqLbLLtQUb7ZBjCsgI4JpudsMAJdaRJ3yA45bX1aJiHY7d+
	L3CpawgppToGWyEZbabAo4Alm7gMeecUUJmxEFvjyfC3PUN5pCa2rRHSwWJdrOBWVD7l
	A+JmdQuQdhIEa/dJm1613JMCLx1LyBu1LTJAuZdbqawNpV+XE5zxpsxkNaauhpG+AaPO
	Jg8Q==
X-Gm-Message-State: AD7BkJKD5nh/EGvxvRzwO0UsGnd9/k2BShTaJEmNHYAf9NAK4b5dC86rZRjA6P1hPbUf8WE/5LEiA4t7GPupbg==
MIME-Version: 1.0
X-Received: by 10.157.27.155 with SMTP id z27mr8223572otd.99.1459724096683;
	Sun, 03 Apr 2016 15:54:56 -0700 (PDT)
Received: by 10.157.5.203 with HTTP; Sun, 3 Apr 2016 15:54:56 -0700 (PDT)
In-Reply-To: <CAMKF1sp_yzu2KnHvN_4R0+-_cfhp9i_J4t=-mNcj5nyif4dWJg@mail.gmail.com>
References: <1459717038-10549-1-git-send-email-max.krummenacher@toradex.com>
	<1459719934.7348.141.camel@linuxfoundation.org>
	<CAMKF1sp_yzu2KnHvN_4R0+-_cfhp9i_J4t=-mNcj5nyif4dWJg@mail.gmail.com>
Date: Mon, 4 Apr 2016 00:54:56 +0200
Message-ID: <CAEHkU3XgovQPm6dq5EKGx6RJPMUxvKfBuYEjxg3Kw6hp9WJtbg@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe][Patch] package.bbclass: fix host contamination warnings for source files
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
X-List-Received-Date: Sun, 03 Apr 2016 22:54:56 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem

2016-04-03 23:53 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
>
> On Apr 3, 2016 2:45 PM, "Richard Purdie"
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Sun, 2016-04-03 at 22:57 +0200, Max Krummenacher wrote:
>> > Addresses https://bugzilla.yoctoproject.org/show_bug.cgi?id=8939
>> >
>> > Source files deployed with the *-dbg packages are owned by the user
>> > running bitbake leading to warnings as the one below.
>> >
>> > WARNING: glibc-2.23-r0 do_package_qa: QA Issue: glibc: /glibc
>> > -dbg/usr/src/debug/glibc/2.23-r0/git/include/resolv.h is owned by uid
>> > 1000, which is the same as the user running bitbake. This may be due
>> > to host contamination
>> > glibc: /glibc-dbg/usr/src/debug/glibc/2.23-r0/git/include/monetary.h
>> > is owned by uid 1000, which is the same as the user running bitbake.
>> > This may be due to host contamination
>> > glibc: /glibc-dbg/usr/src/debug/glibc/2.23-r0/git/include/locale.h is
>> > owned by uid 1000, which is the same as the user running bitbake.
>> > This may be due to host contamination
>> > ...
>> >
>> > The files are copied as part of the do_package task.
>> > The patch chowns all file in packages/usr/src after cpio copied them
>> > into the
>> > package directory.
>> >
>> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
>> > ---
>> >
>> >
>> >  meta/classes/package.bbclass | 23 +++++++++++++++++++++++
>> >  1 file changed, 23 insertions(+)
>> >
>> > diff --git a/meta/classes/package.bbclass
>> > b/meta/classes/package.bbclass
>> > index bdbe96d..d9ef62c 100644
>> > --- a/meta/classes/package.bbclass
>> > +++ b/meta/classes/package.bbclass
>> > @@ -362,6 +362,7 @@ def copydebugsources(debugsrcdir, d):
>> >      # and copied to the destination here.
>> >
>> >      import stat
>> > +    import subprocess
>> >
>> >      sourcefile = d.expand("${WORKDIR}/debugsources.list")
>> >      if debugsrcdir and os.path.isfile(sourcefile):
>> > @@ -410,6 +411,28 @@ def copydebugsources(debugsrcdir, d):
>> >          if retval:
>> >              bb.fatal("debugsrc symlink fixup failed with exit code
>> > %s (cmd was %s)" % (retval, cmd))
>> >
>> > +        # cpio --no-preserve-owner does not create the destination
>> > files with
>> > +        # owner root even when run under pseudo, chown them
>> > explicitely.
>>
>> How about passing --owner=0:0 to cpio?
>>
>> I'm a little worried about why I don't see this failure on my own local
>> builds.
>
> Can you dump the dbg rpm from poky and see if the flagged file is there ?
I checked this with -c package followed by -c devshell.
In poky they source files are missing, in angstrom they are in
${WORKDIR}/package/usr/src
but with the 'wrong' owner.

Regards
Max

>>
>> We have a few cases where things sometimes seem to work out and
>> sometimes don't and I'd love to get to the bottom of how to reproduce
>> it and to understand why its different for different people.
>>
>> Cheers,
>>
>> Richard
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

