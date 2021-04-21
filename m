Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.3782.1619041758096936957
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 14:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QE3ZO95g;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id e5so14109467wrg.7
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Apr 2021 14:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=7Dnac5DYAoqbOZ33SeOS3CmRIrGL8kAYkq/t4COlTv4=;
        b=QE3ZO95gXf2yYBj+jeG332hq9L8jfXw/KOHnlTMz84m5Pr2HQWeWNTkN8S3mDm4azw
         baym5Kp909z26gbnk8h79V4TNIwxv/PVIQL/ZNPd8zwb4hHdODDQEZxG1KndhjgLOPZn
         6fGartaybx+YYjEj3Y7tA+n+XqexUtgI7OUqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7Dnac5DYAoqbOZ33SeOS3CmRIrGL8kAYkq/t4COlTv4=;
        b=lFchKLAii5WlnyS0lHzA3a5EowwFBvQSERwcFbt2VyQ5jVDKs75W1J7kH/8/uugiAs
         ezmACVD2B1BAz6uv3dTUTN/CfEWXxws0I+XiWgXNKQCSQqVSa09FuI42b6NHOLZinWmP
         l2ZKH/QrHpvJlkTnKEnavwZqLs212j6DjwSRgxALMXXf1W16VqCkZEh2xaklWx6LBZ4X
         n03lDK+MQXBjIT6MgTy8Tt7KbLsIIGrhwy5MkI0cm62izyWoX7ghrEITy7wdDLBhy0Mf
         /4g5d+BZl2ie2Xn8ePaeK2+fJFkmAlf1pc2Z55pPyqL24oq2zL4ryYiHEuR7xn+tpQW2
         3jWw==
X-Gm-Message-State: AOAM530yKThKKUw4kJJmL+rT736KcDtbhCHMcGojzDa+Q8qfmABQ6Ta4
	ewwP8wwzi49fj0vydinG5749eq+Hx7N1ug==
X-Google-Smtp-Source: ABdhPJxodrYIM2cloEh8fbB5NF+QUBTGj8/BILwWFVZ9JjgYp7rV7m2WlQCzhqC321VcOcV/05EEDQ==
X-Received: by 2002:adf:f2cf:: with SMTP id d15mr219086wrp.114.1619041756526;
        Wed, 21 Apr 2021 14:49:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:bd84:c44c:f28b:9534? ([2001:8b0:aba:5f3c:bd84:c44c:f28b:9534])
        by smtp.gmail.com with ESMTPSA id q7sm642466wrr.62.2021.04.21.14.49.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 14:49:16 -0700 (PDT)
Message-ID: <7b8507d3ad187f2ef1f7c4b144475a5622929c2d.camel@linuxfoundation.org>
Subject: Re: [OE-core] Maintainer for hardknott needed
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Apr 2021 22:49:15 +0100
In-Reply-To: <16762408E6D41300.12361@lists.openembedded.org>
References: <16762408E6D41300.12361@lists.openembedded.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-04-15 at 22:04 +0100, Richard Purdie via lists.openembedded.org wrote:
> With the release of hardknott, we're in need of a maintainer for the hardknott 
> stable branch which would be maintained for around the next 7-8 months until
> our April release next year.
> 
> If interested please reach out to me, or I'm sure our past/present stable 
> maintainers would also be happy to answer questions on what is involved.

For reference, I've accepted an offer from Anuj to look after hardknott, 
thanks Anuj!

Cheers,

Richard

