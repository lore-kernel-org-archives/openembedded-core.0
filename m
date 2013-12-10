Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0CF7A60FF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 16:19:14 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so2342916eek.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 08:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rCYL2RCxlqjJyEDTw/Fka6M6+F+ETUleoxeTMalI8TE=;
	b=VRemDq1tD/MfmMOvrYOOmmz7Zp1O32itQ3MNTq5KTju2FCAK+u8jSiGGdowqHjYPTt
	PECyPrV8KlEpX/htNLz47a6pjylo5lC4l9uO/g+BYpzDFe9gwzmF+dmgj1aYoOXo2aSl
	j5xifTeWMGZKYeBUpOk34R51N6ZhVXHGmGt6OzdbgtD11M2Rq/AtUnq7yPgd52VIcWJp
	v5T52ffFEVNzEmAqIA38OYETaelTiN9SYbvXTu8/dZYKelA3QmzD2Qg3e/3yY8v/kh3g
	iL3JT2qJf0swgiCSdNohNuF2gM3d287NJH6IuyHW7OmDX4/tTsmfJewyjmQ3yaNLzk1h
	3Tdw==
X-Received: by 10.14.210.200 with SMTP id u48mr33576128eeo.63.1386692353069;
	Tue, 10 Dec 2013 08:19:13 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id o1sm42919267eea.10.2013.12.10.08.19.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Dec 2013 08:19:12 -0800 (PST)
Date: Tue, 10 Dec 2013 17:19:24 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20131210161924.GG3721@jama>
References: <1386438582-26461-1-git-send-email-Martin.Jansa@gmail.com>
	<52A73622.4030608@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <52A73622.4030608@linux.intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ltp: set PREFERRED_PROVIDER and rename runtests_noltp.sh script
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
X-List-Received-Date: Tue, 10 Dec 2013 16:19:16 -0000
X-Groupsio-MsgNum: 48076
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X1xGqyAVbSpAWs5A"
Content-Disposition: inline

--X1xGqyAVbSpAWs5A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2013 at 07:41:22AM -0800, Saul Wold wrote:
> On 12/07/2013 09:49 AM, Martin Jansa wrote:
> > * ltp installs 2 different runtests_noltp.sh files from different
> >    directories into /opt/ltp/testcases/bin/runtests_noltp.sh
> >    last one installed wins and causes unexpected changes in
> >    buildhistory's files-in-image.txt report, rename them to have
> >    unique name as other ltp scripts have.
> >
> > * also define PREFERRED_PROVIDER to resolve note shown when
> >    building with meta-oe layer:
> >    NOTE: multiple providers are available for ltp (ltp, ltp-ddt)
> >    NOTE: consider defining a PREFERRED_PROVIDER entry to match ltp
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >   meta/conf/distro/include/default-providers.inc     |  2 ++
> >   ...tests_noltp.sh-script-so-have-unique-name.patch | 38 +++++++++++++=
+++++++++
> >   meta/recipes-extended/ltp/ltp_20130904.bb          |  4 ++-
> >   3 files changed, 43 insertions(+), 1 deletion(-)
> >   create mode 100644 meta/recipes-extended/ltp/ltp/0001-Rename-runtests=
_noltp.sh-script-so-have-unique-name.patch
> >
> This patch does not appear to apply correctly, I drop into patch resoluti=
on:
>=20
>=20
> *** Manual patch resolution mode ***
> Dropping to a shell, so patch rejects can be fixed manually.
> Run "quilt refresh" when patch is corrected, press CTRL+D to exit.
>=20
> Applying patch=20
> 0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch
> patch: **** Only garbage was found in the patch input.
> Patch 0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch=20
> does not apply (enforce with -f)
>=20
> Can you verify this is correct.

I'll send v2 with patch which wasn't created with -M.

I have tested both versions and both work here, but maybe you're using
different PATCHTOOL (well my bitbake -e also shows PATCHTOOL=3D"quilt",
maybe PATCHRESOLVE =3D "noop" causes different behavior here).

> > diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf=
/distro/include/default-providers.inc
> > index d4b9db0..e2b0892 100644
> > --- a/meta/conf/distro/include/default-providers.inc
> > +++ b/meta/conf/distro/include/default-providers.inc
> > @@ -43,3 +43,5 @@ PREFERRED_PROVIDER_udev ?=3D "${@base_contains('DISTR=
O_FEATURES','systemd','system
> >   # There are issues with runtime packages and PREFERRED_PROVIDER, see =
YOCTO #5044 for details
> >   # on this rather strange entry.
> >   PREFERRED_PROVIDER_bluez4 ?=3D "bluez4"
> > +# Alternative is ltp-ddt in meta-oe: meta-oe/recipes-devtools/ltp-ddt/=
ltp-ddt_0.0.4.bb
> > +PREFERRED_PROVIDER_ltp ?=3D "ltp"
> > diff --git a/meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.s=
h-script-so-have-unique-name.patch b/meta/recipes-extended/ltp/ltp/0001-Ren=
ame-runtests_noltp.sh-script-so-have-unique-name.patch
> > new file mode 100644
> > index 0000000..74abe56
> > --- /dev/null
> > +++ b/meta/recipes-extended/ltp/ltp/0001-Rename-runtests_noltp.sh-scrip=
t-so-have-unique-name.patch
> > @@ -0,0 +1,38 @@
> > +From 9751a6526cffcdf4e3dc2cb33641259a7be00e19 Mon Sep 17 00:00:00 2001
> > +From: Martin Jansa <Martin.Jansa@gmail.com>
> > +Date: Sat, 7 Dec 2013 18:24:32 +0100
> > +Subject: [PATCH] Rename runtests_noltp.sh script so have unique name
> > +
> > +* they are installed in the same target path
> > +  /opt/ltp/testcases/bin/runtests_noltp.sh
> > +  and overwrite each other in non-deterministic way
> > +  when multiple processes are used in "make install"
> > +
> > +  ./temp/log.do_install:install -m 00775
> > +    "ltp/20120903-r2/ltp-20120903/testcases/kernel/containers/sysvipc/=
runtests_noltp.sh"
> > +    "ltp/20120903-r2/image/opt/ltp/testcases/bin/runtests_noltp.sh"
> > +  ./temp/log.do_install:install -m 00775
> > +    "ltp/20120903-r2/ltp-20120903/testcases/kernel/containers/utsname/=
runtests_noltp.sh"
> > +    "ltp/20120903-r2/image/opt/ltp/testcases/bin/runtests_noltp.sh"
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > +---
> > + .../kernel/containers/sysvipc/{runtests_noltp.sh =3D> runipctests_nol=
tp.sh} | 0
> > + .../kernel/containers/utsname/{runtests_noltp.sh =3D> runutstests_nol=
tp.sh} | 0
> > + 2 files changed, 0 insertions(+), 0 deletions(-)
> > + rename testcases/kernel/containers/sysvipc/{runtests_noltp.sh =3D> ru=
nipctests_noltp.sh} (100%)
> > + rename testcases/kernel/containers/utsname/{runtests_noltp.sh =3D> ru=
nutstests_noltp.sh} (100%)
> > +
> > +diff --git a/testcases/kernel/containers/sysvipc/runtests_noltp.sh b/t=
estcases/kernel/containers/sysvipc/runipctests_noltp.sh
> > +similarity index 100%
> > +rename from testcases/kernel/containers/sysvipc/runtests_noltp.sh
> > +rename to testcases/kernel/containers/sysvipc/runipctests_noltp.sh
> > +diff --git a/testcases/kernel/containers/utsname/runtests_noltp.sh b/t=
estcases/kernel/containers/utsname/runutstests_noltp.sh
> > +similarity index 100%
> > +rename from testcases/kernel/containers/utsname/runtests_noltp.sh
> > +rename to testcases/kernel/containers/utsname/runutstests_noltp.sh
> > +--
> > +1.8.4.3
> > +
> > diff --git a/meta/recipes-extended/ltp/ltp_20130904.bb b/meta/recipes-e=
xtended/ltp/ltp_20130904.bb
> > index 5e10448..4722a38 100644
> > --- a/meta/recipes-extended/ltp/ltp_20130904.bb
> > +++ b/meta/recipes-extended/ltp/ltp_20130904.bb
> > @@ -21,7 +21,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0=
215e8d672dc4c32c317bb3 \
> >
> >   DEPENDS =3D "attr libaio libcap acl openssl"
> >
> > -SRC_URI =3D "git://github.com/linux-test-project/ltp.git"
> > +SRC_URI =3D "git://github.com/linux-test-project/ltp.git \
> > +           file://0001-Rename-runtests_noltp.sh-script-so-have-unique-=
name.patch \
> > +"
> >
> >   SRCREV =3D "a8c42db5f9314211811c36275a21f83902830dc5"
> >   S =3D "${WORKDIR}/git"
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--X1xGqyAVbSpAWs5A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKnPwwACgkQN1Ujt2V2gBy9EQCgnVSWQGWj0reL/Q2CrQflqWc8
0CUAn2AwAdgF2wpUJzEo8zly8ybqBuhu
=ZmeA
-----END PGP SIGNATURE-----

--X1xGqyAVbSpAWs5A--
