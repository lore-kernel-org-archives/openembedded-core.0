Return-Path: <jandryuk@gmail.com>
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
	[209.85.167.43])
	by mail.openembedded.org (Postfix) with ESMTP id 75EF86C3B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 20:21:01 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id a8so5957445lfk.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+Bjb2zLEyNNoRjwhHJa7hKDLYY+qGZUCsscA8jFKUzc=;
	b=CvUHVDs33XEELJMHRz+lElVcmCWuMAnAIYPAQx5gtoDlAeubB1Y/adjPK0dn69PvnF
	VrbZ/QBtOKsettD5qfj+2SpVNfbhCBDysjBqIT7NM15JDazL3YRJfMpaFWGTTdS+Keqi
	RJvv8juNwLuNwi7f8Z2r3cJHNtM3RShsnLJHAr0kbUvAGLY4rhX6/DHteHAxk+hGAB0A
	k5j4nyseDMjHhVXIJpxDnIH23PwvoSWtXCKfp//Bb2zM5dEiUf3S9sZSnXWo0Z++M/lm
	bNL1aJSPVRl6x5ti0YePgShzUh3adU06hEODn6cV+3ctNZENQOKJw5oITEYA7LLitzYb
	EZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+Bjb2zLEyNNoRjwhHJa7hKDLYY+qGZUCsscA8jFKUzc=;
	b=QCABE3nwtotkCQqncdFVNSxPC4rAYNoNBEK/vXZAQouUg0C0D19OEdwquZBkO2xctE
	eq7z9mJUjYoemrPKq+ipCeNgN3vIDVMTcnxF+44oS25mLciSZo0MFfJSCw7ql/XJ2nOq
	XSLozLxqIOj/NtH+2aqcToGWA+Z4i9iHKldvBYLhRqy7UOxpN6YTTcfJxEybAKC08UFs
	KIowXs/Q1YoEE4yyYx1K+0qMTiPUpgCeEF0F1TuummIltbgjvaM30/kMU60KS1MaQAx4
	hVan5092+HJTy1g2HHvoCHkagU2f7NLHHOLWAQycpXcB8K/dTBF0/y1XlJOCxNyiVIRS
	+Jcg==
X-Gm-Message-State: AJcUukeOAMe7pWTik0NHP9KlpDZE9kEuHEvpOIg6FbM5b0zWMYpCv338
	5So4AFvrwLhKmM0hWo6zqUA6N6VAyx5dDGSZ298=
X-Google-Smtp-Source: ALg8bN5GyEReOWffeDchHhxXL5CiJybKdonadNWB9+hY7uarwq1NZsS50HZhRJgPIZ9X/YDMfZTDOD+qhLiAQDsBISw=
X-Received: by 2002:ac2:4194:: with SMTP id z20mr2743819lfh.74.1547670061783; 
	Wed, 16 Jan 2019 12:21:01 -0800 (PST)
MIME-Version: 1.0
References: <CAKf6xputiV+k9m9p1dyhZG1d0wMQoWG5tCiZjpsVVu+bXp1X6A@mail.gmail.com>
	<08a89c71b2e3e0f4380325985541c55df00b94da.camel@linuxfoundation.org>
	<CAKf6xptMbAqnZ34ONNXLzQMjFoDjePH8dz3bXmiTMvoBMu4wsg@mail.gmail.com>
	<50b88771577229c99a2c9e26b6224a5f038e7bab.camel@linuxfoundation.org>
	<CAKf6xpt_RoLVg3ou2zKL2g=0GsjDXpCk73q83pmb4Reer9YgdA@mail.gmail.com>
	<a0e331f39da396ea39ea37539f6c1ea193b055b1.camel@linuxfoundation.org>
	<CAJ86T=V-xs=M2DfsHHtOe=j77bqsn=MgMojue5mc=2ouwwTd+A@mail.gmail.com>
	<731530484e0135bb200df4da388982b2a7957ea1.camel@linuxfoundation.org>
	<CAKf6xpv2UAGbBr5wOqQdZNgNe5Hra6+bF+OWy_tTD5v3wyobhw@mail.gmail.com>
	<26b33c4efb48aaae0bd4662b88bfdfd428b95478.camel@linuxfoundation.org>
	<CAKf6xpvj7gLodcqWAXLL7vW_5Cqep_gLpr+5+7_V-e1z29L5BQ@mail.gmail.com>
	<9ed6a0a740a04f9ecc88659051a107ac6f4bd2c4.camel@linuxfoundation.org>
