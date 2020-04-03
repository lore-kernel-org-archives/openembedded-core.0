Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.13577.1585927594542959163
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 08:26:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YrfW27to;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id w10so9045741wrm.4
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 08:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=BZOx7fsrI5n92myHbLrKwlinH4gEHuqAngSIn29rcL8=;
        b=YrfW27toKJ3cV9nTing/vcIVy7QKpsfH16yCpPBavDVNWIdLSUi5/nmILi4BQqQ3MQ
         lm0Gw0bOqV+67+N2XTKNIqZXg1bBwjerDESG2EnlxefacHIvXH/kIzj0yBX0ep0sNSqv
         U+HxbXmLbuW5xylmRLdY8GfmqAFeregkCgU/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BZOx7fsrI5n92myHbLrKwlinH4gEHuqAngSIn29rcL8=;
        b=bgBQWsS1aR++wTuqEcg2UB9Fh63t0g7RakbBmDGsQdRth2x7uVsxAPqZB5MwQfj9yL
         MwYUgY/HaodtFaWyv8nHClHkrIPyVhzhITElYiz3gL8lIcjhHA+M7KMoPg/+ItB0q1sH
         VEpMhpYAGVMhxWB7iGlxczLqvDZL3WfMVc42OzhfQGMnvfhZ/MZ8VvNzH+CskscxteUe
         9HMAfIKayv7PWOEAkT07UedIkBuAays0OmGaDBk/etXRvUJDFdVO0nnitQtFnvYuTx3J
         IyHn8UWY//7Eg8kq5p+Ux6cYNgAH/59nOB6Kqp/WA6f24WtEh0nq+epkshlQvNgPt/sj
         uqfg==
X-Gm-Message-State: AGi0PuZyj7PMYCc6GV5zHpx0yWN2GRGIEmnmEXx4eQX44ISmV43rr+sz
	Unh0P4mVsa8z+Vm/Aof8k0H2BQ==
X-Google-Smtp-Source: APiQypLESoKMqZJzcs/MThIRZG7IvozFNRdFawsJL+SEPFCXGiw3Q51VVHpzNC3BvjctoDMEU1eagQ==
X-Received: by 2002:adf:9022:: with SMTP id h31mr9430283wrh.223.1585927593044;
        Fri, 03 Apr 2020 08:26:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id d7sm12195501wrr.77.2020.04.03.08.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 08:26:32 -0700 (PDT)
Message-ID: <dee2e56432928c971eb0f1512f5945d6af846b89.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] icu: Add knobs to generate a subset of ICU data
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Wouter Meek <w.meek@metrological.com>
Date: Fri, 03 Apr 2020 16:26:30 +0100
In-Reply-To: <20200403015350.1002891-1-raj.khem@gmail.com>
References: <20200403015350.1002891-1-raj.khem@gmail.com>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-04-02 at 18:53 -0700, Khem Raj wrote:
> Recent versions of ICU (64+) provides a tool for configuring ICU
> locale data file with finer granularity [1]
> 
> Default generated size for libicudata.so.66.1 is ~27M, which is quite
> large for embedded systems and all of them may not even need all
> locale
> data.
> 
> This patch calls the icudata buildtool during configure on the
> icudata
> and utilizes a filter called 'filter.json` ( empty by default) to
> create the data, default behavior should remain same but someone can
> add a filter.json in own layer to configure this data, e.g.

Nice idea, fails on ppc:

https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/411

Cheers,

Richard

