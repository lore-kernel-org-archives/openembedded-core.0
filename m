Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A70C30658
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 14:12:29 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.25491.1719929542534480782
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 07:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e0Ci7JPK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-36740e64749so2613574f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 07:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719929541; x=1720534341; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1tbL56Ra/f3M1DswKBTOPwYF6hwDhv9oiQwTVBAuz0=;
        b=e0Ci7JPKNv9hNV2xncdTrib5F2wxCfmKEZWvt3ZLb6Fcf7L4Vuuiy51ujFoCyokmT7
         j03BV5VOZ0K5/XzhaVUVLywLgmzj2zZF4lpuoue4KQcH1jlX8gffcGOXu3dxMm+SVwbn
         K3rNeeHS5dlC87UvgFjuHYoKje/nFhZC4zBfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719929541; x=1720534341;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A1tbL56Ra/f3M1DswKBTOPwYF6hwDhv9oiQwTVBAuz0=;
        b=lXmEw6q0Ldz3w4/WpaLgWzBWb7TPTmPtsh45AdhQl0eKJu3oOIjybrrGvPOmDB6+Qk
         2wGkYtTznNQt36yNsTX1B+8Nw1aLEK7sMed9Ix6HarKZ+qLjsdnyDzBGsu+dw2s9vJ3p
         hzVEuK3dCDmEUkmhwuMNm9bsnr97Ac2IWuHjdclSPo0+XXvT9PVIQ6s1s8mcN4t4ioCc
         bHGn2aVtKA0FrTKtp27zMGcJAb60a5jhWxjFzftaLRn13nHSuoFlQ3PDr+5qEGvNrIFE
         7dRH24eJeeU/UUpRFb0HutbKpcE4W7l3sVNejpeX/gAhS0s8NVXhn98+AXgAP4ZeL2B9
         P1pA==
X-Forwarded-Encrypted: i=1; AJvYcCWjK1LUViJrMCTSUAoX4jrvD6lj03yu/+VbkBrFDHRuRpRP2iF2ClbLooVopGx9cOshyXKOO6a94qoEkRrEkq48xvm1dwAYMDSF2vkBfLBU9E6QiGMbCCJs
X-Gm-Message-State: AOJu0YyicOdy4imPxo6Ky2Pc9ctP1E34l1/5cbYlwkg97dW6pSP33AlC
	dMG6anBVzJLAg7O1WnEz+HL+z6X9bGGZZCfzmKdIzdUgswwdYSOcwqqxNPZ1lDSK9tDB+aH4ngf
	T
X-Google-Smtp-Source: AGHT+IEIYIEMO16Z7Uvw7XuJHiwGwUOjDt0slx/MGeDafMj+jvsKpKXC7ebSr6qg6TKARPvl41Itkg==
X-Received: by 2002:a5d:42c3:0:b0:367:8a39:85ce with SMTP id ffacd0b85a97d-3678a398791mr1013015f8f.70.1719929540592;
        Tue, 02 Jul 2024 07:12:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e0e2:4d33:6557:e74f? ([2001:8b0:aba:5f3c:e0e2:4d33:6557:e74f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36789fd7a0esm1540743f8f.104.2024.07.02.07.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 07:12:20 -0700 (PDT)
Message-ID: <5abd4f206842f282995eace0355f5a60d9b5defb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 9/9] rust: Upgrade 1.77.2->1.78.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sundeep.kokkonda@windriver.com, openembedded-core@lists.openembedded.org
Date: Tue, 02 Jul 2024 15:12:19 +0100
In-Reply-To: <13008.1719923827197429081@lists.openembedded.org>
References: 
	<9f5ad0498ee04abc2cdcbfdde1e4db867f741096.camel@linuxfoundation.org>
	 <13008.1719923827197429081@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 14:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201428

On Tue, 2024-07-02 at 05:37 -0700, Sundeep KOKKONDA via
lists.openembedded.org wrote:
> Hello Richard,
>=20
> Thanks for test results. We will look into the failures reported.
> These failures are only in 1.78 (Is the testing done on 1.76 & 1.77)?

I only tested with all patches applied so 1.78.

I guess 1.76/1.77 results would be useful to know where the issues are
introduced but there is obviously more work involved in running those
builds and it takes up time on the infrastructure. Do we need those?

Cheers,

Richard


