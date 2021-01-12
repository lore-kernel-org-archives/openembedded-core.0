Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web08.14448.1610478610369916980
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 11:10:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mhcxJhYh;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id m6so1952270pfm.6
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Jan 2021 11:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=l9qEFEhc8u1y3cKFFGQ9pIhTtW7gYvO58jUypsx7pQ4=;
        b=mhcxJhYhWEiT/UG4Rr51/4HMM39FyxA+/5h1RuOJJ1M7kmfv5ldvvkl9EQ+iXYYCq8
         SH8SzWP8YBy087aPUJXHS4Dh4r4wm4K0v8dec64jhKakQwcGtIxY7mHsmVie5qBIlKse
         UE4uvK6mSBFVlKda9NaUJ3EyGVqD+3dnHqAKjuUuekSdFK8/mg3rVhc04DN7BwnCEEuA
         okgnVrgeMT/uI0nsxu5RI63pIum8lERwI4okjuAQ1BSAvD+jomNcharyUMEcVl7iK33g
         SxsVdvvp0q9n6csb5fHLcJ4zEiXJIfPMwT5EuB0gLVrR2kUEuEwTzQwhBMvCDP5D8e+Z
         pEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l9qEFEhc8u1y3cKFFGQ9pIhTtW7gYvO58jUypsx7pQ4=;
        b=FAnnKnQqs5QNq3tAx2+0GXeKSePmuDMASN7Xkmk/5HS32OYxqRYHe65QwvFb8k+qhp
         Kv6ngTFn4cb7/UJE5QSy6Bbw4cfTuUKf0iqNUA4lZ4u2wF/Jp3PAXrQsIfZvFM8WEqPe
         PyBxx/jvrc8QPdzwZhACeQ3pgGpVqoY19o4G/gqncVwl9MpfeysQ9qAXseM0fjJ9+5/3
         vbj2QgdF/jL/ouoPumoyXd602SQG5O+ymZjoVz2x8IVSVU8YyMkzjyYiXojtFkzh31rE
         hPT9XE9n1qee4cY6JXy32Xvg3bCVQbjyJ/IN7m2BiDwg3xhDmXW13q7kTIdhvJpU7Yw3
         BAKQ==
X-Gm-Message-State: AOAM532GYdfrHOJNJpx0qSL1r8X/5iEuxWwM55uX3NQqNAcK4iYjIKPW
	rF8wrW3cxh6le8iV/MJRQ7w0X1fXf/6TbA==
X-Google-Smtp-Source: ABdhPJwhZKbxeAUPdkdLOkWgY104ARvvG1GW3MqjnMANH9T0Yx9ztEhZtVdGqAXEWD4h2b91R1XB6g==
X-Received: by 2002:a62:ea17:0:b029:1ad:4788:7815 with SMTP id t23-20020a62ea170000b02901ad47887815mr697339pfh.1.1610478609481;
        Tue, 12 Jan 2021 11:10:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::248c? ([2601:646:9200:a0f0::248c])
        by smtp.gmail.com with ESMTPSA id l12sm427444pjq.7.2021.01.12.11.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 11:10:08 -0800 (PST)
Subject: Re: [OE-core] [PATCH] binutils: upgrade 2.35 -> 2.35.1
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <1610424117-18134-1-git-send-email-wangmy@cn.fujitsu.com>
 <X/3BRVxDbCncYdSV@korppu>
 <CANNYZj9Ad10xxhHWDju3UDCxBmEoJ6YkwBnPiLZOoOz7TdDMYg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <1bc519d3-b1cd-105b-9d22-63f8176607e7@gmail.com>
Date: Tue, 12 Jan 2021 11:10:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj9Ad10xxhHWDju3UDCxBmEoJ6YkwBnPiLZOoOz7TdDMYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This change is fine, they are bugfix release only. and yes they can be 
backported to release as well.

On 1/12/21 8:29 AM, Alexander Kanavin wrote:
> Maybe Khem also has a patch in progress? This update has been pending 
> for a while.
> 
> Alex
> 
> On Tue, 12 Jan 2021 at 16:33, Mikko Rapeli <mikko.rapeli@bmw.de 
> <mailto:mikko.rapeli@bmw.de>> wrote:
> 
>     Hi,
> 
>     Would be nice to know a bit more of the update, e.g. a changelog summary
>     and wether API/ABI changes are in it.
> 
>     It's important to know if the patch is also needed in stable branches.
> 
>     Cheers,
> 
>     -Mikko
>     
> 
