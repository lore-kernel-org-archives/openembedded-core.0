Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U634T-0003VD-N6
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 18:58:12 +0100
Received: by mail-pa0-f42.google.com with SMTP id kq12so1407680pab.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 09:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=n1TTwngLU6TTSImi40CX/0zybyYkAlwZHrAm59CbpV4=;
	b=av8XHS1jXgzK1PyD8C+9aOjIyU6lL+0iJd+00eeQq3+X5Qu6iST5+jqvllBFrX6hfO
	vovpcWgQRZk5BpWvZrcMPkHTaPiYVxGGb3sUmcqo0cGhK7pfi849xzHbfBqVgMP6RCVs
	HnYM+4YwA8lxsdxu/ozvg7HJMi+ea8jfuv99NqaFoDazHzi9hd4gy8LdbbJDnL710bFp
	3LVZTroG6xUos0Z862yLtPc+E1EuUl/nlb0f+XpTCafIJltuSilpwxcE2vDIpdoEm7MW
	/y6EPzp1RqgNSWJq9TLi/JkxLy3vCcJnSszytgeTTkhnP4yJz4HUz9qPPZVLv/TmsQWd
	Wtjg==
X-Received: by 10.66.25.105 with SMTP id b9mr701868pag.45.1360863726156;
	Thu, 14 Feb 2013 09:42:06 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ww9sm1915000pbc.41.2013.02.14.09.42.03
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 14 Feb 2013 09:42:05 -0800 (PST)
Date: Thu, 14 Feb 2013 18:42:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20130214174201.GL3300@jama>
References: <511CE466.40905@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <511CE466.40905@mlbassoc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Broken dependency processing?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Feb 2013 17:58:13 -0000
X-Groupsio-MsgNum: 35475
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L/Qt9NZ8t00Dhfad"
Content-Disposition: inline

--L/Qt9NZ8t00Dhfad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 14, 2013 at 06:19:34AM -0700, Gary Thomas wrote:
> I have an customized image which explicitly names 'pulseaudio-server'
> Building my image will break if I don't also explicitly name 'consolekit'

see
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/032203=
=2Ehtml

>=20
> root@my_target:~# opkg whatdepends consolekit
> Root set:
>    consolekit
> What depends on root set
>          pulseaudio-module-console-kit 2.1-r15   depends on consolekit
> root@my_target:~# opkg whatdepends pulseaudio-module-console-kit
> Root set:
>    pulseaudio-module-console-kit
> What depends on root set
>          pulseaudio-server 2.1-r15       depends on pulseaudio-module-con=
sole-kit
>=20
> I can see that building pulseaudio does not force consolekit although it
> will be required in order to install pulseaudio-server.
>=20
> [gthomas@titan p82_soft]$ bitbake -g pulseaudio
> Loading cache: 100% |####################################################=
################################| ETA:  00:00:00
> Loaded 1415 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: PN build list saved to 'pn-buildlist'
> NOTE: PN dependencies saved to 'pn-depends.dot'
> NOTE: Package dependencies saved to 'package-depends.dot'
> NOTE: Task dependencies saved to 'task-depends.dot'
> [gthomas@titan p82_soft]$ grep consolekit pn-buildlist
>     ... nothing (not present)
>=20
> Note: my image/system does not normally include 'consolekit' and this beh=
aviour
> causes the image to fail to build.
>=20
> I'm using the Poky/Yocto tree from a few weeks ago in case that matters:
>    meta              =3D "master:09359e6ec00901abfe49157f1f9730117b4d284b"
>=20
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--L/Qt9NZ8t00Dhfad
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEdIekACgkQN1Ujt2V2gBxsJACffKtqNFn7raktSCB1F7OnMlK4
RAsAnA22wnOn49dJ/R+XL6+GG76sMCDA
=Tv/b
-----END PGP SIGNATURE-----

--L/Qt9NZ8t00Dhfad--
