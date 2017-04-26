Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2C7E373081
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 18:04:31 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id z52so4500278wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Apr 2017 11:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=6Pxerzbn/zzl9S8mXOtkWuE3HBsaipnvNip/MIyvyto=;
	b=kELzcFEbO37L6irPRlFm9b4BPElCkvR9vkO8RXauWP8GGUwuGRO23Jigs9A9HsNpJa
	9JLXmDJAn2FtmFEcmK1N/8bhLsBwiN/S+v4xpGtadh1efDr7o3f+qnt/7qjPZJMV2hZa
	uo/GD5PY5URJXTvGJdgkZEYhurk5NKK5tacOeFExXdyMzJ8x5NG2oiLQNpWe0c8LI1Ps
	DGsM1006Yzab/3frkEhqFKu/SxWGSfXfzm4bgG6cKsUdpYUTDot8zcElYdLI1LN+XF6w
	aEEpJ4EQfQL4KgANQj8QFCmJ0CvxVXAK1meb3yS3wrHf53k4hmii4lJKi2ZlZA8LCPxg
	+kKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=6Pxerzbn/zzl9S8mXOtkWuE3HBsaipnvNip/MIyvyto=;
	b=Rso79hygI2hxFLQ//yYRDYOuF1JWs+cTfJOpyQjQOgCkgKRH4twtb9W6NK8EPJLnd9
	wd1jhkT1T2lQyv2631DiND0zZ9GIAWIXKthYhAD8OMpGacjdk/ni5GqX0yvipEmXrcvN
	FpTLpX0f/xkJ/7d+Vk9C8+QUxpVRvQOYzelkV4hsUAOc3z6edaAifurXpNVzHBsPkIPe
	H22I3o6f4a9d2W6xZN+x3cmTCIuBX4RtVvM4AYds5TJ7yhlYuuXeb9WzjIeLJ2HdyNA/
	pPIqQEkimCO1HNronLr/WJzx75q66vcQEBycl4aJ97ZKi3/3FdomujX7V7dQrtMhqH5p
	b7sQ==
X-Gm-Message-State: AN3rC/7jxf4Jnz4JPNE58uR5r/lLsyCuYLXuDDHlHnMGcxL3J9T/LM+n
	vfCp/5QI/evTl3G2
X-Received: by 10.223.169.226 with SMTP id b89mr857549wrd.100.1493229872649;
	Wed, 26 Apr 2017 11:04:32 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	u145sm6204389wmu.1.2017.04.26.11.04.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 26 Apr 2017 11:04:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 26 Apr 2017 20:04:48 +0200
To: openembedded-core <openembedded-core@lists.openembedded.org>
Message-ID: <20170426180448.GD3258@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.8.2 (2017-04-18)
Subject: Wiki permissions changed?
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
X-List-Received-Date: Wed, 26 Apr 2017 18:04:32 -0000
X-Groupsio-MsgNum: 96722
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4zI0WCX1RcnW9Hbu"
Content-Disposition: inline

--4zI0WCX1RcnW9Hbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Were there some changes in wiki installation on
https://www.openembedded.org/wiki/ recently?

Today I cannot edit pages I used to edit regularly, e.g.
https://www.openembedded.org/wiki/Bitbake_World_Status_Pyro

I can Log out and Log back in, but still there is no Edit button
anymore.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4zI0WCX1RcnW9Hbu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWQDhPwAKCRA3VSO3ZXaA
HLiSAJ0THvZtly5YHWb5jZS9XM9Fhpf6nwCgi6yqyYZAVt5jRmCpURopGLwR/Fk=
=dL0l
-----END PGP SIGNATURE-----

--4zI0WCX1RcnW9Hbu--
