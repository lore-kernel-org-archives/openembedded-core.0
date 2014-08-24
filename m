Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 13C9665D53
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 16:19:53 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id bs8so1533977wib.14
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 09:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SSfiHXXDzuCJPgmAKLQJm3rnYxiNrFN6M692MqFvqfw=;
	b=YeQzfYA8h30UwzjjRBhsWHJ6CSQjh9Nk0uRErHX98+4UFugRHDxfn1XBiFPbdaN35S
	gBcjM0H52dWxauCr5G2nwrVp3ip7PrHi+OcHfnv5ZMOHPSZWui4xFE/n3q4qUlYyrBZY
	cbypa1hE/bpXvcoIQGaakM4rWix9b3Z//lNTRpOgViaHVQyiy2o4wHH/l+zg4E+ZEOeK
	Z567KQ3OvPe9QQ70hEFJrIwa9yR8DEyx6Zcsya1DifZJm9sfapQWAMiLS5f+82ckGwGH
	Y7w7PWzDDWQMu4spUnUX2jpQTM5FYyfMGYMXLyPvvfKW4ymypYTWMeiDH9+0si18v7gm
	Q1Sw==
X-Received: by 10.180.20.40 with SMTP id k8mr10179738wie.38.1408897194171;
	Sun, 24 Aug 2014 09:19:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cy9sm21877546wib.15.2014.08.24.09.19.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Aug 2014 09:19:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 24 Aug 2014 18:19:59 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140824161959.GK20524@jama>
References: <1406294138-31362-1-git-send-email-Martin.Jansa@gmail.com>
	<20140816182109.GC3660@jama>
	<2504829.VI0TcbR3XB@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <2504829.VI0TcbR3XB@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] buildhistory: rename build-id to build-id.txt and add more info
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
X-List-Received-Date: Sun, 24 Aug 2014 16:19:55 -0000
X-Groupsio-MsgNum: 56877
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EEx6GiKZGZ1wKUra"
Content-Disposition: inline

--EEx6GiKZGZ1wKUra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2014 at 11:54:28AM +0100, Paul Eggleton wrote:
> On Saturday 16 August 2014 20:21:09 Martin Jansa wrote:
> > On Fri, Jul 25, 2014 at 03:15:38PM +0200, Martin Jansa wrote:
> > > * use .txt extension like other reports (e.g. image-info.txt) it's
> > >=20
> > >   also useful when looking at the file from web server which doesn't
> > >   have text/plain as default content-type
> > >=20
> > > * include whole BUILDCFG_HEADER/BUILDCFG_FUNCS instead of just layer
> > >=20
> > >   info
> > >=20
> > > * this makes it easier for distro to include more fields without the
> > >=20
> > >   need to modify buildhistory.bbclass
> > >=20
> > > * currently it adds following fields:
> > >   Build Configuration:
> > >   BB_VERSION        =3D "1.23.1"
> > >   BUILD_SYS         =3D "x86_64-linux"
> > >   NATIVELSBSTRING   =3D "Gentoo-2.2"
> > >   TARGET_SYS        =3D "x86_64-oe-linux"
> > >   MACHINE           =3D "qemux86-64"
> > >   DISTRO            =3D "shr"
> > >   DISTRO_VERSION    =3D "2013.07-next-20140725"
> > >   TUNE_FEATURES     =3D "m64 core2"
> > >   TARGET_FPU        =3D ""
> >=20
> > ping
> >=20
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >=20
> > >  meta/classes/buildhistory.bbclass | 26 ++++++++++++++++++--------
> > >  1 file changed, 18 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/meta/classes/buildhistory.bbclass
> > > b/meta/classes/buildhistory.bbclass index 20382ce..479e460 100644
> > > --- a/meta/classes/buildhistory.bbclass
> > > +++ b/meta/classes/buildhistory.bbclass
> > > @@ -461,10 +461,10 @@ END
> > >=20
> > >  	echo "IMAGESIZE =3D $imagesize" >>
> > >  	${BUILDHISTORY_DIR_IMAGE}/image-info.txt
> > >  =09
> > >  	# Add some configuration information
> > >=20
> > > -	echo "${MACHINE}: ${IMAGE_BASENAME} configured for ${DISTRO}
> > > ${DISTRO_VERSION}" > ${BUILDHISTORY_DIR_IMAGE}/build-id +	echo
> > > "${MACHINE}: ${IMAGE_BASENAME} configured for ${DISTRO}
> > > ${DISTRO_VERSION}" > ${BUILDHISTORY_DIR_IMAGE}/build-id.txt
> > >=20
> > > -	cat >> ${BUILDHISTORY_DIR_IMAGE}/build-id <<END
> > > -${@buildhistory_get_layers(d)}
> > > +	cat >> ${BUILDHISTORY_DIR_IMAGE}/build-id.txt <<END
> > > +${@buildhistory_get_build_id(d)}
> > >=20
> > >  END
> > >  }
> > >=20
> > > @@ -498,11 +498,21 @@ POPULATE_SDK_POST_HOST_COMMAND_append =3D "
> > > buildhistory_list_installed_sdk_host ;>=20
> > >  SDK_POSTPROCESS_COMMAND +=3D "buildhistory_get_sdkinfo ; "
> > >=20
> > > -def buildhistory_get_layers(d):
> > > -    if d.getVar('BB_WORKERCONTEXT', True) !=3D '1':
> > > -        return ""

I've just noticed that I've unintentionally removed these 2 lines, which
were added in:
  commit 540a2a30be21c3eca4323efbe91e7dcfc31a4c97
  Author: Paul Eggleton <paul.eggleton@linux.intel.com>
  Date:   Mon Dec 2 18:50:50 2013 +0000

    classes/buildhistory: reduce parsing time
   =20
    Disable several python functions if not parsing within the worker
    context. This avoids executing expensive operations while parsing
    recipes (which is unnecessary).
   =20
and I believe still useful, I'll send another commit to restore it.

> > > -    layertext =3D "Configured metadata layers:\n%s\n" %
> > > '\n'.join(get_layers_branch_rev(d)) -    return layertext
> > > +def buildhistory_get_build_id(d):
> > > +    localdata =3D bb.data.createCopy(d)
> > > +    bb.data.update_data(localdata)
> > > +    statuslines =3D []
> > > +    for func in oe.data.typed_value('BUILDCFG_FUNCS', localdata):
> > > +        g =3D globals()
> > > +        if func not in g:
> > > +            bb.warn("Build configuration function '%s' does not exis=
t" %
> > > func) +        else:
> > > +            flines =3D g[func](localdata)
> > > +            if flines:
> > > +                statuslines.extend(flines)
> > > +
> > > +    statusheader =3D d.getVar('BUILDCFG_HEADER', True)
> > > +    return('\n%s\n%s\n' % (statusheader, '\n'.join(statuslines)))
> > >=20
> > >  def buildhistory_get_metadata_revs(d):
> > >      # We want an easily machine-readable format here, so
> > >      get_layers_branch_rev isn't quite what we want
>=20
> Sorry I looked at this earlier and it looked OK to me then, I should have=
=20
> acked it already.
>=20
> Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EEx6GiKZGZ1wKUra
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP6EK8ACgkQN1Ujt2V2gBz24ACdHnW6rLCIh3FQNoNFZsMezS+s
u84AnRHKSKljXOJhHPT6oq4HvB+TXrjM
=9sfW
-----END PGP SIGNATURE-----

--EEx6GiKZGZ1wKUra--
