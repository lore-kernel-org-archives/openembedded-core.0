Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C050C433F5
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 00:29:18 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web12.2426.1647649757327346719
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 17:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=obYUsd8t;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id kl29so1306630qvb.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 17:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qIbBmGYvfbNeBBX4T1zglTL2aW5RsdV+8NDNZSc+Hk4=;
        b=obYUsd8trwntunvM6cCscnmd++dguHHit3r4C6HBqgS+Iy0xQM8+lhxv/W7Am6qFPd
         S6LeW2AncgTzOUDF0V7uvwBcrM8G0+N1ymhkWjvWWF3X5qGV9HAKBGOKWPn2y5iaAgTO
         CdmhCNQDOcniw1MrTxWYK11nPBbXBteqLLYRS+kbY8QNEpXX2kjWduRqtc8DNGo2+lll
         wcL7lXxfomwoxhZFvKWHueac3tJmvJ3QxB73uihIH2r3Aw7XRVe9Yg9sLZrwLTva/eYs
         BdSMtNE2l+L35fG/UyVA4wJBLc/JsMLg4GIhUiPuxlco9vVVU8j6523ZJlhghsOz2V3u
         LS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qIbBmGYvfbNeBBX4T1zglTL2aW5RsdV+8NDNZSc+Hk4=;
        b=UBVkMgmo5Pq6dNpopgnmHxvOCApBZbuG3lsb/xSdGpeA5Vj4vmRX15irX1h3GmWX27
         hSGIY5A7L/Zd5SfsjCFSJCwATjfzvXQ2HqYnAvt8ZqjW1fFRJLxpQwNzbSNq7V3SnPsD
         zo+rYneFTzpiS6IAKzdOIpAYDWIMyUWgovDVeAERtK+NFPWgrvsmwB3kLrqgKrRbUJ9h
         GbnIwG7DB9gLWuD/LUHdP6ep0TY3i4TkczUA1Lap1KKPkxL9G/T6VSRpaNKvlq3xJeMw
         C/nundu0WRbM0wIQsyDPZHQbgxbxiL2Qim0dShk0Q936BdKRqO5pkoX3jUblduwazRPO
         W6Kg==
X-Gm-Message-State: AOAM533apej9Ryr2Df4AIMPy++wWS9mdQqNjrVrb6MJZv1gyGJsLN0+9
	XC7nwZ2C4JNKwnAap0DgwyIaFyYSl/wgSyY/rnhdK9yj/Z4=
X-Google-Smtp-Source: 
 ABdhPJzimiXiWcVp7vQewwZQ6sQV7wDyV0LXXBl5pJ1EOkLuwdbNolZnDp/rhJH4xt/V9oyY1DzJnJ29AeQlmUtNCc8=
X-Received: by 2002:a05:6214:623:b0:435:c552:65bb with SMTP id
 a3-20020a056214062300b00435c55265bbmr8914386qvx.16.1647649756323; Fri, 18 Mar
 2022 17:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220317180005.1009380-1-richard.purdie@linuxfoundation.org>
 <CAMKF1soE840jiaiuKZ3-zJKY+f5DWE8Ry_7HOhPFoK=hvZwBWw@mail.gmail.com>
 <9f00a3fe1b69e4c4e9fd34ae04effcee6229b929.camel@linuxfoundation.org>
In-Reply-To: 
 <9f00a3fe1b69e4c4e9fd34ae04effcee6229b929.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Mar 2022 17:28:50 -0700
Message-ID: 
 <CAMKF1sqUk9d-02+dnZ=Q9+PECwLNUdeOsEFrt2D=yZRRQuOuuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libtool: Upgrade 2.4.6 -> 2.4.7
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 00:29:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163456

On Fri, Mar 18, 2022 at 5:10 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2022-03-18 at 17:06 -0700, Khem Raj wrote:
> > seeing these 3 failures with new libtool in meta-oe
> >
> > https://errors.yoctoproject.org/Errors/Build/142979/
> >
>
> Those are all libtool version mismatches. Might be a case of deleting the
> libtool m4 macros before reautoconf?

i have not looked into details but perhaps it could be just that
>
> Cheers,
>
> Richard
>

