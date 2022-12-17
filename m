Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D02C4332F
	for <webhook@archiver.kernel.org>; Sat, 17 Dec 2022 09:04:50 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.4075.1671267886939487847
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Dec 2022 01:04:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iYwpCQcs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id h12so4537345wrv.10
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 01:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XGE8q41uowhDQS2akX1+PBS3ijr+MC8sMM4vzjb8vO4=;
        b=iYwpCQcsdo0sfGl1MHyii66hQYQ9KAMdnGp39K554zcOFp4v++8Wo6c61SKtTBOKG4
         L4Q/IzPZmqhCGdjQzsIEmXG51ueS4pTTiySRUBo0KgVfje4DUu32UVmojEOo8ujj3sY6
         xQXiBgaUHMVmgDrv7d39NMaMBZ7ncRbhEQeus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XGE8q41uowhDQS2akX1+PBS3ijr+MC8sMM4vzjb8vO4=;
        b=hKDUFgX7yGkzTi17jWDHHT+uNb5wQlN7yHlOYDZ+pj6JC5wykcJKg37qFm10haVaMT
         8M+l9vL+L1eQn9XTiQY9rVpOJX3MUlANEggbpN86MURWN2NV3bGEn300DdN1Zm7UwHmW
         pXoSCB9CZTvjrd4CIryPkaeMywSARcw+vz1qm90+ndsGkpl/yPxrueR7GHE3Z+f07Upw
         WWOdQQOJpkpssDH5w5t5LQmuKILZASLr0JCfSHS04c04QVd/LmbeOU4uJk6r7jfnEYiY
         +Ucn3pc8ROj/jUOmDvicEdgAQhEXEneSMLQEiAaJ9lW4y1VmsHjfgzi4tLhIzn9BCN54
         Ohfw==
X-Gm-Message-State: ANoB5pkm+mDzJVf+YayE0KVRTvDAPye0KLJ3+X5BrIlhRuUwoDkJYL4V
	9hZJc7Wmojn6z76l023475F+ug==
X-Google-Smtp-Source: AA0mqf6RABalpd9Qp6wCYpSbDE99Hj+GaNwaO8mjZg5ZQxuk9LONFwdY3hQLTCMNstFmYDn+8veJYQ==
X-Received: by 2002:a5d:4c50:0:b0:242:ce7:ca6f with SMTP id n16-20020a5d4c50000000b002420ce7ca6fmr21845552wrt.26.1671267885266;
        Sat, 17 Dec 2022 01:04:45 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:17b:a3fe:f7a:35a6? ([2001:8b0:aba:5f3c:17b:a3fe:f7a:35a6])
        by smtp.gmail.com with ESMTPSA id n5-20020a5d5985000000b00241cfa9333fsm4823777wri.5.2022.12.17.01.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Dec 2022 01:04:44 -0800 (PST)
Message-ID: <63946bb96118dee037e683ff57cb16d6ca9e566a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH v2] qemu: update 7.1.0 -> 7.2.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tim Orling <ticotimo@gmail.com>, Mark Hatle
 <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 17 Dec 2022 09:04:44 +0000
In-Reply-To: <CANx9H-ChoVO6YcZ+SwZK_8AkSh7Tjmk29efjSMojktR3XBPaZA@mail.gmail.com>
References: <20221216154511.341054-1-alex@linutronix.de>
	 <d7ec026b-4343-a133-5462-034655a9403d@kernel.crashing.org>
	 <CANx9H-ChoVO6YcZ+SwZK_8AkSh7Tjmk29efjSMojktR3XBPaZA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 09:04:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174770

On Fri, 2022-12-16 at 13:38 -0800, Tim Orling wrote:
>=20
>=20
> On Fri, Dec 16, 2022 at 1:37 PM Mark Hatle
> <mark.hatle@kernel.crashing.org> wrote:
> >=20
> >=20
> > On 12/16/22 9:45 AM, Alexander Kanavin wrote:
> > > Disable slirp by default: qemu no longer carries libslirp in-
> > > tree,
> > > and enabling slirp requires providing external libslirp first
> > > (available from e.g. meta-virtualization).
> >=20
> > I think disabling slirp (by default) is going to be problematic.=C2=A0
> > Most of my=20
> > configurations and those of people I work with use slirp.=C2=A0 Forcing
> > people to=20
> > include meta-virtualization in all configurations may not be
> > reasonable either.
> >=20
> > I suggest that we bring libslirp from meta-virtualization to oe-
> > core to preserve=20
> > existing behavior.
> >=20
>=20
>=20
> I agree. This is a strong case for adding to oe-core.
>=20

Much as I dislike slirp, I agree we should do this.

Cheers,

Richard


