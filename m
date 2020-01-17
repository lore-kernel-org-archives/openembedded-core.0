Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 94BDF7FBEB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 18:57:04 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p17so8695914wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 10:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=NZDKwrmYDS3tU4YpjfLKUDhFji+vCDQMpjmi5I5gYxk=;
	b=ew6+zgFrK1M8OlDRdtZgs9W7ZnDCIaTFk076+yFWEdiLx+wvu4pUr45vqI4XEFVdOH
	NX47st0AlsryTf45g+Oahxzryv9iXBUvDmK8cMAmHOzzsA/yLo30WzXe2ZgX+45iOV4/
	YO8h2yHzelHBzq7fic+5lucNKsp3Lx/GvjdUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=NZDKwrmYDS3tU4YpjfLKUDhFji+vCDQMpjmi5I5gYxk=;
	b=E9qj0aMSw0ZD5Py/Y2YNeUnWnxP5UFyJ4e9KCsR2BuS6QeLxOu0uc2HOdpiSt/kI8L
	w6KpXC20X0GxxN/oOFKm+Ptli38zPuIDLDvcIq9Nki2cxs6jScBl9Z9p44lBdkgT9Neu
	9aqS6kkS+AD8teDxF0CbkxgKUstlSO7+o4RwPUQLX2YOiRgCo72nNSuPalqId+gC6Ofo
	AKVpkZ6sv5ztd+26azCxh49ofKFItQAY7Td34LVgjtSA2yS+iid55lGCWk5ImZb/YkFM
	YPKJWiNdUYTQK+bZ7Y21NcvjJ5QKlbB+ehxbpN31ODEMPXUO2WwUn58oV6VoLfuI/tiw
	/zlw==
X-Gm-Message-State: APjAAAXX75tyUJJpJ6vSxTTk7uN/mxhVBwuKCz91XLG5YeXIPe3jHw8z
	oQs4ICI2o/S0UJHsvmydWk0yYg==
X-Google-Smtp-Source: APXvYqziLmnJr5OAOINYQCpQst5/noEzNlvzFEKHqk0RX6o5QNzW6nBghsmvsBXBv9PwuMupWYz9EQ==
X-Received: by 2002:a1c:b603:: with SMTP id g3mr6338652wmf.133.1579287425254; 
	Fri, 17 Jan 2020 10:57:05 -0800 (PST)
Received: from hex.config (5751ab90.skybroadband.com. [87.81.171.144])
	by smtp.gmail.com with ESMTPSA id
	p5sm33499544wrt.79.2020.01.17.10.57.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 10:57:04 -0800 (PST)
Message-ID: <3e7abb573ad9f471089adc7e78dc94c0f640220a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jan 2020 18:57:02 +0000
In-Reply-To: <f0bf0f91-b6a0-f22b-37a4-8d72daf8a2cd@gmail.com>
References: <886f1102228414559c078203bcde660cfc807d2f.camel@linuxfoundation.org>
	<f0bf0f91-b6a0-f22b-37a4-8d72daf8a2cd@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: "Orling, Timothy T" <timothy.t.orling@intel.com>
Subject: Re: Building older releases on modern distros (and vice versa)
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
X-List-Received-Date: Fri, 17 Jan 2020 18:57:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-01-17 at 10:39 -0800, Khem Raj wrote:
> On 1/17/20 9:59 AM, Richard Purdie wrote:
> > We've been discussing how we could:
> > 
> > a) build old releases on newer distros
> > 
> > as well as
> > 
> > b) how we could build new releases on old distros.
> > 
> > Our proposed answer has been "buildtools-extended-tarball" which
> > includes nativesdk-gcc.
> > 
> > We need b) so we can install this on Centos7 and stop having to
> > work
> > around its really old compiler. In general this should improve our
> > ability to support stable branches in general.
> > 
> > I wanted to stress test a) a bit, partly to prove that b) could
> > work
> > longer term.
> > 
> > I did this by attempting to build buildtools-extended-tarball on
> > pyro
> > which has a gcc v6 and then using that to build morty on an Ubuntu
> > 18.04 system.
> > 
> > It wasn't plain sailing, I had to:
> > 
> > * Upgrade the uninative in pyro
> > * Switch to xz uninative to allow latest uninative to work
> > * Patch binutils to fix an ld.so.conf relocation issue
> > * Add an ld.so.conf to buildtools
> > * Add the buildtools-extended-tarall recipe
> > 
> > Patches are in:
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rpurdie/pyro
> > 
> > (some need forward porting to master)
> > 
> > Having got the output from the pyro build, in the morty build I
> > added
> > buildtools tarball to PATH before running the build. I had to
> > disable
> > uninative since it was going to get in the way and conflict:
> > 
> 
> do we intend to generate extended buildtools tarballs for all
> releases 
> if it works out well ?

Going forward there will be one generated as part of the release
process for each release, they're part of master builds already.

We only really need a couple of older older ones with older gccs to be
able to support a range of different older releases but we should look
to generate those.

Cheers,

Richard


