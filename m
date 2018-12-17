Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2E28E7A030
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 21:24:56 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id m1so649855wml.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 13:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Lxj7eckI5FAMtVNnAjsTJwT88EmlclnIRao7voNmABY=;
	b=ffZQPKpEqs3ZDFMD5/UodAt0Sjb7SxYucwEPaQWoKMeAP6vwxqDPfMTnIs7KwkrrEJ
	qwdvqepV8zw2GHjrzEnRL884m8na9bav4If5zC3GDOtXKGS8l2G9EpopVNYx9TXHZBzv
	o0VZ1jdLq7vvbASZpCmKGzfEz3BII7o8xnbL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Lxj7eckI5FAMtVNnAjsTJwT88EmlclnIRao7voNmABY=;
	b=p0i7+XQwZvfFCPpZLX7S9UTW84B+RPc5ByQ2S71hOXNelp/5QP3cuHl9jf6lkpz5nd
	iH3eZHk3oFlhWBGWMt3yhfgcKVakCHgDEhFMPQ2Sq0EWT+qWlK3mXiKp+oMXERg3Vw4k
	8kwEGx+qV6jiGaJeVcsXAO37ASesRs6qx0w9n9HXyfAYj9TGqsLMADm8lcb5qMskyI4L
	GCzTVwD9myjqykplo9HbX/p9xZaA7S/JGqc3TWu61euARRfBLdmRVSZrF+fl0FBnTt/Z
	lrHwxkrkFVdetkfCWIcvw4HmXRXutZ2LNlKBlkRoXEi3Xqs1GS6GOJ5Z/LhjNkUpkowa
	UgQQ==
X-Gm-Message-State: AA+aEWYOe1Cxb7wEiji/MBu3hGqGyEmCcQ9gQ9O8WZt/fJrWe+cxC+vz
	+0U38Qf+2UADv4hVtvKxQhFnHg==
X-Google-Smtp-Source: AFSGD/Wxkobbag+o4hNSnybqkEfkslI2oghRzKupIiEsciSay8nmKNgZK5Iy8dHWRtA/EQYEuIOksA==
X-Received: by 2002:a1c:ad43:: with SMTP id w64mr643647wme.32.1545081897647;
	Mon, 17 Dec 2018 13:24:57 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a17sm1710479wrs.58.2018.12.17.13.24.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 17 Dec 2018 13:24:56 -0800 (PST)
Message-ID: <731530484e0135bb200df4da388982b2a7957ea1.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 17 Dec 2018 21:24:52 +0000
In-Reply-To: <CAJ86T=V-xs=M2DfsHHtOe=j77bqsn=MgMojue5mc=2ouwwTd+A@mail.gmail.com>
References: <CAKf6xputiV+k9m9p1dyhZG1d0wMQoWG5tCiZjpsVVu+bXp1X6A@mail.gmail.com>
	<08a89c71b2e3e0f4380325985541c55df00b94da.camel@linuxfoundation.org>
	<CAKf6xptMbAqnZ34ONNXLzQMjFoDjePH8dz3bXmiTMvoBMu4wsg@mail.gmail.com>
	<50b88771577229c99a2c9e26b6224a5f038e7bab.camel@linuxfoundation.org>
	<CAKf6xpt_RoLVg3ou2zKL2g=0GsjDXpCk73q83pmb4Reer9YgdA@mail.gmail.com>
	<a0e331f39da396ea39ea37539f6c1ea193b055b1.camel@linuxfoundation.org>
	<CAJ86T=V-xs=M2DfsHHtOe=j77bqsn=MgMojue5mc=2ouwwTd+A@mail.gmail.com>
User-Agent: Evolution 3.30.2-1 
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
X-List-Received-Date: Mon, 17 Dec 2018 21:24:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-12-17 at 12:21 -0800, Andre McCurdy wrote:
> On Mon, Dec 17, 2018 at 6:44 AM <richard.purdie@linuxfoundation.org>
> wrote:
> > On Sat, 2018-12-15 at 20:19 -0500, Jason Andryuk wrote:
> > > As far as I can tell, pysh is working properly - it's just the
> > > bb_codeparser.dat which is returning the incorrect shellCacheLine
> > > entry.  It seems like I have an md5 collision between a pyro
> > > core2-64
> > > binutils do_install and core2-32 python-async
> > > distutils_do_install in
> > > the shellCacheLine.  python-async's entry got in first, so that's
> > > why
> > > binutils run.do_install doesn't include autotools_do_install -
> > > the
> > > shellCacheLine `execs` entry doesn't include it.  Or somehow the
> > > `bb_codeparser.dat` file was corrupted to have an incorrect
> > > `execs`
> > > for the binutils do_install hash.
> > 
> > That is rather worrying. Looking at the known issues with md5, I
> > can
> > see how this could happen though.
> 
> How do you see this could happen? By random bad luck?
> 
> Despite md5 now being susceptible to targeted attacks, the chances of
> accidentally hitting a collision between two 128bit hashes is as
> unlikely as it's always been.
> 
>   http://big.info/2013/04/md5-hash-collision-probability-using.html
> 
> "It is not that easy to get hash collisions when using MD5 algorithm.
> Even after you have generated 26 trillion hash values, the
> probability of the next generated hash value to be the same as one of
> those 26 trillion previously generated hash values is 1/1trillion (1
> out of 1 trillion)."
> 
> It seems much more likely that there's a bug somewhere in the way the
> hashes are used. Unless we understand that then switching to a longer
> hash might not solve anything.

The md5 collision generators have demonstrated its possible to get
checksums where there is a block of contiguous fixed data and a block
of arbitrary data in ratios of up to about 75% to 25%.

That pattern nearly exactly matches our function templating mechanism
where two functions may be nearly identical except for a name or a
small subset of it.

Two random hashes colliding are less interesting than the chances of
two very similar but subtly different pieces of code getting the same
hash. I don't have a mathematical level proof of it but looking at the
way you can generate collisions, I suspect our data is susceptible and
the fact you can do it at all with such large blocks is concerning.

I would love to have definitive proof. I'd be really interested if
Jason has the "bad" checksum and one of the inputs which matches it as
I'd probably see if we could brute force the other. I've read enough to
lose faith in our current code though.

Also though, there is the human factor. What I don't want to have is
people put off the project deeming it "insecure". I already get raised
eyebrows at the use of md5. Its probably time to switch and be done
with any perception anyway, particularly now questions are being asked,
valid or not as the performance hit, whilst noticeable on a profile is
not earth shattering.

Finally, by all means please do audit the codepaths and see if there is
another explanation. Our hash use is fairly simple but its possible
there is some other logic error and if there is we should fix it.

Cheers,

Richard



