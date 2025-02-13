Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92510C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 10:09:40 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.7738.1739441373705250264
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 02:09:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XMZKXmBs;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6dd01781b56so8562156d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 02:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739441373; x=1740046173; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1FfHJW33S6EMsIpaCsjU3DVDsQ/59Eut27FoN+xeRU4=;
        b=XMZKXmBsfG9J6nEazxilOb2F5fStW5iOYrT5wThh0LpMUmxSOwLczfayRErKXqmhhQ
         YzOClVJTWrm9ApgV6D7R+0JU7GoBM6BVIAjls9WX1UCTn0eQJIeISJvqYwx7dLLSMz5H
         FUSTAYnuwK8tnuIjFJxg9bxLNLYd2SWHCjRheLOu270xwxNybBiugtR74/VLNScymn11
         YpJWsWuo/0GCSo7lhM2oV9xvNRW1f0vfAQn8DN8m61P8LrRrBhpM503hgZRQeL0uvdhz
         uCZ+hIKUPXs63mNiXkZ48EhtwGh2k97y09nxp2ENUHUpugl3UCnT66BfMdVz+IJRDKBB
         JHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739441373; x=1740046173;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1FfHJW33S6EMsIpaCsjU3DVDsQ/59Eut27FoN+xeRU4=;
        b=BewMXcMNl7MZ4q6F5iHIA1iYiNS0x9BUc2EboQ5fL2T/pKwfCYEi3lxcsRoXxHUW26
         rWhJFkHlCLc6zvP96A2kdiEWyaGRiLnDmflUFcE5U3F/eTbp13pyAV595y537EubHr4k
         Q8AyYCTsC2W6VPr4GZcBKIdsEAEhawm2ihiW5bIloirLmNsktfra4nsA3TWscbjfzwX+
         ZmnO0W/k4qpF/jWMbKlMvm1ylS70bwYsA9/6DrPwcbEJSICPgVZcMO+NAFE6CHfRTcaq
         b6ef1jfJIjRHBAZEY2Y3AKp8FhwZn1TnRTeDltViQBZ7z+83XZ+ZBe11hOpNB+Mgr3+j
         H+JA==
X-Forwarded-Encrypted: i=1; AJvYcCVpdgGR2mXtWdEC+eQPNjT6Ugxw0MociZ0ETnpwDDB05W7LXLl8jxspLPB4If8Hln7nrYsRaGwMTPT7FGiAGkf4iA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YztfICIXEFzUAYEgdb+lGea9C3zqAT+GfhSAVwHeOh5k7WKGdld
	Y/m/B9gRA4p14jzFrWxNwksjMtuCfktCBGx+Lt45IPEGsmZWBOcmJpF0/ggC76JsLz0Ja+o27TO
	uFvaFoUTV4hsT68FrYDuAK9zATXs=
X-Gm-Gg: ASbGncu53uRCrnWUz+biQISt/AxCFjkhZP/mqJplDbNVUvztfoC4Ow/dkbH2FBQU5k6
	XegrOzdit8cKgVBq0Ytjag4Xl+toaSK2PtjfT1FyOXjNiH9geY3BF/2ZzkIMg9dEe4L4OVn3KVN
	dwZJjEsETconCRwP4zOHh/ufiaAhPGKZE=
X-Google-Smtp-Source: AGHT+IHKLGznaByVA3zsK6AleSsQvKW5dRlQjl8FYNbzjPZcUxLO5fzFkQE4YRlGttRh22WaIbwDDafsm9SyECzQmNY=
X-Received: by 2002:a05:6214:2464:b0:6e4:2f4c:f2d2 with SMTP id
 6a1803df08f44-6e65c1832edmr46709516d6.31.1739441372667; Thu, 13 Feb 2025
 02:09:32 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb9Fr9MFy5uub2_pTRWmVbt96OWBJ5ty+eAB9Qn+LYa_Wg@mail.gmail.com>
 <CANNYZj-PbWQDa5hAc5X6sqHVMvJ0QE01XXwytya8rprwvSsqag@mail.gmail.com>
 <d22a4cec5e317e62f1f44d8d9a810cf4745ccb48.camel@linuxfoundation.org>
 <CAMSfU+6d7gvYkjC5sbUPu6D_hOOF43ZUnM_NMEwmLUxZn6ysSA@mail.gmail.com>
 <4e883a56eb9b74a5663d7ad258194d16b1c79912.camel@linuxfoundation.org>
 <CAMSfU+44qwScnoDP4As37TNHYvwx5mBmTdGEQgq_VVz7woh6sQ@mail.gmail.com>
 <CAMSfU+4MY-JVmWPUixJYiUrtKd2CXHrJuQ0sMJJrrkLzrvAuvA@mail.gmail.com>
 <CANNYZj_8o=SHOn-kRBxzwc8vp3omCL290SA-jKkL_En1m2SWEA@mail.gmail.com>
 <2c1bcbb1d5b75b925d9af2bd300d376a973e314e.camel@linuxfoundation.org>
 <CANNYZj88RSkyChK6NwJU2OVxmGXzD2W8UcGyYe92ii8v8hdFqQ@mail.gmail.com>
 <CAMSfU+5Af0=w0N_kK1HLx4nNnQqGOv54C2qC-e7Q0Lm5NQ0Vrw@mail.gmail.com>
 <CANNYZj_8qPoOjhR=uR_7WRZu0V0YdhbcN43fA6mbnQBU5198fw@mail.gmail.com> <14a350e52c4e567fa995b08978b418fe1e43831e.camel@linuxfoundation.org>
In-Reply-To: <14a350e52c4e567fa995b08978b418fe1e43831e.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Feb 2025 11:09:21 +0100
X-Gm-Features: AWEUYZnMZUyPIZqYQiIYrKRL2YGO5UtdoDrwtMO8yotn5fN4Kj_TPxeEsllz1_I
Message-ID: <CANNYZj9hU1g+uyGAgy=02jtX9a-QdO=b6t3zG1OgshJkfdyhCQ@mail.gmail.com>
Subject: Re: [yocto] [OE-core] Yocto Project Status 11 Feb. 2025 (WW07)
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>
Cc: Yoann Congal <yoann.congal@smile.fr>, 
	Yocto Mailing list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 10:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211318

On Thu, 13 Feb 2025 at 11:03, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I'm wondering if we should set up that default repo saying "no pull
> requests" then ask repos that do accept them to override the message
> with their own pull request file? The default repo is only used as a
> fallback. Does an empty file do the right thing just to remove the
> default message?

I think the only repo under openembedded we need to carefully
coordinate with is https://github.com/openembedded/meta-openembedded
so let's add Khem and ensure this doesn't step on his workflows.

Alex

