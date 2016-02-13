Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3FE607328A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 07:17:55 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id y89so78827687qge.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 23:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=368ZSIA8PZDO/dgjvk5XpFK8ZnNcnam/31HPr1xP/S4=;
	b=g7hRLDmLuM4YmtJYftfIcippgm6mdGqjOKC2SQBytjh1/F+a6HrTRU23wTVW6H8hRD
	kPBPlvrQ1XKVncY3BbSdaRoAi3T+CVYFco760sUU9Fp1hjX1EMq+2W7QCZDGxgqHwYoo
	m6sk4IZ1bnkPIlUtgpCRkZrcDm/qAePprAx4QbZ9FdBWVvlFHiXokxeTEpTrp3sDSI0f
	IPFOP7YS694WLERhnjTR3WbuGic4YIM/QjDKssLXdjrBVsTGmKpoUo8sUhPAtEXx0TiY
	b/Nwwuw3/xuNEmw/gBglIoWVp+RbGbSUBXP4LnWW54wPQCpApT9h3YWQtA9rsF+I+d4F
	gWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=368ZSIA8PZDO/dgjvk5XpFK8ZnNcnam/31HPr1xP/S4=;
	b=dPuNWCGGXx9nf+JxlchhydaDTmz/1MILp8LYwCYFbCAAqMASXyKJyMtQ7wPhCVqnEc
	R53dcrkRpFwuFHCCQcUuOgcwMUJbJbQBkQdlHF3ovit+ReKnHCr3Ro3GTc3cPdlHLth9
	KaMnijHyGf1TNDsw/tn2aew+jGX7/PaOrRRgKtaUPfyj8f1fEWgyWCCKx/zwfDw8acSl
	5l+gyx0JX1M5tPm8pKvHWevPoS/j3GTHRsrdTzgsqvyuxvtK2PPuD8MvVazX1hylFxWi
	RkT5hrUbZuPpxXoBcejCbqW/rBJD/+CRepHwM2ILUZYchqGuLKrB0j6P4Icql/pphvvI
	PqwQ==
X-Gm-Message-State: AG10YOT314SWlkLfG/cI73fgIil/IFGZ8Py9ymeDoZ6w9v//yK6FzZL0NsF3lIT9NPTGhytyeJIVFGGfZnH+0w==
X-Received: by 10.140.167.86 with SMTP id n83mr7280183qhn.41.1455347876255;
	Fri, 12 Feb 2016 23:17:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Fri, 12 Feb 2016 23:17:26 -0800 (PST)
In-Reply-To: <1455325450-22774-1-git-send-email-armccurdy@gmail.com>
References: <1455325450-22774-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Feb 2016 23:17:26 -0800
Message-ID: <CAMKF1spD-gNkrmEP+_UyS8iNdscHD4GK1PjjHJuCQwF3s=68Zg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: Upgrade to tip of tree
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
X-List-Received-Date: Sat, 13 Feb 2016 07:17:56 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 12, 2016 at 5:04 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Includes misc minor bugs fixes:
>
>   0ed932f do not define static_assert macro for pre-C11 compilers
>   692b16d add declarations for utmpname/utmpxname to appropriate headers
>   500c688 fix return value for fread/fwrite when size argument is 0
>   416d1c7 fix line-buffered flush omission for odd usage of putc-family functions
>   5a6e8d0 fix failed write reporting by fwrite in line-buffered mode
>   869a9df remove workaround for broken mips assemblers
>
> The addition of utmpname/utmpxname prototypes fixes a change
> introduced in the previous git snapshot version which broke lxc.
>

I will merge this into my tree and test it out. I had a upgrade patch
but your documentation is better

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index d4413f5..8c54db8 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -3,7 +3,7 @@
>
>  require musl.inc
>
> -SRCREV = "756c8af8589265e99e454fe3adcda1d0bc5e1963"
> +SRCREV = "0ed932f34f11663e6b3ddfa866b1798a5938a3dc"
>
>  PV = "1.1.12+git${SRCPV}"
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

