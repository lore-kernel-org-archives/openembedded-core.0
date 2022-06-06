Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0BBC43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 11:30:13 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.30727.1654515013012768374
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 04:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cAijGuK6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id q15so11409102wrc.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 04:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=19amwONrF81SRhG1uWMd98FKoh1SY19ArGTCMffeTUQ=;
        b=cAijGuK6QFhjSsTMuiKgW0yxrihZuKRIHpXQOMp8i5B1UMu0aZ0idFHaA1Rlu2xubt
         1d2rq2wigKIMhi0xirf9ZmH3QA93ItnKx/6/1ezyzdEFjXYNxAGYlhZlWtLZufNSvTz2
         i0ZW8yvcl0dB47cwOaDHTWReX5n9kycjIPzYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=19amwONrF81SRhG1uWMd98FKoh1SY19ArGTCMffeTUQ=;
        b=0X5PyQigmwIvDLcUVtVIE1NtK2OrW0qrOSPmE6UMexsovm6/2WZuU+mnvabGRJ2A/2
         XJ1KynkyAOkX7ZZYnFkFvW5pehVqpgo44OdHd4ej4z/+EUySxjIL+U6H3OgcbPSp2v+k
         sX60A0Wbz85VSr7ez+7PR2YnILTce6IRjfnsD1AX0cjFNIax1lvMdjatMYToC2SoclX2
         tTHwuC2xCOK3r6mYdxZ056vpz+6abzbehvw96tXK/bkJ5BSjvAZQm5OJo1hONe5h5F+Y
         sO7yP33Sz/hLNQ5Sq1/asxNgRLPSr6JWNAI9tvMEz1+wtHfDga6+91cwCwZ3ynmmTKK+
         Be0w==
X-Gm-Message-State: AOAM532JVtesF/99XWsSX9gXhOkoDY5tFV/1gOEpdq5OsjRbCFKd1VW+
	/tLSe3R1xkPJ9auyGUISKrL7Dw==
X-Google-Smtp-Source: 
 ABdhPJwiSkU7x9k3Ld7G8pmejN4IMFASLbzZBySYrmgIHjquamuObRN5IWzeXUxnIk7rVZSASl35dg==
X-Received: by 2002:adf:e944:0:b0:210:30cf:6e42 with SMTP id
 m4-20020adfe944000000b0021030cf6e42mr21204663wrn.258.1654515011360;
        Mon, 06 Jun 2022 04:30:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:22ca:1a07:c46c:a885?
 ([2001:8b0:aba:5f3c:22ca:1a07:c46c:a885])
        by smtp.gmail.com with ESMTPSA id
 h12-20020a05600c2cac00b0039749256d74sm21870694wmc.2.2022.06.06.04.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 04:30:10 -0700 (PDT)
Message-ID: 
 <9dac6561419afa5777a01d1acbad52a623296d4f.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCHv2 4/6] libsdl2: dont mix opengl and gles
 backends for wayland
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Mon, 06 Jun 2022 12:30:10 +0100
In-Reply-To: <d5887223-b996-cd38-3fd2-b2e04d51ff90@t-online.de>
References: <20220604053028.4682-1-f_l_k@t-online.de>
	 <20220604053028.4682-4-f_l_k@t-online.de>
	 <d82cc562394b4cd74a3fedc53e6b41f7bb053f81.camel@linuxfoundation.org>
	 <d5887223-b996-cd38-3fd2-b2e04d51ff90@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 11:30:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166593

On Sat, 2022-06-04 at 18:25 +0200, Markus Volk wrote:

> Am 04.06.22 um 15:27 schrieb Richard Purdie:
> > I think this is breaking mingw builds:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/5320
> >=20
> >=20
> Could it be that we need to add a wayland exception here as well, since=
=20
> xorgproto can now be built for wayland?
>=20
> https://git.yoctoproject.org/meta-mingw/tree/recipes-graphics/libsdl2/lib=
sdl2_%25.bbappend?h=3Dmaster-next#n4

No, that isn't the issue.

The challenge is you've changed the configuration and dependencies of
libsdl and these new dependencies don't build on mingw. We need to
correct either the configuration of mingw buildss (wrt
DISTRO_FEATURES), or rethink the issues at hand here.

I share Ross' concern about the x11 distro feature effectively becoming
meaningless. Pure wayland shouldn't be needing these things and there
is something else not quite right here. We do need to step back, state
which problem we're trying to solve and then look at the issues in
doing that. The patches in this series say a lot about what they do but
not why.

Cheers,

Richard

