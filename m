Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 405C260687
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 13:48:58 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id d41so5518754eek.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 06:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uVSblgPKmr3tr5k/fgCokWza5DLHUmyuPkdqrfECDx8=;
	b=j7u17ZQXle7/Qa+R4KKEuyuIDnM+PW54ExcMB27N/8npGb1f0W09FbszWttYx7qSXU
	0XpdWCVhmo91b/3fTxEsVJPP6sdccshy596Fx3lIEUOGehws11w9f/4fsPDmIyp71Kw1
	JhMmv4XhB01boTbHoJQttHCxCbWO0hjYE9180ejtYXFLE/CNPs7Z80/d8++UIOSaPkS5
	TIpB9pOVJXGIbw3lI9Zn1ykODw57vtjE7rdWcgQk8uKKIMfN0WOTRMm/wWU6w7aFL3+K
	V7jobpQmGj2oJLEDAY1uxqsWxoyE+lRHzWvOXanSvP/mUQx+rJ5VHDVp9dqXWdEUKsrX
	8x4g==
X-Received: by 10.14.4.70 with SMTP id 46mr40771678eei.42.1373550537510;
	Thu, 11 Jul 2013 06:48:57 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m1sm69140633eex.17.2013.07.11.06.48.56 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 11 Jul 2013 06:48:56 -0700 (PDT)
Date: Thu, 11 Jul 2013 15:49:08 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Chris Larson <clarson@kergoth.com>
Message-ID: <20130711134908.GK3288@jama>
References: <20130706213931.GD3288@jama>
	<1373459893-23611-1-git-send-email-Martin.Jansa@gmail.com>
	<20130711123810.GJ3288@jama>
	<CABcZANmtvgEeJNoXe_E1CrmoCVn2CZ_kto6CE5UAXix05=Vchg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANmtvgEeJNoXe_E1CrmoCVn2CZ_kto6CE5UAXix05=Vchg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] test-dependencies: add simple script to detect missing or autoenabled dependencies
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
X-List-Received-Date: Thu, 11 Jul 2013 13:48:59 -0000
X-Groupsio-MsgNum: 41825
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cO2ZlOvi7VNgmdOy"
Content-Disposition: inline

--cO2ZlOvi7VNgmdOy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2013 at 06:28:04AM -0700, Chris Larson wrote:
> On Thu, Jul 11, 2013 at 5:38 AM, Martin Jansa <martin.jansa@gmail.com>wro=
te:
>=20
> > On Wed, Jul 10, 2013 at 02:38:13PM +0200, Martin Jansa wrote:
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  scripts/test-dependencies.sh | 253
> > +++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 253 insertions(+)
> > >  create mode 100755 scripts/test-dependencies.sh
> > >
> > > +    echo "!!!Removing tmpdir \"$tmpdir\"!!!"
> > > +    rm -rf $tmpdir/cache $tmpdir/deploy $tmpdir/pkgdata
> > $tmpdir/sstate-control $tmpdir/stamps $tmpdir/sysroots $tmpdir/work
> > $tmpdir/work-shared 2>/dev/null
> >
> > I'll send v3 which doesn't remove $tmpdir/cache between the builds, it
> > takes too long already without reparsing all recipes every time.
> >
> > Originally I was removing it as work around for
> > http://lists.openembedded.org/pipermail/bitbake-devel/2013-July/003624.=
html
> > but that's not needed for master and people probably won't be changing
> > PNBLACKLIST while this script is running.
> >
>=20
> This is quite an interesting script. It looks quite similar to my
> greedy-deps-tests[1] script, though you've taken it a step further in
> adding builds #3 and #4.
>=20
> 1. https://github.com/kergoth/oe-test-scripts#oe-test-scripts

pity I didn't know about your script before writing mine, it looks more
elegant in python

I've started with #3 the idea to detect greedy came later

Do you plan to integrate your script into oe-core? I'm fine with keeping
my shell script locally until you do. Your python script would better fit
in bitbake/oe environment and reloc-tests also looks useful.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cO2ZlOvi7VNgmdOy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHet9QACgkQN1Ujt2V2gBz0YACfYWSeGydYh2HAMAxzF6er/3kf
faAAn34hx3B+wURGidh7kZrUceWTs3FA
=/Nb7
-----END PGP SIGNATURE-----

--cO2ZlOvi7VNgmdOy--
