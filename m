Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id F18727054E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 21:13:05 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id r2so101530igi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 14:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=blfDWHgBT8cp8Jsx8ZmmUqEwBhAC/2nGkj98vHsIIyI=;
	b=EeAwZjAqyijh7TTvY9l+eQTgb7fr0V7kDBDb08T5/Wu7zgKcB8KE0hqkUJ/6n0b4Wu
	0YVmbhJEbczSUaYl27Ylp0AawoAptG0L0oMBINXy+YDnWYWqtkIzOeBqGnITVmAIv4hS
	fvt9NL58sJeJSlIPHs8YoMNqyrdOMxL59r3I7eEHaRD8xN3phcBiBsBFhmaaciSPZQLd
	qDyqh+0g0Md3woY5LfNVQhgK9SGDkBAJdDOgdZwCRBuvTuCZt88Ou9GtmOPyFZwuF4+D
	Eg9lclRgAOWc0g0dWOncnxedussgB8cBQf6rZuWWOPXMho/EU7xxoG6TGn6V/n2CYWeU
	zhzQ==
X-Received: by 10.50.56.38 with SMTP id x6mr686523igp.30.1409173986898; Wed,
	27 Aug 2014 14:13:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Wed, 27 Aug 2014 14:12:36 -0700 (PDT)
In-Reply-To: <1409154657.29296.12.camel@ted>
References: <1409151022.29296.7.camel@ted>
	<CAMKF1spTdX1Mom+X5LOt5-pRpCMUuNmxTpvfQ+VOjVaasNrS=w@mail.gmail.com>
	<1409154657.29296.12.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Aug 2014 14:12:36 -0700
Message-ID: <CAMKF1spmZtTHnU_BM842mzRxQVVcT3+oLkEb=b3z7BMk1hv-+A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] patchelf: Add patchelf recipe
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
X-List-Received-Date: Wed, 27 Aug 2014 21:13:15 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 27, 2014 at 8:50 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The issue is one of dependencies. We need chrpath/patchelf to relocate
> things like {autoconf|automake|pkgconfig}-native. Native
> patchelf/chrpath depend on those things to build so if we don't have it
> in ASSUME_PROVIDED, we get circular dependencies.
>
> chrpath is widely available in most distros. Unfortunately patchelf is
> not. We therefore can't easily put patchelf-native into
> ASSUME_PROVIDED :(
>
> So the reason the above didn't merge hasn't really changed, much as I'd
> also wish it had.

compared to last time now debian testing/ ubuntu utopic have added it
as well. fedora,suse, gentoo and archlinux were never an issue.
we can generate a dpkg for older debian-like distros may be ? is it
worth the effort

>
> This does not stop us using patchelf for other things though (and I
> believe we should).
>

