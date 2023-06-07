Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F77C77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 09:15:26 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.4111.1686129316705782343
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 02:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=ay5m4VLJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f7e7fc9fe6so23508445e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 02:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686129315; x=1688721315;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QXrEB82iNWSm1uQruuHIU/zNW9uHtqIhaPGHOzs7/Kk=;
        b=ay5m4VLJLhyMh02lj7tvdKk/JGPaDMoh1//o99pvGRxNcUILTeQs+EbSDAMsLmPX6p
         gUaMxqPW3l+XI2WRaxLWKO9CzOUqnXU1KFCfvP6vVPepgfR3wPk7aKE1mtKFaaqGHnv+
         h9wNSzd8FVwbgOGLMzSNa+0VPLj4H7PrWa03I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686129315; x=1688721315;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QXrEB82iNWSm1uQruuHIU/zNW9uHtqIhaPGHOzs7/Kk=;
        b=Df1EDgr81IBwCv70utwcl/w+z24tY37xZY5Rtf6ibRB4MiU5gH82If1v2t3Tz5lwFz
         FX5uMZcBvIbn3AapIZhdkNW2Ra0kIGS4hqd9mYx/XUFDpj3AEsG01uWz0FIB7Zyif7lC
         SAINn/Kzgw0acx7xOGOCMongdQ+8Jwlkk36mpRUw2twaMXv2dK/B5gqE3fk6qKT3w5Kd
         M0pFlhYToBLY11bhV72jkH6u4xZQ9zWF/bBY6lJfEyuGIn2RRgFbOY7JPK3IqVXc6F/v
         G3P42Bj796GAEsjNrHJF1VHtY9TWMVld5PkcEal2fEEFcrNdvCXKtV9MV8ENqFV1K8mc
         jH7g==
X-Gm-Message-State: AC+VfDx3UEW0m3eS1Kr3Un+REfjkVjuYfn1swc3tWYHJCj7d84xHIukl
	bYZEa2x2v/BujP58hbU6tv1t5w==
X-Google-Smtp-Source: ACHHUZ7ntfQ4dyiIqGAJZphzgd153i6FhtaopE9slySnWEcM+4TzQ1YAZIgGcPY+p34yHgiZrwUtIQ==
X-Received: by 2002:a05:600c:22d7:b0:3f1:93c2:4df7 with SMTP id 23-20020a05600c22d700b003f193c24df7mr4110775wmg.5.1686129315072;
        Wed, 07 Jun 2023 02:15:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:247f:a475:41f0:cfdc? ([2001:8b0:aba:5f3c:247f:a475:41f0:cfdc])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c204800b003f723215b6fsm1468945wmg.12.2023.06.07.02.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 02:15:14 -0700 (PDT)
Message-ID: <d5eae2566c4901a13621976817c2bd69a7681081.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] fixup! fix: reproducible builds for initramfs
 and UKI img
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Frieder Paape
	 <frieder@konvera.io>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 07 Jun 2023 10:15:13 +0100
In-Reply-To: <CANNYZj90-O4sMHQkMCCj8rOhf90i8h+faNQ9LWqzWUS7puBDHw@mail.gmail.com>
References: 
	<76fc64335d45702735bf1c168cf67f6af5e2d47c.camel@linuxfoundation.org>
	 <27537.1686038488234786413@lists.openembedded.org>
	 <CANNYZj90-O4sMHQkMCCj8rOhf90i8h+faNQ9LWqzWUS7puBDHw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 09:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182465

On Wed, 2023-06-07 at 11:00 +0200, Alexander Kanavin wrote:
> It's better to resend the whole patchset as v2.

I did squash this one into the original patch.=C2=A0

For future reference, I did also tweak the shortlog to mention
"image_types:" as the prefix so the area of code changing was clearer
and matches the format we usually use.

It is nice to see work on reproducibility!

Cheers,

Richard


