Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.344.1593101552079108450
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 09:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sdCwncbI;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id g67so2610847pgc.8
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 09:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+uBLhoIOXI6nZfzedrYxg0R1xkPgw5XU51T3JlWKKWw=;
        b=sdCwncbIPRfGMnjISox8Pm9ifynTARkqxNkezYN/aXGW9cjS6dNaRn5QSBcFN1Drqa
         OUvZ4duUqq0LInKQs0jtIRyMaYEQTFt5MI74c+YNkZejs2qyDGtDjXmM1h8l1DWzxSyA
         jbJy1h1UkEOD84XL6GLQV4Z/3X+HFQdcnyNOWVMabmJkb9z5lAB10/ED6K0ewtsdCwU2
         4vCywSeH6I5iEIF6lUJiUpD4ANkx4s3b0ptkXFZqLcbSgFYchssXIp4Gs7BXPiQdmjTI
         fgEumYQyDI6axwUDZr+yOrdl2KAHAw8Iwe5fP4Iq+MpOzykoMFTmNh80BFSO9UJ8BEs5
         p2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+uBLhoIOXI6nZfzedrYxg0R1xkPgw5XU51T3JlWKKWw=;
        b=CEPeyP6vtkRF1sANEm2gnR+AB1Iov9xBPwi0Qk1+sjvbxLBiZwb6iyATB3K5Ky/ya6
         MVIeRBcV284+gxpd9LCtBJZSsiP0RsVBrkLaHu12rN/tYN3w4+/QdPQqdYhWGDn6PKHm
         jlKFivpFcUFEiwTerszIBVlnh/3CRGQOWl+84z17qpbW1XLo8yZa2mVf3UIk+kt8btFK
         BJtUAjTrQLJAhZsysstn/W9F/lhgTK98zqKwTWOMpe7g20x2V8o7fpljuNfvWKoy2Gqj
         g8/n5N3uedJM1ednuqxnTumZLDAVNKA5NUF8BvD1+pOKry6JuBSwstOlbUYxryMtN+TB
         ZcoA==
X-Gm-Message-State: AOAM532LKpd8CvGkRjq3HB9kDEy7/S0UAG6oYHWyqMp01sKLbSitOnW3
	1fFcVtBWNX1LFvzhtxJl013zO6q3whI=
X-Google-Smtp-Source: ABdhPJzLoF68LXg/3T9BjEDc4DHwHBK//HuAhUBv9uDvoNpiCbEo0WDV+kgGejyHb/59fejTOZK8Ww==
X-Received: by 2002:aa7:8283:: with SMTP id s3mr35463561pfm.90.1593101551003;
        Thu, 25 Jun 2020 09:12:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::dedc? ([2601:646:9200:4e0::dedc])
        by smtp.gmail.com with ESMTPSA id 25sm23214711pfi.7.2020.06.25.09.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 09:12:30 -0700 (PDT)
Subject: Re: [OE-core] Distro name
To: Pankaj Vinadrao Joshi <pankaj.vj@exaleapsemi.com>,
 openembedded-core@lists.openembedded.org
References: <QkZO.1593082325223977941.NSzh@lists.openembedded.org>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Message-ID: <9b9f8039-7793-62d1-4bef-fbb7a9a0ed1c@gmail.com>
Date: Thu, 25 Jun 2020 09:12:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <QkZO.1593082325223977941.NSzh@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 6/25/20 3:52 AM, Pankaj Vinadrao Joshi wrote:
> Hi,
> i have built image for raspberrypi4-64 using openembedded-core and i am
> trying to run some test specific to lkp but i am getting issue with the
> distro
> which is nodistro.0 but the test needs distro for it
> 
> i am attaching the output of  os-realease 
> *ID=nodistro*
> *NAME="OpenEmbedded"*
> *VERSION="nodistro.0"*
> *VERSION_ID=nodistro.0*
> *PRETTY_NAME="OpenEmbedded nodistro.0"
> 
> *i am getting following error with respect to lkp
> [3:43 PM] Ankita Anil Kulkarni
> ERROR: "Not a supported system, cannot install packages."
> ​
> [3:43 PM] Ankita Anil Kulkarni
> detect_system distro=$_system_name_lowercase
> DISTRO=$distro export DISTRO
> [ -x $LKP_SRC/distro/installer/$distro ] || {     echo "Not a supported
> system, cannot install packages."     exit 1 }
> 
> 

Please look at what this installer script is doing, I am suspecting that
it has notion of common binary distributions which have package managers
you might be able to use rpm or deb backend

and ride on "nodistro" string to use the appropriate package manager.

> can somebody help me how i can add distro for raspberrypi??
>  
> 
> 
> 
