Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.4884.1624701870264279136
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Jun 2021 03:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VmAJUtpE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id a13so13541203wrf.10
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Jun 2021 03:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=riMS3z6xMPp5UnMsOGHwf79BBIg77dMoBBiAp5uhl9M=;
        b=VmAJUtpEc3pUhatv5iCx99kqjoRqObvUs4OY4QbV2U29kNYEEXTZubpg7O1lCM5HfH
         sMsQBubtrWO/1WG3n17ytkhcIWbPpAJXTV8Ftps2VA8ozJ1z6DZnKVBdgDXK0JcnVSDi
         20trvXIXkrL+Tn1kaL8rGAqRpdTtdS0+RJIHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=riMS3z6xMPp5UnMsOGHwf79BBIg77dMoBBiAp5uhl9M=;
        b=j34ecAVakk3HEZABkyjkiuRTDfxNCSkByZC0l1nHXoNA3B1IXLif6nQd8iiHIIvwBD
         lF21Pu115gfKqa45ny/0ssDR2U+tO2JMiqoqWBPRxxSvW8hjQ1co36LnnZJdt7AABEJB
         Ekf5jeMR3GGEEFfMTuEPdqdvymamDupdR59w4O5AHkTxcOY1SE00TQNXZWRpqygdvZ+g
         3tUMEPfKZAbAEjRNtuuAxYEeVFBaM7Hp4uVkvphIpwKw7k3cmqJYdP66MdLIb0VWlSc0
         Zslu09B3E8gXslrqTKHUii02aEw5iUGjRyFMrgct0D+LasjpCFE+5Q2QgyECXAU8p4yb
         KMhw==
X-Gm-Message-State: AOAM530HtHJUh7GGbxvJPqolmo5Enb50j1a3s1erQyIg05kpBomZNnMZ
	bLxl8ZoQAHeINrz53KMjxleyDA==
X-Google-Smtp-Source: ABdhPJyALf6sTw9sWWYqM2JpBGVaWE9NDRhT4Wmz+ZfzI+hqARNsDIEsKUStvFQd4JjEAetpj6bknw==
X-Received: by 2002:a5d:4fd0:: with SMTP id h16mr16641524wrw.302.1624701868741;
        Sat, 26 Jun 2021 03:04:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:2c6f:d408:8eb3:4ab2? ([2001:8b0:aba:5f3c:2c6f:d408:8eb3:4ab2])
        by smtp.gmail.com with ESMTPSA id g7sm5001895wmq.27.2021.06.26.03.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jun 2021 03:04:28 -0700 (PDT)
Message-ID: <b7b05b428677e6d8f39c700ff4ce212a9baa8918.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-check: Add allowlist that is same function of whitelist.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "ito-yuichi@fujitsu.com" <ito-yuichi@fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 26 Jun 2021 11:04:27 +0100
In-Reply-To: <20210623085633.3186982-1-ito-yuichi@fujitsu.com>
References: <20210623085633.3186982-1-ito-yuichi@fujitsu.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-06-23 at 17:56 +0900, ito-yuichi@fujitsu.com wrote:
> The Linux team plan to removed references to racially-charged jargon from
> their code for more neutral and inclusive language.
> So replace use of "whitelist" with "allowlist" in cve-check.
> 
> First, we add CVE_CHECK_ALLOWLIST and it is considered patched as well as
> CVE_CHECK_WHITELIST.
> We plan to replace about other word later and eventualy, replace all
> "whitelist" to "allowlist".
> 
> Signed-off-by: Yuichi Ito <ito-yuichi@fujitsu.com>

The TSC did discuss this and proposed a plan on how we should go about 
addressing these issues:

https://lists.openembedded.org/g/openembedded-architecture/topic/inclusive_language_summary/75821819

I appreciate this patch has good intent but I would really like to
see a wider plan on how we address this rather than changing single 
variables piecemeal. 

For example we may want to standardise on the term "IGNORE" rather than
"ALLOW" or even "FILTER" or "VERIFIED" or something more specific to the meaning
of CVEs and CVE checking.

There is an opportunity to try and make the metadata and variable names
more consistent and understandable but if we just change single things at
a time this opportunity would be missed.

Cheers,

Richard

