Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6549C38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 09:43:03 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.5726.1662543774982807291
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 02:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f7n53/6T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id c11so15224744wrp.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 02:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=Xr04gE9MsZAzFXxR66JtomFxS1X6mHMY5+jl80W9d+g=;
        b=f7n53/6ToAY5AqGiuGuGdBk6bebxx5m1CBcI5MFSWKPNdL4/VtwTIh0/nOcYwHtHnh
         C1tKwHd16AA0L9OEs2/r8ZPpg5WQ6ib9lJi9Z4Vjvg217bOX2tMgaNs4XokHmVJ8icKl
         KiBKfTOBkNGek4OD0mntB+9jtMLaq/ob/nGMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=Xr04gE9MsZAzFXxR66JtomFxS1X6mHMY5+jl80W9d+g=;
        b=wKD7oG5Z6Cp1rb2z+1CzbwasMDrkXkwSErx7ZAlqXtBFMnXcHLvWB0wBYoECdyt7Uc
         Slc5a5KXVYmV5UXH5pCa77PbJp6M2ziAzdiskt66R3wuno2Dz1Z9hX059TPucjWqx2Yy
         W2s1Yqtfro2I25Kk61vRFkgLZazr/iWbkhDRvCEL7kBtW2x4iXba9wtbhUsACfciGHfi
         7t8OyEbSL+CpVeZGdYyCwIrtUTltfKw7IZDwtijnzvhU+G5h2g9IHqLanGiJ+EAgPlT5
         hPWZbfGe5ulOei4f/R1VE2oPRFktcDeL7AbYNeawPOPiReiuXH1tjKp7I9PmxFRDP2C7
         zjoA==
X-Gm-Message-State: ACgBeo3U184mAJ+o38xj8No8ylsVKH/2Wfumnn06w7R3v2Zo/OABXTdj
	u9Fs3wv73X0oaMFsMqHafShd3A==
X-Google-Smtp-Source: 
 AA6agR7bKcFetc4XcdRTFc4g4hnpki4i9tVb05vL7Tt3mc0SIDOOdcQzRrRMAdLKKAgpwvER2lsBRw==
X-Received: by 2002:adf:d1ce:0:b0:226:ef46:838 with SMTP id
 b14-20020adfd1ce000000b00226ef460838mr1519116wrd.67.1662543773324;
        Wed, 07 Sep 2022 02:42:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eb69:bb70:edb:6315?
 ([2001:8b0:aba:5f3c:eb69:bb70:edb:6315])
        by smtp.gmail.com with ESMTPSA id
 s29-20020adfa29d000000b00229533a5391sm1461457wra.68.2022.09.07.02.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 02:42:52 -0700 (PDT)
Message-ID: 
 <68628e983b7482d998c282a07dab4817a4e786d8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] systemd: Add 'default-dns-fallback'
 PACKAGECONFIG option
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Niko Mauno
	 <niko.mauno@vaisala.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Wed, 07 Sep 2022 10:42:51 +0100
In-Reply-To: 
 <CANNYZj92jmRd3SF19r=o8aUfgpOJPxAL=AOQW=7EWW3px484wA@mail.gmail.com>
References: <20220907071155.2807336-1-niko.mauno@vaisala.com>
	 <CANNYZj-8LsBC3B0ubeGXfKY4bVS8==-x=SQc60DhXY3N13u-Tw@mail.gmail.com>
	 <9de9c193-56b7-da1e-f4f9-d43a111de0f1@vaisala.com>
	 <CANNYZj92jmRd3SF19r=o8aUfgpOJPxAL=AOQW=7EWW3px484wA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 09:43:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170383

On Wed, 2022-09-07 at 11:34 +0200, Alexander Kanavin wrote:
> Thanks, I think it's more clear this way. PACKAGECONFIGs that do
> nothing when on, and something when off are harder to grasp.

Thanks, I agree this looks better FWIW :)

Cheers,

Richard

