Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA57C001DC
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 16:56:23 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.608.1690822577966953930
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 09:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=T4Q5DLM2;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: luca.boccassi@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-579de633419so44946257b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 09:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690822577; x=1691427377;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eYOKeOqD6BA3yPVwil9tBoCohSV5iGplV29ZcgwpI1U=;
        b=T4Q5DLM2/za4xJSNKQMd9ulkeP/CawnZGOVJ+1OVcOdN27fxgYnRg1kV5SQjxni+0G
         D+I39WjFV/8d+8JGhIH1vXY3RQsQvW1RnJ4hoCmpZoMlR3EoaDnn1Abssq3ChluACLCT
         9Qi6yTqdUaN8idUJtE9JumbU9/4YKEmPcJ+pKRVCFNEQZUKmF9fBHi5N8FmiOQjGtE1e
         4g8rnEYO8KaRzBHIuKnYIGmW2OneT2AunUxaTMuy2eDhT6zn5E7FgA5d8ngBgB9xpWCG
         N625N5qXnbY3vkW0pG7NAaTAkPaIvse7ntewcAURrj5sb3mU2gEz4F8CGYtTFUJq3YUG
         CV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690822577; x=1691427377;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eYOKeOqD6BA3yPVwil9tBoCohSV5iGplV29ZcgwpI1U=;
        b=FWU97bnDSlss5HLha4PcP2iRe+JdDO/wLw8XivCS1mFIpkpJSIjtZCBUUgq9TVQ5zJ
         e7f6CCzkUo3XlyV/ixfUwG93jmt73iSRb4L7hlh1EK2Rx2Uy1W2RAc7+hB40qxrPnk8G
         LV1O9yLbkSAuntZ693JUmb3+c92qfxcF9IqKpEvM3WYuAscKwx+VFSFMejgUX6pdZiqr
         Cy1LDpiH8eaKl3+0k7sw9NUvbJv95pIosvfmDfWifBiKdL3oBqfhUIwJZPJs0R0/pbkb
         cf9hDV1DeJr0v8BFW+3l1h/6yVhy/O7TGuMXfes0gsxkG17iH1hE70G+HZdtfSUrA4xd
         XMMg==
X-Gm-Message-State: ABy/qLb7pRqXduidmBRVqZZvH+cTYSH2V7R9vuc/1dQMuwWVUPRRxzWM
	ANuRvrr33eK5ASuKSartuFEBsAa0SAwl6Cgg0gs=
X-Google-Smtp-Source: APBJJlH9ICc0IvURrrdLU+n7ODFP/ecVni6MaQuB4AoQQ23OyUqYx9Wr6CoDROyyjVLZsP9N8kgFIqi0h37IVwPPYwk=
X-Received: by 2002:a81:7487:0:b0:573:1db2:7f7d with SMTP id
 p129-20020a817487000000b005731db27f7dmr741838ywc.2.1690822577153; Mon, 31 Jul
 2023 09:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230731112736.1238510-1-luca.boccassi@gmail.com> <20230731164010faa31974@mail.local>
In-Reply-To: <20230731164010faa31974@mail.local>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Mon, 31 Jul 2023 17:56:05 +0100
Message-ID: <CAMw=ZnR3L05DSaBGSijuA5-vNXPkriCjdbi02LJsUFmVo-FbHA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] systemd: update to v254
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 16:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185149

On Mon, 31 Jul 2023 at 17:40, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> This causes the following failure:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5570/steps/14/logs/stdio
>
> 2023-07-30 21:25:44,944 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/overlayfs.py", line 297, in test_all_required_variables_set
>     self.assertTrue(line, msg=res.output)
>   File "/usr/lib/python3.10/unittest/case.py", line 687, in assertTrue
>     raise self.failureException(msg)
> AssertionError: None is not true : NOTE: Reconnecting to bitbake server...
> Loading cache...done.
> Loaded 0 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 954 .bb files complete (0 cached, 954 parsed). 1878 targets, 53 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'pam-plugin-umask' (but /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-core/systemd/systemd_254.bb RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'pam-plugin-umask' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['pam-plugin-umask']
> NOTE: Runtime target 'udev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['udev', 'pam-plugin-umask']
> NOTE: Runtime target 'packagegroup-core-boot' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-core-boot', 'udev', 'pam-plugin-umask']
> ERROR: Required build target 'core-image-minimal' has no buildable providers.
> Missing or unbuildable dependency chain was: ['core-image-minimal', 'packagegroup-core-boot', 'udev', 'pam-plugin-umask']
> Summary: There were 2 ERROR messages, returning a non-zero exit code.
>
> It repeats for other runtime tests.

I added that on Alex's request. So it's either that failure, or the
ignorable log message? I'll send a v5 without the recommends then.

