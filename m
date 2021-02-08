Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web09.481.1612808272769696059
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 10:17:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=sxe/X38+;
 spf=pass (domain: konsulko.com, ip: 209.85.222.173, mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f173.google.com with SMTP id r77so15342803qka.12
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 10:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=vNdHGkdh0MlPBf1fJ8YAsV6cQ/rkAnoAGlcxOmGY2/A=;
        b=sxe/X38+0jQcpquPST//tJ0xgf169kUkr1JOJHeQ3T4fsyMH4vFElGxQZEWD/U8hPf
         JdK+8Ks2ppEYBtx/kBQq+Z0ZauHF0nxWP+K5AuDrOgiNcqJaFSMXNfhHggGQ7U+5pHtA
         QZU8yvY3nKJNkrEPnEAhDQiRhQiDshPpM1cGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=vNdHGkdh0MlPBf1fJ8YAsV6cQ/rkAnoAGlcxOmGY2/A=;
        b=X84U90p6dSkhZUND3+e3B2t4xjjRenZxlEi8fRPN8Wu1ERdPSF+xZ+of+4LL/L1XB6
         Oco12YsWG5H2HWoEd7AAvraM9WhXVLWZRZXGLGlmtRIoOM/BgfeeYTdzx8LVOq2lWZ+6
         LluYxciUus6st27oEcKzDshERZs+W2oDejBWCpcnvpIPlH3XhqRfAorUslR4vKfWimNa
         Toz/ZTDO3bG9PhXfZs4CDoVDijMjyrfH/kY8vHicf8mrxwsEFQRSQd+qUtc8DAyf+fmA
         fi+Zm4XfXYKT8PoIaPN1HR/3fAqf0RhbVVFu7CsAAJw9NjYZhs5wgzt4ED2FCVYEd5KS
         4J+w==
X-Gm-Message-State: AOAM530aOnUPvldq8+cuo+MPtNFBHpKbHAEMb+q4/4ykwMLsXH9mJCRP
	4jRueKce/JvYG5voe9TzU8g6fQ==
X-Google-Smtp-Source: ABdhPJy3Vzc/dZuvrfon3uMdAsP+fAWpteMVa++7FqTUlj9lngm5QwPmwNhGNlBeNIZEM+g+zY7eEg==
X-Received: by 2002:a37:b982:: with SMTP id j124mr18999823qkf.1.1612808271942;
        Mon, 08 Feb 2021 10:17:51 -0800 (PST)
Return-Path: <scott.murray@konsulko.com>
Received: from godzilla (198-84-179-103.cpe.teksavvy.com. [198.84.179.103])
        by smtp.gmail.com with ESMTPSA id f8sm14690245qth.6.2021.02.08.10.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 10:17:51 -0800 (PST)
Date: Mon, 8 Feb 2021 13:17:49 -0500 (EST)
From: "Scott Murray" <scott.murray@konsulko.com>
To: saloni <saloni.jain@kpit.com>
cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Subject: Re: [OE-core] [poky][master][dunfell][gatesgarth][PATCH] strace: Whitelisted CVE-2000-0006
In-Reply-To: <1612718724-23317-1-git-send-email-Saloni.Jain@kpit.com>
Message-ID: <d1f9582-c499-87d9-a2a7-a5d6647f4dfa@spiteful.org>
References: <1612718724-23317-1-git-send-email-Saloni.Jain@kpit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 7 Feb 2021, saloni wrote:

> CVE-2000-0006 is not a valid bug number nor an alias to a bug
> and no remedy for the CVE is available till now. Hence, can be
> marked whitelisted.
>
> Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
> ---
>  meta/recipes-devtools/strace/strace_5.10.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/strace/strace_5.10.bb b/meta/recipes-devtools/strace/strace_5.10.bb
> index 22572fb..87d1a9c 100644
> --- a/meta/recipes-devtools/strace/strace_5.10.bb
> +++ b/meta/recipes-devtools/strace/strace_5.10.bb
> @@ -15,6 +15,9 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
>             file://uintptr_t.patch \
>             file://0001-strace-fix-reproducibilty-issues.patch \
>             "
> +#CVE-2000-0006 is not a valid bug number nor an alias to a bug, hence whitelisted.
> +CVE_CHECK_WHITELIST += "CVE-2000-0006"
> +
>  SRC_URI[sha256sum] = "fe3982ea4cd9aeb3b4ba35f6279f0b577a37175d3282be24b9a5537b56b8f01c"
>
>  inherit autotools ptest
> --
> 2.7.4

It's not clear to me what you mean by "not a valid bug number"?  It has
NIST and Mitre entries and is a valid CVE.  AFAICT the reason it has been
mostly ignored by distributions is that the architecture of ptrace means
it is not fixable, exploiting it seems involved, and doing so remotely
likely requires chaining off of another exploit.  Full mitigation
requires disabling the use of ptrace (e.g. with SELinux or the YAMA LSM
that is specifically for that).  Since OE does not provide that level of
mitigation in oe-core at present, IMO it seems not entirely ideal to
whitelist it without at least more details in the description.

Scott
