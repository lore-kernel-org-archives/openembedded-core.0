Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07B7C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 18:35:40 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.1240.1668796533786483524
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 10:35:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=adplMX2U;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id t10so7896923ljj.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 10:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vfMJ1zKY7jEiPS+q9wO+YYW+7NesDF4J1DxiXtWmnRA=;
        b=adplMX2UNftwYAUwSUW6A+ZmJuEo8MT/B1Ap9ew2qrgClm6ZqY5nN998cnqf4LNXrm
         hCXbHWY7ko5vpP6kD+Q7L7mLk5iwusnGObiTfHlbqfoGnhVLSybdpkneau+PqweMXLAJ
         m5/HDqqdzW8fe2o6NWFALkrvEiLkdXbBYF6vFA+S2ppFhc6betgKmIy9Vy8FBOAVT+s4
         i43Yt9GW4DXDzS37dz8WiFDwvDn97g3IWkh+VMV9CX8Gbg85glqf1CUKQn/ZP9r/yBQx
         R+fqoJIArlwT3k52enGAeobHdKLNyN1RWSlXlA1ZF+Du5Z2cDTnqgmLwLGKXFG57HKY3
         5aQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfMJ1zKY7jEiPS+q9wO+YYW+7NesDF4J1DxiXtWmnRA=;
        b=NUQxgmt748vHs1s4MBkxilBdaG8CWf3ZHlWqXrzSTJ3Z3XhzuKAWxFRPEMW+8TO3Fy
         IkypY8Jeo/FUIPRQxJkPfsqQkYrE1zqaeGJ131JmktSrRJMUkjHzf/U+0G5s1Ix525i7
         41Z7YzbemJUb9k227rV2BIJ/xDZX0xABdKnZSLtEllRfCbgNRMBcK5rQs6GrRxg9cnPG
         R1EjWK0pkx6AGEZ/HQ1ksJd2oYC0OmjQp/JuC+zTqJurD9WfvIcXy/j7pnl82pTaxBxu
         +7Ddhg4K7PutV2kbxrlDYDNh/MXUsOTTeVhb1DfFD+kvV2KR1H44znH3uM3jtnNaLGK3
         NJNQ==
X-Gm-Message-State: ANoB5plA+b4TJFvAcZUT18L8N5vhlO9+tXv1PX0rBoARBv2E9qb/lYZh
	Tmw8EL6FBjvsvOjvuKkSgNxB+j/rBsSTqMmxtp0=
X-Google-Smtp-Source: AA0mqf4Rk/HUVVZ4woRJw3sCiJxAqAIevsvRzwtOJrdqcI/PoOf/wJrpWQ7WF42L6D67skJfvOnoCiAYsdAkeM+c4+k=
X-Received: by 2002:a2e:bd89:0:b0:277:e01:6119 with SMTP id
 o9-20020a2ebd89000000b002770e016119mr3191090ljq.33.1668796531784; Fri, 18 Nov
 2022 10:35:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1668793524.git.tim.orling@konsulko.com> <CANNYZj-YNwTDML-t_X-6VBC1YhyDSGg9Z7WK7H=yX=MgXNkSbA@mail.gmail.com>
 <CANx9H-AmzbTyy2-++YwKz8qYXabsYQDRV98+VTU4NKhbmTMonA@mail.gmail.com>
In-Reply-To: <CANx9H-AmzbTyy2-++YwKz8qYXabsYQDRV98+VTU4NKhbmTMonA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 18 Nov 2022 19:35:20 +0100
Message-ID: <CANNYZj_c6FhwH-wrYzUVpKDCj1+qvJJuZWpADB1_PS_pjeYNiQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/5] liburi-perl upgrade
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 18:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173490

On Fri, 18 Nov 2022 at 19:24, Tim Orling <ticotimo@gmail.com> wrote:
>> I trust all of the affected recipes still pass 'devtool
>> check-upgrade-status'? AUH won't work if that is broken.
>>
> It doesn't matter when the author changes and CPAN changes the URL out from under us. Unless we figure out a different URL to use for the AUH query.
> liburi-perl was happily reporting no change for a long time.

What I mean is does version check work properly for the fixed recipe,
and the ones that were newly introduced in your patchset?

Alex

