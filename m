Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5099C7839E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 23:34:17 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id r136so7478861wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 16:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=tR86eNaRAGhsFaGzdw9ihSBYQAdewnnys/HBuycx/2Q=;
	b=JDVOzO8WblVfkmzdS34dDMV1Y7/2/HnFaiI1zCDbrhDwzY3R95ZbZWDRPwdi2+cWyV
	0ug0AWdv+DUqpiEMkYsVESrhjNAB5t1g2HcPHJBIkaWX1xYKMltN5sOnpt6+wSbmvu4x
	HjzdpOstRcllZ7N2OpdYPhAEsYKuEaDs10+mF4ZNWtgww9uKN43teGAQO5Xv6R6nGBii
	TfKhqfQXFY7MDG3NG04ew51OjckZn9j+T9whlvhrkzqjBCLs9TG92PhRVASSG6pFkEsE
	mnJYfVfVVT3bmWpvIniSNjAX7VTduQ9NCQHlRHUzKnxvOIGfsbe7mpV+GHx0A+5wFABj
	9FXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=tR86eNaRAGhsFaGzdw9ihSBYQAdewnnys/HBuycx/2Q=;
	b=OyX/fsi0NJXbnpZs0gRGLrYJJIX3rQimuq8stKDjjSl42W8yFwv9r09+t3o73HBfzp
	gRXVV3J027bdJYwit8kWMsADixoYlzeNUT7EobUWxDhhiZnXZ0wKnUvC+7m4M/+KsMti
	N4cdTUKczOTSSbAICAxIcNdO6X4y7k/jz/JMMMmWboI/Th6nmPmytkNGG+04kKDIrf9K
	E7ZGAlp4VFvSVwzTpj7z+is/wj7wfTVsEaw0VbvpKSOJ8Noj77/EjffOyT1Ux/DSDdxd
	s9ZslcaGrESI/kzLyvoBGO5ELFVo3s1/gpkbSbahTgoIzLSdgAeP7LirV2mQzMAqCJ3R
	0f4Q==
X-Gm-Message-State: AHPjjUi6V2N0UKv1G7rBxip8ychRAoahfJtrG6XIlK5f48/vnzMm3ixO
	MLlKZn38NvlTvBGbQIrpyaI=
X-Google-Smtp-Source: AOwi7QDNFPqly2thbcyw2MWlHgqMUPKzhbWSUYQGmeO3bxwM7mc+YY8zAEyoBX3azRggnNfXI3BnVw==
X-Received: by 10.28.168.69 with SMTP id r66mr4941280wme.2.1506123258963;
	Fri, 22 Sep 2017 16:34:18 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id q18sm320581wre.4.2017.09.22.16.34.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Sep 2017 16:34:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 23 Sep 2017 01:36:50 +0200
To: Marek Vasut <marex@denx.de>
Message-ID: <20170922233650.GA3670@jama>
References: <CA+chaQfdgGcWAc17f=epK8s3q1=h+voUUc4sNJSLdtu_5SbOfA@mail.gmail.com>
	<1095f2c9-3ff8-bf71-4b6e-707111a4445c@gmail.com>
	<20170918083915.GB3340@jama>
	<51b6874b-551a-3983-4002-77e166822521@balister.org>
	<CAP9ODKpiSEJqR47RnjV+EFBeo7gd3wEtAR398Pwn8HjCj93TEA@mail.gmail.com>
	<CAJTo0LbFHX_Wm_W2MteS=6XbJgqzZh-jtGZ_Bhu95kO8Nue+dw@mail.gmail.com>
	<20170918160610.GD17137@bill-the-cat>
	<a512c6ac-65d6-e105-8ce7-a2a387084dbe@denx.de>
	<500e4bce-840a-cd83-ef77-015ea622cbbe@balister.org>
	<ae60416c-a413-97d6-0702-f068304c1b28@denx.de>
MIME-Version: 1.0
In-Reply-To: <ae60416c-a413-97d6-0702-f068304c1b28@denx.de>
User-Agent: Mutt/1.9.0 (2017-09-02)
Cc: Tom Rini <trini@konsulko.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [U-Boot] [PATCH] u-boot: Upgrade to 2017.09
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
X-List-Received-Date: Fri, 22 Sep 2017 23:34:18 -0000
X-Groupsio-MsgNum: 103289
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 23, 2017 at 12:19:27AM +0200, Marek Vasut wrote:
> Agreed. So what is the conclusion here about this , are we updating to
> 2017.09 or not ?

It was already merged couple days ago:
http://git.openembedded.org/openembedded-core/commit/?id=3D340d413f678a4a64=
dfa060e8fe0ac721b73fed97

and the follow-up fix for u-boot-fw-utils as well:
http://git.openembedded.org/openembedded-core/commit/?id=3D73afabf8e69019f0=
8b424a06f3eafaab052b0606

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWcWejwAKCRA3VSO3ZXaA
HPRWAJ9rMxao+1EYA5wfzjnO6Wv+z84KAwCfUsfA/vAHEHneed/f+Umbf/n+Yvk=
=je8d
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
