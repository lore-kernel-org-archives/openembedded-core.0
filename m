Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.619.1616426694146605389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 08:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CCQ6GiW2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id k8so17536420wrc.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Mar 2021 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=41ZK+RZUpgPdT78dvANNhnHpnxxYHFV20TJ1KR0Pk4o=;
        b=CCQ6GiW2jhP36rd6o78fAf7V3Neiq8onlJlgrXSuoebk6aX52HnqVbwi9Cu1L2CeYW
         WF4dWYlDqTTDvjOaKQA+++tbNKc/tWJeJx4L7NrWccDeZls6+G9CvVuhHjaNWdt+zOLO
         3zZZ21PBM4JpDHWltjPmkT9L9brZMWvXoyW/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=41ZK+RZUpgPdT78dvANNhnHpnxxYHFV20TJ1KR0Pk4o=;
        b=fEGXaDiXAPhfd3aaSm0HmJUvja/UlVgTJfdT0jJUFB7Ni3EBfrhlEhdOK2FeF484ka
         mOONg8xxxefS3o8RSkLV53lzU8+ogaoYYtQDN7L2z1pd1TqvHfUVNB4I5XbwoQjdgLNE
         W5quVJfVo6yrtnHCV5rV7edHWO0IifIJbrQ9PLymsmkNSN1mMYX9+0C4VsxdKGmti/Te
         dgKkxAkunomAd7VpWL2P0eCSgdJ6/Hra7412IDfNUUAN255KH3jj4nEYIc/ZcXzbWucV
         M1Olzdxh6pmDOvmj8HGdwYEM7sPhJa7Ak6bGy1cNclPWngT4AxEnGlv3OfHvPgOaA9Gp
         dnFQ==
X-Gm-Message-State: AOAM5315/aYPXzCSL1Oo4dW5rIBZBt0YLKbTUTduZjTpAi1GY5hwtAb9
	oJ1niEPjKGvBC4BuPgbP2EmTwg==
X-Google-Smtp-Source: ABdhPJzIySlZcsivUNCze+IWiTsxAr06S+YnivJOzY6n1DT3PXaZnl2EqmGJjCkfjnUdsR7c07C6qg==
X-Received: by 2002:a5d:4203:: with SMTP id n3mr110665wrq.116.1616426692536;
        Mon, 22 Mar 2021 08:24:52 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e977:53f4:4c09:9e1f? ([2001:8b0:aba:5f3c:e977:53f4:4c09:9e1f])
        by smtp.gmail.com with ESMTPSA id n3sm16851031wmi.7.2021.03.22.08.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 08:24:52 -0700 (PDT)
Message-ID: <d083f9194f73872623f20f81c697e0bff914764a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/2] gettext-minimal: Disable the unnecessary check in iconv.m4
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, "Yu, Mingli"
	 <mingli.yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 22 Mar 2021 15:24:51 +0000
In-Reply-To: <CANNYZj-7gQg41Qpue1ZR3HCBHKQ8veD3TOwbvRYcD5=wv0Pj6A@mail.gmail.com>
References: <166D65C2E097270E.28077@lists.openembedded.org>
	 <20210322075103.9694-1-mingli.yu@windriver.com>
	 <CANNYZj-7gQg41Qpue1ZR3HCBHKQ8veD3TOwbvRYcD5=wv0Pj6A@mail.gmail.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-03-22 at 11:29 +0300, Alexander Kanavin wrote:
> Note that this m4 file is copied verbatim from upstream gettext, and will 
> be again overwritten on next gettext upgrade. You should figure out what’s
> wrong specifically in elfutils tree, and work with elfutils upstream to 
> resolve it.

It's more that there is a silly/pointless macro that breaks native builds for
us, the issue is in gettext.

How about we set the cache value globally for this macro and drop the patch?

Cheers,

Richard

