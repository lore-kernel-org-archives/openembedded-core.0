Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id A6FA2793CF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 19:42:05 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id p129-v6so12162049ite.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 12:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ex0b6iSxtPkSL3IVOZS6ZD53sTkGHQX9a2k/38Iai0Q=;
	b=iBRKQHq647Nvv2w8S6abbVgIbMw/J14izo2iC0bgaHzffbi4iI2ddqHRyWTcUfCR0f
	iK/NuBoOM3niWfIQ8RAQzwhnr2uoAX/A+6wqHZCk9hunLDFa400DkN4l/9fnM4v1JHiI
	qe5wWLhxw2VgJ/mP3JLK8IYvifbbfvRFfkylh6mAFIhOTMg0UkQIWHFN+q7c4ASxH4jZ
	BM5TaxuLEE4s04i65msmR+/hHp1wD4LhSyzGiZ4nkneT1Ar4m0UbnZRw4rGsamzGSHwe
	d5DKt6q7GcMUM0Hj40eZMZm19hMQIc31eWlYYFgygetP8ipgwuNY08ZwfkJPnkQnH15m
	F/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ex0b6iSxtPkSL3IVOZS6ZD53sTkGHQX9a2k/38Iai0Q=;
	b=L1DYTep6wDbsQhI2f6C53YjZvmtGlLHuAdGeAgZOfIZvm98BSbKnOOuTNFBvGaX+Kd
	o9yMFUaCUxCBskYQYgPcmvB+NW8ZixJZg1zjBhKxT135vv6ZGRWMoC4SjWfAOQ98pi2C
	MKUY22BNYIHNcjnDw4Y6Y9JiKKArTCw5b2WZt60azgLfcDsgHuvOkb0zFo18L2hyFIfj
	lZf28dLPP9nfN99hygX9iItJHAhfD+zkpzzMToDCK2Z/3Z8ZmU/VUCCdriQuNkbAgA91
	uHktOyUkS0mhqIg9Ep9Xn3Ioq6WalxaWMBxiDJoyRFoDd0tQoxFuawAIh+H4Zh1vX2KX
	GdyA==
X-Gm-Message-State: ABuFfoip/k3ieAA7g33bkzVQcaAsXze6jldF09nuzK7Rqsv9Bb/QMSal
	gi4IKLVHK0bdRnfIuULKheM=
X-Google-Smtp-Source: ACcGV63njN3NAuApQKv26MT//eJ2M5N2a9hH1iJ5v/gH5P2/9A/NJ5KD2oi94KAdG/+KlxgWjS9Yag==
X-Received: by 2002:a02:c7d1:: with SMTP id s17-v6mr347608jao.27.1537818126382;
	Mon, 24 Sep 2018 12:42:06 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	y23-v6sm3310798itc.0.2018.09.24.12.42.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 24 Sep 2018 12:42:05 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <b78abf64ec5be37dce3db8f290b312b9bda0ee1c.camel@gmail.com>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
	openembedded-core@lists.openembedded.org, akuster808@gmail.com
Date: Mon, 24 Sep 2018 14:42:05 -0500
In-Reply-To: <20180711113856.7518-1-rasmus.villemoes@prevas.dk>
References: <20180711113856.7518-1-rasmus.villemoes@prevas.dk>
X-Mailer: Evolution 3.28.3 (3.28.3-1.fc28) 
Mime-Version: 1.0
Cc: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>
Subject: Re: [RFC PATCH] package.bbclass: improve -dbg and -src package ordering
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
X-List-Received-Date: Mon, 24 Sep 2018 19:42:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This bug also affect sumo.

Armin, would you be able to you backport it please?

Thanks.

On Wed, 2018-07-11 at 13:38 +0200, Rasmus Villemoes wrote:
> nativesdk-gpgme fails package_qa when setting
> PACKAGE_DEBUG_SPLIT_STYLE
> = "debug-with-srcpkg".
> 
> ERROR: nativesdk-gpgme-1.10.0-r0 do_package_qa: QA Issue: non debug
> package contains .debug directory: nativesdk-python3-gpg path
> /work/x86_64-nativesdk-oesdk-linux/nativesdk-gpgme/1.10.0-
> r0/packages-split/nativesdk-python3-gpg/usr/local/oecore-
> x86_64/sysroots/x86_64-oesdk-linux/usr/lib/python3.5/site-
> packages/gpg/.debug/_gpgme.cpython-35m-x86_64-linux-gnu.so [debug-
> files]
> 
> This turns out to be because the automatic moving of the -dbg package
> to
> the beginning of the package list is disabled in that case, so the
> python3-gpg packages that the recipe prepends to PACKAGES ends up
> before
> the -dbg package.
> 
> It's not clear why the "and not split_source_package" was added when
> debug-with-srcpkg was introduced. Presumably the intention was to
> prevent the -dbg package to end up before the -src package, which we
> of
> course need to. But at the same time, we still need -dbg packages to
> end
> up before all other packages.
> 
> Using list.insert(0, ...) also means that if there happens to more
> than
> one -dbg package, their relative ordering gets inverted in the new
> list.
> 
> This tries to fix these issues by sorting the packages by (priority,
> original position), where priority is 10 for -src, 30 for -dbg and 50
> for everything else. That guarantees that packages of the same "type"
> preserve their relative ordering, while also ensuring that -dbg
> always
> preceed other packages. This scheme is also quite extensible, and,
> should the need arise, one could even expose the priorities as a knob
> the recipe author could use to ensure specific orderings of packages
> instead of the somewhat fragile and coarse-grained method of "prepend
> or
> append, and ensure you do that in a proper order".
> 
> Probably the autodebug condition needs to stay, but I think the
> split_source_package condition in the preceding elif should be
> removed,
> so that that logic applies to all packages called -src, not just the
> one
> we might have created a few lines above.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>  meta/classes/package.bbclass | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass
> b/meta/classes/package.bbclass
> index 8276046369..72b9c66c3b 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1151,21 +1151,22 @@ python populate_packages () {
>  
>      # Sanity check PACKAGES for duplicates
>      # Sanity should be moved to sanity.bbclass once we have the
> infrastructure
> -    package_list = []
> +    package_dict = {}
>  
> -    for pkg in packages.split():
> -        if pkg in package_list:
> +    for i, pkg in enumerate(packages.split()):
> +        if pkg in package_dict:
>              msg = "%s is listed in PACKAGES multiple times, this
> leads to packaging errors." % pkg
>              package_qa_handle_error("packages-list", msg, d)
>          # If debug-with-srcpkg mode is enabled then the src package
> will have
>          # priority over dbg package when assigning the files.
>          # This allows src package to include source files and remove
> them from dbg.
>          elif split_source_package and pkg.endswith("-src"):
> -            package_list.insert(0, pkg)
> -        elif autodebug and pkg.endswith("-dbg") and not
> split_source_package:
> -            package_list.insert(0, pkg)
> +            package_dict[pkg] = (10, i)
> +        elif autodebug and pkg.endswith("-dbg"):
> +            package_dict[pkg] = (30, i)
>          else:
> -            package_list.append(pkg)
> +            package_dict[pkg] = (50, i)
> +    package_list = sorted(package_dict.keys(), key=package_dict.get)
>      d.setVar('PACKAGES', ' '.join(package_list))
>      pkgdest = d.getVar('PKGDEST')
>  
> -- 
> 2.16.4
> 
-- 
Joshua Watt <JPEWhacker@gmail.com>

