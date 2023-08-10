Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CBAC001B0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:24:37 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.21974.1691684668494111320
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XO5SvgBQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fe1d462762so9939135e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691684667; x=1692289467;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kLI/sG831ody8Fx0xlyqHDP8nA0lch28yjz2yWEBcNA=;
        b=XO5SvgBQohIxSVU9r5GcJ5g8ahI5npZ4NY8Ci90LFcanGii+CcxfH1fq0pol3Dt+c9
         zeSmjOqcF9vcmuUmG1RlOLT/Z3s44NHK83PQFI5JuQF5BrlNXWR3U1FRNVaHJEtV2/2V
         H9T9544gP1ROcMBkvS04UHXoMwmeXXJrJIh7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691684667; x=1692289467;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kLI/sG831ody8Fx0xlyqHDP8nA0lch28yjz2yWEBcNA=;
        b=RK/JFSu0gQ9LdLTsaShHjGngYYzEAjlzXYM1+SXV+MP+xK/m+KiVmNQAJBTGH4F7Kk
         WYn2bRQFd9PKqrCx9B6YAc+LuvA/3FWuMAuwnWeFjTax0TWalPG015HMdv75y63MUdGd
         BzB72jJ/Uiee1sBTJKEI1Zb+eZVVrjYY8FVzlHnTYON+Aa2HHSoBUvwMJuHS09DnhqpS
         1zSj3y0sfjV1kxN5sKWDen2zXz2qO+RBj5qdd+6y9skMGFD8KitNRd61r+a+aa+F5ZCz
         nVqyC96446+tUZHyBeA9TB8iN5Lpzowcdd3phOlJ0Sj6KgbxdxRnFEMhseao6u7okFZt
         hfeQ==
X-Gm-Message-State: AOJu0YwXAUmYfzJ/FVcV9vJrU2trphbMB+Ym+9QfBa5EG1Qr8gcnpXUe
	+SVs9Z7cdMKSNOsHn5AVrms/XA==
X-Google-Smtp-Source: AGHT+IHRNCNMkM358DC5F53bY3HUolxuXgI2eA1IcRzFj7Al6YbvdtR4c4KbLj28hpfyolLZ9E7LEA==
X-Received: by 2002:a05:600c:2218:b0:3fe:201a:4b7b with SMTP id z24-20020a05600c221800b003fe201a4b7bmr2535356wml.27.1691684666712;
        Thu, 10 Aug 2023 09:24:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8ad4:8961:8732:8a5a? ([2001:8b0:aba:5f3c:8ad4:8961:8732:8a5a])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c231100b003fc01495383sm5573025wmo.6.2023.08.10.09.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:24:26 -0700 (PDT)
Message-ID: <bff014f2950bfbd1f3027a85992eb7c0f4e108b4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] selftest/reproducible: Update config to match
 ongoing changes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 10 Aug 2023 17:24:25 +0100
In-Reply-To: <CANNYZj-L2P96Ev=xbr5LWoL7OvyVU6hGkCajksgMgxPNF4ZQ2w@mail.gmail.com>
References: <20230810133450.237127-1-richard.purdie@linuxfoundation.org>
	 <CANNYZj9AacW-XB2G-6sHQobui1LGBHUMQTxV5EU=7ordJayWQw@mail.gmail.com>
	 <eb94b91c02dbade5945a8883a95ed04d2ee31961.camel@linuxfoundation.org>
	 <CANNYZj-L2P96Ev=xbr5LWoL7OvyVU6hGkCajksgMgxPNF4ZQ2w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185801

On Thu, 2023-08-10 at 17:27 +0200, Alexander Kanavin wrote:
> On Thu 10. Aug 2023 at 17.10, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2023-08-10 at 16:57 +0200, Alexander Kanavin wrote:
> > > I don=E2=80=99t follow i am afraid. How would having separate usr exp=
ose
> > > issues that merged usr would hide?
> >=20
> > Most host systems are moving over to merged usr. If host paths to a
> > binary were to creep in (e.g. the path to a tool, /usr/bin/xxx),
> > our
> > non usrmerge config would be more likely to generate a
> > reproducibility
> > mismatch than one with usrmerge enabled.
>=20
> But then it would creep into both build A and build B since both
> would come from the same host or two hosts both with usrmerge, and
> there would be no mismatch. No?

True, I'm thinking of something slightly different.

I'm thinking having usrmerge disabled makes it more likely we'd notice
a "bad" tool path creeping into builds rather than the case where the
host and target share the same paths. That isn't a reproducibility
case, more a general one.

Cheers,

Richard

