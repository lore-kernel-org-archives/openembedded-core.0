Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.4622.1588672686611538518
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 02:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O+6WIRpF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id u16so1606809wmc.5
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 02:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Vmd0y7iAMfkBrVwSC79UL0hQ77EeZOK2jEB/+yRSx1w=;
        b=O+6WIRpFlYjZpc6gSVAOnPFtJDXbIh9DFxpNAr2tDn1lbwqhX2h92PlvML3MiqKQs0
         3s92yujIumvytr09B7J5E2gdAJq+XvTT3OQ6+B/eKqRoP1g93W7SkJnnBQn2ndbk2Vfd
         c97PXRpIF+X1ssBo1BlcEaKFtUk8hESUZfmSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Vmd0y7iAMfkBrVwSC79UL0hQ77EeZOK2jEB/+yRSx1w=;
        b=gKB3pIIDUxnW7sN0WoGII9FbFZyMohv1TkusGvkSW3fV7iSSLTdl7S+Db5/9oKKgCN
         m3ZK26C5kVJNS7xmn9n1leXzTD39jS5izSUEEwrnTUPxheIUR1jYahfCsOAygUlD0NKG
         MPk85ySNYJ956HoSGpTBSgll8MUs3Nby6jX85UBTEUx9HdSjZPI8jpHJedcG5Ox9VV9x
         CBAVieAVzdA9I0IwcdkZhMFKDNdjhh8iUv2Et46luvYJdevM6uv814XIIK3kwG0C+LWR
         222FrSlq+W0uDHH3Xn3y8QNHMh4vKbnxtU/4cndvC8NZgx0PQzmms3MRiQAOUphV7l81
         eGJg==
X-Gm-Message-State: AGi0PuYfGQObimSwCKPeIgGUbnsnTSLihhq4cCfBhBlWff/kYyP/NiU1
	b/W+gpTu8TTHWQxHZpMAmYKthFKLYes=
X-Google-Smtp-Source: APiQypLdLSNnz81uHfJOzPWey06fdd6Qk+evfQGNnylr5oHBH0V/nGXRaHSbiXQHKQi35paxwveJVg==
X-Received: by 2002:a7b:c931:: with SMTP id h17mr2757296wml.105.1588672684693;
        Tue, 05 May 2020 02:58:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id u74sm3084170wmu.13.2020.05.05.02.58.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 02:58:04 -0700 (PDT)
Message-ID: <0f91729190f8b3c6ad5f07eea053635450a2197b.camel@linuxfoundation.org>
Subject: Re: [OE-core] superfluous usage of "INC_PR" in oe-core?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 05 May 2020 10:58:03 +0100
In-Reply-To: <alpine.LFD.2.21.2005031305110.653691@localhost.localdomain>
References: <alpine.LFD.2.21.2005031305110.653691@localhost.localdomain>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-05-03 at 13:07 -0400, Robert P. J. Day wrote:
>   given my understanding of the rationale for INC_PR, it would seem
> as
> if at least *some* of these assignments are superfluous:
> 
>   recipes-connectivity/connman/connman.inc:INC_PR = "r20"
>   recipes-graphics/xorg-driver/xorg-driver-common.inc:INC_PR = "r21"
>   recipes-graphics/xorg-xserver/xserver-xorg.inc:INC_PR = "r8"
>   recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR = "${INC_PR}.3"
>   recipes-graphics/xorg-font/xorg-font-common.inc:INC_PR = "r2"
>   recipes-graphics/xorg-font/encodings_1.0.5.bb:PR = "${INC_PR}.1"
>   recipes-graphics/xorg-app/xorg-app-common.inc:INC_PR = "r8"
>   recipes-kernel/linux/linux-yocto.inc:INC_PR = "r4"

This is a bit of a historical relic, I've sent a patch to clean it up.

Cheers,

Richard



