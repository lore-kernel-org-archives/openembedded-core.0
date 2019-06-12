Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id DA20A7E762
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 10:27:33 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id g135so5990928wme.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 03:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=YfrHt5gU5MQNEgr3/D47lXUzfZkEDWaeFkAQaQ2IQu8=;
	b=e3Bih2SufIcxcLQLgAUVhDFh5w8Upy6aivYzZ9f5f68FzTPm7inYljPwUHYIkYuUuB
	VB5Oea0bma+7V3jhOFeiW5bhnh4yVOiHKPXvOf8gFYfp9VeDPjjraVO0dvLPJyZWpfa/
	L64+QbhU1i3a/927sEXocR9e7Q1FyTkNfoeOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=YfrHt5gU5MQNEgr3/D47lXUzfZkEDWaeFkAQaQ2IQu8=;
	b=MZedB0RYP62D1wmGSa35UuVCpDxJc3V7+Hsfq7nuOCA/mkTaML/oKGG6EdJW64emyq
	fK8tOpoKXGSuC0lU9ajRndyDRumWhwxVv/psO9X5uibj/uf89uAugruOkqFdedRqnjSI
	K/5Rwwl9h8CG1H4oKOEqoXyvulBFiFz4tmTuZ8NyfOYgRiEfBAIzHC4K3lT0nt0dc+vk
	NYCTnavTDfcl+RMqSSJXxcH7BHOO7np0Afk0z5psplOjnzMITRfQ+QO7joUbYkj8jOHn
	fSMUAlg/+q87wQBkI3WVwsp0zZCyhA5Y/BmhfFeFN6ZOjB3j2g6EtVRDtGYH/wKFZaw/
	tb3w==
X-Gm-Message-State: APjAAAVu++mBfXOR513Szkl6thw8niY+j3HSCsCE0RlpFQKmissXDF7T
	7z/rceZyF2zXjP9fmoxADdl9ZA==
X-Google-Smtp-Source: APXvYqz4GufrBCgl/NmNElcfu89dr8C5AjS/UQeAt6YmKcgQvNiN3d9C3PKZHaSKqOzxHsJT5hvvAw==
X-Received: by 2002:a7b:cd84:: with SMTP id y4mr22271436wmj.41.1560335254549; 
	Wed, 12 Jun 2019 03:27:34 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x17sm1321263wrq.64.2019.06.12.03.27.33
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 12 Jun 2019 03:27:33 -0700 (PDT)
Message-ID: <8e3f4ca45c12db069072f5760d3f13e1b4e97cc4.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: He Zhe <zhe.he@windriver.com>, openembedded-core@lists.openembedded.org
Date: Wed, 12 Jun 2019 11:27:32 +0100
In-Reply-To: <5f8e3df5-5687-c6a2-5ee7-c3c468ef6d86@windriver.com>
References: <1560330909-164994-1-git-send-email-zhe.he@windriver.com>
	<d0b197e49ef118034631fae6f322a745b0e34932.camel@linuxfoundation.org>
	<5f8e3df5-5687-c6a2-5ee7-c3c468ef6d86@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] lttng-modules: Add git based recipe
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
X-List-Received-Date: Wed, 12 Jun 2019 10:27:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-06-12 at 18:21 +0800, He Zhe wrote:
> 
> On 6/12/19 5:57 PM, Richard Purdie wrote:
> > On Wed, 2019-06-12 at 17:15 +0800, zhe.he@windriver.com wrote:
> > > From: He Zhe <zhe.he@windriver.com>
> > > 
> > > This is based on meta/recipes-kernel/lttng/lttng-
> > > modules_2.10.9.bb and is for
> > > those who want to build lttng-modules with bleeding edge kernel,
> > > to avoid
> > > regularly backporting patches from upstream.
> > > 
> > > Note that PREFERRED_VERSION needs to be set to select this recipe
> > > instead of the
> > > tar ball one.
> > > 
> > > Signed-off-by: He Zhe <zhe.he@windriver.com>
> > > ---
> > >  meta/recipes-kernel/lttng/lttng-modules_git.bb | 34
> > > ++++++++++++++++++++++++++
> > >  1 file changed, 34 insertions(+)
> > >  create mode 100644 meta/recipes-kernel/lttng/lttng-
> > > modules_git.bb
> > Do we really want/need to duplicate the whole recipe?
> 
> Do you like one .inc plus two .bb s? Then I'll send v2 later.

Yes, or just require the other .bb file and override the pieces needed.
Not quite sure which would look best right now.

Ultimately I'd like to have something like Ross' patch:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=ross/gitup

and use that for cases like this. Requiring the .bb and then tweaking
may allow migration to something like this more easily.

Cheers,

Richard


