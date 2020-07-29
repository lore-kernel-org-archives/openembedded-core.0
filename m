Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.2542.1596015708583972696
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 02:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IDoRi8+f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id f18so2267658wml.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2020 02:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=UCPdu6YVmZ//ruG8+b7gsNjH257JADRF5flsvbQrhpc=;
        b=IDoRi8+f/BC1RW8O47Hufc5XVmbBY/rATuOB5IonyefQLr9/9ZIdga31bpoLIc7H0u
         fNcdnMKiD0GVUjx/gAenFH3k/CDb5UFjinLwlvfW/GSUmbzbLbLQ5HITmtJaGCzooEyP
         m2iOnlRpeq3JNGiFA5LK6pPF7nT4dmGj97AzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=UCPdu6YVmZ//ruG8+b7gsNjH257JADRF5flsvbQrhpc=;
        b=Z4NP/FlxRRXKNRMWOYEzH3WTK/m/dCM25dqf7Py4Q0P8AtU6frlCGCkZY/r4wus2Ev
         KXh7CddB3BHlL9GVpMt3MsjD2WvSXQZlZXL61LrsMAvJl1S5uc/G8FQEi+PAGXe+1OMi
         EDmqaswCqjgXa6l6IC03X6sCM75CnxtUI8cnxsoUKn+W1UGT72Cq4epx5ayslvOSlgqD
         nETCghb7VNEBMvNjYkT2TasD2DSxqSrHSkikjHzhOsK/cTfTkoNQZ00fv9+4UhZLV2fB
         Rf1F6c0uT5K9cPNI0PjMf+n6fj9A+JK8cFjVCG4Z934ByGtZU3BE03q7AsqAR8skBk6w
         ubLA==
X-Gm-Message-State: AOAM530yovefcNovv1jptabobQ1tdRt+k/0B8elKFl1Ju/ZN1WvJX3S3
	0VhPmWnCT9tJ9BDJx4dIS6E8AA==
X-Google-Smtp-Source: ABdhPJxKywpBdsKL2kLxBELJteDSwBwe207A3JvDPyKh3evirs2AJq3v4KTrx5OcayAWfFFycL1SfQ==
X-Received: by 2002:a1c:e405:: with SMTP id b5mr8430319wmh.54.1596015707081;
        Wed, 29 Jul 2020 02:41:47 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from b.5.1.e.3.9.b.a.2.d.3.0.f.a.0.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (b.5.1.e.3.9.b.a.2.d.3.0.f.a.0.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:20af:3d2:ab93:e15b])
        by smtp.gmail.com with ESMTPSA id v5sm3605757wmh.12.2020.07.29.02.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 02:41:43 -0700 (PDT)
Message-ID: <106c5c943d502a122f4db5a554cf62a76580ea76.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ltp.py: remove mm from ltp_groups
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Matthew <matthew.zeng@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Date: Wed, 29 Jul 2020 10:41:42 +0100
In-Reply-To: <20200728204354.10970-1-matthew.zeng@windriver.com>
References: <20200728204354.10970-1-matthew.zeng@windriver.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-07-28 at 16:43 -0400, Matthew wrote:
> Fixes [YOCTO #13802]
> 
> Temporary disable mm test for a while, since it calls the OOM tests.
> See ltp-git/runtest/mm:
>     oom01 oom01
>     oom02 oom02
>     oom03 oom03
>     oom04 oom04
>     oom05 oom05
> 
> Let's wait for a week or two to see if the error stops occuring.
> 
> Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
> ---
>  meta/lib/oeqa/runtime/cases/ltp.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
> index cfac29c153..9ac7bb15f6 100644
> --- a/meta/lib/oeqa/runtime/cases/ltp.py
> +++ b/meta/lib/oeqa/runtime/cases/ltp.py
> @@ -57,7 +57,7 @@ class LtpTestBase(OERuntimeTestCase):
>  
>  class LtpTest(LtpTestBase):
>  
> -    ltp_groups = ["math", "syscalls", "dio", "io", "mm", "ipc", "sched", "nptl", "pty", "containers", "controllers", "filecaps", "cap_bounds", "fcntl-locktests", "connectors", "commands", "net.ipv6_lib", "input","fs_perms_simple"]
> +    ltp_groups = ["math", "syscalls", "dio", "io", "ipc", "sched", "nptl", "pty", "containers", "controllers", "filecaps", "cap_bounds", "fcntl-locktests", "connectors", "commands", "net.ipv6_lib", "input","fs_perms_simple"]

Since there are a load of other tests in runtest/mm, shouldn't we just
patching out the oom ones?

Cheers,

Richard

