Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8EDBF6C4DB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 09:44:26 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b14so13323600wru.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 01:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=1l1Z9IzOzdNA92ukMxQJ6yyWcTjnBr2CiGzK1MnijRg=;
	b=Y+XA1ohlIrYZmi/X+bipAo7i+m0iQUFKdGKfUAYpiJcIh8wpPKetI5cfXpKxu3gYXQ
	DYFpUggZ373BlHzCI0h32YI10yrav4t4X2Wvn4jz5/vwF1Fig9LzuMTGF1HtYTg1nKSL
	JvaMfWvU4kB1wm2e3kKZ0wVjm0asGpeNczA+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=1l1Z9IzOzdNA92ukMxQJ6yyWcTjnBr2CiGzK1MnijRg=;
	b=P0Sv0+wmpSHXrufG9uV+QpipWpqtBMXx5BtUNF+3pwmND8gpjG8BCL8tAjr/w+yuKK
	3GgxQIHn+Ys7T05zr06b2Q1XSxSHWXlkw6f1uBVyFp8TEI25ho2rh7AlNbjvMlvz8HMH
	Xn4P+F+rvHfo4D/iIAEHwi5RovZinICVirA0IMS87qQJot5S8h+Ps4oQYra8OvPP2Go2
	242wo8srMxR/US8QLuTIsjbM/EVFLftIpNDLs2YNegmornWLBbn1lu+Ho4aBbQ4bMjK6
	Liwqg5EOZPA2Ew2dO8HI/DnH1iX7U0oSMSUDuPEtWb6VWRqPsXdzMDvxirswU697tnWb
	esNg==
X-Gm-Message-State: AA+aEWaUBAlqd9mp+aWjl111KISj3C/Thm2cQl1ECqhxhQE/wGVgf01M
	3BLkVH6+joJzzzDNMV5yFAmtxA==
X-Google-Smtp-Source: AFSGD/W2Ug58P9E0E7iVKANtGJe1t8izbusfILDaI/aWEQrDl6HVAQ+I16lJL18UZLvG7Ba+InExxQ==
X-Received: by 2002:a5d:548d:: with SMTP id h13mr12210143wrv.80.1544521467122; 
	Tue, 11 Dec 2018 01:44:27 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r77sm1652868wmd.22.2018.12.11.01.44.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Dec 2018 01:44:26 -0800 (PST)
Message-ID: <0b4127efa7077e49230199b08757d7aa13fb518a.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2018 09:44:25 +0000
In-Reply-To: <117c2412-f698-45a5-d82a-e1ee3210ec44@windriver.com>
References: <cover.1544408339.git.liezhi.yang@windriver.com>
	<bb3ede855b1af3d681a1007ccfff34be43cf6c27.1544408339.git.liezhi.yang@windriver.com>
	<37ad7314e33e17f8d20004e609c32fb03b90dfdc.camel@linuxfoundation.org>
	<117c2412-f698-45a5-d82a-e1ee3210ec44@windriver.com>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/4] base.bbclass: Remove invalid ccache related code
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
X-List-Received-Date: Tue, 11 Dec 2018 09:44:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-12-11 at 17:24 +0800, Robert Yang wrote:
> 
> On 12/10/18 6:29 PM, Richard Purdie wrote:
> > On Sun, 2018-12-09 at 18:24 -0800, Robert Yang wrote:
> > > The code is in setup_hosttools_dir(), it searches ccache in PATH
> > > in
> > > reverse order, I can't figure out what it is used for, maybe it
> > > is
> > > aimed to use host's ccache rather than recipe-sysroot-
> > > native/usr/bin/ccache, but the later one isn't in original PATH,
> > > so
> > > remove the code.
> > > 
> > > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > > ---
> > >   meta/classes/base.bbclass | 2 --
> > >   1 file changed, 2 deletions(-)
> > 
> > We should document it and I think its still needed.
> > 
> > Some distros have a "gcc" which automatically wraps ccache behind
> > the
> > scenes. This code lets us find the real gcc and bypass ccache.
> 
> Ah, thanks for the explanations, I got it now. I think that we don't
> need the
> code any more since we don't use host's ccache, and I have removed
> ccache from
> HOSTTOOLS.
> 
> I will update commit message and send a V2.

No, that isn't correct :(

The problem is that "gcc" can be linked directly to ccache by the host
distro. This means you end up using the host ccache just by calling
"gcc". This code is still needed if we want to control ccache and be
able to disable it and use ccache-native for determinism.

Cheers,

Richard




