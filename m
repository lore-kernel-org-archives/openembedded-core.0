Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web11.5420.1631700019513027945
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 03:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P97laJet;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: jupiter.hce@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id u8so2194192vsp.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 03:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RxyEP8+p2jNO0umxn71RwTVIypNbS3V1qBSuuphe6uk=;
        b=P97laJetPlV7ibZ2azxtBFba2/pQ3wHb82f3j/OqjXpjdndxrFp5GfRmX6NEIVHOsQ
         sjzQZbaLnZz1b61oaRBGQnjQvd3GJXuGC1T21XuVGFbH24+/Osp1+E/fxXX4Myvuw/R3
         0H2w7DdCdScCJkY80XboW3cE/V6xWeUBT4PXF8To8TwgHz3shKSU4jI9luVgCioVShTx
         lPdtzpAVNxQ3LkUJ3f8L7meMU2imZjIAS2ajZAaoXEJ1VrFgG/m3uoUeK0GPDp01ZkpD
         xlwTIpmz8rd78zBK6vor0Sv7RNzkRJBE8rroMPWKYAiPsT+yEu1s5CFg/x1oGRD0Nu+9
         +wWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RxyEP8+p2jNO0umxn71RwTVIypNbS3V1qBSuuphe6uk=;
        b=xhkHRrBKjag5/3V3dvPZ0/psGS4IrSxS6pVXG/e6D4YSCmgnJE+lEg/EsUfKEFDVsC
         BZQzZbQDF41hGrZSaJ4twgbbKArm5I6KT0qHcCqn35N+JWIoIsbLfHpGT5wlFF2usDpJ
         DP+3HdPzP3QtcPxVJqwBXWlfGuHr/PNVkl6hNte56Zhbc8zSlE1B+EiSEQgqsylg/lpr
         8PbeDtCgQ2cqZMPkChAZ3rbx4VPXkxpNancyuBwZ3ujoafiRXPRqetdl0KXwBYpO5eb7
         2Imrfe0oXktwSWqIoUKcpSfW8z1FM/yuZE2P9iJZFdkbyVBgHwx1C8y+LZJtD1mdH6N1
         jvkQ==
X-Gm-Message-State: AOAM531ckdgMK47FpaZC4wAgXPrEAhcgLaGEJ+OkWKQMujabLlMQKOet
	dJXaa48X2nLAAzsxMQoJnUY77kLDke4VpuQ/bHKFPXrI
X-Google-Smtp-Source: ABdhPJzT+um+ujUuImHKSNwdUWTuJphiD80FFL+DDYBsRhaB6HFNUbUBTLAS5jUTcItCfKuW9bHFQRjY++ICXNxn4lo=
X-Received: by 2002:a67:2dc2:: with SMTP id t185mr2393512vst.1.1631700018599;
 Wed, 15 Sep 2021 03:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAA=hcWSnctuvZNc=vcAn7-u6W3DHRiLLk2chhgNSyr4s=zNuqw@mail.gmail.com>
 <d7158686-8c8f-e7e0-70c7-db2d433a1c6a@windriver.com> <CAA=hcWRdHaeu0ACq5hSLcy6+KxvAxqrcuTzwSR814kEabKk7nQ@mail.gmail.com>
 <de5c2b1a-e94a-815b-20f6-0adbbe80925b@windriver.com>
In-Reply-To: <de5c2b1a-e94a-815b-20f6-0adbbe80925b@windriver.com>
From: "JH" <jupiter.hce@gmail.com>
Date: Wed, 15 Sep 2021 19:59:42 +1000
Message-ID: <CAA=hcWQrwSSMS+bWaPm9SByFbiRHMZf5VJ63ECK2ToUN=SGoow@mail.gmail.com>
Subject: Re: [OE-core] OE systemd RemainAfterExit does not work
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Qi,

Indeed that did the trick, you rock!

Thank you so much.

Kind regards,

- jupiter


On 9/15/21, ChenQi <Qi.Chen@windriver.com> wrote:
> On 09/15/2021 04:32 PM, Jupiter wrote:
>>> How about adding 'ExecStart=/bin/true' here?
>> It was my first try, but it did not work so I removed it.
>>
>> Thank you Qi.
>>
>> Kind regards,
>>
>> - jupiter
>>
> Adding 'Conflicts=shutdown.target' seems to work. I just did a quick test.
>
> Regards,
>
> Qi
>
>


--
"A man can fail many times, but he isn't a failure until he begins to
blame somebody else."
-- John Burroughs
