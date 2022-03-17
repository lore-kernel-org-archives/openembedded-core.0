Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC311C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 19:48:57 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web09.819.1647546536890425006
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 12:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=W3AFHF/A;
 spf=pass (domain: linaro.org, ip: 209.85.217.41,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-vs1-f41.google.com with SMTP id b190so6648686vsc.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 12:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CrV7Iq0kKN20+T3u2/kWLiMu3XZWhY7ZBttOewrVkLE=;
        b=W3AFHF/AufZcKZZWlmWVEwFtcwfSjAcAVVu3POl1FegGLtGzon/a/7mKLozvTxY9mn
         Bm7vYuL80ibOaf/Byyc+ejZBDpWZ7OyQgGsyQlPjOY1joO5veHNQaAFI3MSiG9yIxc4x
         ELhnqctqWitQxYA5SiGsbmTGZjMJK1oJyeyHMjX5rxBh6VM62WxrAabHS0l8AuV5zWtf
         Bpu5sHOiiPaGsZa8w1xnfaV6/om74nQReUrCIMpolG+7+EN761t/z6mkyjvxSa11C7AF
         /yoaDhQ5XBBPjRr4KVX+ySorM2td5a5SNbaVl2kRlTwWCXEZ0q9mF+JkeqNqlnAxDlRA
         KWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CrV7Iq0kKN20+T3u2/kWLiMu3XZWhY7ZBttOewrVkLE=;
        b=D8KzE328mYOuqnHgbqe1fxyT6+7fT/BhCp9yQTtZWhfPiaMqG+VuknrM/eiZyzgMjr
         iR9zlbyS1Z72kX3jG2dTi0oX58VNrB+gjnG9BGUlUBybv+oBzHoI8AQ/XhoUA49M5DgL
         RPPSqdy3/hkxC/mBTDxM91PrOWHq0Xr11DniQx3O8xVn5R4rNO/aaRMrWWWDEhbaEg+b
         obZ7BqCubkhjU3SHhQFXZ8bVuYI76lFctta8TraGcFuhMCpHH04CLJ568mMgmeVWgMTQ
         NulBUWFFAvqk9ly9AgSuFxEovQ+5uTrR+omZApiEyG1A9IP0U/PUMbQ4R+aJSS//GM1Y
         m60g==
X-Gm-Message-State: AOAM5319WcIMfxPRTtmLeLl2Gu7Axa5yo811E6oCI2YfGZTwc+qvE6p9
	uPAYazIdqz+ARZJrGKLnMuJE4+Xgp4JjdkWo4shU2A==
X-Google-Smtp-Source: 
 ABdhPJxOb+ribCgaBqtneps3dSuLFTMeX2aCJu/eDhkB8qIZqsvByqecawX0TKDP9jySiqpcUmedgk3gJgXLcuuiiEo=
X-Received: by 2002:a67:eb93:0:b0:320:bac7:bce8 with SMTP id
 e19-20020a67eb93000000b00320bac7bce8mr2618595vso.70.1647546535911; Thu, 17
 Mar 2022 12:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220316161547.1527214-1-ralph.siemsen@linaro.org>
 <CAOSpxdY8p-C5gRFoELnkd4xWb0+XW+OeJ41_2+eT24GVBSxiUw@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdY8p-C5gRFoELnkd4xWb0+XW+OeJ41_2+eT24GVBSxiUw@mail.gmail.com>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Thu, 17 Mar 2022 15:48:45 -0400
Message-ID: 
 <CANp-EDZ7UzxDMCeCNwP4iC-txGwrRHJKK+dhMwx8dv3gXueftw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] openssl: update from 1.1.1l to 1.1.1n
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 19:48:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163433

Hi Steve

Somehow despite watching for replies, I managed to miss them until now.

On Wed, Mar 16, 2022 at 5:50 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> Sigh, now I remember why we did the CVE only patch - this version
> update introduces a ptest regression. It's sad I can't remember things
> from just a month ago!
>
> See discussion here:
>
> https://lists.openembedded.org/g/openembedded-core/topic/89179173#162027
>
> If you can find a way to deal with the regression I'd be happy to take
> the upgrade!

I'm not sure I want to go down that rabbit hole right now.

I did a backport of just the CVE, it was straightforward. I'll post it.

Regards,
Ralph

