Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id D0F3660115
	for <openembedded-core@openembedded.org>;
	Sun,  8 Mar 2020 08:14:41 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id p2so6429067wrw.7
	for <openembedded-core@openembedded.org>;
	Sun, 08 Mar 2020 00:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=2psA7ZVAFPWA11Jr6neatBQdDWuSFdFXFi9+9kEjQ5o=;
	b=bawVbyyhX2A2TmgHFRVMxt7SZAaCs4oo6t62jgHIiWnHwOuEWFxFfatNOlAqVzH1xi
	X7nRaPJXPXq+qqoumzudYQK1GnG8FxPQx1WhLrySNxcZHfiQfAMmw5OTEkizh98UDQh7
	VY/+ibBO9AzCyQKw61Jb6LAJJkbAermUUMx7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=2psA7ZVAFPWA11Jr6neatBQdDWuSFdFXFi9+9kEjQ5o=;
	b=X+QrLv7Ea0n9/o4StA+I21sunIKjO/G3rJesFurtHArCoW9Ufr3oOxKFD3sIw02hqh
	XUAvv6SK1jKbP8D0xv3mfnrvhwDJqhlPBwL1mqaEZ/t1Ss3/QFKg3u0gKLwAaDSM/LaV
	FhR4Y+Ix+KPRrF+na2+meE0/iOoo+FH+zqR3134Wc1+54K3kHmXeeYFRdXzIwaYAKODg
	FJJd5w1pH5HDdaM6xyCahRm4gk4W8pwx1XuIT6WF+boYP87kHk1bDIrnS4tWzJSvQcyj
	x2q4bpyvNbRHa4yYhHIflIHFIrZGhvo6YJ/ku0sEl70SmoeC6ipX4qkuFVj4BqhI8ALH
	6vuQ==
X-Gm-Message-State: ANhLgQ3Ov2/QiWW2e8xV47auBil8XwwuInnGuAsrgLVa3PV/YD1PkXcW
	ea9PcB683b5oDSkXE/D+m7HLOw==
X-Google-Smtp-Source: ADFU+vvywmqzMwDeEpeM035mRJ1hMgPAEFNxuCApW7xaUqLwdZAp0ETbA02uuwtZ/TnDIXSX2KvpRQ==
X-Received: by 2002:a5d:4bc8:: with SMTP id l8mr13552855wrt.89.1583655282488; 
	Sun, 08 Mar 2020 00:14:42 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o10sm9078906wru.38.2020.03.08.00.14.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Mar 2020 00:14:41 -0800 (PST)
Message-ID: <babd7ffac5376394f222d6ed21544028ee053369.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, openembedded-core
	<openembedded-core@openembedded.org>
Date: Sun, 08 Mar 2020 08:14:40 +0000
In-Reply-To: <df13465da1047d41fb47b19c7479a836b8b71245.camel@linuxfoundation.org>
References: <e7b54a7b237a70346379df8483837a6b97ccc73f.camel@linuxfoundation.org>
	<c88b00fa-a513-c0a0-eb30-62cef90f66bb@gmail.com>
	<df13465da1047d41fb47b19c7479a836b8b71245.camel@linuxfoundation.org>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: M3 build status
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
X-List-Received-Date: Sun, 08 Mar 2020 08:14:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-03-02 at 16:47 +0000, Richard Purdie wrote:
> On Sat, 2020-02-29 at 07:38 -0800, akuster808 wrote:
> 
> > > * coreutils ptest addition (blocked on libmodule-build-per 
> > >   reproducibility issue)
> 
> Still not done.

This is now closer. Alex fixed the libmodule-build-perl and gettext
reproducibility issues (thanks!), I tracked down a glibc issue and
procps one I saw locally. On a fresh autobuilder run we saw:

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200307-mk0v6ljq/packages/diff-html/
and
https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200307-5pvgdd3a/packages/diff-html/

which I believe is the remaining blocking issue on coreutils-ptest.

> > > * psplash systemd race (smurray may have a fix)
> 
> Still not done.

Now done.

> > > * LockedSigs intermittent test failure (RP has open high bug, no
> > > clue 
> > >   how to reproduce or why, total mystery)
> 
> Spent hours on this, limited success :(

Turned out to be a logging issue, hopefully fixed.

> 
> > > * Intermittent selftest failure with SystemExit (High open bug,
> > > Kai owns)
> 
> Still pending.

Still pending. There are also other intermittent Medium+ selftest bugs
we're seeing now the source of major failures has been addressed.

> > > As ever, help with any of these welcome. We'll build M3 when a
> > > majority of the above are ready.
> 
> Also, I've realised:
> * there is a high priority pseudo issue assigned to me

Not done.

> * gcc buildtools tarball issue

Moved forwards. The tarball breaks eSDK testing and my fix didn't work.

There is an open question of whether we want to automate use of this or
not and whether we support Centos7 for the LTS with or without the
tarball.

> + the bind issue you mention

We've established we can't take that.

This puts us closer to the M3 build but probably not quite there yet.

Cheers,

Richard


