Received: from mail-da0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TtFpi-0000br-WC
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 11:58:16 +0100
Received: by mail-da0-f45.google.com with SMTP id w4so187923dam.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 02:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=0GovNM5oAzOAiv2MspmcAyxioIKPN0AQguxDur9tSIQ=;
	b=tScWyboReMJ/ZgUIn43dqp+dt3OjFA/SKuz81wt6R+b4SoyBUGZT3TfJOjSK7VQuww
	nBwa454SktPflneLv99X+aX/b2I+gZ4wCjyNmYgk8boQ4E+1MNJuA2H9fzRLI1m0Bwq3
	I0mRl2Iy1/8Z51ClV8gy0PR1V3PUZUbLdqvlL4sulS59AVFwjLLyryaqJDh7i76W/1Br
	MgjGUOnM4e+dpVltq3/bFgSo7hvVw/wxiH3b9L3FjPEo1Y0nJTDn6tGGJ8bmudoQjKtw
	1ZbR9h/MUDeQsq2oYe1SQEFZquNj7gO+dcHygRNyG7skVj3OMhHn6kboEnhNLhvnkM5m
	Xfcg==
X-Received: by 10.68.224.165 with SMTP id rd5mr220799918pbc.49.1357814569079; 
	Thu, 10 Jan 2013 02:42:49 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qw8sm615628pbc.39.2013.01.10.02.42.46
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 02:42:48 -0800 (PST)
Date: Thu, 10 Jan 2013 11:42:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Yi Qingliang <niqingliang2003@gmail.com>
Message-ID: <20130110104253.GU3722@jama.palm1.palmone.com>
References: <1757330.jo1AhcIeyl@yiqingliang-pc>
MIME-Version: 1.0
In-Reply-To: <1757330.jo1AhcIeyl@yiqingliang-pc>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: glib2.0 and dbus dependency
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
X-List-Received-Date: Thu, 10 Jan 2013 10:58:16 -0000
X-Groupsio-MsgNum: 33662
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cqG5pBpskktEuCrX"
Content-Disposition: inline

--cqG5pBpskktEuCrX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 06:31:22PM +0000, Yi Qingliang wrote:
> when compiling using 4 threads, I got following error.
> the glib2.0-native want find dbus header file.
> If I compiled dbus/dbus-natigve, and then compile glib2.0 OK.
>=20
> when grep glib2.0 bb files, I can't find dbus in dependency, why?

It was causing cyclic dependency at least when dbus tests were enabled,
I'm not sure if this was resolved already.

> ERROR: Function failed: do_compile (see /mnt/src/arm9plf-
> build/tmp/work/x86_64-linux/glib-2.0-native/1_2.34.3-
> r0/temp/log.do_compile.28193 for further information)
> ERROR: Task 1851 (virtual:native:/mnt/src/optimus/poky/meta/recipes-
> core/glib-2.0/glib-2.0_2.34.3.bb, do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 929 tasks of which 925 didn't need to be r=
erun=20
> and 1 failed.
> Waiting for 0 running tasks to finish:
>=20
> Summary: 1 task failed:
>   virtual:native:/mnt/src/optimus/poky/meta/recipes-
> core/glib-2.0/glib-2.0_2.34.3.bb, do_compile
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cqG5pBpskktEuCrX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDumy0ACgkQN1Ujt2V2gBx70wCggXCwqLvNKsd8cbBsZxtLPz0H
NfEAoJGBh/ApZW+gdJl6qFxclzidNi1a
=mW+Q
-----END PGP SIGNATURE-----

--cqG5pBpskktEuCrX--
