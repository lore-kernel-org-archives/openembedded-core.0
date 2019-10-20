Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id BA7FD7D718
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2019 09:50:48 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id o18so10540372wrv.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2019 02:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=qeq5sRiGcXCqKN5ebnmuc9PQAeKMEXLyJCAh42B9QAs=;
	b=X2u+NbOsMjImmfA8erg+wNZHSqGBEFfwVJqy0ggCBfoOKx6cU5Juj7vi+XejumXe2i
	JNSwXxHrhZiECFvR+uYifkBF811Jx2ne/C9WbJvQRPw5gXS4XQZur8BQAp9w4Sc3n8ns
	XpvB9qoJjhClfKtIlBEpgou0RY4i5wagjAZhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=qeq5sRiGcXCqKN5ebnmuc9PQAeKMEXLyJCAh42B9QAs=;
	b=NGir9U1E7/v37MHtm116gSBpc+ZxAHj7f7zTIEwhuPbIr+GakRWe+IxU0zaAVfqrMZ
	ZLZXj1TUl+wYydgqnwWn3+yE/OIfkGltKBnwmQiVM3aWo1L7UgH0e6RXjwksDdO0zGsw
	SQWmyCBtu69BoNmuOd83t5jmftpkOCA6iGLb8y+UU37fHjgObjJMPdUUd3/X9WZ7W8pQ
	L0zqR7+Vs9Xz3W90D1rL7o1HW9W4B/OgZkAAGn/mnZiv1Zb9UCTJOeRLg5LHWd1wCzjD
	K9YABokf/sCk2p8EzqA5Pjp/39c35Dy1eAoizhD5drKLoI0xPHiv69L3+hOY8DqoTw77
	euUQ==
X-Gm-Message-State: APjAAAXuhFq//qr5tkEvZBrxS9DrGqOYJp4ilkCYXe45kbGmSny2rK/w
	DoT93UXkY4+3Koig5BaIrMGYrw==
X-Google-Smtp-Source: APXvYqxnogBXMQbSSGoQbTTNTbS2lLtjjGCBPBmhgsd/16GSLXes1d5v6tyBd4lUXrseIeN2fu7E7Q==
X-Received: by 2002:adf:b6a6:: with SMTP id j38mr14578972wre.275.1571565049291;
	Sun, 20 Oct 2019 02:50:49 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id r9sm6076075wrx.28.2019.10.20.02.50.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 20 Oct 2019 02:50:48 -0700 (PDT)
Message-ID: <bd068d4b7a6dcf510dbd8bbeea5ef190678465fd.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Oct 2019 10:50:46 +0100
In-Reply-To: <CAMKF1sr8xy+bW_UL_=B-nt7MG58bJj=WmB9VVZf5hxBqpXwPiQ@mail.gmail.com>
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
	<20191011114754.91740-16-alex.kanavin@gmail.com>
	<dbf128cd95ea3d8017274ea57dda52a72ad727cb.camel@gmail.com>
	<CAMKF1srnabEcWqWYa80uoCe1H=iw-wDPNut4hu4eRwuSQ1HaoQ@mail.gmail.com>
	<CANNYZj8J-wr1V1+aNfbRGyQ+Lk+sofRX4rT1xudaCm67gVev3Q@mail.gmail.com>
	<da2fa30bb8fed7f991ef14a4955a67ec15bc94a6.camel@linuxfoundation.org>
	<CAMKF1sr8xy+bW_UL_=B-nt7MG58bJj=WmB9VVZf5hxBqpXwPiQ@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/19] meson: update to 0.52.0
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
X-List-Received-Date: Sun, 20 Oct 2019 09:50:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2019-10-20 at 06:51 +0530, Khem Raj wrote:
> 
> 
> On Sat, Oct 19, 2019 at 2:56 AM <richard.purdie@linuxfoundation.org>
> wrote:
> > On Fri, 2019-10-18 at 20:49 +0200, Alexander Kanavin wrote:
> > > I certainly don't mean to ignore those reports, it's just that
> > due to
> > > my ongoing health problems, and having to dedicate most of my
> > energy
> > > to the day job (https://mbition.io/en/home/), I am not currently
> > able
> > > to work on the upstream issues in a timely manner the way I used
> > to
> > > when maintaining core was actually my day job (at Intel).
> > > 
> > > The question of how much effort people who update things in core
> > > should allocate to fixing 'other' layers has been a conflict
> > point
> > > for a long time. I'd prefer to see more aggressive
> > > blacklisting/removal of recipes that no one has an interest in
> > fixing
> > > and updating.
> > 
> > If anything this would be my fault for merging things despite there
> > being concerns raised. I have to admit I'd seen other patches and
> > therefore erroneously thought the issues we mostly resolved.
> > 
> > Should OE-Core block on all issues being resolved before merging?
> > I'm torn on that, I realise there are pros and cons.
> 
> If an issue is there and gets reported after it’s merged I think it’s
> fine to do whatever is needed after the fact however if testing
> master-next from oe-core and reported against it I think this will
> help you in longer run if these master-next issues are looked into
> and blocked on. We should not run Oe-core so fast that other layers
> fall way back behind where they start supporting just releases and
> you have lost free integration testing that other layers would offer
> 
> If there are too many reports then it would be questionable to block
> on it but I don’t think that’s the case 

As I said, I understand the desire and from some perspectives it makes
a lot of sense. From a human resource perspective I have concerns.
Following this through:

This means we should make meta-oe testing a default part of full
builds, maybe even quick?

We're then effectively highlighting any issues and blocking patches on
testing with meta-oe. We should then really update the maintainer
guidelines to highlight they should be testing with meta-oe as well?
world builds of it?

Should we include other layers too? We're actually at the point where 
project members want their layers tested so they get to know ASAP about
failures.

We (as in the TSC) did discuss this and basically said that a heads up
warning of problems was what we could realistically achieve, not
blocking. meta-oe is special in some ways, is it that special?

I suspect a more realistic take away is we figure out what set of tests
are missing for oe-core and add them, such that changes don't break
layers. In this case we're clearly missing some meson usecase tests?

Cheers,

Richard



