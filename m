Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id BDE926C3B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 20:28:23 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id t27so8498829wra.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=0prMpPf0xmodWcIPt4VzlSTjXhEHo89EY8ETyQ4dBRs=;
	b=ah0Z2ektFeptdXSpW75OSPnmoO3ohZiuum5IOecSWV+EhLHxn23wYtVLchfa97aJco
	RziGwEn2XxSeWBY15y6+8UWVW1t/50CE3z/Ou9Mw0vAsbPJJiZVK2cLK8BWaRJFA6FzP
	u7t9lfUJQxfoIZXbzucnkyBV+PJP46ukoqIZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=0prMpPf0xmodWcIPt4VzlSTjXhEHo89EY8ETyQ4dBRs=;
	b=rPxRE51Fz0SiTb1qY6kWHK+Vhb/qpZtCa2qq3pzyFhds8G6CKuDzB+ES6iybSVIo8f
	SwRl09epmJn4baxDYaiPjI3IkN67AsFrxwpH6RcdppuPZ54KqqBe0H1YB/KWnBNtdN76
	/YdwTYiMIXnhPW3qDpvpbzuL5SgjzY3+RddIplish5zGWwDDFCjuYFJfGj5Wmuuv3CPQ
	gu13sTFqyMJrNj6uPchZ+Y2e7e8U/+4u9qm9HKfxNQaljVNg+RRbTAOmodmv87qMUaam
	xMH5BJfnBoxbj+izPQ8pHcYg8nOKRLwWOVs+/Ko00ORi4t3G+NLukrzPTfnsU3CV0sWf
	+cuw==
X-Gm-Message-State: AJcUukeIB8Fu7VKpiDKaICHZ+mqqTcPHrVqdJsp/QF1/LUYGGtsL6UK+
	jj4cFA6apNhYqCxagqPNbONB0A==
X-Google-Smtp-Source: ALg8bN5wz2PwgRaFZE+3TSJdmqJBjan0IY2UNcOKhLhLZRk4T+HiUjjnGhOZkg52grG6vNVyBxV0Xg==
X-Received: by 2002:adf:9d08:: with SMTP id k8mr9548610wre.203.1547670504096; 
	Wed, 16 Jan 2019 12:28:24 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w16sm83902294wrp.1.2019.01.16.12.28.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 Jan 2019 12:28:22 -0800 (PST)
Message-ID: <a2d2f4a2b54ec7dac3691dff0cc17c5df33d63e7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 16 Jan 2019 20:28:17 +0000
In-Reply-To: <CAKf6xpvtQL+PXokJKWLHgRchrGdaXi7kMOuBfYTTfELEAzr-ng@mail.gmail.com>
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
	<CAKf6xpvtQL+PXokJKWLHgRchrGdaXi7kMOuBfYTTfELEAzr-ng@mail.gmail.com>
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
X-List-Received-Date: Wed, 16 Jan 2019 20:28:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-01-16 at 15:20 -0500, Jason Andryuk wrote:
> On Wed, Jan 16, 2019 at 9:02 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2019-01-16 at 08:55 -0500, Jason Andryuk wrote:
> > > On Tue, Jan 8, 2019 at 1:26 PM <
> > > richard.purdie@linuxfoundation.org>
> > > wrote:
> > > OpenXT builds 8 or 9 different MACHINEs and images in sequence in
> > > the
> > > same build directory.  Maybe 6 are core2-32 and two are core2-64. 
> > > The
> > > 32bit ones run first.
> > 
> > The hash we don't have is from a core2-32 MACHINE. I'm wondering
> > which configurations you might have parsed for a core2-32 MACHINE
> > between October and December?
> 
> Which "configurations" are you asking about?

I mean the machine configurations. It sounds like it was just the
standard ones from OpenXT which most of your builds would loop through.
I did try and reproduce the hash using those but I could be missing
something.

> The standard OpenXT build loops through building all 8 images and
> packaging them up into an installer iso.  Often I run that build
> script, but sometimes I just build individual machines manually.
>
> I was mainly working on the core2-64 machines immediately prior to
> this event.  I was very surprised when it occured since 1) I didn't
> expect binutils to be re-built and 2) I wasn't working on the
> openxt-installer machine which failed.
> 
> > Was TMPDIR ever cleaned? If not, do you have the python-async
> > WORKDIR
> > for core2-32? The TMPDIR/logs directory may also have useful hints
> > about the configurations built...
> 
> Unfortunately, yes, I cleaned TMPDIR when I hit the build
> error.  Same with the sstate-cache.
> 
> In general, I don't see python-async in TMPDIR after running through
> the OpenXT build.  Would that be because an early machine builds
> python-async, but then it gets cleared out of TMPDIR when a later
> machine/image are built?
>
> > > 
[...]
> All the base OpenXT machines have "-mstackrealign" in their conf.  My
> new 64bit machines do not have it.  I don't recall working with
> core2-32 MACHINES at the time.  The new layer I pulled in only had a
> layer.conf and a 64bit machine.conf.
> 
> In my second container, I `rm -rf cache/ tmp-glibc/ sstate-cache/`.
> Running the build of the first OpenXT machine, bb_codeparse.dat gets
> populated with python-async:
> '3c6fe664c51d2f793f8fd0eb103d68cb': frozenset({'find', 'sed',
> 'install', 'mv', 'bbfatal_log', 'rmdir', '[', 'rm',
> '/home/build/openxt-compartments/build/tmp-glibc/work/core2-32-oe-
> linux/python-async/0.6.2-r0/recipe-sysroot-native/usr/bin/python-
> native/python',
> 'test'})
> 
> python-async is not in tmp-glibc/work and `grep -r tmp-glibc/log`
> doesn't turn up anything.  If I run `bitbake -g`, python-async
> doesn't
> appear in any of the output files.  Is bb_codeparser.data getting
> populated without building the recipe to be expected?

The data is in the codeparser cache which is first populated at parse
time so its enough just to parse the machine+recipe in question, not
build it. I think that explains the answer to a ew of your questions
above.

Sorry for asking so many questions btw, I'd just really love to be able
to reproduce this issue! Thanks for trying to help answer them too!

Is the bitbake-cookerdeamon.log file still there for this build (in the
top level build directory)?

Cheers,

Richard


