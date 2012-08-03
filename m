Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SxCJu-0007mY-Ru; Fri, 03 Aug 2012 09:29:14 +0200
Received: by wgbdr1 with SMTP id dr1so255889wgb.24
	for <multiple recipients>; Fri, 03 Aug 2012 00:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cLBByZVV2agNPGqTxx1zGFz1jgqimbZ6p513LMGjV3g=;
	b=DMfbCOLxoSVM4k1Fhj739jcZw9hdATdEnYy2U+7GFDUqFV3unBfuGUIS+yOBO6kmci
	IO9uBnTRLjh68IKdZTA6nZ9lXCQtwibe1daundmPuIQbFwje3hoJn6RCsyAKiMRrL3xh
	UI15mrCYrxUTfnaDqC7AH8tJ27W6fMpp1R2Rfyqmfyexee0mErIAlMjsq+5SIXp/nNrV
	nMZfiM5rOUPUPckABxFo0lre5VlbS+Mwqgng3228Ky0B+OpnhCa3PoeYeoN+IiZ4OJjM
	jE7GRGPDAEnc1YIwa2Qn3y6Q53PZEJ+hxMAq7ZnRnr+34hHV9KTBveVSBEzOvoah82cQ
	LOyg==
Received: by 10.180.98.138 with SMTP id ei10mr2004255wib.1.1343978254331;
	Fri, 03 Aug 2012 00:17:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id el6sm38002403wib.8.2012.08.03.00.17.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Aug 2012 00:17:31 -0700 (PDT)
Date: Fri, 3 Aug 2012 09:17:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120803071730.GA30148@jama.jama.net>
References: <20120731070518.61E5C10217@opal>
	<20120802221526.GC16306@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120802221526.GC16306@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Paul Eggleton : qt4: allow recipes building commercial edition
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
X-List-Received-Date: Fri, 03 Aug 2012 07:29:14 -0000
X-Groupsio-MsgNum: 26855
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline

--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 03, 2012 at 12:15:26AM +0200, Martin Jansa wrote:
> On Tue, Jul 31, 2012 at 07:05:17AM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 2be0058fc4acddab611637656183accd052b40eb
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3D2be0058fc4acddab611637656183accd052b40eb
> >=20
> > Author: Paul Eggleton <paul.eggleton@linux.intel.com>
> > Date:   Tue Jul 31 00:31:00 2012 +0100
> >=20
> > qt4: allow recipes building commercial edition
> >=20
> > To enable building the commercial edition of Qt (through additional
> > recipes that are *not* provided by OE-Core) we need to tweak a few
> > things:
> >=20
> > * Don't make recipes that inherit qt4x11.bbclass depend on qt4-x11-free
> >   - instead add qt4-x11 to DEPENDS and then have qt4-x11-free include
> >   this in its PROVIDES. A commercial equivalent recipe should do the
> >   same.
> > * Add a QT_LICENSE_FILE variable that can be used to specify the license
> >   file required by the commercial edition.
> > * Add a QT_LICENSE_FLAGS variable which the recipe can set to select the
> >   license option being used. The default of "-opensource" retains the
> >   current behaviour; a commercial recipe should set it to "-commercial".
> >=20
> > Fixes [YOCTO #2505].
> >=20
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> After this patch I see, libdummy.prl created again
> OE @ ~/projects/shr-chroot $ ll include/WebCore/libdummy.prl
> -rw-r--r-- 1 bitbake bitbake 651 Aug  2 19:23 include/WebCore/libdummy.prl
>=20
> originally fixed by:
> http://git.openembedded.org/openembedded-core/commit/?id=3D7d3fd68480d54a=
8ef0d91a772df3506cd45ef2c2
>=20
> Do you have any idea why it's broken again? If you still have log.do_conf=
igure logs, can you check for
> WARNING: DESTDIR: Cannot access directory '/include/WebCore'
> ?
>=20
> Cheers,

Hmm even more this time:
ISIS_OUT/
ISIS_OUT/include
ISIS_OUT/include/webkit
ISIS_OUT/include/webkit/npapi
ISIS_OUT/include/webkit/npapi/nptypes.h
ISIS_OUT/include/webkit/npapi/npapi.h
ISIS_OUT/include/webkit/npapi/npupp.h
ISIS_OUT/include/webkit/npapi/npruntime.h

Created in dir one level above dir from where bitbake was started.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAbewoACgkQN1Ujt2V2gBwQ+ACeMbVGniL+7YGtqizdSQp356o9
ajsAnjXzEIFMOnBsomvcDtjn9c83156v
=l9J8
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
