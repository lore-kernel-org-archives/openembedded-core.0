Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web09.5980.1607560182221327092
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Dec 2020 16:29:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=iMy0R26b;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.67, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f67.google.com with SMTP id r5so3610410eda.12
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Dec 2020 16:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VYf0BobuLX/K3WNJNbxXD6jLyUEnygRytSSuWOhbFHk=;
        b=iMy0R26bjLED5bvCfz0jk5bi1iCPXMtAKyfJZvWgDZbXRfmWUxm8aUdLM2lsIZ4RPU
         V5ec41Qz7gO2vqsYZZZUVWc7RF7HOcl6Zdb0iZgRmvgJKwty4gi8lYWURERqYyOWHCGA
         LRXLYdF2+5VcbpDPfAqmVUJ1dcr2uR726q60LmPbWjAeMy/zC2vzMNO8PuDgJAE0S8X/
         7oUPGXSPJ0S+4Hd9ZxlJhhID2+8xrLaQ1cNN463WicOyqJHhXezgeW6jeccT/109Q1xu
         Gsa8hohtAdfXyBTnocIOWP/fZbY5KaixABnjBR9WpksV/UbyyLAacPN8jA+RYnbnFvJU
         7s1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VYf0BobuLX/K3WNJNbxXD6jLyUEnygRytSSuWOhbFHk=;
        b=q9dNmCoc/BPOxkqStK7SkKiwh8t59wh0c//y+OOIokoX2qD/X857A3VR4vHj/mcJMI
         GuwYfG6XpOwN7A4btv5zlee9WBr0CYvT2KQlXXNe/MDXU+kjsUPdW7Ak8M544IfW75jQ
         T6IRRTOi/4eCPo05LE91DYGKhxDUm11I8wIaxFqy4CCpWsyXVZmmcL7PUR29VN1FCjQT
         nEpyPSS7u0e4yA1w7gkkFzphxZCyCmzg3E+mWV9rCmSXhzEzI9okQAA5Y9lQbv3+gqKV
         NZoGvBXJP4LBB/7RjbP0uVfoAQIGNFILKWEoewTFzDNJFjmW1VFp0PHChwaRlaod0AaX
         Urrw==
X-Gm-Message-State: AOAM532MhglPc+4VCkRqm5ur8w3RILS1Sjk1KyR3quo1Kg1M60fw/qfd
	FjUtVpZo4VXK9M8SaProLllrGHx51kXdqUjbe32gxg==
X-Google-Smtp-Source: ABdhPJziOMJzIuFoILdkmiYvZLOROt0iVjkDdiRsROCD748cdo99GFPmQcw/VE4FstoYvd1+bflYy4emMM9g5zSyiCk=
X-Received: by 2002:a05:6402:22b4:: with SMTP id cx20mr4352126edb.262.1607560180763;
 Wed, 09 Dec 2020 16:29:40 -0800 (PST)
MIME-Version: 1.0
References: <20201209192111.21817-1-dmurphy@ti.com> <20201209192111.21817-2-dmurphy@ti.com>
 <CAOSpxdbceaaD4NKn34zwb73+jP1Y9ra7UwYi82LNL-KmPLGs5g@mail.gmail.com>
 <95a23893-b7ea-68b3-18ab-f11cd2209a19@ti.com> <CAOSpxdZeotQV7wy-oYS1qbbWnKxyUohYb4_5mn2iq9-o3jQ64Q@mail.gmail.com>
 <2c2f75e6-1331-6ec4-9193-ccc6b7958c12@ti.com>
In-Reply-To: <2c2f75e6-1331-6ec4-9193-ccc6b7958c12@ti.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 9 Dec 2020 14:29:29 -1000
Message-ID: <CAOSpxda3YiSkEF4=O=miBO+nWpgT+4ZPd11dRDwB=kkYeWDqOQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell] [PATCH 2/2] lz4: upgrade 1.9.2 -> 1.9.3
To: Dan Murphy <dmurphy@ti.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 9, 2020 at 10:49 AM Dan Murphy <dmurphy@ti.com> wrote:

> > Is 1.9.2 available in the release branch?  If so then that seems to be
> > appropriate.
>
> It is only in the dev branch not in release which seems a bit weird.

It is indeed! But I guess that's what we'll need to use.

Steve

> Dan
>
