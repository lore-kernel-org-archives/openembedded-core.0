Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7CB8E7326D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 12:53:38 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id d65so16072132ith.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Aug 2016 05:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=zlLHlwcBXpjhSOYJtdGSGmKHIqANkuZzO5g7/R6rUPY=;
	b=O2JSdsOEhV9wc6H4NuBu4pp+z/gPs90oS2PzA3KGU3tkeuMAxtLzU+dTrxSorF7Uff
	Z5mICeMasvN47hnZCWBQmOKNZSWklGxSyVefAChN2e2g0Qj/pXH/CUC6RRTNPK1oUE2T
	QZDiWZpFJ3d4PIuUFLzVmAnxIqRM8d1jSXGg3M6Kni0C+CJFL1q7Fgmxa2n/+pS0EeaC
	L4eXMs4O42j87nnDYtyDiIrkdXe6pE2cwi7Q8CgT98TD85fFU9KaO+0ri9Q630s/eVb3
	dNKmL3v/BqlIoad/jZZ14ei9HsQVIFKe9xEf+LyJuj66qTIycfWusnJFFnC0a+DvseYh
	ykIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=zlLHlwcBXpjhSOYJtdGSGmKHIqANkuZzO5g7/R6rUPY=;
	b=ZvTip4k+sjrYHBpggR8iSe5Plo+HherAHM9Nh74JfuUZJu5J+bip0w1kA3lhG3NE8y
	9kZPDq9Jp18Bh6zS/x/70y8klDTDzQrAUdwYooHfSwKwOVOgQUnBk0JfxVlstw+jbuhg
	wnhtsz4siaJZjyDKO0ipGizpxTgSqBKRcLPy9CjKhArrlEpbjs0cvbfDt+M+gNElQ5K+
	Dh8W20xsj+Z0uKcWA78lgkBX73B+fgD37Bxn7JvUymqJQwYyg8c08H4jZ4QNBhLloHAa
	1vdCEPQHcQtK2fQPLGYdTHDWDGbLwYrzrfjqYSC25Z9b1Wa+uloycLD+skDcz2J+bSI9
	FEhQ==
X-Gm-Message-State: AEkoousNIJ+3A+MC4KQ6B8F4EXilnTfqG3Bsr0n9HAtmsK5bABdtbYMJgNZSd4ZntyHZcw==
X-Received: by 10.36.217.68 with SMTP id p65mr25079420itg.9.1470228819061;
	Wed, 03 Aug 2016 05:53:39 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	140sm12243732itl.4.2016.08.03.05.53.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Aug 2016 05:53:38 -0700 (PDT)
Date: Wed, 3 Aug 2016 08:53:36 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160803125336.GA24499@openSUSE-i7.site>
References: <20160801123253.9292-1-twoerner@gmail.com>
	<CADkTA4Pa0pjQ8HQwAFq6jZUW5TXjfYd=pkdaOoDgU5S7x2hhsQ@mail.gmail.com>
	<CAJTo0LaXhsr4xJwR05DP2F+mNjJOwGQ+xfGb=d2cTgn2DaTiKw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaXhsr4xJwR05DP2F+mNjJOwGQ+xfGb=d2cTgn2DaTiKw@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: add lzop dependency
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
X-List-Received-Date: Wed, 03 Aug 2016 12:53:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon 2016-08-01 @ 03:08:36 PM, Burton, Ross wrote:
> On 1 August 2016 at 15:07, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> 
> > Not a large dependency, but it does bring to mind the question if this
> > could be conditional on the type of image being built ? via  distro
> > feature, some other mechanism ?
> >
> 
> Exactly this: image building adds dependencies automatically based on what
> is actually being used, so can the kernel do this too?

The way the build knows which image was built is to build the kernel then look
in the output directory to see what extension was given to the artifact. iow,
it only discovers the dependency partway through the build; it doesn't know
the dependency when the build starts.

Either bitbake will have to put together the kernel's config at the start of
the build, then parse through it to try to determine which kernel will be
built, or we need some sort of mechanism that allows us to add dependencies
partway through a build, or we can add (yet another) build variable and hope
people are able to keep it in sync.

...or we could just add lzop-native as a static dependency in the off-chance that
it's needed.

