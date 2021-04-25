Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.674.1619353025133238578
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 05:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FBkPcBB2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id x7so52927542wrw.10
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Apr 2021 05:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=LORZg9TMsGtjOTzm4nQC7Yj0L5Af7lkI8RrVPyVLko8=;
        b=FBkPcBB2q5QKjhs0H216r9TenESQDu4MMELJMnjURyaBoGnEw3gj9tr/mpt7iOoqIt
         v4hPAaAJUnpDCQ3vF0xy1r+ZJK2BI48Ol8Pk+1x0on7oT90iZ4YqrTdcbf2C5cP/tIY2
         o1GskqV8HdDUubhISZCEWlcaskTwvmqfq3mqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=LORZg9TMsGtjOTzm4nQC7Yj0L5Af7lkI8RrVPyVLko8=;
        b=s1ssw89KcE269x+wQYDFYJYHGKpwNh7IoaJgJTmJvwbOABDhQ6XorW3Fvznp2TUGlV
         UDNzUAy5wFmFlacLNMJQU2c920usgeWmLgT/od0cCmLujbx7YhLxopf1QjoIsOBThs2t
         zv7vBf62LpEO+Wby+urLnebPhXX2t3VvR3kbcFRlIwwjCQ77hSHJBeCZ5KZ3Ve5WRKtP
         xmFOdCyTT1LI/NHJ5ylg0MZtYmFfcoro6L9so3UiktfsHMHaprqEKaYdhGeX7J4Mbs1N
         7ZCIbe2uZQNFbETFnUcdWRcMPbmZFtxEEkBiPWeqxBJYqrBBjPX1yCegQKWMDjiHxyLV
         E7qQ==
X-Gm-Message-State: AOAM53241UvA7Ivo3tKirAcZP/9SQ0Rrc2oPqStbETYBiNMv2AmPUQ+z
	Al3vTo9mhXgT0xxqNOhqoSCnFQ==
X-Google-Smtp-Source: ABdhPJwwI61Q7uk7tAzH4IHbjJ34Q91gCS+ovWvwnYUGNO3GdPoGA/R9tKIPn2D29oPG9CNpjnB9KA==
X-Received: by 2002:adf:dec7:: with SMTP id i7mr2348348wrn.407.1619353023495;
        Sun, 25 Apr 2021 05:17:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:ef93:a2fd:16ef:8c9f? ([2001:8b0:aba:5f3c:ef93:a2fd:16ef:8c9f])
        by smtp.gmail.com with ESMTPSA id i9sm15614201wmg.2.2021.04.25.05.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 05:17:03 -0700 (PDT)
Message-ID: <745364795ead7e1a97b5b278d1b849a232d2f1af.camel@linuxfoundation.org>
Subject: Re: [OE-core] [hardknott][PATCH] rpm: Upgrade to 4.16.1.3
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 25 Apr 2021 13:16:59 +0100
In-Reply-To: <81b76930-4252-5e00-e410-8b5eca1dc4e4@windriver.com>
References: <1678663A5E8DE32D.14065@lists.openembedded.org>
	 <81b76930-4252-5e00-e410-8b5eca1dc4e4@windriver.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2021-04-25 at 15:39 +0800, Yu, Mingli wrote:
> Ping.

Please try and be a little patient, it was sent 48 hours ago on a Friday!

Cheers,

Richard

