Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tyq6f-0002op-L9
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 21:42:37 +0100
Received: by mail-pb0-f54.google.com with SMTP id rr4so413008pbb.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 12:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=65jLtJ1cjdiDfpyl9BUP08+aEe//x6+1Niy4n+4/V/g=;
	b=ib7kAZDCrLrF7S3XZYupGjX9Ojzdm8lDn0VRloNVtsY594krLmkr07bThVnN2l7XjY
	Ji2X1aQ2T4IApAhcIz0NHlsCg7TmUm8J7HayNF1IU3mX/0eNGAUzey4rAdwNEkfRfAuU
	xNPMf4ZCUNiVe6IWMHOrM8rIT0bcRwtRdfJSWODtCEqwWFUgF2Ehoq+FaSNDifBfkbwk
	T7yrJqKjibsktGxEveOKmwNzGtjEf+MYdqHTUhrsICCEMhkH7cb80XnvjKcw5H9GVqzv
	lYhL08uujz173l0H3aS4/bKenPE4LnWAI3XzjY1foh+Dkga6b5fobkdblW+xwgmMgfk/
	Cwsw==
X-Received: by 10.68.233.196 with SMTP id ty4mr17341613pbc.23.1359145622281;
	Fri, 25 Jan 2013 12:27:02 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id vq4sm1220948pbc.67.2013.01.25.12.26.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 12:27:00 -0800 (PST)
Date: Fri, 25 Jan 2013 21:26:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130125202657.GF16904@jama.palm1.palmone.com>
References: <1359125976-26763-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LanTczb=N=dgA+3DHc=WABsivhsmPzO6riEy9_Neb6DbQ@mail.gmail.com>
	<20130125151241.GJ3200@jama>
	<CAJTo0LYW7BJ1WT=+GcHXDDRb+ONuKiUxw0ehEkNJgt=b6HY42Q@mail.gmail.com>
	<CALbNGRRM2u80Pdbt7XOhbWTDBBceEpmdN-1drCTVTp_Ez7UQFg@mail.gmail.com>
	<20130125180634.GC16904@jama.palm1.palmone.com>
	<CALbNGRTUU_jBo4uktmEv+JCKaDnkayRt6oULYX2rUq+ro3aE+g@mail.gmail.com>
	<20130125193456.GE16904@jama.palm1.palmone.com>
	<16274FAC3E3E4296A4BB54A6FC9F6300@intel.com>
MIME-Version: 1.0
In-Reply-To: <16274FAC3E3E4296A4BB54A6FC9F6300@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Fri, 25 Jan 2013 20:42:37 -0000
X-Groupsio-MsgNum: 34478
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vA66WO2vHvL/CRSR"
Content-Disposition: inline

--vA66WO2vHvL/CRSR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2013 at 08:21:05PM +0000, Ross Burton wrote:
> On Friday, 25 January 2013 at 19:34, Martin Jansa wrote:
> > Something like:
> >=20
> > systemd:
> > inherit update-alternatives
> > ALTERNATIVE_${PN} =3D "systemd-def-target"
> > ALTERNATIVE_TARGET[systemd-def-target] =3D "${systemd_unitdir}/system/m=
ulti-user.target"
> > ALTERNATIVE_LINK_NAME[systemd-def-target] =3D "${systemd_unitdir}/syste=
md/system/default.target"
> > ALTERNATIVE_PRIORITY[systemd-def-target] ?=3D "1"
> >=20
> > xserver-nodm-init and DMs:
> > inherit update-alternatives
> > ALTERNATIVE_${PN} =3D "systemd-def-target"
> > ALTERNATIVE_TARGET[systemd-def-target] =3D "${systemd_unitdir}/system/g=
raphical.target"
> > ALTERNATIVE_LINK_NAME[systemd-def-target] =3D "${systemd_unitdir}/syste=
md/system/default.target"
> > ALTERNATIVE_PRIORITY[systemd-def-target] ?=3D "10"
>=20
> Can you make those conditional on the systemd feature so that we don't ge=
t complaints from people using something else?

xserver-nodm-init:
ALTERNATIVE_${PN}-systemd =3D "systemd-def-target"

And only people which install xserver-nodm-init-system in image will see
that.

> You could use different names and map them to ALTERNATIVE_* inside system=
d.bbclass, assuming/enforcing that everyone who wants to set the default ta=
rget inherits that class I guess.

I don't understand what you mean.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vA66WO2vHvL/CRSR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEC6pEACgkQN1Ujt2V2gBxUAgCeNlOV+dT2EY8vaLyf7TK63ayB
tNYAn39Wqbe6HDtqhBSXm345J57QuoIB
=qoPz
-----END PGP SIGNATURE-----

--vA66WO2vHvL/CRSR--
