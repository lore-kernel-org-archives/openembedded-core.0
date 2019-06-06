Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id B1E2D7CEE0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 09:47:23 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id h9so2118721itk.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2019 02:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TCfwEv4Xe9tiFSp1WKfalX6Cor5yHdz5ASzFFfMBl8E=;
	b=l6kIOGG4SDxShWL/VtPNiyFtvBZyIC02QPuDbHh0GJfRX04xmW+4zj4A43WnrSYzvW
	5LQOj9IdXX34CZVadHL11wSKYg/JCuSuUSOlUMWh7KiMsK2UYNn3xFctyXr+uMbuf7gl
	xi5QwDQLkqP24/youJH71GpdsFkxDy0f+1glBkdzMlcga6728Qs0ukzVTAPb4Kikc9UU
	UYNyh97o/9pEchK/p7wYe5VKDlhuvNSBq6sC1T5C/JTskeJtPZ7fGvTBI8tv9Z2xoahf
	6NxQhN8MYQWQeu8kQYNa362/9yv2gOQ9krH4l639C/jbYwPSjIy6lXffVg4xCt3eagAg
	cJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TCfwEv4Xe9tiFSp1WKfalX6Cor5yHdz5ASzFFfMBl8E=;
	b=PG0QrmwOCOOFwElppF3t2byUAPt9B+An/q6O4Qk988l1KIjTgk9hdPLFd6wCGd5Tmk
	hNAakprKnbQi9PvvtrQZNr0DOGrpvT0yPYVsolV3nJZpDIGXwdqgVNllB3ignNSBV95E
	yQe4a+hggcpH6U1W5FEiZ4PwBtBFxjoPYlx4itAt9GgQiA97QahUCk70lT6Y6RQQ0ePK
	H+wtthPQqbOMe6AEJgVZufzbMN386eX8sSwF3xzbphqOAybrqNl8PIQpbOC4I+NtW9VX
	T22/cM7q4YPLvotMpIAVkg5O3JOLl3JmGfayos+lG6MukV/6bKCdaGv59p0XJZEI/a1d
	67hg==
X-Gm-Message-State: APjAAAUTf4cLepW9uiS7IcIbdyA+0xY+s/ci4F/Acl7TC4Lz34WA+iZd
	198O2cXyMfoWrh5TWoO60JoWcaG5AWfFopoHmfe8mQ==
X-Google-Smtp-Source: APXvYqwIf1oy89fexeAWeZHl9fA4BlOgKbELI2pSWv+sL5CcXJCLZgyJL9Dpp0mHGYJXjTdyCssIHLEhN1N0F919JTM=
X-Received: by 2002:a24:19cd:: with SMTP id b196mr31441222itb.74.1559814444598;
	Thu, 06 Jun 2019 02:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190530134703.16094-1-philn@igalia.com>
	<20190530134703.16094-2-philn@igalia.com>
	<CAJTo0LaLyjSxmXU8p4UOHgVf+QrHDgGsU7A=TcqCJBEctsqMsA@mail.gmail.com>
	<20ba25d5ac6d3602e3bf366a4d07ff06d9b36368.camel@igalia.com>
In-Reply-To: <20ba25d5ac6d3602e3bf366a4d07ff06d9b36368.camel@igalia.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Jun 2019 10:47:13 +0100
Message-ID: <CAJTo0Lb3nc_REi2f51f88KbUckg-Ph2K8iSo=Dhc3ECZO7Mx_A@mail.gmail.com>
To: Philippe Normand <philn@igalia.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] p11-kit: Enable nativesdk and trust-paths option
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
X-List-Received-Date: Thu, 06 Jun 2019 09:47:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Jun 2019 at 17:33, Philippe Normand <philn@igalia.com> wrote:
> Yeah you're right, hardcoding /etc might not be a good idea. I kind of
> abandoned this patch series though, since it was decided to not make
> gnutls depend on p11-kit for the time being. This patch was merged
> instead:
>
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=4babb468b856f495ef828ee21cefb266ed58bd28
>
> Do you think a follow-up is needed? I'm sorry I didn't know about
> $(sysconfdir) before.

Sorry, my fault for not looking at the patch queue for a while.

Yes that should use ${sysconfdir}.

Ross

