Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 23FF660155
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 12:37:49 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id e49so4064798eek.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 04:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7oS0S5zGHO88A77bx0ikd7b9nSTBbGGwWWwSUvE+cNQ=;
	b=l+/L9Uqcq1cUkEGMdHu6Zg0yWokmV+RNDmMuHWT7QjZTbQxqv9eq+d+JRGJ6LxSrLc
	PBi1tuWRcG5+dgL5JAC39uZEu6Zmem4gt98gpkGEzZrvoeuku/zngP2l1PRSn1Mt68i0
	NlsVLeWoXkBx6SgBxJsxquekSUaOzXwnp3TU2tuoH46YTnBq8x0SuGSG6oBg/iHQ4371
	80yhvxGBq4wA7RFViUVNJfbfSQV7+ODM7PirVofnsruayiIzdWWYuuyfi/4Y+bHxxhOH
	i0U4W0UP0fMtvKcJtsEiROtBNc662qP4OIHBfPNpHCozzCGN1uE/C6Z1FqclOAgrGsQ2
	I0AQ==
X-Received: by 10.14.203.7 with SMTP id e7mr9553933eeo.58.1390307870246;
	Tue, 21 Jan 2014 04:37:50 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id h3sm14361795eem.15.2014.01.21.04.37.49
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 04:37:49 -0800 (PST)
Date: Tue, 21 Jan 2014 13:37:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20140121123748.GB4100@jama>
References: <cover.1389629682.git.liezhi.yang@windriver.com>
	<20140115165513.GB3742@jama> <52D74086.4030602@windriver.com>
	<20140116092556.GD3742@jama> <52D7A760.4040804@windriver.com>
	<20140118122657.GU3742@jama> <52DE4EC0.0@windriver.com>
MIME-Version: 1.0
In-Reply-To: <52DE4EC0.0@windriver.com>
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
X-List-Received-Date: Tue, 21 Jan 2014 12:37:51 -0000
X-Groupsio-MsgNum: 49260
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+g7M9IMkV8truYOl"
Content-Disposition: inline

--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2014 at 06:41:04PM +0800, Robert Yang wrote:
>=20
> Hi Martin,
>=20
> I've tested the archiver.bbclass with rm_work.bbclasss again, it works fo=
r me,
> it seems that you only downloaded the archiver.bbclass was not enough, wo=
uld
> you please try this PULL? It is based on oe-core and on oe-core-contrib n=
ow:-)
> And if the error occurs, would you please show the configuration and error
> logs ?

I've tried to enable "everything" to test it properly, so my config
looks like this (BTW: it would be nice to show in local.conf.sample
what are the default values):

# Create source archive for complience with the licenses
# Enable all to properly test newer archiver backported from oe-core/master
INHERIT_DISTRO +=3D "archiver"
ARCHIVER_MODE[src] =3D "prepatch"
ARCHIVER_MODE[diff] =3D "1"
ARCHIVER_MODE[diff-exclude] ?=3D ".pc autom4te.cache patches"
ARCHIVER_MODE[dumpdata] =3D "1"
ARCHIVER_MODE[recipe] =3D "1"
ARCHIVER_MODE[log] =3D "1"

And error in do_patch:

NOTE: recipe perf-1.0-r8: task do_patch: Started
ERROR: Error executing a python function in /OE/openembedded-core/meta/reci=
pes-kernel/perf/perf.bb:
OSError: [Errno 2] No such file or directory: '/OE/tmp-eglibc/sysroots/qemu=
x86/usr/src'

ERROR: The stack trace of python calls that resulted in this exception/fail=
ure was:
ERROR:   File "do_ar_prepatch", line 6, in <module>
ERROR:
ERROR:   File "do_ar_prepatch", line 3, in do_ar_prepatch
ERROR:
ERROR:   File "archiver.bbclass", line 17, in create_tarball
ERROR:
ERROR: The code that was being executed was:
ERROR:      0002:def do_ar_prepatch(d):
ERROR:      0003:    create_tarball(d, d.getVar('S', True), 'prepatch')
ERROR:      0004:
ERROR:      0005:
ERROR:  *** 0006:do_ar_prepatch(d)
ERROR:      0007:
ERROR: [From file: 'do_ar_prepatch', lineno: 6, function: <module>]
ERROR:      0001:
ERROR:      0002:def do_ar_prepatch(d):
ERROR:  *** 0003:    create_tarball(d, d.getVar('S', True), 'prepatch')
ERROR:      0004:
ERROR:      0005:
ERROR:      0006:do_ar_prepatch(d)
ERROR:      0007:
ERROR: [From file: 'do_ar_prepatch', lineno: 3, function: do_ar_prepatch]
ERROR:      0013:    srcdir =3D srcdir.rstrip('/')
ERROR:      0014:    dirname =3D os.path.dirname(srcdir)
ERROR:      0015:    basename =3D os.path.basename(srcdir)
ERROR:      0016:    olddir =3D os.getcwd()
ERROR:  *** 0017:    os.chdir(dirname)
ERROR:      0018:    bb.note("Creating %s" % tarname)
ERROR:      0019:    if (len(os.listdir(basename))) !=3D 0:
ERROR:      0020:        tar =3D tarfile.open(tarname, "w:gz")
ERROR:      0021:        tar.add(basename)
ERROR: [From file: 'archiver.bbclass', lineno: 17, function: create_tarball]
ERROR: Function failed: do_ar_prepatch
ERROR: Logfile of failure stored in: /OE/tmp-eglibc/work/i586-oe-linux/perf=
/1.0-r8/temp/log.do_patch.28364
NOTE: recipe perf-1.0-r8: task do_patch: Failed
ERROR: Task 20159 (/OE/openembedded-core/meta/recipes-kernel/perf/perf.bb, =
do_patch) failed with exit code '1'

