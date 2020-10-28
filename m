Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.9095.1603892479480425960
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 06:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cRyTgV47;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id s9so5735454wro.8
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 06:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=41yoJbX1fpGS8mwyg5t5yJZEar44ZjSA1MLQqfJFPbQ=;
        b=cRyTgV47fv+CSJ+dcBpEaqU4LbbxrEp43HFav+F2YSvm0ARJPuVF2e7/hVh6uP2VYp
         ATS+ampEv6o/LklzbODwBcdUqZE9QHXUuBh3nBXr5HD6b4NTbPgJHO6K1aGx4jlTlT+v
         +25287kvgqWMYyJoIokeuPLJYr60NIZdj7+Pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=41yoJbX1fpGS8mwyg5t5yJZEar44ZjSA1MLQqfJFPbQ=;
        b=mGfh3zuv12w3zbl17ezXS7IaJVbK9OX7Uv/L1IupqOxBf7hHnpvn+8vE/DfeXyurBo
         CcB9hRQAQJAh53kCiVRe7TgldXhuVLOEOsNIfH3TzaDoptRuKInJTpTdGWxpKUCeWxN3
         H3e4hnAeKeFLeCULLEcs7T87PRQlodzwGX4oWKnniE2aOTe1MCYv9oNgNIq5cL7VB3lp
         nZUwXYFQBGrlJ1ictH8yesHDscagrGGEjDOcCthbTHugmaAzb/SBF0H2g7cCb1eVkZKt
         0iLICnrxzdJZ80/aO3kC0MeFe9WGZNcKHigY9g/mf26dENGdOgLoxHbVxgziVY2x5MQ/
         yx8A==
X-Gm-Message-State: AOAM530CzO/bATx60kGLyUlUz67wqzNBe5ah+fD8QQdfwaA933WiKVor
	Yqz0w50/nSC1uSnSjiWSnscWeQ==
X-Google-Smtp-Source: ABdhPJzW/z7gea5913DnHcSjjPwWbCy3G+NzgI1JMOZlhct3o244ijKBIbEkmdA3u/w/pgO2xa2yOQ==
X-Received: by 2002:a5d:4ac1:: with SMTP id y1mr8879958wrs.303.1603892477958;
        Wed, 28 Oct 2020 06:41:17 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1867:cb67:a1a2:320d])
        by smtp.gmail.com with ESMTPSA id a2sm6768997wrs.55.2020.10.28.06.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 06:41:17 -0700 (PDT)
Message-ID: <cbd1f4de4b0fc3453bbfa9f2ca5a4ee318ff31d1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] oeqa/manual/bsp-hw.json : removal of Check_if_RTC_(Real_Time_Clock)_can_work_correctly manual test because of automated
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: jay.shen.teoh@intel.com, openembedded-core@lists.openembedded.org
Date: Wed, 28 Oct 2020 13:41:17 +0000
In-Reply-To: <1603856427-62304-2-git-send-email-jay.shen.teoh@intel.com>
References: <1603856427-62304-1-git-send-email-jay.shen.teoh@intel.com>
	 <1603856427-62304-2-git-send-email-jay.shen.teoh@intel.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-10-28 at 11:40 +0800, jay.shen.teoh@intel.com wrote:
> From: Teoh Jay Shen <jay.shen.teoh@intel.com>
> 
> removing Check_if_RTC_(Real_Time_Clock)_can_work_correctly manual test as this function is now tested by rtc.py automated runtime test
> 
> Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
> ---
>  meta/lib/oeqa/manual/bsp-hw.json | 34 ----------------------------------
>  1 file changed, 34 deletions(-)
> 
> diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
> index 790c0c0..b50b4c2 100644
> --- a/meta/lib/oeqa/manual/bsp-hw.json
> +++ b/meta/lib/oeqa/manual/bsp-hw.json
> @@ -817,40 +817,6 @@
>      },
>      {
>          "test": {
> -            "@alias": "bsps-hw.bsps-hw.Check_if_RTC_(Real_Time_Clock)_can_work_correctly",
> -            "author": [
> -                {
> -                    "email": "yi.zhao@windriver.com",
> -                    "name": "yi.zhao@windriver.com"
> -                }
> -            ],
> -            "execution": {
> -                "1": {
> -                    "action": "Read time from RTC registers.  root@localhost:/root> hwclock -r  Sun Mar 22 04:05:47 1970 -0.001948 seconds ",
> -                    "expected_results": "Can read and set the time from RTC.\n"
> -                },
> -                "2": {
> -                    "action": "Set system current time  root@localhost:/root> date 062309452008 ",
> -                    "expected_results": ""
> -                },
> -                "3": {
> -                    "action": "Synchronize the system current time to RTC registers  root@localhost:/root> hwclock -w ",
> -                    "expected_results": ""
> -                },
> -                "4": {
> -                    "action": "Read time from RTC registers  root@localhost:/root> hwclock -r ",
> -                    "expected_results": ""
> -                },
> -                "5": {
> -                    "action": "Reboot target and read time from RTC again\n",
> -                    "expected_results": ""
> -                }
> -            },
> -            "summary": "Check_if_RTC_(Real_Time_Clock)_can_work_correctly"
> -        }
> -    },
> -    {

The test in rtc.py does not include step 5 as there is no system reboot
to check the rtc changes took effect?

Cheers,

Richard

