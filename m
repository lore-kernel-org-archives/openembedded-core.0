Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA6BC4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 16:30:23 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.153911.1698683417954776505
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 09:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Olujf6h1;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: festevam@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-27d21168d26so697187a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 09:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698683417; x=1699288217; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCjf7MXDAw8Axuc0bw2iK+HEtJuwSSlZw3ORse14Xn0=;
        b=Olujf6h1AOmuMd/cJJ3bCxcv52hL14xG5ehmJf82LSxLtbfYIia5/6XfXHgqAiH4e9
         7YNukbETtRd0+S3+t3jQkp7WfXgUJZDy3M1RwBshc0adk+eThVvuRbEZsWqfezTMXrpB
         AleViu2E6x9ffjcge0ZDdaspUayb2wh4ed4aOCiLKUptoYATgDp77paR35i1A9Gh0C+F
         nrnaVR/X7iTDWIpqlHH1POdbLvm9gZ07weHddDU6j0Hzkd442pSulaeulGP6LTFxhwbg
         MMZJrylkfMf71WM10pgMt7uxu4vmkXigwXGHdSLkmQk1aUHx3UX2XQSu7gZ3q3X7BUxG
         hsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698683417; x=1699288217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCjf7MXDAw8Axuc0bw2iK+HEtJuwSSlZw3ORse14Xn0=;
        b=Slv5TPKg3u2ZdkcFGR7uPcxE0EkS8mCL7RXDOyOdCH+hvInselbTQKXcS5UMI676cS
         CYCx6ArFjxP2+jPZ9W8PniZy6P8M+Dk7T1LYSklc8AvYYPgNgOqoNojr9e9/1nl4DYqq
         IXcT6f71XYoeIW9ojAVectBsjGoxYRJ9TDc6Fj6rC1hvrc+76yTRSo9Yr2jMrgHY3aJv
         lpr0bA9gMZJWt5JsD6bRx3dsnht/arfBW7L8hryzBaQtuxFadjIOdjgCSRPbWEkeb23W
         3yTRLxRmvVZlaj68h1g5MA5mnoxWc/9ONZs/ZjeqdvIFO3u4Gxp7KI0NhgZnwwk6Gdef
         XmpQ==
X-Gm-Message-State: AOJu0YxZWGWfcBSVpifcobPERhIS6lOIzvNDBwCx6HgnSbL8INUGAsoT
	w0aSJD7uHUM0iPand3bCnN/zlE+pq/rnTHkkoMY=
X-Google-Smtp-Source: AGHT+IHkLPlyNeR+GPD0EjozLbiANKM1jJ5j3bye1MFbGZRJ3BGwqDAVRGEAYPCpULZf3iwMqBOoK8KtPSzOzrpFdYY=
X-Received: by 2002:a17:90b:4f82:b0:280:6877:41b3 with SMTP id
 qe2-20020a17090b4f8200b00280687741b3mr2741967pjb.2.1698683417266; Mon, 30 Oct
 2023 09:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231010123653.166806-1-ross.burton@arm.com> <20231010123653.166806-3-ross.burton@arm.com>
In-Reply-To: <20231010123653.166806-3-ross.burton@arm.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 30 Oct 2023 13:30:05 -0300
Message-ID: <CAOMZO5Dos_2PtiK7FAJxhYKfnJ8sA97-6F0rxHxnsLZkOuCoyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/5] meta-yocto-bsp/conf/machine: remove SERIAL_CONSOLES_CHECK
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 16:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189803

Hi Ross,

On Tue, Oct 10, 2023 at 9:37=E2=80=AFAM Ross Burton <ross.burton@arm.com> w=
rote:
>
> From: Ross Burton <ross.burton@arm.com>
>
> There's no need for this variable anymore, as all consoles listed in
> SERIAL_CONSOLES are checked for their existence before a getty is
> started.
> ---

Your Signed-off-by tag is missing.

