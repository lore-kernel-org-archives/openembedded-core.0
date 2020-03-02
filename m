Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 79FAE61961
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2020 21:43:57 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a141so702468wme.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Mar 2020 13:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=42sMhp5gsTA74Ry6kmzxqEuleRZT7y7skS44wLnAWH8=;
	b=bqm2M66kXwoHsro1Dy99tIrWCyGTJkStAnShvJNJJTl5sSwMr7nNxWHXHfnoPK3NfO
	4cFI/MThgp2x65EXe6x4TsFYHpl+8QXeYduxc01S+YMHGcGKXpGjT5ev/aO4kYOqbty9
	hg4RDBLP7AAM07IaPzjVhezF38M9yKGmAlGXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=42sMhp5gsTA74Ry6kmzxqEuleRZT7y7skS44wLnAWH8=;
	b=h1j5Bio4vOjWekHqBgbOOzAVKCcOi90BQ2/ut5aA/vFO+Oy57tvRbJW2cpPSqoNPcf
	VH0OYs+TL/9znKVIuDIrNkeew7hGHmQav7YjjDuc8vfTmpPsM7xKRkP19hBbcwjH7075
	CexyzqH75lloyCCLngj296ZFB6NTf5lGNH4KXw8SNbp5zqASWGUChvF9FIrgD7pLrAFH
	mN/WO3kEmmlQzp2L5TXrK3xY00LW19L+fkFQIN7bbcgdpR3Ggy44QmpZFO3svBBnfpZ6
	SDWHEYEndRxr2cx4m+WsACnU2l2uDKRvCTLLZQ/Low/Rh0CfvlARPCJJGWpYKbiEh79/
	rTJQ==
X-Gm-Message-State: ANhLgQ3aKPouxyorlkl5j+2HwWCWnNAc9T2qqTNDOL5Ts/cvQME7SNSq
	y1q9Z9vJwSsUPZ6HU42VGeeO3A==
X-Google-Smtp-Source: ADFU+vvz5U2dto5VIB/8yQM7Htz7AeXVftHUHYW/RPn/ckvICO5GbkWKooA3T3Mx/7Qr1XITCrruFg==
X-Received: by 2002:a7b:c305:: with SMTP id k5mr387739wmj.189.1583185437767;
	Mon, 02 Mar 2020 13:43:57 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n8sm28824495wrm.46.2020.03.02.13.43.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Mar 2020 13:43:57 -0800 (PST)
