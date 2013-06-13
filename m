Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id B3D656A9D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2013 21:38:10 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id z15so5040770ead.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2013 14:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6QQFLyOWChT/hsVnbH+CuDQRUoVXI3uM0dlePBPRSr4=;
	b=HOAiptjUiHT/KTHFYMvvq9vAwUrpPwj4o9YCdk2m9Wamoa6/meRGEuvvTtuKd4s6GV
	pQW9TjPx+x9w2u+FBbHp394+YQFqxJCfTRQZINAJPmNzVmnBWAGbY9yXSRwpl/vQaret
	q94tZKiaGMpicOTK7ok88e+/MEr/X8EERf1jnu5pRbTyQqv7Wu80JS/lOcjnSbUKfW4l
	dj+sZwOJ2ODFdlzOSwYTE4lnSPCpFMi/mLwE937mRPGbApPuNMNWyRUYbl+ln/ZPQsNG
	bY3CERk5ibuPDLD5ApHWpuBxmnH6TbyqBrQWHKRgvKbrocPYyylFi2jrPZvs4W/tyVMM
	5FuQ==
X-Received: by 10.14.199.134 with SMTP id x6mr3279266een.114.1371159491129;
	Thu, 13 Jun 2013 14:38:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	s43sm46363941eem.13.2013.06.13.14.38.08 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 13 Jun 2013 14:38:09 -0700 (PDT)
Date: Thu, 13 Jun 2013 23:38:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130613213834.GA14021@jama>
References: <1371000065-23866-1-git-send-email-net147@gmail.com>
	<51BA371D.8030609@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <51BA371D.8030609@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Qt fixes
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
X-List-Received-Date: Thu, 13 Jun 2013 21:38:11 -0000
X-Groupsio-MsgNum: 40582
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2013 at 02:18:21PM -0700, Saul Wold wrote:
> On 06/11/2013 06:21 PM, Jonathan Liu wrote:
> > A couple of Qt fixes. These have been tested by Paul Eggleton.
> > I have fixed some typos in the commit message for Felipe's patch and
> > dropped the note regarding the build system going crazy as requested by
> > Paul.
> >
> > Felipe F. Tonello (1):
> >    qt: update qmake2 class to export qconfig.pri mkspec
> >
> > Jonathan Liu (1):
> >    classes/qmake_base: allow parallel make
> >
> >   meta/classes/qmake2.bbclass     | 1 +
> >   meta/classes/qmake_base.bbclass | 2 +-
> >   2 files changed, 2 insertions(+), 1 deletion(-)
> >
>=20
> Jonathan,
>=20
> I think your patches may be causing this failure:
>=20
> > | mv -f libQtFeedbackE.so.1.2.0 libQtFeedbackE.so libQtFeedbackE.so.1 l=
ibQtFeedbackE.so.1.2 ../../lib/
> > | { test -z "../../lib/" || cd "../../lib/"; } && test $(gdb --version =
| sed -e 's,[^0-9]\+\([0-9]\)\.\([0-9]\).*,\1\2,;q') -gt 72 && gdb --nx --b=
atch --quiet -ex 'set confirm off' -ex "save gdb-index ." -ex quit 'libQtFe=
edbackE.so.1.2.0' && test -f libQtFeedbackE.so.1.2.0.gdb-index && objcopy -=
-add-section '.gdb_index=3DlibQtFeedbackE.so.1.2.0.gdb-index' --set-section=
-flags '.gdb_index=3Dreadonly' 'libQtFeedbackE.so.1.2.0' 'libQtFeedbackE.so=
=2E1.2.0' && rm -f libQtFeedbackE.so.1.2.0.gdb-index || true
> > | /bin/sh: gdb: command not found
> > | /bin/sh: line 0: test: -gt: unary operator expected
>=20
> See the world build log:
> http://autobuilder.yoctoproject.org:8011/builders/nightly-world/builds/16=
9/steps/Building%20Images/logs/stdio
>=20
> I did not catch this as I have gdb installed locally, but this does not=
=20
> seem very cross-compile friendly and we have not seen it before.

Is qt4 now trying to use gdb_dwarf_index? see
https://github.com/meta-qt5/meta-qt5/commit/1a272bc79d0e9aba9385d00b0aa1acf=
116552ad5

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlG6O9oACgkQN1Ujt2V2gBwc/ACgkzvAX4Nro4crC0PtGYwq/UJP
0XYAnA08aUMQiwTppKRPcgUF2u2zL831
=1tBh
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
