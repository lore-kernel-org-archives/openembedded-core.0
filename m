Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id C0F806B54F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 16:21:49 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id e74so5164759wmg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 08:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=kF9nyaW4hdufLmDfHnixdtx+lURrong3wSLjicsugg4=;
	b=fJSSDaOeCwq6adsSHmF0+oEKfXNoWXYC9wMYresuNDNk6kJUwlNEpk8ofSLIrBKPNb
	ojfd1dpB/CTxcMDI5b/pseprLPY0IecqKpfzrH8Y9DYJgoNSTAo5viQypwKkdHo4wiz0
	Lh3xce+f4ByOAPXz1wZ3CEDD2l9n+Pj1NFkLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=kF9nyaW4hdufLmDfHnixdtx+lURrong3wSLjicsugg4=;
	b=QMZsxvhscP1JeA+5lqzLXEB6x1B3k2fxkHJmoBALh1COKP2UlmTCt94ZPzalpxFIUE
	LFtb6Y1BX3gMkusfILp+/Ek2qvmObCUK1ovWolrVg+r6LiX/3QidoObpPRJ79iSwotJV
	UpIjaeguNoty+9YY5HjEjg1lCwZ3Q4+H+tsWSf6uhTsOwjc4zUp5KuIMiDhrkRfmJjXy
	FRiKevFCvf5TxRwXlf329jD9sN+esc5sNsQqVF1n4U2vprrWl1lU27oz2thNPlPEUTxL
	gbAl0dqjLPWkPVgqbvkLAZlmDsrZEqsVDbrQ27BCLSD/GhlVSFLRuuTz6j/wFX4GH7yW
	lWmQ==
X-Gm-Message-State: AHQUAubbERC5WjE9ul8WYaWKc2TmlW50t82FXkc9UzEFjmk+Kkm4hPAa
	lojbPez2aI6vhtPaXII8MSSbEQ==
X-Google-Smtp-Source: AHgI3IYh9LG0pEOtwh4YRapgkO+zociSlrvrUvWr6/tig0WBBan7iBYfoi/vurFTNzKODRYwi1XR4A==
X-Received: by 2002:a1c:ce06:: with SMTP id e6mr12114617wmg.41.1551716510478; 
	Mon, 04 Mar 2019 08:21:50 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o30sm9876506wro.57.2019.03.04.08.21.49
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 04 Mar 2019 08:21:49 -0800 (PST)
Message-ID: <c8018d5229f49e70b7ab52394196537c78e7af54.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Rini <trini@konsulko.com>
Date: Mon, 04 Mar 2019 16:21:48 +0000
In-Reply-To: <20190304161443.GQ5026@bill-the-cat>
References: <20190303204731.GK5026@bill-the-cat>
	<CAJdd5GYLLN4OB+wRsFGN10Cs2ybvKNcM_TP5pMHRdycf0M_Lsg@mail.gmail.com>
	<20190303212515.GL5026@bill-the-cat>
	<CAJdd5GbdpUCenci29Pk16vzhFDR=rMb_sd9CWD15pHreFPQfDw@mail.gmail.com>
	<20190304155845.GP5026@bill-the-cat>
	<c35172f8efc2e7d16a7915037f4b0d412d1707c0.camel@linuxfoundation.org>
	<20190304161443.GQ5026@bill-the-cat>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: sstate hash equivalence breaks rm_work
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
X-List-Received-Date: Mon, 04 Mar 2019 16:21:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-03-04 at 11:14 -0500, Tom Rini wrote:
> On Mon, Mar 04, 2019 at 04:06:47PM +0000, Richard Purdie wrote:
> > You mean like the BB_MIN_VERSION variable:
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/sanity.conf#n6
> > 
> > ?
> > 
> > :)
> > 
> > The changes were intended to be backwards compatible hence it
> > wasn't
> > bumped. Clearly something isn't playing as intended...
> 
> Yes, that.  I think we haven't fully used that well historically
> since I can only ever recall *kaboom* when using too old of a bitbake
> rather than a nice sane error message.  Looking at
> https://wiki.yoctoproject.org/wiki/Releases and then some quick git
> history, we also must have had that mechanism available when I last
> ran into something like that even for the fairly ancient jumping
> around I've had to do a time or three.

That variable has been around for a long time. It does get incremented
when we do nasty things which we know break things. If something sneaks
in, its more problematic. We do try and avoid API breakage.

> In fact, can we make BB_MIN_VERSION match the table found there?  It
> doesn't look like we have resources / time to test things on both
> current and min versions, so we should I think have the min match
> what we say should be used.

The problem is more "test what?" on the min version. In this case its
rm_work which triggers it, the bugs tend to be unusual corner cases
which our test matrix, vast as it is might not catch. Case in hand, we
don't test rm_work on the autobuilder.

I'm torn on forcing people to update, I've had a lot of complaints
about being being forced when they didn't need to in the past. Its also
true that we're not as backwards compatible as we could be, i.e. using
a modern bitbake on old metadata isn't always guaranteed either due to
the same kinds of problems :(.

By this line of argument, we'd bump the minor bitbake version for every
bug fix and force people to it, just to "protect" them from themselves
:/

Cheers,

Richard





