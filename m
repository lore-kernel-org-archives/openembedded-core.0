Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8ED4C71BEE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 22:15:43 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a62so4895922wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 14:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=W49wEjCkXV8ECHMlWqRQytDquX1wU64FkEHKR9Zq/2Q=;
	b=ddfF3jH/GTnePvmdHfCvEgEY1hFq82DMM8ufKks7n5ZykhAONUosTF7trdqymEdha1
	zwizt75I0c/G3oVBgn1zpaAyluImNrLMOF9Q9+i2nHMJqycPa9I7Qvln1MvBcYZn7f6P
	LilvzQORBHK3CyhYyxgAGyv+tZRDm/ayrYDFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=W49wEjCkXV8ECHMlWqRQytDquX1wU64FkEHKR9Zq/2Q=;
	b=IRnAuEFO+hqeZmKBsvPMjiR9zA1fuQjuYb22ff79UqB+srmVc/K7g8U2MjPY5x74rw
	n/0gYwkx/2A5i7W5hB64EwaszAVYho9iazokOcE91sADzHHa0jBlEjvGiCsMbkMD1igl
	WasSGXQ5uMASOCP/5fbdLomDc/8nnsO2OWs3YmKuol/nPUXFPR+d+QlZf1OR100coYYL
	feNxRpg9o9v+umPuEpr0KJo8CcFFG0R5LqpIkSTUn4AyQVNu2tDgnwf3/n3P3MplMQ00
	1kceHj2CjASihxGqSdYevEZ9maqakbBa2rdqKdhI9H7XZSU2/8uOWZlrJ0+86yYNKHKo
	jOkA==
X-Gm-Message-State: AHQUAubt4l8divxvwjE+AY1hg4IUPOnBrg134romzH/phLsPMmw+PbTN
	yuCVlaXA3QcEXloIdWP/qSqNKA==
X-Google-Smtp-Source: AHgI3Iasx+Zh3qwMwOSwIHDX14tYDuunm892mKCbK+HYgXAjJhc7NmP4Wvl6X+t69DNtGb4ZwAjXAg==
X-Received: by 2002:a1c:4d6:: with SMTP id 205mr6719983wme.66.1550960144186;
	Sat, 23 Feb 2019 14:15:44 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e23sm4627615wme.15.2019.02.23.14.15.42
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 23 Feb 2019 14:15:43 -0800 (PST)
Message-ID: <56e4574e38391a25e7c25d07e15cda2b8c710111.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Feb 2019 22:15:41 +0000
In-Reply-To: <CAMKF1sqcSUWyem7Yb0TeR0zjmGazNP+k0EriDq8KkK6dS5gt+Q@mail.gmail.com>
References: <cover.1550845989.git.alex.kanavin@gmail.com>
	<bd7acae5310c012ee39c5142fa0059c88fcc4b57.1550845989.git.alex.kanavin@gmail.com>
	<CAMKF1sqHzK6Q8-GNLV6Yc5_QuWjKaUMWO==twypXYmRtmvGpKg@mail.gmail.com>
	<CANNYZj8pxkyaYwp+Ob2ZzH=G2iA=F_E1PzOz-L4-q5LdC-C06g@mail.gmail.com>
	<CAMKF1sr+UW3vBu3p+5-mWK89VU0LYVHo_O5vzopb7131bQLNBw@mail.gmail.com>
	<b333823bfa0d9a3b34a02fa49d23002048fe12e3.camel@linuxfoundation.org>
	<CAMKF1sqcSUWyem7Yb0TeR0zjmGazNP+k0EriDq8KkK6dS5gt+Q@mail.gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/12] virglrenderer: add a recipe
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
X-List-Received-Date: Sat, 23 Feb 2019 22:15:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-02-23 at 11:57 -0800, Khem Raj wrote:
> On Sat, Feb 23, 2019 at 10:07 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Sat, 2019-02-23 at 09:56 -0800, Khem Raj wrote:
> > > On Fri, Feb 22, 2019 at 11:11 AM Alexander Kanavin
> > > <alex.kanavin@gmail.com> wrote:
> > > > Probably this is the very first time virgl is built for mips :-
> > > > )
> > > > 
> > > > Note that it is useful only if you intend to run qemu on that
> > > > platform, so I wonder if we could just blacklist it...
> > > > 
> > > 
> > > I would have thought world build should have caught it on AB for
> > > mips.
> > > Which tells me it could be
> > > musl+mips specific
> > 
> > The AB does not run world builds for everything. It does them for
> > musl+
> > qemux86, musl+qemux86-64, qemux86, qemux86-lsb and no-x11 if I
> > recall
> > correctly.
> 
> Thats right, I meant to say mips/glibc world builds, I think they are
> run regularly and should have caught it if it was mips specific and
> musl builds should have caught it if it was musl specific, so its
> probably a combination musl+mips which causes this

My list above doesn't include mips world, I don't think we test that.
We come close with some of our big images but I don't think we test
world.

Cheers,

Richard


