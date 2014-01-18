Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4AA206B9DD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 12:26:32 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id c13so2551736eek.17
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 04:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OwFk+w+fv+PWxkPA4b9jADsmVwJAAKkSlmuNBYOrBzc=;
	b=dXBkTfe04DtEL3aD3a7TqaDXKdgDHrBHoAgdP4ha6sGvsFUJGI3migveOsRVi27SNU
	z/7Cws76w/PKqNlz8HMkNyonPzsmXh1C9X3pEYJEqfLz0OohJJ8Zg06nlcFvEX6VBnEk
	ETANfeqiMedc4NNZDyDpIaUIK+fLkXHD5jzafsnSfJ5BD2UmS76VMjEbpkz0kaRlEzek
	th1+1ygpFl8sQeSkLcPO6o4qDxCl4sXwIntWn4BHCQn6iP7OPj9X9BzRpvbd1jCm3Que
	PcbDs1tzJyL9KMbgEWdQr/da18nTfd3R3m6abytx67py43MXq7ukDNwhXDVCc1WbH2Vs
	kO5A==
X-Received: by 10.15.36.65 with SMTP id h41mr8027718eev.0.1390047992910;
	Sat, 18 Jan 2014 04:26:32 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k41sm10921165eey.0.2014.01.18.04.26.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jan 2014 04:26:32 -0800 (PST)
Date: Sat, 18 Jan 2014 13:26:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20140118122657.GU3742@jama>
References: <cover.1389629682.git.liezhi.yang@windriver.com>
	<20140115165513.GB3742@jama> <52D74086.4030602@windriver.com>
	<20140116092556.GD3742@jama> <52D7A760.4040804@windriver.com>
MIME-Version: 1.0
In-Reply-To: <52D7A760.4040804@windriver.com>
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
X-List-Received-Date: Sat, 18 Jan 2014 12:26:32 -0000
X-Groupsio-MsgNum: 49164
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ptMYGWplstB9CqWP"
Content-Disposition: inline

--ptMYGWplstB9CqWP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2014 at 05:33:20PM +0800, Robert Yang wrote:
>=20
>=20
> On 01/16/2014 05:25 PM, Martin Jansa wrote:
> > On Thu, Jan 16, 2014 at 10:14:30AM +0800, Robert Yang wrote:
> >>
> >>
> >> On 01/16/2014 12:55 AM, Martin Jansa wrote:
> >>> On Tue, Jan 14, 2014 at 12:20:14AM +0800, Robert Yang wrote:
> >>>> * The archive*.bbclass didn't work, and there were a few problems, f=
or
> >>>>     example:
> >>>>     1) There were a few duplicated code
> >>>>     2) There was no src_dir.org (or orig), but the diff command stil=
l use
> >>>>        it, and it is not easy to fix this issue if we don't change a=
 lot
> >>>>        of the code.
> >>>>     3) It didn't archive the source for the native or gcc
> >>>>     4) The work flow is not very well
> >>>>     5) The "subprocess.call('fakeroot cp xxxx'" should be removed
> >>>>     6) And others ...
> >>>>
> >>>> * So that we have to refactor it, the benefits are:
> >>>>     1) Fix the problems and make it work well.
> >>>>     2) Reduce more than 400 lines in total.
> >>>>     3) Make it easy to use.
> >>>>
> >>>> // Robert
> >>>>
> >>>> The following changes since commit 1b636173ca88e5ccca1992f9a12367a11=
89fa674:
> >>>>
> >>>>     bitbake: toaster: Toaster GUI, generic search, filter and order =
(2014-01-10 15:20:26 +0000)
> >>>>
> >>>> are available in the git repository at:
> >>>>
> >>>>     git://git.pokylinux.org/poky-contrib rbt/archiver
> >>>>     http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Drbt/arch=
iver
> >>>
> >>> Can you send pull-request for oe-core?
> >>>
> >>
> >> Here it is:
> >> git://git.pokylinux.org/poky-contrib rbt/ar_oe
> >> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Drbt/ar=
_oe
> >
> > This still looks like poky-contrib (so it will download whole
> > poky-contrib when I add it as remote to oe-core repo).
> >
>=20
> Sorry, I can't create repo on oe-contrib, seems that I lost my key.

That's sad, you should send new one to khem to replace it, before
someone else finds your old key.

> How about:
>=20
> git fetch git://git.pokylinux.org/poky-contrib rbt/ar_oe

That still fetches whole poky repo I'm not interested in.

So I've downloaded just archiver.bbclass manually and tested it on my
use-case, I can confirm that it doesn't remove required file anymore,
but it seems that there is something terribly broken when used in
combination with rm_work or multimachine builds.

I haven't debugged it yet, but 2nd build (in the same directory) with
this new archiver included almost every recipe failed in do_patch task.

> >> // Robert
> >>
> >>>> Robert Yang (5):
> >>>>     classes/archive*.bbclass: remove archive-*-source.bbclass
> >>>>     archiver.bbclass: refactor it
> >>>>     package_rpm.bbclass: archive the source to srpm package
> >>>>     archiver.bbclass: move a few code to copyleft_compliance.bbclass
> >>>>     local.conf.sample.extended: update for the archiver
> >>>>
> >>>>    meta-yocto/conf/local.conf.sample.extended     |  72 +--
> >>>>    meta/classes/archive-configured-source.bbclass |  65 ---
> >>>>    meta/classes/archive-original-source.bbclass   |  65 ---
> >>>>    meta/classes/archive-patched-source.bbclass    |  65 ---
> >>>>    meta/classes/archiver.bbclass                  | 723 ++++++++----=
-------------
> >>>>    meta/classes/copyleft_compliance.bbclass       |  55 +-
> >>>>    meta/classes/package_rpm.bbclass               |  31 +-
> >>>>    7 files changed, 316 insertions(+), 760 deletions(-)
> >>>>    delete mode 100644 meta/classes/archive-configured-source.bbclass
> >>>>    delete mode 100644 meta/classes/archive-original-source.bbclass
> >>>>    delete mode 100644 meta/classes/archive-patched-source.bbclass
> >>>>
> >>>> --
> >>>> 1.8.3.1
> >>>>
> >>>> _______________________________________________
> >>>> Openembedded-core mailing list
> >>>> Openembedded-core@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>>
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ptMYGWplstB9CqWP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLacxEACgkQN1Ujt2V2gBxhhwCcCB38qB7Gdt51mC9Ieg/X+vrM
23oAnRJswpFvORr/OYgbBxUCDlthXXU/
=E25b
-----END PGP SIGNATURE-----

--ptMYGWplstB9CqWP--
