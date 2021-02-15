Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web09.685.1613427736964242927
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 14:22:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZpgaOtoE;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id u11so4422096plg.13
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 14:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=OFbbvHm1/6o8/QRyYGI/sWWdQv7Xnns02e3u41cUdVs=;
        b=ZpgaOtoE2oebhTRojII+bmQcXN0+jJEh2uIue82MQpNPp9Mq5zaE5Bd7pqAXvkicHH
         RcFRgxNdIPrTkKSOUtYiDYUrWlHm+op91qwJjfEX0lKCnL/a5gD0SGMQDc1CzNOfymbu
         chOukCsikGqsYqJMdBVzWGcc6/ir0Uzxeya5UasPMvIJ0k31m++DHUnuoI0UYdm49eCV
         fFr0iQ+sO97TufO/oyweex3eUlvCzWfqe4qDwM1DtU6QP1sOYKxTnNgEVeB9vvgaChv9
         sSyy+BhksAldE2Qi0BgXKgfz2aVz489hLOLW4d/bsuD2q/WvyB0odUek8XnUd0a3izZm
         i1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=OFbbvHm1/6o8/QRyYGI/sWWdQv7Xnns02e3u41cUdVs=;
        b=D2SraWOIDNYHiWNXaGAbDxSQQeF0Rj8udfPSbla8Qg2BaHKQAncoFskilrPPuI9mEl
         OF+1mupHXnU4IKj1RGtN/R9KecQPgJpUYIg7LnoGFa3ahdl/cvVMpxzRDW1PvLVNnjeJ
         icTiARMh6SCk/TP4EsplZzLQI0FwK7v581upprXrOEHDqEd8ELRn3hWOuLHHpK9LwxR+
         tRvEuTeyNdOkjOoDpfAIAyPyJk/lev9s0tYsHFG1AEAmV2oCLSDrIcJN4dJ9k+LgxNEd
         Dw4PZW7pFKsC1ieynNoCuOiYbFqP1syj1fmrUxP3eMxpVnw9w9N2mKqsH2/NSnNA6EUE
         rQ6Q==
X-Gm-Message-State: AOAM532O3MbjMI8X8PkSWxPZ378o3dFhfXh90O7bAsyuZrTpf8gtGaGD
	aEoDDk2dRimQRwtXGHE2odWiJyJN6oo=
X-Google-Smtp-Source: ABdhPJypZkQG8Lh1nlfQtTIYcFPcmy8w+8SO2DQMXu2JQ93VUh+kxATMb/iXcChMWs6OGWUYXZ9REA==
X-Received: by 2002:a17:90a:7e94:: with SMTP id j20mr991741pjl.8.1613427736054;
        Mon, 15 Feb 2021 14:22:16 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from [192.168.18.10] (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id 30sm19852365pgl.77.2021.02.15.14.22.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Feb 2021 14:22:15 -0800 (PST)
Subject: Re: [OE-core] upgrading pseudo on zeus branch to handle gcc 10?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <ca75402e-b19-4796-ff75-4769e628ea2e@crashcourse.ca>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <bda3e653-f49f-6464-c47e-48b58c89d07d@gmail.com>
Date: Mon, 15 Feb 2021 14:20:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ca75402e-b19-4796-ff75-4769e628ea2e@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/15/21 12:11 PM, Robert P. J. Day wrote:
>   yes, i know fedora 33 is not a supported build distro, but in trying
> an absolutely stock build of core-image-minimal from poky (zeus
> branch) on my F33 system, i ran into a gcc 10-related build error for
> which this:
>
> https://git.yoctoproject.org/cgit/cgit.cgi/pseudo/commit/?h=oe-core&id=a44361b8d3fbf5fc40cd87b599caeb380454efbe
>
> would appear to be just the solution. so is there a proper protocol
> for handling this? should the zeus branch move up to the incorporate
> that commit? or what?
wouldn't bbappend of that patch work?

-armin
> rday
>
> 
>

