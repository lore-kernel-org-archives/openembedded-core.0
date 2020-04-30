Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.1132.1588268036102163546
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 10:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nnliKu4o;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id m67so6543551qke.12
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 10:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eMnyDaIl5ZTteEUpdHsby0NXzSx1Tt0rpWut9WWKh0M=;
        b=nnliKu4oWNLIGMPgHg7k5kfr+1J47YpukV1GQcFs6mYobHnDvAaKAnvb9Ir3B6vi0N
         RW6He/McWx9e5gNaSYbepGyFlt27gF8hZwnJw0d+TwbLhAAB5QMHo8PXi13NowWWg0a9
         meMSkEyn+D6L+iNqX8WFK/vpVY0P9aTzFv5weD6uYDT9q2PCIxKmc1mJ238HjhOymVV/
         RPnF/AHWlgXcJQFCztKOA6UkoW/w2nQgdgL+qM03Uy5bB8bi2y6v7OabTuDOMz16srSc
         yq9wKA5+dJtH/sZzLNJ/9ooh/kc/Jjole+ktK8Hn0N0VuDZfXftRb0ybRYkGVRRsEWlP
         qhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eMnyDaIl5ZTteEUpdHsby0NXzSx1Tt0rpWut9WWKh0M=;
        b=JgqdltF1XGK+aIlds19VB6b6Iu7JYE3aRkcuGBki7SCDqdnqkYYYKG+xlGub33Z3FZ
         qHYUUlBZL6hQToAeV+eqlB3ausqXVuS2FFE47BR8TNuQzsk7x3tzlASexOgqhJv5G5dd
         fz4CSjdIbFzVjcu+s5E7+6ibg+irHlIrpuDarRNNYUl9xUJARjxyMqV5MeH1pozfu9KI
         2zJZe4OcQw1ExXkdMxwmgdc4+h1MtWtZoT5yCr4hzQxK3bCA5fmmJXtJWA8erTfLQzpL
         wCUOD7zN+VllC36I6nvQGBaeHyxY2IWtR2QFMAM4DgcedGrXHd3dM2VqSwXIJHkoI0Tj
         UVeQ==
X-Gm-Message-State: AGi0PuYyp7XHVKLrk2vMAH5fbZF2di8+gzFgLmOx+mQRdfnw8PC2AiuZ
	2OROTb7ao9h+Dfl3ovBO8ts0d5ziXOE=
X-Google-Smtp-Source: APiQypKr+1o9TyVtjsPl0uY0FVvnzoirHOCACM57wRpUkzJQj4WqN1gFaKcPHILZwCwt9hM82l6Gnw==
X-Received: by 2002:a37:ac08:: with SMTP id e8mr4370781qkm.439.1588268034824;
        Thu, 30 Apr 2020 10:33:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:e02c:9432:3945:4d16? ([2601:646:9200:4e0:e02c:9432:3945:4d16])
        by smtp.gmail.com with ESMTPSA id q17sm235869qtk.84.2020.04.30.10.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 10:33:54 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 05/17] kmscube: update to latest commit
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20200430095815.2824-1-alex.kanavin@gmail.com>
 <20200430095815.2824-5-alex.kanavin@gmail.com>
 <3bf99c3f-7ab1-d4ad-e8e1-c462222c34a8@gmail.com>
 <CANNYZj90=e_zRbAcUT5zNZ-S5StHgPTJg_EJwp_4jdQ15ykWuA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <6a314323-ec76-5375-c37e-dfb5f32cfb71@gmail.com>
Date: Thu, 30 Apr 2020 10:33:52 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj90=e_zRbAcUT5zNZ-S5StHgPTJg_EJwp_4jdQ15ykWuA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 4/30/20 9:33 AM, Alexander Kanavin wrote:
> On Thu, 30 Apr 2020 at 17:46, Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     Does this mean it wont work with systems with mali gpu drivers any more?
> 
>     if so, then its a regression, we should not drop patches just like that
>     perhaps.
> 
> 
> The patch is unmaintained, hasn't worked since kmscube was switched to 
> meson, and there is no way for me to test it or even understand it. 
> Anyone with an interest in mali should do the work of getting it 
> upstream, just tossing custom things into oe-core does not mean they 
> will be kept there forever.

I see if it has not worked for long, it should perhaps ok. and meta-arm
might be better location for this if needed.

When we accept patches, we sign up for some maintenance.

I think it was appropriate when it was added, we did not keep it up. We 
switched to meson without porting it, perhaps it should have done then


> 
> Alex
