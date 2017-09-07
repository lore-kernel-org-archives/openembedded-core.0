Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id A4A7F72F96
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 14:29:46 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id m9so5030409pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Sep 2017 07:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=umeImqTPFwRCF6aMJF6Fm7nFLb6hQKWHY2mkg6x4ljY=;
	b=ls/UHcjHwRNZ2GIaBGbv71wOLly07WkVx2RAnacO00WJxzGo1nR12NMAm32+k5+HiU
	Xu/3/Z0818lyMTq6iE4ZOgftqIEm8wDgm3CNAIzZX8l3EG9yvgM4BabFvQnnrPWs+Upz
	UtYKBaQ2x+xFhWD+YNmhZs9N9wU74Mn86fcAWHeRmXRNGpCkh0ReLB4vO5zidRa2/GPh
	gI5zRiC4fhu4iI5sGLa0NUaGONwlUaj61ifm8lnNOUrUcmqdqoK27aGJxCvNHwdQceoO
	JTPpGPQXhjNuiLbo/uJLn7sIle5KLimG0hS4rD3cPehKfqBtZc4RkLYAYC4UuvCLStnz
	DRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=umeImqTPFwRCF6aMJF6Fm7nFLb6hQKWHY2mkg6x4ljY=;
	b=ZX7gbf9T85E/KAYI3xVR4Vo3jHXYc0tryCd2BoFl0b/lcU6lCJKegym3vfP8tf39Ef
	Ao+5lncbDHJuIYFCPTXWJB9FSt8vvBVoVNWa90V8X3y/rfcvAyeNgSscrvotFnzqUdnr
	MXk2EvJ+YdqoAz6G6lFL5gCNuKdw0dItsubMRD+fsXA6WjyuJyILId/nN4cUE4gQi/AU
	5B8jPmYx0vwMjhAeGzvYwGvz5MDFhmrFMQZv1FtfQEoSjCogLEhrUz539EZxB5DuSi4H
	4IMFxOu1FLtVJdeOQlMZ5vtqsA3AjvSmR/gijjpByL4hjTH4uJkur3qc3lsXq2NkbmIf
	tz1Q==
X-Gm-Message-State: AHPjjUjdAC3pI9+lhgW9ndqsh9nX2L5pJ/EihOiG490jM3JVwyWwSGfn
	VqZUfxIfMWMoKISr
X-Google-Smtp-Source: ADKCNb6NKW7wP8fsBpX5ifWxn/VaWhopJASU+u2OL+/u83ZYBZ19eiJkBGjI6fL9JzLUaZHA8AkYiw==
X-Received: by 10.99.186.5 with SMTP id k5mr2884195pgf.31.1504794587535;
	Thu, 07 Sep 2017 07:29:47 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:640d:54fc:453c:c17b?
	([2601:202:4001:9ea0:640d:54fc:453c:c17b])
	by smtp.gmail.com with ESMTPSA id
	e13sm3730286pgt.14.2017.09.07.07.29.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Sep 2017 07:29:47 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1504713837.git.Martin.Jansa@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <ecee6720-fdb0-dbd4-106f-bc235f32df9b@gmail.com>
Date: Thu, 7 Sep 2017 07:29:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <cover.1504713837.git.Martin.Jansa@gmail.com>
Subject: Re: [pyro][PATCH 0/3] Backports for pyro
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
X-List-Received-Date: Thu, 07 Sep 2017 14:29:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 09/06/2017 09:09 AM, Martin Jansa wrote:
> All 3 are backports from master.
thanks,

all in pyro
- armin
>
> qemu and nspr change needed small tweak to apply for older version.
>
> qemu change is already backported to morty, which seems wrong that
> it's missing in pyro. (the morty patch also looks a bit differently than
> the version from master, see:
> "qemu: Backport a patch for recent glibc versions" commit in morty)
>
> The build with pyro still doesn't work on hosts with glibc-2.26.
>
> cross-localedef-native/2.25-r0 on host system with glibc-2.26
> is choking on it's own locale_t https://pastebin.com/udCzFA9L
> but more difficult to resolve here when it mixes host's headers
> from glibc-2.26 with glibc-2.25 code.
>
> I'll probably use LOCALE_GENERATION_WITH_CROSS-LOCALEDEF to bypass
> this, but it there is a plan to support Pyro on more recent hosts than
> this should be resolved as well
>
> The following changes since commit 1009498f23ad319825c00ba60a4693d15aada553:
>
>    package.bbclass: Restore functionality to detect RPM dependencies (2017-08-30 23:59:53 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib jansa/pyro-backports
>    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=jansa/pyro-backports
>
> Khem Raj (3):
>    icu: Fix build with glibc 2.26
>    qemu: Replace use of struct ucontext with ucontext_t
>    nspr: Fix build error due to missing stdint.h> include
>
>   ...lace-struct-ucontext-with-ucontext_t-type.patch | 265 +++++++++++++++++++++
>   meta/recipes-devtools/qemu/qemu_2.8.0.bb           |   1 +
>   .../icu/icu/0001-i18n-Drop-include-xlocale.h.patch |  31 +++
>   meta/recipes-support/icu/icu_58.2.bb               |   3 +-
>   ...int.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch |  30 +++
>   meta/recipes-support/nspr/nspr_4.13.1.bb           |   1 +
>   6 files changed, 330 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/qemu/qemu/0001-replace-struct-ucontext-with-ucontext_t-type.patch
>   create mode 100644 meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch
>   create mode 100644 meta/recipes-support/nspr/nspr/0001-include-stdint.h-for-SSIZE_MAX-and-SIZE_MAX-definiti.patch
>


