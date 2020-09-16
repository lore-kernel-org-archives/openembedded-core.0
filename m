Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.2973.1600276136877336175
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 10:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M0OYxrEb;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: grembeter@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id w16so8938155qkj.7
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 10:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=09e9xY1AGTMyXpkQWZw8Vj1Lmv72i6rpU0s0jpDvoA8=;
        b=M0OYxrEbIFk5ZIYRjil4lmjjobxddAxzJh/2kosjdnb+nXgtBmTqAcsn/nJQYZnUfj
         cxEWmAxwPrDPOH9UQSiAoxY6QKzxyDHTB0LQwatqWif+Ss8SdjbNrobxEBdGHkE+2rDz
         tXaCp9LZGsSb3m+geiwTdQ7DKLTtduBVjERgvNwl3dxM5OvbgrzQB0lV/L9cGe8OndJ1
         Y3ub/WZ0/sEIHzlNvS5Zn60lwg7boV783E2wRW91EX2HLrSpsSwN4kQp9fcRPMflNdLF
         UrtEiyu8PFUnqtu7me36TKxRJerNwiT9WI0jmWd0s0Rb+MDeC/uR0Ka4cIrSxgRS93uc
         STqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=09e9xY1AGTMyXpkQWZw8Vj1Lmv72i6rpU0s0jpDvoA8=;
        b=VaKO4/MRzkJF2/hq5BmgvvaVp4GleBmGoBoAPRce05iidaRqxc7dUuUsSLSqntLe2W
         ppsHa9PS4ZNf5wbUUqt/a1AZlcgIIUoVjeqPkW44lRXvqhvURziqeaD9OZtnxEa77Ddc
         0jwGKvBefZfJJd56ToRdCb89JoTvC6Zme/simNTHx2JRtdi5yrDQuOu76nZ+8nnRuYBd
         RlY2q8NExCPxDnryKm2DHv993OFByCfI/Yuz69e/JfK3gd3s586uwPDpBBIwdwesUVBs
         Xeb8+M4+Bb/ifn9HWBxLDov5x2Q5KLT5/1dL80EcxDIlewGAHlyst5xBKB07b7URgS9U
         WLwA==
X-Gm-Message-State: AOAM531UyPU5MNZoWtPDc2frum4T7yOvVlh0AnBjNnXcXojfp/G/YLaA
	xAVlxfpnHH5GLiErmWNmrbSo26FGLrDQSPrVuTg=
X-Google-Smtp-Source: ABdhPJzRqTvJrQqPj8mjxZKOCSNq/WzjKTS+6iZDW9srqwjyHAn8ns+j7QhexMUchvolKdvoaXC27neG//skVksgXeA=
X-Received: by 2002:a37:4496:: with SMTP id r144mr23167710qka.230.1600276136122;
 Wed, 16 Sep 2020 10:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAGFuAuz+8M62V2qkc5HutJZDDLXxacF2ajr-4wuZaOKqZ1i-nw@mail.gmail.com>
 <CABcZAN=LCFfzCi=RVqggOno1sxcsC=F9SEj2hDL7MQHu=SM=yQ@mail.gmail.com>
In-Reply-To: <CABcZAN=LCFfzCi=RVqggOno1sxcsC=F9SEj2hDL7MQHu=SM=yQ@mail.gmail.com>
From: "gr embeter" <grembeter@gmail.com>
Date: Wed, 16 Sep 2020 19:08:45 +0200
Message-ID: <CAGFuAuyc3TdWx_a1EwgnvMxjXh7+Nj4w+bTrZ_yJa+KBxbEgCw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oe-setup-builddir: create conf/multiconfig/ from TEMPLATECONF
To: Christopher Larson <kergoth@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

> Why copy this from TEMPLATECONF when they can be supplied by any layer in your BBLAYERS?

At the stage of creating build directory I think it is logically to
use TEMPLATECONF both for "local.conf" and "multiconfig"
