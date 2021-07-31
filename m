Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.3177.1627736127353725139
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Jul 2021 05:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oCn055Bi;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id k4so4226433wrc.0
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Jul 2021 05:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=jnnzr5B0at+yyb+vD5mZA3xOXifZxsZhVsS/xl6hKQU=;
        b=oCn055BiYTtCPceAlx6POcAowSXcOhu7FrqRCbJco07B7kaZRDxmCfS946O8gt/eaM
         DVmbG784OIca60HR8Bxf0Pk6vigZBwKw2/03aGSPALUsiMztjHywhYTt/CPm0enaRD4U
         /60WznJpRFXVxD14Qq1R8Q6pvjfFXD9VIQFsDySEUd0rdIhOCFZlJu24Q0Byat4P/wz9
         k8h2/LSDgwb5UAaGA9bBedj/CppXIQ0557EPk3dpNH+a9S7zmZ4wWnMJcI0Pr6o5ODlQ
         zKSfzBBO7CgMsdw1Rm7Or4qBwR7PJzUa2fIJSwd42Cpl3PrMUBgTEB+c4GVHDoKLzC4a
         vphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jnnzr5B0at+yyb+vD5mZA3xOXifZxsZhVsS/xl6hKQU=;
        b=Mh5ZzTAl4M+qXDDz7DpLq5UIsnddRc4yDsseo3CDoAyrwlhu31G2RS4VUR1E6jOy8X
         rQ19UXxIY5+HGy1IL2neWaubC1jlrDX3OsxP/qUzqeuZxzxzts4f1Q7qsoXLs66W5PLc
         +uiYnJ2MwnMSusbhuOxC0BihZ7eLLigTcsYTMSvYhEjJQFXDrSorVGqyintq1GhUoWne
         +AIGC8aQfPaFHI+i53V7rYwLEbMW6wSij+JE7G6nFmALqYH2WWbpPasvDy2se4E+mgop
         gOo2stXwWEeANPJl06F0eVyAL0BiMv3vMnErLkk5oI7mCJz6NC0p1HUl6pIdbUIVPV1l
         6ffA==
X-Gm-Message-State: AOAM532QL3ODDBbcb5hzpPpr/4YvRXMfRaC4ZakA/EYECwgF4jvW1Qbu
	O1R9Nga9STKqWd27TRMbrogt455UDlY=
X-Google-Smtp-Source: ABdhPJzprW0Of12xzcT9JBv3G9TQgEsiACnsFxIATuL6035amjaBzQxj/mN1VLL5xpcvVCpwiCWvag==
X-Received: by 2002:adf:ffd1:: with SMTP id x17mr8138462wrs.391.1627736125730;
        Sat, 31 Jul 2021 05:55:25 -0700 (PDT)
Return-Path: <oecore.mailinglist@gmail.com>
Received: from [192.168.42.52] (ppp-2-86-128-196.home.otenet.gr. [2.86.128.196])
        by smtp.gmail.com with ESMTPSA id n5sm4752779wme.47.2021.07.31.05.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jul 2021 05:55:25 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 1/3] scripts/contrib: Add override conversion script
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <1695F9FE617EA75A.5172@lists.openembedded.org>
 <f147b797e6dff3358dde45fde9e911c01e420c86.camel@linuxfoundation.org>
From: "Robert Berger" <oecore.mailinglist@gmail.com>
Message-ID: <0d8f3595-8738-4fa6-ac43-4844f06268cc@gmail.com>
Date: Sat, 31 Jul 2021 15:55:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f147b797e6dff3358dde45fde9e911c01e420c86.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Not sure this is the right list and mail I am replying to ;)

I was wondering what's happening with backwards compatibility.

It looks like it will not be possible to have a layer with new syntax 
fixes which will also work for some older versions (hardknott and older).

Regards,

Robert

> 
> 
> 