Message-ID: <6327a5cd07b661cb2f883256ed18d45a324cd0ba.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 02 Mar 2020 21:43:56 +0000
In-Reply-To: <7ad45b7f-cb58-a584-fdfb-aa9dca2862dd@gmail.com>
References: <20200301014301.805156-1-raj.khem@gmail.com>
	<20200301014301.805156-2-raj.khem@gmail.com>
	<6ebd8c098cac7dab116f9043e7b64fe9b3376601.camel@linuxfoundation.org>
	<CAMKF1spJ_aBK=JdZvr0yFLEHBgYeQcZhUFHBaHDcHt=J05O8=g@mail.gmail.com>
	<7737c4f098af15087a434de3b1a09d8d651ebaa8.camel@linuxfoundation.org>
	<CAMKF1sqVqVDgUac2+G6VX4GmvD7+ecF9HzO731s=OsrWESk+dg@mail.gmail.com>
	<6ac648b5b9d02cb857e9d784d7bf95e071567ca1.camel@linuxfoundation.org>
	<b98ca563ed2c5dd64b276ed6a283de33c8434e35.camel@linuxfoundation.org>
	<c1e072be-0b1b-a2c0-1801-0f1464f028c6@gmail.com>
	<62e5739220e0f491acd489c2abcc35213d91d138.camel@linuxfoundation.org>
	<7ad45b7f-cb58-a584-fdfb-aa9dca2862dd@gmail.com>
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
X-List-Received-Date: Mon, 02 Mar 2020 21:43:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-03-02 at 13:33 -0800, Khem Raj wrote:
> 
> On 3/2/20 1:08 PM, Richard Purdie wrote:
> > On Mon, 2020-03-02 at 10:49 -0800, Khem Raj wrote:
> > > On 3/1/20 9:05 AM, Richard Purdie wrote:
> > > > On Sun, 2020-03-01 at 08:20 +0000, Richard Purdie wrote:
> > > > > On Sun, 2020-03-01 at 00:17 -0800, Khem Raj wrote:
> > > > > I understand the need for the fixes, I'm just very concerned
> > > > > we
> > > > > have
> > > > > what amounts to undetected non-determinism in the build :(
> > > > > 
> > > > > I'm more concerned about fixing that (and ensuring we can
> > > > > detect/fix
> > > > > all cases) than I am about the individual errors.
> > > > 
> > > > I did a bit more thinking/checking on this.
> > > > 
> > > > An interesting command to experiment with is:
> > > > 
> > > > $ touch /tmp/test; ls -la /tmp/test; ./tmp/sysroots-
> > > > components/x86_64/pseudo-native/usr/bin/pseudo sh -c "ls -la
> > > > /tmp/test*; cp /tmp/test /tmp/test2; ls -la /tmp/test*; rm
> > > > /tmp/test*"
> > > > 
> > > > which for me shows:
> > > > 
> > > > -rw-rw-r-- 1 richard richard 0 Mar  1 17:03 /tmp/test
> > > > Warning: PSEUDO_PREFIX unset, defaulting to XXX./tmp/sysroots-
> > > > components/x86_64/pseudo-native/usr.
> > > > -rw-rw-r-- 1 1000 1000 0 Mar  1 17:03 /tmp/test
> > > > -rw-rw-r-- 1 1000 1000 0 Mar  1 17:03 /tmp/test
> > > > -rw-rw-r-- 1    0    0 0 Mar  1 17:03 /tmp/test2
> > > > 
> > > > Can you see if that is different on your two machines?
> > > 
> > > above cmd output is exactly same as yours.
> > > 
> > > -rw-r--r-- 1 build build 0 Mar  2 18:49 /tmp/test
> > > Warning: PSEUDO_PREFIX unset, defaulting to
> > > /mnt/b/yoe/build/./tmp/sysroots-components/x86_64/pseudo-
> > > native/usr.
> > > -rw-r--r-- 1 1000 1000 0 Mar  2 18:49 /tmp/test
> > > -rw-r--r-- 1 1000 1000 0 Mar  2 18:49 /tmp/test
> > > -rw-r--r-- 1    0    0 0 Mar  2 18:49 /tmp/test2
> > 
> > Hmm, this means the test is flawed as we need to find out how
> > /tmp/test2 becomes owned by 1000.1000.
> > 
> > Any ideas how we can simplify this down to reproduce that?
> > 
> 
> Even on baremetal ubuntu 18.04 I am seeing
> 
> dlm-4.0.9: dlm: /usr/lib/libdlmcontrol.so is owned by uid 3004, which is 
> the same as the user running bitbake. This may be due to host contamination
> dlm: /usr/lib/libdlm_lt.so is owned by uid 3004, which is the same as 
> the user running bitbake. This may be due to host contamination
> dlm: /usr/lib/libdlm.so is owned by uid 3004, which is the same as the 
> user running bitbake. This may be due to host contamination 
> [host-user-contaminated]
> dlm-4.0.9: dlm: /usr/lib/libdlmcontrol.so.3 is owned by uid 3004, which 
> is the same as the user running bitbake. This may be due to host 
> contamination
> dlm: /usr/lib/libdlm_lt.so.3 is owned by uid 3004, which is the same as 
> the user running bitbake. This may be due to host contamination
> dlm: /usr/lib/libdlm.so.3 is owned by uid 3004, which is the same as the 
> user running bitbake. This may be due to host contamination 
> [host-user-contaminated]
> 
> this might be again a dlm issue to fix.  but perhaps a good one to
> try  if AB system can build it without these QA diagnostics.
> 
> dlm is in meta-networking.

That could well be a dlm recipe bug. I'm more interested in the ones
which reproducibly break on one machine but work on another.

> > I did wonder if its coreutils-native was somehow creeping into
> > DEPENDS
> > and had a different config between your two hosts which was causing
> > different behaviour but I'd need to check into whether that
> > happens.
> > 
> > Any other ideas why the behaviour difference or how to reproduce
> > it?
> > 
> 
> can you promote host-user-contaminated form QA warning to QA error
> in poky and see if builds fail ?

As its already a warning, we'd see it on the autobuilder. *Any* warning
turns the build orange rather than green. We don't any warnings in core
builds, we fixed them all. This is why I know its not happening on the
autobuilder...

Cheers,

Richard


