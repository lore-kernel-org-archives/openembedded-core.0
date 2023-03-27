Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345F2C76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 14:25:20 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.36368.1679927116255363950
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 07:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mTXgT63C;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id c9so1275073lfb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 07:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679927114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6sw8Of8wkH5t5ko8Qvdo+AqLEZcp78GphSEAm8pEudQ=;
        b=mTXgT63CcJx9fKx//Ny6rBkM32rYeg9SKFOXJ4FYVlsAKcf/eW5raIzGTvh9wQl++j
         JVZb0EdnDzuMXhDPvxOV0PaZx7y0dslNVv/EYEPFDYHmGJHQgShZ7a4au4NNqgCEHGeK
         GLgxX8WCVK7X6Unqpj4j6ZYmJCfgPe0kIuMhM+aAKRQj2ladjEMCfydNalFyM0FxSXgD
         PnjEjKjTKXzZejN5IJXtUIIXMedNjVn9Wu3+OUTbs9hOJET8P4+DCWWvdXVC3/gg67Ad
         9kiRHsu7onKr31TitQbKux9Pg1nGUj7RQcdrS70rZYd5nW1qOvd6u2fnr8x+Pqj9RLXw
         iTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679927114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sw8Of8wkH5t5ko8Qvdo+AqLEZcp78GphSEAm8pEudQ=;
        b=JOnjAq7gEci29v+9yo6oxepCy9kht5p27/UtClP1YsRIIFvkQrhM6jM2HHQQ/F68Lr
         dmcYJT//TfnbHFizrgBrGXjM72D64WXbLrkUeUULIGYimvl62Z97UCxoH4xj7J75O8B5
         FslckSfrn90c6vbnxHOsPup3t4w/8yl5A9hhk4SFysWyqJK5zSVwNnp4u2DUhRRQWRc+
         KrTjw2LQgH2v9ZjjsHm66jQHUZk4B05TnO78WDx2qlbjIWS9b68AdxuAqL/lI0Q8YGpA
         ZxgZ7ayxUIdpdLJU6oi5Bg7eCq4ouuvRfbf0Hkx3pW4p2A//eJRdXLJlhf3hFknA3onM
         krfg==
X-Gm-Message-State: AO0yUKXVydr1jqpknIFUNK1twA+sM+/fm6nCTSutg5jf9/oqY9Z9zZ/7
	B48TO3ALqZW7sZHBRWbu1jjeUBqM2HvbwC/ofuc=
X-Google-Smtp-Source: AKy350YrJG0VVFIA4TrSDw0VRK8CTenJcyExuSVhT55FQGOwWRlVl953Ca8ewun/DNXa2b5vjAJmUmpmLqMkkIS0AJI=
X-Received: by 2002:a05:6512:1090:b0:4d8:86c2:75ea with SMTP id
 j16-20020a056512109000b004d886c275eamr9871893lfg.3.1679927114327; Mon, 27 Mar
 2023 07:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679734210.git.frederic.martinsons@gmail.com> <094a85975f9b1ef0fc622f4f0acc70a935f1e6fe.camel@linuxfoundation.org>
In-Reply-To: <094a85975f9b1ef0fc622f4f0acc70a935f1e6fe.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 Mar 2023 16:25:03 +0200
Message-ID: <CANNYZj8tNBngz4OLgF9YTKVQU08AjWgFf6JS2aHk0qQt=D6tBA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/5] Extend cargo based recip support
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>, openembedded-core@lists.openembedded.org, 
	alex.kiernan@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 14:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179161

So if devtool tests would operate on zvariant recipe, then the recipe
can simply go into meta-selftest after all :)

Alex

On Mon, 27 Mar 2023 at 16:20, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2023-03-25 at 10:00 +0100, Frederic Martinsons wrote:
> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> >
> > This series brings the support of local git repository inside
> > a cargo based recipe.
> >
> > It also enable devtool capacity on it and provide a real crate
> > example recipe to show how things are done.
> >
> > The following changes since commit 4876189dd2ae5a04a296b11b537b9f613159c6bf:
> >
> >   xcb-proto: Fix install conflict when enable multilib. (2023-03-23 22:38:41 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/fmartinsons/openembedded-core cargo-extend-support-git-and-devtool
> >
> > Alex Kiernan (1):
> >   cargo_common.bbclass: Support local github repos
> >
> > Frederic Martinsons (4):
> >   cargo_common.bbclass: add support of user in url for patch
> >   rust-example: provide a recipe for zvariant
> >   devtool: add support for multiple git url inside a cargo based recipe
> >   patch: support of git patches when the source uri contained subpath
> >     param
>
> The various rust/cargo/crate patches look like they're heading in a
> good direction, thanks!
>
> The one thing which I think is missing is more support for testing some
> of these changes in our automated testing.
>
> In particular, devtool does have a decent test suite so we should
> ensure new devtool additions have tests.
>
> You can see the devtools tests in
> meta/lib/oeqa/selftest/cases/devtool.py and run them with a command
> like "oe-selftest -r devtool -j 3" for example.
>
> Cheers,
>
> Richard
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179160): https://lists.openembedded.org/g/openembedded-core/message/179160
> Mute This Topic: https://lists.openembedded.org/mt/97840361/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

