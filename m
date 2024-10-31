Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E83E67482
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 20:36:10 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.22745.1730406961228473692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 13:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CMMqpbO+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso11830565e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 13:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730406960; x=1731011760; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H5SPF2PpLokHcYpYs9j0lWFewl8NkulbUrcSKX+CIt4=;
        b=CMMqpbO+R88vbM7nB6OfCAIdWxv1YwxYsfG6cIHXtF05GcQOtCFJWJTblKU9smxkir
         o+Hp3qo7wPo4Re+YPWYWOuzDoYbcx8uBIAmRrHiKQl5TyFxEJKaln3aGX2plO+oaCHGq
         Uwo5dFx0BSaaIKVtMAeTvD/pAtiMHZZF1myYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730406960; x=1731011760;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H5SPF2PpLokHcYpYs9j0lWFewl8NkulbUrcSKX+CIt4=;
        b=VvjM8LE7Ud6GleWNGH+f0GPXjWdappeqxqm/PhVNKBX04o2t9qlrfLtVVn9o8CDPIQ
         or+js98fDX+PHLfnOKFmP12Z6MVb7V1IyTDYokmAniPknLvUgJeMgEGhxFCgIx3QXeSM
         dWy4nSUol1xyj0uw4EMJppaM/wfo0d/UqDDEgMAaURHGqfHvi+zJbe8q14dCCPo1ITF8
         i+5tNFa/0koHMMOqnHvdXIQ0+6jJLR3dXRJQJ7NhVCV+rdffdSK09dtTo4Wyh59y8m0j
         SZxSn/6bYkMRygDHhxSGhwUsN7M9Bqar3Cd+bJGDhLE2jaKhyy9jV1OEAF68a4h7mVGu
         GhDQ==
X-Gm-Message-State: AOJu0YxYrSN2sAQQbSoPKcKOHcfJxwMkc6xR3pNMxnyhMwsl5CMJRSoN
	P6T1TxzvprrCJ3vKE35nFGKntK3IEAYEgB9R3Ae+ZmIaGBbPlT8CEe1FWWIfJd0=
X-Google-Smtp-Source: AGHT+IETfTh1OEoZPdHuHiRd1kndtnp1d9aOyzHsDwLD6TxdWinEU5aZgCzIeY1HY1DVWsykGTUI7g==
X-Received: by 2002:a05:600c:4fc3:b0:42c:bae0:f05b with SMTP id 5b1f17b1804b1-4327b6f46c8mr44316415e9.1.1730406959475;
        Thu, 31 Oct 2024 13:35:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3ee1:1135:b938:d59c? ([2001:8b0:aba:5f3c:3ee1:1135:b938:d59c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9ca747sm67624695e9.45.2024.10.31.13.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 13:35:59 -0700 (PDT)
Message-ID: <d27663e9d25633fe0206b0cd14c58b1f89443334.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ppp: Add pam and openssl via packageconfig
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: danismostlikely@gmail.com, raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2024 20:35:58 +0000
In-Reply-To: <CACS+7ZT1OXBT3tOtGhEpn2SbgAWAsus74UD9v=yD2urh255VQA@mail.gmail.com>
References: <20241030225457.1522289-1-raj.khem@gmail.com>
	 <CACS+7ZT1OXBT3tOtGhEpn2SbgAWAsus74UD9v=yD2urh255VQA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 20:36:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206595

On Thu, 2024-10-31 at 09:53 -0600, Dan McGregor via
lists.openembedded.org wrote:
> On Wed, 30 Oct 2024 at 16:55, Khem Raj via lists.openembedded.org
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >=20
> > Explicitly enable pam support, otherwise it goes into
> > detection mode and ends up poking at build host
> >=20
> > Turn openssl into packageconfig as well
> >=20
> > cc1: warning: include location "/usr/include" is unsafe for cross-
> > compilation [-Wpoison-system-directories]
> > conftest.c: In function 'main':
> > conftest.c:68:1: warning: argument 1 null where non-null expected
> > [-Wnonnull]
> > =C2=A0=C2=A0 68 | pam_authenticate(NULL, 0);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^~~~~~~~~~~~~~~~
> > In file included from conftest.c:63:
> > /usr/include/security/pam_appl.h:38:1: note: in a call to function
> > 'pam_authenticate' declared 'nonnull'
> > =C2=A0=C2=A0 38 | pam_authenticate(pam_handle_t *pamh, int flags);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^~~~~~~~~~~~~~~~
> >=20
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > =C2=A0meta/recipes-connectivity/ppp/ppp_2.5.1.bb | 6 ++++--
> > =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.1.bb
> > b/meta/recipes-connectivity/ppp/ppp_2.5.1.bb
> > index 5b8c49ca850..2b917905b24 100644
> > --- a/meta/recipes-connectivity/ppp/ppp_2.5.1.bb
> > +++ b/meta/recipes-connectivity/ppp/ppp_2.5.1.bb
> > @@ -4,7 +4,7 @@ the Point-to-Point Protocol (PPP) on Linux and
> > Solaris systems."
> > =C2=A0SECTION =3D "console/network"
> > =C2=A0HOMEPAGE =3D "http://samba.org/ppp/"
> > =C2=A0BUGTRACKER =3D "http://ppp.samba.org/cgi-bin/ppp-bugs"
> > -DEPENDS =3D "libpcap openssl virtual/crypt"
> > +DEPENDS =3D "libpcap virtual/crypt"
> > =C2=A0LICENSE =3D "BSD-3-Clause & BSD-3-Clause-Attribution & GPL-2.0-or=
-
> > later & LGPL-2.0-or-later & PD & RSA-MD & MIT"
> > =C2=A0LIC_FILES_CHKSUM =3D
> > "file://pppd/ccp.c;beginline=3D1;endline=3D29;md5=3D1bea10e81fc6f2df105=
b1
> > f8b733cb149=C2=A0\
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://pppd/plugins/passprompt.c;beginline=3D1;endline=3D10;md5=3D3bcbc=
dbf0e369c9a3e0b8c8275b065d8
> > =C2=A0\
> > @@ -29,7 +29,9 @@ SRC_URI[sha256sum] =3D
> > "733b7f5840b613da4eab0429a5081293275f06ba8b528e1b8eea6964fa
> >=20
> > =C2=A0inherit autotools systemd
> >=20
> > -EXTRA_OECONF +=3D "--with-openssl=3D${STAGING_EXECPREFIXDIR}"
> > +PACKAGECONFIG =3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}
> > openssl"
> > +PACKAGECONFIG[pam] =3D "--with-pam=3D${STAGING_EXECPREFIXDIR},--with-
> > pam=3Dno,libpam"
> > +PACKAGECONFIG[openssl] =3D "--with-
> > openssl=3D${STAGING_EXECPREFIXDIR},--with-openssl=3Dno,openssl"
>=20
> If inherit pkgconfig, we can avoid explicitly pointing to the
> installed path for openssl and libpam, otherwise this is a good
> substitute for my original patch.

I do prefer the pkgconfig version FWIW. Could we have that and the pam
filtering in a combined patch please? :)

Cheers,

Richard

