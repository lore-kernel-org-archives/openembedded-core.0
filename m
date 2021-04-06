Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.1058.1617744726349974645
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Apr 2021 14:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OHXNUrK1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id g18-20020a7bc4d20000b0290116042cfdd8so81076wmk.4
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Apr 2021 14:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=2uudBYQuGWUHm5bOyGogfGCfFdf/n0Wp/sNERSgIT2w=;
        b=OHXNUrK1eLI3SNB25/+Gy3uHqt0Qh8u+2xwEH3Y6bT8f7zGhdYPK5QwO8mgzGqlLsS
         uf4oefFV0FZan6cVrsKNuI8FOfMAUtijx38UiIQuHzaLzXZUBqALmRQk1S/eK3oqHPb8
         B+P9QybeFbWj0W6icxtnLzcoXSktXsgaMnlFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2uudBYQuGWUHm5bOyGogfGCfFdf/n0Wp/sNERSgIT2w=;
        b=tzNbOGd35R0FLtPCi0eMqzQW6cOVvY1/Ut6/4CsRLesli8RHY13elposS5LI77RehG
         Mz4P/Wi3VoEiBACr2w7ukHmDBezF3DSwt/icaMjNg5WkzPnyCYpzfNkGwoMiUODD3bck
         TcbeRNcf9IHEdQ+eu0sbeFaGy2RAkygbZBO1SrDcqnZm9uj1ajJkPQII34XvcWJhwrbU
         EnJHgQzJ/pH6gVcXxB8/D1m2s0TSbod40xVdF5gHb6C39TRro/5sd+5f8MqufNFyw3w1
         bony7Ld+T/jgRSnFEpWk7eO+NnHtgZrVVEU62dUD/X5GYeRR9MaATkedjFr+Wb6oAasr
         pAOA==
X-Gm-Message-State: AOAM532h/lXaJnI5FgJL8HntDURMP/afChiJL6pfPKq6BlJCxcTlSBsF
	WveAY7L7Qazn2aI4P4NU+TjN1Q==
X-Google-Smtp-Source: ABdhPJxadLyIEbvVLKGnBT7ya0a409huFuWKIhJrgELFJDijVo7nZlP4ZYWFdGd4Wo6w7b9g9e8ftQ==
X-Received: by 2002:a05:600c:204a:: with SMTP id p10mr19277wmg.184.1617744724831;
        Tue, 06 Apr 2021 14:32:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:82e4:10af:e1ba:c8de? ([2001:8b0:aba:5f3c:82e4:10af:e1ba:c8de])
        by smtp.gmail.com with ESMTPSA id a8sm15014159wro.19.2021.04.06.14.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 14:32:04 -0700 (PDT)
Message-ID: <b898e20b1a2cd22cedab37f55130eb27b0aa79fe.camel@linuxfoundation.org>
Subject: Re: [OE-core] style question about assigning to FILES_${PN}
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 06 Apr 2021 22:32:03 +0100
In-Reply-To: <fc9c437f-3698-74e8-5684-7e768f1e5790@crashcourse.ca>
References: <fc9c437f-3698-74e8-5684-7e768f1e5790@crashcourse.ca>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-04-06 at 12:28 -0400, Robert P. J. Day wrote:
>   i've seen a number of recipes bounce around between these variations
> of adding an entire directory to a package's files:
> 
>   FILES_${PN} = "dir"
>   FILES_${PN} = "dir/"
>   FILES_${PN} = "dir/*"
> 
> first, i'm assuming all of the above mean exactly the same thing, yes?

I don't think they do mean the same thing, no. I think some patch
all files in a directory and some match recursively.

Cheers,

Richard

