Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E804DC4167D
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 18:58:43 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.157998.1698692318691105348
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 11:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VCTMIXTc;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: festevam@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5b96c2cfe24so76495a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 11:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698692318; x=1699297118; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIsqiwOjDNwA1fkfQWT4SW0sHtSkVJyc9PyzmPzGXuM=;
        b=VCTMIXTcOKT2k6Ti94RAlmrOEJfUldep/K/mSClhU4a7RWWIuhO8lMQR8IuHodHr4M
         V5AVmXo3m2NwfsdUgnf3Bb9mVDGrAogxlJRCYuSdDBb0+c4Bl+SZktHtEv/GtbhQyDRW
         +Hj3lJEsNtzJ+Y4bojuV6PNDJjMslJpbrGpv9cED8Tijph7rkydWlyPBhZMRdoS0xKML
         POmRXULoW8IVjyGCuLqZ+4epK1MfSbu0FkrkKYZ7RtrUAvLDOJFbXzMQZN+Bl9/8wRJU
         WhKMF9+ONqmG1b9vQ9WSac1P/uuI+cWNJC0MlCUgXQ122xuLoriP/UNx+Kv8nyVqv9En
         z/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698692318; x=1699297118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sIsqiwOjDNwA1fkfQWT4SW0sHtSkVJyc9PyzmPzGXuM=;
        b=BMxS+QXGWtMR53YteAQQODQSi1+YpWs9N29qmKKrZL4uwmAM6l/oA8SJHjpUIONI3+
         FveVauzPBTg8KFW2AWdpG5OcRwD6wBEpNbshy6pRoT+V/YDIseRK9IXd+5RaRslEXw39
         Kj/iiRiUVt2dKNMerwOJKZIlKaxxTSKbqpYN2LiMfdA14chwETezJqOt+bhTGp1ANvcu
         OAcgfKNOvk1n2x7TJBw3vKt8JjA37TH7Ptrg8SqYyr5vxd/NLDZlmY1SmKP6+FHmxutY
         JUtckaE2u9g1yfAjcFtp/TzLCuaNQnYC6hn/U1ry3gxcD7WaiDj4jXh1JHqlSx8i4I0f
         Vz9g==
X-Gm-Message-State: AOJu0YyTqYlTpoKY5yLmS+kmafKeT0GBh6eZlg52z+W0eWQmbdNsmwdJ
	taN87NHNEYw8e/SUFYLyuSPVmwnMn8VDaYPo61c62grlOXE=
X-Google-Smtp-Source: AGHT+IFhvSnCukTxf7QvHGIXONfzzssmN316+oApJX9Sr5HZrUk05BtKRQIZCNjxdPA+0X3l9S3N0FZUrpQ6dH3CxUM=
X-Received: by 2002:a05:6a20:5483:b0:17a:d292:25d1 with SMTP id
 i3-20020a056a20548300b0017ad29225d1mr15486381pzk.6.1698692318104; Mon, 30 Oct
 2023 11:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231030185421.1950019-2-jose.quaresma@foundries.io>
In-Reply-To: <20231030185421.1950019-2-jose.quaresma@foundries.io>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 30 Oct 2023 15:58:26 -0300
Message-ID: <CAOMZO5B2SWWRWOA2YXXOZNZvZRRBW5gvZSrTtVi0nL0_VScBUw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] license.bbclass: prefere plus singnal over
 append on IMAGE_CLASSES
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 18:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189808

On Mon, Oct 30, 2023 at 3:54=E2=80=AFPM Jose Quaresma <quaresma.jose@gmail.=
com> wrote:
>
> The append override is much harder to remove so change that.
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>
>  v2: fix typo in 'change'

There is another typo in the Subject in the word "signal".

