Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 383E975070
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 21:32:07 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id p5-v6so6579165wre.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 14:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=EDadzVtK4HDfENkh1JPmYy+KcZtr9b8vdTSKlb5E+ks=;
	b=sTAOV/uKqGs+HuO3vqqfhS15bpzBpmUZYtvbaltpO0Da+KgrcA28VsmoocRcJAMKJz
	8949fZnoIYMVu97q28yW5oeuuMpzwrmZYmnWWgH8/1CMgbZdioqmNqtMLtvaQHict4rQ
	Bbeeyv6cVBkOpWuVtNcw55BkHf935g4jOzdroGmAGwF1KIn+irXtDUmoxlEjk35GLQx/
	VwPDZYHW7r5J8if7yeCn0BLA2Cnl7CHLm5f/oOt8FmXj1kyVEYrt7VBCk94e8RDqRzk+
	URdnfye7RSoJF4ULE6QN2sYqV7ZIAtveri7IrIhHtKQzybeIi6tIWbDGcKQnhEsUiIoC
	KKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=EDadzVtK4HDfENkh1JPmYy+KcZtr9b8vdTSKlb5E+ks=;
	b=ch2sly9tAKJf0/tByC8ukkujDazYv/lctqZ06YtfKqkJochsPHlZ/eEMH3PTXKH0rU
	2ADW2j1tovs5L5i+tMP2I9Cy/gmwahH4YC9X1ZyQ20fdLUBRVwTaBK46KuCtU0t+bHDl
	U0ERLoj/zwC4SuyGO3mJ7nH+7O5+f+/9fs2m+BL9/DHuolr1t+AgscHy6od7zge1Pcm8
	/aCEtnF8d++baEKUxrnhop/UT+IiNk2NeAKIB+/HfBYt5d23M0oosgZqwOUuQP3Um8Gc
	MzbO2KylBQuqU9RXBWaCiCAm+TYsBAxHhueMKge0yVqSp7x1ahF+hSdW9alo1QSu1LS+
	8XLg==
X-Gm-Message-State: ALKqPwdMPNlIS1RnHBrorIU9I09oBPDqms53og20YmKbA7qpAe7wnj0X
	uUS6W74F/9f9cofsptNykwc=
X-Google-Smtp-Source: AB8JxZodXcLIUTAG0ZcxePvR+gfYi/fe6cVU6WPdjmQ+E/0lwACdINIabXg/I9pdLxYSl/sEQQL2iA==
X-Received: by 2002:adf:e38e:: with SMTP id
	e14-v6mr421870wrm.198.1526074328533; 
	Fri, 11 May 2018 14:32:08 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b105-v6sm5330300wrd.64.2018.05.11.14.32.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 May 2018 14:32:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 11 May 2018 23:32:10 +0200
To: Chris Patterson <cjp256@gmail.com>
Message-ID: <20180511213210.GC2141@jama>
References: <1526056553-31049-1-git-send-email-cjp256@gmail.com>
	<CABcZANm1CMZkm+fkR+o_9DejzS=3bzj4XvM1zVd_zsVTY1YZAw@mail.gmail.com>
	<CABZSBQeN+mx7Y8oQ8fhPf=xeuqLa2RpjwHLkVAPD2qoSzvzQMg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABZSBQeN+mx7Y8oQ8fhPf=xeuqLa2RpjwHLkVAPD2qoSzvzQMg@mail.gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: Chris Patterson <pattersonc@ainfosec.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: add gettext to DEPENDS
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
X-List-Received-Date: Fri, 11 May 2018 21:32:08 -0000
X-Groupsio-MsgNum: 111323
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pAwQNkOnpTn9IO2O"
Content-Disposition: inline

--pAwQNkOnpTn9IO2O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 11, 2018 at 05:21:09PM -0400, Chris Patterson wrote:
> On Fri, May 11, 2018 at 3:10 PM, Christopher Larson <kergoth@gmail.com> w=
rote:
> > This is not a correct fix. We have a gettext bbclass for a reason.
> >
>=20
> I did look at that prior to doing this.  It was my initial approach,
> but inheriting gettext causes qemu build to fail when it modifies the
> EXTRA_OECONF options with the nls flag (that qemu doesn't process).
> There are quite a few other recipes using gettext-native in their
> DEPENDS, and the reason for one over the other isn't quite clear.
>=20
> In the other thread (v2), Khem requested it only be added
> conditionally if the gtk packageconfig flag is enabled.  Do you think
> it would be appropriate to check packageconfig flag, then
> conditionally inherit, then resolve (scrub) the unsupported configure
> flags? Or modify the class such that modifying the OECONF is prevented
> to begin with?

Are you using gtk PACKAGECONFIG for qemu-native (or nativesdk-qemu)?
Last time I've tried I've found that there are many things missing to
make it usable, see last few commits at:
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/qemu

I haven't tried gtk(3) for target build, it probably works better there.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pAwQNkOnpTn9IO2O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWvYL2QAKCRA3VSO3ZXaA
HE5iAJoDfbVEiOfCulZEACKVwE8TogWYEgCbB1oBaQZ1hmuxr3TDGz40kt7KDPQ=
=fjrA
-----END PGP SIGNATURE-----

--pAwQNkOnpTn9IO2O--
