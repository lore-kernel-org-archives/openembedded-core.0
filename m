Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.9031.1603892388853518538
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 06:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bZdG83/v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id 13so4595743wmf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 06:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=nzELFxyoavqH0RHx2pQYevJvua6W1QdkWZJk9wBk7ME=;
        b=bZdG83/v9BNvRTC57zZ52CUPAcT9Qm3MnCyCEfcJI7W31F4n3LkqxGpl//isGROvWC
         wIL5L3aY5iAi499Gs2L6p0On8mYgrRvDQEvwn/KQucGuVcHIQKnFgmA+on2BfbDRSUxv
         h++0iT8fQIIUK226d5vES/21tP6bIH+ZD0yJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nzELFxyoavqH0RHx2pQYevJvua6W1QdkWZJk9wBk7ME=;
        b=UeU3NTXE0DbRsMUs7kFvWxCjL/IcGPTgTJLkPjznp3AZJapMUr4+MHM6fT3TS6eIK6
         gFVpPmCov5Zv1xY4UgY+pmSrW1AzKHt7w5n94I60g1ER+QiZet7FlXUqWcWCrF2NTpZ3
         E1oGTnw5JwmQX/Uyx6PrszqVglVqrVxkMW05wEdbXCdo9WnorTeg6U6QbZSCLzmowjf2
         llBl6ees4xfzSR5fG1j3qo778q9Vr3Jx2R83ofFdhbrZvVO9iJCVMkOBtZA8zG6rrXkG
         9XGUB8KBGm4p6ecPJD4w7KoH2jAr19hYF7zwrFzbfkXqd4MuZYo+Poy9ItRMUOLQqoFD
         aJvw==
X-Gm-Message-State: AOAM533AvwEbl89AWlHHyDVmsqQmu+luYyccGvm15PebweoNbIlOICH/
	1eQ9baOupFBknqJlmoF0xugxYw==
X-Google-Smtp-Source: ABdhPJyfIyqICWqtJtl3jMa7NoEVE+Gf3gWdJ0aqm8qu2/VuiFsqVlCB5ytRemGqi+piPZOzaGeigQ==
X-Received: by 2002:a05:600c:28b:: with SMTP id 11mr8624770wmk.144.1603892387122;
        Wed, 28 Oct 2020 06:39:47 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1867:cb67:a1a2:320d])
        by smtp.gmail.com with ESMTPSA id z5sm6827107wrw.87.2020.10.28.06.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 06:39:46 -0700 (PDT)
Message-ID: <517b18e0bd1cafb1d567eb9ec498bbfbbc7930d5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] oeqa/manual/bsp-hw.json : removal of click_terminal_icon_on_X_desktop manual test because of automated
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: jay.shen.teoh@intel.com, openembedded-core@lists.openembedded.org
Date: Wed, 28 Oct 2020 13:39:44 +0000
In-Reply-To: <1603856427-62304-1-git-send-email-jay.shen.teoh@intel.com>
References: <1603856427-62304-1-git-send-email-jay.shen.teoh@intel.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-10-28 at 11:40 +0800, jay.shen.teoh@intel.com wrote:
> From: Teoh Jay Shen <jay.shen.teoh@intel.com>
> 
> removing click_terminal_icon_on_X_desktop manual test as this function is now tested by terminal.py automated runtime test
> 
> Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
> ---
>  meta/lib/oeqa/manual/bsp-hw.json | 22 ----------------------
>  1 file changed, 22 deletions(-)
> 
> diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
> index 75b8975..790c0c0 100644
> --- a/meta/lib/oeqa/manual/bsp-hw.json
> +++ b/meta/lib/oeqa/manual/bsp-hw.json
> @@ -365,28 +365,6 @@
>      },
>      {
>          "test": {
> -            "@alias": "bsps-hw.bsps-hw.click_terminal_icon_on_X_desktop",
> -            "author": [
> -                {
> -                    "email": "alexandru.c.georgescu@intel.com",
> -                    "name": "alexandru.c.georgescu@intel.com"
> -                }
> -            ],
> -            "execution": {
> -                "1": {
> -                    "action": "After system launch and X start up, click terminal icon on desktop",
> -                    "expected_results": ""
> -                },
> -                "2": {
> -                    "action": "Check if only one terminal window launched and no other problem met",
> -                    "expected_results": "There should be no problem after launching terminal . "
> -                }
> -            },
> -            "summary": "click_terminal_icon_on_X_desktop"
> -        }
> -    },
> -    {
> -        "test": {

I'm afraid this testcase does not match what terminal.py is testing.
The test here is to:

a) check it launches
b) check there is only one terminal

and the test in terminal.py does neither of these things.

Cheers,

Richard


