Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA65C3DA78
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 16:19:40 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.143259.1673799570450581561
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 08:19:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gZrr3JbB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id bk16so25337232wrb.11
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 08:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9Qs86R9vQsB6Jsea0Mg+AlK1Ya4t28FIvu5+zVcSOE=;
        b=gZrr3JbB/L71UwB3c2ECGvebba/e4bdx45PPmD7X+ZwQpEOMNvpa2GGk7xjWlaZ7+1
         M05Fc2umu8/ZAeP6jIhDRibiR792CtHEMSjo9fZxY+lOp5nOI3JieoW8H+0xZ0FqkgkH
         drzPbAy383wD24287/MwePIDxwRHgTd9G+uqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R9Qs86R9vQsB6Jsea0Mg+AlK1Ya4t28FIvu5+zVcSOE=;
        b=JFxzan0fKFk8MsEz1k4apD/15d2Ra1Eki6icYU7w8DyjC9T7mB5PN9xR+kxrlEbHbI
         nmG5eLS7U4dBe3pGh1gPk6DU5/ZnY/zeNAOtuoUAbiw1PQpjztBCSr8XeKbLM6XqXlqd
         ya6MG5r22c0BgCsJh2gbKzo9NAv07XpAGnLxEM87aVNmtbsoeBXpQCbdEsBvM95A992D
         khS+ayVijEpb4MxyijExJokfBsT8Ki3zardSm6dGkVdQnD+L3fXUnut6wpVs9iyhoauV
         ct8ioExPXspUncf4/jATmuIKzu3sawsw8Wksj1lABXd/0cYXogbqA/7zJmjC1scWM5iy
         UWHw==
X-Gm-Message-State: AFqh2kobkfxav22b4aTS5tYRD5n7H2TRWLC2cVC8piW2gXkhVa6Wt/sf
	ZbaGxagKXQDHdgovnw0A080b6Q==
X-Google-Smtp-Source: AMrXdXvWyqzOrgaBg+lbv78owzNhRv4EzBHUtips+J3kQnz+ASWrvOOMhZ1+ig7HUuk+PlkM4qu6Kg==
X-Received: by 2002:adf:fc51:0:b0:2bb:f88b:43b6 with SMTP id e17-20020adffc51000000b002bbf88b43b6mr18216154wrs.3.1673799568742;
        Sun, 15 Jan 2023 08:19:28 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c753:75fb:9583:e5c6? ([2001:8b0:aba:5f3c:c753:75fb:9583:e5c6])
        by smtp.gmail.com with ESMTPSA id d14-20020adffbce000000b002bddd75a83fsm7037306wrs.8.2023.01.15.08.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 08:19:28 -0800 (PST)
Message-ID: <da412a8164918b0fba979bab43d2276bbee356ce.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v2] gstreamer1.0-plugins-good: Fix libsoup
 runtime dependency
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Hochstein <tom.hochstein@nxp.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 15 Jan 2023 16:19:27 +0000
In-Reply-To: <DB3PR0402MB3852E2AE8423B74D676FDD09E2C09@DB3PR0402MB3852.eurprd04.prod.outlook.com>
References: <20230114234936.2242153-1-tom.hochstein@nxp.com>
	 <76323aa4a372a29c19bcb7baee5ea24b3afb2b73.camel@linuxfoundation.org>
	 <DB3PR0402MB3852E2AE8423B74D676FDD09E2C09@DB3PR0402MB3852.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 16:19:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175888

On Sun, 2023-01-15 at 15:54 +0000, Tom Hochstein wrote:
> Okay, will this do the trick?
>=20
> +RDEPENDS:${PN}-soup +=3D "${MLPREFIX}${@bb.utils.contains('PACKAGECONFIG=
', 'soup2', 'libsoup-2.4', 'libsoup', d)}"
>=20
> Is this a general rule that explicit RDEPENDS require explicit MLPREFIX?

If bitbake can't automatically determine the package as part of
PACKAGES, it needs to be specified.

Cheers,

Richard

