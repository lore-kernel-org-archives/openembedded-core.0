Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E1FC433EF
	for <webhook@archiver.kernel.org>; Sun, 13 Mar 2022 12:25:56 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.14697.1647174354822013511
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 05:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YtHVqjL5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id r64so48378wmr.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 05:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=XhlXBB+5yDiyaSgY0jDvfZbtoNTGgc47yPydAa1HJyE=;
        b=YtHVqjL5cbdubtxXNYb/70+/tqJAHx7P8myi03NqDZNizt9i+VnFYmq5AU37gUq1vR
         +RenIvSqn3qNiBxqkLq/4bEQDiCiyx6F8YT6lNlb+kqbxEhc4luPor2haK4MCZqZ8i8P
         m9mtVUwKLc5aq7gtMIXg2/Xrc13RxyXkU2Nt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XhlXBB+5yDiyaSgY0jDvfZbtoNTGgc47yPydAa1HJyE=;
        b=D0V+5F3rI/sSBQblGiTNra/QfeOKIQuevL0wEvD/B2BUx6F+XM9H47bouLTj6o9E83
         g1Kk3K7HioZ1RpUvP3SUvQZ0iNsbzYYCwDT/CPIxZuG0lpL9b+m54DxBoetxsi3zuPu5
         068rhE3ufbNSPTWKuob9jGe4dPNnur07HhgVheCZM67xCCkVoh+LAJEWfcKKvaHyFK6F
         RoW/aUUlNmRSnbqGdc9oN/Li01NlMAg8VD8Zz8NJFC/eKwgh0yjh7meVNhwOjwJssUPV
         S3pn5GisVyKbx0fPmZ2LnOPYzsufkaHuN9O1F3yCGbkxkD3zpQr2v4SGDt31wQLz4H7+
         WoTw==
X-Gm-Message-State: AOAM533QTcyPQYxg7zBzPk2j1RLY8g1NoJj3t/1d2pQ0TekyT0+qbvQt
	bEC9Wd4if1iJ0blkXl9KofoOf7cdJwGJGTOF
X-Google-Smtp-Source: 
 ABdhPJzS3lpLxmdjhr5RNgRMXCeJlqqAEimIOuvDmxYdpOHOBU2LRmsAKnApKiHQQczq0wQSu52xIA==
X-Received: by 2002:a05:600c:3556:b0:389:f440:50e6 with SMTP id
 i22-20020a05600c355600b00389f44050e6mr7904004wmq.159.1647174353457;
        Sun, 13 Mar 2022 05:25:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cbdf:7d09:95e7:c814?
 ([2001:8b0:aba:5f3c:cbdf:7d09:95e7:c814])
        by smtp.gmail.com with ESMTPSA id
 o6-20020a5d6846000000b001f044a8e214sm10666891wrw.107.2022.03.13.05.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Mar 2022 05:25:52 -0700 (PDT)
Message-ID: 
 <6359f411dd570f3210d760193cb829a611b5cdd5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 2/2] libxml2: update to 2.9.13
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: openembedded-core@lists.openembedded.org, tony.tascioglu@windriver.com
Date: Sun, 13 Mar 2022 12:25:49 +0000
In-Reply-To: 
 <CANp-EDabBmKp_g+QHwR-8ZX0quA-g9_71Kj9+AeCWZBS3cVvBg@mail.gmail.com>
References: <20220311165855.3477645-1-ralph.siemsen@linaro.org>
	 <20220311165855.3477645-3-ralph.siemsen@linaro.org>
	 <16DB979A6291AEB5.27059@lists.openembedded.org>
	 <aca7cb219caaaead1f29d3376cf0176a45b964c9.camel@linuxfoundation.org>
	 <CANp-EDabBmKp_g+QHwR-8ZX0quA-g9_71Kj9+AeCWZBS3cVvBg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Mar 2022 12:25:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163106

On Sat, 2022-03-12 at 18:51 -0500, Ralph Siemsen wrote:
> Hi Richard,
> 
> On Sat, Mar 12, 2022 at 9:04 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Sat, 2022-03-12 at 09:19 +0000, Richard Purdie via lists.openembedded.org
> > > 
> > > One of the patches is upstream, the other isn't. I can't see any patch adding
> > > pkg-config support to libxml.m4?
> 
> Thank you for reviewing and noticing this error.
> 
> > I added a fix to the patch to resolve this one since it was just caused by
> > typo/message fixes upstream.
> 
> And thanks for this as well! I had planned to work on a v2 tonight
> after the little ones are asleep, but seems you beat me to it.

No problem, I realised it was a straight forward fix and it was easier to do
that than drop it and wait for the v2! :)

Cheers,

Richard




