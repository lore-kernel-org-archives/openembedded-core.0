Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.13342.1594222525075531045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 08:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h5GFZX7y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id f18so41419027wrs.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2020 08:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=1AubVWUe1HrbEmwMy4KBKigI3hBhYM2eH6JYX3SdR8M=;
        b=h5GFZX7yf5P1q4jSv+F/K4Su0qTh0tVNg0vYUi1JEM2+8iUYE3m/ZvHUHrDBjWofKH
         8ewXNMlcsKGgJufFXvApaA23MEF2vi47hFC3QPi2kwch083Z9pANHzmMt5Wn3Tl4UDPp
         dzFRcFm3gIexaPWTwMp2GavIi/zpPrxyh4Ab8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1AubVWUe1HrbEmwMy4KBKigI3hBhYM2eH6JYX3SdR8M=;
        b=RGaRLW9jnpdpdV0+YPDCj/eTRWF2ZLRURWybp04KX5+WNdA3PyFAwXLpkWpEy7ewk+
         u6AjvPlMlWgXhcKb9/dDgM7LL+cz8gRgcWNwvL1uhcpL6DHnYm0Ud/kB8eVLlhlyCKKb
         7oKR4cODskbvkwynlsmkyn7lu6ssSXTB22GMXwHXQkdgqD9S13209iqPnVfkGzDhqU/M
         b/BV5a3xiiMpgYs+JhpQSYNzUbHodINnx4UytwdLLMNB6wbU0xmMkQmWusv1PtbsLmQr
         GVbpjtwIHGMoF686Ngb7pz4kmJ9hVMcsHO1/tvEOIvZG1lGPgEVgg4umwz0fH2og0gtd
         8NZw==
X-Gm-Message-State: AOAM5302+GfbGdwZffEm9wOvSvq78nq98YQMHx8b0iCOzps9vR5cfvrs
	wNz/vVYjlg15xKGVdmE/GyxwZA==
X-Google-Smtp-Source: ABdhPJzdVj91MsVOacz+xZfbS24xVY/SfLloU3EBHQxusv59c0XGZELzQ8RxoGmlD9x5R2tMr6mmPw==
X-Received: by 2002:adf:fe4b:: with SMTP id m11mr57721689wrs.36.1594222523569;
        Wed, 08 Jul 2020 08:35:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id j15sm446257wrx.69.2020.07.08.08.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 08:35:22 -0700 (PDT)
Message-ID: <4b2516f1c16b7eff3fbedf15083bfc7c06aaad36.camel@linuxfoundation.org>
Subject: Re: [OE-core] Patches are stuck in master-next
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Christian Eggers <ceggers@arri.de>, Adrian Bunk <bunk@stusta.de>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 08 Jul 2020 16:35:21 +0100
In-Reply-To: <18770938.c9i5bXPaRE@n95hx1g2>
References: <5614347.lOV4Wx5bFT@n95hx1g2> <12184874.L5pGue1uWE@n95hx1g2>
	 <20200708142003.GD5419@localhost> <18770938.c9i5bXPaRE@n95hx1g2>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-08 at 17:07 +0200, Christian Eggers wrote:
> From Richard I got no response to the question whether
> potentially every package may be extended for nativesdk/native,
> or these platforms a reserved for packages required for "building".

There needs to be a sensible use case for extending them. It doesn't
come for free and increases parse time for each extension added.

Cheers,

Richard

