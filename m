Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.2130.1614540053761321271
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 11:20:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uVGkGiwo;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d12so7479217pfo.7
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 11:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DNGrTNazlIWRZW9MIixB+ie7Rs41SgjzufmKVjfeD5M=;
        b=uVGkGiwoYJcLQy/EeLMVkUgFI/WauxFZgaEKWrhGo9d+vkEl/mfxgc7l7xVOc9/DxK
         deqZ89UlECDjpUtf8b63zaTvD5UoNPY5wpIivC/vhsduSvoPRn+OMjyPJ+XaRLeweAKA
         5eafHfQAbhTkbhTDeeahs9/oKEa529tL0rDuBZ5r4sWScECM2lb3GR+qqHLFTXZ7z2o4
         JjjwbJGyBMpulJJFSZY3rDTqaDoKX4jIkcHdY2e0ugv7MqAqDw4M5smFMBNY8TlY0Fn+
         jnGurQYZrnZp6gjlk2Va+j+3Oep/BIvb79QdOh4W27j8qsMJc6kd9HO1Vc4WEl57GgZ0
         xUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=DNGrTNazlIWRZW9MIixB+ie7Rs41SgjzufmKVjfeD5M=;
        b=jQBesHVG6pwdMNNL7zzcL0hKr4zfBD28eB6fazqxMmuNzb05xqKmR6tQ6eFlcv2lFZ
         VSN+E0ylRtLiTNkiYwzG3a4/8Pr0nRM1mtlMRS3d33CU5YikjNeWH/zLSYukJXOaiUQm
         DhJOqp15pwrGPKgpnFQz8D/pqxWIOWqW7RXj/4HSrvQKkGge3Rxh0fp/jPG972BxDDX3
         WeuPIy2jUyU/Vs6Xb5sGPF9ivkbp+hcQ4RuijOwa1M0wuzxj8dkpadGWhJTm3ZLHZg4X
         +g2NcFfBuqyTjEZsyXA02eK8Sht/xDp02qkKPVMEkRQuxkVhONmEm+UyOxBM+Iyy1uJx
         Pbeg==
X-Gm-Message-State: AOAM5327bl9LmUnUqImD0rQVSYf6QyBK8cJHna9i5KaQlKEJIBAVzfGg
	EEb/10lBaUURTxblEYGBHJwm20OyFpsz+Q==
X-Google-Smtp-Source: ABdhPJw0X7FLH5XvobDyP11QDyfVTKN3Xbatt0uliPDr847WUuF31iB/we9RjpcQFZmvmuX7BcyYww==
X-Received: by 2002:aa7:947d:0:b029:1ed:a78c:59ea with SMTP id t29-20020aa7947d0000b02901eda78c59eamr11881345pfq.36.1614540052874;
        Sun, 28 Feb 2021 11:20:52 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::5d43? ([2601:646:9200:a0f0::5d43])
        by smtp.gmail.com with ESMTPSA id g141sm15072218pfb.67.2021.02.28.11.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Feb 2021 11:20:52 -0800 (PST)
Subject: Re: [OE-core] [PATCH 05/24] dosfstools: update 4.1 -> 4.2
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
 <20210228153702.498275-5-alex.kanavin@gmail.com>
 <c2f9b05f-15e7-42d6-a63b-fa51a876e98f@gmail.com>
 <CANNYZj8jfZGmbh+tq99D8fm5wSKH_hsWRyGoZV3a3TFsCN9gCQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <f7074841-6830-7090-9808-b7987f5c9587@gmail.com>
Date: Sun, 28 Feb 2021 11:20:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj8jfZGmbh+tq99D8fm5wSKH_hsWRyGoZV3a3TFsCN9gCQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/28/21 11:10 AM, Alexander Kanavin wrote:
> On Sun, 28 Feb 2021 at 19:40, Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
>      > -inherit autotools pkgconfig update-alternatives
>      > +inherit autotools gettext pkgconfig update-alternatives
> 
> 
> The new release supports gettext in a standard way, so the class adds a 
> dependency on gettext-native.
> 

ok thanks. A note in commit would be good to have

> Alex
