Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B19C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 17:10:37 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.111.1657905029714155679
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 10:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CGorFiKX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id r14so7595246wrg.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 10:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=4avKA8AKrTr0xxAJw1nGYfN0A3cBw3zk4bvZ7MFKQ8E=;
        b=CGorFiKXoEnlYrYM/9NKJ3FYbVbJDpiZvzqh00N0iZ6OBZk3gLLFjMo9t5eXLPSpWv
         8pz+cMHMiJ/0uMgmSmUGEfuZnyHXT3W8mcqyIB4VOXPQs2F/uLkMhyvK+5MXmW82EYMY
         +k2Ye4PxXjm040wPClN36Tn6ojqpJ9mEkg3f0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=4avKA8AKrTr0xxAJw1nGYfN0A3cBw3zk4bvZ7MFKQ8E=;
        b=5KBkr78mD9KV7+KM8cf0UK1eUs/0xt93wCYb4VTyz6Ke6iOi3olATTeE6f+sZKap8H
         aa84dUuCmZ4RTUpgAbDs03QEzESnyLQh0SmDSYDWKt7rs0fhWv7JR6ykmRKs2uvMjlgz
         AM5oZOr9LS9QTPII08G3qL40X2pESe4hKtwWrj8IFuJZt6enEm30M0l9CIcKrGInYb+H
         v3D1Up5UcFzDf/5j9q9rH9g54uZQzpw8acsIRXd7/sQb356oaYTlLaA0YGOFjb2PJL4P
         AJUpa0PcwD58CYE2orjSdJVfG4aku/9E8N9vfDFS6CBDp6qXK0i7KfeKxc/30UkHp9ln
         xiDA==
X-Gm-Message-State: AJIora8iZBf/gRN3b00kc0Jl4XhySzp86zQSJQE5fBJptT0+kSIN6U2W
	xYMssfcjjrodBriBnghES7L4Iw==
X-Google-Smtp-Source: 
 AGRyM1vweUyqy43j4nfQFqcju3qKeswTxYaEDKePRcIegQcQWLw5y/MM/Ls2N70xx4P1WYFFZ9qVMA==
X-Received: by 2002:a5d:6942:0:b0:21d:7f61:9579 with SMTP id
 r2-20020a5d6942000000b0021d7f619579mr13341838wrw.703.1657905028064;
        Fri, 15 Jul 2022 10:10:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ef6a:f831:81f1:d696?
 ([2001:8b0:aba:5f3c:ef6a:f831:81f1:d696])
        by smtp.gmail.com with ESMTPSA id
 h8-20020adff4c8000000b0021d887f9468sm4223829wrp.25.2022.07.15.10.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 10:10:27 -0700 (PDT)
Message-ID: 
 <66a2252bde5d7e721d706b1581f7300e9bc61663.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] pulseaudio: add m4-native to DEPENDS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@arm.com>,
	openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Fri, 15 Jul 2022 18:10:26 +0100
In-Reply-To: <d7ae54ce-8362-32ca-163e-539f5fa32805@gmail.com>
References: <20220715110533.4008485-1-ross.burton@arm.com>
	 <d7ae54ce-8362-32ca-163e-539f5fa32805@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 17:10:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168133

On Fri, 2022-07-15 at 13:05 -0400, Khem Raj wrote:
>=20
> On 7/15/22 7:05 AM, Ross Burton wrote:
> > Normally m4-native ends up in the sysroot via the toolchain, but if a
> > non-standard toolchain is used them m4-native may not be installed.
> >=20
> > However Pulseaudio explicitly checks for m4 in the meson.build, so add
> > it to DEPENDS.
>=20
> I think default toolchain dependencies should be emulated by external=20
> toolchains too. Or perhaps m4-native should be dropped from the internal=
=20
> toolchain too.

See the section in OE-Core's layer.conf:

"""
# Avoid adding bison-native to the sysroot without a specific
# dependency in the recipe. This means indirect dependencies
# (e.g. X -> Y -> binutils-cross -> bison-native) no longer meet the
# dependency incidentally. This improves determinism and avoids build
# failures when people switch to external toolchains.
# libarchive only needs e2fsprogs headers at buildtime
SSTATE_EXCLUDEDEPS_SYSROOT +=3D "\
    .*->autoconf-native \
    .*->automake-native \
    .*->bison-native \
"""

If we add m4-native to that list, it would do that. Just need someone
to work through all the failures it might generate.

Cheers,

Richard

