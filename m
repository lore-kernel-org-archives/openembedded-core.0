Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f179.google.com (mail-ve0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id E77486BA88
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 18:52:00 +0000 (UTC)
Received: by mail-ve0-f179.google.com with SMTP id c13so4290264vea.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2013 11:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=osPlQiECR6U1H0j4UHzZVNgBh3mEe8tBDJSveNeKuhc=;
	b=hIsotFe3u/RHVzgsD9jPkWCqTbmzsH/ygYP/D0AM+s9abJ28w9J32UVH6cFP2OEJZc
	jyQjMG0ulPzN4DeDyH4scJQUE0YcAachhtp2ahcgTrs28holbGoodcjGSGO+YTgbUdS8
	rTZKToILs1RgE2PyusjbXvyYXxecOVt0X6LGVtrljuZ/eQjI0Z++k+UU06w4rHnNyIWd
	6eDb82cMftqYh+AXvY7Ol7BNcmc4Hk7+X8QksysONZvfOXVMfQUPZ3uoRNy00Azkld1x
	bYuLmN6+9oQlVIDVseBUkcIt6kesgRlAI9d8UnTTPIbfVfa94lcekLykBn5MzJfa+aam
	mR7g==
X-Gm-Message-State: ALoCoQldgkKbRWgJqjtWl3kP2Ra+el8JSx5d2htkruiofQrZ9dmrqJLGkhoNb5Z6LQMNlZwG0DAb
X-Received: by 10.52.162.228 with SMTP id yd4mr130550vdb.52.1378234321204;
	Tue, 03 Sep 2013 11:52:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 3 Sep 2013 11:51:41 -0700 (PDT)
In-Reply-To: <20130903180847.GC11500@jama>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
	<ec8f1bdec56b09ad884f0c19fb5e4eea256e846e.1377792006.git.Martin.Jansa@gmail.com>
	<CAJTo0LYV_0=7A93hdVnKK=hOm8BQJ_oNh7K0thEQZusPaDw1XQ@mail.gmail.com>
	<20130903180847.GC11500@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Sep 2013 19:51:41 +0100
Message-ID: <CAJTo0LbvXZ08r2AY1=_JUmeJ50rL25WP_6yM69f7WUXnmoiMKg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][PATCH 08/20] telepathy-mission-control: Add PACKAGECONFIG for upower and connectivity
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
X-List-Received-Date: Tue, 03 Sep 2013 18:52:01 -0000
Content-Type: text/plain; charset=UTF-8

On 3 September 2013 19:08, Martin Jansa <martin.jansa@gmail.com> wrote:
> It is using pkg-config in build time to enable support for it:
> http://cgit.collabora.com/git/user/cassidy/telepathy-mission-control/tree/configure.ac?h=offline-38366#n330
>
> and it has to conditionally link with them (otherwise test-dependencies
> script wouldn't detect it).

Ah, so mission-control is Doing It Wrong - that .pc file is for
connman plugins.  I'll harass upstream but I do wonder what the script
is detecting as there isn't anything like a libconnman.so to link
against.

Ross

