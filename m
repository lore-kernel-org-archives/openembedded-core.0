Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.15050.1613595152007492936
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 12:52:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NNY3Evv7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id v62so5067862wmg.4
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 12:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=odvPJiIFCxjeR1HmVf4bKbyfTkHWNyqvlLeGbplJVYU=;
        b=NNY3Evv7v9+/cnNMHvA0pdgD2JrBqAhWeJkEbtprjWD6f6Lfy1JsXdnTlhC8GMqLNL
         DvOXfr38INWG7c/7xMEfw5qG+6pD1hxMoSKVUeGkcdnBWZbYjcyFB4GIx9wOAvAkAtQO
         KDOBPz9V7oLf4c47CVyeQtg91hQUuwqVJhRtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=odvPJiIFCxjeR1HmVf4bKbyfTkHWNyqvlLeGbplJVYU=;
        b=FFSXkT09ov6pKmvZ5vK4EMU5DtpOvFscNNTJDLcSSPajwdHI/leCgLTUYxFiUDeyv9
         gieZThm16lTK+fA5RueVAVXsgqx5ztUt8RW2GJcquADZUg13VAqoI9+eK6L3m+DmmDkG
         +kihGcI45z4frNLgYrRYACYBzk8nMGNOFO7TIcEzW6/zJIxMBCmSb9KEys3T1EsjRORg
         FI5E/nKSEoT9B8mrmFA46HZhulG0ufNn+zPLni7RbuKY9Xlv/7++2OXxgcZgDlRoXGgn
         Qu9iAcKjzToHvg8/zT5aHJoNC84TQKGsfKfisYbhfywsPZ3vJ8ws1SjX23m21vEa31zo
         R8LQ==
X-Gm-Message-State: AOAM530VatCNGRJwdS92+J9MQZ9fvVJ7jSVol7dXvLO0Z5o3MG8/rRne
	rslM7a2/7SCskZjwNn0mjpl29g==
X-Google-Smtp-Source: ABdhPJxnrNRWY7GikXqgntpV53ze2ZjkQK0D9bIfdiRZIGiLd9IJw14DFWbieGN/F3gpO90pPtR9mw==
X-Received: by 2002:a1c:5419:: with SMTP id i25mr622276wmb.166.1613595150378;
        Wed, 17 Feb 2021 12:52:30 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7504:d16b:192:2652? ([2001:8b0:aba:5f3c:7504:d16b:192:2652])
        by smtp.gmail.com with ESMTPSA id f8sm5422655wrp.65.2021.02.17.12.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 12:52:30 -0800 (PST)
Message-ID: <cee9e2a364cb99e7cf2fa9ec024e58adf345780b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] qemu: Refresh mmap fixes patch status/content
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Feb 2021 20:52:28 +0000
In-Reply-To: <CAMKF1sr5ez1-Ty67OeiPNvbYJq4ipjPuFEmSV51GPeEG8yDutA@mail.gmail.com>
References: <20210216190600.2038009-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1spnShJ96Xo+Laj4-aCUEXizKWAMkgO+P1Fq=kTmLX2A0A@mail.gmail.com>
	 <cc0164c7eb45418117aca6b948116acc941ba464.camel@linuxfoundation.org>
	 <CAMKF1sr5ez1-Ty67OeiPNvbYJq4ipjPuFEmSV51GPeEG8yDutA@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-02-17 at 12:49 -0800, Khem Raj wrote:
> I am always on master next and rebasing my branch onto it often sometimes 
> multiple times a day I am trying latest master-next and let’s see what happens 

So was an effective revert of the qemu patch in there or not?

Perhaps test with the current master-next and see if that is ok?

Cheers,

Richard





