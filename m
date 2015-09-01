Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2354576FDE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 22:45:38 +0000 (UTC)
Received: by pary6 with SMTP id y6so378601par.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 15:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=YHgqWDvu7fjNO2pi8GS5WwkpifqVd2mWw35rd5WyKJQ=;
	b=ONwb0p+XzhrKlzqtLOKxcE7JZbSk9HPCcR+i+pCHdp50+q41HtBszQsxWPtLgyTC4a
	m3bJUL8/efNTAWG7RgEmLQecgRRIxZrfCAAD1hnLcRlLjbhvG/fCAgf6XwTWLNYqFEef
	+gtGcUrtznd4YAnopyccS0vBj4ctUEn18oy03YLvykfE1KSFED6rZSLc4CA2DxYqkTl9
	AvsjYJZ4o9rdpuh32eiln2pQlrcC41tsIvJqV2yzCiSCHsvhBDuyJfsT3u460uWdiatn
	xK+ydN/OojuYzTyRMiFxU/9wXz++u3gAeTBjoQoEW0Yu+sI1zVuQN4JeIYjP2MsTdUBO
	3/2Q==
X-Received: by 10.68.69.17 with SMTP id a17mr23455939pbu.10.1441147538369;
	Tue, 01 Sep 2015 15:45:38 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:49fd:b69d:583d:d543?
	([2601:646:8601:4580:49fd:b69d:583d:d543])
	by smtp.gmail.com with ESMTPSA id
	hu13sm19340197pdb.72.2015.09.01.15.45.37
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 01 Sep 2015 15:45:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20150901215512.GE2458@jama>
Date: Tue, 1 Sep 2015 15:45:31 -0700
Message-Id: <4497316F-44B4-4B00-971F-6AC62EC19B28@gmail.com>
References: <8B394616-9009-4FF4-828C-561A859D34B3@gmail.com>
	<20150901215512.GE2458@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.2104)
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
X-List-Received-Date: Tue, 01 Sep 2015 22:45:39 -0000
X-Groupsio-MsgNum: 70449
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0CC9F2B4-3743-491D-A0B8-AA67459ACF95";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0CC9F2B4-3743-491D-A0B8-AA67459ACF95
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 1, 2015, at 2:55 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Tue, Sep 01, 2015 at 10:40:33AM -0700, Khem Raj wrote:
>> Hi All,
>>=20
>> I thought of bringing this up for discussions, I am seeing that, in =
some pull requests some patches get dropped and I understand
>> that there might be a reason for that but that reason is not =
communicated in proposed patch mail often. I have experienced with some =
of the
>> pull requests myself and seen it with some others. I think we are not =
responding to patches as it should be. Since we follow
>> just mailing list as upstreaming process thats the only channel that =
developer is engaged w.r.t. patches and there should be a conclusion
>=20
> Are you seeing this issues with patches sent for meta-oe and meta-qt5
> repositories as well?

Not specifically, moreover meta-openemebedded also uses patchwork, even =
though one way but there are updates that submitter can get through out =
patch flight even if there is no email conversation on mailing list.

>=20
> I know sometimes it takes me long time to reply, but I'm trying to =
send
> failure logs or at least some information back when I'm not taking =
some
> patches from master-next to master or worse dropping some patch from
> master-next completely.

If its predictable thats more important, we can always work towards =
reducing the cycle time.

>=20
> Second part of this problem is that sometimes there is no reply from
> original submitter for months, so I'm actively updating 4 branches to
> keep track of =E2=80=9Cstate"

thats good and if ball is in submitter=E2=80=99s court then its over and =
you can ignore and may be mark it stale
descretion is upto maintainer if the patch is important and there are =
minor issues that you can fix and accept it so be it. if it
needs submitters attention and submitters doesn't follow up. Ignore it =
by all means.

>=20
> * origin/master
> * origin/master-next (patches without terrible issues which seem to me =
at
>  least worth trying on my jenkins world builds - that doesn't mean =
that
>  there isn't NAK on ML about some other issues - but I still want to
>  build test it asap)
> * contrib/jansa/master (this is the actual branch used by jenkins =
builds,
>  it's rebased on top of master-next and can contain some of my
>  last-minute wip hotfixes I wanted to get into jenkins build even
>  before sending them to ML)
> * contrib/jansa/master-next-unresolved-review (dumping ground for
>  rejected patches abandoned by their submitters, when I get fed up =
with
>  seeing the same failure on jenkins builds and no reply from submitter
>  I move it here and partially forget about it - until new version is
>  sent and I can compare it here with older version - this branch is
>  updated only when I'm really dumping some patches

Thats good information. May be you can put it on Wiki as your patch =
flight process, so it can help submitters, when they have questions in =
this regard.


>=20
>> on the mailing list itself for a given patch. So I would request to =
whoever along with Richard is validating the patches and bringing them =
to OE-Core from mailing lists to respond to the patches especially the =
ones that are not applied with reasons why its not applied and similarly =
to the ones that are applied but has been rejected by some reviewers. It =
would also be good to document the commit criteria somewhere, so =
developer can do rework and ease the pressure on maintainers. Can we =
explore some tools that can help here ? May be failed errors.yp.org =
output can be sent to list of developers whose patches has been part of =
staging ?
>=20
> I fully agree that some tooling is needed, especially now with jenkins
> builds with 20+ failures, my intake process is greping console logs =
from
> all 3 jenkins worlds to see if modified component was even built, then
> greping the other report for possible new QA issues, then trying to =
find
> thread on ML if some reviewer reported really blocking issues (or
> something which can be easily fixed in follow-up patch) - sometimes I
> open the patch on patchwork from master-next bundle and check it =
there,
> because I still need to mark it as "Accepted" there - the git hook =
doesn't
> work for last few years (never finds anything to close).
>=20

I think a tool like gerrit or phabricator might be worth exploring. =
Which can have multiple staging per
patch and lot of hooks. The key piece would be to tool, pre-commit start =
of jenkins build ideally, when a patch shows up on the tool
it can start a reduced build bitbake <changed-component>, however its a =
bit involved process to setup these tools


> In the end this process is very error-prone and I often need to ask a
> bit later for follow up fix for e.g. QA issues which weren't noticed,
> because in the jenkins build I was using for check they were already
> reused from sstate.
>=20
> There is also small issue with errors.yp.org that many components fail
> with so big log.do_compile that whole submission is rejected =
(currently
> happens for qemux86* builds where webkit-efl is failing after some
> changes in oe-core)

may be a bug report for YP tinderbox.?

>=20
>> I think its extremely important to keep a developer informed and =
engaged about the upstreaming if we want to encourage more voluntary =
participation in the project.
>>=20
>> It would be good to identify where we have bottlenecks and how can we =
improve upon the situation, ideas are welcome.
>=20
> I hate to say it, but for meta-oe and meta-qt5 I would like to use
> gerrit - it's great to see all related information (all revisions of =
the
> patch, all review comments, all results of verification builds) in
> single location from where you do the actual submissions to official
> branch when all criteria are satisfied.

I would support this, however, we need a gerrit instance setup and some =
volunteer to help set it up and maintain it. Any volunteers ?



--Apple-Mail=_0CC9F2B4-3743-491D-A0B8-AA67459ACF95
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXmKo8ACgkQuwUzVZGdMxRdvACeIn7HtFkjDwmWMTL7uzd5JPPc
0MoAn1rdeFbG1/TWi62i/eGt2aLEKjLU
=VBkK
-----END PGP SIGNATURE-----

--Apple-Mail=_0CC9F2B4-3743-491D-A0B8-AA67459ACF95--
