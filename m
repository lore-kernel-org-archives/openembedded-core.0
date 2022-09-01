Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50A1ECAAD3
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 14:24:27 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web12.12771.1662042258906893780
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 07:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l5HGHq4Y;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id bq23so24682276lfb.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 07:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=YaFjGk4JwIp88+ZGs81v2aQ1/1/ezkalmtZ9Zs3Bv8c=;
        b=l5HGHq4YmD9M11NHYs6CTyxgiiAuBtbz88nhJXoX985luB9ziBxAWp4skI7GW/8566
         Mx9qImNRVyAWFDsQ09/Z/hp6q6SZ5kqIqaNyiutVLI1XqRDmjTnW0sYMn4KHn6BhXBBm
         ajYeMkzlmiwK0jvDL709+l4K63dTyyP+FAgbBU6dVFh6JVunBMwKEi9rrdlURiZgU4Ft
         H55vyLoniymXJVPXagDGoSzphYUxaZBYxUiPw5iswvXUtNAnipDyW7hM1b3Bop1oPuVu
         wbsm/q8UXXqPDr4nzPQpxcS413u1W0ZQArh59DD5FGewF8X+IYE1LULQbknDw11JR7ZT
         q3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=YaFjGk4JwIp88+ZGs81v2aQ1/1/ezkalmtZ9Zs3Bv8c=;
        b=rU+07N4kBsp4d4ZnryIraveRhHWNv25U2lT1GtB0RqdlWy1Eyou8u2DTsljIwtjA2K
         irtwfNa/xIk6Fpobj6Q+yKxd/da/v7ESRw6k3FFZRQrnoyH6EvqHUIEpv/lBvOcZF8Za
         YS7F2L75eq3MMnRw3BJ07cvcjCpTsp3pd68sj6MS2s/4q7awKnmIaHedpHwsGQCfde0w
         /1dqaUo3KcMBevdku1oRAMQ9tjv9rw4qnfvPVY7fPySJDvk/PdegBUd+g1ENPvkub4pH
         j9nU/DXbc8zMsddHBNwOj8+dUyur2D6lxsCbm/McPo2om1khA3PsJZr3M8jLcFSB0ptj
         t5rg==
X-Gm-Message-State: ACgBeo0q8Boh4rtXxeBhgjhUb0tG9b/N3LVuwrKvvCvVRrOfd8VqLFIn
	1NMg6KsOsjilVfQUndg3oIOIOKYQXNmFHqZLYxY=
X-Google-Smtp-Source: 
 AA6agR7xcnd9BxrSrWtMXiQtbrZ/HX5ob1Fm5Ur9G46yipjaUp3H0yZaSQcvcrjLTz6Fpi37htkV4aZV7t5+xCmXzgQ=
X-Received: by 2002:a05:6512:694:b0:494:9a24:3243 with SMTP id
 t20-20020a056512069400b004949a243243mr1313071lfe.673.1662042257070; Thu, 01
 Sep 2022 07:24:17 -0700 (PDT)
MIME-Version: 1.0
References: <1710BA34037FD8E9.1438@lists.openembedded.org>
 <dd196c7c-93e5-2854-1479-8e51996929fd@gmail.com>
 <CANNYZj9wiX4MPLwqrtMXtPqwMMWrQPmrDZ186vahPcDpmZk9pA@mail.gmail.com>
 <4bab9a949e5f6766e6dd611a21803851881ee972.camel@linuxfoundation.org>
 <1710C1FDC022CF5C.19509@lists.openembedded.org>
In-Reply-To: <1710C1FDC022CF5C.19509@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 1 Sep 2022 16:24:04 +0200
Message-ID: 
 <CANNYZj9M4Y+xtES+mYh3+senJ-fPq3fFyX_-Yj+4k=iS=rEsUg@mail.gmail.com>
Subject: Re: [OE-core] Error with TEMPLATECONF value
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Jacob Kroon <jacob.kroon@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 14:24:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170223

On Thu, 1 Sept 2022 at 16:12, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> > Ideally, the checks in sanity.bbclass would migrate existing builds for
> > this issue...
>
> The check and the error is in oe-init-build-env, so cannot be fixed by
> anything in meta/. But I think I can add a special case for the 'old'
> values to the script.

Patch sent.

Alex

