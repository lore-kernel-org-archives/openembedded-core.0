Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4216062134
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 04:39:19 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id p5so275011pgn.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 21:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=R4XnR6y01uETetrvFt4NkL2t4phmuBPa5jynwHYE83U=;
	b=mUShpr/J0lhwqF7q6ImyqfQTitP6DsMNYGKXDQp0ZT/f33e6oohXkZB/dDPXt6HDpg
	G2bqMEmgwzf3psEe7nT+3fsJAKusA6qrxiTO/o4c4Jep1AeEC7YUOrV/q5rxJJgN9mbF
	+IW9UlpO81t9w13WkIOYna5ESJFVqC84l+wGWtDwRCdPgTsoOA6eOC2anv7iOJO27bIS
	BwZPCeUks/3iR1YHWJo9HJe4GzaCj6FGLm4VrNl2V6botpyVbnOLwiPZBWuFUhKsvJbB
	xqz4vnTG1uD7MnG+/PnFynZiRsZScHbDb8v7547d62FWz2pIZ6BahBzELjuBEsqz+bpS
	6N0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=R4XnR6y01uETetrvFt4NkL2t4phmuBPa5jynwHYE83U=;
	b=hPsIiTguUr961/qXMooukhZ5x0Fyyp93CoK9nDP7Cx5Am5QOlsNn1ObOp2ujj7CC24
	bSySmyEQAz2c93PuzCFC+Em9Yu9OPqGOmW/mRC90R4bwdKJkaAyHbD6urAJ1Yfr2uaRL
	FFhBYo1Zi09kG8EZOOED6jNfFi9LsWW4iyMM1dG5Gs8Q6ssWMRrBYkRJfGnBK0pDtRCW
	oL2PmFvClaXwhXy/GAwriwhUFgmyzyPZ8d1TnEhdir7uaJkcCCExyWaPLSegUWk5vfhi
	bLQVLYhR9ITBGjoWnQ7xIAgxOAX+tKfiOJJe/75IxHyb/NiMaDI1OZUHJu8zJ1ZH1i2f
	78TQ==
X-Gm-Message-State: AHPjjUgT8DNiRWTRMANc6jBZHlzmZUrdnTbwrxVWptxqluinZTT8Zyy2
	vEN6I9x5MX2sNlzuIJNDnmaVNPqu9zN0rIEfvf4=
X-Google-Smtp-Source: AOwi7QCx15BqeAY/0ZLKMQxmvIHN1Dwg8ntSLVcTu7lIkkRl/awatbq9LjuNATNbHhOPnlbwVOK+r72sTMtID3tdc8Y=
X-Received: by 10.84.138.1 with SMTP id 1mr3032880plo.404.1506573561331; Wed,
	27 Sep 2017 21:39:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Wed, 27 Sep 2017 21:38:50 -0700 (PDT)
In-Reply-To: <20170927221744.GE3112@bill-the-cat>
References: <1506531609-5917-1-git-send-email-trini@konsulko.com>
	<CAMKF1srXi9mNZejjSK2+1irS4neRHbK+BQyka-czvjPLsc8E2Q@mail.gmail.com>
	<20170927215300.GD3112@bill-the-cat>
	<CAMKF1soatZ5fjbaD6fWmXN7nyw+Hz1T0QJDj176_W6Vrx5LoXw@mail.gmail.com>
	<20170927221744.GE3112@bill-the-cat>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Sep 2017 21:38:50 -0700
Message-ID: <CAMKF1soPQfNe9m2bNa2gTTWUja02o74NTBuxwXkBqHkXWVJhLQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: Fix bmaptool support for RSS
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
X-List-Received-Date: Thu, 28 Sep 2017 04:39:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 27, 2017 at 3:17 PM, Tom Rini <trini@konsulko.com> wrote:
> On Wed, Sep 27, 2017 at 10:14:51PM +0000, Khem Raj wrote:
>> On Wed, Sep 27, 2017 at 2:52 PM Tom Rini <trini@konsulko.com> wrote:
>>
>> > On Wed, Sep 27, 2017 at 02:01:43PM -0700, Khem Raj wrote:
>> > > On Wed, Sep 27, 2017 at 10:00 AM, Tom Rini <trini@konsulko.com> wrote:
>> > > > With RSS we need to ensure that when making a bmap image that the
>> > > > python3 that we created is found via /usr/bin/env rather than the host
>> > > > python3.  Otherwise we're relying on the build host to have bmaptool
>> > > > support installed.
>>
>> Who is staging python3 native here may be that's where it could be added
>
> What do you mean?  Adding whatever.bmap to IMAGE_FSTYPES is valid and
> how you get the bmap file for the whatever image type.  bmap-tool-native
> is correctly inherit'ing python3native which is why it's staged
> correctly.  It's just that images aren't adding the EXTRANATIVEPATH
> that's required because nothing is telling them that bmap requires it.

hmm, I see, I wonder if these paths should be added unconditionally.
During image build.

