Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.31072.1628816966002673755
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Aug 2021 18:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MrQ8YvCC;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id j1so12860526pjv.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Aug 2021 18:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yO2DoZHMCPvZrVI+AwQiGpgyZ/3qyWgSXU+ogsCf/qQ=;
        b=MrQ8YvCCQygBxly1IT+56YlWXyRt0pS/rkwqD1axpJXO2V0VS3GZdCCOfU+MVUus60
         omqr5rQNSFiD3mWYDqLuU0OMr3cahbJU5YKJ+v0w/MB7OGRbW2XrUZDR2JpVj6wU/1xO
         UviPFj5K6rKQHpo8mxrDCYA9K4nmrMQHVaONv4b75YKQojzqu+nzjB0YXNRCAb/I+BHB
         EA88j5s9OOYlbMPx2c+HviqxCRvuz95/LvyCkRUHVHH5Mk14PfEgn4P/1rGMib5XTJib
         9cOKkUDfeBjQJIKiV4rPEPkertktUKueUWWEKdb8EB3VhXkcCreONdzxyKvSUTpAdwLq
         F2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=yO2DoZHMCPvZrVI+AwQiGpgyZ/3qyWgSXU+ogsCf/qQ=;
        b=r9blVu5yH24UlOhDK43cFXXDXu7F5sn4DXqLbm+1af/PG8gbg0rGouaeYBmODevsSh
         siyviC6HKW2NubyH+FjwKTIEMefcU+agowpOZEhOlcnZH4k3Rx7KE9QcZJ2meCXKWywM
         ybT8r9cKVz0Pq91R13ToLqPHRj+0V9yWXu2dBu7pvBS1nMTXWHwUC8k/t4AFcgz1UwFp
         tvfmNc3AAg4toNehTI2mmmp3thJvpoVyCLxtyYqnB/wF33XPweC23Ln2iwACoCgTwuI1
         Osxy0d9ht3Ct2dnEGn4Pw0L0Y1iaKAdL+vZsvVKbsB01zzo2Pi4ZHZfoZKX3cfWAFm6i
         mfgQ==
X-Gm-Message-State: AOAM531gYZAvpijvn4HL7YTe+1pv3hN5gfuY/ETgrVgtgMFBCVWWx7EF
	gUoRxqGRL5sVE1xiJpelO/xlQqwUtRa5YQ==
X-Google-Smtp-Source: ABdhPJwhsSTIoLWmoEAxuKZ+GZHFZdF3KeNuTY0q4BL6+kw5FxA5pDSBQOL2eUMVeXA5njSTsir4vA==
X-Received: by 2002:a17:902:f688:b0:12d:7aa6:1e44 with SMTP id l8-20020a170902f68800b0012d7aa61e44mr4960796plg.8.1628816965154;
        Thu, 12 Aug 2021 18:09:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:c078:a19b:8919:aba? ([2601:646:9200:a0f0:c078:a19b:8919:aba])
        by smtp.gmail.com with ESMTPSA id f10sm5740pjj.31.2021.08.12.18.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 18:09:24 -0700 (PDT)
Subject: Re: [OE-core] ntpsec on OE/YP?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 openembedded-core@lists.openembedded.org
References: <20210809172325.Horde.owcQVJtv5qIGBd0Lr7-Hlyb@crashcourse.ca>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <68574be3-2068-bd3b-31c3-24c9709b5367@gmail.com>
Date: Thu, 12 Aug 2021 18:09:23 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210809172325.Horde.owcQVJtv5qIGBd0Lr7-Hlyb@crashcourse.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 8/9/21 2:23 PM, Robert P. J. Day wrote:
> 
> colleague asks about the state of ntpsec (https://www.ntpsec.org/)
> on OE/YP, a quick search does not show official support of any kind,
> any pointers?
> 

there is no recipe yet, someone need to write one, perhaps I will get to 
it someday

> rday
> 
> 
> 
> 
> 
