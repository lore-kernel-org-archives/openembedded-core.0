Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web08.199.1614278944500974980
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 10:49:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moseleynet.net header.s=google header.b=fDr9ADLK;
 spf=pass (domain: moseleynet.net, ip: 209.85.160.176, mailfrom: drew@moseleynet.net)
Received: by mail-qt1-f176.google.com with SMTP id v64so4877687qtd.5
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 10:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=moseleynet.net; s=google;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=iyZIY7ltv/9Eqa3tN1u/VQ261W9oHpdWySUlyj/N5F8=;
        b=fDr9ADLKjaKW03/A74X0n9Cszn1xEzNygyG1GqkqgoTpGdikA8GKmWSS1FTQR+Wu/n
         ACAb9EMCfCIReppoaqgvysfEFo7J2kIoc4KvfEJzKYXR17nFxWFmLFksi6hms/811qdf
         anVmegXMf4hN6+5Ib9pHZuRXMTB48oUq5Cna4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=iyZIY7ltv/9Eqa3tN1u/VQ261W9oHpdWySUlyj/N5F8=;
        b=bkhSwM7wwXdRnqeK6Tsv0Pc2bjfJq38uj7sWEfix5RaxkYQWQkAndSlh35zwL7SdM/
         B37k4rI1Hmeil/LS4k4U2NJP8vNq123eIzY9w0g/06k4bC06H9ouMgmEbcQcoHpQzqB2
         0PTVRZy29qYAjMJld4FzYkYnNjiAnKn9+oqHLWKJqatu44fF8wfZmZzhuvhq/myp1/jU
         S6Sp6ncxXyyYmEEHa6BZVA3R773bCXCZmYZ537uP9LfQWHh0DgRFiY3MfI+sSO6aZD71
         6ly/84sYSdkz1myng/QzYrwMJ7xPZxPKzg8Et/p2HJ6FPUa4Fxdyb7/lB1ESptljsLhZ
         VaoA==
X-Gm-Message-State: AOAM531gKkYF7IVjbqzj3nKvzEc7q+MEPAMnwcmkrImCYA/MSlK86bZE
	mcrsMy/7xmi9Sr/nHB/INK6Q3zZHdvwZGWah
X-Google-Smtp-Source: ABdhPJzNJ95/uMcTaBROWk16g77EhRZztKIOfsPF59jQ/SFGIV3oz6gLG7ybqgli/Eyfkp0+9/rXaQ==
X-Received: by 2002:aed:2bc2:: with SMTP id e60mr3711167qtd.48.1614278942896;
        Thu, 25 Feb 2021 10:49:02 -0800 (PST)
Return-Path: <drew@moseleynet.net>
Received: from aruba.home.moseleynet.net ([24.96.56.90])
        by smtp.gmail.com with ESMTPSA id 12sm4133624qtt.88.2021.02.25.10.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Feb 2021 10:49:02 -0800 (PST)
Subject: Re: [OE-core] DTC_FLAGS with devshell
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: openembedded-core@lists.openembedded.org
References: <be6caeb7-3822-a710-be04-9b57f658331e@moseleynet.net>
 <20210225173510.27uhyrgteq56kdcb@qschulz>
From: "Drew Moseley" <drew.moseley@gmail.com>
Autocrypt: addr=drew@moseleynet.net; keydata=
 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
 alb5dL99r1Dy6w==
Message-ID: <9c87bb9b-5e29-41e0-63cb-c5498b997bfb@moseleynet.net>
Date: Thu, 25 Feb 2021 13:49:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210225173510.27uhyrgteq56kdcb@qschulz>
Content-Type: multipart/alternative;
 boundary="------------FB8C6E4651BF3E3C4385A87F"
Content-Language: en-US

--------------FB8C6E4651BF3E3C4385A87F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit


On 2/25/21 12:35 PM, Quentin Schulz wrote:
>> Is there a better mechanism for handling this?
>>
> There's a recent patch for this:
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/classes/kernel-devicetree.bbclass?id=ff036cbb77124867a6c6f97ca206b4fd3ee00c70
>
> Reading the commit log, it seems you could use KERNEL_EXTRA_ARGS right
> now.
>
> Cheers,
> Quentin


Possibly.  Would that take effect inside of the devshell?

Drew


--------------FB8C6E4651BF3E3C4385A87F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/25/21 12:35 PM, Quentin Schulz
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20210225173510.27uhyrgteq56kdcb@qschulz">
      <blockquote type="cite" style="color: #000000;">
        <pre class="moz-quote-pre" wrap="">Is there a better mechanism for handling this?

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">There's a recent patch for this:
<a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/classes/kernel-devicetree.bbclass?id=ff036cbb77124867a6c6f97ca206b4fd3ee00c70" moz-do-not-send="true">https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/classes/kernel-devicetree.bbclass?id=ff036cbb77124867a6c6f97ca206b4fd3ee00c70</a>

Reading the commit log, it seems you could use KERNEL_EXTRA_ARGS right
now.

Cheers,
Quentin</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Possibly.  Would that take effect inside of the devshell?</p>
    <p>Drew<br>
    </p>
  </body>
</html>

--------------FB8C6E4651BF3E3C4385A87F--
