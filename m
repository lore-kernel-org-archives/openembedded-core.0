Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6741C433F5
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 00:48:36 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web08.14063.1636159715656853951
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 17:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DC7rOTi1;
 spf=pass (domain: gmail.com, ip: 209.85.208.180,
 mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id v23so17686401ljk.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 17:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R0x/E9DiOUhB4A01xM+K6GaPBPXAi3+WsYyo1F9pbqs=;
        b=DC7rOTi18MJcVsDVyzpFSwSVpfV/12lIeYlSsMasH+D3wlxU88nHVkg+s3FadBKoIB
         GoFYAVRI3ghks7BIcJ/prBiEOhXszJE9gdfGnWoWHz23Wj0I8J+kNBg9ZztZDPYWPJhb
         ULh+05xyZcd5X4c8CvNN5sFSfqlTjgEwfHkaSMVwuA3ZNcS5ngxhB1pb1P5CDdBtiWr9
         /5VNh9ye03dqR1lGhVgDvkwwF5enloLXlAyK+Du6qx5VvOQqA3srrVpVDQoYtWNKuztC
         WFyUTzjDTTczttbyqa0a3JUqy1L3OjmxeLKpLjPeZSf/8TSXFHbhSYmfbxh0L+2FYJdH
         xoqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R0x/E9DiOUhB4A01xM+K6GaPBPXAi3+WsYyo1F9pbqs=;
        b=1UcjgNlCUsk+VVtQ6JxLPJL2I1CLXBeymRrGXtpRnXElnjGvaFZ4L3piOhHuVHcJ/X
         VAOcOuK4GDhYwNi2qeU4hYLm+w9X5wI3ft/dufFMv/JCAf86DPlemlBTJn28ErIRXQRJ
         9dMKy0LF3ozEKH3zeqT/EXrc4Byco+zvsWU2iUFk5zELOB/6OPE951Ej/OMLid2Ck3ku
         ZboOldyzfJSYYIvUGzmKlV6ukPkAdpH0mphzvLuTThuR2j3QMk9dGyoV/leaFa/HAeGu
         oYKN+A36ZsYxk6kugzdEdboo5DuHWsjADhDQ09rUttOJiJndQwMHrZs5g1gFu49mlpoY
         3fDA==
X-Gm-Message-State: AOAM530XETG2MbxcnKarJzc8hgiY3WDaBPgt+JIN5/ygmpzfSYrM4utp
	2t7sjPapE4OezK3pgKPbkB1tJaNAFInL4fb6NxY=
X-Google-Smtp-Source: 
 ABdhPJxU4fcJiloh13663U9uelHyMtWXma+ePhr8eCC3XsFyYmlt6BP/9Gw+mv9qZCm3Pdgp8eb7P5b5Fv/L0q5/cWg=
X-Received: by 2002:a05:651c:905:: with SMTP id
 e5mr65236522ljq.238.1636159713591;
 Fri, 05 Nov 2021 17:48:33 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAFR_W8oXpAQ7y7iCDKkDruGUjfE3DXQ6CQQq1ou5XP7nDcfJZQ@mail.gmail.com>
In-Reply-To: 
 <CAFR_W8oXpAQ7y7iCDKkDruGUjfE3DXQ6CQQq1ou5XP7nDcfJZQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 5 Nov 2021 17:48:17 -0700
Message-ID: 
 <CAJ86T=WoKMWUoYe4D45-Heucs-hYG_JaHHjLDGVXqtrGCKsFFA@mail.gmail.com>
Subject: Re: [OE-core] Depending on other package's config
To: maxims@google.com
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Nov 2021 00:48:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157931

On Fri, Nov 5, 2021 at 3:25 PM Maxim Sloyko via lists.openembedded.org
<maxims=google.com@lists.openembedded.org> wrote:
>
> Hi all,
>
> Posting this to openembedded-core, as it was suggested to me.
>
> The recipe that I'm working on for our system (let's call it A) has a
> dependency on a certain feature being enabled in another package (B).
> So, in B, we have:
>
> PACKAGECONFIG[nice-feature] = "..."
>
> and my recipe (or rather, the tool built by the recipe), needs that
> feature to be enabled to work properly. What's worse, is that this is
> a runtime dependency, so if somebody just forgets to enable that
> feature, the image will build fine, but the tool won't work. I would
> like this to be a build time failure.
>
> My plan is to change recipe A, so that if the "nice-feature" is
> enabled, the package will PROVIDE one more thing:
>
> PROVIDES += "${PN}-nice-feature"
>
> and in my recipe B, I'll declare this as a dependency:
>
> RDEPENDS:${PN} += "package-a-nice-feature".

You're doing that just to generate a build time error if the two
recipe's configurations are not consistent?

The normal approach would be to define a global variable (e.g. a
distro feature) which both recipes can check and use to configure
themselves appropriately.

> Now I'm thinking, wouldn't it be great if package A could specify
> extra PROVIDES when the feature is configured? This would be similar
> to the way it's done for package's R?DEPENDS:
>
> PACKAGECONFIG ??= "f1 f2 f3 ..."
>      PACKAGECONFIG[f1] = "\
>                           --with-f1, \
>                           --without-f1, \
>                           build-deps-for-f1, \
>                           runtime-deps-for-f1, \
>                           runtime-recommends-for-f1, \
>                           packageconfig-conflicts-for-f1 \
>                           provides-for-f1 \
>                           "
>
> The last line would be a change that I propose. It looks like it would
> be relatively easy to implement this in base.bbclass
>
> What do you think? Will this be useful? Did I miss an existing way to do this?
>
> Thanks,
>
> --
> -MS
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157929): https://lists.openembedded.org/g/openembedded-core/message/157929
> Mute This Topic: https://lists.openembedded.org/mt/86853514/3619030
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [armccurdy@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

