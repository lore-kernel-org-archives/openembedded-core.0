Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7A97377325
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Nov 2015 09:48:52 +0000 (UTC)
Received: by wmec201 with SMTP id c201so113458892wme.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Nov 2015 01:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nxCjK5gaEhtFPaZ/3cEB41ZqNWaXY20Sj0tN5LqmQIo=;
	b=eLAf+TNa4a5D8ihsXrrWbmtkc+YVIvsQXu9f/8DKFGucTsPqB191PVk6TixtGMiE3R
	JY35p8Ii1BfmeHgD9urM5v3Hge6pPAhrJgvk7lQJtUeCnRVNbGVeh06PGKSP2Ht+3bs/
	WDLNB1ZiRWCtfNBqI2oTnmBAyEWVwXrxTE2hXauxVEmcjTJVUdhnqNI3ZdbzrDAtqNjP
	jXR10lgcpP/3MDFfIgMrlUnHG4CBcFILKb8o94MAsVGPvFfohuTLHIjwCpmfkzJ1xI4+
	gyGerSC9aKTISA4ys4+/whio8bNV4Gy4VEf3cDYqgaCNrX48ghfG7DczoDeeUM4RpwTS
	OSOw==
X-Received: by 10.28.4.7 with SMTP id 7mr8164117wme.85.1447494532076;
	Sat, 14 Nov 2015 01:48:52 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	s189sm8094837wmf.16.2015.11.14.01.48.50
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Nov 2015 01:48:50 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 14 Nov 2015 10:49:23 +0100
To: wenzong fan <wenzong.fan@windriver.com>
Message-ID: <20151114094923.GC2564@jama>
References: <1447482114-165655-1-git-send-email-wenzong.fan@windriver.com>
	<CA+chaQdbNP38CKVzf_O8y4o4MExSpddf5eB_EavXOB36J_p_tQ@mail.gmail.com>
	<5646FC87.1020005@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5646FC87.1020005@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: disable uvch264 for systemd
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
X-List-Received-Date: Sat, 14 Nov 2015 09:48:52 -0000
X-Groupsio-MsgNum: 73445
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NKoe5XOeduwbEQHU"
Content-Disposition: inline

--NKoe5XOeduwbEQHU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2015 at 05:19:03PM +0800, wenzong fan wrote:
> On 11/14/2015 04:23 PM, Martin Jansa wrote:
> > NAK, see
> > http://lists.openembedded.org/pipermail/openembedded-core/2015-November=
/112685.html
>=20
> Hi Martin
>=20
> Thanks for your reply.
>=20
> If we build oe-core + systemd only (without meta-oe), it will fail with:
>=20
> ERROR: Nothing PROVIDES 'libgudev' (but=20
> /path/to/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_=
1.4.5.bb=20
> DEPENDS on or otherwise requires it)
> ERROR: udev PROVIDES libgudev but was skipped: 'systemd' in DISTRO_FEATUR=
ES
> ERROR: Required build target 'gstreamer1.0-plugins-bad' has no buildable=
=20
> providers.
> Missing or unbuildable dependency chain was:=20
> ['gstreamer1.0-plugins-bad', 'libgudev']
>=20
> We should not get oe-core depends on meta-oe, I incline to disable=20
> libgudev for systemd by default.

udev should provide libgudev for oe-core, but I see it was skipped:
ERROR: udev PROVIDES libgudev but was skipped: 'systemd' in DISTRO_FEATURES

How is that supposed to work when systemd is enabled as well as udev?

Does the sysvinit image nowadays use udev package from systemd recipe?

Regards,

> Does it make sense?
>=20
> Thanks
> Wenzong
>=20
> >
> > On Sat, Nov 14, 2015 at 7:21 AM, <wenzong.fan@windriver.com
> > <mailto:wenzong.fan@windriver.com>> wrote:
> >
> >     From: Wenzong Fan <wenzong.fan@windriver.com
> >     <mailto:wenzong.fan@windriver.com>>
> >
> >     Disable uvch264 to remove the dependency to libgudev which has been
> >     removed from systemd project.
> >
> >     Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com
> >     <mailto:wenzong.fan@windriver.com>>
> >     ---
> >       meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | =
3 ++-
> >       1 file changed, 2 insertions(+), 1 deletion(-)
> >
> >     diff --git
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> >     index cdedb60..863925d 100644
> >     --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> >     +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
> >     @@ -20,7 +20,8 @@ PACKAGECONFIG ??=3D " \
> >           ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland',
> >     '', d)} \
> >           ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez',
> >     '', d)} \
> >           ${@bb.utils.contains('DISTRO_FEATURES', 'directfb',
> >     'directfb', '', d)} \
> >     -    orc curl uvch264 neon sndfile \
> >     +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '',
> >     'uvch264', d)} \
> >     +    orc curl neon sndfile \
> >           hls sbc dash bz2 smoothstreaming \
> >           "
> >
> >     --
> >     1.9.1
> >
> >     --
> >     _______________________________________________
> >     Openembedded-core mailing list
> >     Openembedded-core@lists.openembedded.org
> >     <mailto:Openembedded-core@lists.openembedded.org>
> >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NKoe5XOeduwbEQHU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZHA6IACgkQN1Ujt2V2gBzhqwCeJ1lmm7XoaoFXNi8hPFhiE/t3
hAoAn2adZFNUKfLdAbyiMAEVYL+UoHIy
=wOnw
-----END PGP SIGNATURE-----

--NKoe5XOeduwbEQHU--
