Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.39260.1615224827865089169
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 09:33:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CuC6JUM4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id h98so12289810wrh.11
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 09:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=oJgBdznApVdWXMiQC/c8I6IJ7BndBc0D/uOn8xFWWiI=;
        b=CuC6JUM4vIc46j6JrnmFLs1o5eg8VHY/X3pkFZLP8sN4S1ZoJJQDP3HJJBuxvaRs6G
         bdv/TiWFXT/KQKMPz0raK4EaqzaZo2Kel4MRArAQiZ7JfhhwY6M5VbzvNuWqNQS39PII
         FuRgL+eduROddH584VeDCZvXTccRGSlf8H7EA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=oJgBdznApVdWXMiQC/c8I6IJ7BndBc0D/uOn8xFWWiI=;
        b=KKIOeMi+nP7z8bREimWrTWdWGVxyHq1RNi2gpFWuDf39oLFkQ41c7qssJDERG3hYLg
         DmGqMY0f1mrjJVfiQlb+aYaYJ5KCQ95lred4uqM71ATU11qBUH+Si/q3+KxzDz5weYT6
         3DcC790Fffmy9+ny67j60lNh4IJL/RN6kjDcvtQIipfl57wLbHt+uNItd3O98KbQVINQ
         SMUCNFF2faIETw12T8//XPzIVimztHBLZ2/7BIAJzd8f74GF0oeS1dWgYQDXGTVsfuwV
         OflxEydQ2RnMS7QRz7C8HnZlVlh3EoUtzVwI+tsRXIukH9wrQQ0eT1spnHv6yBRnanOC
         SPOw==
X-Gm-Message-State: AOAM532xJyy3918EnQBvp8etQJ7NSaZWSwQ6WX5el+RrAb6PK4tx2Twd
	+5VN9zVyF65o1RgCnlcXq5mOwA==
X-Google-Smtp-Source: ABdhPJzTmTD6buXYIMRTlRDDeKaqHizi6P9/nBcegKnWRY9QVXw3wWMl8KhcW9XbP6iFMyU1imd4wQ==
X-Received: by 2002:a05:6000:1547:: with SMTP id 7mr24065723wry.301.1615224826214;
        Mon, 08 Mar 2021 09:33:46 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:3242:e265:217d:9509? ([2001:8b0:aba:5f3c:3242:e265:217d:9509])
        by smtp.gmail.com with ESMTPSA id v9sm20331924wrn.86.2021.03.08.09.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 09:33:45 -0800 (PST)
Message-ID: <847ee37ec1bc1545e0a13d11c4eeac6358ef3fa8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] scripts/oe-timeout-dd-test.sh: add script
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, Sakib Sajal
	 <sakib.sajal@windriver.com>, openembedded-core@lists.openembedded.org
Date: Mon, 08 Mar 2021 17:33:43 +0000
In-Reply-To: <a8d69435-a6cc-4daf-a22a-cb190c04f781@windriver.com>
References: <20210307205817.5679-1-sakib.sajal@windriver.com>
	 <a8d69435-a6cc-4daf-a22a-cb190c04f781@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-03-08 at 09:50 -0500, Randy MacLeod wrote:
> On 2021-03-07 3:58 p.m., Sakib Sajal wrote:
> > +timeout $1 dd if=/dev/zero of=/tmp/foo bs=1024 count=$2 >/dev/null 2>&1
> > +
> > +if [ $? -ne 0 ]
> > +then
> > +        top -b -n 1
> > +else
> > +        echo "success"
> 
> Do we need this else part? It'll just fill up the logs?
> 
> > +fi
> > +
> 
> What values have you tried and how did that work out?
> On Friday, a build with 100KB and was it .5 seconds and didn't
> see any event exceed the timeout, right? We also ran several builds
> out of a shared local sstate-cache and didn't see any event exceed the 
> timeout, iirc.

It would really help me to have an idea of what we're proposing we configure
on the autobuilder and how to capture the result...

Cheers,

Richard

