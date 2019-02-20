Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8C2F67C98D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 11:38:57 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id x10so6043468wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 03:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=00MyFtiRo81kpywWpEUTD/eGjDVsafRV5iib8ytHH6Q=;
	b=LsPo+DbmeTmvBwE04k0SDzFioYGLIXfeG8cI3E7AnKgiSx5PhByjpk6WA1NWSda7YD
	++l1Vo3HjovhFhyLgKXaVsClopuJXDGVDOmGapZzE9LwEDqnD9C7egnZT5UnqjAkvsr6
	NPNrcT104AN6rZVRsEP69TIIaErWZEiGzSOks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=00MyFtiRo81kpywWpEUTD/eGjDVsafRV5iib8ytHH6Q=;
	b=CkPczz2ZsdJBGtnPnaSQ2ZisnormyDt7dNLO/QmDkHH58vnYNOqG5JuOhDJ46Bp4+J
	HLopVpRp58g8C9NvTa6u70E3H6bsT0W61ENPoE9QYU3SrPRwqbF1xyhPZZnpB1FB/MqY
	lkgKmUkgbl3y9Vk9O8haGjSbXdRHyB6wZQQbej2OtW7aWYyHL4KgJwe24Uc0dsPBmQ08
	RELzS8+qUxS+JV1+/PW6UJTOOA+WA0HwlnGYYCX0AvbQ38q2/tO2N4pLCjr1RbA4Yx8f
	EGjgYKitFXOp/zO2OYJDfA5VYy6KcN+VBwDn9Cwn3MlrPBtrIMVPB8QLDhMLkaMiw4TH
	b+7w==
X-Gm-Message-State: AHQUAuYKqNEex6jPFQ5VRVIMBtoT9XnGaKVmKpKgB25vHeJvVQ9LyI5g
	hyj0VnCaLQa8kWjjdDdHv3TW33A/4mo=
X-Google-Smtp-Source: AHgI3IZkgN9/pQvOZYe2g+dhlmDRhxjueeOoUdiVDk9EiY0A7E+ZjTtaIH8nQ7JJNB16tyPKpxgQXQ==
X-Received: by 2002:a1c:99c3:: with SMTP id b186mr6148121wme.79.1550662738183; 
	Wed, 20 Feb 2019 03:38:58 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u15sm6264030wmu.17.2019.02.20.03.38.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 20 Feb 2019 03:38:57 -0800 (PST)
Message-ID: <bfd1623cf4585698856b867078a62ec36c245350.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, Chen Qi <Qi.Chen@windriver.com>
Date: Wed, 20 Feb 2019 11:38:56 +0000
In-Reply-To: <20190220091448.GA11931@localhost>
References: <cover.1550626729.git.Qi.Chen@windriver.com>
	<893bfb66e32bb3bc8a2ef21fa5255873c508f0a3.1550626729.git.Qi.Chen@windriver.com>
	<20190220091448.GA11931@localhost>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] kmod: upgrade to 26
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
X-List-Received-Date: Wed, 20 Feb 2019 11:38:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-02-20 at 11:14 +0200, Adrian Bunk wrote:
> On Wed, Feb 20, 2019 at 09:40:35AM +0800, Chen Qi wrote:
> > ...
> > --- a/meta/recipes-kernel/kmod/kmod.inc
> > +++ b/meta/recipes-kernel/kmod/kmod.inc
> > @@ -14,9 +14,9 @@ LIC_FILES_CHKSUM = "
> > file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
> >                     "
> >  inherit autotools gtk-doc pkgconfig manpages
> >  
> > -SRCREV = "aca4eca103d6699543f7ed663335c28c2e9908bb"
> > +SRCREV = "58133a96c894c043e48c74ddf0bfe8db90bac62f"
> >  # Lookout for PV bump too when SRCREV is changed
> > -PV = "25+git${SRCPV}"
> > +PV = "26+git${SRCPV}"
> > ...
> 
> Shouldn't this be PV = "26" when the commit is exactly the release?

Well spotted. I was going to ask for a v2 but messed up the patch
merging by confusing two patches. End result was I merged a fix for it,
thanks.

Cheers,

Richard


