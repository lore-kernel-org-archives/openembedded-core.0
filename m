Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 47F256B678
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 09:25:43 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so618936eek.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 01:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0/As+9eJWLkrJA+aFR5nvSxRfk7zK83YS9YDCsPki8A=;
	b=IecJMN/442gBVnCv1936EFeGAy+v6r+lhlzQiQuUGZYCT2kHA3NJatnnRFcyZyJnBO
	ynES75tTEFmY0zE3TmPze9f+cy/sgSZ2rMd+ezr+lJF+7ET/kzbBxrnZ8lNAB451qkjo
	zweoVy96hkAl+CQ8PYptczvf/29jPX4tBhusS/d4xEcMOQhmWl8nvME/k5BPF5RtLWAD
	bihQlw1cb07IOiVOap9aNbZi7thvRoSdUkrGlFDtgH6PrB9Zp8sWzo+XhgPvdUbzZfr+
	ZggoEBzOLxO6a6YwEWXo8XxWPySRmPSOsY75tx/DiEQX0zkiBom63+OJbFjhHHhk52RJ
	CqHg==
X-Received: by 10.15.32.73 with SMTP id z49mr10774219eeu.27.1389864336350;
	Thu, 16 Jan 2014 01:25:36 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 4sm16838704eed.14.2014.01.16.01.25.34
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Jan 2014 01:25:34 -0800 (PST)
Date: Thu, 16 Jan 2014 10:25:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20140116092556.GD3742@jama>
References: <cover.1389629682.git.liezhi.yang@windriver.com>
	<20140115165513.GB3742@jama> <52D74086.4030602@windriver.com>
MIME-Version: 1.0
In-Reply-To: <52D74086.4030602@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] refactor the archive*.bbcalss
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
X-List-Received-Date: Thu, 16 Jan 2014 09:25:44 -0000
X-Groupsio-MsgNum: 49053
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ffoCPvUAPMgSXi6H"
Content-Disposition: inline

--ffoCPvUAPMgSXi6H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2014 at 10:14:30AM +0800, Robert Yang wrote:
>=20
>=20
> On 01/16/2014 12:55 AM, Martin Jansa wrote:
> > On Tue, Jan 14, 2014 at 12:20:14AM +0800, Robert Yang wrote:
> >> * The archive*.bbclass didn't work, and there were a few problems, for
> >>    example:
> >>    1) There were a few duplicated code
> >>    2) There was no src_dir.org (or orig), but the diff command still u=
se
> >>       it, and it is not easy to fix this issue if we don't change a lot
> >>       of the code.
> >>    3) It didn't archive the source for the native or gcc
> >>    4) The work flow is not very well
> >>    5) The "subprocess.call('fakeroot cp xxxx'" should be removed
> >>    6) And others ...
> >>
> >> * So that we have to refactor it, the benefits are:
> >>    1) Fix the problems and make it work well.
> >>    2) Reduce more than 400 lines in total.
> >>    3) Make it easy to use.
> >>
> >> // Robert
> >>
> >> The following changes since commit 1b636173ca88e5ccca1992f9a12367a1189=
fa674:
> >>
> >>    bitbake: toaster: Toaster GUI, generic search, filter and order (20=
14-01-10 15:20:26 +0000)
> >>
> >> are available in the git repository at:
> >>
> >>    git://git.pokylinux.org/poky-contrib rbt/archiver
> >>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Drbt/archiver
> >
> > Can you send pull-request for oe-core?
> >
>=20
> Here it is:
> git://git.pokylinux.org/poky-contrib rbt/ar_oe
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Drbt/ar_oe

This still looks like poky-contrib (so it will download whole
poky-contrib when I add it as remote to oe-core repo).

> // Robert
>=20
> >> Robert Yang (5):
> >>    classes/archive*.bbclass: remove archive-*-source.bbclass
> >>    archiver.bbclass: refactor it
> >>    package_rpm.bbclass: archive the source to srpm package
> >>    archiver.bbclass: move a few code to copyleft_compliance.bbclass
> >>    local.conf.sample.extended: update for the archiver
> >>
> >>   meta-yocto/conf/local.conf.sample.extended     |  72 +--
> >>   meta/classes/archive-configured-source.bbclass |  65 ---
> >>   meta/classes/archive-original-source.bbclass   |  65 ---
> >>   meta/classes/archive-patched-source.bbclass    |  65 ---
> >>   meta/classes/archiver.bbclass                  | 723 ++++++++-------=
----------
> >>   meta/classes/copyleft_compliance.bbclass       |  55 +-
> >>   meta/classes/package_rpm.bbclass               |  31 +-
> >>   7 files changed, 316 insertions(+), 760 deletions(-)
> >>   delete mode 100644 meta/classes/archive-configured-source.bbclass
> >>   delete mode 100644 meta/classes/archive-original-source.bbclass
> >>   delete mode 100644 meta/classes/archive-patched-source.bbclass
> >>
> >> --
> >> 1.8.3.1
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ffoCPvUAPMgSXi6H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLXpaQACgkQN1Ujt2V2gBysjACgtzoY8u3QIfhJYXWyriIsbplC
MCkAn2qiTCzqnKyBnl+QmbUn32+KQIR8
=mAr7
-----END PGP SIGNATURE-----

--ffoCPvUAPMgSXi6H--