In-Reply-To: <9ed6a0a740a04f9ecc88659051a107ac6f4bd2c4.camel@linuxfoundation.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 16 Jan 2019 15:20:49 -0500
Message-ID: <CAKf6xpvtQL+PXokJKWLHgRchrGdaXi7kMOuBfYTTfELEAzr-ng@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Mis-generation of shell script (run.do_install)?
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
X-List-Received-Date: Wed, 16 Jan 2019 20:21:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 16, 2019 at 9:02 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-01-16 at 08:55 -0500, Jason Andryuk wrote:
> > On Tue, Jan 8, 2019 at 1:26 PM <richard.purdie@linuxfoundation.org>
> > wrote:
> > > On Tue, 2018-12-18 at 12:45 -0500, Jason Andryuk wrote:
> > > > I can definitively state I have a hash in bb_codeparser.dat with
> > > > an
> > > > incorrect shellCacheLine entry and I don't know how it got there.
> > > >
> > > > The bad hash is 3df9018676de219bb3e46e88eea09c98.  I've attached
> > > > a
> > > > file with the binutils do_install() contents which hash to that
> > > > value.
> > > >
> > > > The bad 3df9018676de219bb3e46e88eea09c98 entry in the
> > > > bb_codeparser.dat returned
> > > > DEBUG: execs [
> > > > DEBUG: execs rm
> > > > DEBUG: execs install
> > > > DEBUG: execs test
> > > > DEBUG: execs sed
> > > > DEBUG: execs rmdir
> > > > DEBUG: execs bbfatal_log
> > > > DEBUG: execs mv
> > > > DEBUG: execs /home/build/openxt-compartments/build/tmp-
> > > > glibc/work/core2-32-oe-linux/python-async/0.6.2-r0/recipe-
> > > > sysroot-
> > > > native/usr/bin/python-native/python
> > > > DEBUG: execs find
> > >
> > > This is useful data (along with the attachment), thanks.
> > >
> > > I agree that this looks likely to have come from a core2-32 tuned
> > > machine (e.g. genericx86) from python-async do_install.
> > >
> > > How old was this build directory? Can you remember any details of
> > > the
> > > update history for it?
> >
> > I think the build directory was from the beginning of October 30th,
> > and I guess I hit the collision December 10th or so.
> >
> > > I'd be very interested to try and reproduce that hash. I locally
> > > blacklisted your collision from my cache and tried to reproduce
> > > this. I
> > > can generate a matching hash for the binutils do_install but I
> > > can't
> > > produce one matching the above.
> >
> > I tried around December 18th to generate the collision again.  I set
> > up a new container with an identical openxt path.  There, python-
> > async was built, but it did not have the colliding hash.  When core2-
> > 64 binutils was built, it had the expected hash.
> >
> > > Can you remember the history of this build directory and which
> > > updates
> > > it may have had? The python-async recipe is confined to OE-Core so
> > > its
> > > probably the revision history for the oe-core repo which is most
> > > interesting. Anything in the .git/logs directory for that which
> > > would
> > > help us replay the different versions you might have built?
> >
> > oe-core is checked out at 819aa151bd634122a46ffdd822064313c67f5ba5
> > It's a git submodule locked at a fixed revision, and it had not
> > changed in the build directory.
> >
> > OpenXT builds 8 or 9 different MACHINEs and images in sequence in the
> > same build directory.  Maybe 6 are core2-32 and two are core2-64. The
> > 32bit ones run first.
>
> The hash we don't have is from a core2-32 MACHINE. I'm wondering which
> configurations you might have parsed for a core2-32 MACHINE between
> October and December?

Which "configurations" are you asking about?

The standard OpenXT build loops through building all 8 images and
packaging them up into an installer iso.  Often I run that build
script, but sometimes I just build individual machines manually.

I was mainly working on the core2-64 machines immediately prior to
this event.  I was very surprised when it occured since 1) I didn't
expect binutils to be re-built and 2) I wasn't working on the
openxt-installer machine which failed.

> Was TMPDIR ever cleaned? If not, do you have the python-async WORKDIR
> for core2-32? The TMPDIR/logs directory may also have useful hints
> about the configurations built...

Unfortunately, yes, I cleaned TMPDIR when I hit the build error.  Same
with the sstate-cache.

In general, I don't see python-async in TMPDIR after running through
the OpenXT build.  Would that be because an early machine builds
python-async, but then it gets cleared out of TMPDIR when a later
machine/image are built?

> > I think the problem first manifest after I added an additional local
> > layer to BBLAYERS.  At that time, I started building an additional
> > MACHINE.  Along with the mis-generated run.do_install script, bitbake
> > was complaining about the binutils base hash mismatch which triggered
> > the re-build.  The first 64bit MACHINE included TUNE-CCARGS +=
> > "-mstackrealign" while the second did not.  Could that be a reason
> > why bitbake complained about the base hash mismatch?
>
> By the time the binutils error happens, the error is kind of lost in
> history and must have been added some time prior to that.
>
> We know its a build of python-async for a core2-32 MACHINE. Did you
> also try building those with the "-mstackrealign" option? Were there
> any other changes you can think of that would have applied to the
> core2-32 MACHINE builds?

All the base OpenXT machines have "-mstackrealign" in their conf.  My
new 64bit machines do not have it.  I don't recall working with
core2-32 MACHINES at the time.  The new layer I pulled in only had a
layer.conf and a 64bit machine.conf.

In my second container, I `rm -rf cache/ tmp-glibc/ sstate-cache/`.
Running the build of the first OpenXT machine, bb_codeparse.dat gets
populated with python-async:
'3c6fe664c51d2f793f8fd0eb103d68cb': frozenset({'find', 'sed',
'install', 'mv', 'bbfatal_log', 'rmdir', '[', 'rm',
'/home/build/openxt-compartments/build/tmp-glibc/work/core2-32-oe-linux/python-async/0.6.2-r0/recipe-sysroot-native/usr/bin/python-native/python',
'test'})

python-async is not in tmp-glibc/work and `grep -r tmp-glibc/log`
doesn't turn up anything.  If I run `bitbake -g`, python-async doesn't
appear in any of the output files.  Is bb_codeparser.data getting
populated without building the recipe to be expected?

Regards,
Jason

