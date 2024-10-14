Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1651AD16246
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 11:28:26 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.52650.1728905300579978315
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 04:28:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OAdKH2kR;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539eb97f26aso1339119e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 04:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728905299; x=1729510099; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P/eSxttQqmJT2dIbbGbdr9IUyH5/UtybIyo1+0SByh0=;
        b=OAdKH2kRRIjAIDVbpDB5DUzJXtLqIVKnTocu+8k+jHyjfzO9FNNDZO/JXiifm3Hffb
         ocfMluBKctRugK5FHk9He8a2I9X4bfiXuBSUEuuRCrcTfdUbSx4194kbZv98rZ166ztb
         ZMqmGzud3syGMl4mF1FK/cIQetja+PzNTbpoBm76aApgrt9k0OwHJI5DwAqWufClr1o+
         2u0sNdcI3Zlc1NrBvSYPmM0GwjVjoPW3RABQqTwXIbP6oXXe4B0ygFMZ5gfkItkozl52
         5gsHBsHU49Pr/TbIy+bSDNU5ru9nL2BLyLq0JNkS1+D2xCoK2jd0W9eBFL9uBpWEjf7Z
         3MJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728905299; x=1729510099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/eSxttQqmJT2dIbbGbdr9IUyH5/UtybIyo1+0SByh0=;
        b=vYRGoAxFobT/ceJhWtOQOY7YVURBbNJQPOkkMwUcRSzYbAKuwZvytcozVb/6I3PPpj
         C2QCA/KKVKXCShKcIGrhj3dbSAHqKlqwBHUBo8LyW5NYuGU6OLIPi/1sCP/3V44nk8zt
         kxsgBpXO7BTTSOK73qevF0vqBq98OTFjkusnbjTH9MNrEL/gRIboIBJ9gF97YvFpI5rr
         Po5fjWZ1UhGg0N1QFohHDATBq05is0KTHCbxCbBB/Gd+CzCHSaRCRjAJa6lOGbU1q0qQ
         O8N5BTKGLCpPiHCFwhRWjyBRA9sEV2yu357Cmvstujcejxr9QJCnhSE4QzdKLBTjL+eW
         4n+g==
X-Gm-Message-State: AOJu0Yxtpjec1iimXR2BJyuAEfVh1shxxGxXKDWz2kMGbMCw7QJi+GVf
	mFg7HddEZ0BK7+WneOMF6+hnsAeT5YP9BHM08zbntbc1rAEgtk5l0obTz9CspwBodlc9cImpOdC
	ufoiLpYD7KiOEraNbidSNLaRYB3U=
X-Google-Smtp-Source: AGHT+IF4O3aQiXCDsYgLHLcKSlvhR4OcKSe8dgHBM508ziN0rp2S+pblfmj6YxKZ8GYEoS+/R83ubmtUG2fREHDWJuY=
X-Received: by 2002:a05:6512:130b:b0:52f:c5c0:2879 with SMTP id
 2adb3069b0e04-539da5950e8mr4542964e87.41.1728905298470; Mon, 14 Oct 2024
 04:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20241014102817.40298-1-mikko.rapeli@linaro.org>
 <CANNYZj84yW7dBNYga4Aq748a_9_RuPi9y-H6kd+yG5Dun4dRKw@mail.gmail.com> <Zwz-urTA8Jj69agg@nuoska>
In-Reply-To: <Zwz-urTA8Jj69agg@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Oct 2024 13:28:07 +0200
Message-ID: <CANNYZj8vi7A_BSLTewb_LNLnPxzrmhn5fpxG8_OeOA_k-AhoXQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ovmf-native: remove .pyc files from install
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 11:28:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205755

On Mon, 14 Oct 2024 at 13:21, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> I don't know. At this point I'd rather remove all tests in uki
> support which are causing so many issues.
>
> I tried to dig deeper into ovmf native but it looks like a mess.
> meta-arm edk2 doesn't compile anything for native but just installs
> the python scripts and gets away with it. Same did not work for ovmf.

The tests are important.

Were you able to reproduce the issue locally? Ovmf is an awful
component and a headache to work with, but I could take a look if I
can get the same error. I'm just worried that deleting .pyc will only
trigger the same error for the essential installed items.

Alex

