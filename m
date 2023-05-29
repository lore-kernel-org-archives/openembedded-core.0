Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09087C7EE2E
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 12:34:44 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.48432.1685363683173215863
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 05:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=P1zL46rS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f61530506aso33992415e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 05:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685363681; x=1687955681;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zo2Ou1qE7Du9M0uDvJ6XrLS5drNIuFlrlr0/DKGjCrE=;
        b=P1zL46rSn7xV2nD3arc+VeppjLkSVPTa1Uo15IER2bPh4vBlu2ILIoHQ/UHE2sjMv0
         rfHp/7gY5Kc7vOvI0j2xVifaAaJPqZq6wvtIvfVcHwckZ2lFJ2DIiP1oiIhShJrUgh9e
         kYjiS+H8qBsYxVy2+u3tZFpMnvC55R2Cir2Y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685363681; x=1687955681;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zo2Ou1qE7Du9M0uDvJ6XrLS5drNIuFlrlr0/DKGjCrE=;
        b=ZDxMEv3gK2twoC2WKedpZCRTNAksJWgNqq63wjayOuAapFf+cCEoJBwGOQ4Bd+FGCf
         rpmI1RgwBSfvkAGVg5AbMrGIYVEKMhT47mn8+keCoOL4aKPqeuSOyJrTuDwI/kp4YXs2
         JuWrplRnun4O++Qqek37GPXSLh3vt7GeWQ/6KmWrJBfgc8CwqFikxfxKP9w+Mf3kfov1
         B1LYqmJwLyxjISZBYDt6QWahK+LyJH14sS0qekK4iu3Ma33sjs8OjKluh4YfIbqGS/Eg
         PFL4CZWKcPtTNR993EuKizN3ELQLHrHLKLR8cisHaHsZRSgjXDOl5ngFjhcbAh70rVKg
         6G+Q==
X-Gm-Message-State: AC+VfDwpJhwrGVoMPOkh3KRvLgnSxUEu+Ham1uHCkQz8vpUXlztTC1am
	2LsNarxNFolR83tlt59wUHSkVQTx8MFRFCcHOLs=
X-Google-Smtp-Source: ACHHUZ4wv5prXwsELnJKzr2SWObIU3ZhbR9tq05+zv61fCSz6SZy3jEsP6XHZkJo04i7ZiOj52cZmA==
X-Received: by 2002:a1c:f709:0:b0:3f6:179:4506 with SMTP id v9-20020a1cf709000000b003f601794506mr9467049wmh.38.1685363681677;
        Mon, 29 May 2023 05:34:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ec8d:e49e:8d5e:e7d5? ([2001:8b0:aba:5f3c:ec8d:e49e:8d5e:e7d5])
        by smtp.gmail.com with ESMTPSA id i7-20020a05600c290700b003f42d8dd7ffsm14146373wmd.19.2023.05.29.05.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 05:34:41 -0700 (PDT)
Message-ID: <0718565165c8175882355d0674588f71c36b8bb7.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH 2/4] python3: add libxcrypt-native dependency
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <mrksvolk@googlemail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Markus Volk
 <f_l_k@t-online.de>,  openembedded-core@lists.openembedded.org
Date: Mon, 29 May 2023 13:34:40 +0100
In-Reply-To: <ZG5FVR.L4YKBKAES08S3@googlemail.com>
References: <20230527133252.284132-1-f_l_k@t-online.de>
	 <20230527133252.284132-2-f_l_k@t-online.de>
	 <17635252DFD4EDDE.6918@lists.openembedded.org>
	 <CANNYZj_jz-SCh4kq33fe7_uiVRAvL+15i4kQ=U9Dkv84W2s+xw@mail.gmail.com>
	 <VDGDVR.YBUKQ953M2TP3@t-online.de>
	 <CANNYZj_0ASF5ERsCgrB3W3qYgGJFwJzXn35cgc6ojQf0fi1Yxg@mail.gmail.com>
	 <POIDVR.URDIMNIKV0SE3@t-online.de>
	 <CANNYZj-megU_4p_eR84XiSt7YvwWu57tWBEZDKoBFkjRj8ZKVQ@mail.gmail.com>
	 <MEJDVR.WDZW7MFB3W9N1@t-online.de>
	 <CANNYZj_-ptiJqvmf+cU0qV7VkKG0ds=guN9aTU1VirjcG8WjQA@mail.gmail.com>
	 <7bb5f101af77af3a051a1b049206800aec542ccd.camel@linuxfoundation.org>
	 <ZG5FVR.L4YKBKAES08S3@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 12:34:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181870

On Mon, 2023-05-29 at 14:02 +0200, Markus Volk wrote:
> Am Mo, 29. Mai 2023 um 08:08:09 +0100 schrieb Richard Purdie
> <richard.purdie@linuxfoundation.org>:
> > Alex is right and I should have spotted this, the -native
> > dependency
> > definitely isn't right. We'll either need to fix things or revert
> > them
> > and wait for the right fix...
>=20
>=20
> Absolutely. I had a quick look at native.bbclass yesterday, but
> haven't found a nice way to deal with this yet. =C2=A0This week I'm on
> night shift and therefore have rather little time to deal with the
> problem. I can send v2 patches which just add
>=20
> DEPENDS:append:class-native =3D " libxcrypt-native"
>=20
> But revert would also be fine for me, as this is more of a niche
> problem

I'm going to revert those changes and then we can work out the correct
fix without any time pressures (and then I won't need to keep this on
my 'need to do something about' mental checklist!).

Cheers,

Richard



