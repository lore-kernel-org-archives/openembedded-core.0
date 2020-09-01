Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.10442.1598958432863481788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 04:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IFZB0AMJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id b79so725060wmb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 04:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=QdQbAHZX5cC/FCkBlQSONiCq82wvM4dsaqqAMouMg7w=;
        b=IFZB0AMJmtsTuwYXz+e3K640Qoblh5QjsUCpZb0Zq3jc17b7NNHa3ekv7qC4QBLFyX
         40Se+bhRzKjysdu+f6jKy5Y5tJ751D36GBs57cW1c8XzTcaIBiy7i1dGSm/0DS27+BSb
         XDALmXzD4ZCYAac2oYfebfYZDTehPOQvbDjMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=QdQbAHZX5cC/FCkBlQSONiCq82wvM4dsaqqAMouMg7w=;
        b=X59vqGgKI+2AJIXWeSX/65eRD/5w3aOnfQJSAlSkrigGa29mQYBf+Tcyy+B2M9evI2
         PNeVKsdhW4sNK/1GQwPAm4pDTTIIhjFTIkvOJ03FcpSaTvXYXxFo78dpcvF5CicClF1w
         xssqqG1PqWodi8NQAKRYgz/VF6K9r/x6RkPjOB/ul9h2WA7PJhKcPW+5brjSoYgSFD4W
         mGQhGwiUCuHfN2Ld0uIkD7KxFpkGzXoVrHmLKnMo5QjZ6nF8RKE5FsnTY2+ooFAkeDTb
         s1e6y7G9QiGFgNMYsFyf0bgjzTQrm6Uo5m1Q/Q0osuzN6reA16NAjILi8awk6POdgoq6
         TnIw==
X-Gm-Message-State: AOAM533o1+I4lp7mxpa5r5f8HmkP3ggCAG4dXsasL5BPOXYR3abeasUC
	dAX/GoRMfX4cHgDEHmVWPFQ8tVIrqd9xNtcT
X-Google-Smtp-Source: ABdhPJw0m2r5UcSpOoOpdM12t/9YI61kcdiutgjdnmRSl1wR8K1DELTcHSmSq0fXyRQ5kcYEbRbmuQ==
X-Received: by 2002:a1c:e917:: with SMTP id q23mr1195560wmc.125.1598958431354;
        Tue, 01 Sep 2020 04:07:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.d.2.7.a.9.f.9.6.8.f.0.2.a.5.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.d.2.7.a.9.f.9.6.8.f.0.2.a.5.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:d5a2:f86:9f9a:72df])
        by smtp.gmail.com with ESMTPSA id k12sm1782164wrn.39.2020.09.01.04.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 04:07:10 -0700 (PDT)
Message-ID: <19d9787f362e8ee4460964768ca9b5f093bd4f0f.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 00/25] Patch review
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 01 Sep 2020 12:07:10 +0100
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Steve,

On Sun, 2020-08-30 at 08:15 -1000, Steve Sakoman wrote:
> Please review this next set of patches for dunfell and have comments
> back by end of day Tuesday.

A few of these (e.g. devtool, RPROVIDES, kernel fragments) are what I'd
consider slightly riskier patches which only really just made master.
I'm not sure if we want to give a little extra time for some of those
in master before we backport?

Cheers,

Richard


