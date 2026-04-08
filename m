Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3867310FC44B
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 21:47:47 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.117978.1775684858566953213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 14:47:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EOdAiIgR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d17bb1c65so93663f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 14:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775684857; x=1776289657; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0Ys7LE8uoQsMtMA0tmfcmODsYjtjJukczpJQgrEuaE=;
        b=EOdAiIgRlO5tKArTi0HG1tBfUZqT7soBTl2zvQdGvLZvpdxTVtpBXrdm3d3rLU7UQN
         /yXk5JO+2HCiSk1N95EsvRKSeJ+r09Yl8oGz5zbFz1gyvlhm4guNehUOxbRO1sdD7CUC
         dv+1+tE/DDjbaftcMHq+LpMAurBREUSsjX9Mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775684857; x=1776289657;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N0Ys7LE8uoQsMtMA0tmfcmODsYjtjJukczpJQgrEuaE=;
        b=GP5OOUehC9imSU7Ic8lyf/WitWPEQgaXOZWtVZWUzkTXpC6dCZW95ILDmEUdsEYvtJ
         4m4e9kjiGJPvJyTKnsXIEDg7zpRzSoMkbl9pvBexRypuXMTY8lXcwx6Hh6kqCTcrfdK2
         u0Ax1dJVM5GVKZseqLHB/esFN78z8i6syy/3UL3bdS2llirz0OEA6ArV+odvyKYIf33X
         W/4aUjRjggCHjnFHD8zE7fGY8hegRSWOxVAbqmb6C0d7vS71E9l1zMHuqB2kdHKGv3Jg
         g6cTrU+Abf+nyH/LDAfpvUyE4BZnffEy/l5S+fbRpsnKU5Zwf9R9ReP0695++mOu0UaQ
         aazA==
X-Forwarded-Encrypted: i=1; AJvYcCVKBrXTolWG/fRnzQkJSayw0gDp2dlZ0YBhPzN6q8IJxdyNkOl/tupEyzuQrZX/KKkNEEpFnEnnZYBaj2H1UrMDZg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxzY93gfY96qNXkR/DsciyJ2V9Nw5PrQ7KtzrOFEuXX5UvsHMLq
	sOi6VjjTC76QnDHlR7qRXLJJDVhrReDGAxyGJ7sPPPBDoyeGtk5op4e+v4tGWF669BiX8DEqpck
	crPlFrr8=
X-Gm-Gg: AeBDieseMORddFHwP4Xu2OqDNr75Knz1T7obrG7r8dzlB635ByBRWelCcA7loK3E3HD
	BOB4fQJGLkVzm/4ue4ZJ+UnvjN+5xaXdBbt6y9rDcGN4h081PUxe5htsqqQo/+VIYv3iX6aKQ0M
	6bySETbaT55jDesWR8d+qFdyUXmDirZOBijMde5q6umnxK/zaLe0tFktPly29ojF0UWlS8O6PIt
	HJapDwUFk3jUt9JMpToWeyHkpMaL2q0QQ1gxO3QTF1WU59QiA6jVJDUMxzHSD5a8qnl6NQWBFhM
	zDGlvsawKqBNO07sBc7+UT0yiym1pm/6TunpLJsv6ME9ioZXb5rpMfU/1dkyLKcSfIbK+zzOou6
	7HugiyDtd/PWRwp9/YFDXZbrR5JDS5tGWNMf3i4NDV8ucTOY5gMTYA65b3z8l0vt4HuIB7F9Apj
	lfvivTXRCyISIcT1ZyOZ95GQDIYw0BIesQ4iXpyYyuM0c32aCwDUNClKY7tdGO8VOwgjPCzeLOP
	3LoF3L2RVkLbA==
X-Received: by 2002:a05:6000:40d9:b0:43b:a21e:9c19 with SMTP id ffacd0b85a97d-43d292e285dmr33352993f8f.38.1775684856674;
        Wed, 08 Apr 2026 14:47:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:530:d4f8:22df:8c0d? ([2001:8b0:aba:5f3c:530:d4f8:22df:8c0d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a7223sm57685578f8f.5.2026.04.08.14.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 14:47:36 -0700 (PDT)
Message-ID: <1acc463784821951790b0a3cf3ee23a6b02aaa68.camel@linuxfoundation.org>
Subject: Re: [OE-core] why would ASSUME_PROVIDED recipes be built anyway?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rpjday@crashcourse.ca, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 08 Apr 2026 22:47:35 +0100
In-Reply-To: <daa91ca5-ef8c-bb83-7079-3d03ace27a8a@crashcourse.ca>
References: <daa91ca5-ef8c-bb83-7079-3d03ace27a8a@crashcourse.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 21:47:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234866

On Wed, 2026-04-08 at 06:33 -0700, Robert P. J. Day via lists.openembedded.=
org wrote:
>=20
> =C2=A0 puzzled by something i just noticed ... the documentation for
> "ASSUME_PROVIDED":"
>=20
> https://docs.yoctoproject.org/ref-manual/variables.html#term-ASSUME_PROVI=
DED
>=20
> clearly suggests that these represent recipes that would not be built
> as they are already on the host, the example given there is
> "git-native".
>=20
> =C2=A0 however, in a walnascar-based build i just built, native recipes
> that were listed in ASSUME_PROVIDED were built anyway, even though
> they are clearly on my Debian 13 host, "git-native" among them. in
> fact, a number of recipes i checked appear to all have been built from
> scratch, despite being listed in ASSUME_PROVIDED.
>=20
> =C2=A0 as a test, if i then tried to "cleanall" such a recipe, i got the
> perfectly reasonable:
>=20
>=20
> $ bitbake -c cleanall git-native
> ... snip ...
> WARNING: Explicit target "git-native" is in ASSUME_PROVIDED, ignoring
>=20
>=20
> is there some reason that something listed in ASSUME_PROVIDED will be
> fetched and built anyway? is it a version thing?

Some of the recipes have a PROVIDES for XXX-replacement-native and you
can build/depend on that.

Cheers,

Richard

