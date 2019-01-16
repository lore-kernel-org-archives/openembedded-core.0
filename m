Return-Path: <jandryuk@gmail.com>
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by mail.openembedded.org (Postfix) with ESMTP id E36EC7BFAA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 13:55:36 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id k15-v6so5495167ljc.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 05:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KusHbTHxjA9la9Ie1p41I8ZFysIz2mVbMhQek6IyjOM=;
	b=SFXeKquYvBi52X/mCv6kO0RdcQBJcVWm9BgMcLdzW5YsoiieFKGHtxPSNr7vN83av5
	Fc+cjTBw4HFMGXq2OtetuX/loaW0F1Yg6lYo8g8DyqLGQ7dxstQBZFD5ekVdVYUAsm9e
	lf2acc3AktO8gpkyF2l+dX/GgWq+3bDik0vE22t+4I4gaDxcPdSfFrQWuPv/IZUwr6zB
	iubKFwREEQbirC+Pvoq7pl7XPsHx2gjvFJjJC9l2YVEApiNkVDPjmsMIZnHdGpLZpIE/
	e5mzle0LaLCn+Z+pqmLP5onxtAmGq1iMc59kShJQ/lie9I3OR+JdKmignPEnGP1T5JxJ
	4Ipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KusHbTHxjA9la9Ie1p41I8ZFysIz2mVbMhQek6IyjOM=;
	b=jRmp8YX6NRpuqJm8LYFn5ju7/u7dM34hkThMjua9JHgaNpu9qlxN041xxpmIvIJtlk
	gh7H7r6bChkavO7vmKi8fL+5Xvj6KjXJS5OjKUHz6JPzJlfvC9YJKg5A2LAFqf8GjBRU
	2AAzaFYoX4oZJn6OlrEecWcidyOTQ/MvPr72l0Ty1v6RNWksa4QM1NMK5YWWim5/HFFL
	QeFzQkWZlhhVE0Zmp1k72DVDxRBZgkrGQw1kK+h5U5zC4iEnzhwpHGvPTYgos4G6Q6Hx
	P6kmeAYb3EROUgbh474jjXgfcqIAkAaFTdYFfYSiUmorUYWs3O9SWdU42uxCSKPrkHPx
	wjiQ==
X-Gm-Message-State: AJcUukfAY+OxgvEmWrc+2+M1PXvC63PbmsZQyz/f5PUNl1EIboONr3kn
	PzUgrOGOzg0FTH6n7dArjtN7tQfBYEXwsX/VRcE=
X-Google-Smtp-Source: ALg8bN7OFbdqzf1eDFGsCpg6q4JGRt2sIGlYcFpldrSjvERqEIuWUQoAIaJ85KJFBlpo/OgFbMpICK6QLB5vMoE/+Mk=
X-Received: by 2002:a2e:9059:: with SMTP id
	n25-v6mr6812266ljg.155.1547646936970; 
	Wed, 16 Jan 2019 05:55:36 -0800 (PST)
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
In-Reply-To: <26b33c4efb48aaae0bd4662b88bfdfd428b95478.camel@linuxfoundation.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 16 Jan 2019 08:55:24 -0500
Message-ID: <CAKf6xpvj7gLodcqWAXLL7vW_5Cqep_gLpr+5+7_V-e1z29L5BQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 16 Jan 2019 13:55:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 8, 2019 at 1:26 PM <richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2018-12-18 at 12:45 -0500, Jason Andryuk wrote:
> > I can definitively state I have a hash in bb_codeparser.dat with an
> > incorrect shellCacheLine entry and I don't know how it got there.
> >
> > The bad hash is 3df9018676de219bb3e46e88eea09c98.  I've attached a
> > file with the binutils do_install() contents which hash to that
> > value.
> >
> > The bad 3df9018676de219bb3e46e88eea09c98 entry in the
> > bb_codeparser.dat returned
> > DEBUG: execs [
> > DEBUG: execs rm
> > DEBUG: execs install
> > DEBUG: execs test
> > DEBUG: execs sed
> > DEBUG: execs rmdir
> > DEBUG: execs bbfatal_log
> > DEBUG: execs mv
> > DEBUG: execs /home/build/openxt-compartments/build/tmp-
> > glibc/work/core2-32-oe-linux/python-async/0.6.2-r0/recipe-sysroot-
> > native/usr/bin/python-native/python
> > DEBUG: execs find
>
> This is useful data (along with the attachment), thanks.
>
> I agree that this looks likely to have come from a core2-32 tuned
> machine (e.g. genericx86) from python-async do_install.
>
> How old was this build directory? Can you remember any details of the
> update history for it?

I think the build directory was from the beginning of October 30th,
and I guess I hit the collision December 10th or so.

> I'd be very interested to try and reproduce that hash. I locally
> blacklisted your collision from my cache and tried to reproduce this. I
> can generate a matching hash for the binutils do_install but I can't
> produce one matching the above.

I tried around December 18th to generate the collision again.  I set
up a new container with an identical openxt path.  There, python-async
was built, but it did not have the colliding hash.  When core2-64
binutils was built, it had the expected hash.

> Can you remember the history of this build directory and which updates
> it may have had? The python-async recipe is confined to OE-Core so its
> probably the revision history for the oe-core repo which is most
> interesting. Anything in the .git/logs directory for that which would
> help us replay the different versions you might have built?

oe-core is checked out at 819aa151bd634122a46ffdd822064313c67f5ba5
It's a git submodule locked at a fixed revision, and it had not
changed in the build directory.

OpenXT builds 8 or 9 different MACHINEs and images in sequence in the
same build directory.  Maybe 6 are core2-32 and two are core2-64. The
32bit ones run first.

I think the problem first manifest after I added an additional local
layer to BBLAYERS.  At that time, I started building an additional
MACHINE.  Along with the mis-generated run.do_install script, bitbake
was complaining about the binutils base hash mismatch which triggered
the re-build.  The first 64bit MACHINE included TUNE-CCARGS +=
"-mstackrealign" while the second did not.  Could that be a reason why
bitbake complained about the base hash mismatch?

Without reproducing the hash, I'm more puzzled.

Regards,
Jason

