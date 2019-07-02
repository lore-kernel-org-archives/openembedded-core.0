Return-Path: <lemagoup@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2C6497D41C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 09:10:19 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id k8so35418894iot.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2019 02:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RFg9c5hV1kGP13ylYtegKdmg6ay5W1A5YYMxaC9tP4Q=;
	b=tp6BaCj9DIHqS+sjpJQ1cHsMAUf12qUVioEkeuFzD4/YRWgMeg64E4ohAhf+/zvK/1
	d0Nr32YbKOkb+Jtw8iYvZ3TTedv3BbhuLya47BjJ72S/+tWR6fIMJvyILxK1yX7YTXbu
	OdbtYprs6YU7WEJYKAq5Oe9mGCeJbXR04XAJsQqdwkpeEa7BQeirRxV8ddFrCxG7iv1n
	r8uZ7CTQ03gfRBO1O+PNIaQV3J3Ewnt9OWWultZ+GLu1UTc2M3jTVR6h3xk4TZKMGMRX
	uM7u9cI0WRl1bcEWUxCjBD4iN3WuvZRCiCPO9CDNoRNEGUX5E4JCogXFJrLDq3yNRlQi
	oDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RFg9c5hV1kGP13ylYtegKdmg6ay5W1A5YYMxaC9tP4Q=;
	b=Xj2R4AEOyLnfxpOO5Eo3hCLyODmakBxRncpw/NROoAnBno+cFxNT2BNkPd81G2EEVu
	cTauT29i/uhz5YYNLwgi2oOSaAJbAC8073JNNPuFJYIvk+kh9Zrnf+XEhULkHxJeeBig
	JbrBDXlqeGAp0WD22soAHHU2szrRrW6WZSYQWN9OLk8KcuCdRWkGNkUhiLtnUh7pGPp8
	SZSyOgFAsRjCVEvxYKXTDZwqjGmVFSnO3BoLw32FwsZwez9gae0ugP5lUpmlUK0kH1W+
	wrePQZ6erUDdjZPUbNtHUHirTxSU9wGZH3KlCatt8rtwjLtHUKUVtbEdd+O1YS9JYWaR
	lvsw==
X-Gm-Message-State: APjAAAXLDSr/qMtUSzLFQtLeaMSn4if9ldiSQyVjrSh8VyYzOjCWrzUz
	pzaTcoAwmGB/RFxBEbeKXnmmJEMDUynmfsNFhBk=
X-Google-Smtp-Source: APXvYqwzDP3KlWrWp685CaMxXV6FiuY+7rHSNnsbpaJgcYTvjyf7ijHZLTguJEUBxrKNet2eMFCWWh16JowfruFWa0A=
X-Received: by 2002:a02:5a02:: with SMTP id v2mr33158511jaa.124.1562058620141; 
	Tue, 02 Jul 2019 02:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190624094438.7596-1-lemagoup@gmail.com>
	<19369a4e-80ec-9659-faa0-fc0f5925aa87@windriver.com>
	<2baee5f7-f293-f9ce-447a-c2a6297a5529@windriver.com>
	<dee71c54f502a346433289c8cc3e268c5f719614.camel@linuxfoundation.org>
In-Reply-To: <dee71c54f502a346433289c8cc3e268c5f719614.camel@linuxfoundation.org>
From: Pierre Le Magourou <lemagoup@gmail.com>
Date: Tue, 2 Jul 2019 11:10:08 +0200
Message-ID: <CAEz4NHoQ+Yx6BAv8raKokE95Pk2NCd9oEvfLZUyqyi9kYoH=zA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cve-update-db: Use std library instead of urllib3
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
X-List-Received-Date: Tue, 02 Jul 2019 09:10:19 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

> > On 07/02/2019 03:39 PM, ChenQi wrote:
> > > A recent do_populate_cve_db failure:
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/1005/steps/7/logs/errors
> > >
> > >
> > > Could you please help look at what's going on?
> On Tue, 2019-07-02 at 16:08 +0800, ChenQi wrote:
> > I just tired to open the web but failed. The web seems down.
> >
>
> We were making some changes to the autobuilder to speed it up (changing
> database backends), its back now.
>

The NVD website is down, cve-update-db should not fail in that case. I
need to update it, so it prints a warning instead.
I am also wondering if we should mirror NVD json data feeds, to avoid
too many requests from Yocto users. (but I don't know how to do that)

Pierre

