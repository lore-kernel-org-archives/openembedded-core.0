Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7FE9C75400
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 15:03:40 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id a39-v6so781012pla.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2018 08:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tnr+1jaUM3oqip5Kcw1sbP/XhlnAIGUhWmcT/QIkl8w=;
	b=MyewGxQZHsZU7XFY76+L01Ic0dRdeuxy7hdJZD2rSA6N2FgZZmYMvj4AFD85vQtmyb
	Oth6Q/A4IdpKNOEmnKsBCE6dg6ofD1NWEATweVx35+/LoRoVOLQxYhQ+vtluO/ZuWX+K
	m6dYAE1uKxqC59H3AflL9Tzdupo/xuWEctItPgYtTdrXAh0frsE7elf5VUs5OBcz5/bM
	qzht4gbOGyDY/9SpEM8wWaV+gGUSvnX+b8j/jjfDY8kwEKo/5B3THGFSTfqbMKFpJ3na
	AcfIix3dDiDXqcH49GN103fM+F8Up/CLRnvvl0/X5rivaFZpcVpg6aZlx6zZMJJqvvUi
	3oBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tnr+1jaUM3oqip5Kcw1sbP/XhlnAIGUhWmcT/QIkl8w=;
	b=cUdz9755Prwe/J0g8it+dltcO893JUAGdRZK+5oj4DiBM0dkkS3B+iL69ToA6xV/5k
	2baeQ0ceW/3qcBdu57NG4glOS4oI4xyMNs0CTNtjRkT+b44wZYBdWdrM7iIeL9sHsqrQ
	HrAK/2rx4JM/TnahHq7AcKd6lOGXh4E5GJB3PMa6SEpK+XjjRCCgNYkqmEVFOQlOrIj6
	FcFZjBv7PHOVNzfhvVOKTyAnnW7hsb49zBKOq4WjDQBfFYPAon3+sN9xU77FWWgjf3C8
	036XFOnAHc85VCziPGy1B0NHPoCSoKPniqZoIFI8YmYcIoTv9B9+A8TIj7y4F1DfVER6
	lXMA==
X-Gm-Message-State: AElRT7EQNFRCj3Q185EAw2vcGTwC4ooVkvqk2EuQkr0HZ37ddQloQUb6
	wF5AYu3KV1v56J5lEj5qUSJP6vULd9534pRZgqs=
X-Google-Smtp-Source: AIpwx48/oGDnZZWQY+c/EhQRuAIvSmPGaeW7CIpua38YP0E+fYb/3zMCU3zHWQhWad3eUvvfF2nAsnfC4z2T1nOpbLc=
X-Received: by 2002:a17:902:158b:: with SMTP id
	m11-v6mr27621485pla.300.1523027021089; 
	Fri, 06 Apr 2018 08:03:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.166.131 with HTTP; Fri, 6 Apr 2018 08:03:10 -0700 (PDT)
In-Reply-To: <20180406125354.21247-1-charles-antoine.couret@essensium.com>
References: <20180406125354.21247-1-charles-antoine.couret@essensium.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Apr 2018 08:03:10 -0700
Message-ID: <CAMKF1srQLn+7YKX0AeE00Y+r=7PC4R7cFUjGNm9wjEa0kVr8gA@mail.gmail.com>
To: Charles-Antoine Couret <charles-antoine.couret@essensium.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Split glibc and libcrypt
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
X-List-Received-Date: Fri, 06 Apr 2018 15:03:40 -0000
Content-Type: text/plain; charset="UTF-8"

this series is ok. Although dont like the fact its not upstream yet
but it reduces glibc baggage for future.

On Fri, Apr 6, 2018 at 5:53 AM, Charles-Antoine Couret
<charles-antoine.couret@essensium.com> wrote:
> Fedora 28 is introducing a breaking change where glibc and libcrypt are split.
> libcrypt is now provided by libxcrypt as external library. It is backwards compatible,
> but not the converse.
>
> Currently Poky could not be compiled with Fedora 28 and the official yocto-uninative.
> The purpose of these changes is to split glibc and libcrypt to use libxcrypt only to generate the SDK
> and the uninative tarball. With that, all distros are able to build Poky with official uninative.
>
> The time to glibc to apply this change upstream.
>
> Charles-Antoine Couret (2):
>   glibc: split glibc and libcrypt
>   perl: add patch to solve libcrypt incompatibility
>
>  meta/recipes-core/glibc/glibc-package.inc     |   1 +
>  .../0031-nativesdk-deprecate-libcrypt.patch   | 418 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.27.bb         |   1 +
>  .../recipes-core/libxcrypt/libxcrypt_4.0.0.bb |  24 +
>  meta/recipes-core/meta/uninative-tarball.bb   |   1 +
>  .../perl/perl-native_5.24.1.bb                |   1 +
>  .../perl-5.26.1-guard_old_libcrypt_fix.patch  |  27 ++
>  meta/recipes-devtools/perl/perl_5.24.1.bb     |   1 +
>  8 files changed, 474 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0031-nativesdk-deprecate-libcrypt.patch
>  create mode 100644 meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
>  create mode 100644 meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old_libcrypt_fix.patch
>
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

