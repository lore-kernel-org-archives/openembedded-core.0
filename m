Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.64.1603402781641711068
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 14:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G4qGB21X;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id a200so2066660pfa.10;
        Thu, 22 Oct 2020 14:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TOC3jhg/UJ7lp326BKiimfjcjat67+57FeeQyzQ8MiU=;
        b=G4qGB21X/tmdr5EtOr+b9+CLMXLM530WSTigMxj1PWgxsmTnCQnIshm0z5+8E0Rw5W
         iNRlPe4NUDhRdykHXux+t7nc6YOijds4kAwb0l9jzC7dTF7mKE8Ie1SkaKwGhXLgRU+4
         7rpOpDDr93dxJJ9D/X2C6AzrVzZRSHKSfqytbL48oNRE8zlgsH7ima6PozQsBTwCAKf6
         gXBS6fidPlJiFP53pojuxImCPwYcTnULziqbByL2apKAHardWBKjZcvkfuSdmTWWNPyh
         GiqR7bop6mWIHePoamX+7gJQSlqqKC3CRKnoMRsu9hEzQwxYiMGLm66d0f/DwM3JK/Tw
         sGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=TOC3jhg/UJ7lp326BKiimfjcjat67+57FeeQyzQ8MiU=;
        b=TCQJExU/eGUMLU2wXNtguMiVGpDhvt5La86j1Iw3J6+gv4XQqnyq/w3wIfmn7Ih9gO
         Ldf0p7KXPJEcETg8eCCRobsc/3C68AQE77DBpScwb3AVfAIXcJqDNJHmfuJgt+ro+2ve
         L8heLYwSmqiBe1G6/Gu4qtoOhfvXasWbcmd7Cg5AyihyFpkUYHDNDgZh1Y3WNRhCoKGb
         pJ8M9nv8SPXQVFY1OzCm3HEZvRDXnZxLaNrTVNRk4bGjMSmClG5hMJjHZC/ueSVe62Pw
         kgc0BkcCdkm+9qVzrQ7tIcWRAsECvW9xn+k9lG29i4rsfsmAxP4w6a6HSu1T7nZ277xv
         tiLg==
X-Gm-Message-State: AOAM532YkeYuq7NCbDkW60VPr33NPhhRhSkLHZnU7UI2Qp9AkR9APVfa
	muv8T1TuirLEE+pJeEzZO1U11/MLcoEFUQ==
X-Google-Smtp-Source: ABdhPJyqwkAvAkygL8B+sLE9GRqUbMVWVZAZyiE2Hm52r4NNepI6n1ddB1RdUDCBMQaT2b3Dqlvhvw==
X-Received: by 2002:a17:90b:518:: with SMTP id r24mr4157935pjz.105.1603402779398;
        Thu, 22 Oct 2020 14:39:39 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:913f:dc36:bf23:12ab? ([2601:646:9200:4e0:913f:dc36:bf23:12ab])
        by smtp.gmail.com with ESMTPSA id y4sm3021601pjc.53.2020.10.22.14.39.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2020 14:39:38 -0700 (PDT)
Subject: Re: [yocto] [OE-core] Let me tell you how I really feel. Zero filter. If you need meta-python2, you need to become a maintainer. Immediately. Period.
To: Martin Jansa <Martin.Jansa@gmail.com>, Tim Orling <ticotimo@gmail.com>
Cc: Yocto-mailing-list <yocto@lists.yoctoproject.org>,
 openembedded-core <openembedded-core@lists.openembedded.org>,
 "openembedded-devel@lists.openembedded.org"
 <Openembedded-devel@lists.openembedded.org>
References: <CANx9H-DFtcdnZwDqHEPg4t5ySyJe++KS8hO9QDFX5r31KLz3Ww@mail.gmail.com>
 <CA+chaQfL9RtRiJYph7=yGxMrgoiOPRovdfJOPf524vXY-bD7aQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <dedefa25-3055-0d7c-973b-4200f3c58ef3@gmail.com>
Date: Thu, 22 Oct 2020 14:39:37 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <CA+chaQfL9RtRiJYph7=yGxMrgoiOPRovdfJOPf524vXY-bD7aQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 10/22/20 2:36 PM, Martin Jansa wrote:
> There were only a few changes needed between dunfell and gatesgarth to 
> keep it building and I feel guilty for sending half of them - and 
> pinging you on FB :).
> 
> I don't have interest in python2, but it's still used by quite a few 
> components included in other layers are care about (e.g. qtwebengine in 
> meta-qt5, chromium in meta-browser - 
> https://bugs.chromium.org/p/chromium/issues/detail?id=942720 
> <https://bugs.chromium.org/p/chromium/issues/detail?id=942720> is still 
> quite far from finished) and at LGE we maintain meta-ros 
> https://github.com/ros/meta-ros <https://github.com/ros/meta-ros> which 
> contains support for ROS 1 Melodic which is usually used with python2 
> and support ends May 2023 (together with Ubuntu Bionic it's usually used 
> with: http://wiki.ros.org/Distributions 
> <http://wiki.ros.org/Distributions> - just today I've separated 
> meta-ros-python2 layer with python2 recipes which disappeared from 
> oe-core in warrior and were never re-introduced in meta-python2 (like 
> nose and numpy).
> 
> If you're looking for someone just keeping it buildable, then you can 
> sign me up. If it gets more annoying to maintain in future we can also 
> split it for pythonnative.bbclass and python recipe itself - to keep 
> just the bare minimum of recipes which are actively being used without 
> all the other junk.

minimum is better.

> 
> Cheers,
> 
> On Wed, Oct 21, 2020 at 2:48 AM Tim Orling <ticotimo@gmail.com 
> <mailto:ticotimo@gmail.com>> wrote:
> 
>     I have absolutely no need for python2, I made this abundantly clear
>     when I created the meta-python2 layer.
> 
>     If you depend upon continuing support of python2 via the
>     meta-python2 layer, this is your call to arms.
> 
>     I was originally intending to abdicate any support after the 3.1
>     "dunfell" release, but managed to somehow continue supporting it
>     into the crest of the 3.2 "gatesgarth" release.
> 
>     I will stop all support and actively refuse lo respond to any emails
>     and this layer will be dead and I have zero care in the world that
>     it stops being useful. I do not use it. I do not depend upon it. You
>     are not paying me to do this. You cannot pay me enough to do this.
>     Period. Support yourself.
> 
>     If this is not clear enough, I am happy to have a virtual video call
>     with you that you will not like.
> 
>     --moto-timo
> 
> 
> 
> 
> 
> 
> 
