Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 21D7375293
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 16:33:25 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id c9-v6so3697351iob.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 09:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=I4QiCoPnf0yJ0VTusN8IdJxkWsPw/IuCHLaWD4WLn7Y=;
	b=Yclp7w40fYZJt4yBLbagtloXqg0zGNDqK3U0JCwu2xLsKHLjXlo9SNDYWvAm7d7bB+
	4U9B9GiiILFkjNFUJxnC5T3rbt7SxuHc6aIO2CWSB919OBy/UAFMZ+xTUCXA8Bl5Fhz5
	E6RZ5hLf5CktIiyAGCST6cQZ10X70B1R/Gq03aLnAHmsOlo4YiV3b7mKMyPpTfG0CkC4
	+81QSdam1Ikk0SSYZvePTluWIdFvazR+XuzNRxAG5cJVJGsmMniVO4OxYJWiCT4Gkthe
	irAfu05ygH2Dr5/SHjqcc8JvdkJVMGRyNx6y6A/z+j4pGlaxFU3Sq9so6Dh+hkODuYrp
	n1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=I4QiCoPnf0yJ0VTusN8IdJxkWsPw/IuCHLaWD4WLn7Y=;
	b=S//6E0sX6EVANn6ecPtSsICIIvWTtflBzvUJJoqNJVAFRQ7Lv9ZbgxV4Kl5CWiWCbU
	qidC//xhI+/f35+GMnKJmlKW2guXqipPXGlVSH9pnna1FZx7se4MC+MctdzreO2LqEoT
	kltB71DesQ6UigNqq25zL5Th2FE1ec7j0Sw7n2A1jkc5SRZK6OLPZtHw9Z1cBtheZ3Ju
	MxaJEn8swmmvauLj0jCthwdNWA67IrTYdBJdQ1mKVZEeiYDaWvROSrumHPd9ayiZsvuP
	hmin7O+zcPDe1tIpMvhuzAztYmEnPgcX4qZdlCrvxzuPjItPnV9vaCmQVZC9yv+c0QZY
	UHPw==
X-Gm-Message-State: ALKqPwffeyLN4q1Kn+sYNi/v+5iyD0Vk9SyyfgJv2YSNl3wJuITeaLAu
	JpZIXAQvdhlMq5Iy6EI2FGC3guZDmnm1NjqVnVbWDQ==
X-Google-Smtp-Source: AB8JxZoFGOwXHYpsWdCIOKx56suQ7dDVNUM/j1AtxuWXBmWkbE+plLQIKRRceJTH8174SfybPyXWnpmE6wGDh73LUHQ=
X-Received: by 2002:a6b:248e:: with SMTP id
	k136-v6mr2106147iok.270.1525970006893; 
	Thu, 10 May 2018 09:33:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Thu, 10 May 2018 09:33:06 -0700 (PDT)
In-Reply-To: <CACS+7ZSzjg6f3jpEk+BHAs7XbmUGiPZN_P4HYcnNWvmvjKpYQw@mail.gmail.com>
References: <1525922097-15292-1-git-send-email-armccurdy@gmail.com>
	<1525922097-15292-3-git-send-email-armccurdy@gmail.com>
	<86e5dada-7bd6-5cbb-95ff-0bf9ccdf0e1e@gmail.com>
	<CACS+7ZSzjg6f3jpEk+BHAs7XbmUGiPZN_P4HYcnNWvmvjKpYQw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 May 2018 17:33:06 +0100
Message-ID: <CAJTo0LYyJ_=Tr1XTB8rW5O9-oQf7oNaguoaMq7y2cSC9Upcw1Q@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] bitbake.conf: drop _build-${BUILD_OS} over-ride
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
X-List-Received-Date: Thu, 10 May 2018 16:33:26 -0000
Content-Type: text/plain; charset="UTF-8"

On 10 May 2018 at 16:47, Dan McGregor <danismostlikely@gmail.com> wrote:
> I'm with Khem. meta-darwin and meta-mingw are things, even if they
> haven't been updated in years. If interest arises they shouldn't have
> too many barriers to starting development again. I've also started to
> attempt to build on a FreeBSD host.

meta-mingw builds Windows binaries from Linux and meta-darwin builds
Darwin binaries from Linux, so they're not relevant.

People *are* at least trying to use Windows Subsystem for Linux to
build Yocto on Windows, but I suspect as far as bitbake is concerned
that is Linux.  There's no practical way we can build on macOS right
now due to the recent security changes.

Builds on BSD would be interesting, I'm curious as to how much breaks
from GNU userland expectations and whether the build override is
actually useful.

Ross

