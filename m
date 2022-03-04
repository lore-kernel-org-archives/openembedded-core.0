Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8DDC433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 16:56:30 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.777.1646412989715036676
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 08:56:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JSAMEaD8;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id s15so7875121qtk.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 08:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uLsJAr7mGW44pQsY5EuG0WA4RsEsk9/lZmuns5hP5tk=;
        b=JSAMEaD8516jfkKzpFvvkcz8StTGfnBPgmNrmaE6YpYrhpFVgPoOHiaW9Hpjgq188C
         1nMIci/DAGYs0r5DjBLmnXSTUQyObt8+OES+gujZ6T73ynUAvrQHe/QcV8S14PJ2RPJe
         IjsRCAibmaTqr3+kVUfZdoJFYF5H7pux5y6Iq/Dz9ffpb128BnX/b9ZQa+NQKyWw4Hx8
         Ov5EO6chsFDDiSgARaQcWp66bUkkfK44bSjw0uab2hCSLQ+/vfsydX2LY5L1GjvhDvF0
         9VbctKqZuO0mRVY/ZAeHsRQo3+bnd3xxTzGRNQX2dv7aVP2rhQrltrVkXUaQZiB0W5rI
         pxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uLsJAr7mGW44pQsY5EuG0WA4RsEsk9/lZmuns5hP5tk=;
        b=s2g73Mq9aL3PdsfjZYo5mi/4XlO3PmkRN5LepxkSmQS0niAA6lb3YZ02IgSZpMioUI
         T41C4X0HL80JdhwnGwTeetbJfX9gHhVrj1JidfZLmPp4jCfb/wfQTIJHze+tRYudmAJz
         sU97ReCO03QFWL9ykFUqsMXJOXF2CP3YWQcm+pQfWLkwQMp6RmY8CXatJUjGP37L+jfG
         OhKbkn2IJBtaEDbyERq3tEnttnwLNn+td25kzYnFllwQS+5NNoxe6CFJoFBenW15R9zP
         V+0ai6eP5NuXnmX3tT9aUryTlQTzegs6IZU1IjY8Z97EhHfemE9+yh/wpdQYaQgZuR/y
         imjg==
X-Gm-Message-State: AOAM533b5VEeiQCxP5nE/HqZ0OHQCXMiEnfb45wjwqX4fTFh/eGQlrlU
	oD0aVeBgdoA74e92Ya2AW1sndVM/ec/5X1BQAu4=
X-Google-Smtp-Source: 
 ABdhPJwl1TOl7ID7YUhwc/ziVxlHmGNZBSFziMcgP6AgaZDWBcRn2uCZj1pZ5XzrDaDSFsKNzpa7coNqyuDfKNAuiAI=
X-Received: by 2002:ac8:5a86:0:b0:2de:29af:5658 with SMTP id
 c6-20020ac85a86000000b002de29af5658mr32250539qtc.54.1646412988648; Fri, 04
 Mar 2022 08:56:28 -0800 (PST)
MIME-Version: 1.0
References: <20220304115525.2240283-1-ross.burton@arm.com>
 <AM9PR09MB4642E1F4D179551C41AB9217A8059@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAAnfSTugRrDfDxwEKXfbHRM5DznThMN3_jiiTLZ4Nr6J5o_M+Q@mail.gmail.com>
 <AM9PR09MB46429EC89803B44A66B82D44A8059@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB46429EC89803B44A66B82D44A8059@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Mar 2022 08:56:02 -0800
Message-ID: 
 <CAMKF1spt8JqUnosr8n6T2bja9BRvvoH6KKJn7rNLjaBgi0UsEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes: add setuptools3_legacy
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Ross Burton <ross@burtonini.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 16:56:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162742

On Fri, Mar 4, 2022 at 6:06 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
>
>
>
> On 04.03.22 14:13, Ross Burton wrote:
> > On Fri, 4 Mar 2022 at 12:44, Konrad Weihmann <kweihmann@outlook.com> wrote:
> >> For me that would be a candidate to be added to meta-python, or are
> >> there any core recipes that currently break because of the new behavior?
> >
> > This is restoring existing behaviour, so I believe it should be in
> > core.  There's going to be enough recipes using this that it is
> > justified in core. I expect we'll have deleted this by the time the
> > next LTS comes around too.
> >
> >> Furthermore the variables names are the same, so if people accidentally
> >> (or due to complex injection trees/classes/distro settings/whatever have
> >> new setuptools3 and this class here in the same recipe, things become
> >> rather unpredictable - as of now there are the same but surely they will
> >> start to diverge at one point.
> >
> > That's intentional: if you have a recipe which needs the legacy
> > behaviour, just change the import from setuptool3 to
> > setuptools3_legacy.
>
> Can you name any publicly available recipe that requires that?
>
> For me this is the same situation as with the python2 > python3
> transition - there wasn't any fallback provided in core, but outside of
> core it was - so I would propose to do the same here.
>
> If that legacy class will be part of core it's likely that it will
> remain till EOL of kirkstone which is somewhat in ~2025 (by current
> planning) - and meta-python2 showed that even then some recipes still
> haven't migrated (yes, chromium looking at you).

latest chromium does not need py2 in OE context anymore for a year or so now.

> All in all I think core should just provide *one* way to do it while the
> legacy cases can easily live outside in a separate layer (meta-python
> for instance as the "old" distutils have been put there as well).
>

There are recipes in meta-oe and meta-python which would need this
and both layer only list core as sole dependency, if we put it in either of
these layers, then one will depend on other which is not nice, so I rather
would prefer it in core.
, regarding distutils classes we did move them to meta-python but there
are recipes in meta-oe needing them e.g. unattended-upgrades which now
are forced to be moved to meta-python which is less than ideal but can
be lived with.

seuptool-legacy is similar to autotools-brokensep in spirit. python2 issue was
of a different nature

> In additional everyone was worried so much about reputation lately that
> doing this long announced transition, while keeping the "old" way
> enabled (and creating more maintenance effort in the end), would
> definitely send the wrong signal to the community.
>
> >
> >> While we are at it pypi class needs a fallback too, because for me this
> >> is the standard way of packaging python recipes and new class points to
> >> the new setuptools implementation - so if we want to have this here, we
> >> might need a fallback for pypi class as well
> >
> > My understanding is that almost anything on pypi is already a pure
> > Python module and is mostly unaffected by the changes.
> >
> > Ross
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162718): https://lists.openembedded.org/g/openembedded-core/message/162718
> Mute This Topic: https://lists.openembedded.org/mt/89547022/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

