Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.2028.1588199621917151734
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 15:33:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e0Bpvgyc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id f13so4445617wrm.13
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 15:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=in5O4i1zbivPTW1vGejCCfSPnhw+aDJF32g+WEWXftI=;
        b=e0Bpvgycj90EM1LkF78dG70ld46bay4zuw5vl/hByCJd1Tx3QfN8D7Aqsuc7Ag8nQh
         JQ75SFDGiYgX3QwcgyZ84xW8T+gTgoUS7nTA6/cJa4OFiJH4fcTXS4HsNrNs5dZx7bHY
         yTyBG7K/V21MvF0gR/cD9CH7N2w6DiImhbYAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=in5O4i1zbivPTW1vGejCCfSPnhw+aDJF32g+WEWXftI=;
        b=s68qG/D+sK2O4jOoN5Us5rAwjOXJBPuFxml9sF03UVFtiT3P7/BQ1AkFakaY1yq88l
         ogad3XPMFUwsskW3EDYmJtL0uGlaKnuqYT1wHElVRMnJKjjpOZNLcELCRMb3/BXDSKAp
         QjqRd2V/cssOcHM+met/VQPDTeQWWefMehvLIR3bhWjaQddWjb7fWhve8aSWTDqyWuK4
         HzXRRjUSMGE7aea2YojbXyhk8L5JlBmaKK99UmMy8aj/fWwTAJoK64T+OjWH25o4E3TX
         7rgKBmn18l/IFqOmC/Xr8UJs76KvbhnlcHPoTn3tqZx2hitVcKc0K01ExImr6Txlfj5s
         mnPQ==
X-Gm-Message-State: AGi0PubTXFAxbas3/CqacE2HQQWXsOsjWCcuI+YLPLyGuWR3JnMcKWnl
	GdKbOzcZtou90t/7ZX/6+nErscwQvsw=
X-Google-Smtp-Source: APiQypKqaL5KRAlKitPnhnqjnxsajnIIHWfiI5pcMM4pgxE1AggvhcjvEmViARpC94CEgwynFiOGKA==
X-Received: by 2002:a5d:4447:: with SMTP id x7mr146404wrr.299.1588199619867;
        Wed, 29 Apr 2020 15:33:39 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id x18sm1032657wrs.11.2020.04.29.15.33.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 15:33:38 -0700 (PDT)
Message-ID: <e22c9872c4a6e0b8d3f25ca7891b587e344114c2.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 16/16] qemuboot.bbclass: don't redefine IMGDEPLOYDIR
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Apr 2020 23:33:37 +0100
In-Reply-To: <e989f74493fc7b551f8c8b8d6b28708234ed1d38.1588175775.git.steve@sakoman.com>
References: <cover.1588175775.git.steve@sakoman.com>
	 <e989f74493fc7b551f8c8b8d6b28708234ed1d38.1588175775.git.steve@sakoman.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-04-29 at 06:11 -1000, Steve Sakoman wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This variable is already defined in image.bbclass and there's not
> need
> to redefine it here.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/classes/qemuboot.bbclass | 1 -
>  1 file changed, 1 deletion(-)

I think this causes a baremetal regression, there is a fix in master.
Whether we therefore want to take a cleanup into stable, not sure.

Cheers,

Richard

