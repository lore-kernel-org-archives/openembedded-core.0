Return-Path: <martin.jansa@gmail.com>
Received: from mail-vc0-f176.google.com (unknown [209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7515F65FE3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 May 2014 18:46:06 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id lg15so7692519vcb.35
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 May 2014 11:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FxanWs7UXX90iPLmKEaNf88UxJSMHCar6QbA/F8f9YA=;
	b=JJt3pIfqSPBLaf3kZdr/I9IMp6MaFYE6BCx/EoqRfEVYMhbRKQ30OyaAvtTXYN+G6I
	UUmSQVzc3HAxzYLBZr104DIW/MU4s/IyKiANx3tTURkelPpmNB4eW0+ZYFY4kRh6JP4h
	XjSoz+kTAk0z8kkQnSgS/jT12kjl0kya+uNIBvoiR0uKgGDZPWCV3GIkZvwfsRaJqUA/
	UUP25SIc7xZGqutZKxTYD8qD/Y9Dbg1SaHWRNUYeBzJzy5NmMDWytGvqHNOO2VHgHDSv
	QvQDDO6gHAwd3tKWcQTiVVNCXzkUn6sEBbAObg87HZ9N/Pu6T6eCKcj0H/n2CFpXvVPp
	Xx2g==
X-Received: by 10.58.122.164 with SMTP id lt4mr19140446veb.2.1399833967557;
	Sun, 11 May 2014 11:46:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	xr10sm11633671vec.2.2014.05.11.11.46.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 May 2014 11:46:05 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 11 May 2014 20:46:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Andrew Blackburn <andyblac@icloud.com>
Message-ID: <20140511184631.GF22774@jama>
References: <874B01E8-8A61-442E-981C-3FCE0763854E@icloud.com>
MIME-Version: 1.0
In-Reply-To: <874B01E8-8A61-442E-981C-3FCE0763854E@icloud.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: talloc build error
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
X-List-Received-Date: Sun, 11 May 2014 18:46:07 -0000
X-Groupsio-MsgNum: 53073
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O98KdSgI27dgYlM5"
Content-Disposition: inline

--O98KdSgI27dgYlM5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 11, 2014 at 05:29:55PM +0100, Andrew Blackburn wrote:
> hi all,
>=20
> i recently merged =E2=80=98meta-openembedded=E2=80=99 master into my bran=
ch, but i am now getting a build error with tallow, below is the erro i am =
getting, can anyone help on how to fix.

See e-mails about world status and threads about autotools-brokensep and
B!=3DS.

> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: Function failed: do_configure (log file is located at /home/vix/oe=
-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/talloc-2.0.1-r2/=
temp/log.do_configure.9168)
> ERROR: Logfile of failure stored in: /home/vix/oe-alliance/builds/openvix=
/tmp/work/mips32el-oe-linux/talloc/talloc-2.0.1-r2/temp/log.do_configure.91=
68
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: SITE files ['endian-little', 'bit-32', 'mips-common', 'common-li=
nux', 'common-glibc', 'mipsel-linux', 'common']
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing python function autotools_copy_aclocals
> | DEBUG: Python function autotools_copy_aclocals finished
> | DEBUG: Executing shell function do_configure
> | gnu-configize: 'configure.ac' or 'configure.in' is required
> | WARNING: /home/vix/oe-alliance/builds/openvix/tmp/work/mips32el-oe-linu=
x/talloc/talloc-2.0.1-r2/temp/run.do_configure.9168:1 exit 1 from
> |   gnu-configize
> | ERROR: Function failed: do_configure (log file is located at /home/vix/=
oe-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/talloc-2.0.1-r=
2/temp/log.do_configure.9168)
> ERROR: Task 4967 (/home/vix/oe-alliance/meta-openembedded/meta-oe/recipes=
-support/talloc/talloc_2.0.1.bb, do_configure) failed with exit code =E2=80=
=981'
>=20
>=20
>=20
> hope someone can help
>=20
>=20
> cheers
> Andy.
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--O98KdSgI27dgYlM5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNvxYcACgkQN1Ujt2V2gBxV7QCdH3gLuYkSlQDOqdF9zBKPKDoR
8zoAnj00hDGv8H9Ajool2NAN7j5NM+J9
=a/tw
-----END PGP SIGNATURE-----

--O98KdSgI27dgYlM5--
