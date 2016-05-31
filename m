Return-Path: <rm.santos.caldas@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8740077195
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 10:53:54 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q62so31434186wmg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 03:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=1SsTsk2axq9dkJwZt3QOJbiyXNzRVtMBfZvJtDgJcFM=;
	b=IUM9gH2Y/JtPrg9/KmpgXDFTKz9cSVrpGx8dNfDqBTDcXdtOYq++xFYiji8aKTpt5m
	TaZL6hO4wp2xvH6ccozEHu0zAMuKQ8234D6XrVEfUh9RAoWGsvh1rIMMiEv4vZBjhm4N
	9obhi9EaMVT4UivSBkik0zob5dSO3LGAHz4sNf5k6HlSrtoXf1wLAsKlsqAUdr1YGWeS
	dHYp9jcASBLKPKlwdZEsLZtp4WOKavtrddf6+Vrrawe6+8UvNe62fBaK9Kw7GUaGHqh1
	KGkE+h+S1AD0QKZmAuZPfXcb5Uf/EZnuPwMnfoSqLlXxYjmYryfBxmMjYneI7XVHQ44/
	NZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=1SsTsk2axq9dkJwZt3QOJbiyXNzRVtMBfZvJtDgJcFM=;
	b=T0lMd9VNbvJ04IFmqYnWL6cHa0//y51y1ds7WAhL4PkNzxLM8jdcP4gRcFPV6lb0QI
	ttB+KWDb71wNcV/jpM1kx2JRnqG79wliR7cPe1pr7KinrL0onvhg24m+b/SSz5qfRXSW
	MFfcyMssQxeyY8JQ/xT6Q4YTWa8vX5f1nyd6JZyKOpZbdjgYmcb/hy+evPt8FG/IcK40
	KYT0LR73dcDSwEKgzGMgpEbl4vLJiKSvzzJ2ddaZjMc41O7/Q7lzU53Twf5PNRJf7/Pf
	vyC5Skod/mqToTZAFOyP3qcN8GfHdbQTxmpShc4rEiYYKJlmRJiiFhCEOt5ZLezBobmI
	6dnw==
X-Gm-Message-State: ALyK8tInauAiscEwp/LiDYWdr8iePcRADEfeoF+sPJ0C9bWedlM0i0HmrzYOFnQwR2W2/rifXgFdHu+iGRaiYw==
MIME-Version: 1.0
X-Received: by 10.28.54.20 with SMTP id d20mr16469288wma.12.1464692035059;
	Tue, 31 May 2016 03:53:55 -0700 (PDT)
Received: by 10.194.81.105 with HTTP; Tue, 31 May 2016 03:53:55 -0700 (PDT)
In-Reply-To: <20160531105035.7284-1-rm.santos.caldas@gmail.com>
References: <20160531105035.7284-1-rm.santos.caldas@gmail.com>
Date: Tue, 31 May 2016 11:53:55 +0100
Message-ID: <CA+21M5CNo9kBZ_DUGNkYbS=9Rokc5ccs=_Dgf6UNfJ06z-CYtA@mail.gmail.com>
From: Renato Caldas <rm.santos.caldas@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [jethro][PATCH] perl: reorder tar arguments in do_install_ptest()
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
X-List-Received-Date: Tue, 31 May 2016 10:53:55 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I just received a request to submit this patch to jethro, as some
people are still dependent on that version of yocto.

Cheers,
  Renato

2016-05-31 11:50 GMT+01:00 Renato Caldas <rm.santos.caldas@gmail.com>:
> On some distributions tar requires the FILE argument to be the last, and
> the existing order was causing the subsequent --exclude options to be dropped.
>
> Fixes [YOCTO #9673].
>
> Signed-off-by: Renato Caldas <rm.santos.caldas@gmail.com>
> ---
>  meta/recipes-devtools/perl/perl-ptest.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
> index 948ea7c..66c5355 100644
> --- a/meta/recipes-devtools/perl/perl-ptest.inc
> +++ b/meta/recipes-devtools/perl/perl-ptest.inc
> @@ -7,8 +7,8 @@ do_install_ptest () {
>         mkdir -p ${D}${PTEST_PATH}
>         sed -e "s:\/opt:\/usr:" -i Porting/add-package.pl
>         sed -e "s:\/local\/gnu\/:\/:" -i hints/cxux.sh
> -       tar -cf - * --exclude \*.o --exclude libperl.so --exclude Makefile --exclude makefile --exclude hostperl \
> -               --exclude miniperl --exclude generate_uudmap --exclude patches | ( cd ${D}${PTEST_PATH} && tar -xf - )
> +       tar -cf - --exclude \*.o --exclude libperl.so --exclude Makefile --exclude makefile --exclude hostperl \
> +               --exclude miniperl --exclude generate_uudmap --exclude patches * | ( cd ${D}${PTEST_PATH} && tar -xf - )
>
>         sed -i -e "s,${D},,g" \
>                -e "s,--sysroot=${STAGING_DIR_HOST},,g" \
> --
> 2.8.3
>

