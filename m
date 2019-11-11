Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id DF1A27CDAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 15:59:48 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id l4so7936802plt.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 07:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:user-agent:mime-version:content-transfer-encoding;
	bh=Huh0FeiFe3Ukw1KRSIU20Ikvb4qldcCCJeaRYoglwtE=;
	b=mKI/VJesaediB8dEMbJzavmPGKq2jFbvJcSlfYeEYWmeqK7n5IzuKyAtICTm6z1tGQ
	X6cKp+Amtfyk9hy6K2Sr8LXgLAoaVwLtxsKoahWnJI2Ut/XiZ15t2PFM2IwMGCDpRklB
	dIJOWv9llTjI+xHxsmbz1llfzWQ1elpbObqAOhGKOEwGQdOcQq/+WC/2/8fGFl1IYw+5
	8LJiQixUeHYz5CSu4Ytan8o1zFnjznXs8t8vDKQxnbPVL4b2sNpez1wgTOyxiccyKtKB
	kzPGCCoZ+MpvapxDoWu6iQolCPkaqa2PEmY7Pb7z7cW9gMuqWu3ozzCghLbAsXXrSHL2
	gbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=Huh0FeiFe3Ukw1KRSIU20Ikvb4qldcCCJeaRYoglwtE=;
	b=jCQFdLce1XQ5gqTGYv6YGo4rAhpnMpXaX+RhV4DulgdaP01+QFJ9ej2h9awlSUDstt
	QkbWhx+C/FPf4Snvi3gCnam5Uk9NQWUkKtXooNtmAiIrPVVBtin4I9l5d9T65+k8etim
	cZU9rF4F0w465WmcuVkte9akPCdE/I8bb0Kwcw+Z5l8zGZQVF9TQd0C3lMyE9U1dk34I
	Nnmj90a4Rl+vV9jQXECk6Tb6w/0h/aQ6wRzYnY8iQTn6UeAGnYYoPEq1MvanFsZiTct7
	voXJ0/2VPWYp/KxqB6xtYEq4lpsbDfXq+uc2rkaH0NE/NRP0SPNSw9XyfWohQPtvzgCh
	LB6g==
X-Gm-Message-State: APjAAAULcaUR0Te/Z859qOu4EQOiw1Ec8AdpvRRo3kXoaeVm4yl7lWTQ
	aUANHm0a2LC2YBtbRTnWJfQ=
X-Google-Smtp-Source: APXvYqwTq12gofKxmDA7ayi/MntKxo6qVRHPccYoRC+jobEXNkp+S3BblIjS/WvhkHHu6pZHm08oow==
X-Received: by 2002:a17:902:7c0e:: with SMTP id
	x14mr26685544pll.277.1573487989608; 
	Mon, 11 Nov 2019 07:59:49 -0800 (PST)
Received: from apollo ([2601:646:8500:1c20::a99e])
	by smtp.gmail.com with ESMTPSA id
	z18sm15221179pgv.90.2019.11.11.07.59.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 11 Nov 2019 07:59:48 -0800 (PST)
Message-ID: <dc84f473235ec05f06914abf4d8793c23ed08640.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>, Seebs <seebs@seebs.net>
Date: Mon, 11 Nov 2019 07:59:43 -0800
In-Reply-To: <CAJ86T=U6Rp5_nkJqHa-9e9sBpiQxn+iiD2khiZ1ZyMqq16c8GQ@mail.gmail.com>
References: <20191109153559.15847-1-richard.purdie@linuxfoundation.org>
	<20191109100710.66530547@seebsdell>
	<5100e289ac8a5c4d0196e8ec77813859bb7a703d.camel@linuxfoundation.org>
	<20191109104619.209d9fcd@seebsdell>
	<CAJ86T=U6Rp5_nkJqHa-9e9sBpiQxn+iiD2khiZ1ZyMqq16c8GQ@mail.gmail.com>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: Drop static linking to sqlite3
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
X-List-Received-Date: Mon, 11 Nov 2019 15:59:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-11-11 at 05:04 -0800, Andre McCurdy wrote:
> On Sat, Nov 9, 2019 at 8:46 AM Seebs <seebs@seebs.net> wrote:
> > On Sat, 09 Nov 2019 16:30:41 +0000
> > Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > 
> > > I did talk briefly to Mark (also cc'd) as he wrote the original
> > > patch
> > > and he thought it was possibly because the client was also
> > > linking
> > > against sqlite3 and due to the other things the client does, that
> > > was
> > > problematic.
> > 
> > It *shouldn't* link against sqlite3. But! The commit in question
> > refers
> > to RHEL5 and LD_LIBRARY_PATH, and I think that shook loose a
> > memory:
> > 
> > I think at one point, we had a Crucial Bug Fix in sqlite3, in our
> > build
> > system, and if we didn't statically link, there was a risk of
> > getting
> > the broken version at runtime.
> > 
> > > The client lib doesn't and the server side should behave just
> > > like any
> > > other linux binary afaik so we should be ok with a dynamicly
> > > linked
> > > sqlite3?
> > 
> > Yes.
> > 
> > The issue here was, I believe, not "dynamically-linked sqlite3 per
> > se",
> > but "dynamic linking, plus LD_LIBRARY_PATH, picking an sqlite3
> > which
> > caused us specific problems".
> > 
> > In the Yocto environment, I think we're reasonably sure that we
> > always
> > get a clean Yocto-built sqlite3, and that *should* be fine.
> > 
> > So I'd say go for it, but if you see weird sqlite3 stuff that
> > happens
> > only very occasionally, look at this first. :P
> 
> With this merged, we can also drop the hack to force the sqlite
> static
> lib to be PIC:
> 
>   
> https://git.openembedded.org/openembedded-core/commit/?id=6a58e12d19c539deac9e90679a68438497a42fa4

That would be good but a caution is that if pseudo is just one usecase
here which brought this issue forward, since we use PIE by default this
would come up elsewhere too


