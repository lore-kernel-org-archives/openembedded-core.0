Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id AA6C67C156
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 14:02:40 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id f188so2088957wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 06:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=LOrLcpVeF6vITkXE9khl3Ge/fQjoIUxEPUSMWHWx3Tw=;
	b=UjtNypN1i72kr2j8AA1NiWbR2FX1gdpS4YlI9wgCJfwwILJ26tm8vxbHrWdozF4ERc
	liZWvTmlqF1DBcxHNqaeu1OpfHlTfR39oY85JuwpGUDDjasCNYcn44SNuQ9hcN3PwvJ+
	EgHVefUs3eKRsOVFFGHH1K1RedK2g7Jk4Vexw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=LOrLcpVeF6vITkXE9khl3Ge/fQjoIUxEPUSMWHWx3Tw=;
	b=Jb1IFTQlodbaJwrX989matUIIdFXWMFiFjdbwSadNatNN8t4u89Ft/G7y1hKzso5cu
	f0fa9vRI6J0QZIntN9JJVYTmFfAVY3RW6nv86HLbjmuwdt9ZRSXqKi1KEClCIDxiqktn
	UCGF4dlLsZs3yn13cEITbKBc8svPsl52525ASNFJwHGjaQ9o4g7lLiI4TGIQwE6AP+jA
	FGgzFgmA2wJFtcMPHxrddzb0Vhg+8LoSKnRVZCQQi9YYHAxdDuN7HAPTx/wb646RPS9B
	O/bzKzJqTXHwFY0tYUjR16xXFru8miDpUKMkxg915ve5Dkqjf9zxYT7K/oiRdSbb7QlC
	iZwA==
X-Gm-Message-State: AJcUukevkq70cJM8HL234Dsxa57MkHxXhHYGv2vQPpcZouxpx95o1MrM
	XloZqWWla4zdN0kn9/WzSZh5XQ==
X-Google-Smtp-Source: ALg8bN5pQ346BvyxhguwEEsZvJYY06/ir5q96mysSVyzVjL1eAIKzyGBgfHE2kScv4Rz8jrwV3aCtw==
X-Received: by 2002:a1c:c008:: with SMTP id q8mr6983397wmf.99.1547647361284;
	Wed, 16 Jan 2019 06:02:41 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v132sm37817986wme.20.2019.01.16.06.02.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 Jan 2019 06:02:40 -0800 (PST)
Message-ID: <9ed6a0a740a04f9ecc88659051a107ac6f4bd2c4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 16 Jan 2019 14:02:38 +0000
In-Reply-To: <CAKf6xpvj7gLodcqWAXLL7vW_5Cqep_gLpr+5+7_V-e1z29L5BQ@mail.gmail.com>
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
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
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
X-List-Received-Date: Wed, 16 Jan 2019 14:02:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-01-16 at 08:55 -0500, Jason Andryuk wrote:
> On Tue, Jan 8, 2019 at 1:26 PM <richard.purdie@linuxfoundation.org>
> wrote:
> > On Tue, 2018-12-18 at 12:45 -0500, Jason Andryuk wrote:
> > > I can definitively state I have a hash in bb_codeparser.dat with
> > > an
> > > incorrect shellCacheLine entry and I don't know how it got there.
> > > 
> > > The bad hash is 3df9018676de219bb3e46e88eea09c98.  I've attached
> > > a
> > > file with the binutils do_install() contents which hash to that
> > > value.
> > > 
> > > The bad 3df9018676de219bb3e46e88eea09c98 entry in the
> > > bb_codeparser.dat returned
> > > DEBUG: execs [
> > > DEBUG: execs rm
> > > DEBUG: execs install
> > > DEBUG: execs test
> > > DEBUG: execs sed
> > > DEBUG: execs rmdir
> > > DEBUG: execs bbfatal_log
> > > DEBUG: execs mv
> > > DEBUG: execs /home/build/openxt-compartments/build/tmp-
> > > glibc/work/core2-32-oe-linux/python-async/0.6.2-r0/recipe-
> > > sysroot-
> > > native/usr/bin/python-native/python
> > > DEBUG: execs find
> > 
> > This is useful data (along with the attachment), thanks.
> > 
> > I agree that this looks likely to have come from a core2-32 tuned
> > machine (e.g. genericx86) from python-async do_install.
> > 
> > How old was this build directory? Can you remember any details of
> > the
> > update history for it?
> 
> I think the build directory was from the beginning of October 30th,
> and I guess I hit the collision December 10th or so.
> 
> > I'd be very interested to try and reproduce that hash. I locally
> > blacklisted your collision from my cache and tried to reproduce
> > this. I
> > can generate a matching hash for the binutils do_install but I
> > can't
> > produce one matching the above.
> 
> I tried around December 18th to generate the collision again.  I set
> up a new container with an identical openxt path.  There, python-
> async was built, but it did not have the colliding hash.  When core2-
> 64 binutils was built, it had the expected hash.
> 
> > Can you remember the history of this build directory and which
> > updates
> > it may have had? The python-async recipe is confined to OE-Core so
> > its
> > probably the revision history for the oe-core repo which is most
> > interesting. Anything in the .git/logs directory for that which
> > would
> > help us replay the different versions you might have built?
> 
> oe-core is checked out at 819aa151bd634122a46ffdd822064313c67f5ba5
> It's a git submodule locked at a fixed revision, and it had not
> changed in the build directory.
> 
> OpenXT builds 8 or 9 different MACHINEs and images in sequence in the
> same build directory.  Maybe 6 are core2-32 and two are core2-64. The
> 32bit ones run first.

The hash we don't have is from a core2-32 MACHINE. I'm wondering which
configurations you might have parsed for a core2-32 MACHINE between
October and December?

Was TMPDIR ever cleaned? If not, do you have the python-async WORKDIR
for core2-32? The TMPDIR/logs directory may also have useful hints
about the configurations built...

> I think the problem first manifest after I added an additional local
> layer to BBLAYERS.  At that time, I started building an additional
> MACHINE.  Along with the mis-generated run.do_install script, bitbake
> was complaining about the binutils base hash mismatch which triggered
> the re-build.  The first 64bit MACHINE included TUNE-CCARGS +=
> "-mstackrealign" while the second did not.  Could that be a reason
> why bitbake complained about the base hash mismatch?

By the time the binutils error happens, the error is kind of lost in
history and must have been added some time prior to that.

We know its a build of python-async for a core2-32 MACHINE. Did you
also try building those with the "-mstackrealign" option? Were there
any other changes you can think of that would have applied to the
core2-32 MACHINE builds?

Cheers,

Richard




