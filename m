Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FC3C76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 14:20:30 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.36182.1679926820601462896
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 07:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hvP/9Hfx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id e18so8970390wra.9
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 07:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679926819;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SGGuIArzXinJFMwkPrR+EyzjGjqLyuIKbxl5Y3xezLE=;
        b=hvP/9HfxBlPn51l4C+GCDeTOhQuV4roaWKa+TSJNuhvwyLqv0JhkYHfLx8DuagVsTG
         n7rKuHD3cliw7h3ICFU1FhN2dGna+OiZiQ6wW+CjDpudFbnWb2OpcN2LDxlkXQ0BtLVS
         EdwhabU3ehVGvLzD0okiji7vGEHJiYVXO99ZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679926819;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SGGuIArzXinJFMwkPrR+EyzjGjqLyuIKbxl5Y3xezLE=;
        b=4dhPY0mkcZ6MDeo9Libk5ApU82iuIMRRsWBxsYTGVM05JNNHak9CEPBezLUxA7YwY8
         1lVf4DL9CzPrK5BH0GQa1g1/oweWYuSNNp3mZV6DcXY47yEFAYXOM788wGsC0T/KVQMp
         lYjk5e68aFopAa2cjT/4A6zq1rDeKZ/GG8KRg/PtVsExkmWOrr7U+yY7H0FG7MR/MpIX
         BDPq700zmmawbOvv/U1Ns65DkVqabftREpyXwQlfxVxqKcZREkkgjMTn/7AZRiT/Fe1r
         jPbdhA2AVrTXYeySSdJoiI8CLJNkX7gKN56vrpbydq75c3gyc71Hk4gsaQARv/ZJwMEg
         3JGw==
X-Gm-Message-State: AAQBX9d/GKnVI9hWfcj4cJO0vdYHHS9PMAQ7InL5+n0DFdK8uU0DEO0e
	t4NYwdZipb9M80oZ+qSOag2ed+WgI79mhimUa5M=
X-Google-Smtp-Source: AKy350bEDNqqTZvtpoMZSEJoO8yng/s3pGWTTsudzpHYbDc3YapjS1fSSEaDujmjHgcMp8bnooymng==
X-Received: by 2002:a5d:5267:0:b0:2d1:bbe3:29b8 with SMTP id l7-20020a5d5267000000b002d1bbe329b8mr10222379wrc.28.1679926819003;
        Mon, 27 Mar 2023 07:20:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bf51:2d4c:3aae:6bd8? ([2001:8b0:aba:5f3c:bf51:2d4c:3aae:6bd8])
        by smtp.gmail.com with ESMTPSA id i7-20020adffc07000000b002c5706f7c6dsm25165076wrr.94.2023.03.27.07.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 07:20:18 -0700 (PDT)
Message-ID: <094a85975f9b1ef0fc622f4f0acc70a935f1e6fe.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/5] Extend cargo based recip support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Frederic Martinsons <frederic.martinsons@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Date: Mon, 27 Mar 2023 15:20:17 +0100
In-Reply-To: <cover.1679734210.git.frederic.martinsons@gmail.com>
References: <cover.1679734210.git.frederic.martinsons@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 14:20:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179160

On Sat, 2023-03-25 at 10:00 +0100, Frederic Martinsons wrote:
> From: Frederic Martinsons <frederic.martinsons@gmail.com>
>=20
> This series brings the support of local git repository inside
> a cargo based recipe.
>=20
> It also enable devtool capacity on it and provide a real crate
> example recipe to show how things are done.
>=20
> The following changes since commit 4876189dd2ae5a04a296b11b537b9f613159c6=
bf:
>=20
>   xcb-proto: Fix install conflict when enable multilib. (2023-03-23 22:38=
:41 +0000)
>=20
> are available in the Git repository at:
>=20
>   https://gitlab.com/fmartinsons/openembedded-core cargo-extend-support-g=
it-and-devtool
>=20
> Alex Kiernan (1):
>   cargo_common.bbclass: Support local github repos
>=20
> Frederic Martinsons (4):
>   cargo_common.bbclass: add support of user in url for patch
>   rust-example: provide a recipe for zvariant
>   devtool: add support for multiple git url inside a cargo based recipe
>   patch: support of git patches when the source uri contained subpath
>     param

The various rust/cargo/crate patches look like they're heading in a
good direction, thanks!

The one thing which I think is missing is more support for testing some
of these changes in our automated testing.

In particular, devtool does have a decent test suite so we should
ensure new devtool additions have tests.

You can see the devtools tests in
meta/lib/oeqa/selftest/cases/devtool.py and run them with a command
like "oe-selftest -r devtool -j 3" for example.

Cheers,

Richard

