Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 05CD2607AD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 12:21:28 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id k81-v6so8361298oib.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 05:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZFvHkIWxqNNRmnFNvwtSxTKkhknkays1QBv4HnwxZH4=;
	b=i6YYFyI2UHFAXS9hh0Vw4sKJt65+akr3+8tTGVRKQeJ6GZzoKlAKBZk8Hnfqvgu9hB
	pGXEq64QEGYQUzJ/AhQB6O2RCIyA0pAp9glwH5v1gN+7WKh0X+Wnlar1AVTH0BOzW+uE
	fvTsf6Tk61tVcinxCFsrZegz0NZ3ifkxceAO7hjDd89YkQ9w20fbXzCfaOh6fSytahGE
	dp7SZnyHiG2VbpZ7TGTSV3aTErScz/Onfqi4PpmLizAAjoHamOKbPv62ZlSa+Cdev3eb
	EbxDkaw64jkYfAUB3z6w0xrFKaREnmvlL/Og3woX/iurl0i1NqU3vexNFGaeESbuM4Tv
	+GVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZFvHkIWxqNNRmnFNvwtSxTKkhknkays1QBv4HnwxZH4=;
	b=pYtWi2PwGho2gpdR6ZCmnaKl9cR9HlRsxrFvaMJpN0ySVoiV7nDzvFOsDDN5jWYubS
	KFvX5mPZ8EpEAi5dY8810QpvG3VgEKU9S+gDGoqoNcX/qVhvhBn6/XL2LvXKWo+12eMX
	CSqcCSG9ry9rq8Iw/BdAUpw4Ba2cjTFSg+P5PTEW56iAXqu2JGIDMrBvJtYLyioXngZv
	RMKL1PW4aJYP8yBx1YxYQS/GAUgOiIJGjVVjucrwQLxZgfgskq7uqAhulwJ4rSoTAyQ2
	+KFnl53wdxLLHoeAegNm12afB1LjdsA9gbREMYs9RkZywb3FWcz8Kj0hU4xwsYREFkAX
	WN+Q==
X-Gm-Message-State: AOUpUlHfBL3aVE4/zM5nuXIF3zCyZQIUmIdcxpsaNdd7iBbkG+qjZlYd
	CFy6R3OlJVTJrxFXHzcjHk5IOivRqBdTl6qJ0/QPtA==
X-Google-Smtp-Source: AAOMgpejOTAshQVLSpCWhshu2e23EX1CIfXlbBuR1tARaSBwNDzjh24Cwd2mFlNypi4tljfHIymJt3/Q2PIZkgc7mw4=
X-Received: by 2002:aca:efd7:: with SMTP id
	n206-v6mr6597653oih.70.1531916489925; 
	Wed, 18 Jul 2018 05:21:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Wed, 18 Jul 2018 05:21:09
	-0700 (PDT)
In-Reply-To: <20180717201021.1640-1-raj.khem@gmail.com>
References: <20180717201021.1640-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 Jul 2018 13:21:09 +0100
Message-ID: <CAJTo0LaufeWeBLdsY1XAt=XU-ifopVm64mqEUDUCiZSbwwCb1w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils: Upgrade to 2.31 release branch
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
X-List-Received-Date: Wed, 18 Jul 2018 12:21:29 -0000
Content-Type: text/plain; charset="UTF-8"

Breaks grub-efi:

DEBUG: Executing shell function do_mkimage
grub-mkimage: error: relocation 0x4 is not implemented yet.

Looks like http://git.savannah.gnu.org/cgit/grub.git/commit/util?id=842c390469e2c2e10b5aa36700324cd3bde25875,
i'll pick that in.

Apart from that though, everything else built so I'll respin with this
grub patch and then we get the selftests...

Ross

