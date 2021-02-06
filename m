Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.4342.1612602011759077957
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 01:00:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eNeQdsj6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id i9so7869197wmq.1
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Feb 2021 01:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=4esrONQoC2yqm+dt02NPlPtJ89lP+7Z30SAT3CLV5J4=;
        b=eNeQdsj6BazYhD+KL4qBd4qZdMW7UyDlYxlxn/fBqu+zbSFwYT5xqFWou7QS1v7DOc
         QM7Pg7L9RxZLNSPNlwce0PCskkG5iblrNbuzIyCJo3qa/HQ6iR9nC+kWOX9aTqOUPAIg
         np0Pebs6XRaHVblieDFXfBRXWJ3TFAnIciQiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4esrONQoC2yqm+dt02NPlPtJ89lP+7Z30SAT3CLV5J4=;
        b=KD5fPXGT0dTEBFg4pYoHaMXiLQe5nBremWtjslnU3L1TGoAvNuzXST7iiP64KJ4iTM
         NJ2eo6h95V6+BTSixTKW1Ov8MLjjC5Ky88pL/k8uKCM0Mln9LCQzCirSrKDYdREA52OA
         FLpdz7Xffm4LoJRvmkjvC6rnL2S/DkHQDdOmQ3EsXJuOrKHQvGvrnOzNqnQWsvwzKZ3P
         2bfe3geERg43KWlq/yf3Wc4T9ofSESv0LpQahFmyafiUwAwZ5N4IKlqA9iMeZLRn7jY7
         JYJWr5gJ363NwqnR1e1mA2WdLyZZG2RVjfLCtrv3SU9b32f1cujIuUZjtnUayzZNdG9S
         5SGA==
X-Gm-Message-State: AOAM5310d5yLiQQG86R2xda02dVsSDOSFSpAJrI1yEUnQb3PLw612LWI
	4Dq/oXrcqKzyouKB2/9LcJHNyQ==
X-Google-Smtp-Source: ABdhPJzZjrLVvWyQ4+GNRa4rjwL9nQ7q69mECBaV9cfNJqGnGuFGWgMhguaAwZ41M9tOnRKv7TjsaA==
X-Received: by 2002:a1c:b1d7:: with SMTP id a206mr6696941wmf.88.1612602009963;
        Sat, 06 Feb 2021 01:00:09 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:be75:a088:9c76:71df? ([2001:8b0:aba:5f3c:be75:a088:9c76:71df])
        by smtp.gmail.com with ESMTPSA id i18sm16123353wrn.29.2021.02.06.01.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 01:00:09 -0800 (PST)
Message-ID: <5b4a928dead7b0500b28e7df160e0fe253a14228.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libcroco: CVE-2020-12825 Security Advisory
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross@burtonini.com>
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 06 Feb 2021 09:00:06 +0000
In-Reply-To: <CAMKF1spQ9Ld=UHEWed9wHFhmog16YZhOjuif4Qy5wVZUqsm0pQ@mail.gmail.com>
References: <1611212366-44911-1-git-send-email-wangmy@cn.fujitsu.com>
	 <8ff56839bd7345ac64d0221f0f588e9886b4ef38.camel@linuxfoundation.org>
	 <CAAnfSTtQYhHwkFrMczvv0OdUhFPM18tLyYfhAV4EKEBnDRPfwQ@mail.gmail.com>
	 <CAMKF1spQ9Ld=UHEWed9wHFhmog16YZhOjuif4Qy5wVZUqsm0pQ@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-02-05 at 22:44 -0800, Khem Raj wrote:
> I am also seeing
> 
> ERROR: libcroco-native-0.6.13-r0 do_patch: Fuzz detected:
> 
> Applying patch CVE-2020-12825.patch
> patching file src/cr-parser.c
> Hunk #4 succeeded at 799 with fuzz 1.
> 
> 
> The context lines in the patches can be updated with devtool:
> 
>     devtool modify libcroco-native
>     devtool finish --force-patch-refresh libcroco-native <layer_path>

There was a more recently submitted version of this. I've refreshed it,
in master-next it looks like it was whitespace damaged somehow.

Cheers,

Richard



