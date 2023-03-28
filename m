Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2421EC76195
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 12:28:36 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.64869.1680006506274804970
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 05:28:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z9zrI+ZE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id l27so12023933wrb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 05:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680006505;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ujIsNVuH5MNGExI9IMaB2mqsineB6BMWbko+iTZ6wqY=;
        b=Z9zrI+ZEwgwSRH2eSWNy26+rHlO+wYpb3OK0HyAasTqA1vcmTzOZRbmjUvYEfAw9VH
         dzWJak1SECb25XUCu16nf+gtG3hWRjXIj31hEKP1c+BUFSADGaSOpZvOd6JUmMnK6fgh
         FDeVZLz9Ex69bzy4IWoqpPp030zIZQ5YXGRzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680006505;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ujIsNVuH5MNGExI9IMaB2mqsineB6BMWbko+iTZ6wqY=;
        b=QKZnb2Z5KeYYKryGL66dpuLrmITupW3evbnzZR7qMM3gnsH8Ub3mi0/sHFYoqgOtcw
         DfyC0TBMYrhJM8Ql2QH2jZLk0fdBqVUB5LpwLIvqiSsnITUP5LvncfXIEoT0e52SNauL
         rb1SM+u+9X/rh2bs+s6fqeAE8Wg07TuX9i8kqJZUUb7YpYJmzGUBuRwKOG27JoFpsjQj
         /AOyoQYSQn4oiXkDy25Mz7oye+AlnbsZSVpKZnkxEpDJ5wZeaAKJUCpjih4j0f5ggi8E
         Sbkl+KZpfOD4APy57Dtz7vOElAFh2GXMRpq4MxUIOdDDNYqYrRz5NWuFlyuun7btyvEc
         Q1Qw==
X-Gm-Message-State: AAQBX9egsqXrGRXQ8p3hcgXL0iPQEh6rHMUXL+v65eiIy0xUprymbL5H
	XbeQZEGTIb91LRJrVYqcJkQnPQ==
X-Google-Smtp-Source: AKy350ZwLe65l7E5sCgicQ6Du5qSYDbZz4hDEPCSviF3TFt8jWyGnrUpB02AKNe69lZL4sSbSq5/Dw==
X-Received: by 2002:a5d:4688:0:b0:2c8:b9cb:885e with SMTP id u8-20020a5d4688000000b002c8b9cb885emr11371447wrq.24.1680006504716;
        Tue, 28 Mar 2023 05:28:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ad8e:6d69:16d:166c? ([2001:8b0:aba:5f3c:ad8e:6d69:16d:166c])
        by smtp.gmail.com with ESMTPSA id a7-20020adff7c7000000b002c70ce264bfsm27791819wrq.76.2023.03.28.05.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 05:28:24 -0700 (PDT)
Message-ID: <53196741237572435b0a5965aa77a72b021d6fed.camel@linuxfoundation.org>
Subject: Re: [OE-core] oe-selftest for devtool failed
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Frederic Martinsons
	 <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2023 13:28:23 +0100
In-Reply-To: <CANNYZj_gMBkeMPO=zG+OFx84kJj=+DFqQUdULOQ_jR5wGApfjQ@mail.gmail.com>
References: 
	<CA+cAkeqygZo7JXaaatanuNUaq2tpP7jfa8ZgFZ3pj7WgCuN_=w@mail.gmail.com>
	 <CANNYZj_gMBkeMPO=zG+OFx84kJj=+DFqQUdULOQ_jR5wGApfjQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 12:28:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179230

On Tue, 2023-03-28 at 10:54 +0200, Alexander Kanavin wrote:
> oe-selftest is executed on the autobuilder all the time, so if it
> fails this way we'd know.
>=20
> Can you try making a pristine build from scratch and run oe-selftest
> in it? You should set up sstate cache outside of the build directory,
> so that selftest would reuse it.

It is almost certainly some local setting or other difference which is
causing the issue. I'd like to know what it is though so we can try and
improve the test execution and avoid this.

Cheers,

Richard

