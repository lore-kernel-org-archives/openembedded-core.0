Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.1769.1625684195368062934
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 11:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TNmYd5ze;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id i94so4264239wri.4
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 11:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=lx2ykwDRJ/MoLXzEfNWsIqZ3Z3aRQO6ULlh3/PaV7iM=;
        b=TNmYd5zeokYPWzVtnUUOPKXRxEqM5wg5R6iVPj5Y6TxoSN1nE17+2IgpK61FQhzrFw
         dH67Z8OHqgV3UMsfKNjbX6uEIlB9rtcNNHcLWvlNSm4a5cLo28QscbcBcaCMtP/XwG2s
         5wbDy1cXcSpGk5Ur8zpDOJbzI3/vE8G3lVloc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=lx2ykwDRJ/MoLXzEfNWsIqZ3Z3aRQO6ULlh3/PaV7iM=;
        b=Dwlc/jjSrB+o1XR6s1w2pXwFp2PtkkKUNzPoQbovoLa6NVYfTdEGO6SeP8PHojwCMr
         UUOimkGha2d9cryDI3fiBL4HKUoCS6u0f+uDJrqArNdvZg1YcOa/lZmQiBJ3uGtc6Sbt
         ivBv42kDzd+0Pf23pGNO5FBk2tJGpyCtWgWSJQxreELhWN9Ko3QhY1VcLOgvuhd9BDSd
         GJZWmrcSamcdAzmKFCqZZ51dYAO5Nuci5mMytVeHjAjEbhHWIaS5AXyfSg1qYedkRDqn
         dFh7p6lRijIC3IMLKBMRMe+qvXjLikYrWXAI8YxvBKVyf/PaS274ABoIZWb1eq06tpTX
         PLVA==
X-Gm-Message-State: AOAM531pBzps3fC6XVZX2IDi0N3PR1CTBQbt2uH98AT+wN2w4hR1iRKG
	XByKdeo9HuhHD7Cdfq9v1eOxLA==
X-Google-Smtp-Source: ABdhPJxTSC08+P6F6iIcC75pOLBaa1S9CaSiY2nNV59Q2QliNYCccBaLRER9Nj3VNXTKlirqVjm/Nw==
X-Received: by 2002:adf:e385:: with SMTP id e5mr29640746wrm.264.1625684193976;
        Wed, 07 Jul 2021 11:56:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8f67:c2fd:32f6:7bc5? ([2001:8b0:aba:5f3c:8f67:c2fd:32f6:7bc5])
        by smtp.gmail.com with ESMTPSA id w8sm20927475wre.70.2021.07.07.11.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 11:56:33 -0700 (PDT)
Message-ID: <47b04bdc1681e428c9333ff3285de31cc875740e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-setuptools: upgrade 57.0.0 -> 57.1.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Wed, 07 Jul 2021 19:56:32 +0100
In-Reply-To: <CANNYZj8hv+OZvKpYd=azJb7ReSEJKzYxc88dsG-y=hQ5SE3S9w@mail.gmail.com>
References: <1625672669-3918-1-git-send-email-wangmy@fujitsu.com>
	 <1625672669-3918-3-git-send-email-wangmy@fujitsu.com>
	 <CANNYZj8hv+OZvKpYd=azJb7ReSEJKzYxc88dsG-y=hQ5SE3S9w@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-07-07 at 17:49 +0200, Alexander Kanavin wrote:
> Seems like reproducibility.patch can actually be removed, as it was accepted upstream?

Yes, upstream tweaked it slightly and we can drop that patch here.

Cheers,

Richard


