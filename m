Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB63E6F094
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 22:45:35 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.6741.1730501132442422768
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 15:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FXnCLwqT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso21178455e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 15:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730501131; x=1731105931; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SHWQOHhKPjgwCY+HjqirirDCPawrrbJbWLYcFIzrW30=;
        b=FXnCLwqTkMf+JxUJbmHp9iXq8fK+Cw3jBzra36hzzMXMXi+p/aondhmdApxIZ/5OLj
         r7KWEwZSrdLPBqyUo9FujLLywLF5lKfBmfyR4iLaTWU0TfVKHBkLencjCLRgJ9n9rRei
         Oz1NIp2rzoEg+zIw3cV93J9wZd0ZUJ2JPNFiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730501131; x=1731105931;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SHWQOHhKPjgwCY+HjqirirDCPawrrbJbWLYcFIzrW30=;
        b=mx4h6W7wvQuHgXXfvS/LcGCW1rTFRWxFOa7Vpp4E+DY08x+ebWm4LVAIjXLsiOHx/3
         UgumXzPVsbYL4GUYyVCAuKk06Zpsp5hv8yPIJvOZK/ZMXAB10MQHLkhONKEuTcZaytf6
         K2XOrat7mqFKQpQXPZUm7VATm4RHVZurAE1Zuhh25a0iqNCHFxpoT+mJirG4hM9SZv11
         4oZU1EImhpCfFnw8qA3XFiDP2STUdHZQSFj2w1AbSYurtPfNaLcfH3y/16YOB8dMHjRk
         J6W8IoHBXdonZwrbvjLGDwgngNVzInK8vCrjAmoWWsbBsICnebFQFb26Q5Hh6XyZu5+y
         9v/w==
X-Gm-Message-State: AOJu0YwOCYeK+hqqFIO/nojaP3z9uRsXKr4SO+bgCTooT5E0xqFFQeIj
	oni7JaQpuGz8LBRQWrrjHZPpRvTLfqQhCVryX/uVdWSklXmtFY9qlvy9U8vImN0=
X-Google-Smtp-Source: AGHT+IEGNnpSOCB2ocIWPs9y3oDSdNIVhowDS4BCV15rhhDechcP4IlbQPLPpRNiZQWAbbsbAdFHfQ==
X-Received: by 2002:a05:600c:4ecc:b0:431:3c67:fb86 with SMTP id 5b1f17b1804b1-4327b801f83mr73029265e9.33.1730501130708;
        Fri, 01 Nov 2024 15:45:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:19be:469e:bfe3:503? ([2001:8b0:aba:5f3c:19be:469e:bfe3:503])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d69845csm75333525e9.47.2024.11.01.15.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 15:45:30 -0700 (PDT)
Message-ID: <7814ec4f59c97b31d8bc974de9b117b8fce5c843.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC OE-core][PATCH 2/2] go-runtime: fixme: buildpaths
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Jose Quaresma
	 <jose.quaresma@foundries.io>
Date: Fri, 01 Nov 2024 22:45:29 +0000
In-Reply-To: <CANPvuR=yRLzEK6G1RGQjMBOipkNiVWxWNyCMfpvtwOE-aDJhPA@mail.gmail.com>
References: <20241030181725.214754-1-jose.quaresma@foundries.io>
	 <18034DD8CF292769.12341@lists.openembedded.org>
	 <CANPvuRkm06vDmUuFieQLGUo+brfZh+BUo3AzKOQH-JHCCVXxVQ@mail.gmail.com>
	 <5058dcd07acb650e0add0d5d828d77c996fc509a.camel@linuxfoundation.org>
	 <CANPvuR=yRLzEK6G1RGQjMBOipkNiVWxWNyCMfpvtwOE-aDJhPA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 22:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206639

On Thu, 2024-10-31 at 12:12 +0000, Jose Quaresma wrote:
>=20
>=20
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu (quarta,
> 30/10/2024 =C3=A0(s) 19:40):
> > On Wed, 2024-10-30 at 18:19 +0000, Jose Quaresma via
> > lists.openembedded.org wrote:
> > >=20
> > >=20
> > > Jose Quaresma via lists.openembedded.org
> > > <quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu
> > > (quarta,
> > > 30/10/2024 =C3=A0(s) 18:18):
> > > > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > > > ---
> > > > =C2=A0meta/recipes-devtools/go/go-runtime_1.23.0.bb | 1 +
> > > > =C2=A01 file changed, 1 insertion(+)
> > > >=20
> > > > diff --git a/meta/recipes-devtools/go/go-runtime_1.23.0.bb
> > > > b/meta/recipes-devtools/go/go-runtime_1.23.0.bb
> > > > index 63464a1501..a9a4e2a044 100644
> > > > --- a/meta/recipes-devtools/go/go-runtime_1.23.0.bb
> > > > +++ b/meta/recipes-devtools/go/go-runtime_1.23.0.bb
> > > > @@ -1,3 +1,4 @@
> > > > =C2=A0require go-${PV}.inc
> > > > =C2=A0require go-runtime.inc
> > > >=20
> > > > +INSANE_SKIP:${PN} +=3D "buildpaths"
> > > >=20
> > >=20
> > >=20
> > > Send this as RFC mostly because of this.
> >=20
> > That suggests it will fail the reproducibility tests too :(
> >=20
> > We're going to have to address those issues really. I guess the
> > patch
> > gives us something to start with and collaborate around...
> >=20
> > Cheers,
> >=20
> > Richard
>=20
> I would like to finish this update but I have been very busy at the
> moment
> and I don't know when I will be able to get back to it.

FWIW, adding a -trimpath to the go_bootstrap line in do_compile in go-
runtime does remove a lot of the paths. It leaves one single path
reference in libstd.so in the .rodata section, I think corresponding to
GOROOT. I couldn't work that one out though.

Cheers,

Richard






