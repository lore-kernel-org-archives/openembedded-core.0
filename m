Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C10EC433F5
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 21:20:27 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.152.1649366081863784158
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 14:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JB+yteIT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id d3so9752492wrb.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 14:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=JkH7q/vCrpwyWi7ZjjuQLUMlWUhQOT94WHlY2uriDak=;
        b=JB+yteIT27/YJtXr7PqnMP/qMLihAD1ZkDYMZku7MYa96IRGGFCcnTupJw1ysT8KH6
         v0b+QxdhBqFrW48lAG5TMfZsEn1TH6w8fmRHboL0gbYzisSbKMvod1xl7UhRd0kaLEuD
         2ryvvFfUHirtuxmpP7BqpjZdvBJ3Ejc+lKg/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JkH7q/vCrpwyWi7ZjjuQLUMlWUhQOT94WHlY2uriDak=;
        b=FQx1+AtC6bX0WWpnoFpox/1Ob/2Z9vfKZWs4Q3RZaQkPKQNmYcH+wu5UCjGUFOtkUO
         rSoYlbGMfBZn2D9FbWK2ye9tfxS9yWrSjPRgJymzEPW9dzdFRjierxMRI7Qq+q2LBM/L
         EKAVqz2YgLq9n2P75UBDHcAn0mnMJZXHxSA9oNPq28INGhxHkeCE07wvKIz7UhoAvRy3
         F2KS2gD9MhXZy/adlUvLtHNcxpJU8cA6nQzFIvSEB5pJOGD+grAith3vjq6oqjA5tS8J
         TIQ1WNyrF4ZMBOYhwbwKy8whdFyMJ2w5rLZCW5AAzQqm58kXZ6wn5ptL4FCjs4WqGNmq
         A6zA==
X-Gm-Message-State: AOAM533Zo8wygSu87bWZkMy+A99qc49Co95trOiNX5m0ubxbsf46I+Rb
	dOy+lXNeqGtXgHlXuYRm0UPBWg==
X-Google-Smtp-Source: 
 ABdhPJyZj/Uod2WvIVJf5SdM9skgKR+QXincwJrCTguzd3QDS0E8gv0ONbQUOf9aiqZ70YAPCc0Xhg==
X-Received: by 2002:a5d:50cb:0:b0:206:ba2:1654 with SMTP id
 f11-20020a5d50cb000000b002060ba21654mr11741729wrt.369.1649366080411;
        Thu, 07 Apr 2022 14:14:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7523:62f1:cfc1:cb4e?
 ([2001:8b0:aba:5f3c:7523:62f1:cfc1:cb4e])
        by smtp.gmail.com with ESMTPSA id
 y7-20020adfdf07000000b0020609f6b386sm14360475wrl.37.2022.04.07.14.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 14:14:40 -0700 (PDT)
Message-ID: 
 <5f46e15c41d78c02ea184f98341c4bfa384b6fd0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 17/17] python3-typing-extensions: upgrade
 3.10.0.0 -> 4.1.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex@linutronix.de>
Date: Thu, 07 Apr 2022 22:14:38 +0100
In-Reply-To: 
 <CANNYZj_eX18s-D9=_ZhOtdhOJg4PhJHgzd9Pa6Y9MscHEn5X5g@mail.gmail.com>
References: <20220407170029.3500874-1-alex@linutronix.de>
	 <20220407170029.3500874-17-alex@linutronix.de>
	 <CAMKF1sqJLvgJh__jq2biOrkm_M6zw4ibkxP7u1s1rZPEbyLa3Q@mail.gmail.com>
	 <CANNYZj_eX18s-D9=_ZhOtdhOJg4PhJHgzd9Pa6Y9MscHEn5X5g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 21:20:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164147

On Thu, 2022-04-07 at 21:45 +0200, Alexander Kanavin wrote:
> On Thu, 7 Apr 2022 at 21:43, Khem Raj <raj.khem@gmail.com> wrote:
> > > -inherit pypi setuptools3
> > > +inherit pypi python_flit_core
> > 
> > has this module made a move to use flit instead of setuptools ? if so,
> > perhaps adding that info in commit might be good.
> 
> It has, yes. I thought such a change is self-documenting.

I think there is value to mentioning things like this in the commit message as
it shows you were aware of the change and made a conscious decision and it shows
up when looking at change logs too where you wouldn't normally have the context
diff without specifically looking it out.

Cheers,

Richard


