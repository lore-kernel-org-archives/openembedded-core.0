Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id AF2BB6BCA9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 13:39:38 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w15so15801600wru.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 05:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=Bev6Ej/yqNLJWeWadEWmYpIOMcDqsduIziNrMJqaI3M=;
	b=U125I9iIRPEvPs46GymZMAMPjQ2XF2tZOKK2pintvwBAgECaldRdGx0TvNywPk0Zed
	YblHzuiYlcI7jkk2zOsmkFAFtsSTzyS+vnruss4jswFK/H41Xc7oDbvQelriKS4puVwH
	lRpxHHC2tlBtWI6FRkKL1h9fgrQML2pqzp+Is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Bev6Ej/yqNLJWeWadEWmYpIOMcDqsduIziNrMJqaI3M=;
	b=W0A9/vG+Wsaf75zxQ25Jjx49Yzwq8lUZMgmkrMSf1G7KMapmmFLUs/jVSIjkkPVeQu
	LSAS/NxXKPVrhp+Hozq6uGqn4zf8mrbT65sjwBBbIl2EVw8MDAgMEldBS0kIU3e6fGQi
	HjiIrE+QS2Ar+Yt5BNnDH1o6vxqBS0I7Z5OQMoKKpb1dnoVZShb6cI5ktftkZ7/SDQbx
	WUtkjn2atSwfMh+4jWy0/PtQNme7gfEaQ6PLEDLRrhE6qz7Gyo2g3iM5zdcDupIwLhs2
	XBZ8tZ3cUK7pgMA9VgOfmv73v/YXh5mTQcJf+z2c9CRpPz1DjUUxkJR2poTR4oozOGY9
	ZcKw==
X-Gm-Message-State: APjAAAX0fp7ihghs1Bz/vA3AVtmBgBdiEYdoQ4+Qup7ZykQ3rerv7DEz
	/8JIwtHZsZk4yBIlPp7Spjj2hw==
X-Google-Smtp-Source: APXvYqzhC2ys6b4MklzPzRg6UfhIiLCalA2TvTg2DZGJ14d5yl80kopgl+k5Sln6+TXFwphFaCV/uA==
X-Received: by 2002:adf:f847:: with SMTP id d7mr32164664wrq.35.1579095579749; 
	Wed, 15 Jan 2020 05:39:39 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f16sm24406984wrm.65.2020.01.15.05.39.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Jan 2020 05:39:39 -0800 (PST)
Message-ID: <c9874f81da364cbd03aab137c901359e7aa3fdd7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2020 13:39:37 +0000
In-Reply-To: <20200114140007.36622-4-alex.kanavin@gmail.com>
References: <20200114140007.36622-1-alex.kanavin@gmail.com>
	<20200114140007.36622-4-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 04/20] python3: update to 3.8.1
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
X-List-Received-Date: Wed, 15 Jan 2020 13:39:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-01-14 at 14:59 +0100, Alexander Kanavin wrote:
> Drop backports, rebase other patches.
> 
> 0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
> is removed as the use case (allowing python 2 and 3 to coexist
> in SDKs) is no longer relevant with Python 2.x reaching end of line
> and upstream has refactored the code making a rebase difficult.
> If needed, please re-add the patch to py2, rather than py3.
> 
> Python 3.8 no longer adds "m" to "3.8" in paths, so adjust the
> recipes
> and classes accordingly.
> 
> The manifest for the 3.8.0 version is updated; particularly pkgutil
> module is now packaged in -core (as other things in core need it);
> this also necessitates allowing empty -pkgutil package to avoid
> breakage across layers.

I added a chown to do_install to hack around the other issue and see if
there was anything else:

Looks like there is a reproducibility issue in python3-tests:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/614

Cheers,

Richard


