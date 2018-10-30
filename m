Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 763A779C6C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 12:13:57 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id e17so11767787itk.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 05:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=16A7X2ac+QiVql47SEJpVlI+8DiwERlL/hjvjAdsZLM=;
	b=O5vr8o3WiB1kmpTa3j2H8ZF9RDY7svwqNBjtcJivwN/jie6MxNwGCWrLZWZNoA51qn
	NynBPfuw97lRJbf9tuwOYGQvANOfrlkHq6FGQ+xF31J+ez4o2fuT9OvtYU8G/VSlJ/eX
	54jGCurQInp+4pRqGznAOfdHeS6vfUzq3Xn63vdy8pOOcWwR5c6jC0/IttKUkBZQk4iT
	zxUoxirjGmIkm6BAGN6b5aKk8zqVOVLmzavKzt8JVduD8eUKmhQNrLoa9iXhUTyWebPA
	ThSd+FF7kLfq94uAji51tyLhlydLAmZuf7OwihuMozq+tNnGOKISFGKOGQf6xfkEcLRx
	qVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=16A7X2ac+QiVql47SEJpVlI+8DiwERlL/hjvjAdsZLM=;
	b=oAs1OXWC72ud/3/YCXyLMWYRDir2ax8ItVFiCbgECDJ1bhDxTkS8Z8VIslMJgE6OD8
	9ZrXAMj8Tkeqao+UQSLvh8SghzefCQap/YUacewQERmCHyiwrhCY5U4uELKWRYejtE10
	aS7CKTk9YhSVr63SVTi371kcl6V/y+4mvvbUsvVejzMIp8VAIsb3CVzrpDlvSmEXr1p6
	yoElRYLLv9XUhnlZi4gkiUGgktzeAnAzkdXexI61IAuGJFmNtZiH1/GdU/dwWpOYD7AT
	wMFL2Tz5SIbix1CEaF/rbI+8sTsksqT6uyi3i5YReu8dV6hFFLvp8geXP7urnB3LyoHU
	dyoA==
X-Gm-Message-State: AGRZ1gJCHobHYtE57D+EC4Z+Zq/ESaqw0lE6VhJE5Ggcakk6dsBfmKMj
	AxxVOWAbA5UEdS191kXSRdAcbCqr/euEVD9/m8H/Rfrd
X-Google-Smtp-Source: AJdET5f2y7n+cIRkqUQUfkKk9OR4Gae96wq+8mxZhyTK4DblRkAGNStnFnWRHk/QgTfg95ekXQDv6KlJ9JPY10fk6J8=
X-Received: by 2002:a24:36d2:: with SMTP id
	l201-v6mr1184298itl.130.1540901638580; 
	Tue, 30 Oct 2018 05:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <1540885980-278826-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1540885980-278826-1-git-send-email-mingli.yu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Oct 2018 12:13:47 +0000
Message-ID: <CAJTo0LYGn-tUcgjwMo1801RARVivebmW=sm-dkzy7hdSbjzQuw@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mtd-utils: Update SRC_URI
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
X-List-Received-Date: Tue, 30 Oct 2018 12:13:57 -0000
Content-Type: text/plain; charset="UTF-8"

The machine is only down temporarily and should be back soon.  I don't
think we should merge this as we'll be reverting shortly.

Ross
On Tue, 30 Oct 2018 at 07:53, <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> The official repo for mtd-utils is git://git.infradead.org/mtd-utils.git,
> however there comes below error:
> $ git ls-remote git://git.infradead.org/mtd-utils.git
> fatal: unable to connect to git.infradead.org:
> git.infradead.org[0: 198.137.202.133]: errno=Connection timed out
> git.infradead.org[1: 2607:7c80:54:e::133]: errno=Network is unreachable
>
> Use the alternative one instead currently.
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  meta/recipes-devtools/mtd/mtd-utils_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> index f53c6c1..b71c997 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> @@ -13,7 +13,7 @@ RDEPENDS_mtd-utils-tests += "bash"
>  PV = "2.0.2+${SRCPV}"
>
>  SRCREV = "bc63d36e39f389c8c17f6a8e9db47f2acc884659"
> -SRC_URI = "git://git.infradead.org/mtd-utils.git \
> +SRC_URI = "git://github.com/sigma-star/mtd-utils.git \
>             file://add-exclusion-to-mkfs-jffs2-git-2.patch \
>             file://0001-Revert-Return-correct-error-number-in-ubi_get_vol_in.patch \
>  "
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

