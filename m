Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02990C433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 14:13:34 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.8094.1666793609604622670
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 07:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ACKP3vIi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id a14so23772035wru.5
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 07:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OVjq9DkBbpf++TmzW77pKMVVjgW6JT6O9FHgjEhfKAQ=;
        b=ACKP3vIilU8zg31Ya54Nkq1V7jEzM7WKEDrhELmmFwi+HwRyNPxlPI8VRyTKMDymRL
         eTTtxyhmdveuuDpKaeOSFjE92xhDkcG2z8C8ug5ef7ck7RksDp2hVqKs89cGsdFMPOt+
         agV9+9qz9qHvBQ/yeZDhaokAZ7Kuez4GgmJgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OVjq9DkBbpf++TmzW77pKMVVjgW6JT6O9FHgjEhfKAQ=;
        b=6QCQY9kBTJ+Iztu/gXXno3HUZ90fZzZpybwjRbUJugpsqhoKW86NcPQMz2IQYXLYJG
         1dGZOyvv22Q33jHYfxlFSPu1pOBYmeoaDBRBBLgIdwmPVm4prDAap86769PXdP0evToh
         0Z3PYWecrvHYaQN8Sdt4m7LIhSoh+2g++X1/JYYxx1kBwgETCUZ9msMoShMsps68FYPE
         vm9l1+eoPi5w34NakfX8FeySl7G1PqNhrt0WX8clrua3472lMwE73oMcsja3oRQsDdKY
         rIBHE3O7oogqCbSnHoBAp9i4/8dM3sqzk4x/xauAXsqRTmurafUmC8Vm1zOENW+Axrfm
         BJ4w==
X-Gm-Message-State: ACrzQf3grbbZDE0sdlNMNlSg2LIiWPD1j8Pn8cv6qTOh7ZXhkxTNWsCZ
	jRqI7L8oudS3K/zshG2fHcmNlQ==
X-Google-Smtp-Source: AMsMyM7w8+J0P55GYd8fCDTiZnHAnDgVQ95VdbgzPlZtcx882gsEcOyBh9rribEi47W43Pyf7Ph6/w==
X-Received: by 2002:adf:d20f:0:b0:236:5e77:91f0 with SMTP id j15-20020adfd20f000000b002365e7791f0mr15273084wrh.169.1666793607920;
        Wed, 26 Oct 2022 07:13:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bd65:7511:b73b:c094? ([2001:8b0:aba:5f3c:bd65:7511:b73b:c094])
        by smtp.gmail.com with ESMTPSA id k3-20020a5d6283000000b0023677e1157fsm5475210wru.56.2022.10.26.07.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 07:13:26 -0700 (PDT)
Message-ID: <0a4ef0a929727c647d740827a4ae9905e2f64925.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] mesa: Add native patch via a variable
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton
	 <Ross.Burton@arm.com>
Cc: "raj.khem@gmail.com" <raj.khem@gmail.com>, Kai Kang
 <kai.kang@windriver.com>,  "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Oct 2022 15:13:25 +0100
In-Reply-To: <CANNYZj_f6tNzH-DjZ+R3Az0v3LzU7x9fu87+u+gwX9+QW0psEg@mail.gmail.com>
References: <20221018230820.2385167-1-raj.khem@gmail.com>
	 <CANNYZj-r7G4y3ma8NkrgmKm-vgoXjvMEWYAUh=bOE0z80DrxkA@mail.gmail.com>
	 <CAMKF1srnBDVj5ig2ZF_fX+-UZ5jtp0U89uG8qE5cuW1SjX0AfQ@mail.gmail.com>
	 <E6C978BA-94B2-43D9-9275-29EC0323CDC1@arm.com>
	 <CANNYZj_f6tNzH-DjZ+R3Az0v3LzU7x9fu87+u+gwX9+QW0psEg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 14:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172159

On Wed, 2022-10-19 at 18:04 +0200, Alexander Kanavin wrote:
> Khem, sorry but no. We have well defined mechanisms for reuse, and
> including bits and pieces of recipes from completely different layers
> is not one of them. I do not want to hear even more complaints about
> 'breaking' things than I already do when trying to make things better,
> simpler and more maintainable, and I do not want to be paralysed by
> fear of invisible breakage in custom layers when doing so.
>=20
> If you *really* want to make bits of mesa recipe 'public', put them in
> a bbclass.

I disagree with this a bit. The .inc files are there to allow this in
some cases. It used to be something which happened a lot as there were
many versions of things. Thankfully we don't have so many versions now.

Removing .inc files which aren't needed is fine, but removing them
where there is BSP usage seems a bit unfair. We should try and ensure
the .inc files really only include the common packaging code.

Obviously those using the .inc files do so knowing they can change from
under them.

Cheers,

Richard




