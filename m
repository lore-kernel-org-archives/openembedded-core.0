Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1A1C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 11:58:40 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.32420.1744286313381717124
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 04:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HfynCM//;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so12741035e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 04:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744286312; x=1744891112; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5Y68A/dvUfH4Mze4OsDlIO7MsPMmYeK26iJG0rc84s=;
        b=HfynCM//6SqNBl1GfeoaQNJV0ytaH5Xvw75BrpMdc3nFxNULj7BtA0hN8dnEMmua/L
         VhiF38d8r0epwYpDGnf7UQu+AukT20J1Mz9JP7ylLIcYWBoicZ3za3rbQL+A97oHTheP
         OsYUqqAhVGxpZBeUf8FLvEapZHyQRrB/fgYYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744286312; x=1744891112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J5Y68A/dvUfH4Mze4OsDlIO7MsPMmYeK26iJG0rc84s=;
        b=oxSvFAFJ6ozZXulJ/jzgApjAPU41rgphb1CXPijMHMFedJn/NNgRINahMqnJ1AqNlS
         mqnsB204WYkSHpmF8CFRhNAgx67KIQd+swrwM4qJNo2qZHGEZ96lumb43pOK5jlquLdP
         Ut+PEMBh2zJxhBSXK+fa7F0BlZLOPjqmCSoI4CCkZB6hsM+AvSvJy0D/df2xQDIBZycf
         xug8yAq/OaXj5a7uBsxiIzeNHf2XC8Y8+TcXoDbQ02ux3tnf5TnEd+ZqKgOP1+yNyTZY
         PCPma5Ei9Ey3cYd7QuEq23Bx9LgHUGh5coOyxCTRX8C/Y763P0bs0a8xNYjVzNzT/XE5
         FcNg==
X-Forwarded-Encrypted: i=1; AJvYcCUjB5McKT/EgrGbElDVJH4OiUCWmUw8GOgS+EB0P2rjbsy2lFo/Vk0o9wkCe7zQyl29HvpLhlMcfET0cIyxWhlRlA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzxZDshaiG94jWG6Be4wG7xEAd9Hvtp8Gb+iR9/9VBl39sPGjOG
	QIBkRp1lZxBERZoEVbtnaUsFokKvuEcF99K4NmPdf/yv/irGUr6Cw01RANs6K/M=
X-Gm-Gg: ASbGnctiegf9OKlt+w4OFTkd7Onlr8U58HDMzn7e4EJc1pS8ib2LoEEbCiUQ+pmURR4
	B+1T6brNSwX4ZjZyeK5TGjgW7mhn+zVwV9c+Y4r0XcEZNJNn+qw20UoKbKcSijJU2J19lUsfeoQ
	mn3OsbwB4hK0kmyLixNAKFC7h2jZ5eC4M+v+tLSOy5SE1/r9GA4+76EwLpE9onYbOPVeX2y6kLc
	XGOYwxGhf9rS0o8jk6xUiFOH3Ekc2w9wlrfatGwipdAqaky648/Zk55NqTU2b/uDC6ZKWZipBla
	1w/L16tEZnLwd2pILF0cNFihnz0FeU3IMXaAYJ9CT8m6WwNNPfPnJx4yBO1kdkZ0e5W/N03N64F
	ItqzFsc23LJkUVDiei+AtDaFu7iYuqw==
X-Google-Smtp-Source: AGHT+IFMfP6J/aZ9Lq9iVh/QPLZ5U+NsZtnDWiGShxFo5vaEayQ/Wasx8uHbV9MOgOJDa8Y2h6iC1Q==
X-Received: by 2002:a7b:ce90:0:b0:43b:c592:7e16 with SMTP id 5b1f17b1804b1-43f337c2b5bmr12206675e9.3.1744286311821;
        Thu, 10 Apr 2025 04:58:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ddb2:da8c:e063:58d6? ([2001:8b0:aba:5f3c:ddb2:da8c:e063:58d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d7cdsm51711825e9.8.2025.04.10.04.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 04:58:31 -0700 (PDT)
Message-ID: <ff2d65f3242dec409f8ed3bce874622d396ed88c.camel@linuxfoundation.org>
Subject: Re: [OE-core] python3: Allow to specify which pyc files to keep
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: lw@hqv.ch, openembedded-core@lists.openembedded.org
Date: Thu, 10 Apr 2025 12:58:30 +0100
In-Reply-To: <13400.1744285010599994886@lists.openembedded.org>
References: 
	<CANNYZj9qgX5=4Jym0Uq2u5VJcZ89c-MRSU9oiTkUbBvNvfSFtQ@mail.gmail.com>
	 <13400.1744285010599994886@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 11:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214655

On Thu, 2025-04-10 at 04:36 -0700, Lukas Woodtli via lists.openembedded.org=
 wrote:
> =C2=A0
> > Should we rather just package the higher level .pyc into their own pack=
ages?
> =C2=A0
> =C2=A0
> But this would include 3 additional packages. One for each optimization l=
evel.
> Embedded devices might have limited storage resources.
> Therefore, it makes sense to just include the .pyc files with the necessa=
ry optimization level to the image.
> And not all of them.

The nice thing with packages is that you can then choose to install
them or not. We'd want to default to not for these.

The key question is whether this level of configuration is generally
useful enough to be worth us maintaining it in OE-Core. I don't know if
this is something you needed for a one off investigation or that people
need it in general.

Cheers,

Richard

