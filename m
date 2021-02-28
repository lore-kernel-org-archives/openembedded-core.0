Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.2218.1614540603176778749
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 11:30:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QYSV6Yoy;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id k22so8555958pll.6
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 11:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SwalNDBBFdKhHbvbW4skTB684tq9H+bukacX+rI7pvE=;
        b=QYSV6YoyNswW/mdjcZvnOM1I6G6sc/PJXgBH4oyGGfFV2gCt2WAUXv48TBXMlE0spy
         14BPGji2qyo0vNXoh3gzj0CanAMYWSkNWxWvCKvxY/YTqzrZDIcpZI/IcPh21ERnvvmk
         nFfBCFRVm2Q3FR66vr8vFoIFoY2WPjffh33F1tfss7ymUP6GZJkV57AhXzKOPAXpuaJu
         373fP8yLzlJBTMx7NtNKsLoe/leI04KFj3UoUM1NSwkFN+cmiZri+Ml9TdNOJVgxadqk
         6RSHF7UulWbDkB52qCfgkY2NWaDNjep8fxz3ayFjyzs/La6Xp2OzMs1SdzV5gyGszw5U
         dQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=SwalNDBBFdKhHbvbW4skTB684tq9H+bukacX+rI7pvE=;
        b=Fwwq1SNRHevo1XZOvmnT/JmFe84rywSRiteEMrpODCadyD+mrkD7KHYBmiXr8vK4/7
         GdVSP/XwF2dMafizeDCH0N/iK3HLse+T1i2l4juURP50auAd0PPDy7TeHsj8tQkyNPyI
         hj3xsaqHLZ2k0kUIETyjNgILgYOpJ9+GuB2OK1miWKuT+yDTMRBaV3d6wqlugp4Dy7oe
         op+vO68y0dzdGvzDpbxRdusXYlwOsSCM9giPlpI5znCJV5AFDBKcGgLzqk9ceC3b8ewI
         Z+FZV4ebhhvpaRjgFJGdUv1zBdXnLKz3RDSb/j/F5xleRww1j2ezr3UOxomohteEgyUS
         te9Q==
X-Gm-Message-State: AOAM5315jnuSjHv1IBXVTSyv2namsBJBwQztVxBPeLDmanL5YdU1x6X5
	u1TXIASkHmD/ja42ZN+iPbZ81y1rNIt97w==
X-Google-Smtp-Source: ABdhPJxEODvdIaONBP34qq/kE/w8o2Gqyo+6MJhWvWdSv+01vWm04VMuvqnXoY06fUA5m0pBrS75WA==
X-Received: by 2002:a17:902:aa4b:b029:e2:bb4b:a63 with SMTP id c11-20020a170902aa4bb02900e2bb4b0a63mr12468502plr.7.1614540602298;
        Sun, 28 Feb 2021 11:30:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::5d43? ([2601:646:9200:a0f0::5d43])
        by smtp.gmail.com with ESMTPSA id k8sm10866176pjj.31.2021.02.28.11.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Feb 2021 11:30:01 -0800 (PST)
Subject: Re: [OE-core] [PATCH 08/24] libdnf: update 0.55.2 -> 0.58.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
 <20210228153702.498275-8-alex.kanavin@gmail.com>
 <9d7090a0-433c-42e0-98b9-9be7dd0c2cba@gmail.com>
 <CANNYZj_s+=u5bnArB5jvwoUsTR3kz2D_xPtgWivagxEbUy2BHg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <82beb9df-56ea-3081-b502-4fce8a65f4d4@gmail.com>
Date: Sun, 28 Feb 2021 11:30:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj_s+=u5bnArB5jvwoUsTR3kz2D_xPtgWivagxEbUy2BHg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/28/21 11:07 AM, Alexander Kanavin wrote:
> On Sun, 28 Feb 2021 at 20:04, Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
> 
>     It seems __WORDISIZE is what is being used here, a portable way would be
> 
>     #include <limits.h>
>     #if (ULONG_MAX == 0xffffffffffffffff)
>     64bit wordlen stuff
>     #else
>     32bit stuff
>     #endif
> 
>     if we still want to keep using internal libc internal define __WORDSIZE
>     then for musl include sys/user.h headers under bits/ dir are usually
>     not
>     portable and not meant for direct includes
> 
>     #include <features.h>
>     #ifdef __GLIBC__
>     #include <bits/wordsize.h>
>     #endif
>     #include <sys/user.h>
> 
> 
> Can you send a patch upstream for this please? I have filed a ticket 
> which you can reference:
> https://github.com/rpm-software-management/libdnf/issues/1146 
> <https://github.com/rpm-software-management/libdnf/issues/1146>

This is a review so please fix it as suggested in OE atleast since you 
will have test setups I do not have rpm/dnf setups

> 
> Alex
