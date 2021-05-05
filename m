Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.2034.1620243809568525095
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 12:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rJ2uAljR;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id cl24-20020a17090af698b0290157efd14899so1456591pjb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 12:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Jk/fh+8zJ7J2q3k/u3RoLVd6K5rvL/a/MPR3KTHnBFI=;
        b=rJ2uAljRdj7QnngMY9RbQvvXiy5S1sySZe95tMudzS48VoSYqsT/Tk2GvP1ZGzgG5w
         l0JUvWQbNNeUP9kJB2P6kM6uFQc05eNk+UiROrVFlzsjs/mkxzMZHY11wTZdVFAgyh3j
         DTfXZmVkpfbC4bVGubefUU9JFwJhWs2azlMzQpuk4zkZa6m+6NlihbTqj+QD0S05pkN4
         tzoC6rqkfBAJ8D9Jmhu5PRg6shKUULxQVX0vOBrs0XEHQYxB6/dz86JxDHQeL372YIml
         EM1MWmXbm+dEJcScvnUPdTIpo969O+rtbwK1BxAPDF/RW+ON5EW/rIdF+9iYlgytBg27
         4o1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Jk/fh+8zJ7J2q3k/u3RoLVd6K5rvL/a/MPR3KTHnBFI=;
        b=I0b+A+EMpMa3qLLfBo1M5CvCOlFQebtBQh/S56oB9gpcVl7JelOkZEI+hGAycY0fwD
         RbZT4nQ5Btfd0T0wLILjlVq58NhGXMlmxI7FWbmXFyTWiP/JPbslsf8R49VezIgiSYG3
         e2lnrKzlYLWHK/YtccYPyDGySvNEtjii36YL0GbaWHC6i0CfMo7O2VxfmbjrkqBqFFFv
         U9wXUscudho2VMHpoG5c9YFzedzNOpupP1X39QIHNd2c3ey9nXDf+wShOlnwh133zbkX
         3FogeVJUhcBr1g5ioX8uzdtfYtvShgh/7UB6t8IhAvqXHDOBQcqYXo6Mm6DRi3qAxcW4
         MUOw==
X-Gm-Message-State: AOAM533sh+47Poyk+eteE+70/VGkJOMSlj8ffdXIKbKJXbRXmGTsFkQS
	nQV/I2QtxQLSkxYyxsdrtvjL0t9VBOl6xg==
X-Google-Smtp-Source: ABdhPJyWxDhybKZMOj7tA3eHjY6xDMu5IB+hfqgT+mzTo7voAEPKqT6/J875tbyuidZ3US7tFpDn+A==
X-Received: by 2002:a17:90a:b78d:: with SMTP id m13mr13693126pjr.47.1620243808726;
        Wed, 05 May 2021 12:43:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:c0f3:6794:1988:a526? ([2601:646:9200:a0f0:c0f3:6794:1988:a526])
        by smtp.gmail.com with ESMTPSA id g34sm36880pgg.59.2021.05.05.12.43.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 12:43:28 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 23/61] powertop: update 2.13 -> 2.14
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-23-alex.kanavin@gmail.com>
 <CAMKF1srGBpzk-BiFnSM_+1pEoCByUkcPrJo2VDmSRUwGgbn18Q@mail.gmail.com>
 <CANNYZj8Q7GLF_6oLZQ9oZYO3nMKkThZnj7CZGL=duS1u_wQicA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <46ffd119-9523-cb0f-d582-ced91ccccef6@gmail.com>
Date: Wed, 5 May 2021 12:43:27 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj8Q7GLF_6oLZQ9oZYO3nMKkThZnj7CZGL=duS1u_wQicA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/5/21 11:52 AM, Alexander Kanavin wrote:
> On Wed, 5 May 2021 at 20:13, Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     On Wed, May 5, 2021 at 8:20 AM Alexander Kanavin
>     <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>> wrote:
>      >
>      > Drop awful ncurses hack; please make a proper patch with a configure
>      > option and PACKAGECONFIG.
>      >
> 
>     Lets not delete this unless its causing trouble as it will break
>     existing functionality that users might be depending upon.
>     if there is better fix please propose that instead
> 
> 
> Sorry, no. If I do not understand what it does, the version update is 
> incompatible with it,
> and there is no trouble detected by the AB from dropping it, then it has 
> to go.

OK thats fair, no one knows everything so drop this patch from your v2 
series and let someone else handle it.

> 
> Alex
