Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40143C54E94
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 14:54:54 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.75453.1674744887539667256
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 06:54:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Nbuu3Frp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id y1so2049548wru.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 06:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xpv+DRJAg3E3hfBtAWqklxfNSkgrQHwvqXx12DCnGsA=;
        b=Nbuu3FrpiX85bQMiXdIzFr4tNQezgn4jvdE9ZlfQTp6rOL+1YdKLSdsBlKmrM2zC7w
         4er6K7L3u5TG/WYEq8RqQ6u0j/TlAQMe2EVSXnubLeZ9C6pZemNqlJE8qYNavhLBjkE4
         w9GVdiQhGXkidpIQ3P+WkPz5wxWEKLqO6cM/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xpv+DRJAg3E3hfBtAWqklxfNSkgrQHwvqXx12DCnGsA=;
        b=Ul5dpm0y4tv6IkKl7YMYsX+98UwAEL7g3t6Kh2040tr95eXsZ8MymZu5RYUP1POzfI
         bQDjo3SSkW+kGfwvoolKpLXxSj70bfGsFEEco1h2vU7U017HZAXXUtnKxD9lL2VQS4Zt
         yhpjby/LTFgFTPCczjQNbsbavBzHnpE0pYlPktQdcgqFyjpWLWPt8y+bGV1B8tAS6Jw/
         P5mJA6I9XESEGzFj9x3Jd6r92fLMbRbyX7Jp+HSciO/CcdYYl4afNVDrJunF3PBX02PS
         InFvAZw+MBn8Jpce/JLr1D+A0Ee9bTgfC0wGdClxjtJQ96HJpcIigh77ae+xJnVZzt/z
         Edng==
X-Gm-Message-State: AFqh2kqpHVWZD0i+L/eFXjYL9uRO80Eh4cqWPCDpEC/KYoJDzBuim0A2
	R3FEHyJlSX81//C2+sBbYKeP0A==
X-Google-Smtp-Source: AMrXdXtP3JmmcrURo+4VeUKJvDVQ4wFPNBVs7PI3Ztl5yG67T/xHzwayrfYSQtqIXC3eQFHY2YZyLQ==
X-Received: by 2002:adf:aa8f:0:b0:2bf:5dc0:56c8 with SMTP id h15-20020adfaa8f000000b002bf5dc056c8mr21654649wrc.51.1674744885862;
        Thu, 26 Jan 2023 06:54:45 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f2d7:e330:f537:35d8? ([2001:8b0:aba:5f3c:f2d7:e330:f537:35d8])
        by smtp.gmail.com with ESMTPSA id e2-20020adfe382000000b002bfae43109fsm1519313wrm.93.2023.01.26.06.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 06:54:45 -0800 (PST)
Message-ID: <fc0315e12584aabee597f70a223c67a01de5fd91.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] gdk-pixbuf: remove ptest support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Thu, 26 Jan 2023 14:54:44 +0000
In-Reply-To: <CANNYZj8FVr7_ASbMswYxWthAM_a7sS_9iF1uyP8hb-QwsU2N4g@mail.gmail.com>
References: <20230126083752.151940-1-alex@linutronix.de>
	 <2986f2e9ac85049402a858526b6989028e451a8c.camel@linuxfoundation.org>
	 <CANNYZj-cnpyE7cbGuX+Ou465BikgwNinjAgHtOzqy-854kZ5kA@mail.gmail.com>
	 <0bbeba753327c9348177349032e03f366c38d5dd.camel@linuxfoundation.org>
	 <CANNYZj8FVr7_ASbMswYxWthAM_a7sS_9iF1uyP8hb-QwsU2N4g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 14:54:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176401

On Thu, 2023-01-26 at 15:18 +0100, Alexander Kanavin wrote:
> On Thu, 26 Jan 2023 at 14:01, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Ok, that helps explain it, thanks. Could generate these files using
> > gdk-pixbuf-native?
>=20
> gsk-pixbuf's meson files are written such that the files cannot be
> supplied from elsewhere. We could patch it in, but upstream will
> likely reject that:
>=20
> https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/blob/master/gdk-pixbuf/meson.=
build#L352
>=20
> The real fix would be to teach meson to run custom_target() items such
> as the one above through exe_wrapper (qemu); there is an upstream bug
> for that (from me) that had no attention so far:
> https://github.com/mesonbuild/meson/issues/11029

Lets just patch it. I'd rather keep tests, the patch isn't going to be
complicated or that difficult to maintain.

We might even just be able to force a file into the right place at the
end of do_install?

Cheers,

Richard

