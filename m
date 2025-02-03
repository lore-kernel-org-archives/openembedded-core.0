Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF11C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 11:07:38 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.85469.1738580852308998711
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 03:07:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ay7BQw5d;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6dcdf23b4edso36289086d6.0
        for <Openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 03:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738580851; x=1739185651; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iW32Uikv6TrRE5OQi+wNg491uWnEWWK+kTq6QKyWHGw=;
        b=ay7BQw5dG2Nn0/oB3n2CFDJOz0Iyy4mbmLyw6A8Gbgi9q05yAwpdCMn6efx+b88XWP
         FiC59qe+tOBKwT70AtixB3MmejKPmf0K7CPGFSM2YY5nl+H04qV8k1ErxSA0fw5U+3hd
         /Zs1NcicfRWukgfAUK4rQMu3Jx+EhbPkQbXX5R7fJjeZYHkZCW3fke13zQ6BSr3al38U
         KX+GW5dxW4r9XZE3oQBveRML63c5sgqSCzytB7ukfA5jK2ArZs/ITt7tmo95a9DTHNOt
         FiSwrEIAZsg1ZIvsnRIBQhxmYv9YWPWIdJf6DZLs7wmLdrwbH6jNxrQBOLZ/A3HnIPXI
         B28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738580851; x=1739185651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iW32Uikv6TrRE5OQi+wNg491uWnEWWK+kTq6QKyWHGw=;
        b=qstYQWL0QLggk6vFt15WlV9A1h8xtL5m3KoewTs16kIlydrMMikr856hm/yxQAu86L
         vwWSfumnLSAiNMUrd1kydljCxVwUkas3FA66po8j8WtAPfCrJPVdPPTDVyedjfgDqbCt
         rF3bng5zX2n6QK0o7vUFZ3I299eBsHDjwouBI8IyZpHIa2hgCC+ZlUJFuO1RnwL+d1gl
         ZanW6XsuHK/dbH4weUhWFzDBYIrD1+2lQDWlgtLE/xZduR8IQcdyihY3gJD0/IWzqdMa
         Pcs+lieAUTuPtXLmKaFscI6wl8URk+HPoSJcOcYnAQUjKBEj7GyYgiJsQScKYNlxgr4c
         BkIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKT/qxZRPaEB7ttnD4OdutA9kQpd6of0/hijRkZHIiAN4wKssSfZ34CAubiyfeQGu14bMQbmDVDYHC+d/yQcTjMg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx5atN0J8kiqrlBF5++MSZmqsGM0BSqAOYEFzJNU7x/kWW1+l6Y
	6rQixgqW09Dbpa31BHybZq5QaiIaexx7qfKZXrtzSZuPVBTk+vy7f8g/y38qEOLnOAERkyndEUU
	he4RwUjdTNjk07tkfjJ64zaksLsw=
X-Gm-Gg: ASbGncsZXZhSJll+FZmBdF7ez+USZ978G06iTMSTflKRPBgOGeH6K3rUKYqO+y2C5j1
	xFNpFvJEmwUN3GYjcMdKI0dRsQOKj12b+vs3xgijrj5fnkCYjwRkqEOfsvMq9m1reiGvQodn3dp
	XICJUr4ICqYi4hMx9KNLdUDIyR7VFiGL0=
X-Google-Smtp-Source: AGHT+IEMAJJnbI6QapO4x3NckA2w5PsI0tK3Kzy9T0MrpXpIiR+fRr12AoZs+aaW0SJzRONSc1mjsjQfS8Ra7YkarxU=
X-Received: by 2002:a05:6214:29ea:b0:6d8:80e8:d567 with SMTP id
 6a1803df08f44-6e243c2b69bmr318824476d6.18.1738580851285; Mon, 03 Feb 2025
 03:07:31 -0800 (PST)
MIME-Version: 1.0
References: <20250202200319.82231-1-uvv.mail@gmail.com> <20250202200319.82231-3-uvv.mail@gmail.com>
 <Z6B2HKSlI6k9wNXO@nuoska>
In-Reply-To: <Z6B2HKSlI6k9wNXO@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Feb 2025 12:07:20 +0100
X-Gm-Features: AWEUYZkAB-zyirl0R2AIjukrzAKSRbISenQzg6YdvoY0kv6XquuijoYr-abzqgY
Message-ID: <CANNYZj9xjYqke8RvU3atSfwk2V=OC4Np8ZdXSO5hapCOnO75Dg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] systemd: Build the systemctl executable
To: mikko.rapeli@linaro.org
Cc: uvv.mail@gmail.com, Openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 11:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210638

On Mon, 3 Feb 2025 at 08:54, Mikko Rapeli via lists.openembedded.org
<mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> Could you elaborate why? Some usecase or feature not supported by the python
> wrapper? Which one?

You got this backwards Mikko. It's you who should elaborate why we
should continue using a custom replacement.

As long as this change passes the autobuilder, it works as intended,
and needs no further justification.

Alex

