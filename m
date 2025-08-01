Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7122DC87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 12:32:48 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.86286.1754051566661498443
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 05:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZB0Hx+eA;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-70767eef931so14899896d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 05:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754051566; x=1754656366; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/3SlQHtffbQ0ZQD9kXfFDxW2kPt5N83uAKu6EdTz7LU=;
        b=ZB0Hx+eAUp7he6TqoTZE7HuGWWbYsESJQjnJ9rqYbjLC+8/F8GQO7E2vWF0UGMC9mY
         PPXz2lcmj4nKS0Vji5El9nh2WAJhINCJ7hAV5NnwtilnywZOs/chaqIh0cf6vk8dJCpP
         +IM26lVF54dNXO/0zA65f6y346bCtfzp4y/dhWrMpcrGp3ObpFrWo9WeTx8yNgilU5nm
         /Z9ZP/lTHTq39aWm4CUfBawvqsSJoHCubIjho7yR3/KpwJTVdws1AzWijoZ1qTU+uAAd
         Eba55J9A5SJmL6hgXOL5jhY0HWR5xwSw2+UNsK+6QYEY6VEKGn0MyzvjoI16YxicqEIZ
         N6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754051566; x=1754656366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/3SlQHtffbQ0ZQD9kXfFDxW2kPt5N83uAKu6EdTz7LU=;
        b=IV0Ab9AmqgQ4uie+rBh5vRLSPYhqwxuo7iJo5tzhylajhFQWQanMRjHyceeN2I6S+p
         OCaPy/vftPs84Tds8ZOYlYdxCUO8+hR/TqN2ERg730ni/zV69EeA7nfukRCUl4ujPEmQ
         4zM8SoHQuxgbMfhwIxVhX9ZghQWcG6xLJ57Okwnk6Z+JM+/P1MwMzcGmvhe9ZD0E8XXv
         QHufCLBjKwxDC8asUR2CHHCFhSUk14XwTzU23+RzIwx19gVYxhJIPxxdU10UH5a+v04o
         CiPeesbJn64cGWMQYTcCK4qB1UClNFMi93msQ7UadAQgsKEWWs8veEh2K3iysDdO/i8E
         8fJQ==
X-Gm-Message-State: AOJu0YyHQ59+oIFqmBofpQ5UOO4Za+YrQ89Ji6TEAepLi/9WNmVptufY
	r8Tv1BS4Yn87hfr+04eouybhMipFYNSAgWPNvLsQGJf7CGLyHCzA9Ht2o1NzWj9+X6zb05xUhBI
	pNN7dd2IId5hbi1FMbkwygjMbuJrV/RcyiQ==
X-Gm-Gg: ASbGnctEV0fX+K3Wt6iIzNOUX09mTN4x5Eb/3COSIa8gpnOx+uzCGvOykL/TRwk9cEa
	MM/pr+qTQbHL8IvxPerJUb1j6qANGwN8wmysOWi1AJYGrp29rOasuuJawrL8sG2py0bneRDIeB5
	/cCaDndmHg+0gl90Uxw0WjP9I9URwvH5SAnxR/fQyrCnx2E9yQzCbe62JH3sEYf6MVTW+7jfkfD
	OIS+tHa5bl4/VJJ13xlKAmE6nX7hLL6Mu4N0wH9QIc93agbFaP5
X-Google-Smtp-Source: AGHT+IFpLFEsaetXcryGq7dWG9Cvq22Js7m7zL/27B6hjSDed0XSJ9WJ2/D21igonBYB+GD7y1MrzVbayKDcbY+neRo=
X-Received: by 2002:a05:6214:1c0d:b0:6fb:5fbd:ba70 with SMTP id
 6a1803df08f44-709266ddd9fmr32394896d6.43.1754051565385; Fri, 01 Aug 2025
 05:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250801064828.2904332-1-libo.chen.cn@windriver.com>
In-Reply-To: <20250801064828.2904332-1-libo.chen.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 Aug 2025 14:32:33 +0200
X-Gm-Features: Ac12FXxXUzSb5ELhfoeIN6DMDmXo94p8PbZ3FxW5Q47obn9GlBIouE8GzOX7dmM
Message-ID: <CANNYZj_jPS8+nSmOr+chi3HAbcN9q5pj=9sU53P9gjP7OCoYxw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: fix special characters bug
To: libo.chen.cn@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 12:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221241

On Fri, 1 Aug 2025 at 08:48, Chen, Libo (CN) via
lists.openembedded.org
<libo.chen.cn=windriver.com@lists.openembedded.org> wrote:

> Fix the following bug for runqemu with a file path which contains
> vmlinux characters.

What are vmlinux characters? Can you show an example, so it's easier
to understand exactly what issue the patch is fixing.

Alex

