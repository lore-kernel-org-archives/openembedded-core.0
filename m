Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id F34C87E069
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 18:37:09 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id x24so11848582ion.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 11:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=7s2vTGfewD/Ep487gLcFcitmV0afUQ57/eiSKLuvcso=;
	b=sO7AuJrDmRinyGOy9T/Il+T4de+D9XCQUHphJf5p1Sl5dcaDTcJBOee5wDcGzgtoly
	CSzZjVm06yN1qqnYxPcxkwCT3ITqH9aPKOq1HVMwp+PQactetel2Ln8yIyrNB8eKPOUM
	XpedIAFGY5xRN6xgYqLO0eIJZIKjqeP1vNzrQto1pE8PYmA6crfmVXuRsOA8WiaoMcKZ
	mk7eGS0r3lbArD61fRUyMBEUBkJnAjHmI2vuS/6Pi4/PHez57I8+E+fjV8tE9x+jnpuN
	ViMlWjAMLRreNJkido6N1Vg3/paCcNURLcFMzrB4dG9NzIA5cyhBmiyVsnoozjQDwZyd
	wa6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=7s2vTGfewD/Ep487gLcFcitmV0afUQ57/eiSKLuvcso=;
	b=HEzmpUV8G7SWKqJxXtU6jEwpZ5Mu1njl2GIyNH1uAZzk0o6ybPx7aAe+jqR9XCxWY6
	ctzLjsWLTxKF3CRgQrcgsYziU7p9A9YIKW8z/jTzwO/5VsGOu7mfOAm7nQQPLHJl/Hqw
	5qD8uDnDbz8OkSFwvmwdLBO/MlvuWGNlL5xLRmRYkGeLsp4kkal/6Iuu+MFlN9942z+7
	r03MY+FD2Ubs3WLhYLWh6XYVghq8pZ8cqDk6sPfbBWJoeZ0OZP6DdXjzjwv1vl+rr2n7
	/bo0aW3fFKG+JlA65FaVmpXwzlrm8zDj1NYzKH+3do/HEyY087UbeBH+oswdIHoxn5dS
	3Q0w==
X-Gm-Message-State: APjAAAV/bx3EV4IPtwqm6+XBGMHMqbgGtMHRl0fha2tokKozkERV5QVg
	ssMtK49kiX/VQb0pNAc0Fb0=
X-Google-Smtp-Source: APXvYqwPbdrGNzOCIcnb7ybE5rBu1GQtBWeyL+P0ma/xIU+xepnkYO70bHrTQdJ03FunWeaBvdx3Fw==
X-Received: by 2002:a5d:968e:: with SMTP id m14mr10415771ion.49.1558377430710; 
	Mon, 20 May 2019 11:37:10 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	k76sm161849ita.6.2019.05.20.11.37.09
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 20 May 2019 11:37:10 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <8c652917e2f4eb1dc8aa75d27e4e77d457851cd9.camel@gmail.com>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 13:37:09 -0500
In-Reply-To: <f87316b2-9628-3ef2-708d-cee93657928a@gmail.com>
References: <20190520165719.20041-1-JPEWhacker@gmail.com>
	<f87316b2-9628-3ef2-708d-cee93657928a@gmail.com>
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Subject: Re: [PATCH 0/1] Initial QA test for reproducible builds
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
X-List-Received-Date: Mon, 20 May 2019 18:37:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-05-20 at 10:47 -0700, Khem Raj wrote:
> Hi Joshua
> 
> Thanks for contributing this will provide some teeth to reproducible 
> builds QA
> 
> On 5/20/19 9:57 AM, Joshua Watt wrote:
> > Implements an initial QA check for reproducible builds. This check
> > is
> > sufficient for an initial implementation, and will catch a wide
> > variety
> > of reproducible problems, but it does have the following problems:
> > 
> >   1) It doesn't pass. Currently, about 800 packages fail to build
> >      in a reproducible manner for core-image-minimal. I've found
> > two
> >      major sources of non-reproducibility so far:
> >       a) The perl-module packages don't have a consistent
> >          SOURCE_DATE_EPOCH which means when they are packaged the
> >          timestamps on all the files are different. Thankfully,
> > this
> >          accounts for several hundred of the packages, so fixing
> > this
> >          should remove a lot of the failures
> 
> maybe we can start with inhriting reproducible_build_simple which
> has 
> hardcoded values for SOURCE_DATE_EPOCH

