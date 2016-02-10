Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1B6316072C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 21:52:46 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 71so1555040pfv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 13:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=BFX4l6pG5VSLRyMtjdBqV8wvt+6XcB7IW7a4YKd8jdM=;
	b=b5MYJ8D6bflPB0RFhyXAz0+qpXyMs0UxtBBf0mlzMN+EMak358Ij+OWFiyjml86eWk
	VTyXKJBu4neAtERTQC0ti2F7c/nzlY8100GC4DpD3GqrW3tSiguvCTODta9MfSxQhbx3
	mTvCNCjK24TatgT+P7UKilkbORe2ebUgDZ8dxmqKfufuWJxYcOHCkZxGByqpLKF0SZ3y
	+Kc/z8xLSx+vrVF8RcIDUHoY/iINeQolgZjlG5fZzJ/PEQqoNJW7s/WCFFWkmDkK7PZ9
	6xQF34VnYrp/KCZYGBpTecRR7TdsGojhCzR+lr6PogelV9GzdmwXA93+kcSgRHJ7/Ro8
	llCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=BFX4l6pG5VSLRyMtjdBqV8wvt+6XcB7IW7a4YKd8jdM=;
	b=KgqRU9olSHpV4TIOFqXNuEgQc+D7zLWPLNH2O/6C4WHPkqkrtFG/lazHAc3tq3GJyD
	Bg8LmDsIFMk9/iJo2p+vVfrKvUZ2qrPlc3N7uRCtdBDKZ4+z6JO0NxioCuaEfjsHyzOM
	iAoCKqCjbWzhgkdJt5ZhtgdWUBKOtFLa1bicoQwgQQSBanuAfAw01UGNkwQDGeHDz7t3
	gzrJ3MduQ8qr40RQfhwPjH6lbWFEjWfH/6z+AkhfYj2R6ZvQ7Xm4i3RGV/JQJC+YIk1R
	+bMcx0SElgKbZ2XxUPDz6Xc+PfPhMReetZKR+dnZSAqz6P6+bfzb08wJNoxRKVlE0Nge
	zqBA==
X-Gm-Message-State: AG10YOQT4NLKe1eROitODuj7u2mtlb8WZhD/dH5jwPSwkAukZvayzqazhr1wzdeNwuVftQ==
X-Received: by 10.98.34.198 with SMTP id p67mr61619181pfj.93.1455141167876;
	Wed, 10 Feb 2016 13:52:47 -0800 (PST)
Received: from [10.43.100.29] ([64.2.3.194])
	by smtp.googlemail.com with ESMTPSA id
	wh9sm7376681pab.8.2016.02.10.13.52.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Feb 2016 13:52:46 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
	<850e86b808fa51352203ff92c894eebbb045902a.1455126045.git.raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56BBB12C.3070701@gmail.com>
Date: Wed, 10 Feb 2016 13:52:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <850e86b808fa51352203ff92c894eebbb045902a.1455126045.git.raj.khem@gmail.com>
Subject: Re: [PATCH 4/9] uclibc-ng: Bump up to 1.0.12 release
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
X-List-Received-Date: Wed, 10 Feb 2016 21:52:47 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

This update includes CVE-2016-2224 and CVE-2016-2225

- armin

On 02/10/2016 09:43 AM, Khem Raj wrote:
> Here are changes between 1.0.11 and 1.0.12
> 
> release 1.0.12 - Chimay Brune
> 
> Leonid Lisovskiy (5):
>      libdl: dlopen() mustn't forget RTLD_NODELETE flag
>      tests: Extend OMIT LDFLAGS logic to test binaries too
>      Provide __adjtimex() alias, like glibc.
>      ldso: Fix fail of $ORIGIN expansion in case of RTLD_NOLOAD
>      ldso: Use single rtld_flags interpretation through all the calls
> 
> Waldemar Brodkorb (11):
>      Suppress warning "_GNU_SOURCE" redefined
>      hppa: unbreak toolchain building
>      test: disable tests requiring math headers
>      nios2: allow to build toolchain
>      add exp10() from glibc
>      Do not follow compressed items forever. <<<<---- CVE-2016-2224
>      Make sure to always terminate decoded string <<<<---- CVE-2016-2225
>      add $ORIGIN test-case
>      mips64: fix memcpy, patch from glibc
>      mips: fix clashing symbols
>      bump version for release
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/uclibc/uclibc-git.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
> index 490dfcb..0509a6c 100644
> --- a/meta/recipes-core/uclibc/uclibc-git.inc
> +++ b/meta/recipes-core/uclibc/uclibc-git.inc
> @@ -1,6 +1,6 @@
> -SRCREV = "94493929f674f4410c2743fa3dd82fd37b70c58f"
> +SRCREV = "003b266cbeb370a8eae91dc256197f00798c6f93"
>  
> -PV = "1.0.11+git${SRCPV}"
> +PV = "1.0.12+git${SRCPV}"
>  
>  FILESEXTRAPATHS =. "${FILE_DIRNAME}/uclibc-git:"
>  
> 

