Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id C13877D1A4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 07:35:01 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id w1so15246528wrp.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 00:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=hczseSTrTNI4Uv64Y2AcoQbIf+7Q3AxOJfZ5KObUcEI=;
	b=L5JxW5EUkBHu4iTctj+RsfjWLXLNFmHPpc2qkJxUpkMgdANQA3JoQ35DwYcoI8bce4
	gkA8AlTHC9XcfvZu/rQhIRNzg9yxb5Mx8MT3DfdEJ8du7LX1UiEjFpDySWhTxcDTpCkp
	zDkNFOg5q92kd4gauiX9z18MqMYCMEy5+y0relrorbIozNjhrHSmVFmO5gbJESGnKczT
	40r/AnyAD+eADlrbroSE+h6JRxzbfJpTaPXdWFp7IoWibgJ3V36Pjh4xe0MYCwO5AREZ
	nj0omfYXFYSvtjB5Df7gEapPnSJ6FDm10uPeKbv7a/tYqfm2Jp4yX61R8zB1d3+SBzc4
	aRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=hczseSTrTNI4Uv64Y2AcoQbIf+7Q3AxOJfZ5KObUcEI=;
	b=kga3lBkyxlb0kiRj6SqFholbh0pBP4FXaK3+/D9cS78xFr/RrhpfcR2s/nhqESWnw/
	waEhyzGPHm+epbUcHbqjdlSzztUEzGvsZClwCNqUetKn3bpE3vth4P90xdtU1CgyyaD4
	FC5edh4y8ubp0kSy1jKqe+j0WnEUmNke0C30z7PtWbcHeYR7mdcry6q00gcYoRvEH8Bo
	zWzC3KA53rlItOEYV6VXSLtcwEpiWhSbKHE6JHgjT2QgvZe6t1QUrt6aa64qkOhfCkCf
	S4TGjabskvmvJ4+c/70u9WfEJc4nW9/JmXycTsRvh9FECEqIcOXWS/HIY1tYAdf2enmo
	+gbg==
X-Gm-Message-State: APjAAAVY2iaGQdsNN/kGg7QaJKZoYpuUtQK0/lNDhZfJ8rBmtEAa+n3k
	FaR3mhoeh937b8U6LtNARZY=
X-Google-Smtp-Source: APXvYqxAwMDlR6xkZZFbh64lxtRzy55jnPqG/utgjA4+ocIR9HDETLRSFaZWT32QlSlAyv0dENmYqg==
X-Received: by 2002:adf:cd90:: with SMTP id q16mr42827346wrj.75.1554190502531; 
	Tue, 02 Apr 2019 00:35:02 -0700 (PDT)
Received: from [10.128.45.74] ([141.113.67.87])
	by smtp.gmail.com with ESMTPSA id
	g132sm11911598wme.3.2019.04.02.00.35.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Apr 2019 00:35:01 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16D57)
In-Reply-To: <20190401222843.31010-1-schnitzeltony@gmail.com>
Date: Tue, 2 Apr 2019 09:35:00 +0200
Message-Id: <51102B42-911B-4DAD-AB62-7C56061ADCA6@gmail.com>
References: <20190401222843.31010-1-schnitzeltony@gmail.com>
To: =?utf-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] glib-networking: remove PACKAGECONFIG for gnutls
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2019 07:35:02 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

This option was re-instated in 2.60, can you add a comment to the recipe ple=
ase? So that when it=E2=80=99s upgraded, gnutls is again optional.

Alex

> On 2 Apr 2019, at 0.28, Andreas M=C3=BCller <schnitzeltony@gmail.com> wrot=
e:
>=20
> * with patch suggested in [1] build complains with:
>  | ERROR: glib-networking-2.58.0-r0 do_configure: QA Issue: glib-networkin=
g: configure was passed unrecognised options: gnutls [unknown-configure-opti=
on]
> * it turned mandatory - see meson.build:
>  | # *** Checks for GnuTLS     ***
>  | gnutls_dep =3D dependency('gnutls', version: '>=3D 3.4.4', required: tr=
ue)
>=20
> [1] http://lists.openembedded.org/pipermail/openembedded-core/2019-April/2=
80693.html
>=20
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
> meta/recipes-core/glib-networking/glib-networking_2.58.0.bb | 5 +----
> 1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb b=
/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
> index f3190e1cae0..a4138d67cc6 100644
> --- a/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
> +++ b/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
> @@ -7,14 +7,11 @@ LICENSE =3D "LGPLv2.1"
> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b364516=
c"
>=20
> SECTION =3D "libs"
> -DEPENDS =3D "glib-2.0"
> +DEPENDS =3D "glib-2.0 gnutls"
>=20
> SRC_URI[archive.md5sum] =3D "75b14b7e73a67753be9ce307751c661d"
> SRC_URI[archive.sha256sum] =3D "bdfa0255e031b8ee003cc283002536b77ee7645010=
5f1dc6ab066b9bf4330068"
>=20
> -PACKAGECONFIG ??=3D "gnutls"
> -
> -PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
> PACKAGECONFIG[libproxy] =3D "-Dlibproxy_support=3Dtrue,-Dlibproxy_support=3D=
false,libproxy"
>=20
> EXTRA_OEMESON =3D "-Dgnome_proxy_support=3Dfalse"
> --=20
> 2.20.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

