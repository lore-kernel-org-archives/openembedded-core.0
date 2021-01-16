Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.9837.1610829422989586088
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Jan 2021 12:37:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oW5emvmL;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id be12so6477476plb.4
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Jan 2021 12:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qnCdQyPnSO5OpWpbq2i4qhzejJ8ziL4D0QcIuEsUBt0=;
        b=oW5emvmLVB0lzf/ZxdAW0WiuVsXINNJyrtgqkT/fpT+1hVz5b2ajfFcN1+kamwAOmB
         3gAYXVOQ2S2Aq2qkjysdlHjHauEafn4RiI0SNmoIBUteMJneNBAju8X2JdgBieC/d3B6
         2kWy/0COz3O2IiV9X68TfD0Z2vQip3/6OM8fAVDD6o7t/PCjERVK+UrEK9QFdicLn9Ar
         yhpfF9DMUxrj0PMbm32S/ESAJieCvY8Q0McIjkXEL+QZL6qRHvNWLFDEDOO/BJ5/KbVX
         6Bj5F2m9EKJEX0bmQHnlVLbhLXp9d95T2dRpbos+N0MGiQWDIYJrZzIquuVTY4ZAYOHd
         cX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qnCdQyPnSO5OpWpbq2i4qhzejJ8ziL4D0QcIuEsUBt0=;
        b=LCs3OMAnCYS9iiI4KW2P3hV6IMWlYBgorLJA1HedQCXZenBtmKJBV2lRGf4IaLyFgx
         2/LalAf0raDPGDSs2mjyCdoTB0jdFy21Qjo7V0HuPCugftq4S3Co9AduqJIoXPWl9yg5
         vtYQ3tc5c1mcKbIyiZLLUMCYy1RllMQHejz/qUAbOU1ckH2z8Ld6dCe3sWP1f3f3rxVk
         DsU/2I11u72s7nLvQWOGwQcP/Fu2QzsLtmmAcGp/HhxHnUqECUBohe3qSNHzde6sIEn8
         SqtemNzK5X1N7r0fkrgjX6a3Rz9dt019biq5xsJqduCUUbm9HGchz4RFJgUA6NdhgdUw
         sPXg==
X-Gm-Message-State: AOAM531APjiJtx45EiU9L5yS1daHbDZnpLdQKn4UuUWybtH9TXTrLuoo
	tkuAkUOL0eiQdkOTZd468VK6u//LHH1J60igFn4=
X-Google-Smtp-Source: ABdhPJz8Or1fQFBuHDvf+i8kTvNuiXz3TYaP2IYZR1f87ob5jEhXVw6aMQFvHrg6whUpHa1n/m6Dgm+61B/HhnQVLd8=
X-Received: by 2002:a17:902:6ac2:b029:de:3560:391e with SMTP id
 i2-20020a1709026ac2b02900de3560391emr18169838plt.60.1610829422551; Sat, 16
 Jan 2021 12:37:02 -0800 (PST)
MIME-Version: 1.0
References: <20210116174414.23584-1-akuster808@gmail.com> <20210116174414.23584-2-akuster808@gmail.com>
In-Reply-To: <20210116174414.23584-2-akuster808@gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sat, 16 Jan 2021 21:36:50 +0100
Message-ID: <CALbNGRSwQhHhu4EXRrpxhNtv3SEUSe_bZE6z7OhPELYV3QnMHg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH 1/2] classes/waf: Add build and install arguments
To: akuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Joshua Watt <JPEWhacker@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 16, 2021 at 6:44 PM akuster <akuster808@gmail.com> wrote:
>
> From: Joshua Watt <JPEWhacker@gmail.com>
>
> Adds variables that can be used to allow a recipe to pass extra
> arguments to `waf build` and `waf install`. In most cases, you want to
> pass the same arguments to `build` and `install` (since install is a
> superset of `build`), so by default setting EXTRA_OEWAF_BUILD also
> affects `waf install`, but this can be overridded.
>
Hi Armin,

Have no problem with this - most of my layers are compatible from
dunfell up to master but from meta-musicians (musicians seem to like
waf) I know that this can cause breakages for packages shipping (very)
old waf. Nothing unsolvable but...
Just out of my curiosity: Why add this patch to dunfell?
Cheers

Andreas
