Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7C87E7E279
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 21:44:15 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id i3so112352wml.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 14:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=wRSDR4TuGgIhGdbqGIv0DcmgC8tU7VCYaADkYFEOPj0=;
	b=bok/Z8vQMPVk5UyHmad9FD5pzGxpRJXZ60+1kkc3EYu98JuzzqKZwKAr1NQ0hRb5Ac
	80it6qysuE+UwAtmFdUxzyMZy4dgUBL9Hs1CWr0HaMpHjcpTGsACPgQyrxRX+SzhoX6J
	xdeXYzqaMuSIKEHUxrtFeA9YHiwzgFiREWyKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=wRSDR4TuGgIhGdbqGIv0DcmgC8tU7VCYaADkYFEOPj0=;
	b=WgQC5yZbztZRT/Ja2JSIcaxR7i4IAUcBJ/QxOlWJifV0EiqDW40QzqWSbxzQ0Utoly
	8Buhng1IzfVQMKFXWV8ZVMZIeRsgjWu61UwQIlQg1FH03AuzJ5Oo0144qTOdfSie7WF0
	3AKzL+V8JIkVCXRmvigNY9kDFhPS2bjnTlk70C6jkFM7zxSODWwo40yG6xiOXv6BYMi6
	NudNNGku11qHk/aKndjkhdL6VfAyLI1U1Zat/BaEF+NvW19cewE7RCaqkxAGhNCWo2Gu
	bDKV6PjGZ3rloDnZS4SpYiro6JBasETRj4bcoElmrslKH+N555E4zBitwiIu7fTOZKey
	XQyg==
X-Gm-Message-State: APjAAAWNWYABTZBtFcnrZx4tZ0Gi6uHfsd6YKKa8lRzc1egcZNLoPSDZ
	xPyFjmhpOj8RrOZX594DL1Px0w==
X-Google-Smtp-Source: APXvYqwmVPhsjRF9pwv5Pbfh8cA7GJ4/YEhhYkKcIxRVVeesJmGMkJ1IJP4ygxdStcotNGP3MuCbBQ==
X-Received: by 2002:a1c:63d5:: with SMTP id x204mr5015013wmb.3.1558475056066; 
	Tue, 21 May 2019 14:44:16 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o6sm47233243wrh.55.2019.05.21.14.44.14
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 21 May 2019 14:44:15 -0700 (PDT)
Message-ID: <1cee8ee543463712e25b4ea4450fb40242a9e84e.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>
Date: Tue, 21 May 2019 22:44:13 +0100
In-Reply-To: <CALbNGRRcmwVcVD3ytdb32RkmgyFTLJ3dsKiC+iLDK36s1DBwGw@mail.gmail.com>
References: <20190521090032.14859-1-schnitzeltony@gmail.com>
	<20190521090032.14859-2-schnitzeltony@gmail.com>
	<03af571c3019042cff91f2703b15edb139661144.camel@linuxfoundation.org>
	<CALbNGRQjahbkMzBmqFG4QQE4moF-qTFJrDDMzBVUnXBCTwGFMA@mail.gmail.com>
	<b182fad0b95201771a7c01ab2d71aaba73810399.camel@linuxfoundation.org>
	<CALbNGRRcmwVcVD3ytdb32RkmgyFTLJ3dsKiC+iLDK36s1DBwGw@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] python-six: put python2/3 variant together
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
X-List-Received-Date: Tue, 21 May 2019 21:44:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2019-05-21 at 22:59 +0200, Andreas Müller wrote:
> On Tue, May 21, 2019 at 8:38 PM <richard.purdie@linuxfoundation.org>
> wrote:
> > > No sorry mozjs uses old crap in their configurations scripts
> > > nobody
> > > else does (python which) and ask for python2 explicitly.
> > 
> > I've been giving this a bit more thought and its our intent to try
> > and
> > remove python2 from OE-Core entirely so adding py2 modules back
> > seems
> > like a backwards step.
> > 
> > I think this will therefore need to go to one of the other layers,
> > painful as that might be from an include perspective.
> Yeah a new burden out of thin air is born. You know what I do: Create
> my own layers and am happy as I am with my other layers.
> 
> Bye

Its not "out of thin air". It was discussed over two years ago when we
started a plan of trying to remove python2 dependencies:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=1fc2c9315faf65ea05fecf81450dd40b9a330435

This was in line with what upstream python recommended. Upstream python
has made a clear statement on this too:

https://python3statement.org/

For a release that will ship 3 months before that deadline, it seems
unreasonable to add this back to oe-core, no?

Cheers,

Richard






