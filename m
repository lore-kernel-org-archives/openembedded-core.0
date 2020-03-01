Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 258F3610DE
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2020 17:05:33 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id i10so12171501wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Mar 2020 09:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=xaS+Vhn8A73smfv4XKAX2cR5OSPx6E15Ut4Xu73rIJo=;
	b=U1MCZLHmlvb1z8ysSDBAruhM7z5SDID53wsFN41NHuhwSffQ/Y3lJLDk8TxzVTqFFV
	DRbzmrcHK73hvTUVJUycg5CMUurSXD1xFhupYVTGffVNXr9qwUWHEbbG6f4bvTHhc2hc
	g9ah1QrY7xcqHspSP8/sC0jlTlBbBD/xeIWYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=xaS+Vhn8A73smfv4XKAX2cR5OSPx6E15Ut4Xu73rIJo=;
	b=IkOnpSSHAXpOiwgzFIgzR53seg2C4bW0l+ptSb6pRNpqMptuME0Ycvz6fQ5CjehmOp
	+FqfTvTfAT9r7uhuHTfB5N7ItoWv/cGEnytGOyJ/lKTiVOIzDLwDoC/hY62W7gTPTf0Q
	068qqYoJPWlPjDjazvX6o+HugFfN0pox2u9uL+q4LPKTK1Kn6uE/LtsRFqDcFryEzEGr
	F7fjSyJw2zp5nqB2QaipOsKt6UaE/P9raytFfL8HCHVIdy4JncVgAdWRI8LqbPGXPmOK
	J+d1oJVuu+VOOTFw23npPhO3HtPlr5BVY0gXm+Y5CtRNJ/heDd29qvf7l5nIBAncPRRG
	eZmA==
X-Gm-Message-State: APjAAAVdF+PbXZUKTGiUVdlxkyJbFMQu9naKuCwB6g8KUIbc1tFaV14/
	5ID7knkTdxcRZJLRBz+JIuOqRg==
X-Google-Smtp-Source: APXvYqxcpBpjKd8IuUQv1siscrUSbPlwkQOS/3tqewraCUDw3burnIg3M8ek1e1smQYJl05hEX0tDQ==
X-Received: by 2002:a05:600c:228f:: with SMTP id
	15mr15922165wmf.56.1583082334442; 
	Sun, 01 Mar 2020 09:05:34 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l3sm21978261wrq.62.2020.03.01.09.05.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Mar 2020 09:05:33 -0800 (PST)
Message-ID: <b98ca563ed2c5dd64b276ed6a283de33c8434e35.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 01 Mar 2020 17:05:27 +0000
In-Reply-To: <6ac648b5b9d02cb857e9d784d7bf95e071567ca1.camel@linuxfoundation.org>
References: <20200301014301.805156-1-raj.khem@gmail.com>
	<20200301014301.805156-2-raj.khem@gmail.com>
	<6ebd8c098cac7dab116f9043e7b64fe9b3376601.camel@linuxfoundation.org>
	<CAMKF1spJ_aBK=JdZvr0yFLEHBgYeQcZhUFHBaHDcHt=J05O8=g@mail.gmail.com>
	<7737c4f098af15087a434de3b1a09d8d651ebaa8.camel@linuxfoundation.org>
	<CAMKF1sqVqVDgUac2+G6VX4GmvD7+ecF9HzO731s=OsrWESk+dg@mail.gmail.com>
	<6ac648b5b9d02cb857e9d784d7bf95e071567ca1.camel@linuxfoundation.org>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] dbus-test: Fix QA host-contamination errors
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
X-List-Received-Date: Sun, 01 Mar 2020 17:05:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2020-03-01 at 08:20 +0000, Richard Purdie wrote:
> On Sun, 2020-03-01 at 00:17 -0800, Khem Raj wrote:
> > 
> > On Sun, Mar 1, 2020 at 12:14 AM Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > > On Sun, 2020-03-01 at 00:12 -0800, Khem Raj wrote:
> > > > 
> > > > On Sat, Feb 29, 2020 at 11:57 PM Richard Purdie <
> > > > Why aren't we seeing this everywhere? The autobuilders don't
> > > show
> > > > > it
> > > > > and no other reports. What is unique to your setup to
> > > > > reproduce
> > > > > this?
> > > > 
> > > > These are QA warnings by default and in my distro I turned it
> > > into
> > > > error so they were being reported before too 
> > > 
> > > The autobuilder would show any warnings or errors and we're not
> > > seeing
> > > either.
> > > 
> > > > Secondly this is a Debian10 minimum container running in docker
> > > where
> > > > the user id is 1000 for the build user other than that there is
> > > > nothing special 
> > > 
> > > We run debian10 builders on the autobuilder.
> > > 
> > > I just don't understand why weren't not seeing this everywhere.
> > > We
> > > really need to understand why this is :/.
> > 
> > From what you see from fixes what it’s reporting are legit errors 
> > Why it’s not showing up everywhere I am not sure
> > I don’t see it on Ubuntu 18.04 boxes without docker as well 
> 
> I understand the need for the fixes, I'm just very concerned we have
> what amounts to undetected non-determinism in the build :(
> 
> I'm more concerned about fixing that (and ensuring we can detect/fix
> all cases) than I am about the individual errors.

I did a bit more thinking/checking on this.

An interesting command to experiment with is:

$ touch /tmp/test; ls -la /tmp/test; ./tmp/sysroots-components/x86_64/pseudo-native/usr/bin/pseudo sh -c "ls -la /tmp/test*; cp /tmp/test /tmp/test2; ls -la /tmp/test*; rm /tmp/test*"

which for me shows:

-rw-rw-r-- 1 richard richard 0 Mar  1 17:03 /tmp/test
Warning: PSEUDO_PREFIX unset, defaulting to XXX./tmp/sysroots-components/x86_64/pseudo-native/usr.
-rw-rw-r-- 1 1000 1000 0 Mar  1 17:03 /tmp/test
-rw-rw-r-- 1 1000 1000 0 Mar  1 17:03 /tmp/test
-rw-rw-r-- 1    0    0 0 Mar  1 17:03 /tmp/test2

Can you see if that is different on your two machines?

If so, lets have a look at the output of:

touch /tmp/test; ls -la /tmp/test; PSEUDO_DEBUG=nfoPdeViDxy ./tmp/sysroots-components/x86_64/pseudo-native/usr/bin/pseudo sh -c "ls -la /tmp/test*; cp /tmp/test /tmp/test2; ls -la /tmp/test*; rm /tmp/test*"

which turns on pseudo's debug output and see if that sheds some light
on why this is behaving differently, perhaps because its under docker?

Cheers,

Richard



