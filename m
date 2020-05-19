Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web10.341.1589923212060754568
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 14:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PkXda0d+;
 spf=pass (domain: gmail.com, ip: 209.85.208.195, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f195.google.com with SMTP id u6so1304609ljl.6
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 14:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ty4fSzKoVRzT9oJk/rMoc35RKwW10NFN5vIAwD94PjY=;
        b=PkXda0d+/DspP5au2hqCIJGUz+Mv8VCHTX9eKlXc6LEZZvFcsiRdfYAzHpd2C/awpl
         gWgKUON4PTlU7n9m7s0pq2imYtYDff8S22sN8DjR5xIDpD4jm5JAzlKIjFGp5NL5Syf9
         YX1SCmgq6V02lhuwzkjQdPkf2lfg9dl95vZ6vyqPWbEEDGGha64VxAm4tT8R7e8Y6tDW
         Es52keiNBBtEyIR4lUAWF/5EDcHmrbIEpRL7kCqGzYUph0Y1lxGzLAteyoLZla7Kuv7Z
         3C+BamgE5OeNxk/KA4i/z+G960FaU6GPh0+zVupytIJYBXIjxE42jq6H2nereDP4Fv6K
         qn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ty4fSzKoVRzT9oJk/rMoc35RKwW10NFN5vIAwD94PjY=;
        b=Q7YNsJhawFaiN8TQQS/1YDJWKhObd0QBFqGbq4ca5WR43EgMXp02vJLZMgkSzG8yH6
         lxqwqKXU0noKcvL21vSHAUlydYDlXjneA+iSUAvzn2YOEKuXA5p3MTjb2NvIg/esxk7V
         p6wlUecS93q698evg1/JXq+i+tTfkM8D6ONCVtJqiw/TXoulgNgRlHAmZdaESrEoHXL+
         rr3P96opJjQgGcWuJnL+wqc2C/HnobgcKRqfsvfSJ4Y3f9NO1qWogrhqULhev+dQ93in
         s6V+Z0B0AieMg/3u2MP78xC7hzNHLTgif3fiIDYkeWk7G07mGaeg/tkZFbRQqU6LAq32
         K4Ug==
X-Gm-Message-State: AOAM532Y5PH+WiXno7O07Hfqo1byEAawJ0BLggkb/0g3aDZv/v+T/pw7
	NhanLOhIdcs//Gd1uPlX31o=
X-Google-Smtp-Source: ABdhPJwUWPeJADQaC1QggG4wY7mrwczmWJWWzJIsY9Lvaf33MI4dxozMDySrVwWmm5i9asSx0S4K8Q==
X-Received: by 2002:a2e:3517:: with SMTP id z23mr786296ljz.147.1589923210239;
        Tue, 19 May 2020 14:20:10 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id q17sm297391lfa.28.2020.05.19.14.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2020 14:20:08 -0700 (PDT)
Subject: Re: [oe-core][PATCH 1/3] squashfs-tools: gcc-10
To: Joe Slater <joe.slater@windriver.com>,
 openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
References: <20200519210928.1995-1-joe.slater@windriver.com>
 <20200519210928.1995-2-joe.slater@windriver.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <2bc4f725-a63d-89be-3292-8c6d2fd2faea@gmail.com>
Date: Tue, 19 May 2020 23:20:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519210928.1995-2-joe.slater@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Joe,

On 5/19/20 11:09 PM, Joe Slater wrote:
> Add -fcommon to CFLAGS to avoid multiple definition errors for uninitialized variables.
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>   meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb | 2 ++
>   1 file changed, 2 insertions(+)
>

[cut]

I hope this is already fixed in master by:

https://git.openembedded.org/openembedded-core/commit/?id=bae1603a27fadcfa7257801167f28db3ff02dc97

?

/Jacob