reproducible_build.bbclass automatically inherits
reproducible_build_simple if BUILD_REPRODUCIBLE_BINARIES is set, and it
sets that by default.

I'm not actually sure how the value of SOURCE_DATE_EPOCH set in
reproducible_build_simple.bbclass matters at all. AFAIK,
reproducible_build.bbclass tries *really* hard to get a discernible
date from the source code repository itself after do_unpack, and
failing that uses 0. Near as I can tell, the value set in the class or
by the user only matters until the end of do_unpack.

I think something happens to be broken with this heuristic in the perl
recipe. I haven't tracked it down just yet.

> 
> >       b) Debug package strings aren't consistent. It appears that
> > in some
> >          of the -dbg packages, the linker changes the order of the
> > merged
> >          .debug_strings section. This trickles down into the
> > packages
> >          that contain the executables because it changes the hash
> > the
> >          executable contains to ensure the debug symbols match up.
> > 
> 
> try adding -fno-merge-debug-strings to linker and see if that fixes
> this 
> problem. If that happens then we know its an option to add when
> doing 
> reproducible builds.

Excellent. I will try that.

> 
> >   2) It's not easy to debug issues when there are reproducibility
> >      problems. I had initially intended to run diffoscope on the
> >      resulting files but this takes much longer than I think we are
> >      willing to run on the autobuilder and also generates far too
> > much
> >      output to be really useful. I think a better long term route
> > is to
> >      have the test dump the list of non-reproducible packages and
> > then
> >      write a helper script that can consumer this list, allow the
> > user to
> >      select a package, then run diffoscope to examine it.
> 
> I think that might be needed to wrap diffoscope.

I'm not sure I quite follow what you are saying here?

> 
> >   3) This test currently is incomplete and won't catch all classes
> > of
> >      reproducibility problems. At the least, I know that it won't
> >      consistently catch the use of the __DATE__ macro in source
> > code,
> >      since that requires the builds to be done on two separate
> > dates (on
> >      the other hand, use of __TIME__ will be caught pretty reliably
> > since
> >      the builds are done serially). I suspect the correct solution
> > to
> >      this is to borrow from Debian and use something like faketime
> > to
> >      fake out the system time to some suitable future date when
> > doing the
> >      test build, but this will require some though to how it should
> > be
> >      implemented.
> > 
> >   4) It currently only tests Debian packages and core-image-
> > minimal. The
> >      test case has support for building the other package formats
> > and
> >      other images at the same time, the idea being that the long
> > step in
> >      this test is building everything from scratch, and building
> > multiple
> >      package formats and images at the same time will be much
> > faster
> >      overall than having multiple tests that have to do from-
> > scratch
> >      builds (although, there might be a way to serialize multiple
> > tests
> >      and have them share the test build TMPDIR). Until at least 1
> > package
> >      format and image are passing, I don't see a huge motivation to
> >      enable more.
> 
> why does it have to depend on packaging backend ?

It doesn't particularly. Comparing the end packages is just the easiest
way to check for reproducibility (I think?). I originally tried
comparing sstate tarballs, but I quickly realized that was going to be
very difficult without making a lot of changes to the way sstate
tarballs are generated (e.g. timestamps and such).

On the other end of the spectrum would be to compare the final image
files themselves; I like that idea and I think we *should* do that
after we get the packages to be reproducible, but it's not very useful
right now because it's hard(er) to track a difference in the image back
to a recipe than it is to track a difference in a package back.

You could leave the test up to whatever package classes are enabled on
the autobuilder, but I think this is less than ideal right now because:

 1) IPKs aren't reproducible *at all*... they are basically all
different. Perhaps because of timestamps? Maybe that's easy fix?

 2) The long pull on this QA is the test build from scratch... it takes
quite a while and will take even longer with a bigger image.
Comparatively, generating multiple packages classes doesn't add that
much more time to the build, so I *think* it might make sense in the
long run to have the test build all the package formats in one go, or
at least being able to share the test build TMPDIR between multiple
serial tests.

> 
> > Joshua Watt (1):
> >    oeqa: Add reproducible build selftest
> > 
> >   meta/lib/oeqa/selftest/cases/reproducible.py | 159
> > +++++++++++++++++++
> >   1 file changed, 159 insertions(+)
> >   create mode 100644 meta/lib/oeqa/selftest/cases/reproducible.py
> > 
-- 
Joshua Watt <JPEWhacker@gmail.com>


