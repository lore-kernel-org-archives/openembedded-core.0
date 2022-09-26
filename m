Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A06C32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 10:24:06 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.27021.1664187839191871442
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 03:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N14Ey6C7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f45.google.com with SMTP id sb3so13003411ejb.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Sep 2022 03:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=hPPzpOjg43fEgEgWzMhiTTYmeyIsNqG5Y+LoW9SkQJo=;
        b=N14Ey6C72op2Mdw8SOUmpJJNMkREoKjAWgF0283t1l02UZiAixwvAAwrlluXMfaT1y
         keuSq+5qRLfW3bKvad+mo9xn4r5JHoslLfiu4Bi3OGegxbRSzSj30f7nnVwgBfRQ/hw1
         t+QVLfs3KqqEb7SGatTl1jjW4UjeJ1rUrbYe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=hPPzpOjg43fEgEgWzMhiTTYmeyIsNqG5Y+LoW9SkQJo=;
        b=NxCkJg/enQ7Z+1CXSXOKnc06sN2OzcNc2ozl9oKCFwpBrmTAnEDJ1aK7cXDvFV6OM5
         fAgEZkIslw4ELfmvj18/1mjMsopnJc6L2YwXap+s8v33RUHDimQW7dxLNtJ1fl9vKlZ8
         koBQ2StOg9nftM58qtBabSDljOp7O9myz9ZfsmHyrD+gYuyXzZyxyvxXCqdeUQAY0u5n
         oJ6Lrcw47awHtahmqmcc3JCppZ3ICTAWiGTMouLjaqpQg4B01Yz+UwDWp4oSOpuoCjT4
         cBUvO/7joticJmBTukU8ktxXO5Ex82wNmWt3jsaY55kPmD3KLKmDuAjYXynpWhTkYZZA
         lydw==
X-Gm-Message-State: ACrzQf3qoZXmYGxoxSmcZJcXiqSgwRv4lcwupnhoIS+4/lS+RkWzb8md
	9WzewovzbqQs0WoqbBGKNe+JpA==
X-Google-Smtp-Source: 
 AMsMyM5YlwR0TUc1itP1SD/IdfuvTw5amZvLnuWz0gOpg6Ps0DVkyZ1Mu0iJhoYrqsK5T26SUGpOMA==
X-Received: by 2002:a17:907:25c1:b0:77b:9966:ccf1 with SMTP id
 ae1-20020a17090725c100b0077b9966ccf1mr17744542ejc.763.1664187837507;
        Mon, 26 Sep 2022 03:23:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:684e:1a2d:5b94:2c12?
 ([2001:8b0:aba:5f3c:684e:1a2d:5b94:2c12])
        by smtp.gmail.com with ESMTPSA id
 ku8-20020a170907788800b0073d81b0882asm8106236ejc.7.2022.09.26.03.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 03:23:56 -0700 (PDT)
Message-ID: 
 <bb6a6b015fa7e01e51b85096c10bf02859edc96e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] classes/patch: move QUILT_PC for patching
 consistency
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andriy Danylovskyy <andriy.danylovskyy@streamunlimited.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2022 11:23:56 +0100
In-Reply-To: <20220926090604.23397-1-andriy.danylovskyy@streamunlimited.com>
References: <20220926090604.23397-1-andriy.danylovskyy@streamunlimited.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Sep 2022 10:24:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171058

On Mon, 2022-09-26 at 11:06 +0200, Andriy Danylovskyy wrote:
> This will move the quilt cache from the default location '$S/.pc' to
> '$S/patches/.pc', to ensure source invalidation always wipes it out,
> together with all patches.
>=20
> Recipes which set $S to $WORKDIR are susceptible to a weird issue:

There are a number of problems with recipes which use S =3D WORKDIR
unfortunately. Another is that rerunning fetch/unpack doesn't clean up
files properly and can lead to build corruption.

I'm leaning towards making S =3D=3D WORKDIR a warning and migrating recipes
to always use a subdir. That isn't entirely straight forward but
probably the only way to solve all the issues.

>  if
> a source file is patched by quilt (a .bbappend adds a patch), updates
> to it are ignored by incremental builds, the first obsolete version is
> picked again and again. This is because quilt keeps its own cache in
> '$S/.pc', and this one survives source invalidation on do_unpack.
>=20
> This is a follow-up for a56fb90dc380 and 42a513489dc6
>=20
> Signed-off-by: Andriy Danylovskyy <andriy.danylovskyy@streamunlimited.com=
>
> ---
>  meta/classes-global/patch.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/classes-global/patch.bbclass b/meta/classes-global/patc=
h.bbclass
> index e3157c7b18..6fcac18d9c 100644
> --- a/meta/classes-global/patch.bbclass
> +++ b/meta/classes-global/patch.bbclass
> @@ -5,6 +5,9 @@
>  # Point to an empty file so any user's custom settings don't break thing=
s
>  QUILTRCFILE ?=3D "${STAGING_ETCDIR_NATIVE}/quiltrc"
> =20
> +# Move quilt's cache to ensure it always gets removed together with "pat=
ches"
> +export QUILT_PC =3D "${S}/patches/.pc"
> +

This would break all other commandline use of quilt without the right
environment. Sadly that is a usecase I personally use quite heavily too
:/.

Cheers,

Richard

