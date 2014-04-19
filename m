Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4B70965D7C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Apr 2014 10:59:01 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so2302164eei.33
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Apr 2014 03:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OXwCKf0fp/ag92DoIj+JinTnUVjRrHXX7JLZpvN7gAw=;
	b=U+mzvun4VqNc+4zuOIuNC/bQ3GoKSoVFxjATZhVxx/vbA6TegH2o1dKvqldLafRM9b
	Cis/wX3pUVRyzW61eG4Mn27uE30W3c513H9TMC+0ubgfLYySuYPHeb2V5gG3D9Cv8Aaa
	2Cejoii8oxASXcGoVSeUZnNPnzJ+ymzRcDZxL6i2dc6ZHb7RnEmYtR+HrZQQuYzqfVvW
	2FLyY5ypLAGUlS+YjbzOwJLbUBP7hlFkrVHjAqLjFxe939A7UFZ4q5dorUxbjwhIQWe6
	N7coof4LPzFTeaRWd09QJI2o1aEUO2Io0ZI1S1mGnqCIgM+36WWE11rM2PwvIKgiMO+4
	bQIQ==
X-Received: by 10.15.67.142 with SMTP id u14mr29946327eex.19.1397905142400;
	Sat, 19 Apr 2014 03:59:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q49sm84722043eem.34.2014.04.19.03.59.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Apr 2014 03:59:00 -0700 (PDT)
Date: Sat, 19 Apr 2014 12:59:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Message-ID: <20140419105904.GI2486@jama>
References: <53523CF6.2040208@topic.nl>
MIME-Version: 1.0
In-Reply-To: <53523CF6.2040208@topic.nl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How to migrate from PRINC to PR_SERVER?
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
X-List-Received-Date: Sat, 19 Apr 2014 10:59:02 -0000
X-Groupsio-MsgNum: 52477
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2nTeH+t2PBomgucg"
Content-Disposition: inline

--2nTeH+t2PBomgucg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 19, 2014 at 11:08:06AM +0200, Mike Looijmans wrote:
> Attempting to move to the current OE-head now yields about a hundred=20
> messages like this:
>=20
> WARNING: Use of PRINC 7 was detected in the recipe ...
>=20
> The https://wiki.yoctoproject.org/wiki/PR_Service page tells what the PR=
=20
> server is.

PR_Service doesn't help with PRINC removal, because PRINC is applied on
first number in PR and AUTOPR is appended as extra number after dot.

> However, it does not tell what to do with the recipes. Just removing=20
> PRINC from the recipes will break the upgrade path.

You were supposed to send corresponding PR bumps to upper layers when
removing PRINCs, like:
http://git.openembedded.org/openembedded-core/commit?id=3Dc6825ec6e92e20bb6=
4a051d1576f363c16e98d68

but it's probably too late for daisy.

> What are we supposed to do now?

You can wait for PV/PE upgrades in upper layers or in worse case break
upgrade path and remove PRINCs without replacement (e.g. if it's in your
private layer and company doesn't care about upgrade path).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2nTeH+t2PBomgucg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNSVvgACgkQN1Ujt2V2gBw+NgCgqkrIAWtxMQwgs94xQJYI8dDk
1DgAnA2vbQkA3w0yg1JE3mnotTL4ZvWr
=kvXv
-----END PGP SIGNATURE-----

--2nTeH+t2PBomgucg--
