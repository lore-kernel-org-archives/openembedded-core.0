Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id AC396605BB;
	Wed,  2 Dec 2015 08:16:10 +0000 (UTC)
Received: by wmww144 with SMTP id w144so45890613wmw.0;
	Wed, 02 Dec 2015 00:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kKPXoHKx5FxXfqKD5vz7b6ODUgD+C5y7RTVixpLV9dw=;
	b=ZOHKLPnp1lLKt27c/resEWiVS0Zwdo9XAcbwZhWVFSMXYMI8o71lR0c4i2h/iKI1+y
	+dQCiAiFdlAbeCqZXiiBYaCZwrapBzs/F+DCeA3KXD1XH8+9QEMCpVd7xC/oQAM5sNcG
	BrnppXMvpUQOF2ArR0sp96LODy1nevGnYXHFIoVicHKJ2XmBSmIMJJXKiTFqRSwRjbes
	pJ15gD7/UapnNmDSnf/W/Ir1xX0zlNeChDgwTMjICacg7EVBs7hcajED1lnd+1Nl+uRz
	Zdh/pCJBT/DTvYRGA8/pJAeutXi6jfmBbA0hzUpiOfTkxmUMtAMcdxb19/yQiaFM3aMT
	fqOA==
X-Received: by 10.194.115.129 with SMTP id jo1mr2843145wjb.28.1449044170443;
	Wed, 02 Dec 2015 00:16:10 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	qm9sm1578087wjc.39.2015.12.02.00.16.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Dec 2015 00:16:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Dec 2015 09:17:13 +0100
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20151202081713.GA2248@jama>
References: <1633798.xAxFJSpIzb@peggleto-mobl.ger.corp.intel.com>
	<41399562.aYmIK0zX5I@peggleto-mobl.ger.corp.intel.com>
	<20151201104720.GB2251@jama>
	<9135219.GRnf9JIkFP@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <9135219.GRnf9JIkFP@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-architecture@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: Patchwork & patch handling improvements
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
X-List-Received-Date: Wed, 02 Dec 2015 08:16:12 -0000
X-Groupsio-MsgNum: 74224
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline

--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 02, 2015 at 04:01:40PM +1300, Paul Eggleton wrote:
> On Tue, 01 Dec 2015 11:47:20 Martin Jansa wrote:
> > On Tue, Dec 01, 2015 at 07:49:50AM +1300, Paul Eggleton wrote:
> > > Hi Trevor,
> > >=20
> > > On Mon, 30 Nov 2015 10:19:35 Trevor Woerner wrote:
> > > > On 11/26/15 16:00, Paul Eggleton wrote:
> > > > > I'm also
> > > > > trying to ensure that the patch validation is generic enough so i=
t can
> > > > > live in OE-Core, and thus we can easily update and refine it over=
 time
> > > > > in
> > > > > line with the code itself as well as encourage submitters to use =
the
> > > > > script on their own changes before sending.
> > > >=20
> > > > This all sounds like an improvement and is therefore a step in the =
right
> > > > direction :-)
> > > >=20
> > > > A while back I had the idea of "porting" the kernel's "checkpatch.p=
l" to
> > > > The Yocto Project (it was around the same time that I was trying to
> > > > float the whole "Maintainers File" idea too, since I was also tryin=
g to
> > > > re-purpose "get-maintainer.pl" as well). About one minute into that
> > > > effort I realized the existing *.bb files were all over the place in
> > > > terms of the order of statements and the order of the blocks of
> > > > statements. At that time I found one recipe style guide from OE, and
> > > > another one from The Yocto Project, each of which described a sligh=
tly
> > > > different preference. So I asked on the mailing list and quickly
> > > > discovered that both groups prefer a different style.
> > > >=20
> > > > I'm not saying this job isn't worth doing, but I am pointing out th=
ere's
> > > > the potential for feathers to be ruffled on both sides if someone t=
ries
> > > > to produce a definitive style guide for recipe files and then enfor=
ces
> > > > it in an automated way. Since it is the OpenEmbedded Project's job =
to
> > > > provide the recipes for The Yocto Project, I'm guessing this questi=
on
> > > > needs to be decided by them? If that sounds reasonable, then maybe =
The
> > > > Yocto Project needs to acquiesce to OE's decision?
> > >=20
> > > I don't think there's that much of a division. I don't recall if it w=
as
> > > you
> > > that raised it at the time but the issue of having two style guides d=
id
> > > get
> > > rectified - I changed the one on the Yocto Project wiki to simply be a
> > > link to the OE style guide in June last year. It certainly didn't come
> > > about through a conscious decision to have a different style.
> > >=20
> > > However there is a minor disagreement over indentation for shell func=
tions
> > > between OE-Core and other layers - this persists because of the
> > > backporting
> > > pain a blanket replacement would potentially lead to. As I recall thi=
s did
> > > get discussed at the OE TSC level. I think that's one thing we could =
just
> > > not evaluate (or make an option) until such time as we resolve the
> > > difference - and I do mean to see it resolved at some point in the
> > > future.
> >=20
> > Using consistent indentation (4 spaces) at least for new metadata would
> > be step in right direction.
> >=20
> > With the amount of changes which are backported to older releases I
> > still don't see this "backporting pain" argument. Doing it just before
> > the release is of course useful, because e.g. now more changes will be
> > backported to Jethro than to Fido or Dizzy. So having consistent
> > indentation in Jethro and master would prevent 95% of "backporting
> > pain". Maybe some Yocto 10.0 will finally get the meaning of
> > "consistent" indentation.
>=20
> I agree it's not ideal. I said above, I do want to see it resolved.
>=20
> Leaving indentation aside for a moment do you have any comments on my=20
> proposal?

I'm not familiar with FDO fork, so I don't know how it looks and
behaves, but any improvement on patchwork side is definitely welcome and
I appreciate it.

Does it support e.g. moving the patches to given bundle based on some
substring in subject? To sort e.g. meta-networking, meta-java,
meta-browser, .. patches automatically?

I don't expect FDO fork to provide other features I'm used to from
gerrit like cherry-picking to selected branch from the UI or doing the
review there. But still if we're stuck with patchwork forever (because
some people hate gerrit), then any improvement is really appreciated,
thanks for looking into it.

My only concern is about migrating current database, do you know if the
migration will keep the database including bundles as they are or do you
plan to set FDO version in parallel at least for some transition period?
Currently I have many patches in flight, because jenkins is running full
test-dependencies job for last 11 and based on progress it will take
14-21 more days to finish.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZeqQgACgkQN1Ujt2V2gByILgCgsz4MP5HrShQ/7w4zSBxJ4U21
nkkAn1JXz3YgOpQiogPJC36OlcT+wtoz
=g5s+
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
