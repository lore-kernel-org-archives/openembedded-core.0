Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.12150.1589462720019716823
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 06:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=chBFFoFi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id l11so4115989wru.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 06:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=i4+c8qpt5MEb+ScZjNrCSVlQgLMlNc6Ya3HlRRSBxgU=;
        b=chBFFoFilyaW48ntagJv0ydOs0GUtXoNk3EnsI7BozzpAoxSTTJhQHz41yjOrFg+kr
         RzVZfXeB/b6w3IbK45ccE0f7EgS9DE/WsK6LWLBWR5/cD/xrblB6uHnRxpPm78dKS77V
         DxiDcmkeZROnMjzP1AMYTme8XYcyd0I8jhiJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=i4+c8qpt5MEb+ScZjNrCSVlQgLMlNc6Ya3HlRRSBxgU=;
        b=WuDmxBXZVUbbsJYHkcI3p9g/lt53ZCNrt7icUdKE1SQC37xXFA8HtY/ZmkwfZ0xC98
         iX6wECWK1Bu1H+b817vBMaqbrpQ9ynMXw+vxV06zI1+SXwASDUnQAMZJQuUeANJSw9uw
         yuXFuaed3S4NYi6T8hkUMGGOpm/a8rZSEnXoQODzxkazD61SR+l/mS7z+YJRDhydNqFg
         VvMe+9d7aGu/YGZNgSin9WMta2ZEp5kFDpW8+dRcvSEQ5w+atqEFIPIT7neQlKoWj1UB
         1Ji7OB7qUe5ZRgiUkPzAntrf7OuoErdJKdQiIAIaU6GBPXG8etagFWl/dF0bZ3fNJ4yR
         eavQ==
X-Gm-Message-State: AOAM533SBqsdc0nCLdLyPN9EmY9koLRe1df2NLO87zmSRHNQyFuMx63i
	iRNILfcr6lL9gx04NtcIFHKg6g==
X-Google-Smtp-Source: ABdhPJysrVqdBd5O5cuGb1YEPI1mDIt6IkQrdGAbIbGKMr59GyIizngSARJ/j0ptaXc7QGmF44+MOw==
X-Received: by 2002:a5d:46cf:: with SMTP id g15mr5915722wrs.276.1589462718213;
        Thu, 14 May 2020 06:25:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id r9sm22935451wmg.47.2020.05.14.06.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 06:25:17 -0700 (PDT)
Message-ID: <0ac05dbfb0e205ea307b7cd5ce64dd5053a2dac9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/6] support persistent /var/tmp
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 14 May 2020 14:25:16 +0100
In-Reply-To: <20200513094847.14326-1-changqing.li@windriver.com>
References: <20200513094847.14326-1-changqing.li@windriver.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-05-13 at 17:48 +0800, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> Changqing Li (6):
>   bitbake.conf: rename VOLATILE_LOG_DIR to VOLATILE_DIR
>   fs-perms-persistent.txt: renamed from fs-perms-persistent-log.txt
>   base-files: respect VOLATILE_DIR
>   initscripts: respect VOLATILE_DIR
>   systemd: respect VOLATILE_DIR
>   eudev: respect VOLATILE_DIR

This patch series doesn't explain what the problem is that its trying
to solve.

It also doesn't appear to be bisectable, you have to apply all the
patches or none. That implies some of the patches would need to be
merged together.

Please can you rework it with an explanation of what the problem is
that its trying to solve.

Cheers,

Richard



