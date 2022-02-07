Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CFAC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 11:04:48 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web10.20855.1644231887524403787
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 03:04:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OlSesXF+;
 spf=pass (domain: gmail.com, ip: 209.85.221.172,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id w17so7544675vko.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 03:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Oj2bENzAXb/7mpMuealahfLRy3oKYew+dvfXGdnb6RU=;
        b=OlSesXF+RlJBolHtcE046090h8OG2iAB1mIUijeDj0p35gZ+C82SGhiOZRWU/UFu8r
         2pLhT2SMyaQe9ypZyJrfUdcXdwZCrVf9vH3oldCR2nAk5PfMNC2ujcOyzvlkjkQAwfwC
         xczFTQE0GXD+ctwq5qZBr8/QVasUe3aJ7bDGSD7Fewrp5JjBn8V63WrKGkHu3jN2wfCu
         9xktYWfX2E3CAOpnbY+vVsD1Ag4hPheK+n+s/9ScEroZgJYyEKyOSRLCYb+3kAd/zSbY
         tUKdl41P8HTPlcGVQxbtej+KBmmZqzVuVXc44quedTrYjcj6V56dxx/WQwbQwcjWbSdI
         eeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Oj2bENzAXb/7mpMuealahfLRy3oKYew+dvfXGdnb6RU=;
        b=moxmnsD5q7QhaWqQmN+tUMg8XfidfyJpycaINq0rLsUQhErrj7KRMpzS/DopssKYHb
         diTw/ujP5kMhJzDxdFwGJGmg3Khb3wbF5Ge35VfMQtb3jKF6wAcE+o2b7NSLW/aVDoJs
         SgyGtKDKG++1OOP0VJruMPai8uFSEkiTqOlUsusVv4EcCFOkWo5ak73BWL5gVN/MA9eg
         Q7ju52IP1TxukIji5ktUNirio5b0dwWtlD8Ln5bZiDPIl4hyOKvd0lnEKtANqSIPrJ6S
         PLklyjoqHjni7EClugeEjZd8O42bG7cjs8OnBQ4rqf6gQ8tqzBez6w97sRjZmSIhkiDi
         OcAA==
X-Gm-Message-State: AOAM533v1iSXHwjDuhdnaVyavA6XOEFjkUkWvw1qq+ReLSBaIJ+eSsqU
	2CMSGRMZnDD+BEmRQ+a3nc3dc7a+o+3GhwpLJr8=
X-Google-Smtp-Source: 
 ABdhPJzROz3zi0Et+/uOK+BH6kgizfEyrBPeCl0KhRwqYsVc3oTgLS7epLkXfFOqFw2ywwoRpjEkwcJ9o/wUaH/VKwM=
X-Received: by 2002:a1f:ab56:: with SMTP id u83mr4677700vke.30.1644231881727;
 Mon, 07 Feb 2022 03:04:41 -0800 (PST)
MIME-Version: 1.0
References: <20220207091621.756173-1-alex@linutronix.de>
 <318d02584b3de93e9f4be79ac001e0577f125639.camel@linuxfoundation.org>
In-Reply-To: 
 <318d02584b3de93e9f4be79ac001e0577f125639.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Feb 2022 12:04:30 +0100
Message-ID: 
 <CANNYZj9401A5sxSA=fB=FcriiLFaM3Le-kEmEv-V8N1jda9wQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] git: restore reproducibility on centos 7
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="0000000000003d214705d76b9148"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 11:04:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161458

--0000000000003d214705d76b9148
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Feb 2022 at 11:03, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> > +This breaks reproducibility as git builds on centos 7 use
> > +different flags than git builds on other host distros.
> > +
> > +Upstream-Status: Inappropriate [upstream needs to check compiler and
> component versions properly]
>
> I'm struggling a bit with the Inappropriate patch status. I can't help
> wonder if
> we should have something like "NeedsRework" to illustrate something where
> the
> patch itself isn't appropriate but the issue itself should be handled
> upstream?
>

I'm ok with that status if it also has a link to the upstream ticket. Git
upstream's way of bug reporting is "send a mail to our mailing list without
subscribing, and you'll be CCd in replies" which is not particularly
reassuring, but I'll do it now. Then we can do the corrections once I have
a link (which probably won't happen immediately due to list pre-moderation).

Alex

--0000000000003d214705d76b9148
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 7 Feb 2022 at 11:03, Richard Purdie &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; +T=
his breaks reproducibility as git builds on centos 7 use<br>
&gt; +different flags than git builds on other host distros.<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [upstream needs to check compiler and =
component versions properly]<br>
<br>
I&#39;m struggling a bit with the Inappropriate patch status. I can&#39;t h=
elp wonder if<br>
we should have something like &quot;NeedsRework&quot; to illustrate somethi=
ng where the<br>
patch itself isn&#39;t appropriate but the issue itself should be handled u=
pstream?<br></blockquote><div><br></div>I&#39;m ok with that status if it a=
lso has a link to the upstream ticket. Git upstream&#39;s way of bug report=
ing is &quot;send a mail to our mailing list without subscribing, and you&#=
39;ll be CCd in replies&quot; which is not particularly reassuring, but I&#=
39;ll do it now. Then we can do the corrections once I have a link (which p=
robably won&#39;t happen immediately due to list pre-moderation).<br></div>=
<div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></d=
iv></div>

--0000000000003d214705d76b9148--

