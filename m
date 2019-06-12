Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0AB127E71D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 09:33:22 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id m138so9675223ita.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 02:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0aPfejXj+jKCRS0KeVTCnBYsLqP7yMUtqYZ6JZGj/5o=;
	b=jOT9ha6NxPhff1JMJF/7XwxNopMRRrTwtjLL0EprrwBlcGXf8qWid6RXl8H0Xoj7cZ
	XOQKSt/TLSJcLmAictiGz/rnelEhx/43Aa7YYYlT4dlA3a96SCYpa/xI02lo9xnWjs0E
	jW6pL/6HerRy4N6r4t025keVRZS5dl2aI6LxtHPcBpSXx/+j0abPTOHeNi07X0nuALuM
	VVaK6YxGMDYsySkV52oE6tbN798nKESwMVoxvQUF6N65jOuU84yZDBPPK00Jg7SrHXhz
	eMTKi44E5fjEQNYhWUZ7EjKdGP/wnPnNQPluNbO38RQVo3zzI4rGG8RYV94RQYTv0+N6
	ZR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0aPfejXj+jKCRS0KeVTCnBYsLqP7yMUtqYZ6JZGj/5o=;
	b=Ok5pIngvVrkDqOmPr8AQrKKbfuz115relW9YMj4QqhYcrpJiDXsJcV2qKfnR1KUwwu
	6OsoWRRsCPDeHROo8kAYNbSYBVBUKLVrsFMCSccOpX2ZnD+QqecvMb3+kJjq+Y7Bh2SU
	XkLvOysu8QLOmtSWn8rgxPm0RHoD4X/8TO+h14IMe+4QJp6+rfuIanyO9VbzmYCIXc67
	UHXEtEw+DcwQC4zu1kYfhEL5rPPdg2hnwyIB3BpZ8fLyJU8K0zALU0ZXpgK7AOStD6TU
	Hh0XXCCe692BTs1agTFnh6lBN/NEbuhPV/ZMmzN01BzILn/5MO/fvfQnZeJpuWt5IlCU
	Ufgw==
X-Gm-Message-State: APjAAAURXDbqRgTA8RtB8Jv8Zaj+1dYYpF8G24OKMZ1MJ+TRcb2Pbnhw
	Qb5tKBAPVQs07N57qYaxXpoEERqPSWoipAzAimuuVQ==
X-Google-Smtp-Source: APXvYqyKj2TKyJcfVZrpssQd3K4lzOKk0fHpGRRHb9hzo5vu5DHEsRzPNAbx5h/HA20IlzPNPec44Rc1C0NRWxuBvbw=
X-Received: by 2002:a24:c987:: with SMTP id h129mr17567596itg.74.1560332003985;
	Wed, 12 Jun 2019 02:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <1559336914-6411-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1559336914-6411-1-git-send-email-leimaohui@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Jun 2019 10:33:12 +0100
Message-ID: <CAJTo0LYinJhqtqjZkw3+icj44niSTu8CJFyGu2i7oBv9mjyEug@mail.gmail.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][warrior][PATCH] at: Fix a spelling mistake.
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
X-List-Received-Date: Wed, 12 Jun 2019 09:33:23 -0000
Content-Type: text/plain; charset="UTF-8"

You do more than fix a spelling mistake in that commit.  Please
explain the other changes.

Ross

On Wed, 12 Jun 2019 at 04:09, Lei Maohui <leimaohui@cn.fujitsu.com> wrote:
>
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  meta/recipes-extended/at/at/pam.conf.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/at/at/pam.conf.patch b/meta/recipes-extended/at/at/pam.conf.patch
> index c9f337e..38e7fc1 100644
> --- a/meta/recipes-extended/at/at/pam.conf.patch
> +++ b/meta/recipes-extended/at/at/pam.conf.patch
> @@ -24,7 +24,7 @@ index 3674c0a..2f8d586 100644
>  -@include common-auth
>  -@include common-account
>  +auth       include    common-auth
> -+acount     include    common-account
> ++account     include    common-account
>   session    required   pam_loginuid.so
>  -@include common-session-noninteractive
>  +session    include    common-session-noninteractive
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

