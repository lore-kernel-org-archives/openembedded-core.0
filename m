Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.19426.1584830529918138888
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2020 15:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OgXj7omi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id f130so9124994wmf.4
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2020 15:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=wn0Ui/LV4/MXZ106qzI9toR9hi2kub0ytzcx63lB9cM=;
        b=OgXj7omi/ma5Sf/NnAg/gjKirpJuiQdim6qEpwQX1RX51AiVgAI0RZFdbVb0e2/sP/
         q+PHiSyao55CHSOAjbI3uoIyu8q6zOxPGakPO5ETTqSs8+l5/z8i1o3y0G79wLeD58qO
         Rk0tczIreGeiL9fePTfu7TCm+W+3P/PtQxwco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wn0Ui/LV4/MXZ106qzI9toR9hi2kub0ytzcx63lB9cM=;
        b=rsYUyOSM2nk0OKHoRI5bYFHAtfedwaPWRNJTnSQQO/EyHvlxyQdJ5XZdS+ixiwaaSD
         0S5RtQkVs957rGGnAKtx7ASwIPcLjz+BMB1m3OdxKeMXgRae8XCQ7ojUqA4mSCEFsmTU
         r/fI5Av+ASLjjJ4YVyf2FjvCHchKQMYtqhpYzyQzJn63JOcET7mo1+U1ryb3Fb8+cPsj
         f0K74n0hUtmvCs5jJA87E+TVDqMtAKWvHpZRRNHW9BXPp+EwYISP20HHvdkoapaP14BG
         x1n3dy4NK5qqb5vgx4NQqmea/3/bD6huWNBMLnXD9BBnV3bQieW+cqt7Af12XPCUIGlq
         Quyg==
X-Gm-Message-State: ANhLgQ07k6xYf78SxsDfoieMIi2O98vkfHZRU+1XvH6atj8XLeC4+ALB
	4N7GgDDUryqIYEM1qMaNEqW96Q==
X-Google-Smtp-Source: ADFU+vvZR/0wPaE1rOpbqaIc/nqJeARDPL32nkeqgu2sk08qvjXD5fhXWwyzTIpr6pOGwfRVKazVzQ==
X-Received: by 2002:a7b:c844:: with SMTP id c4mr11445357wml.122.1584830528387;
        Sat, 21 Mar 2020 15:42:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id v10sm14019076wml.44.2020.03.21.15.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2020 15:42:07 -0700 (PDT)
Message-ID: <15d9baae6da1ce9093a184a08b1c3cfd14dbe140.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2 2/2] wayland: Fix wayland-scanner missing from SDK
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Tom Hochstein <tom.hochstein@nxp.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 21 Mar 2020 22:42:06 +0000
In-Reply-To: <1764300b-ff3d-ff62-29ba-47d428734f47@gmail.com>
References: <20200321052650.24220-1-tom.hochstein@nxp.com>
	 <20200321052650.24220-2-tom.hochstein@nxp.com>
	 <1764300b-ff3d-ff62-29ba-47d428734f47@gmail.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-03-21 at 14:57 -0700, Khem Raj wrote:
> 
> On 3/20/20 10:26 PM, Tom Hochstein wrote:
> > The FILES variable was customized to package wayland-scanner
> > in the -dev package. However, this is only correct for the
> > target package and causes wayland-scanner to be missing from
> > the SDK.
> > 
> > Fix the nativesdk packaging by properly limiting the
> > wayland-scanner -dev packaging to the target.
> > 
> 
> Perhaps it should be packaged into a separate package like
> wayland-tools or somesuch. It does not belong to -dev package
> 
> Then perhaps nativesdk-packagegroup-sdk-host.bb should be adjusted
> to include nativesdk-wayland-tools as well.

I have to admit I much prefer this to the current approach...

Cheers,

Richard

