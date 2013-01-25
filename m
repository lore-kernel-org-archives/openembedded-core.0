Received: from mail-pa0-f46.google.com ([209.85.220.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tym51-0005mx-Vz
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 17:24:44 +0100
Received: by mail-pa0-f46.google.com with SMTP id kp14so338345pab.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 08:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=dRx23OJfDLr6HIqOxHzCzMTXKRTlc/6DKcUO9ZjLYw8=;
	b=PIObG7p8O4oFVSoljd0SbGD7MNmjWOym4cndY2qoXZlWcb+VH5LihiL8+qkLhrcRbY
	F/IiM+Yza4kEZxc4VVGULFbC1EULYa3agvvevZS5xvELmk4NZHR/JYQmKNz9i6XP/44T
	2rXdPtYgQT5JW0FbgPXoSWGSg6ELrLc191yLDGc1tsLGvuhdu/+g6vwdkNBQrrBaB/+q
	PLC0UvsDzhb8fDoZL7IgUj1kLeQRTx+WIafs+ZYw7+YtXaGm5aOqdAwbn9TOC1lvUMcT
	k43zq3JzqfdZJUsdVlZpF+PAGK9hTulRjydFMXxeF7Ej5Bo/106O1Hb3KOHBjlybv+us
	/hBg==
X-Received: by 10.66.82.67 with SMTP id g3mr14480501pay.58.1359130144380;
	Fri, 25 Jan 2013 08:09:04 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ug6sm910452pbc.4.2013.01.25.08.09.01
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 08:09:03 -0800 (PST)
Date: Fri, 25 Jan 2013 17:08:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130125160859.GK3200@jama>
References: <cover.1359061155.git.raj.khem@gmail.com>
	<e684d68286657cc9cfce53b0e5b597f79fae1248.1359061155.git.raj.khem@gmail.com>
	<CAJTo0LaDWt3TArVPU9AVEUbrhK6A9FMN+cNU5muSapL4D5wA0g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaDWt3TArVPU9AVEUbrhK6A9FMN+cNU5muSapL4D5wA0g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 10/11] systemd: Upgrade to 197
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
X-List-Received-Date: Fri, 25 Jan 2013 16:24:47 -0000
X-List-Received-Date: Fri, 25 Jan 2013 16:24:47 -0000
X-Groupsio-MsgNum: 34448
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="j3olVFx0FsM75XyV"
Content-Disposition: inline

--j3olVFx0FsM75XyV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2013 at 04:04:49PM +0000, Burton, Ross wrote:
> On 24 January 2013 21:07, Khem Raj <raj.khem@gmail.com> wrote:
> > LGPL-2.1 licensce is updated to reflect the new FSF address
> > Drop patches to disable argparse and dbus-python
> >
> > analyser has been implemented in C lets use that patch
> > and get rid of the python version
> >
> > disable hostname detection for uclibc bases systems
> > since uclibc lacks NSS
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>=20
> I see that hddimg is still broken though (broken with 196 too), hangs
> at "waiting for removable media".  If anyone has any hints as to why
> this could be they'll be much appreciated (udev is actually running).
>=20
> It also renames my laptop's eth0 to enp0s25.  systemd and a static
> interfaces file will be fun!

Yes, lot of fun:
http://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfac=
eNames

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--j3olVFx0FsM75XyV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlECrhsACgkQN1Ujt2V2gBwlFACgpN0H8mfHXAy+2nvsyN81ohln
fgYAn2aeCVz9qutxkskCaAEzqsy7apb0
=gPq1
-----END PGP SIGNATURE-----

--j3olVFx0FsM75XyV--
