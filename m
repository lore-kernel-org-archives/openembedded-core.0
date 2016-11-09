Return-Path: <fathi.boudra@linaro.org>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id BD1CD6007A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 14:41:29 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id p190so312317942wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2016 06:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=psaJQ5juhnPrIbvjinsfh8fRPzXD+CxVHvgT0DF5G5s=;
	b=XaVkmsATmtqf46eMAsY9uz92INAJQKOpiJk7ocrm56+g5IeoaX+8gXxOeneqa4jmS0
	23UB37X+BXZPGTgwt/1Utc5QbSj0+hqA3n/WvL704xJgpG3m4S+OkEcRkrR5AovouIoO
	6kT3Urgp7oWYAwJkumW+WQPmgZcMQPYOJfybA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=psaJQ5juhnPrIbvjinsfh8fRPzXD+CxVHvgT0DF5G5s=;
	b=a/JU2h6vRSLb/4GLXppb0L0DAuHeaE0V1k+XQws9EP4W9LrAQBQukfKIlRsm+nkwzJ
	miCAENCLJeC1/A4uhDcmTvhsKCEZyuDtKsfZKHAmXJBd+UP3JiUdBymwNq8vENr7fAbn
	AaJYCBEbE/MTztQB0TafvFBAfKiiW+GwdNBG5GdfJOOvLAHs9Pp6WjpTruXO31J2Wdz2
	B7QRMCXT09ymqnfGNLbzHN5sjK3Yt2chXvs0Qyj/Z9tuu+lVtIonsFO/wJ+WzmNjceNi
	hM7BJkRu7wbns+7DAWfFx+hDjqmJAbPA1ldkRQaZEJFcryjKN+gEgRZCx2b/R/nqovF8
	q9bw==
X-Gm-Message-State: ABUngve+gZmejIbHE2xIpxzwPhkNmLScL+Nr9rjUYkWF9aht3K4rP5jqTJ6YiNYwreMT7sv9+B/zYQJolG2fTjX/
X-Received: by 10.28.130.66 with SMTP id e63mr651251wmd.39.1478702490777; Wed,
	09 Nov 2016 06:41:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.211.65 with HTTP; Wed, 9 Nov 2016 06:41:30 -0800 (PST)
In-Reply-To: <CAJTo0LZhZi+hgbUvd87E413nEOKP3g5uGY2eqZB5yX2ydHZKGA@mail.gmail.com>
References: <20161108135457.13249-1-fathi.boudra@linaro.org>
	<CAJTo0LZhZi+hgbUvd87E413nEOKP3g5uGY2eqZB5yX2ydHZKGA@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Wed, 9 Nov 2016 16:41:30 +0200
Message-ID: <CAGNsrLACnGpM2t_0s00kzvdpkHLsB57KEcLRwmy8wJ5r83dnsw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: upgrade from 1.11.1 to 1.12.0
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
X-List-Received-Date: Wed, 09 Nov 2016 14:41:30 -0000
Content-Type: text/plain; charset=UTF-8

On 9 November 2016 at 14:15, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 8 November 2016 at 13:54, Fathi Boudra <fathi.boudra@linaro.org> wrote:
>>
>>  FILES_${PN}-xwayland = "${libdir}/${BPN}/xwayland.so"
>
>
> Because you didn't fix this patch the weston-xwayland package is never
> built, buildhistory is huge and core-image-weston with X11 enabled doesn't
> build.

I'll spin a v2 with Jussi suggested split.

