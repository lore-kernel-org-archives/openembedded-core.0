Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C256BC433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 19:18:49 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web12.318.1643051928132914875
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 11:18:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mgRBytyb;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: festevam@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id o12so24228932eju.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 11:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UZt+7o9K6jOUMeOL41Y7Yxgh5H47VsVubLx+eYEluWY=;
        b=mgRBytybDtyKwxVZSRqObq1s9b7tn/ag2+wld29Ctd+6Zp82diiYjWAwKfghYv3joa
         +39/HV57H5PeY2Kg2wQaxUj3gcNUu/yy7JCw9VYbbi1yy0d4l8gdWx8zyD9eARor5tNR
         qjqE6UW8OQeLYitky0mHN5g1dSRptL5W4MZigcFM0PVPqokYHExQcBM/b18CTrXzX3Gs
         n///rR7vVwqtxo04/P7JKq4j69Wqva+2dyJVCMGsBX7hMkXLX9LJV1ZkalkFLrIT0j4F
         LDU2erGuBKZJ6j04c6qZso9qSLM/cRvCqrlsvWj2tDBJrIzyh0U8jvzKb286hIeO0Vnm
         G0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UZt+7o9K6jOUMeOL41Y7Yxgh5H47VsVubLx+eYEluWY=;
        b=GLMBHNgkHVl4jz7LXcq3AU2n80tYty2Lm529Ql0NsRSqT9+JZkMBo+ks9WlqGKLrR+
         VjLX1c8aggpf6Lok0LfD4PUusluCg6qd1hfBAAAAykEdDTsEbBVjPXW/WjyaDCKFz1e5
         /6GcBqBfGF20p3NWN5KKYEPVE86sNo8/sOSDiqXR/mr20VObgT6ntzjoYyRwAqc3c6bk
         VWNQyiO977G27IboN6677o+nzi6XHA5zxxAc2fhSOJ/wrpRYxF+0LicQRmsaiiYFp+aK
         qxAhRhyFpLRFDjYArrkfwMNT2ZHqD+8nx7iKCmp37DFd1jAPXXZGrP1ltQjA4lvVDePM
         49tQ==
X-Gm-Message-State: AOAM532JiLvCYWygt+bU6BJ3L8KWyw4MjyDfmsSRlKla9J/VkjK7oV+S
	ZgNCF7EQNAB+XDO63ugAnK0znCWzCbZGe1Njhts=
X-Google-Smtp-Source: 
 ABdhPJwuM3n1oyrotWSaj74RmFlSrNVWtMd++rdIlgVDUN1uvsx4eq2IY1lUcHPXvwXXZS19URNzAE3F3eFW6TpJLyA=
X-Received: by 2002:a17:907:7292:: with SMTP id
 dt18mr5177193ejc.652.1643051926596;
 Mon, 24 Jan 2022 11:18:46 -0800 (PST)
MIME-Version: 1.0
References: <20220123150358.1306062-1-festevam@gmail.com>
 <5813000.lOV4Wx5bFT@dhcp-192-168-0-28.wgnetz.xx>
In-Reply-To: <5813000.lOV4Wx5bFT@dhcp-192-168-0-28.wgnetz.xx>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 24 Jan 2022 16:18:34 -0300
Message-ID: 
 <CAOMZO5CGeRP5Kdv4LjUz5aBEK--da=OR03O6WLVEcRX9XpbA5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH meta-oe] rtc-tool: Add a recipe
To: Christian Eggers <ceggers@arri.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
 Heiko Schocher <hs@denx.de>,
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 19:18:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160894

Hi Christian,

On Mon, Jan 24, 2022 at 6:57 AM Christian Eggers <ceggers@arri.de> wrote:
>
> Hi Fabio,
>
> from my experience, custom build systems (including "bare" Makefiles)
> are often hard to integrate/maintain for distributors.

rtc-tools is a straightforward package and I have sent the Makefile
patch upstream.

Not sure why it can be hard to integrate or maintain it.

> What about using CMake instead?

I can do that if needed, but it is up to the rtc-tools maintainer, Alexandre.

Alexandre, any advice?

Thanks

