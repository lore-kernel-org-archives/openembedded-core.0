Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id C34F36AA07
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 08:39:00 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id e49so1201567eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jul 2013 01:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jTebzNGHqwXO2fUvatAM1dRIMBkuKYV0XZ48neYpwt8=;
	b=WZmZeHuhWzLSPRLsW+hdidYPRKvaOCh1qLuO+OHgk7sLOm7xVcszf/0GgEWStXyKXc
	s0IZoYJ6Qqj27eeap5BQBtwVHeYZ+NQsCAagbSfoYWrw27VNkPuYqeU5hJADil4TOqVu
	rBRfS/OzHgD6w28rR+WcoPkKrTKvMsy4mhm43K+9b0GDsS1WLnXk3nqj/UNoqHbMafrW
	64wxA6bcKNDHoPubEQ1E2qehqruXf6aUQb0URvE5BX+3hLjkFYr5R0j3yidrrTse8fA/
	u1xbcUqnhDHANlvrSWo8lCuVeLGcR6Dp4rHDKg7mwEU9zje1sP0wWmiF5BpQ18dHnHlB
	JMTA==
X-Received: by 10.14.216.73 with SMTP id f49mr10786553eep.119.1373013541222;
	Fri, 05 Jul 2013 01:39:01 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n5sm12124374eed.9.2013.07.05.01.39.00 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 05 Jul 2013 01:39:00 -0700 (PDT)
Date: Fri, 5 Jul 2013 10:39:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Qi.Chen@windriver.com
Message-ID: <20130705083905.GD3259@jama>
References: <cover.1373003615.git.Qi.Chen@windriver.com>
	<341a64b50c13dec0bf01feb5c74d5b32815a7191.1373003615.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <341a64b50c13dec0bf01feb5c74d5b32815a7191.1373003615.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.bbclass: add a method to add/delete/modify user/group settings
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
X-List-Received-Date: Fri, 05 Jul 2013 08:39:01 -0000
X-Groupsio-MsgNum: 41505
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lc9FT7cWel8HagAv"
Content-Disposition: inline

--lc9FT7cWel8HagAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 05, 2013 at 02:07:28PM +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> We may want to add a user or group which does not logically belong to
> any specific package. For example, we may want to add a user with the
> name 'tester' to our image. Besides, we may want to delete or modify
> user/group in our image.
>=20
> This patch adds a variable, USER_GROUP_SETTINGS, which is dedicated
> to these tasks. The configuration format is detailed in the local.conf.
> sample.extended file.
>=20
> This patch also adds a function, set_user_group, which happens at
> the end of the ROOTFS_POSTPROCESS_COMMAND. It handles the settings
> in the USER_GROUP_SETTINGS variable.

Why not use extra package just with user?

See "[PATCH v3 0/5] Allow xuser to shutdown (cover letter only)"

--lc9FT7cWel8HagAv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHWhikACgkQN1Ujt2V2gBxOGACgo74/ZJN8p9nGtfL1atM4be+v
sfQAmwb7tsXU6yqsOh8BUOHktmlyHkrH
=yz0B
-----END PGP SIGNATURE-----

--lc9FT7cWel8HagAv--
