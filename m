Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5B3686B4F7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 22:32:32 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id d1so222927wiv.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Apr 2014 15:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9brbFSb2TNHCqZm47aLEstzvIZCWSwOKT79LftgcMGQ=;
	b=oGLnwPJtwfZC9f8R5kr8PCqk6v39d80UqAcxjfL3GwmzkMTJ3hunaMRzXevn66vTiY
	IZL5gDBaABx/fhx3Ng04+hLXRgavkkaE1Ax0AsigVwOpXk9bgvzJEamiBkZSGwwuP2/q
	rLw3vj52Wumv81g320qMg/5E8TnMQQh3I+FidNyVhxTwZQU9x0OWHDc87YaaXnuVFYRC
	56rEM6GAPbR1oCWTFH4E87ZnhMjlZg0Cl8ohatz3FzfwILlLyGH/XGnpQgZbBPwmfMib
	v8gjrGxVrVXL50wbccz276KXYAhOyIP5im7EUpLhOszaJRPQd+sB/oKkSQSL+k28DmUC
	Rb4Q==
X-Received: by 10.180.93.133 with SMTP id cu5mr14820652wib.47.1396564353350;
	Thu, 03 Apr 2014 15:32:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o5sm15104304eeg.8.2014.04.03.15.32.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Apr 2014 15:32:32 -0700 (PDT)
Date: Fri, 4 Apr 2014 00:32:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20140403223234.GH2132@jama>
References: <1396313895-21200-1-git-send-email-denis@denix.org>
	<CANyK_8cu-czs-qmB1PJHosLt-TYnmu=u8F9J9ip1MmVZuE7zVA@mail.gmail.com>
	<CANyK_8f0=bEjKFZGMW7cTEL-_BiXPo9a93zrvz_gwYkH4Nn5vg@mail.gmail.com>
	<20140403162312.GB3370@denix.org>
MIME-Version: 1.0
In-Reply-To: <20140403162312.GB3370@denix.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [dora][PATCH] opkg-utils: Update to latest git master
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
X-List-Received-Date: Thu, 03 Apr 2014 22:32:38 -0000
X-Groupsio-MsgNum: 52135
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X+8siUETKMkW99st"
Content-Disposition: inline

--X+8siUETKMkW99st
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 03, 2014 at 12:23:12PM -0400, Denys Dmytriyenko wrote:
> On Tue, Apr 01, 2014 at 02:04:03PM +0100, Paul Barker wrote:
> > On 1 April 2014 13:29, Paul Barker <paul@paulbarker.me.uk> wrote:
> > > On 1 April 2014 01:58, Denys Dmytriyenko <denis@denix.org> wrote:
> > >> From: Denys Dmytriyenko <denys@ti.com>
> > >>
> > >> The latest commit in opkg-utils allows packages created by opkg-buil=
d to be read
> > >> by dpkg-deb again.
> > >>
> > >> (Based on OE-Core master rev: 219944af2700ce9dbc425fac384cd32b0a8021=
23,
> > >> but all of the update-alternative fixes from master are skipped)
> > >>
> > >> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > >> Cc: Paul Barker <paul@paulbarker.me.uk>
> > >> ---
> > >>  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 2 +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/me=
ta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> > >> index 279cb74..fef0d13 100644
> > >> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> > >> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> > >> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512=
a9ba36caa9b7df079bae19f \
> > >>                      file://opkg.py;beginline=3D1;endline=3D18;md5=
=3D15917491ad6bf7acc666ca5f7cc1e083"
> > >>  RDEPENDS_${PN} =3D "python python-shell python-io python-math pytho=
n-crypt python-logging python-fcntl python-subprocess python-pickle python-=
compression python-textutils python-stringold"
> > >>  RDEPENDS_${PN}_class-native =3D ""
> > >> -SRCREV =3D "757a1664a440c60e8126443bf984e4bdf374c327"
> > >> +SRCREV =3D "c33b217016ee911718b10c9d57f9912935baf5a9"
> > >>  PV =3D "0.1.8+git${SRCPV}"
> > >>
> > >>  SRC_URI =3D "git://git.yoctoproject.org/opkg-utils \
> > >> --
> > >> 1.9.1
> > >>
> > >
> > > Personally I would prefer rebasing the existing patch and fixing the
> > > merge conflict, maintaining the patch author and existing sign offs
> > > and adding your sign off to the end. I don't know if there's a policy
> > > on this for Yocto Project.
>=20
> Of course you would, wouldn't you? :) I'm not looking for any extra credi=
t=20
> here, but it wasn't trivial to merge the existing commit while backportin=
g to=20
> dora and re-creating it was much easier. There were past precedents of th=
at,=20
> where backport fixes were "based on" the commit, instead of the actual di=
rect=20
> merge or cherry-pick of it...
>=20
>=20
> > > I've Cc'd Robert Yang as he's the stable branch maintainer for Dora as
> > > per https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance
> > >
> >=20
> > Infact, NACK on this. opkg-utils/Makefile @
> > c33b217016ee911718b10c9d57f9912935baf5a9 lists update-alternatives to
> > be installed on 'make install'.
> >=20
> > If you want just this fix, you need to keep SRCREV as is and add the
> > change from c33b217016ee911718b10c9d57f9912935baf5a9 as a new patch
> > within oe-core.
>=20
> Well, I've been using this patch in dora for some time now and it works j=
ust=20
> fine. But I understand there might be a conflict between update-alternati=
ves,=20
> so one of the possible workarounds would be to remove the new binary from=
 the=20
> package. Although that would make it even less of a backport and rather a=
 new=20
> implementation on its own... Anyway, this dpkg-deb strictness is just so=
=20
> annoying!

I haven't read whole discussion, but the idea of adding just one needed
patch from the repo into oe-core metadata seems reasonable to me (unless
someone wants to create dora branch in opkg-utils repo and cherry-pick
just that one required commit there + update SRC_URI + SRCREV
accordingly).

It's imho better than creating new "less-tested" combination of all
changes from opkg-utils with only some changes for opkg-utils recipes.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--X+8siUETKMkW99st
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM94YIACgkQN1Ujt2V2gBxMOgCfb2Yl+RDPkM0UpRWW3gBZiEl+
zR4Aniq8c34+/hgI9BWGmh9rQ31X0vrR
=JNJe
-----END PGP SIGNATURE-----

--X+8siUETKMkW99st--
