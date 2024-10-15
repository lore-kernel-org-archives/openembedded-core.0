Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9E5D1F9CE
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 21:01:51 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.8054.1729026101580722902
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 14:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DTFXPiJ0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d8901cb98so115230f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 14:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729026100; x=1729630900; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3UdABe+mdElLlcyClKKE2wkZKr/eN+xVmoWrZaqazu4=;
        b=DTFXPiJ0Tvunw6jLplYSkUPSM2vhNQiE2mlZSPoIu5nAUKxvzUpPmwIQ9PPyoYxsI7
         s7QDz8gecpHmKu7p/5N10tPlZ/MB4ndLKBLKrSVMJaWV/N3boB34F/dese7PlPn4bLn1
         QSdBQC21yF9mn6/rYQhGO1r1M/7NWwdA7UcCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729026100; x=1729630900;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3UdABe+mdElLlcyClKKE2wkZKr/eN+xVmoWrZaqazu4=;
        b=axeIjGolm9ZehJyauSiXl4OFAbJxmnWjNvL9qnj0y+aFjmkl43WrMNpr5fYelrttb3
         RPcp7MrRjR1iym06M8izVpgCFl/2OsCdBlDwUMXpY/wPSdqQlVopWpfC40Kkgabg3ntD
         vcsXU2WC+rr0QRucQecJBVax0RC/WbXxOLEKLW05odyIspGxE5JgXq1Z8Q41UZMRbCYw
         fNUdHthBD75G/+R5EZw/6JX9tIHSTVPLCFeKXM4oM67+YKiS+4nRUWV9YKVUURriQd2t
         l1L/2/i73RlOJezhhfLPtK0a5FfKBNnak/6Ru/awaA1Yg3PM3RKxJ8zA2O4DQAyBK7l6
         fXVw==
X-Gm-Message-State: AOJu0Yz9q6fqeusu9DkMjGTVBa4+XL7i3N868ldgOInbNcmK56JfK/7P
	6yOxuYS8/rlAV7fWrkmnMqrAAvgZ53N3+nAQR5M16G/H5tdLAnTpApc5hfczivw=
X-Google-Smtp-Source: AGHT+IH1OHwoGCyqUTDc0zMKsfv5u7YU3lS1S4v6kNVcQXX5rc/i2QC/biLM3sNNhywO0AFnuPGapQ==
X-Received: by 2002:adf:a111:0:b0:374:bcfe:e73 with SMTP id ffacd0b85a97d-37d552cdf30mr12809157f8f.28.1729026099666;
        Tue, 15 Oct 2024 14:01:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ca4b:46df:459f:fe11? ([2001:8b0:aba:5f3c:ca4b:46df:459f:fe11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa7a23csm2530745f8f.18.2024.10.15.14.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 14:01:39 -0700 (PDT)
Message-ID: <884bed91ca885d594970e2141a56576363436143.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/6] linux-yocto-dev: conditionally add coreutils to
 depends
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2024 22:01:38 +0100
In-Reply-To: <CADkTA4MGh=XDy+gCx7wYd-AvLCGweMFLTR_4hHQZ+tT36xUsDg@mail.gmail.com>
References: <cover.1728912923.git.bruce.ashfield@gmail.com>
	 <88eada332f5d3d00baf9f2cedf63460d80356032.1728912923.git.bruce.ashfield@gmail.com>
	 <453e16e5f843492aa7aac45e0311046729e4155b.camel@linuxfoundation.org>
	 <CADkTA4MGh=XDy+gCx7wYd-AvLCGweMFLTR_4hHQZ+tT36xUsDg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 21:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205948

On Tue, 2024-10-15 at 16:56 -0400, Bruce Ashfield wrote:
> On Tue, Oct 15, 2024 at 10:15=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Mon, 2024-10-14 at 09:45 -0400, bruce.ashfield@gmail.com=C2=A0wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >=20
> > > 6.11+ uses truncate as part of the build. While truncate has been
> > > added to HOSTTOOLS in oe-core master, it still is possible to
> > > build a kernel recipe newer than 6.11+ on a release that doesn't
> > > have the HOSTTOOLS tweak.
> > >=20
> > > We can test for truncate and condtionally add the dependency.
> > >=20
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > > =C2=A0meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++++
> > > =C2=A01 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/reci=
pes-kernel/linux/linux-yocto-dev.bb
> > > index 292897ce43..752d108bd8 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > > @@ -44,6 +44,10 @@ PACKAGECONFIG[dt-validation] =3D ",,python3-dtsche=
ma-native"
> > > =C2=A0# we need the wrappers if validation isn't in the packageconfig
> > > =C2=A0DEPENDS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'dt-validat=
ion', '', 'python3-dtschema-wrapper-native', d)}"
> > >=20
> > > +# 6.11+ uses truncate in the build, so we need to either have it in =
host tools, or
> > > +# build it ourselves
> > > +DEPENDS +=3D "${@bb.utils.contains('HOSTTOOLS', 'truncate', '', 'cor=
eutils-native', d)}"
> > > +
> > > =C2=A0COMPATIBLE_MACHINE =3D "^(qemuarmv5|qemuarm|qemuarm64|qemux86|q=
emuppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64|qemuloongarch=
64)$"
> > >=20
> > > =C2=A0KERNEL_DEVICETREE:qemuarmv5 =3D "arm/versatile-pb.dtb"
> >=20
> > This is for master so truncate should always be in HOSTTOOLS? I don't
> > understand why we need this there?
>=20
> It came out of a discussion to do a reference for people that are buildin=
g
> newer kernels on older releases (of which there seem to be quite a few).
>=20
> So either we'd have to bacckport the hosttools addition (which is likely
> possible), or I could throw together that reference of how you'd build it
> conditionally.

I think the addition was backported for scarthgap so we're good there.
The main question would be around kirkstone where this commit could be
more appropriate if someone were building 6.11+.

I'm find with having this patch around as a proof of concept but I
don't think it should go into master...

Cheers,

Richard


