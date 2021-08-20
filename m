Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.79285.1629432498041555490
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 21:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BD9rW3p7;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id w68so7474110pfd.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 21:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=AYmv2gJkuDBKE1UzUO+VRktpDcnNTAhDIq5rvGaiw60=;
        b=BD9rW3p7+w+D2TfRIbOwgRM8vov599KV9jZeAYrHHuf76R3Q6W/jxtRqvNJ/bsNdRA
         YE6TBUK+0I77lZ2n4Htr/mJqzWfILgZ0af9//1IFam73ZZqEGMMY1TvWZNlDHwfXjZYv
         nVXZIKg2lc7GCoMT24LgGNu7uLN2UJYlhaj/d/MXNbkG6Vhqoi3XRdNE6FogBKoJxQfo
         MswB6ihnW61dXRFuUn3AwSduzKuu6LSuYi7AO2DZzrFMv1xu+cAUDBS/DnsL0rFustBv
         IF8MAIXvH7uHxhEzrkFzabXGJuVIPEqSa88EmieB01KMTA/GvS35BYR+K3l6QG+GNo7U
         Ru1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=AYmv2gJkuDBKE1UzUO+VRktpDcnNTAhDIq5rvGaiw60=;
        b=gy04QD3QruncqKTKJFYrG3fqWbmZc2Eg0ausKGbJL8a/c3pPrfXio+ee7Kxn+OE5P2
         jv/PU96IesEVKlBBsuXv4lpScx9a+CJj+kJHzD/ZnkzfRGHK3wxA8+U7T/PMKY0m/5XJ
         jkfipuVPdDhBzDnkywtzOk+t1Kn2f3QRzY4cVDxel/Nf9CyhxGoX9aFT9DYxuvP1QN5o
         5YxBmQ6TXfRSz3Gzz+DfFHM5teQmUirjRqE0bEfvgVmUGlMrbBtl/zT2F52GRvcNRNx4
         rA0uXARUNBF522S2/Q4le0+tlsSP+6ML0DpW0FJrTV0WLjwClx8UbwPzxqcRrNg4Es8R
         bQcA==
X-Gm-Message-State: AOAM531XZF+GUiSY6c/XRBAwDW8yP45A5VsBuf7yMwxFRMPuTMLR9g8E
	HMQzKW3f7JiXX2tLbJ/A8+TswV0qMN8oMA==
X-Google-Smtp-Source: ABdhPJwuTvKvYaXw4fFv0ekGFvN1eZFYDvfZcwiUah30fKIzbT8zzetdfOvJJ8JrqzZ+rwCbgih1zg==
X-Received: by 2002:a63:83c7:: with SMTP id h190mr16993932pge.51.1629432496865;
        Thu, 19 Aug 2021 21:08:16 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:ff71:9627:ab75:ea06? ([2601:202:4180:a5c0:ff71:9627:ab75:ea06])
        by smtp.gmail.com with ESMTPSA id l12sm4937686pff.182.2021.08.19.21.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 21:08:16 -0700 (PDT)
Subject: Re: [OE-core] update glibc to HEAD of release/2.34/master to include fix for CVE-2021-38604?
To: Khem Raj <raj.khem@gmail.com>, Sakib Sajal <sakib.sajal@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <536e91b5-6c16-aeb2-f534-edde8601ac84@windriver.com>
 <CAMKF1spD_gnPW7x5st-5i8VC2wpLmOFGKF9K0iKSSSR4xB=wbw@mail.gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <4cea495d-30b6-b74f-70d9-07b6dd5ba2e4@gmail.com>
Date: Thu, 19 Aug 2021 21:08:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spD_gnPW7x5st-5i8VC2wpLmOFGKF9K0iKSSSR4xB=wbw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/18/21 3:02 PM, Khem Raj wrote:
> On Wed, Aug 18, 2021 at 2:40 PM Sakib Sajal <sakib.sajal@windriver.com> wrote:
>> Hi Khem,
>>
>> I was going to apply the commit
>>
>> glibc is currently at ae37d06c7d127817ba43850f0f898b793d42aea7, 8
>> commits behind origin/release/2.34/master as shown below.
>>
>> Those commits also contain the fix for CVE-2021-38604. Should I go ahead
>> and update:
>>
>> ./glibc-version.inc:SRCREV_glibc ?=
>> "ae37d06c7d127817ba43850f0f898b793d42aea7"
>>
>> or is there work in progress to do this?
> Please go ahead, also add the below information to git commit log.
>
>> glibc.git$ git log --oneline ae37d06c7d127817ba43850f0f898b793d42aea7...
>> 7c987a5ccb (HEAD, origin/release/2.34/master) librt: add test (bug 28213)
>> 7947430322 librt: fix NULL pointer dereference (bug 28213)
FYI: bug 28213 fixes CVE-2021-38604
>> 31902ae639 Linux: Fix fcntl, ioctl, prctl redirects for _TIME_BITS=64
>> (bug 28182)
>> 9995d0588f iconv_charmap: Close output file when done
>> 7ff4da3dc2 copy_and_spawn_sgid: Avoid double calls to close()
>> a5bd2e10e0 gaiconf_init: Avoid double-free in label and precedence lists
>> 3a48da47a9 gconv_parseconfdir: Fix memory leak
>> 0b03996304 ldconfig: avoid leak on empty paths in config file
>>
>>
>> Sakib Sajal
>>
>>
>> 
>>

