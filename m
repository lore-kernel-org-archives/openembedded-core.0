Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8FA0C782E7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 19:51:07 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p17so144506wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 12:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iYNQhhAI8Srh8sYvtHJazuxw2Z3IVZ5fnu6JAZr/ZH0=;
	b=uBdT6SVxpLaqE9GthPtSnORutp3NxcluMUQS4mbH7UelCoyZepJtb+dsvRSYuYQNsk
	6PnxSdejvtajwrdohrQj3+7Qsb7+/ZK/SnUveydZH1NtGOW1n2bkz3UhzindvVWos6Wu
	OSCMDFKMTbFKCp9fNCeRIMAmcuN6b5R4rn4jpyHvp7FTjr2rZne7kGkD/xF4dbj96DTk
	Axa40Wns+qna+bA6MOAGsYWa60R5UvLD77z9kFTttfSgsYAWl554X9YAkMLDNNnerfMZ
	n+kVXclmEPg2C6aWYnVXI6/Xq4W40JRcx1roatYupSqNFKE7Zl29QrQRUZbaP5Q39Hb8
	YN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iYNQhhAI8Srh8sYvtHJazuxw2Z3IVZ5fnu6JAZr/ZH0=;
	b=gRs6w8MqK/PVn0JBzmp1UL564IItJY7/ssa7vDp4p1IBfeIW7/K6DAsMMvBqpW9wDG
	hoSyaYEaWqWtL8ESb+U5edjT/D97nKcKXqHvoZMmbDTU6hfpNsk4rowaLX2qyzsUKdN/
	j/GnaLDgy/bFKy3r9uJMUuCLgfRaifv6jweX1qGUieqQWltLNHh4zEEhkH52KoUZ0TJl
	k8ty6bH1267n/effnIqUG4qAuWOBgxa/0Eq/Kpy1Gn7Iy+Uar3zlJ644V+V2YdOf12tC
	RxWE48cGWdQz7M8f1hvp3ueKL4AuQfZ8ZbaFHTBVEOl4Eq8XEi3NY6POsrpPaakQYgXA
	Ae7w==
X-Gm-Message-State: AHYfb5iVcSW/tZ1tgSeVIUgwpA1Zf8cyIfs3Cy6rX6seIMhqDnMMi51I
	LcIibOH3SMfYWGiIRxgA347T3/UzXg==
X-Received: by 10.28.182.7 with SMTP id g7mr391815wmf.66.1503431468218; Tue,
	22 Aug 2017 12:51:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.169.70 with HTTP; Tue, 22 Aug 2017 12:51:07 -0700 (PDT)
In-Reply-To: <20170822074219.8490-1-jackie.huang@windriver.com>
References: <20170822074219.8490-1-jackie.huang@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 22 Aug 2017 12:51:07 -0700
Message-ID: <CAJ86T=U1Wp8heeowiTNTwQd9vjmbP6AvSFYe8V8UYuSGQrs7Mw@mail.gmail.com>
To: "Huang, Jie (Jackie)" <jackie.huang@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: add python to default PACKAGECONFIG options
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
X-List-Received-Date: Tue, 22 Aug 2017 19:51:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 22, 2017 at 12:42 AM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> We want to provide python libs by default, and some other
> popular Linux distributions like redhat/fedora does the same.

Has something changed? Is there anything in oe-core or meta-oe which
now needs boost python support enabled?

> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/recipes-support/boost/boost.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
> index 4ff70e3..f4ecc10 100644
> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
> @@ -38,7 +38,7 @@ BOOST_LIBS_remove_class-native = " context coroutine"
>  BOOST_LIBS_remove_mips16e = "wave"
>
>  # optional libraries
> -PACKAGECONFIG ??= "locale"
> +PACKAGECONFIG ??= "locale python"
>  PACKAGECONFIG[locale] = ",,icu"
>  PACKAGECONFIG[graph_parallel] = ",,,boost-mpi mpich"
>  PACKAGECONFIG[mpi] = ",,mpich"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

