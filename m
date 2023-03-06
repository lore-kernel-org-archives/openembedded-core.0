Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E03C678D4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 10:11:13 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.29924.1678097464581329042
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 02:11:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Em3aUkQ5;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id f18so11994469lfa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 02:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678097463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWJJLYjEHJnirXyqBxbvHjG+Xp+O+k0xQlxdP3qY33I=;
        b=Em3aUkQ5iyEDQ1rlZgaOq+4TZ6RXTdXyWDEq6cXLblapvwpBgL6WGQNnAk0SUNa/QP
         Kj1CaRU9ulXsu+wE7kpIT5e4XX5HsPlh3We+JDbD2XINnnraTjg9AFsptNABgJiO5AoT
         PCj0cNlajwJ6boSIR487NM60RsY1l1PbhOkU9S4PpkHmGlYXMInkeOm7nkNVi7VFGSvL
         YsFY7H0UAQkQsfKA5dX3fQABdhESNVfdUfjPdWJgubdMGj/zWVzn0XMeja/c1ppfhJ+r
         p2dGSwySZFcyOAFkVV+wij1QMK5yVEXKWYb2llmgCs/Ii8qhCcaj0pzfHU2DX3BiAxmt
         ZSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWJJLYjEHJnirXyqBxbvHjG+Xp+O+k0xQlxdP3qY33I=;
        b=M4zPZfaUaxaLeWOC4xTRzSAqDLKw5b4CrtsHXREGw2HNzE6DtSNrUq6RlqPVQqxi38
         cT8hionhdgLaEaB3xOSEdiOKV4nHk1fDAUr1tokAfBGval25BqYnpq5CrMYvMzbXYznu
         NxSyyKYjOcmn0Y1NYU/lGJkelQBL8+MfttPTOLRicNbOk8lbcRTMyq4gb1FCOSIb1dXA
         dLC+GdFxE313vpIt348mWhQ2GMHhmPA6/bxkJuGh+5cyoDSfMhEfFRfsC+eSkTe8WL9a
         31IlKhT1125ATfgK/6QuqHfSC1VGmLSiW7MSKmo7bdtcGpjBHVVR5d9RczlyBBPa4ysT
         CEnA==
X-Gm-Message-State: AO0yUKVKGGpBijQx3C4/cKraXu7utCuAmZlPMuhGaMYubi6O/1Qerpa9
	hwVCYSnzUYc5YRdM8jLiJEn4N5OFOyy30Nb9ocE=
X-Google-Smtp-Source: AK7set+ycV8nWjrw3nWF76ZurSSaLP5XbvD9hiXpeSw8KZ7fi9KoWrDglXvyGyf0e27Vnivy53yeOGz+PAYPWR9PWFc=
X-Received: by 2002:a19:750f:0:b0:4d5:ca43:704a with SMTP id
 y15-20020a19750f000000b004d5ca43704amr2969245lfe.13.1678097462590; Mon, 06
 Mar 2023 02:11:02 -0800 (PST)
MIME-Version: 1.0
References: <17474798FA156F5A.18951@lists.openembedded.org>
 <20230306091108.3347363-1-zboszor@gmail.com> <1749CCAAA2091F49.26261@lists.openembedded.org>
In-Reply-To: <1749CCAAA2091F49.26261@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Mar 2023 11:10:51 +0100
Message-ID: <CANNYZj_ZT-dMBeiZ8dLv58QzO=GUeyFiZq2No8N3_meuztepqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 0/3] Mesa 23.0.0
To: alex.kanavin@gmail.com
Cc: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>, 
	openembedded-core@lists.openembedded.org, Ross Burton <Ross.Burton@arm.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 10:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178066

On Mon, 6 Mar 2023 at 11:09, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Mon, 6 Mar 2023 at 10:11, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zbos=
zor@gmail.com> wrote:
> > * bindgen-cli MR has the suggested changes
> >   See https://github.com/kraj/meta-clang/pull/748
>
> I would prefer that this PR is accepted and merged first before a
> change that relies on that recipe to exist is submitted here.

I mean, until that happens, the changes here should be seen RFC.

Alex

