Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web11.58467.1600080173898195040
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 03:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=R4C5wcnY;
 spf=pass (domain: burtonini.com, ip: 209.85.208.193, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f193.google.com with SMTP id w3so18175862ljo.5
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 03:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0bE13n8W0xT+p9gGZf7rlXTDk7x3XlZVZN97yIsxPdo=;
        b=R4C5wcnYfFnVX+Nf1FsaCjtTC7gR6J1M1PVk7R5DLXY/488t/LddAH/swQI1nda+tm
         nToavsigiln6gHt/+vBCcvfXnpnr0vUDE96F42ZpkIi9OoPlhYrI2v9hMs2bPfFTZrfR
         1JjPaRaCPDznHiKMGVm5Qc4B+6wf9e957jxegep4wC4RUIR00eDLUdNm8/J0UcWKV4OY
         n4vbkcrCkWBlkKYomSt+5E8FdsFm3oRz7BjSjK3dajE3Y/YGS7QMK5jaSN27r/kzY03P
         fZSAX0r7aq+To2vkGCtQPQaF0Hucut5ImScpqzfUoohkuAbdn2UQQoi32vxB8qoZ2KCw
         BhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0bE13n8W0xT+p9gGZf7rlXTDk7x3XlZVZN97yIsxPdo=;
        b=BGqdEuNeHLklaTfCC7my/K6nMMfrYFneJpUvQvIaXdgIZKu/f33m6wJLyKiSDAmVpC
         aPqSUKwjeyrmciMMvYnrf8Vn6d04MWT7jm/1GEgBshdfbEa42eP9IYDX/+Xhnt0YNFqK
         JeA9zdCRunUY5zYJp3hH5r/zYfDDMT2xmROJIE8OVKEryk5VahJX2V5rqINk5ahjEKJd
         g0WoZFaL6dmtj4XQKYM/toXCqx1mwhFnfMYEu/5biYrLJGFGMmSrUoEyel4MeqdmwGZV
         lA1myu7KJ4uD1XLO0mhVDp8Amm3mFsDuFFbRRPAK5hZS/mH57B1TwemBM2GlJyjXlZA5
         P2Zw==
X-Gm-Message-State: AOAM531ZNpgeEdFIs+/ecbWWwdZPo9yFPNP2DIF9AKbjOJri2zoqZ9V2
	Dne26/Kg/QvzqbwQHjfcN9dE0Pw/bJZ0H8ZdInlX1w==
X-Google-Smtp-Source: ABdhPJxLRS9U9H1TYvVj6cHzsVxt4/5anM/G/5qIIsPSz2z01Vh6azlNGINzFPoogbTA62EhD59WEtaCbDRmRnNIPSM=
X-Received: by 2002:a05:651c:23c:: with SMTP id z28mr4725586ljn.36.1600080171659;
 Mon, 14 Sep 2020 03:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200914033421.48381-1-chee.yang.lee@intel.com>
In-Reply-To: <20200914033421.48381-1-chee.yang.lee@intel.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 14 Sep 2020 11:42:40 +0100
Message-ID: <CAAnfSTuxVhcA1P_-efXbSL5X5i8_RkP_ruVEoY571pOwhTvdCw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] cve-check: use ALLOWLIST
To: Lee Chee Yang <chee.yang.lee@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sep 2020 at 04:34, Lee Chee Yang <chee.yang.lee@intel.com> wrote:
> use allowlist instead of whitelist.
> Replace CVE_CHECK_PN_WHITELIST with CVE_CHECK_PN_ALLOWLIST.

This is a deprecated variable already, I wouldn't bother changing it.

> Replace CVE_CHECK_WHITELIST with CVE_CHECK_ALLOWLIST.

ALLOWLIST really is a horrible word as this isn't a list of CVEs being
allowed, it's a list of CVEs being not considered.  CVE_CHECK_IGNORE?
CVE_CHECK_EXCLUDE?

I do also think that we should do these variable renames in one go,
instead of piecemeal either side of a release.

Ross
