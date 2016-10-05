Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id EFD3C71A50;
	Wed,  5 Oct 2016 13:29:24 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id p25so89263531uaa.1;
	Wed, 05 Oct 2016 06:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DBPmPQx4/yZ2zyBbRuOT77U9LgOYzM4KPQNhDgKL4p8=;
	b=KIeTcYUL57xspKkWwP2GsOXn3BY7DBB42aeVq+IXFKzcqCvPgUrKJBAUJGxUjyhaQF
	n6ppZdu71aCzwevtyzJcnCA7CuPu9jOUo55TJZTtIBllcYjpqfQ60mkeSS6bavYG/OfD
	cziUwwze4ltMoxqb0GRxn9CtqkYAQFp3DQItEOwnspY9f6DyypLLYO8COY7wIYKxuu2B
	3JLUH5Tzjdgp0Rb6j4BS5/hh/WeUPcF+ZQ5ebwR7qzGSO9MrEO7DYjzpssffmFaq9Vyl
	+OU7spMyUkxfElDLSv6xpj6TkX0L/PIjyHBM2uXfkRxUQ+bOrB719C/YDNUnn2zU2MnN
	Z9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DBPmPQx4/yZ2zyBbRuOT77U9LgOYzM4KPQNhDgKL4p8=;
	b=jNqTTxd2c4STICDGl/ciGgWKYIXd9h8Pgt8Yb/aTX4BxYIh77GuurnOt3av4tojbaI
	t7oXBo9s035UfIbfI3QLkkocAGqZ8N8DBgcGWFYfKfkzIIKFXy/df+60fZU0e/xN18dr
	PWk3kPjUB4JM39FfCJwMOH27GF6rGZf/zq0ZezU8W7H/VcaL4J8bnQwug3vAowu+ZpnD
	VF7LTUqeXwShLqirqMbVNkRZYuglweSf5P8QZP1iopLygTLtBTXBWi7ffK2xjCTSocjI
	XvPZU/23EYgwqP3zyF+aZba9KJAZhyzpHbjWJ0+B39Ct6uH6AN1VWj9ewoyfuz9uMNKq
	p2vw==
X-Gm-Message-State: AA6/9RnNSpXHBCb85NhEMjPlv81oonocPLbIB/56betX8HWjuIEWoIx4qkTpS0fTONTquNYYzAOvZTor20FKXg==
X-Received: by 10.176.82.220 with SMTP id w28mr5352402uaw.65.1475674166225;
	Wed, 05 Oct 2016 06:29:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Wed, 5 Oct 2016 06:29:25 -0700 (PDT)
In-Reply-To: <20161005131408.GA2926@jama>
References: <20161005131408.GA2926@jama>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 5 Oct 2016 15:29:25 +0200
Message-ID: <CALbNGRRDzx-2FPMd_hgfoEMQgHPGFjfjViMSCAfJaBZRg=c9ig@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world 2016-10-04
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
X-List-Received-Date: Wed, 05 Oct 2016 13:29:27 -0000
Content-Type: text/plain; charset=UTF-8

> === qemuarm (1) ===
>     * meta-openembedded/meta-filesystems/recipes-support/physfs/physfs_git.bb:do_populate_lic
^ This one was fixed during run - correct?
>
> === qemux86 (2) ===
>     * meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:do_compile
>     * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:do_compile
>
> === qemux86_64 (1) ===
>     * meta-openembedded/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb:do_compile
>

...

>
> == Tested changes (nocluded in master yet:
> ad9b1ce firefox: Fix build using gcc 6
^ Where does this one come from?


Andreas

