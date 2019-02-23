Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id C09FF7C9BF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 10:44:45 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n2so4948389wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 02:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=TB4QN9mlwhajx8NaZmWkd5ZaWswjUjx/GVOOTnCTlr0=;
	b=L99vF6d5AHi0EXHpEui85lynG5/zLnHN7CFAWGFU/HESoMcWV7lSGXTafaCk48vMo7
	ksAdzhOfo75BO5AX9BsHSSTloKK7tH4Du8FDmREyJ3oi8pcGQVQ/BycKMVPl7xxI/pRy
	gKlGIK5islDg7+OCTTk9a7aUJBehmjUy7BNVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=TB4QN9mlwhajx8NaZmWkd5ZaWswjUjx/GVOOTnCTlr0=;
	b=GAbkEuV+MdEEozGFY5RhVJo0K4096ZLjQi6N003rTzPxKs/UUVBjer0Ts4FmW/tWeJ
	6nuVBdi3f18nKtljnY0ZQH8Qfs8gRo+7PmUQ37wn3ETRvY4OqG0UY+FCO9COOW/eco8A
	AAr0IIiN4OI683Z5yjV7IBvM9mtz5ampwketeSbZKMbj5HhwgIUicKR0PF0jQhgiW5TT
	82zpCF2gMc6RVpQCT83Hmm3L40+tMCVnLZtZ1f5ZTqVsiIjWURVFoOcGXU3hdTgWiyXq
	8DiAXgfpwc/ygxB78mTI+RDYGaxM1O8U+jpJPZo4ocy8Nd+XDqdHw1urQ0pRMYsaPAON
	pV7g==
X-Gm-Message-State: AHQUAuZMACuCWgGvKCvN5QedhDyy6lQZfu/udlgLMJzDRCoF9ZWztTYN
	YfOZ5kzS6Gdxk6WhlBdhH/d+Kw==
X-Google-Smtp-Source: AHgI3Ib6wEMFH+XE21E8Xq3v+r73c9UZu2WYS5AAMweYoOVwALciGbn1yGc1hLcy7kQERf6TUo34Mw==
X-Received: by 2002:adf:f102:: with SMTP id r2mr6072154wro.288.1550918686365; 
	Sat, 23 Feb 2019 02:44:46 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g24sm1276365wmh.45.2019.02.23.02.44.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 23 Feb 2019 02:44:45 -0800 (PST)
Message-ID: <2b20d6b03184d253abc1f8f06ac325855d9d7205.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rich Persaud <persaur@gmail.com>, Armin Kuster <akuster808@gmail.com>
Date: Sat, 23 Feb 2019 10:44:43 +0000
In-Reply-To: <4C429FC4-E68A-4AFC-B8D6-61DFF45CE2AA@gmail.com>
References: <CAJTo0Lb9Aspc0Nu+H3eRzbQcOLDevn40hJ5Jnib1DKo8k4R2cA@mail.gmail.com>
	<20734cff-3215-7a9d-8bc1-87d7238876fb@windriver.com>
	<6F7B3258-B781-465F-AF58-E4E8EBA88012@gmail.com>
	<6673aa01794a9a5466969fa4a39d28b46649173d.camel@linuxfoundation.org>
	<4C429FC4-E68A-4AFC-B8D6-61DFF45CE2AA@gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Incorporating deploy artefacts from one multiconfig in another multiconfig
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
X-List-Received-Date: Sat, 23 Feb 2019 10:44:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-02-21 at 20:09 -0500, Rich Persaud wrote:
> > On Feb 21, 2019, at 18:51, Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > 
> > Multiconfig is meant to support this workflow. Unfortunately there
> > are
> > open bugs and people haven't the time to work on it so its stalled.
> > That said, the key pieces are already there.
> > 
> > A picture is worth a thousand words. I thought a demo might
> > interest
> > people and "prove" this can work.
> 
> Thank you for the patches and PoC.  We will test and are motivated to
> see this work.

Just to follow up, I've cleaned up the patches, they're now just fixes
to bitbake and are done generically so we shouldn't have to patch the
various BB_TASKDEPDATA users. They're on the bitbake-devel list and
queued in master-next.

This should mean multiconfig looks better in 2.7. I'm going to try and
get a patch to add some tests/example too.

Could anyone who's previously reported issues (Armin?) retest with
these and confirm the issues seen have been fixed please?

Cheers,

Richard


