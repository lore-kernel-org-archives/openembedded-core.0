Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF21C0015E
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 21:37:32 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.375.1689370643752286515
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 14:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=E6RlHq7C;
 spf=pass (domain: konsulko.com, ip: 209.85.128.169, mailfrom: trini@konsulko.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-579ed2829a8so24191527b3.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 14:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1689370643; x=1691962643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zihUJ6UAUGw6j/ftWF4ju8GIx6zx7n4X000qUrEoB/4=;
        b=E6RlHq7CobQQ55xeUQEsQJlURf/maSWtSroYs1uEgipdAByeUR+BhkrWNjEph58Qet
         Xe5wCRupu0nFCeswm5gd4j6rFs7K5SYsJZ5k/PefMLkyahBoXK882ic35RpC6kC/OCoM
         8xmIVQqZF+ZMnPoD8NBRdXaGr4mOkOurAJRE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689370643; x=1691962643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zihUJ6UAUGw6j/ftWF4ju8GIx6zx7n4X000qUrEoB/4=;
        b=PUVivEj3yQbSv+SllxbJjqFtyOp77rAcz8jRqZbVPUOeJO9vddzx/ewAFpYFNz1+gw
         57ukuQjrYSMlVp5mRBB2lW029MPkryjrUo/rUqpY0loKKWRCMGVaXm60Oe9AWPRf5f1P
         WNTBeggWItEy9FAN96e9ySPp3LmtTW1xp1xOyPJlWr/QNJC/pCfBJk6vs5rUli7SCLUt
         aPm2C0QN6Pd1IGUXtKbokAYQesE02V7AFJoFgnjTHNpcIUUh7fYy1o0v5cL0LiVFwSXU
         XkhMh0LOExOVDhG6QRcroHghwBsD3Z5bEjVJ0lj1tdkby8SQUWZNtuDKhh2x7FUReu+k
         rIKw==
X-Gm-Message-State: ABy/qLYHJfCdmQWO2q8ndpr8dF864NeAuluePqvUBb+WsIFNxBNFnLsM
	NTMmHN2TlahD/bz6ctfzIgPbVg==
X-Google-Smtp-Source: APBJJlF9Q/nDsOLZdsgH3A+v9QpBQuhDyj4U/85+tFbKov4cU7GTWrmQiOJ+8Gq5iekdJns0M8kmbA==
X-Received: by 2002:a0d:e292:0:b0:570:81f1:7b49 with SMTP id l140-20020a0de292000000b0057081f17b49mr6080071ywe.6.1689370642951;
        Fri, 14 Jul 2023 14:37:22 -0700 (PDT)
Received: from bill-the-cat (2603-6081-7b00-6400-24ee-6309-f4be-c2ad.res6.spectrum.com. [2603:6081:7b00:6400:24ee:6309:f4be:c2ad])
        by smtp.gmail.com with ESMTPSA id y80-20020a0dd653000000b0055a21492192sm2525283ywd.115.2023.07.14.14.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 14:37:22 -0700 (PDT)
Date: Fri, 14 Jul 2023 17:37:19 -0400
From: Tom Rini <trini@konsulko.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>,
	openembedded-core@lists.openembedded.org, marex@denx.de,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [OE-core] [PATCH 1/2] u-boot: Switch to nobranch=1
Message-ID: <20230714213719.GX2066889@bill-the-cat>
References: <20230714161823.20685-1-festevam@gmail.com>
 <CANNYZj-8RV6tz_7kEH6uz=yZeyd=bPts6AoBqTd5DL3rGGu+yg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SJB3M9UEVKdg++zf"
Content-Disposition: inline
In-Reply-To: <CANNYZj-8RV6tz_7kEH6uz=yZeyd=bPts6AoBqTd5DL3rGGu+yg@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 21:37:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184281


--SJB3M9UEVKdg++zf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 07:53:03PM +0200, Alexander Kanavin wrote:

> It's not in master branch, but it is in a branch, so please do not use
> nobranch, and just adjust the branch parameter together with the
> version update:
> https://source.denx.de/u-boot/u-boot/-/commit/83cdab8b2c6ea0fc0860f8444d0=
83353b47f1d5c

Won't this just make more churn later? The v2023.10 tag will be back on
master (and we'll assume I don't goof it up), but if any of the "maybe
we do an LTS? Hmm?" work comes through, then we start having to change
things there, and then maybe can't as easily share inc files between
something that tracks LTS and something that doesn't.

--=20
Tom

--SJB3M9UEVKdg++zf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmSxwAkACgkQFHw5/5Y0
tyz8bgv/QCQbyEgFhmrFGryogh9IpyuIPQLYKJplU4d52UQFBdv0778dudLDidvY
lB5rqbSOhrd3ja6+mw7B9mHZJzZmsqhPvgfq7nt7fFJ4hPcMSnJZSVz/NGMnVY+2
H80wwZXW34C+it6soeZ/h9s7AIfhBvmd88jLrWhoW5eZG1c9sLJnmju+4jpaJ4TF
nDCVDeWTcfZJG8HzOrtV5a/dXfpjchFowjbuZZd0dMECDTqWCMhdwxWZQP6KFDam
Fh6CJ6IXyaziH/yIKx80XfMIX7F8ZMMJp63o6715NcJTg3sgB9ElbzRKpVKFgb1H
c1Az+4NJh30jy+RPEorZ76aFseDaMQNcnayJl9QUQJQZQ0d0mMBJ5b0b3+dzg0+B
R8KIq2W0Kc7m68TCLVvpHiMysHgdHR5OY8A5IHIYopLReSILUQ/owncTCYYrlR9i
flx2eK3t9JWa/Okxup5dqsWVOJAyGntRIw4Bbb5MQZpdW47zgQu5w7DjQHULkYnt
IeiBhCGo
=0lBB
-----END PGP SIGNATURE-----

--SJB3M9UEVKdg++zf--

