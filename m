Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A75CF539B
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 14:52:32 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.11183.1729695144224614676
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 07:52:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HKTDvEg7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so75840415e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 07:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729695142; x=1730299942; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7FhpHH+KOx57y7O3GmQaIF1coYJGrN+FtEMcBSJzP2w=;
        b=HKTDvEg7em8NTu7S4VUd9Op13CmcMNRiS9Qpi6OLqWcg8uSxpmB3NI6qleRd8qObEm
         zJZSZ22GLqbu9cLGTInC/QMp52n0++8InxJAFw1wNr0wybT6x59kMcVvFAzFZLrxQg5R
         ID6OEjCMkpCebGdXU2FF6FGjk+c/gBZneDW9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729695142; x=1730299942;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7FhpHH+KOx57y7O3GmQaIF1coYJGrN+FtEMcBSJzP2w=;
        b=Eyfm460WmXg7NQ+AfGSO7+T9lb08rG+qj0oRVFEjawoyMUFpGyy6ZOOcyTj6XnMBEN
         7Z0bwhrH0JykiVRuf78wp5hxthjoPwKP7xXHvjjlo01h6S4TI9VMMm+KhkNHxwVXrVv1
         +Z2meFvXRxYGRVVUJuzxwtIThwSctpLL6G/MzInKwVqcAyfsFNhdxoB0DX2m3yyikSw8
         pTo7SUByQCH926FkXT/k28i0+ZYdfYHVRUc2oWFZfS/dHXcBhtuAS9xcmifUXW2pxdmr
         0tojiJUlHwAaozdSFshmbiKde0wjQLYk/AM3qI64u8SsF0qjEptxy7nttvS9atFzEIHP
         QsJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWshD1F1QpXWvw0QH6lEBqhfHE3oooOS3RMB7oaByU5nlvnXRjLSGHj7sgPq4M7bQuKzMkyvrG6FpEBrs3oqfWyvg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyD9Q/oY1L/lwqvRQfT90y7WC5PAVeAn6z4yhCO/2r99ZfmF7AZ
	3pDCW7zX6CcC1cJfxUW17vUz4L0FW4s3bI1U2jEm4VmLoQoH4BOEz/E+5jJLmy8=
X-Google-Smtp-Source: AGHT+IEVjwLpjASXh0n+E1AlfXOZTg2B36WgvIAHq0dyoN+e/D88JHlBwFzDto/SZKLMiE1wLGSA9A==
X-Received: by 2002:a05:600c:358b:b0:431:46fe:4cad with SMTP id 5b1f17b1804b1-4318413e307mr24990125e9.9.1729695142558;
        Wed, 23 Oct 2024 07:52:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ad34:30ba:19ab:e41f? ([2001:8b0:aba:5f3c:ad34:30ba:19ab:e41f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a58cd2sm9072728f8f.55.2024.10.23.07.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 07:52:22 -0700 (PDT)
Message-ID: <b75ccaa35901e5b4cc42d486eb56723f682f8f61.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v3] busybox: 1.36.1 -> 1.37.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.v@skyrain.eu>
Cc: Ross.Burton@arm.com, openembedded-core@lists.openembedded.org
Date: Wed, 23 Oct 2024 15:52:21 +0100
In-Reply-To: <f7b1d43d-9d5b-44d5-b7ba-02d6efeb6780@skyrain.eu>
References: <20241011094830.1009557-1-andrej.v@skyrain.eu>
	 <20241019160221.47501-1-andrej.v@skyrain.eu>
	 <f7b1d43d-9d5b-44d5-b7ba-02d6efeb6780@skyrain.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 14:52:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206245

On Wed, 2024-10-23 at 11:14 +0200, Andrej Valek wrote:
> Sorry for pinging you Richard,
>=20
> Could you please check it again? I wanted to be sure that there are
> no leftovers.

Sorry about the delay, I've been slammed with a ton of different issues
and retesting this hasn't been straightward to mix into everything
else.

I've put this into a build and it is running at the moment.
Unfortunately I'm already seeing signs that all is still not quite
right:

https://valkyrie.yoctoproject.org/#/builders/95/builds/280/steps/13/logs/st=
dio
https://valkyrie.yoctoproject.org/#/builders/13/builds/268/steps/13/logs/st=
dio
https://valkyrie.yoctoproject.org/#/builders/10/builds/301/steps/11/logs/st=
dio

and probably more to follow :(

Cheers,

Richard





