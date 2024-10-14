Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6567D1A443
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 10:56:35 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.52243.1728903392569793266
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 03:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BpagaoNs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-431137d12a5so38831075e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 03:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728903390; x=1729508190; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HWpYLpupBbFpsJgmVBYR6OZ28gJA0t/6qeSqkOEXhmI=;
        b=BpagaoNshNtrMya0lgULe62AlXvIFFpXhwhRm98OE4Ja4kpib3Blj8tE5YYl8xiwfF
         Op9ah8BoO5AF+y84YplEdL+3CgaJjbyS9J2zPmRrgbA0JLrI3QXjgBak7luIQjP3IvDv
         jgfIM5nAIxLsRkx0gaZxCURo3Jmn8oLvG/uiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728903390; x=1729508190;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HWpYLpupBbFpsJgmVBYR6OZ28gJA0t/6qeSqkOEXhmI=;
        b=ZKpM5qwl96aSr5OGKy2QnbiiQEKdE3icPdbXW01oUJ2DeH0RqT0T3MPNnX+c4Tt4cH
         1X1YGUp0HbroHIKsmc6mC8XHtbxIc47R+lltR568Yvo3gLtxnAVZrxjzNrX0jj7es00i
         dtoompuY6xlP70RPpigb4+aZX7tBuCu2wYo668ISs04Sf8SR0w2XXZK3PBpoZByq2GAR
         VhaKgaTEcl2bOEBO4KGV2mzPfcS8Wxqu76ok//jZryDAe6D9qDEBmq2q0cBtUHWIU2w3
         X/LJCjKSEcN4msvy/J6A1U7LWR6bRFlmJqlf1sYGwPgp+nFQlm/86MOdPUn7a6lvmxLw
         MxVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBrT2UrhzEluTTliCYpcRyVcOQTx0knsm88TT2HGaxiRY6bdtGlYpowXapeJcHKHCgndMpibYcPd3Kte+j/u3jtA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzfmHEviEqIaZve0vAFaDnZ6VyX2TR6uepzZqxJQ4V59WTyT7AP
	IFpNg69aetqDt2gDheUxZyKq73WU74KUnBNqxQ6vGSfCh9NEJkCfgaEmeirVthc=
X-Google-Smtp-Source: AGHT+IGMECxLaVxL4wAY2PooRniiUtIvgwO8XnDnQZy+WHUTG0IxbSTFZdPkfHVcVBeErshjzewB1A==
X-Received: by 2002:a5d:4dca:0:b0:37d:4c40:9ee with SMTP id ffacd0b85a97d-37d5529f09emr7425103f8f.42.1728903390537;
        Mon, 14 Oct 2024 03:56:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4468:7613:7612:e2d5? ([2001:8b0:aba:5f3c:4468:7613:7612:e2d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79fa0asm11046805f8f.83.2024.10.14.03.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 03:56:30 -0700 (PDT)
Message-ID: <d3073a746333b36219bfab0a463283130785e998.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] patchtest: add "Inactive-Upstream"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, quentin.schulz@cherry.de
Cc: katariina.lounento@vaisala.com, openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2024 11:56:29 +0100
In-Reply-To: <CANNYZj92q0=xDr5UdPTRYM4F6Nehripqtwdi_VScM20HM094GA@mail.gmail.com>
References: <20241008063325.62462-1-katariina.lounento@vaisala.com>
	 <99bb8bf7-a873-42a6-8dcc-23dd7c055c78@cherry.de>
	 <CANNYZj92q0=xDr5UdPTRYM4F6Nehripqtwdi_VScM20HM094GA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 10:56:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205748

On Mon, 2024-10-14 at 12:52 +0200, Alexander Kanavin via lists.openembedded=
.org wrote:
> On Mon, 14 Oct 2024 at 12:21, Quentin Schulz via
> lists.openembedded.org
> <quentin.schulz=3Dcherry.de@lists.openembedded.org> wrote:
> > I believe even if the project is inactive, we should still aim at
> > submitting patches in the event the project starts again, or maybe it's
> > just that nobody has sent a patch for years and the SW works good enoug=
h
> > for all people involved.
> >=20
> > What do you think?
>=20
> As someone (you could say, the only one) who actually does the work of
> submitting the existing Pending patches in oe-core

Just to be fair to those who have helped, that isn't quite true ;-)

You do a lot of it and it is much appreciated though :)

Cheers,

Richard

