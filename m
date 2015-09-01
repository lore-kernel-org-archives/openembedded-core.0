Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9532676B7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 21:54:58 +0000 (UTC)
Received: by wiclp12 with SMTP id lp12so44727598wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 14:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=v14+M43Bb0v3UDJZ/YepKT2wp3gnQ0yRV4TxCYOw9Bg=;
	b=y0vkCnWBLzKWQDLHO2d1VWgVGuQkz2iPzuNc/odgnNieMc1Cd8ST4Lf5ABPoNitdW6
	lWtgAkc2LKce13RLOELNq+W7ctVnMO+WlHw/G3W8gMXgqn2TzSn7z56G0Dt6Nf6tZ87O
	EOyOcPluCjfQjtmq6qvD+P9C0gC3AcRRXLnQNiQkglYayxPs71kjhtH18ULY52b6fPIl
	6qInnfHnAbpcu0yLocLlB1ce6K41FGt3aXpFXKl3r4pCBnLsErRvamDaOJ+lsT/u5A60
	4OTc4IjEeyPbzxORn4dHSit3nmYaYr+btU2o2Yj6x2rL/TFbj2PsFg7NjYiz/jL0eUdR
	rswg==
X-Received: by 10.180.208.34 with SMTP id mb2mr345219wic.88.1441144497364;
	Tue, 01 Sep 2015 14:54:57 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	mc18sm322520wic.23.2015.09.01.14.54.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Sep 2015 14:54:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 1 Sep 2015 23:55:12 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20150901215512.GE2458@jama>
References: <8B394616-9009-4FF4-828C-561A859D34B3@gmail.com>
MIME-Version: 1.0
In-Reply-To: <8B394616-9009-4FF4-828C-561A859D34B3@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patch merge process
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
X-List-Received-Date: Tue, 01 Sep 2015 21:54:59 -0000
X-Groupsio-MsgNum: 70442
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="N1GIdlSm9i+YlY4t"
Content-Disposition: inline

--N1GIdlSm9i+YlY4t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2015 at 10:40:33AM -0700, Khem Raj wrote:
> Hi All,
>=20
> I thought of bringing this up for discussions, I am seeing that, in some =
pull requests some patches get dropped and I understand
> that there might be a reason for that but that reason is not communicated=
 in proposed patch mail often. I have experienced with some of the
> pull requests myself and seen it with some others. I think we are not res=
ponding to patches as it should be. Since we follow
> just mailing list as upstreaming process thats the only channel that deve=
loper is engaged w.r.t. patches and there should be a conclusion

Are you seeing this issues with patches sent for meta-oe and meta-qt5
repositories as well?

I know sometimes it takes me long time to reply, but I'm trying to send
failure logs or at least some information back when I'm not taking some
patches from master-next to master or worse dropping some patch from
master-next completely.

Second part of this problem is that sometimes there is no reply from
original submitter for months, so I'm actively updating 4 branches to
keep track of "state"

* origin/master
* origin/master-next (patches without terrible issues which seem to me at
  least worth trying on my jenkins world builds - that doesn't mean that
  there isn't NAK on ML about some other issues - but I still want to
  build test it asap)
* contrib/jansa/master (this is the actual branch used by jenkins builds,
  it's rebased on top of master-next and can contain some of my
  last-minute wip hotfixes I wanted to get into jenkins build even
  before sending them to ML)
* contrib/jansa/master-next-unresolved-review (dumping ground for
  rejected patches abandoned by their submitters, when I get fed up with
  seeing the same failure on jenkins builds and no reply from submitter
  I move it here and partially forget about it - until new version is
  sent and I can compare it here with older version - this branch is
  updated only when I'm really dumping some patches

> on the mailing list itself for a given patch. So I would request to whoev=
er along with Richard is validating the patches and bringing them to OE-Cor=
e from mailing lists to respond to the patches especially the ones that are=
 not applied with reasons why its not applied and similarly to the ones tha=
t are applied but has been rejected by some reviewers. It would also be goo=
d to document the commit criteria somewhere, so developer can do rework and=
 ease the pressure on maintainers. Can we explore some tools that can help =
here ? May be failed errors.yp.org output can be sent to list of developers=
 whose patches has been part of staging ?

I fully agree that some tooling is needed, especially now with jenkins
builds with 20+ failures, my intake process is greping console logs from
all 3 jenkins worlds to see if modified component was even built, then
greping the other report for possible new QA issues, then trying to find
thread on ML if some reviewer reported really blocking issues (or
something which can be easily fixed in follow-up patch) - sometimes I
open the patch on patchwork from master-next bundle and check it there,
because I still need to mark it as "Accepted" there - the git hook doesn't
work for last few years (never finds anything to close).

In the end this process is very error-prone and I often need to ask a
bit later for follow up fix for e.g. QA issues which weren't noticed,
because in the jenkins build I was using for check they were already
reused from sstate.

There is also small issue with errors.yp.org that many components fail
with so big log.do_compile that whole submission is rejected (currently
happens for qemux86* builds where webkit-efl is failing after some
changes in oe-core)

> I think its extremely important to keep a developer informed and engaged =
about the upstreaming if we want to encourage more voluntary participation =
in the project.
>=20
> It would be good to identify where we have bottlenecks and how can we imp=
rove upon the situation, ideas are welcome.

I hate to say it, but for meta-oe and meta-qt5 I would like to use
gerrit - it's great to see all related information (all revisions of the
patch, all review comments, all results of verification builds) in
single location from where you do the actual submissions to official
branch when all criteria are satisfied.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--N1GIdlSm9i+YlY4t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXmHr8ACgkQN1Ujt2V2gBzLXgCeJZCxmjmKU2o1CQMdOuA9aaig
L24AmwZoA7qu6vagMrRja+PO/cugfgjV
=JBC6
-----END PGP SIGNATURE-----

--N1GIdlSm9i+YlY4t--
