Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 801C17C731
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Mar 2019 14:41:47 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id 10so723790eds.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2019 06:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=7+inHhHTu3lDtfTocE8aABSngt0u1l19ZCpFHknatKE=;
	b=fKfzFMTmbLI/qebLd6BtiLrGH4IaByAyCyUL4VmtMDXVtK+3uEjHvql4vAbooHc7Qa
	qM7rKHBN5V3/wDXw0kzOIWFJccrDeQFMr54vbfEeOm5VY9D+RCoqev+w1oq9xHzgSoAt
	jPJY2x72cBOUThSHC5XFnf59E2C0bS3jfxd7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=7+inHhHTu3lDtfTocE8aABSngt0u1l19ZCpFHknatKE=;
	b=Kmsqb+Z2PE9gJ4Io3Ca1BGeBPuS/qxCtGgUhDrHAVbAu87wtuz95QOhtWNDqglQc0l
	5ntxl5WYfeMuNNC7b+vF6ur6HChBBxXzf4C4OfN2Dh16UxCxdjfD1rwAlZjrtHBIAEFt
	hv/TpoqaidZT0HI5jkx6q4LLQib56RL299318wAVcgzT3fUI7ke5zb5DeTVEZjNqGx8t
	QON4HdEvw/5U/Mfj1gNKlAYZ6gOYC5vgONdrvPCXq7EdVQnTXG5IdGFbVHVyK3Pm7EoS
	Kn8kcdZLpyTepFpOgHHOCUANkBNaT6VduH5k1ofFxF+yb+jySa6VtMTR12iyD+HVRFqS
	Gubg==
X-Gm-Message-State: APjAAAUMrCi9Ix8XqtXQ46e9xwceqKWQvfAIkJCVVOD0aRKUxdpSTEWa
	+WlUU6xTfIIpbEOOA99P4fLBsxy93BA=
X-Google-Smtp-Source: APXvYqzp+bHd1Xq7pYtWGE1/cFjcjwNjp+DH78avKDMJFCFVSwy0Q+ljDZOKI2ZKVvnSH/x3ZkypIg==
X-Received: by 2002:a17:906:1ec5:: with SMTP id
	m5mr6646008ejj.159.1551537707637; 
	Sat, 02 Mar 2019 06:41:47 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-118E-86C-E9FB-6784.dyn6.twc.com.
	[2606:a000:1401:880d:118e:86c:e9fb:6784])
	by smtp.gmail.com with ESMTPSA id d19sm160482ejb.31.2019.03.02.06.41.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Mar 2019 06:41:46 -0800 (PST)
Date: Sat, 2 Mar 2019 09:41:42 -0500
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20190302144142.GG5026@bill-the-cat>
References: <1551479212-28944-1-git-send-email-trini@konsulko.com>
	<1551479212-28944-4-git-send-email-trini@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <1551479212-28944-4-git-send-email-trini@konsulko.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 3/4] packagegroup-core-base-utils: Introduce new base-utils packagegroup
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
X-List-Received-Date: Sat, 02 Mar 2019 14:41:47 -0000
X-Groupsio-MsgNum: 121828
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TeJTyD9hb8KJN2Jy"
Content-Disposition: inline

--TeJTyD9hb8KJN2Jy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 01, 2019 at 05:26:51PM -0500, Tom Rini wrote:

> This packagegroup is intended to provide all of the functionality found
> in other VIRTUAL-RUNTIME_base-utils providers through full packages
> rather than an all-on-one package.  Document how to make use of this
> in local.conf.sample.extended.  Introduce VIRTUAL-RUNTIME-vim and
> default this to vim-tiny to allow for a differently features vim to be
> used instead.
>=20
> Signed-off-by: Tom Rini <trini@konsulko.com>
[snip]
> +    inetutils \

One thing I forgot to double check until now is that inetutils does not
work as a metapackage and pull in everything else.  When I post v2 I'm
going to add in a few more sub-packages to match what is/isn't in
busybox.

--=20
Tom

--TeJTyD9hb8KJN2Jy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcepYlAAoJEIf59jXTHXZSkoQP/3XEy2IwFJ/NMMqAPEVuVlPz
pNi/cJRvd8bl8o2hjEOA0TcgzLDE/xspHTYfoDiesHg3Ehg4KDa0/1E6gpss9G3W
aLgqwzDnIBvPm3Kfju/I1hP/c99d/BK5MIvBgODcsAY8HSl5yO92PPnFEDUjuhqP
mhYmAbOdE4lKv3rV0xrQVvNp2vZ59cQeltuNg/tzcpbsat+beN39AY00SMRgvjlE
KhQAsdt2r3vgDzu9LkfJA65ur6tlz2FTatom6QY04SnP1000awpu/AyLmVmtLWhx
tYvha+45frvBRMQ7UEIIwBtm9w20EbQvVIiRMx7xelV9+gPx/FHnqexEPUVd2RrG
YC1QkhZwsDmcsOTETh1GBOas2wu9cAuSMHnK+anA+HO7Pt5n3T1C/IaDggzFu9f2
2xcAsIB3WsbvVy4AT/cHuajKpa8BEdyMaxnKwJXYmmnMTp1tV20vMVgywGkb6J1X
S66B0gDcgvU222Bns/ijT+8kaUWK+MOQ3QLMOVKlbow5UrvcxqtI7ACNDRbESoPl
+Z6BIPU9lvzGvTYQa9IT667uVEo46Soqt3etw6KpgbmmigW9WD5ErRcxm4etTzly
49eUygp+zNo8G6rb/7OpkdhHVfeyxCRIvaN3v6BwaFjpESzTi35ZcMKLLYpwcxzi
eXSgArE76Gyjl+zdwT4A
=/mjg
-----END PGP SIGNATURE-----

--TeJTyD9hb8KJN2Jy--