> git://git.openembedded.org/openembedded-core-contrib rbt/archiver
>=20
> // Robert
>=20
> On 01/18/2014 08:26 PM, Martin Jansa wrote:
> > On Thu, Jan 16, 2014 at 05:33:20PM +0800, Robert Yang wrote:
> >>
> >>
> >> On 01/16/2014 05:25 PM, Martin Jansa wrote:
> >>> On Thu, Jan 16, 2014 at 10:14:30AM +0800, Robert Yang wrote:
> >>>>
> >>>>
> >>>> On 01/16/2014 12:55 AM, Martin Jansa wrote:
> >>>>> On Tue, Jan 14, 2014 at 12:20:14AM +0800, Robert Yang wrote:
> >>>>>> * The archive*.bbclass didn't work, and there were a few problems,=
 for
> >>>>>>      example:
> >>>>>>      1) There were a few duplicated code
> >>>>>>      2) There was no src_dir.org (or orig), but the diff command s=
till use
> >>>>>>         it, and it is not easy to fix this issue if we don't chang=
e a lot
> >>>>>>         of the code.
> >>>>>>      3) It didn't archive the source for the native or gcc
> >>>>>>      4) The work flow is not very well
> >>>>>>      5) The "subprocess.call('fakeroot cp xxxx'" should be removed
> >>>>>>      6) And others ...
> >>>>>>
> >>>>>> * So that we have to refactor it, the benefits are:
> >>>>>>      1) Fix the problems and make it work well.
> >>>>>>      2) Reduce more than 400 lines in total.
> >>>>>>      3) Make it easy to use.
> >>>>>>
> >>>>>> // Robert
> >>>>>>
> >>>>>> The following changes since commit 1b636173ca88e5ccca1992f9a12367a=
1189fa674:
> >>>>>>
> >>>>>>      bitbake: toaster: Toaster GUI, generic search, filter and ord=
er (2014-01-10 15:20:26 +0000)
> >>>>>>
> >>>>>> are available in the git repository at:
> >>>>>>
> >>>>>>      git://git.pokylinux.org/poky-contrib rbt/archiver
> >>>>>>      http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Drbt/a=
rchiver
> >>>>>
> >>>>> Can you send pull-request for oe-core?
> >>>>>
> >>>>
> >>>> Here it is:
> >>>> git://git.pokylinux.org/poky-contrib rbt/ar_oe
> >>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Drbt/=
ar_oe
> >>>
> >>> This still looks like poky-contrib (so it will download whole
> >>> poky-contrib when I add it as remote to oe-core repo).
> >>>
> >>
> >> Sorry, I can't create repo on oe-contrib, seems that I lost my key.
> >
> > That's sad, you should send new one to khem to replace it, before
> > someone else finds your old key.
> >
> >> How about:
> >>
> >> git fetch git://git.pokylinux.org/poky-contrib rbt/ar_oe
> >
> > That still fetches whole poky repo I'm not interested in.
> >
> > So I've downloaded just archiver.bbclass manually and tested it on my
> > use-case, I can confirm that it doesn't remove required file anymore,
> > but it seems that there is something terribly broken when used in
> > combination with rm_work or multimachine builds.
> >
> > I haven't debugged it yet, but 2nd build (in the same directory) with
> > this new archiver included almost every recipe failed in do_patch task.
> >
> >>>> // Robert
> >>>>
> >>>>>> Robert Yang (5):
> >>>>>>      classes/archive*.bbclass: remove archive-*-source.bbclass
> >>>>>>      archiver.bbclass: refactor it
> >>>>>>      package_rpm.bbclass: archive the source to srpm package
> >>>>>>      archiver.bbclass: move a few code to copyleft_compliance.bbcl=
ass
> >>>>>>      local.conf.sample.extended: update for the archiver
> >>>>>>
> >>>>>>     meta-yocto/conf/local.conf.sample.extended     |  72 +--
> >>>>>>     meta/classes/archive-configured-source.bbclass |  65 ---
> >>>>>>     meta/classes/archive-original-source.bbclass   |  65 ---
> >>>>>>     meta/classes/archive-patched-source.bbclass    |  65 ---
> >>>>>>     meta/classes/archiver.bbclass                  | 723 ++++++++-=
----------------
> >>>>>>     meta/classes/copyleft_compliance.bbclass       |  55 +-
> >>>>>>     meta/classes/package_rpm.bbclass               |  31 +-
> >>>>>>     7 files changed, 316 insertions(+), 760 deletions(-)
> >>>>>>     delete mode 100644 meta/classes/archive-configured-source.bbcl=
ass
> >>>>>>     delete mode 100644 meta/classes/archive-original-source.bbclass
> >>>>>>     delete mode 100644 meta/classes/archive-patched-source.bbclass
> >>>>>>
> >>>>>> --
> >>>>>> 1.8.3.1
> >>>>>>
> >>>>>> _______________________________________________
> >>>>>> Openembedded-core mailing list
> >>>>>> Openembedded-core@lists.openembedded.org
> >>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>>>>
> >>>
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+g7M9IMkV8truYOl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLeahwACgkQN1Ujt2V2gBzvGACggqzB9HY1RXKdx+cdbAYuByFF
sXgAn3s4G1Ruzc2b2/4vqv7vzj+xPIm9
=wTDV
-----END PGP SIGNATURE-----

--+g7M9IMkV8truYOl--
