Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 70EE77D2A2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 08:42:38 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id s16so14174449edr.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2019 01:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=am1L7jxmL3TnkZxeFuNXDAwWOvz3rhYQ03BTTzsk1sU=;
	b=lsvOkv8781OW0phDIugXBzVep1Rd0R75zqmQj3Gv6bW0erwbTK5LYAbcUIbsP0A6xR
	l4dCF0GbYE4B4QbpTIY6t4hNoBdEKJlhBQGqwiweGmNHukFI48rWc9Jr/O9Gj4mkN3zj
	m7+Osu5FTOnCTVZDq24Jh3AMwgVkMwAxFYIc2uTT8Ye2YumUCh9fTpk9bpH9Vu1D+a6B
	SRlyKu6xS0X5NFAE9EmKR7UI3iAxgMNrDcTtSZRgF8GLUc3QBdaYXfKLmnDnZ3gGzIzA
	RK8YraD23PvrkiRNDANPp/coA+nZtGEZrgb7AlOB5URJ70fKqBipWKpaGY5C+KR82BY1
	pdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=am1L7jxmL3TnkZxeFuNXDAwWOvz3rhYQ03BTTzsk1sU=;
	b=a/8+0GW7A1SBWVt3ZKCWc42ZE2UZ+IPuAyNLRAoz/FHOt2i1pdn0BSRfYR/tY8reMj
	vw9aqLN3rNcLhqPAxCpVqi3JOAcv0Fz+I7lfNRtk8RmDinDk0xMe4pGs7Z6+VFbMNGxw
	pn6wmt0BP346El0Lba1iU40MBDO+LA6qwRC1Ng/HYxUknjp3zA5I//AF/6ThBP5YhwFt
	jZJV7UBuYBH1oNcqo5DMb414sRYm3OO7RGSQhTgl9XmJ4E5ERxAsTbWSPy3YMcZRxQtW
	RFF3bUS3R4opD04wJLTsR4zmow/vwrxz4rOoIHdjXQBWadSvbXJk/HD7ToxnMMoK2Nct
	b6og==
X-Gm-Message-State: APjAAAVaAsKNmP1Ei94TmSQEZn5+mCPcnmTjfYYVmyfBJND5EQWkGVKr
	lgM7SipFoSeLMsNwHtTf3WA=
X-Google-Smtp-Source: APXvYqyT3Dg88vNzl3I78wUO4mlOyW4vk8XTkv4qcRlVj8yjJmMCoIejz9/BV4CP1i01ZvbcTyWetw==
X-Received: by 2002:a17:906:34d3:: with SMTP id
	h19mr19441324ejb.259.1554799359048; 
	Tue, 09 Apr 2019 01:42:39 -0700 (PDT)
Received: from ?IPv6:2a02:8109:b5c0:1267:50d1:a6a4:b006:f39b?
	([2a02:8109:b5c0:1267:50d1:a6a4:b006:f39b])
	by smtp.gmail.com with ESMTPSA id
	p10sm3431008eja.79.2019.04.09.01.42.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Apr 2019 01:42:38 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16D57)
In-Reply-To: <20190408205010.29163-1-open.source@oleksandr-kravchuk.com>
Date: Tue, 9 Apr 2019 10:42:33 +0200
Message-Id: <D8EBE7DC-8880-4FEE-9928-1A5143D1EF1F@gmail.com>
References: <20190408205010.29163-1-open.source@oleksandr-kravchuk.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ell: add recipe
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
X-List-Received-Date: Tue, 09 Apr 2019 08:42:38 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

You need to insert an entry for ell into maintainers.inc at the same time.

Alex

> On 8 Apr 2019, at 22.50, Oleksandr Kravchuk <open.source@oleksandr-kravchu=
k.com> wrote:
>=20
> ELL has originally been part of meta-openembedded, but newer versions
> of some of the poky components depend on it, e.g. ofono.
>=20
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
> meta/recipes-core/ell/ell_0.18.bb | 22 ++++++++++++++++++++++
> 1 file changed, 22 insertions(+)
> create mode 100644 meta/recipes-core/ell/ell_0.18.bb
>=20
> diff --git a/meta/recipes-core/ell/ell_0.18.bb b/meta/recipes-core/ell/ell=
_0.18.bb
> new file mode 100644
> index 0000000000..ca27f4dcda
> --- /dev/null
> +++ b/meta/recipes-core/ell/ell_0.18.bb
> @@ -0,0 +1,22 @@
> +SUMMARY  =3D "Embedded Linux Library"
> +DESCRIPTION =3D "The Embedded Linux Library (ELL) provides core, \
> +low-level functionality for system daemons. It typically has no \
> +dependencies other than the Linux kernel, C standard library, and \
> +libdl (for dynamic linking). While ELL is designed to be efficient \
> +and compact enough for use on embedded Linux platforms, it is not \
> +limited to resource-constrained systems."
> +SECTION =3D "libs"
> +LICENSE  =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfb504b67c50331fc78734fed90fb0e=
09"
> +
> +DEPENDS =3D "dbus"
> +
> +inherit autotools pkgconfig
> +
> +SRC_URI =3D "https://mirrors.edge.kernel.org/pub/linux/libs/${PN}/${PN}-$=
{PV}.tar.xz"
> +SRC_URI[md5sum] =3D "18e2be697a54811e49bbe34590a13a42"
> +SRC_URI[sha256sum] =3D "2c4c1a129f1b697e63ba3f63927dbae1482f6329b48c14a17=
48d9ab8ac4ee7e3"
> +
> +do_configure_prepend () {
> +    mkdir -p ${S}/build-aux
> +}
> --=20
> 2.17.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

