Return-Path: <jandryuk@gmail.com>
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46])
	by mail.openembedded.org (Postfix) with ESMTP id 550C47BE66
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Dec 2018 01:19:33 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id p6so6972330lfc.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2018 17:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=prTUaphTcQbdo56dZxmNv7sG4i/kc4Cp2lVTrNEJenA=;
	b=luNHIq1ldTgSXWTGdFTzu1+RNisWkV+NMFMA3qNxKrfh7lZW+3BrMlfnd9RxHyNk9H
	ve0c+aOqs/y4ctkqLIbaJQqjjsIDqNJObJpYsVGWzKyHCbFgx8DDcOhOHyI5mFNG0QXp
	j81TbKOpmaLCX0tf4GiwUe6bLyodniYHVDgGevy7duwUOVY32BrR5Z9TKueXZDpVE7nc
	yqpAoRsRrMElwpoX6wO6DHVspkjxAeH5AnN1IuYON4TSzgoTgiD0+evlPb3idB7cMPe5
	1nUotGuotyLOpMe0gtYJ0Op7zoyN7/7GmTpjfzPQ2zmAzhAWd0e51va6NYMdLrkSCSLb
	KoXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=prTUaphTcQbdo56dZxmNv7sG4i/kc4Cp2lVTrNEJenA=;
	b=DdR3R3mQ6kWfndOSl5dsWG0z0KSKB51B744+ovhGf0D4HFb22L/Zn9Pja7Q27rDoVg
	b5p13ZwMEZaZBTkUTO6UkNJ8heImrHTqch5ntKl8k3gq8ERpCv3/8SkHBSaPOzSp1Nsi
	CQKSO0ZURR42HuKOaXaq2wW+RL3jsXnSn+E9nJ+qkWUH5ZykCtu+DSI7+KEdcHN3ZKTY
	cdrVRHsqX17H9YO9J0XLxnHhgoX8PTfJfiGCBHClQ/0nNRxFp6/omZswi6hZA89FVWeH
	j+TIokunfC3CU05aiI558BHxuCcDfSKJ3ZrPjmJuD7VWZA2u5jH6qYEa13Ba4chqp3mN
	rPMg==
X-Gm-Message-State: AA+aEWb1RNfGlj32HNCvgVZbVmBcJKPevHl/d/BO8r9NN32pWq0cHYeD
	zAUhIAkQh8mYz79Rxl6IRD88IRVEGXpwAY9RnYU=
X-Google-Smtp-Source: AFSGD/UnOBPNSX8CCem6GFG0sMGtqf20DFPmq07RDkmosMt+p8lYosogAOVu7Cy6HRzDZTXX03HcV7uiqx/HrDHfQcE=
X-Received: by 2002:a19:9781:: with SMTP id z123mr4960902lfd.80.1544923173552; 
	Sat, 15 Dec 2018 17:19:33 -0800 (PST)
MIME-Version: 1.0
References: <CAKf6xputiV+k9m9p1dyhZG1d0wMQoWG5tCiZjpsVVu+bXp1X6A@mail.gmail.com>
	<08a89c71b2e3e0f4380325985541c55df00b94da.camel@linuxfoundation.org>
	<CAKf6xptMbAqnZ34ONNXLzQMjFoDjePH8dz3bXmiTMvoBMu4wsg@mail.gmail.com>
	<50b88771577229c99a2c9e26b6224a5f038e7bab.camel@linuxfoundation.org>
In-Reply-To: <50b88771577229c99a2c9e26b6224a5f038e7bab.camel@linuxfoundation.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sat, 15 Dec 2018 20:19:21 -0500
Message-ID: <CAKf6xpt_RoLVg3ou2zKL2g=0GsjDXpCk73q83pmb4Reer9YgdA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Sun, 16 Dec 2018 01:19:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 15, 2018, 5:51 AM <richard.purdie@linuxfoundation.org wrote:
>
> On Fri, 2018-12-14 at 14:30 -0500, Jason Andryuk wrote:
> > I wasn't sure how to tie into the pysh stuff, but that got me poking
> > around in bitbake/lib/bb/codeparser.py .  Adding debug messages to
> > parse_shell(), I see that do_install is found in the CodeParserCache,
> > bb_codeparser.dat, but the returned `execs` do not include
> > autotools_do_install.  Strangely, it includes a path to python -
> > ...core2-32-oe-linux/python-async/0.6.2-r0/recipe-sysroot-
> > native/usr/bin/python-native/python.
> > It looks like `execs` could be for `distutils_do_install`.  And
> > again,
> > strangely, python-async is not in my tmp-glibc.  It must have been
> > built at some point which left the entry in bb_codeparser.dat.
> >
> > I built python-async, but its distutils_do_install hash value does
> > not
> > match the one in the cache.
> >
> > Moving cache/bb_codeparser.dat out of the way, bitbake complains:
> > ERROR: When reparsing
> > /home/build/openxt/build/repos/openembedded-core/meta/recipes-
> > devtools/binutils/binutils_2.28.bb.do_install,
> > the basehash value changed from 80812e0772cf901b51790c205564070d to
> > 493152cd3740c5420d0bf7a5d09df001. The metadata is not deterministic
> > and this needs to be fixed.
> >
> > `cleanall` does not clear out the message, but the package builds.
>
> Its a little hard to make sense of this. If you move the cache out the
> way it should simply get regenerated. It is long lived so things from
> old builds in there is expected.
>
> Were you able to isolate this into a smaller test case someone else
> could reproduce?

As far as I can tell, pysh is working properly - it's just the
bb_codeparser.dat which is returning the incorrect shellCacheLine
entry.  It seems like I have an md5 collision between a pyro core2-64
binutils do_install and core2-32 python-async distutils_do_install in
the shellCacheLine.  python-async's entry got in first, so that's why
binutils run.do_install doesn't include autotools_do_install - the
shellCacheLine `execs` entry doesn't include it.  Or somehow the
`bb_codeparser.dat` file was corrupted to have an incorrect `execs`
for the binutils do_install hash.

I briefly tried to reproduce the python-async distutils_do_install
with the same hash, but could not get it to match.  Also I tried to
manually unpickle bb_codeparser.dat, but it threw a stack underflow
error - maybe I just didn't have all the necessary imports?

I'm not sure where the basehash/"metadata is not deterministic"
message comes from.  I am using two different x86-64 machines types
that both fall back to the core2-64 binutils.  Could that be an issue?

Regards,
Jason

