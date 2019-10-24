Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5E8E67F9B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 15:59:36 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n15so15906084wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 08:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ETolZLgDiRpos9RdKFkYnZhX2ukKGE2IHDJ9bqoci2g=;
	b=GZPF+KnJJ+z5E7296ahOi9CgriMQu5C9+9fdl70YdQpFm6CuIeTd3PtNq59R8DVfmD
	L1vuo9lkzIFG/9PgEFMDHPErBRaS428Si2rMoxwaWqrvApZaJJ0uW+u9eFU0DIBjiGIT
	1L3HZhxeunqQTO2mavEZMNjI+VRU1y73tJcx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ETolZLgDiRpos9RdKFkYnZhX2ukKGE2IHDJ9bqoci2g=;
	b=Tm+LyVpWUoDbSk6jHcjyf5QKzfwDXfc5VYSpcd0Zp7mY/aY/9pyM564Tqz4vW8/E9W
	E/v91DSUj3i5CP2PNAYkAXQ6oEwMXxwStL4m/TLbA/d4odNG6JuD7WBwuBY5zifET8cy
	Sf7wE0NBbn2hN4EhsWhGOz+7+wGId1h3dUgLnJ5edGsfgcewr4KIALm1IUyQ0Lo/YvNf
	xxEYF485/nBG+ckNqVs7fXE3NUoDF7019MxzSRTopShXLtQyz2Efvi7JG7FOXy8KT6/z
	8WOmmcNOUPV3OUly0DSzU0lj+72eOxtb5T90idiuIKGnkaHNE0dPR9iV7tE8qbZeNwkH
	lb8Q==
X-Gm-Message-State: APjAAAVyRwYj6eh1CVy+HqfLYqOCeO0ZFFkwq9oRsEbTCA6jw9A7N4vZ
	uvdOWVW4fqkLo1WllG8/d3gvdA==
X-Google-Smtp-Source: APXvYqzFdzZVmz4Wz45XG9k/W7fBPaj1AF3TmmFP2CQ0c/9x7suHE4Mi9vcNpagaTVuo/gA2Yz8EIA==
X-Received: by 2002:adf:dc09:: with SMTP id t9mr4196947wri.215.1571932777005; 
	Thu, 24 Oct 2019 08:59:37 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id r1sm819261wmh.37.2019.10.24.08.59.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 08:59:36 -0700 (PDT)
Message-ID: <b15dc7e214c76e710446b6dd634f669658d5a577.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 24 Oct 2019 16:59:35 +0100
In-Reply-To: <20191024153740.GB9707@localhost>
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<8e660284b1ece9e66eb47747213e8faafdd99655.camel@linuxfoundation.org>
	<5290bb1a-4cc8-4ed9-8f33-3c8994f06f22@herbrechtsmeier.net>
	<CANNYZj99FATCkw+6V088NkTWm3DEUAcoZaP+XBUR0xZnGeeQdw@mail.gmail.com>
	<20191024153740.GB9707@localhost>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: brendan.le.foll@intel.com, "Paul Eggleton
	\(paul.eggleton@linux.intel.com\)" <paul.eggleton@linux.intel.com>,
	rennes@savoirfairelinux.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 0/6] NPM refactoring
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
X-List-Received-Date: Thu, 24 Oct 2019 15:59:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-10-24 at 18:37 +0300, Adrian Bunk wrote:
> On Thu, Oct 24, 2019 at 02:12:43PM +0200, Alexander Kanavin wrote:
> > On Thu, 24 Oct 2019 at 14:02, Stefan Herbrechtsmeier <
> > stefan@herbrechtsmeier.net> wrote:
> > 
> > > @Richard: What is your opinion about the per recipe dependency?
> > > Typically OE use one recipe per project. The NPM based solution
> > > handle a
> > > project and all dependencies via one recipe.
> > 
> > I don't think it's at all realistic to stick to the 'one recipe per
> > component' in node.js world. A typical 'npm install' can pull down
> > hundreds, or over a thousand dependencies, it's not feasible to
> > have a
> > recipe for each.
> 
> Debian has for the perl/python/node/go/rust/haskell ecosystems
> one recipe per component, with ~ 1k recipes each.

I think we'll have to end up having a smaller number of recipes which
generate multiple packages. That gives a reasonable parsing time at the
expense of having to pre-generate some of the recipe, a bit like the
core perl and python recipes work today. The exact split will depend on
the ecosystems and the "blocks" people tend to build in as its a
compromise between building too much and parsing time.

Cheers,

Richard


