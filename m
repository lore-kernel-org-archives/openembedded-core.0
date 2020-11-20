Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.741.1605893721352805120
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h5ELJrjn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id a186so8286364wme.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 09:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ITsytHrFal1TRtex18AaLFzdMBlcIYBe47u+THvOrTw=;
        b=h5ELJrjn8MrjIQv15hep1woNi76FPEAa3PA1CyAfq7ZNbWDBvgr37voCWHrQxB6LAT
         6MP6vP2Og4k7sYiQTPXxu3Y0w3BURAGddRMyuf3Ge+C+9QbWwZx4/AGOM2s2tbqDGRJh
         GL77/8Hzm5QNfFYnZ64BikdHk7DPRTWs7oXqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ITsytHrFal1TRtex18AaLFzdMBlcIYBe47u+THvOrTw=;
        b=Y5jvP9KoC49Fn2d1QON3Ft6ogU6qetcN4ctHkuTG4SmN+IEdYfngXK8rXEOX8NpAp+
         q8s0wAyDsEXx9ZOmwIKIQyVK5Zd6L/s+Dth7XBUHBLvFqINrNwOV7QUE7GvW9ivyjZFW
         ShlRcO8nydL5UXzpBYzLAdj6dld6agAakztC3Jldd2RE6QOaCC8/9+mfFvQzeNG+lP7O
         1W1GKOjqxg1oTGRJ2rl21xKfnxJZDPk9Q3ST0Tn+3x8WXo+Cmc5U9Oz+pGgY7PHmKuwP
         9+x5pAeG+EQfXp4oamQkkQfXbH+NfMJ0RawftPDIavPWf8EzOfRL/9bVR8uhE31xTfnR
         gu4w==
X-Gm-Message-State: AOAM533lKkl0u+j29ZvbBV7aSiP7iK9XG+uau9oh7HT+AyJXA7ZzMy9u
	oxJL9/1uz1zyt3n79jKPoUiD/T8ccxEGbQ==
X-Google-Smtp-Source: ABdhPJygya+eFhxYDN8gSKmzQuHRgMEomsYmyx2a8Max7on/W/UjbOGJutSscDE7sMsgJweL/xje0w==
X-Received: by 2002:a7b:c8c5:: with SMTP id f5mr10840174wml.174.1605893719933;
        Fri, 20 Nov 2020 09:35:19 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from c.8.b.3.0.6.d.4.9.0.2.b.0.0.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (c.8.b.3.0.6.d.4.9.0.2.b.0.0.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6000:b209:4d60:3b8c])
        by smtp.gmail.com with ESMTPSA id d10sm5760471wro.89.2020.11.20.09.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 09:35:19 -0800 (PST)
Message-ID: <8db9491c541ccc1da36f53d971b04f0ed2277888.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 6/8] python3-pytest: Add recipe
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2020 17:35:18 +0000
In-Reply-To: <20201120172950.1619754-6-raj.khem@gmail.com>
References: <20201120172950.1619754-1-raj.khem@gmail.com>
	 <20201120172950.1619754-6-raj.khem@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-11-20 at 09:29 -0800, Khem Raj wrote:
> +RDEPENDS_${PN}_append_class-target = " \
> +    ${PYTHON_PN}-attrs \
> +    ${PYTHON_PN}-debugger \
> +    ${PYTHON_PN}-doctest \
> +    ${PYTHON_PN}-iniconfig \
> +    ${PYTHON_PN}-json \
> +    ${PYTHON_PN}-pluggy \
> +    ${PYTHON_PN}-py \
> +    ${PYTHON_PN}-setuptools \
> +    ${PYTHON_PN}-six \
> +    ${PYTHON_PN}-atomicwrites \
> +    ${PYTHON_PN}-importlib-metadata \
> +    ${PYTHON_PN}-pathlib2 \
> +    ${PYTHON_PN}-wcwidth \
> +    ${PYTHON_PN}-more-itertools \
> +    ${PYTHON_PN}-packaging \
> +"

Do these exist in OE-Core? I think there are a lot of dependencies
pytest pulls in? I don't think this precludes the move but I'm not sure
the patchset is complete.

Cheers,

Richard

