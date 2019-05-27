Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 36BE67E1D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 17:34:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45CPHB4yrMz4H;
	Mon, 27 May 2019 19:34:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558978470;
	bh=3DEhDUHCcPgpsrpuP7f6XTtIEo4jf032ujuhRJCjSO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gWH2kNhGhXiOWm8b0KfVHuh94M3fKis+/Tk0K9beCrGgiD8ptBvjuWqAJUb+xCNjX
	KhSs88swReCBo9yZ8tqdwFQql0vUbXYqBgVxdmWqHgGZYc3HSR1LAca4S6EGQr2IuA
	L8NYq4+OvnAKM0rKXYPYSnJNAF7pI6KkE/uvsjNe1rsNOd0tHa8lGrULkWJOBiE2D/
	YI8KXd26UJi82NZqMSB5BYEzp3cepwiCqHZCeIgKfBBCeXU4YYuOk23CWMCydrGHxa
	0r1SUq3+I6GsdGVP/bs+D/Ek/Nc9KClhZtfj5b6Km+gkN6oaJY48l663JwqNhTHun3
	0GH98FADppdOtmwG8apNYn+H2g+gtTJzyclvbpOK5lv47uwsCD6DCrdLEmNK+XVa51
	q3wfifKo/Vzg/z0k9jHOxhcGtVJWzFQYF8WytQWYDu64l8qVh3UkUE+uNz05h1Kc7R
	U0e8nEVKUyncCwayeCaQ/J+yAKx4Vy6wlxb+QbOOFKxOa26iwFEJVq3oyR2ug2J9Vp
	OMCYdEN8sWLnQCAQ7hfrcVHeqpT5t2cXO0EysOI4GA4R+sLxym49N8Rs2BfxA7zA3+
	P3rUo+MP7qRrfk4M0EjzIBnn6Lm805zDy5B3iqbvt597/FcspQKamQhKv2TAAou+MS
	mBH5oOZr8rRnmtP3oDPmjv1k=
Date: Mon, 27 May 2019 20:34:22 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <20190527173422.GA27759@localhost>
References: <20190527134419.14223-1-anuj.mittal@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190527134419.14223-1-anuj.mittal@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] Revert "pigz: pigz is not gzip"
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
X-List-Received-Date: Mon, 27 May 2019 17:34:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, May 27, 2019 at 09:44:18PM +0800, Anuj Mittal wrote:
> This reverts commit a54c59f2a24904daffe51582b6863eebd071db0d.
>...
>  # Point this at the homepage in case /fossils/ isn't updated
> +PROVIDES_class-native += "gzip-native"
> +
>  UPSTREAM_CHECK_URI = "http://zlib.net/${BPN}/"
>  UPSTREAM_CHECK_REGEX = "pigz-(?P<pver>.*)\.tar"
>...

This moves the comment to the wrong place.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


