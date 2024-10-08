Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80F0CED272
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 06:49:09 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.2960.1728370142953197846
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Oct 2024 23:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gk77hmfQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a86e9db75b9so806747466b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 23:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728370141; x=1728974941; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C2BH6RsD69S79vuRHM1dhbjvhZRIhJsxl4uOiETMBNE=;
        b=gk77hmfQtk3xInlKFcV5+CdwklQi7CVCB8e7CSRDltRar4X+ntWJGLhxYEvJ/fA573
         9dbujqkFBcHh/sZLSieL6Shvc771aoPMyYfpwWBDrOD+c9mpkn92woiy0/+QgjAoiLGL
         cpYnkLb3dpiCucNd4Q2XDxm9bEFAeC9WKcbqRywjodDztL3vB1uOpHF4u548EyBTTwar
         S8DCTTsgQ2S37c5c1WrGAZzkXPcfRKv5D99akwVkKW248TUFyI4CTx0GZMTP8d+Gf349
         jzR8jHeNJ+7wGs7ofRWpI1lThlbyfcmwFlucIEk2ixQqPKKDxWYoUZsK4QhaRpk6EcMp
         /Uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728370141; x=1728974941;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C2BH6RsD69S79vuRHM1dhbjvhZRIhJsxl4uOiETMBNE=;
        b=HgOLAKIWUOIVWBKIXJwEJtGEq0j6+FyPpo1yOHyzadti0ZKbUURlg7B2NH4qvHRG5F
         OMVOsEYrHmC2zeaGr8xIyOqjT6de0a3TYw5miAtvWvQbfMkSP6Afh47O1Q9yfg4XGra0
         M8nR+yKWOYHf64rXzwg7kNvyI/iRvWfwqJgRo3i1MuYeFkOvIj56nBT3O6dXeOtzPGAA
         t7fu7qy3fZoLv04qluCJIs4Z51gEhRID5SzPQSQWimmyRjLDz5XZeVCyYFmeqLdjpCUM
         UFc+Fwel5+DibYUobYkTHsAmIno7BGBTGsDURJ+T3dPQHpvH+OW3xLXEJd/1JPrxtF7h
         yh+w==
X-Gm-Message-State: AOJu0YyyTo9xGxnfDE1S7XonsQXiL7X2vc8yOomqYsqbppZdXczirQcF
	KlaWagMJkQWKFMjo7upAq6GIwZToPKUJOgzUMXZIdQbEOaLAbaTGzxPFeA==
X-Google-Smtp-Source: AGHT+IG3OPbFSMqEf5CONzfQCsQwglz1+EPsR0j8Av3xbUqjHi3jEe9yRkyog785KpcYvnjpovR+VA==
X-Received: by 2002:a17:906:4fca:b0:a99:399f:cf2b with SMTP id a640c23a62f3a-a99399fd2bamr1012558666b.12.1728370140749;
        Mon, 07 Oct 2024 23:49:00 -0700 (PDT)
Received: from [10.9.136.49] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9957c683d1sm206389266b.203.2024.10.07.23.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 23:48:59 -0700 (PDT)
Message-ID: <f3d65bd45d6af61db2acc391f2c70ffe5a2ccf65.camel@gmail.com>
Subject: Re: SDK in scarthgap after package_manager: Change complementary
 package handling to not include soft dependencies
From: claus.stovgaard@gmail.com
To: oe-core <openembedded-core@lists.openembedded.org>, Ross Burton
	 <Ross.Burton@arm.com>
Cc: Andreas Helbech Kleist <andreaskleist@gmail.com>
Date: Tue, 08 Oct 2024 08:48:58 +0200
In-Reply-To: <67e57e55a3535fd6771637fdb8b88c3e732bfedc.camel@gmail.com>
References: 
	<CAHirDJ8tUihjou3-4qirjk1vGVTXVrRg+TjKxmu2qvOtj2EVwQ@mail.gmail.com>
	 <67e57e55a3535fd6771637fdb8b88c3e732bfedc.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 06:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205283

On Thu, 2024-09-19 at 14:09 +0200, claus.stovgaard@gmail.com wrote:
> Hi Ross.
>=20
> As we talked about on oss / yocto dev day, I will just follow up on
> this mail.
>=20
> The thread is located at this link
> https://lists.openembedded.org/g/openembedded-core/topic/108100662
>=20
> And the patch causing the issue
> https://lists.openembedded.org/g/openembedded-core/message/167303
>=20
> The patch makes the NO_RECOMMENDATIONS void, as hard_depends_only is
> True from the Install method.
>=20
> So for rpm --setopt=3Dinstall_weak_deps=3DFalse is always set and the
> same
> for ipk / deb with --no-install-recommends.
>=20
> We could revert the patch, and change the default
> for NO_RECOMMENDATIONS. this end with the same default behavoier as
> now, where recommendations is not installed in the sdk, but add an
> option for overwriting the NO_RECOMMENDATIONS and get the Kirkstone
> behavoier back.
>=20
> Looking forward to your input
>=20
> Regards
> Claus
>=20
>=20

For those interested - a RFC patch for this issue was submitted

https://lists.openembedded.org/g/openembedded-core/topic/rfc_master_patch/1=
08685995

Regards
Claus

