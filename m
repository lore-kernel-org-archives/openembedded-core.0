Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89329C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 12:11:30 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.32635.1744287084815726794
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 05:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e3EaW3kn;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so17847216d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 05:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744287084; x=1744891884; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZMx5EN4c42T99S9+lSvgijgbxrzCYqqy9jnOJHPTE8=;
        b=e3EaW3knCerLtN+QPa5rPOpeG4ID3QUAHJznIOFpe4EqH9bDUcYrE/pYpAEsFHtWUE
         fmSV6pluR7W5e1/cFiJ8IglCyyFAQLo4EaRbwi/NqgdP4FaKz3sABXquaXTQVh+r9XO4
         RLHMyF4B28ThDrsAlR8ZnUF0pGFKRM4gObjCANmmUNIe9fQHeV7X10+YmgE+sK/Nk6Me
         3Ud9vIZuQvW8SDRx3x2CmHkJGubtefnewyrvwLAVUg3QN53AiPZEnDXVRo4/I13n4LSP
         /qtu3tnPX8PA6ESgJWOkdoTXYS0Xt7gn6SlxUlCtqgJQSpcLXpUPwpQYSykvRRUbbAtN
         yf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744287084; x=1744891884;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZMx5EN4c42T99S9+lSvgijgbxrzCYqqy9jnOJHPTE8=;
        b=QhpmDFSYcrNvJ7BbcxXaoG0HbsMcm3sJOLLpuv3hshkBVmKT1ST1Exw3KG3Jnjt/XK
         HSwQNqd3aiS1rLu79js2XSPYwz/dlRURs+sgKe3Sd9ZEvumI/IPYcjgy7/as8idc9yCz
         mFQ4hsCzyOcRtKeNQqz6zDQ7WbzjLZgmH4pc5Dd92xvQtEDOZf0igSIJpL8uI89scxhr
         ju4AjtqzjYo0WsShCnHjXFpAWf5v8UoM4VQkWVZ0BLHDM6FGte6qGhi1GVsbvp9sSH6Y
         5tv3YmyV+CmBM4I3IS6YMaspTEekZ8IDGG8uGGvnJ/MzooGDsHyjgF+aSxsxwnffVKPv
         gJwA==
X-Forwarded-Encrypted: i=1; AJvYcCVEi67KXtz7YSynlCwDJjvRqVs/31MlKXKjJXfscRUI3RqqWQKgcvjWg4J4dONT9q0F8nAzwUoK73JMWNirs2ykVQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz+CcJChxrhYnWzeg8QR8ilwozQHFCEok4ifpDWx1DHSWrniPRM
	jCC7vnD8AWAozX4C0sz92v+AxlazbIZrGXmcu5xhdyVV5Z13VO+hQXJcwOMLnxUm6NvGL2v5FrB
	RznPGQCwil/jrjpGFaTuIz33yzAY=
X-Gm-Gg: ASbGnct8BDX5hHvLrpyjTXOqSRF+/3XtgzQkcXL2XH2RAxBrVfZbTMJhCowXur7zUyj
	y9yCAYNU639iYWb21Jte7TT9Mv9vhOqLmzXZz/eldtMt7TF9/sfO2GjBks/zLhypZOQIoAnowFg
	iog0k4Z1tyS9NGY8RVvNYX
X-Google-Smtp-Source: AGHT+IFsRrR+yeT7pDTrKXsc19BpYRzJnWypO9y7p2n7yXJ1ZiGp7m/9Zt1nRKR9iM1Md/f37TORoGEDQpqiyLg005Y=
X-Received: by 2002:ad4:5dc1:0:b0:6e6:5f22:bb58 with SMTP id
 6a1803df08f44-6f0e6477e70mr33458396d6.20.1744287083820; Thu, 10 Apr 2025
 05:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj9qgX5=4Jym0Uq2u5VJcZ89c-MRSU9oiTkUbBvNvfSFtQ@mail.gmail.com>
 <13400.1744285010599994886@lists.openembedded.org> <ff2d65f3242dec409f8ed3bce874622d396ed88c.camel@linuxfoundation.org>
In-Reply-To: <ff2d65f3242dec409f8ed3bce874622d396ed88c.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Apr 2025 14:11:12 +0200
X-Gm-Features: ATxdqUGByZfjKP8QThyxxxsuSODaAf7azFYgWbtBtAGJ1d_vkg_DLTMGavNhCF8
Message-ID: <CANNYZj9r9D7PzkGm-5tPQVTyU_MkyQngS+RbZii6+4YToGNLVg@mail.gmail.com>
Subject: Re: [OE-core] python3: Allow to specify which pyc files to keep
To: richard.purdie@linuxfoundation.org
Cc: lw@hqv.ch, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 12:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214656

On Thu, 10 Apr 2025 at 13:58, Richard Purdie via
lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:

> The key question is whether this level of configuration is generally
> useful enough to be worth us maintaining it in OE-Core. I don't know if
> this is something you needed for a one off investigation or that people
> need it in general.

I think it would be good to step back and look at what these
optimization levels actually do. Upstream clearly treats them as
optional opt-in via python interpreter command line switch or
environment variable, which means they don't think picking a higher
default level is something python users should be doing. So why would
we be going against this approach?

Alex

