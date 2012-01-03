Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Ri8KW-0006w7-NV
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 18:39:21 +0100
Received: by eeit10 with SMTP id t10so10772478eei.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jan 2012 09:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WjPRZZNkn5iTVe/Rat9HDQhnHrj/nUFR84oP/a8sHik=;
	b=BzlSvYZf1YMarYL1B8Miv69U2yYt+Z1C0am8Qsu7rSQ9yfYC36LMXOlNUZscxKXlcr
	S8sIdpnT8qnizcSVNqk6sPb6byGEIMg36M7hlHB1i4Oi7YW/U1J794r+RmFBYoWYhy1R
	yXnT+JXO1Yu5MK/WJ1NsOFwB8y5Qhxcw4nj1E=
Received: by 10.213.2.84 with SMTP id 20mr537794ebi.83.1325611916355;
	Tue, 03 Jan 2012 09:31:56 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t1sm208240310eeb.3.2012.01.03.09.31.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jan 2012 09:31:55 -0800 (PST)
Date: Tue, 3 Jan 2012 18:31:43 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120103173143.GG3958@jama.jama.net>
References: <1325541916-22423-1-git-send-email-msm@freescale.com>
	<20120102232228.GA3958@jama.jama.net>
	<20120102232521.GB3958@jama.jama.net>
	<CAEsOVNcUdhic5Wt=r9XEb1SRmWw7+8Tn+4pWyB4Xdj4Mmv7+Lg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEsOVNcUdhic5Wt=r9XEb1SRmWw7+8Tn+4pWyB4Xdj4Mmv7+Lg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] libxml2: add shared library version info to libxml shared libraries
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jan 2012 17:39:21 -0000
X-Groupsio-MsgNum: 15166
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2E/hm+v6kSLEYT3h"
Content-Disposition: inline

--2E/hm+v6kSLEYT3h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 03, 2012 at 04:21:16PM +0000, McClintock Matthew-B29882 wrote:
> On Mon, Jan 2, 2012 at 5:25 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Tue, Jan 03, 2012 at 12:22:28AM +0100, Martin Jansa wrote:
> >> On Mon, Jan 02, 2012 at 04:05:16PM -0600, Matthew McClintock wrote:
> >> > This fixes an issue with RPM where it checks version imformation for
> >> > binaries linked against libxml and fails because it's missing info
> >> >
> >> > | error: Failed dependencies:
> >> > | =A0 =A0 =A0 =A0 =A0 =A0 =A0libxml2.so.2(LIBXML2_2.6.0) is needed b=
y fmc-0.9.7+2-r2.1.ppce500mc
> >> > | =A0 =A0 =A0 =A0 =A0 =A0 =A0libxml2.so.2(LIBXML2_2.4.30) is needed =
by fmc-0.9.7+2-r2.1.ppce500mc
> >> > | ERROR: Function 'do_rootfs' failed (see
> >> >
> >> > Note: fmc is just an example recipe/name
> >>
> >> Weird that I haven't noticed this in oe-core before, but probably
> >> because in oe-core it was always without version. But it looks the same
> >> as this
> >> http://git.openembedded.org/openembedded/commit/?id=3D50ed401cdaaefb1f=
5ac33de2838af259a52b1c3a
> >> so
>=20
> You won't see this when building against oe-core stuff from source.
> This issue is seen when we bring in a prebuilt binary and link against
> libxml2 in the system.

what about all binaries built before this change which are already
available in binary feed created with OE?
=20
> >> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
> >
> > but also double check if all recipes depending on it needs PR bump too,
> > I've expected that it's needed only for transition from versioned to not
> > versioned symbols, but according to:
> > http://git.openembedded.org/openembedded/commit/?id=3D4373bc4d0cde98dfa=
188d9a06266afa06f970bfe
> > http://git.openembedded.org/openembedded/commit/?id=3D7e673ab79c7d76ffc=
2b733fb32d0b41514eb0db0
> > it was needed also other way around
>=20
> Because of the reason above, I don't think we need to bump PR's for
> all these recipes. People just should not normally be seeing this
> issue. If they are well, then they won't be able to make an RPM based
> rfs (maybe others)
>=20
> Let me know if that seems reasonable...
>=20
> -M
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2E/hm+v6kSLEYT3h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8DO38ACgkQN1Ujt2V2gBx8uQCfVBvxmdTXIeGqi3svQ/a7onCx
NcIAn36UXsb91JM25u5kmJ7DY7ccq6gi
=JV+B
-----END PGP SIGNATURE-----

--2E/hm+v6kSLEYT3h--
