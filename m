Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E9CC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 16:15:11 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web12.15189.1638980110874000835
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 08:15:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=K7J5nJAk;
 spf=pass (domain: konsulko.com, ip: 209.85.160.172,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qt1-f172.google.com with SMTP id t34so2627337qtc.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 08:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=qs7SC8x4Me/MsQrj6OyG6d+Idvg+rTgdrfefDemF29A=;
        b=K7J5nJAkS1qKtdAW+mk/OKMbcQYs1iQTQy2hF3G4gP8K/ueFh8OCvPCP1HV2r5mfl/
         ISbaUIxQGX6WK2tiq14FQ6yjKEIjMNRrRYhjQ+NryEb7fZw9owKEISV1YIr7ewMyNrWb
         5W3jdACIsWWbA7VjbKnePwEbhH4nSKuvy+Vg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=qs7SC8x4Me/MsQrj6OyG6d+Idvg+rTgdrfefDemF29A=;
        b=gAY5aB3yJ436h1KLIBznJwx7LMcn04MGZkTlox1YV7ErMU2TnL28GpNgT1O2GZmBS2
         pyNTqMfzjvOYuUIRv1NudQA0Kk/Sr3zqSjXeYMFIUYXahXHAya4usGhpaSwGbAm9aP+r
         Rlk7ZZMNbkgW6QJbo6MWh3InmzcQk7mNQCzNPINTUlM+BeqA0COIILJUrFq7m+nIbGNH
         DAhS2oy0MR+k4XZDJd1nZmN0eC9myW357Iblu/JxxcjH0RMyxzT6/s4xSQwVcI7DVcW5
         hnxF/eqKFDJvCSDpH4E9GuGFBbNd8XV3YaPJOgxHako0+FWw2Gi8Ml/8YQDI7vEWGfd1
         g3Lg==
X-Gm-Message-State: AOAM531Od3cFtIs5HgPXNbbfgqxMz78CoI5boW5aFQXpLHOTlbA3vIiC
	doNRAWf9NeS8yWawrCQA/dHaPQ==
X-Google-Smtp-Source: 
 ABdhPJyjoN1FKJkl09SQ2xrKbcgjdaAdQlZMng5hm2M4XPMhCYF2l7DXNxdGAQJIo+Z9aYP+Z9NN8w==
X-Received: by 2002:ac8:594e:: with SMTP id 14mr9036946qtz.105.1638980109890;
        Wed, 08 Dec 2021 08:15:09 -0800 (PST)
Received: from godzilla (192-0-174-222.cpe.teksavvy.com. [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 p10sm1933123qtw.97.2021.12.08.08.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 08:15:09 -0800 (PST)
Date: Wed, 8 Dec 2021 11:15:08 -0500 (EST)
From: Scott Murray <scott.murray@konsulko.com>
To: Jon Mason <jdmason@kudzu.us>
cc: yocto@lists.yoctoproject.org,
    Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
    OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] Help with Inclusive Language in OpenEmbedded/Yocto
 Project
In-Reply-To: 
 <CAPoiz9zni1rhmpFP+YOeseYyaT7BJGE_oZjYbDicWiYo5x0_eA@mail.gmail.com>
Message-ID: <aba5a7a-ebf-4372-41aa-525ea27d97f8@spiteful.org>
References: 
 <CAPoiz9zni1rhmpFP+YOeseYyaT7BJGE_oZjYbDicWiYo5x0_eA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 16:15:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159361

On Mon, 6 Dec 2021, Jon Mason wrote:

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

I am also interested in helping move this forward, please count me in.

Scott


