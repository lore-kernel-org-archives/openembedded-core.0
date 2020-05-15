Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web11.1223.1589578175584362858
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 14:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sk7qLozl;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: schnitzeltony@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id y10so4311368iov.4
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 14:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UZK92F+aZWuQRiwId4ztgDTODvvv2EimjptPuMKf6MM=;
        b=sk7qLozlfId820S88zPLncwXBvo2cbBfqwFnwbiLLfiLHHQrBzo8Ppq1DRRbbE3IFy
         1EqtZ4/eSi9x9xRboIinwTNaday1irRDTJLTB+pv7T6pycuNT/f7Ti6QI5mGOSJs1haz
         1e1PV5HNCwDDHsUbS7H3PywehxeN1AOht5nuZelBdz7Xq6sh4XbGs8wWa5+y5KawRL3Z
         /O2csJkzDdRKfXdl3oW+7nM6pUiTcNs86eB2oeq7r1Y3OZsmJWtQk4pCNPySlTeA2Jgn
         vACB0O4SKYqydx3a/B6myBa5xD6gMBE+/xNk0Ay/LmnmI1zpYp05OZ2Mhgp1a29WzEHN
         YtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UZK92F+aZWuQRiwId4ztgDTODvvv2EimjptPuMKf6MM=;
        b=ntS04KMy4TLtmJHh2DYDofwhiZr7AQnp6g3SWlItR/V+xhMryLCCGex2wHFdpZWQB/
         U5G4lz4Dojh3OwHO8ah14mxHl0xv7sUIkQqjroOPA0DO62IODqLbFZZRwLMBzsrAZijx
         iTS0S1jNe8P9DkLKJwg67+5oM6dUhzEbPlb6CqEj0JHhWdGtTXDvwxVSCUsT5T3ir/8e
         1AaVzqCQZSvUreqS9ts6hfD6FaKRdFIfdL6vqMMwfQSYv/cnWiB84c6BVXOixfm+Sofi
         lyRiNM9I+N8Ovg8oJGMV4Ea5W/50oDQHXBHfzWbUQ4475qyxL21L8Q52Fmtb8vOPWEAD
         T4OQ==
X-Gm-Message-State: AOAM531DczmeWfMhgW0db7NDG10r/MUuJm5Q0qNdxe2JbkEamlXR3wjU
	r/2qwVbbcPNVzx65My8oHrIVHRPrSxaO0Qoy0rQ=
X-Google-Smtp-Source: ABdhPJxAa+vx6Up0K72JtEZSv+/9kG0o8dzw+QEgxg57oHVvgR8yBMXeHEl1G9etxRCtwIkF/kSsqcGLa2f0+1EgdSs=
X-Received: by 2002:a6b:5113:: with SMTP id f19mr4722097iob.120.1589578175071;
 Fri, 15 May 2020 14:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200430214203.26595-1-schnitzeltony@gmail.com>
 <20200430214203.26595-2-schnitzeltony@gmail.com> <CA+chaQc1rS1EJw9B0Rov1DyDok2AT0tX4hGZcMOPOshHb=r5nQ@mail.gmail.com>
In-Reply-To: <CA+chaQc1rS1EJw9B0Rov1DyDok2AT0tX4hGZcMOPOshHb=r5nQ@mail.gmail.com>
From: "Andreas M?ller" <schnitzeltony@gmail.com>
Date: Fri, 15 May 2020 23:29:23 +0200
Message-ID: <CALbNGRRHP+Vtd4U9+haKRVhd3GFEwfZabfDazM8d-5-Z_gT-OA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] libsecret: upgrade 0.20.1 -> 0.20.3 / port to meson
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 15, 2020 at 10:30 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> This seems to be missing features_check inherit, so that REQUIRED_DISTRO_FEATURES doesn't prevent it failing in my builds.
>
> Will send patch shortly.
Do I miss something? It was never applied

Andreas
