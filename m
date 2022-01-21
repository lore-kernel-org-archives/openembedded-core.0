Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80901C433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 11:54:29 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.10759.1642766068615407909
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 03:54:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NrLkrpFD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so9161416wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 03:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=nqTarXzsNw4aCfJsG/XUhH9AAGlPaPK9cIduYKr3+28=;
        b=NrLkrpFD9tarhdikpNkL7TfoS4sLrZGKKdaJSMNcmyJC13V3lQIpkQ4B4T0vucvu7Z
         C7GphIP+1mq0GoI5dE7WVrxV61uAKxIsFxxpQVEG/nNtK069IZjWAHDNJDs7U4ZrCrhe
         hSK5v2PWK+aSFMcFIGXEb+KYJenKnsOCq6HyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nqTarXzsNw4aCfJsG/XUhH9AAGlPaPK9cIduYKr3+28=;
        b=37ODDFUiwG2IegoswOJpSuM4m0/Pp4BbhWitP8z2wq/XQSVQealKZ6uNUbrPuKuIN0
         DW6N9ciExsfkq1cesfUGzmOcPvwvLxPejI+6vGpbCHv0HpnpGuMC5SIajqd32UaUUk0F
         n+Alyg+u07YMEOPo4FddE2FuRdLfhe/lJ+heCT2j/XBh4xUgX5rvHRdKO0PJOLCceWnb
         TXRpeaJxo94EcLuFUCQ0ZF/C5mSyA6VcpyDzGphXzgR7wd8DLQf3AQTgWnSmn81U/RME
         N4dTTAlVJVAw2GonBnI/L+6Ya4FekKmjR8nIlrhMBImIRCb9dyGx3v1pYFi0AItfu2FF
         NQSg==
X-Gm-Message-State: AOAM531S/Yl5O8ieI1jT3OBoG0GfqL9e+iTQb3Y10rp/kea22oqr/kex
	/GOgZ4k0PQpTpoVx8AuOe/hWzw==
X-Google-Smtp-Source: 
 ABdhPJz4SO6dso4oCURbEguqGEeXz6P7AV/j/JaoMWP1v3f5Y6HUHQMuOd0/NLQKQSY2P19kXoUCKA==
X-Received: by 2002:a7b:c841:: with SMTP id c1mr433388wml.42.1642766067131;
        Fri, 21 Jan 2022 03:54:27 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4dc7:4aef:2fda:b7ee?
 ([2001:8b0:aba:5f3c:4dc7:4aef:2fda:b7ee])
        by smtp.gmail.com with ESMTPSA id
 m187sm4753777wme.25.2022.01.21.03.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 03:54:26 -0800 (PST)
Message-ID: 
 <e1dc125b82063e9a778b397ef65aafd89ca3da6e.camel@linuxfoundation.org>
Subject: Re: qemu tests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Valek, Andrej" <andrej.valek@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
Date: Fri, 21 Jan 2022 11:54:26 +0000
In-Reply-To: <ed8f1b5ea65a69ac0d720ab8d54ae095930f3b99.camel@siemens.com>
References: <af147eec110b7964f388fb5f0398042a7310cb90.camel@siemens.com>
	 <8f702dfd93898764fd8eae2e692fa0f5f79639bc.camel@linuxfoundation.org>
	 <ed8f1b5ea65a69ac0d720ab8d54ae095930f3b99.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 11:54:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160821

On Fri, 2022-01-21 at 11:51 +0000, Valek, Andrej wrote:
> Hello Richard,
> 
> Thanks for the response. In other words, take a care about your machine
> by yourself => no other pending questions... ;) .

Only you actually know what your machine can/cannot do and in that regard OE-
Core shows an example. You may want to use real hardware for testimage for
example and in that case qemu wouldn't be useful and the dependency could be
classed as annoying!

It is all a tricky balancing act.

Cheers,

Richard


