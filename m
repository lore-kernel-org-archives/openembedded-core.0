Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906D8C433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 12:54:40 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.28388.1652705670438583146
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 05:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J7FlSSQO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 m2-20020a1ca302000000b003943bc63f98so8567767wme.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 05:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=nUkDUZ8Tlt4LvXUAYwFCjgw29Lda5emxfYmgBXRUroI=;
        b=J7FlSSQOYleJ0WZgUfeyO96D73iN6SBTbkkzxJkqv7y2Y8u0ixI9IJCTUZeIDJWGsC
         HEfcQwTNN7H6ayT0HYxb/BeIkJfE3T/fc8gzm1Mtpusy7nDUFiqcV/7RkmdgDal5FRH3
         f1WVMgr96yJ+neOuHKMuzAVhxdffcTYoq5TZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=nUkDUZ8Tlt4LvXUAYwFCjgw29Lda5emxfYmgBXRUroI=;
        b=LzVXnQrRULGJO6VTSuTIGLMfhr6GuCeQ7iWEqINGI3pugmhY7uX2hhBFO+7bSnjpqu
         aGQxToOXLf3FiuFkyrpdzy6tZeqG9tUn5ONrA/AOzBINEILJxWnR2QFxmH3/m/+RFZ7Z
         C4YK/Ode7B+YqbENzy5hAkUiiHgF+74H/fKyIqbEl+1Ju9a7WgiizNx0PjhA0dZwyImi
         zrbwjG6r+r4LZInlckjkYAawdkOcoRH9D8Ht3zawnGORXKdEVUXrEZpHBhH0E/MHiemt
         bvPIkPwJQNlh1bT0Otu0cZM4DEv53Pf2HeAGf8OycA/Yr/Rru+vzNecpEW/W1a3jNpZd
         Pz+Q==
X-Gm-Message-State: AOAM5318ttug4WxLpc4rnmJyp5rIanU8o2VEqHLlfTz1SSOUkOSe00jO
	nld8ciP6Zk/ecJ612cxZ5yamyg==
X-Google-Smtp-Source: 
 ABdhPJyyXSD3uLbKQuUeStwJjRdBfWKyBjOhilE/3uDyNRZOeWhFcBjvvWmXDeDbIXWV/ezwIGuJ1Q==
X-Received: by 2002:a05:600c:1992:b0:394:826a:d40d with SMTP id
 t18-20020a05600c199200b00394826ad40dmr16809073wmq.146.1652705668749;
        Mon, 16 May 2022 05:54:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:907b:5576:ab63:2b17?
 ([2001:8b0:aba:5f3c:907b:5576:ab63:2b17])
        by smtp.gmail.com with ESMTPSA id
 l9-20020adfc789000000b0020cd8f1d25csm9994285wrg.8.2022.05.16.05.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 05:54:28 -0700 (PDT)
Message-ID: 
 <2b845d9c22de1077d0a62dd565a6d8d1a28bb1d5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] selftest/imagefeatures/overlayfs: Always
 append to DISTRO_FEATURES
From: richard.purdie@linuxfoundation.org
To: Jacob Kroon <jacob.kroon@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2022 13:54:27 +0100
In-Reply-To: <660498bc-9239-4f1f-097d-29b562ba76a3@gmail.com>
References: <20220516112849.448882-1-richard.purdie@linuxfoundation.org>
	 <7763f240-35b1-27d8-f2ec-8860dbea0e48@gmail.com>
	 <63b10a5b05a1a029e50725341b1cb5cf4838ac53.camel@linuxfoundation.org>
	 <660498bc-9239-4f1f-097d-29b562ba76a3@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 12:54:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165680

On Mon, 2022-05-16 at 14:52 +0200, Jacob Kroon wrote:
> On 5/16/22 14:38, richard.purdie@linuxfoundation.org wrote:
> > On Mon, 2022-05-16 at 13:43 +0200, Jacob Kroon wrote:
> > > Hi Richard,
> > >=20
> > > On 5/16/22 13:28, Richard Purdie wrote:
> > > > Using +=3D unintentionally removes all over entries from DISTRO_FEA=
TURES and
> > >=20
> > > "over", you mean "other" ? If so, how is that possible ?
> >=20
> > I mean other, I'll fix the typo. It happens due to:
> >=20
> > meta-poky/conf/distro/poky.conf:DISTRO_FEATURES ?=3D "${DISTRO_FEATURES=
_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
> >=20
> > which interacts badly with "+=3D" :(
> >=20
> > I'm not happy about the situation with variable interactions but still
> > not entirely sure the best way to proceed.
> >=20
>=20
> That is surprising to me. I tried this snippet in a Makefile:
>=20
> foo ?=3D bar1 =20
> foo +=3D bar2=20
>=20
> $(info $(foo))
>=20
> which produces:
>=20
> bar1 bar2
>=20
> which is what I'd expect (maybe because I'm more used to make than bitbak=
e).
>=20
> Aligning bitbake's and make's handling of variables would make a lot of=
=20
> sense to me...

The amount of silent breakage that would cause though... :(

Cheers,

Richard



