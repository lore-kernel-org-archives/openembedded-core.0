Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web09.8719.1604910646862953185
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 00:30:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kNJ5IhQ7;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id t18so4377758plo.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2020 00:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yr9uKIpaQetTDlkuGqGdNyXO8ZhtSq0ej5UzZFRFRBc=;
        b=kNJ5IhQ72LOFG6ffuqqdLIR+5dIPDADP62at66VCnUrckDhQ4sZcVsfDI7F5/L1sAE
         FxvigAczy9MYOgSxbukpyokBb1im927Wm70h3bIsZV7QCa7M4kdp4FudRTsFhaCTW5f5
         f1yT2aAkEwWmRa6FfCA9Kd4Jx5g7vulvJ6SmU70pj1TWEc+fWfY1plIaMn+oFwZWQ22+
         2OMBeF11LIAX/wqLutT6sAwWS/ftSRCeNWnISDTLEJhDGh3W+JuUuDg3R7DmB+fL8RNb
         qdQ2R2dvRpF7HLjA7+y10Evhq7Mj5BG7u8e+9L59cYWb4/Cd4jEPZCV552fI3WG0ZdkS
         7LQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yr9uKIpaQetTDlkuGqGdNyXO8ZhtSq0ej5UzZFRFRBc=;
        b=VvyuufrM81sX4quGEc/2HfF1FUFoE9chmYyTL0TREATHAgd90G+thJMkXdpgbFpccz
         54VpwyLgaO/aVjrdJHWCl1nJJsN77B/2eKtp9dxCTIFNcvR1JwaRu/xyp72e1XpMmXPA
         ch0aFKLlzIZ5aVWmvwHp8HuSrJpf3sxNilvxezPJgS/so4pLtfXRIROq8izUPn1vGYmZ
         8i8a5vTCX89csrJrBaGN3kpryw8QQdBUCBLgII1QjfR7gvHrJgfSQD4BP7IWC/0bnlsb
         XIpN5jNyekjLFKhP0iZdLOp2GhtCXVQ0553zVX0KkFWFSSMtdAOhHZT9YfHeGkjka3W8
         5Hww==
X-Gm-Message-State: AOAM531KKtbt6m8XB6IQAddJu90WomH+D0kBwM9dU+sdhtqR1dU6CZP/
	3r3X/PRaC5RdLywKi/KTj1s+QHsK7f6alW1OSko=
X-Google-Smtp-Source: ABdhPJypdMK5P1WGDjvgL8h7rXmBHXEvQTXXzrCN07zNMk4KkWU0Jo7uAXQ6UL5zgOABJLJJx0074rwPvjvtRGoImAk=
X-Received: by 2002:a17:902:e983:b029:d5:f465:55d5 with SMTP id
 f3-20020a170902e983b02900d5f46555d5mr11752807plb.60.1604910646368; Mon, 09
 Nov 2020 00:30:46 -0800 (PST)
MIME-Version: 1.0
References: <20201109000217.3008448-1-raj.khem@gmail.com>
In-Reply-To: <20201109000217.3008448-1-raj.khem@gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Mon, 9 Nov 2020 09:30:35 +0100
Message-ID: <CALbNGRRuWJb5OXhh6vbM+BoBw1zk2THMJYju8_GWCbGpu+UWxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 01/11] lto: Add global LTO distro policy file
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 9, 2020 at 1:02 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Distros which want to enable LTO can utilize this file, it only covers
> packages from OE-Core, other layers should include there own exclusion
> list for recipe which dont work with LTO
>
> Document the needed changes in local.conf.extended
>
Maybe I missed something but I haven't seen a word why I should want
link time optimization. And from the patches I see here it seems we
are about to create another contributor's burden.

Andreas
