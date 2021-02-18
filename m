Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.9764.1613666155903559295
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 08:35:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LbgjmHgr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id o82so4367097wme.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 08:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=urWe5ClZyVrCCgPiWgH+Z8ZhHJlK7Nc09IxfyP2vdoI=;
        b=LbgjmHgr91gHIiWwARYqKYrUpwo5Sk6FWPxpsH3yrLZ5m3ownB3kvchypkBNHiqrA/
         tH2U+O6vRGWV5eHZ4zaV4dAV52Bnt2OLvEmsCU1QwlIGp6xqu0bkoEjnw72CPpH4wOgc
         bdm5mvqV5dh3Q0oUKEzSM+QhuBiiANms//zBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=urWe5ClZyVrCCgPiWgH+Z8ZhHJlK7Nc09IxfyP2vdoI=;
        b=E7/sW1NTpPtN/aY3tAaIG2sr2yd0oebO+cq3VUaSPoPd0qENeuXDSNUasaMEUhJido
         DaIno4k4+oF73e+RUzXsu6Yna4rU9mBWix2MsMMaTRNu41KXo0/lvW8/o5dI2ghLA26Z
         I+ZvwvkCcrlz5aYjt4kUB4v5T41otlPF8pU0mEm2Cz49YXoYknDib8QdcHjWxJghIJLq
         wPK4MUUUPRXS1kcm/snsEAOXUXl2Ur/ba1W5WIXneCStfa9HbUw8tTm3PJ90VmgxhV+P
         hqgo0ZqwgHHQ2WBWpCXkId332xU+Uul1C3c3UCN/1NG2Ei9P+eniVO1TS3wyss7b4+YM
         9eXQ==
X-Gm-Message-State: AOAM530HnH2LH/I3bqxOxXOEBaA1CE7TjxmRZbgqz0JpyNCFAxpImyUR
	gIjdXBbEtRyBV9vzOh9mKlOVWw==
X-Google-Smtp-Source: ABdhPJyOxv6hgGMNW2RvKhSQJWDPdSJs2ue7aOWr0tA9nfea06sIGBR6hjYys7RONebpkRRho5nAFA==
X-Received: by 2002:a05:600c:2c50:: with SMTP id r16mr4309041wmg.62.1613666154214;
        Thu, 18 Feb 2021 08:35:54 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7504:d16b:192:2652? ([2001:8b0:aba:5f3c:7504:d16b:192:2652])
        by smtp.gmail.com with ESMTPSA id v11sm10103791wrr.3.2021.02.18.08.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 08:35:53 -0800 (PST)
Message-ID: <daffe2a0221518c5f37419003b2107a440a1f9fa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] iputils: Use STAGING_DIR_NATIVE for setcap detection
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jate Sujjavanich <jatedev@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2021 16:35:53 +0000
In-Reply-To: <20210218001126.39215-1-jatedev@gmail.com>
References: <20210218001126.39215-1-jatedev@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-02-18 at 00:11 +0000, Jate Sujjavanich wrote:
> Search for setcap in STAGING_DIR_NATIVE to avoid host contamination. Add
> DEPENDS for libcap-native to supply this if we select libcap for
> PACKAGECONFIG.

Why does it need setcap-native, isn't the target setcap enough? It seems 
odd that it should need it...

Cheers,

Richard

