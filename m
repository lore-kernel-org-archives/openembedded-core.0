Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C77EC32793
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 14:15:44 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web11.16251.1674051341992472086
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 06:15:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jXns2AEw;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id i1so13556452ilu.8
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 06:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v8KBZACfBlrZvYOi5ZKw+WhNgSWJMC4ATueCAKrDteY=;
        b=jXns2AEwt+FKjkHiXhmywe5Q/mwhE43x6KAbxZAHeUv+paecoqR6su6hogOGL1Cz3f
         M8DVUZ+biaE6KzMpHCPq4kRZNSvoBIxAdh7QZLXZPAGItwE+OQcDEKKvWWrjZ0UOyu1f
         NLTetDmA857d4snXZbAQuIT2iUrMpscbzOmTyYt9WefMRPOrd0ijWtWZZEzJ+K5xZgij
         uQHkuegy6SwvM+DynX+mF6PsFuDWsu5Gyol98FE+mXmqHXij6wI/d62XO27frnYEeP7R
         uNGOa16tICak7smK6NFH64L/pPz9kaymkOCnNrrdR1oXtsMEZnX7BMt+FLfwTdPxlrKv
         kI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8KBZACfBlrZvYOi5ZKw+WhNgSWJMC4ATueCAKrDteY=;
        b=gz412edhTjz2ioZXtOhieVBOTLdzzRAtKvSjiKi/Urbz8cYApCwlh/6JCkfazQuxn5
         RHt+vIwJbj7s+KNik0xC9ikhRSzC5nHiQGJxvGCoCopLjr69cc6f3hUdiM08pCUtTLoj
         7Hsl6ms8sC77VRcIYy8FYq5L9SUOWSLPTcfs1fzld5Llbmc1Nyjj3wOkGY50EYBrueW+
         8V2pGoHDIDe2sCqyzJvJN4GllTvoIY46CkcYL4xLrywg4lKsD3+3atTZN7Pj4ZyAY90P
         oIAhS/op17RUFqqrZ6A2oSn0picAfYbLP6aDSWdFp2C0WKShkhH6PPcEuEwngZ0p62/D
         3aVw==
X-Gm-Message-State: AFqh2krdve2aX8OdKItXkEuHzrRhRnbtetcDG46XTreFFNgcaz4yaHBo
	yKtdoHdtf9iSjig6dPDPXSCRGFQUH8Xc3F5Z/04=
X-Google-Smtp-Source: AMrXdXvU2mcXVP20ktdqQhaB4Ry9sMcLAcoFQF9RyBZZzSnSeuhmGCyWbUd5IRpFGdL0Ilgb9oqiaiorHHw4reLYYaA=
X-Received: by 2002:a92:8e53:0:b0:30c:9a6:bd6c with SMTP id
 k19-20020a928e53000000b0030c09a6bd6cmr747653ilh.288.1674051341360; Wed, 18
 Jan 2023 06:15:41 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5R9udswL4RzNhtsWNYzN1U+sDNrrxvFX7FBvLyOsn=e6g@mail.gmail.com>
 <17348.1674043770170506715@lists.openembedded.org>
In-Reply-To: <17348.1674043770170506715@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 18 Jan 2023 14:15:29 +0000
Message-ID: <CAO5Uq5TRYjO+pUmoMur4O_jwZYJT1xuYk1iHkpMXjU2nofXYzw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] rust: Merge all rustc-source patches into rust-source.inc
To: "Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 14:15:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176097

On Wed, Jan 18, 2023 at 12:09 PM Kokkonda, Sundeep
<sundeep.kokkonda@windriver.com> wrote:
>
> Removed not required pkgs autoconf, make, pkgconfig... etc and not removed 'g++'. Have to check specifically for this package. Let me check for it and i'll update here.

Thanks!

I'd probably start from the other end - my guess would be you only
need gcc (and whatever transitive dependencies it brings).

-- 
Alex Kiernan

