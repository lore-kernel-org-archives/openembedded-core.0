Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web09.10481.1605798239077643866
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 07:03:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HmgFBC5R;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.43, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f43.google.com with SMTP id cq7so6156457edb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 07:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=myby1PxLVpcpfxzKPNI4YPiWSwGC8siZTA8mWn31mTg=;
        b=HmgFBC5ReHXUe1B7yr2JFxQpbwrP9OZT8FSPUIl7e7lQw3oMbDZ4eqThiokhEz35UN
         yi7lclBv8NSSAPcUTi3zPTKE2hA1e1NYFMw99th3p+8pJ3q1xXCWQ9xdecog8imJynJ8
         U5OarJ16bEu/G6Ym+UNYZsWS1s4fVD2M7GlmfoGMapeV+tGccP38nLjp5biycc3xMF/b
         UD13Ns2A6ih6osPkbOUU1s5Ac1BtIIHCEXjQyFqGhifXZPHtq6EZfqo3brbGlEWBfT+h
         5PJdPpMExuYoVLXwq9+o0cM9DDvW4Dbjrx8j69nTKG3eVQ+QxiPXJt8xd8dO/2Q9a5ot
         ZEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=myby1PxLVpcpfxzKPNI4YPiWSwGC8siZTA8mWn31mTg=;
        b=Rrl7/XfRz3xoXV6hD1rHVDU7CqlMCgQWMydkzBmi0xvc4mMc1SYRBhxz0m7Sex3iIB
         UDlQPi1Vz1KcSBrDayE23AZCbpciaVOL3hd245hfpIxg7Dq3bCe57L0ZYTeQV4szaJUs
         pEXlcXB+h5wDiL/TbHGGx42AURjk3nK2dwg2FvjluKEXy/Hcax8kzZVO9cqvQUL0Ao/8
         VtYQFBi8Eo3aWv0nkvqKORD6NBWnumbK7iFGRiEQ6kXkGBKEV7wnEzN1czAJBV2gWBb0
         ts0k7ARx0aZWVoHfzMWofS+5WRmnnkii7tqSLeZ1HyX4lq5YSk0xOiVcUpx2AsqakpSH
         ut5w==
X-Gm-Message-State: AOAM531nTsfg8vODSfbLyjWP0AJqSqizWpxBUv6bBkZJGAvD2z/AXius
	WeAQy+aLgWj6jwyEuBZ1Ys4fPA5F6A63W5PVUmz/Qw==
X-Google-Smtp-Source: ABdhPJwzZ2ybbJ+1tyvsmsTWkGOHu8BqqTueq9x+G/9KgWUWkoJhqCiNSMLCmgt8l/3ORMbR3I15fswTqyzXbWqpoAI=
X-Received: by 2002:a05:6402:3d9:: with SMTP id t25mr31321193edw.338.1605798237500;
 Thu, 19 Nov 2020 07:03:57 -0800 (PST)
MIME-Version: 1.0
References: <20201119103813.2726273-1-ross.burton@arm.com> <20201119103813.2726273-2-ross.burton@arm.com>
In-Reply-To: <20201119103813.2726273-2-ross.burton@arm.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 19 Nov 2020 05:03:46 -1000
Message-ID: <CAOSpxdabzQb6ivRAjTSrePVUJUm35VvhSKWqwJjKyPVez7hPmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/5] python3: add CVE-2007-4559 to whitelist
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Is this also suitable for dunfell?

Steve

On Thu, Nov 19, 2020 at 12:38 AM Ross Burton <ross@burtonini.com> wrote:
>
> This issue describes expected behaviour, do not use tarfile with
> untrusted data.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/python/python3_3.9.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3_3.9.0.bb b/meta/recipes-devtools/python/python3_3.9.0.bb
> index 8fe60ea0160..86077bb1ca8 100644
> --- a/meta/recipes-devtools/python/python3_3.9.0.bb
> +++ b/meta/recipes-devtools/python/python3_3.9.0.bb
> @@ -45,6 +45,8 @@ UPSTREAM_CHECK_URI = "https://www.python.org/downloads/source/"
>
>  CVE_PRODUCT = "python"
>
> +# Upstream consider this expected behaviour
> +CVE_CHECK_WHITELIST += "CVE-2007-4559"
>  # This is not exploitable when glibc has CVE-2016-10739 fixed.
>  CVE_CHECK_WHITELIST += "CVE-2019-18348"
>
> --
> 2.25.1
>
>
> 
>
