Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D94C7C27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 22:36:36 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.908.1719441387688029408
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 15:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IKTkCS4v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52cd87277d8so5760482e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 15:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719441386; x=1720046186; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=azXezQj/t/g8WEt5O8z2DS9PIBUjC4vuuXjDD0iUhaI=;
        b=IKTkCS4vLq3JGC9g0t88+LpznnCg2VjRUxxyIwltboP9s4qQmXMUbggvr6LOt7Zpwl
         xWKxmHLLZzKmlyU6o0DWU5Hki/lQxtMkdkZ7c5/VeiUpgkGznbRROA57wf7hj3mWr0xR
         Z1GzYsESDPXMKFEEVwYq29yjD23esVI9m4dTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719441386; x=1720046186;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=azXezQj/t/g8WEt5O8z2DS9PIBUjC4vuuXjDD0iUhaI=;
        b=KuONSsHJJxieW7BoyzGyBIsyJ1ksQLqpi0Ctpwh0/qXYKsGkrRGgRKNMfR1DRb8DmW
         dola+Zjaj1VJb0m/S7vlcosWk+5Vogf3CjN7j+DCGQpi0lnAb0MXTunoc/UDTSeY18GI
         BF9YtslQy3+rXPirxVT+/Jy2CjXdegulujR34K3YxVtDHt8M7OmpE2ZzS8WWTSy05o9c
         Up13nBr+NRyF+C301BJ8+hY+cp/53t0SnivUpygMakXfKd+yH7XNOmpmi3LIJJRv8z/V
         w0UT6XOTUEPLDYeFqHCFIDwudiLAubv0ZyTQndAgncRRfitd1sGSLEMv7JvKF4we7kdh
         LfpA==
X-Gm-Message-State: AOJu0YyvRPQEnPccSQ8zhObvnoDILO72I/j4dis3W2jyb72Sgzs/Igjh
	jWs69RlMUYB6DZxTyYkteFwavz13nidLNmiwETQDJFH2DeA92ImyNxzlEhHLzmw=
X-Google-Smtp-Source: AGHT+IGEduDFMJfoh5WFYoqJdbQTP7xvSJXsDWObnFN+e+7bkGm4uopsVYiLstAVl2ANw/WOh8XGfA==
X-Received: by 2002:a19:ee0f:0:b0:52c:dc97:45d6 with SMTP id 2adb3069b0e04-52ce1861422mr7287416e87.62.1719441385755;
        Wed, 26 Jun 2024 15:36:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:18ef:b928:bc97:b739? ([2001:8b0:aba:5f3c:18ef:b928:bc97:b739])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42564b65a0fsm1165945e9.16.2024.06.26.15.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 15:36:25 -0700 (PDT)
Message-ID: <ad9e2853a23d17dda7fc499525054009590aff53.camel@linuxfoundation.org>
Subject: Re: [OE-core][kirkstone][PATCH] xz: Update LICENSE variable for xz
 packages
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rybczynska@gmail.com, nikhilar2410@gmail.com
Cc: OE-core <openembedded-core@lists.openembedded.org>, Bhabu Bindu
	 <bhabu.bindu@kpit.com>, Nikhil R <nikhil.r@kpit.com>, Bhabu Bindu
	 <bindudaniel1996@gmail.com>
Date: Wed, 26 Jun 2024 23:36:24 +0100
In-Reply-To: <CAApg2=TB81yXyxpt8kEaoHB-SCoJ8753w77FWby2m8Qj-nDEig@mail.gmail.com>
References: <20240506110846.125652-1-nikhil.r@kpit.com>
	 <CAApg2=TB81yXyxpt8kEaoHB-SCoJ8753w77FWby2m8Qj-nDEig@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 22:36:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201180

On Mon, 2024-05-06 at 17:32 +0200, Marta Rybczynska via
lists.openembedded.org wrote:
> I'm not a copyright lawyer, but from what I understand public domain
> is not a licence. For a discussion
> see=C2=A0https://wiki.spdx.org/view/Legal_Team/Decisions/Dealing_with_Pub=
l
> ic_Domain_within_SPDX_Files
>=20
> The next version of xz will be 0BSD so the statement will change too.

I did check into this a bit. We do have a "placeholder" license file in
our common-licenses directory so PD is accepted in our license fields
but there is no SPDX PD license identifier for the reasons linked to
above, each wording is different. PD means different things in
different locations too.

Switching to 0BSD probably makes things easier!

For now, mentioning PD in the LICENSE field would match other recipes.

Cheers,

Richard


