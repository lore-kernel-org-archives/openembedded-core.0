Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB922C76196
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 13:56:48 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.21595.1680357405903698569
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 06:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Aqtwb5tw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id d11-20020a05600c3acb00b003ef6e6754c5so11624454wms.5
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 06:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680357404;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cOLO42fmQDaMGwOhbhNZ2dGLOYpDG85nTGm4wix3wZQ=;
        b=Aqtwb5twDCTs9iHVMWCOxrFyhzFZi4Jn9lVpMGXlhgfZ0fIIHGnOBdHZ8wGabz+6AH
         u+OfoaMtD3Htcwx/LYriAOUIXVvWYN3gnz3F+P6xDvymRdph7lK7SqHUrTzOLPm+sc0L
         M6TeX3QCKmqpC4rXgTrB5OxL4BZ7IRIY8pwus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680357404;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cOLO42fmQDaMGwOhbhNZ2dGLOYpDG85nTGm4wix3wZQ=;
        b=O7TuZr8ykx8xHVlibPKMcN7dza2bBPv9A6bvi4a/3sqa8Owi/dJBrqcR+rL82ecfTa
         zmW+AdBYR9U8M884N1tMpZ8VaAMahOlYkJ/TgIf16igc9mxQVAJTLczf+iMZQSn2b6UE
         R7AtmGYc84hMTkoGKkHR+Gww1J3NQ7EeaNZFVWzx1pllN8XB3/V19eoEygc6L3eVKd66
         Sn+kIUq1WGK8VmPX4uDyKrzF9p5k//PA1RQ512J5Gp4tYHXRCLC1BLkFao2osCxM8P6K
         mkuOCJni65muEioGobG2cX7O3z1a5ZVz0C/Qdnx42n8kZOgVVodZfH/7/XR38NvGqEif
         KtzA==
X-Gm-Message-State: AAQBX9fNxaemgm39tXvJhoTz9W/LEH3XLlmeHrp4CezXXry2moJOIYc+
	H9ZmqZC27oTRb60y70wDGbUi1g==
X-Google-Smtp-Source: AKy350b1oXkMYoMgu9T07E6J4sE5ukmBG/ROLiNo4kPedQXCfEqUBzBruwNTVgeFjAQSSf4YhMWvjw==
X-Received: by 2002:a05:600c:2291:b0:3f0:3ce2:1e3d with SMTP id 17-20020a05600c229100b003f03ce21e3dmr5727100wmf.12.1680357404383;
        Sat, 01 Apr 2023 06:56:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e3d2:bb2b:b7e5:a8c4? ([2001:8b0:aba:5f3c:e3d2:bb2b:b7e5:a8c4])
        by smtp.gmail.com with ESMTPSA id b5-20020a5d4b85000000b002c559843748sm4995450wrt.10.2023.04.01.06.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 06:56:43 -0700 (PDT)
Message-ID: <234056a062d9d4fbe252ddd0112e44ebbce34a0f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V6 5/6] meta-selftest: provide a recipe for
 zvariant
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Fr=E9d=E9ric?= Martinsons <frederic.martinsons@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
 openembedded-core@lists.openembedded.org, Alex Kiernan
 <alex.kiernan@gmail.com>
Date: Sat, 01 Apr 2023 14:56:42 +0100
In-Reply-To: <CA+cAkeqTuHkq+f_dxpVKLf9mJiwExhkc+yyooObA-xxqBR407A@mail.gmail.com>
References: <cover.1680238655.git.frederic.martinsons@gmail.com>
	 <d0b6aff677d7e7a268b4c16a83ff3162e9c60dd1.1680238655.git.frederic.martinsons@gmail.com>
	 <73108638b9d165f203117b4f6a9e63ef94a0f2a5.camel@linuxfoundation.org>
	 <CANNYZj8syo4bNVz3OzwS-tbfPm-UPjFyZYy2cfSznqMLH5wGhg@mail.gmail.com>
	 <c007fc29d99e2116d2fd53a9338d329559723102.camel@linuxfoundation.org>
	 <CANNYZj8xFw5_c6vZ_aiDhSuf1+aZRayJfvXHpg9=mhtGp7taTQ@mail.gmail.com>
	 <CA+cAkeqXdBYLbtVzMvwTLWPqTBkWm7dmPit_M6LG5Tt4VRUwtw@mail.gmail.com>
	 <55024a9677091b2b1d3bc4faac1216e271940272.camel@linuxfoundation.org>
	 <CA+cAkeqTuHkq+f_dxpVKLf9mJiwExhkc+yyooObA-xxqBR407A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 13:56:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179467

On Sat, 2023-04-01 at 11:32 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> I just submit a V7 of this series with EXCLUDE_FROM_WORLD set for
> zvariant and
> open a dedicated bug for the reproducibility
> issue:=C2=A0https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15090

Great, thanks!

With that open I've merged things. I did leave a comment in the recipe
about removing the exclusion when we fix reproducibility.

Cheers,

Richard

