Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A07C0219B
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 16:21:51 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.55434.1739204502148432740
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 08:21:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fhbDsb1L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4362f61757fso45540485e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 08:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739204500; x=1739809300; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymG4S8pIpie9PxbSorZ/WMQNDdRX5jHqY+lGd81unME=;
        b=fhbDsb1LEs8ucFeXF88fMvmLK/xP+EryKrGMb8FdeiRp9UPi4rvMtB1c4/id4S68vz
         GH2h/w8vbEUXHcjvKM2QCkvDRx4ZMUskq5GfxCeQCXOlW88Ry5yPZF/fvZUpeoN0v7sA
         PW66m/Z17YAxzcIi54HuGvd0rwmU1D6cTPVlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739204500; x=1739809300;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ymG4S8pIpie9PxbSorZ/WMQNDdRX5jHqY+lGd81unME=;
        b=aSuLtMC/t94ChNJ1JuhNfAWLqN650AYiuiNRrA/OVjR4BijtEKgnwDfbF5ZoihL+JL
         3ePecw9pRE7oDfcvD2yXBtO3Jf9A7xz0RjtDLq5/Jy5AQQrnmaLzmlNAmaqPwMgT004v
         HjzkF2N+uCLF0eI62V9wdRrUC5FX4o/vPPGNu2kL1shT3pQBn+lQ6C7CwGPif/uGCa9F
         rFQt5TOgn711Wirvgh5q+cv0Egl8Tyy/14YTVa0AsaQQ45F5R00vZXKZcRser/DhXCJ4
         zsr0V2nQr04Yz8RkaRFSAaGYAzuc2qA6RR298YGhflWwJ6O/VtyC2bhqNXPMF/jvtYwR
         1O3w==
X-Forwarded-Encrypted: i=1; AJvYcCWh9UaUF7d2D8W++Es6N0MawKX6eS4M6/mmlMzIwK5Hx/mB27MLhOClwpVDnaW3AMu6b0uV2ewV2h6qtN/AOzvuJQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwxP0vySN4cF+/H5zSa80q62z951nxh2Q8m65CP5ojoCwna9Z0R
	zCc7lBkUn32HLvFrvhks56XXZKH4cdCMty0LVqlK+BjQBB/i0iXjoF1eIPR7O6fpBrtYjvudb+Z
	l
X-Gm-Gg: ASbGncsdsH1fSi6AIeUDlOpypulY16f/6enlPsgakqXgUe2r/7vmLUAaJ1loAWj5m5b
	xIYpMIqH/ofQKi7C8n18SNEqXLyqcjYAnGFVmPthcTyJup42WbSJQ70sJA8lrnIhdZy51R3TC+z
	zGIf8/w9MRPDKe0q7C/s6jp7Jhp/QFCTzlhrhWFCJjg+LNdookfDyqNjUE9OzziarvbXXh4Arkc
	YVa/N8SHJL0PTJKicPh6G+AmKaSnI+kFBQ29YVsbsFhU/KYDsc45zQab4KjhgXSjs01XxyP4vGa
	EcbOrVevS41EKlSi5PYnXlaeYw6z9LeoI719XFdfmPM8QXjr8ZqDiwwxPC3yw6WPNSbCie7PLao
	KVw==
X-Google-Smtp-Source: AGHT+IFkOUUrc+xvJFA+k9eOaC3X7ti+JjXJzVczoRXXnaeBegrJ2NoOQMYzongP1ejUVCwVOWfaMw==
X-Received: by 2002:a05:600c:4e89:b0:439:45ce:15e9 with SMTP id 5b1f17b1804b1-43945ce19a1mr26446425e9.26.1739204500617;
        Mon, 10 Feb 2025 08:21:40 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d33a:26d6:1846:991? ([2001:8b0:aba:5f3c:d33a:26d6:1846:991])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dca004esm148286885e9.13.2025.02.10.08.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 08:21:40 -0800 (PST)
Message-ID: <1745112bfecddf072b229f0c0b26fcb3d96fc053.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gdb-cross: remove duplicated PACKAGECONFIG
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ecordonnier@snap.com, openembedded-core@lists.openembedded.org
Date: Mon, 10 Feb 2025 16:21:39 +0000
In-Reply-To: <20250210154958.1119250-1-ecordonnier@snap.com>
References: <20250210154958.1119250-1-ecordonnier@snap.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 16:21:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211104

On Mon, 2025-02-10 at 16:49 +0100, Etienne Cordonnier via lists.openembedde=
d.org wrote:
> From: Etienne Cordonnier <ecordonnier@snap.com>
>=20
> Duplicating the PACKAGECONFIG variable in gdb-cross and gdb-common makes
> it easy to forget updating one definition without updating the other.
> However at the moment there is no need for two different definitions.
>=20
> xz is also useful for gdb-cross when minidebuginfo is enabled, so it also=
 needs
> to be in the definition of PACKAGECONFIG in gdb-cross.inc
>=20
> Let's remove the definition from gdb-cross.inc to make maintenance easier=
.
> This enables xz for gdb-cross as side-effect.
>=20
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
> =C2=A0meta/recipes-devtools/gdb/gdb-cross.inc | 1 -
> =C2=A01 file changed, 1 deletion(-)

At the very least this commit message needs to be a bit clearer as
there is a change of behaviour here.

To be clear, this change adds:

${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'xz', '', d)}=20

to the default PACKAGECONFIG for gdb-cross. You can't tell that from
the patch.

I'd also mention that there is still a different definition for gdb-
cross-canadian and if we do this, they should all probably match.

Whether we should do this, I'm unsure. It might be worth just adding xz
unconditionally at this point by default to be honest, it isn't a huge
dependency. gdb is a debugging tool, not for a minimal system.

Cheers,

Richard

