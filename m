Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.7858.1593773517363094334
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 03:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cnnhTuJG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id z13so32168994wrw.5
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2020 03:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=p7QQIatus9Iv6FlTe7SWXdZP0wHr2NjHdS1l7CEQwgU=;
        b=cnnhTuJGOQx3VE0+RlpN1n10ab3s6NUw/vvAwQzu5GkavFco9omHh2mSxtkZuweYiM
         F2IWHnYhb/DGWSwooGeHkiftYz5WqqKzdxbz3o9jBvYJoby86L0yOb8p18neiIl4heiT
         IEx3aNtKqdPx00lSVtK7Q7A9sXQXddgit/LGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=p7QQIatus9Iv6FlTe7SWXdZP0wHr2NjHdS1l7CEQwgU=;
        b=RKZJ+Ch+8nBYSZghK80RNHXDPMRZgKWyrH6f0k99CQgAEVjskNPUNwtszarKW2TL4q
         yBlItiJTOPQcQ4F6Vuq3oWYs/+fDveJ1Q8JtsN5hGRJw0mfyJ1Eo9fArg4bl9NoI9YgM
         xjVjeCfzdxbqPLzi3haq6MWKBLkowut4/5NVuDOZfIcRr9U/QkCEl8qRO9KHb/9y4vQG
         dVLiPofoVn9MIoW2VFyK2zPMQ1LupT4yfPSMMU+AKobwq23KfHSi8g7vTgkYll8Thf8B
         8HprHpl5jODaigEF8A0vpZ+8EVlm4fXqCeekLtwZo++xeo0IQzUm2KyMYXOK23UuHelK
         mk0A==
X-Gm-Message-State: AOAM530FfH1eO8JLbI3Y28TYrFXZyXHW3LclRJ96dvceMs0XnsDnTi46
	pb9I9ssn+UphOG+A1q5YXVIQseSixVnmBw==
X-Google-Smtp-Source: ABdhPJyRJodZnffV73ai1eTNmq9vba8EKwtY2COgyoy3Wz9P72NdlQa1Fu77keWYKK1H8OASmBrZyw==
X-Received: by 2002:adf:f751:: with SMTP id z17mr37790486wrp.114.1593773515972;
        Fri, 03 Jul 2020 03:51:55 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id u20sm12565307wmm.15.2020.07.03.03.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 03:51:55 -0700 (PDT)
Message-ID: <1cbfc8f17f8b55dcda25cdf78fd8311d43ace9b9.camel@linuxfoundation.org>
Subject: =?UTF-8?B?UmU6IFtPRS1jb3JlXSDinJcgcGF0Y2h0ZXN0OiBmYWlsdXJlIGZvciAiW3YzXSBNb3ZlIHJwbSBtYW5pZmVzdCB0byBpdHMgLi4uIiBhbmQgMiBtb3Jl?=
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 03 Jul 2020 11:51:54 +0100
In-Reply-To: <1593718468896.73516@axis.com>
References: <20200702192906.6301-1-fredrigu@axis.com>
	,<20200702193249.20801.25821@do> <1593718468896.73516@axis.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-07-02 at 19:34 +0000, Fredrik Gustafsson wrote:
> Since I've edited four files, which one should be used as <target>?

A suitable shortlog here would be something like:

lib/oe/{manifest,package_manager/XXX}: Move XXX manifest to...

Cheers,

Richard



