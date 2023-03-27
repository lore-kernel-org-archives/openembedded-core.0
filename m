Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52CDAC6FD1D
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 22:28:22 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.50607.1679956096573366786
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 15:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a7Sv+/mg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id y14so10299225wrq.4
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 15:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679956095;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=toAcRtsvTNBM1af6K6ULsJw3NMNjl9Pca8LjF9qogow=;
        b=a7Sv+/mgurBdJABFPPiDqCEUGvhIhw2mRpzcVVgJ3c1Om0VEH3PQCs/IKEbOzon25B
         Eo/NFnQ5LgHvP4hidja19/ES4xQ/943EeDcYIZXMS1Qha7Zo/Q/a31pOdgaUrzJpUJOJ
         OoaA02b1q/WfJYWTXQhG6rT+kBtbNMgVLu9S4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679956095;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=toAcRtsvTNBM1af6K6ULsJw3NMNjl9Pca8LjF9qogow=;
        b=VTukRS5FCxVVT5hDVx16v2+rc2mvkcPjwBOoOdk826BXVslJU7PRkjARwGyy1Yu3Pg
         N7fhW86ZXlIBwelX9b8G93bnZQLsSuoCFBni8ggvOeqEBkAYlxRzAwSQ4bgUMS5IsaHK
         syzSJj7Om7PhTqwtiFOPyA5fFAxpusY8Be4l+jD37ebUiXtghLbO3Y3p01wBRDBR1YSL
         Y9RUBtCbzESN7DWjFk00qHE1gPG0VcIa+vjfE/jvuyiWsAPtTw2fhAcceycHKmeEFdvo
         zQ4sc/gofuVAnYLoohcUZZdQ8gpE1TxomXM9aDpDAetPOZjqHYnS0a/yFdLVkxxBWj7/
         bj5g==
X-Gm-Message-State: AAQBX9cDcN6cmWmfcK0RFdg+b93NGWw1mgJb8ADzecICqjejBsyUrFAw
	8SyPYExyqPxXybnAlzWN66ciTw==
X-Google-Smtp-Source: AKy350ZzfHGnY3YVBzamw0xVOZxo6C3rIcpg0V+2N1nw97e8sKtXXz+s4meDnFLafeWkgdvGkxrxgw==
X-Received: by 2002:adf:f887:0:b0:2ce:a9e9:4905 with SMTP id u7-20020adff887000000b002cea9e94905mr11772094wrp.34.1679956095000;
        Mon, 27 Mar 2023 15:28:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ad8e:6d69:16d:166c? ([2001:8b0:aba:5f3c:ad8e:6d69:16d:166c])
        by smtp.gmail.com with ESMTPSA id k6-20020a5d6d46000000b002c5598c14acsm26347188wri.6.2023.03.27.15.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 15:28:14 -0700 (PDT)
Message-ID: <af438a29a2fbf4063fe8fdda59969e0b893ea8b1.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCHv2] webkitgtk: update 2.38.5 -> 2.40.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, alexandre.belloni@bootlin.com
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2023 23:28:12 +0100
In-Reply-To: <CANNYZj-JeJ0xr=+bCFqxfe7cHfw6oCjYLkgn0u=6gftrwyTicw@mail.gmail.com>
References: <20230326164557.27827-1-f_l_k@t-online.de>
	 <20230327194727d709fd64@mail.local>
	 <CANNYZj-JeJ0xr=+bCFqxfe7cHfw6oCjYLkgn0u=6gftrwyTicw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 22:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179188

On Mon, 2023-03-27 at 22:08 +0200, Alexander Kanavin wrote:
> I think all of oe-selftest is excessive. It takes many hours.
> oe-selftest -r distrodata is enough.
>=20
> What we should do is move the maintainer assignment check into
> package_qa rather.

Assuming we can limit to OE-Core, yes. The other one which trips people
up is the home page check so we should do that at the same time.

Ideally we'd have patchtest back. Failing that, a way to run
patchtest's tests pre-submission would be ideal. The tests were already
in unittest form iirc and would be good to maintain in OE-Core
regardless of patchtest's future anyway.

> And probably split maintainers.inc into respective recipes, come to
> think of it. It'll hopefully draw more attention to how many do not
> have a maintainer.

I think this is probably more obvious all in one file.

Cheers,

Richard

