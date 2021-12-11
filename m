Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 571E1C433FE
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 15:06:09 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.22365.1639235168528186811
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Dec 2021 07:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QXNtiNkO;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id u17so8161700plg.9;
        Sat, 11 Dec 2021 07:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=iD20vym8nAlupPIjyDdIv07zoogZIycCYhjrhDgvJBs=;
        b=QXNtiNkOvIYyKs7BZU7wFDHt3i6JC5WW7tH0g78QlpSsoPfBHgs067KqrJYHDLGMxe
         JAegzAvw7xDw261IE+QbY0aTrJPYscoou14OwS6G/4BRXeortAWIj4//2rA9U0p6ai9t
         C4asSJ7WyyfsCVJ4jxswPsZJyM8ghvh5C/rxGxkc13O+awvvghLrBzPOjGwQl/DWigsB
         y/NODFqQ4hz6a2eh/GSq0x046JchQ87gWcVwf7H0kL5PMh3vBBB2q90YZl3sCHgZos3I
         j46WU8BWB8dEduOMba8maPCNkB3OWPWzCoKoykineB+riFmKBoKfT8w3BwEn08iZNxTg
         svFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=iD20vym8nAlupPIjyDdIv07zoogZIycCYhjrhDgvJBs=;
        b=mBLMC3vcfjgalFL0Vg4hWCBTuuEj1TYn19O+RQA+EKPRyZ0iB2yXwSvz0ZFGV7kfgm
         2+8/SwDFk2B1iWIQYk+vURypG0iMYTLXoe2TPEgtwsbhm0QX/hIn/LIIaEDWzrK7/76L
         kBLTh3N4HB1QCTrJrM9+c84dDgATlBOFkWpyu0+W0dmKLyyziZjUBmKm4bKSOvzEFH7n
         CIglTAe9MOd01fIk7HkrJsrFfa+xF0w/IPLyZE8EJBB91sllVDQPwgr6NbNs3h9xHAOR
         BkcaSaLQcQv7J2j3c3fr3/0meTQWAJd6ByNQc0mAx56W0YKQYkzfkH4HuE2+1lHjQGga
         hTdQ==
X-Gm-Message-State: AOAM530NvJavNyz+17TMrHi4P3+edifQyOopGnm6ALlaGCrkeCUmvt9T
	A8/DyOgg9V/XBbDcxRj8AnWgistuvKc=
X-Google-Smtp-Source: 
 ABdhPJzRqRbGFdclJqbK0mlfUjN7jfgTgoNhO5e2Cmtb/dmqdlps8H660O1hN5curh3SeYBmv9Ljbg==
X-Received: by 2002:a17:90a:ea04:: with SMTP id
 w4mr2303203pjy.61.1639235167770;
        Sat, 11 Dec 2021 07:06:07 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:2ca6:9349:4e37:cb69?
 ([2601:202:4180:a5c0:2ca6:9349:4e37:cb69])
        by smtp.gmail.com with ESMTPSA id
 f8sm7277995pfc.77.2021.12.11.07.06.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Dec 2021 07:06:07 -0800 (PST)
Subject: Re: [oe] Help with Inclusive Language in OpenEmbedded/Yocto Project
To: Jon Mason <jdmason@kudzu.us>, yocto@lists.yoctoproject.org,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: 
 <CAPoiz9zni1rhmpFP+YOeseYyaT7BJGE_oZjYbDicWiYo5x0_eA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <b96dfb84-2099-d40d-9594-27d7154dfa6a@gmail.com>
Date: Sat, 11 Dec 2021 07:06:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CAPoiz9zni1rhmpFP+YOeseYyaT7BJGE_oZjYbDicWiYo5x0_eA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Dec 2021 15:06:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159568



On 12/6/21 5:01 PM, Jon Mason wrote:
> This email is a follow-up from the session held on Friday at the
> OpenEmbedded Developer's Virtual Meeting (see
> https://www.openembedded.org/wiki/OEDVM_Nov_2021)
>
> The session was not recorded, but the slides can be found at
> https://docs.google.com/presentation/d/146ueVVTMeA8JI43wqv5kFmdYEygqqmfGH0z1VRL2bDA/edit?usp=sharing
>
> The outcome from the discussion was that inclusive language changes
> are something that we want to accomplish in the kirkstone release
> timeframe (with an exception for the "master" branch name, which will
> be handled at a future date).
>
> There has already been a pass at collecting the needed changes at
> https://wiki.yoctoproject.org/wiki/Inclusive_language
>
> This is not as simple as a find/replace of offending words.  There is
> a desire for backward compatibility or to provide some kind of "you
> want X, which is now Y" (which complicates things).
>
> The intention of this email is to see who is interested in helping
> out.  Once we know how many people are available and what time frames,
> we can plan out a roadmap.  So, please email me (or respond to this
> thread publicly) and I'll add you to the list.  There will then be a
> follow-up zoom call in the next week or so to plan out the roadmap.
>
> We will document the roadmap and everything else on the YP wiki page above.
>
> Questions and comments are welcome, but not interested in debating the
> necessity or timeframe of this task.  It has already been decided.

Thanks for driving this.

please add me to the list.

-armin
>
> Thanks,
> Jon
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94219): https://lists.openembedded.org/g/openembedded-devel/message/94219
> Mute This Topic: https://lists.openembedded.org/mt/87555753/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


