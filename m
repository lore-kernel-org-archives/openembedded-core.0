Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TGtBQ-0003wF-CS
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 17:05:52 +0200
Received: by bkcjk7 with SMTP id jk7so347890bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 07:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oDwiwbwmH8e0JiB+gCSpp0NsgdJUdbWf13sTa6AdDzs=;
	b=kaT/60ZyUiWhAFS00/qcPk5q+Tf0hBpuK1b1rHeruMhd/ILHcNwAZPwQvCARjGLADM
	8jjNJWy8kKdHvRdQGalZUc6S/CvkRLarFXcN3NrDttigAPhV0zu8JFkQE6IbolAH7WMR
	dp1zMUbK60gEVmZSJvZ7o/bSH70FLyAah1Uc5vXyL182ANNCuSJhuAKystHby7eFSHlT
	XD2weHsiMVY7JwJQ/NBYQUDVzfqCQKe3p4L1SJe591xL+xRupIUPCSfa3kgR4WpUcB30
	l0d6fBpkBBLKaq5GSY/G8HvjR5UWE8huqlWm0WoUHJpbuuz3gvv3qbuumFOiRtDAiKg4
	+9jw==
Received: by 10.204.153.10 with SMTP id i10mr648227bkw.67.1348671181849;
	Wed, 26 Sep 2012 07:53:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w9sm121154bkv.3.2012.09.26.07.52.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 07:53:00 -0700 (PDT)
Date: Wed, 26 Sep 2012 16:53:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120926145301.GP3313@jama.jama.net>
References: <1348663741.31293.114.camel@phil-desktop>
	<CAJTo0La28g_t84Ku+LbLKLVfwyRL-KuCpq3GuYWxLbnu4-NYkg@mail.gmail.com>
	<1348669724.31293.117.camel@phil-desktop>
	<CAJTo0LZonQKrz+cR_qAE8p8qhaL17o9fmqOyw5+1fzuFnO_e0A@mail.gmail.com>
	<1348670669.31293.119.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1348670669.31293.119.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] glib-2.0: Update to 2.34.0
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
X-List-Received-Date: Wed, 26 Sep 2012 15:05:52 -0000
X-Groupsio-MsgNum: 29940
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+W7ryvxEk4RRyt+P"
Content-Disposition: inline

--+W7ryvxEk4RRyt+P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 26, 2012 at 03:44:28PM +0100, Phil Blundell wrote:
> On Wed, 2012-09-26 at 15:39 +0100, Burton, Ross wrote:
> > On 26 September 2012 15:28, Phil Blundell <philb@gnu.org> wrote:
> > > Which patches were you thinking of specifically?  I don't think there
> > > are many that we apply which are actually related to cross-compiling.
> >=20
> > no-libelf and no-dbus.
> >=20
> > Looking at the patches we are carrying, it's quite comic.  Two patches
> > which are carried with no understanding of why...
>=20
> no-dbus isn't anything to do with cross-compiling as such, it's to avoid
> an extra build dependency on dbus.  I've no idea what exactly no-libelf
> is trying to accomplish though it does also look like it's intended to
> prevent an extra library dependency.

yes, see 2929e7d590862d9649458c90804e79a1dce40423 where it was
introduced

>=20
> p.
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+W7ryvxEk4RRyt+P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBjFs0ACgkQN1Ujt2V2gBxCPwCfVSyQhDX+OTjJH9z7zpr95nvr
B6kAn07doXUiQo1q6QIS0wkzxakecbD5
=d0t8
-----END PGP SIGNATURE-----

--+W7ryvxEk4RRyt+P--
