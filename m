Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6042560AC2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 05:02:14 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id p6so3319530vsj.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 21:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=u31uUTyJNFJrEPKVs4KUnnn/jqZMCDyLPBky4Mc+wfM=;
	b=mWrkBWWncMsEhVymhql0crulgM3bJslaycETxyGP9Q1tG4RYg6IM7E5+kt+uJqmaTO
	+Y0U+6Jv7xt5h4Y07uxWBgaq8A5jWC6p8cP+uUFivnc6mny9iVSdf6pFEXHbs8Nq/rwt
	DUGqIIR+POcefie5Qdwa+ZMnxxLhgstVr7grhMyYij2s/wizZ+Cuj28tpPr45lNlGJqz
	eTGfyA8t/R+lTM8KpxLLb2YWB6+7++3HGspPaP598S1ghXRySJ4uQvBXEjcQ3GJaJdsY
	rcQq6jI3IeBZw839cMYDBwTzaRl2I4+IOZ16L2MvZoGqXDP1Dqmw1bbMMtkfphFtW14r
	NZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=u31uUTyJNFJrEPKVs4KUnnn/jqZMCDyLPBky4Mc+wfM=;
	b=cFRZnGs36wStIqjXPsciz1adJLdGtNWp5waa+XI4rZgp93zF1b34wWDk3HC1NGo5os
	Gj4FqNr98PG16JKHahY2angb6dwfP7K1NXj/gnvH+sWOqVUkjkRGu8CEeeawIX7ATbE3
	rDHMwwOyEKMaOCcU9iJDrjqyyj2g7NiSONUkBxs5Z/cW/gQEZ5xnjHaxN3mNuOg8iDnz
	jMRmRFYPONOEDyyusMoegGu3a/SLJq9STsOKHIjLD2Hqn9Ex3Xnf31g5Fu99JV/2Dohz
	ENZYnLPu7GuH32YPDbYh1R6aevLJ9rW+SRx92zEJ17j2am97Bcg7vKJUjge4DrYOO1in
	wwTA==
X-Gm-Message-State: ANhLgQ2pUMvPsX1MYqADrT45+GjFPFnWKjCzBTdfeSDgIIem//HJv5A6
	6ChglzeQF1ZjudP0zSyKkgWxm3YvkarinrPiTD8=
X-Google-Smtp-Source: ADFU+vsAMMwWenlMJ7PMJzezuUQGZC9mST+pGfkWvQ/aLROKRFmFIVvExymQVltyTXbIgt0+X+uZisEFmROHY09JKjk=
X-Received: by 2002:a05:6102:a10:: with SMTP id
	t16mr4692599vsa.130.1582952534941; 
	Fri, 28 Feb 2020 21:02:14 -0800 (PST)
MIME-Version: 1.0
References: <20200228000437.1848815-1-raj.khem@gmail.com>
In-Reply-To: <20200228000437.1848815-1-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 28 Feb 2020 21:02:03 -0800
Message-ID: <CAJ86T=Xp=_b=VajoJpaWkyRZ5KJOrhUnWWFzF3Oq92-ASzt25A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/4] systemd: Do not force removing resolved from PACKAGECONFIG
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
X-List-Received-Date: Sat, 29 Feb 2020 05:02:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 27, 2020 at 4:04 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> This needs __UAPI_DEF_ETHHDR to be set to 0 which now
> taken care by CFLAGS
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Fix typo in append

Looks like this arrived too late. The v1 patch is already in master.

>  meta/recipes-core/systemd/systemd_244.3.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
> index 5d863410b8..a56a28a189 100644
> --- a/meta/recipes-core/systemd/systemd_244.3.bb
> +++ b/meta/recipes-core/systemd/systemd_244.3.bb
> @@ -98,12 +98,13 @@ PACKAGECONFIG_remove_libc-musl = " \
>      nss \
>      nss-mymachines \
>      nss-resolve \
> -    resolved \
>      smack \
>      sysusers \
>      utmp \
>  "
>
> +CFLAGS_append_libc-musl = " -D__UAPI_DEF_ETHHDR=0"
> +
>  # Use the upstream systemd serial-getty@.service and rely on
>  # systemd-getty-generator instead of using the OE-core specific
>  # systemd-serialgetty.bb - not enabled by default.
> --
> 2.25.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

