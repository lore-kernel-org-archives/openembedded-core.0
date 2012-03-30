Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SDYJy-0008SN-B6
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 11:40:38 +0200
Received: by wgbdr12 with SMTP id dr12so336224wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 02:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=T/FJ9zPLJnG2JpMtL+6NQd2zzaJJnMCSKrf0s0Xu3NA=;
	b=eezXNB1S7A+uL7uxYGxsgTXxnQJpoA2i4vZ4Up9dwp3n0F8DRC2Sze32JPmIPJnb6v
	nbuTsn6Yb01MwT43iS4rxZ69LNZYzA8u6uaJFdFn7Brejfkabwb5E2wAxJu5oI8luv58
	5aWdtDOcr1IRYfhnaMZCb0XKTLt9EcHNMbAJhOt/al2KYQDQxrPjjG9SBZ+FuDTvTyYr
	fbNXNNRD2h+DUqjbRRdiriYLpPHKMYNbICYgcjC6rCpInAJ6mUe53ZZzxYpJLmiA+8On
	62n3/A9rYMnyGs3VIo1t6GibgPQa7dSdyk/BiL2BDga7hVP4Si23WmVwvIFcQdgatC3M
	NTnA==
Received: by 10.180.98.8 with SMTP id ee8mr4618492wib.14.1333099893956;
	Fri, 30 Mar 2012 02:31:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fn2sm8090945wib.0.2012.03.30.02.31.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 02:31:32 -0700 (PDT)
Date: Fri, 30 Mar 2012 11:31:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120330093134.GM25815@jama.jama.net>
References: <1332471418-31459-1-git-send-email-raj.khem@gmail.com>
	<1332504325.9740.395.camel@ted>
	<20120323131701.GF3879@jama.jama.net>
	<20120324022639.GF4604@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120324022639.GF4604@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] eglibc-2.15: Update SRCREV
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Mar 2012 09:40:38 -0000
X-Groupsio-MsgNum: 20016
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jB+02Y6wHc2pEa2x"
Content-Disposition: inline

--jB+02Y6wHc2pEa2x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 24, 2012 at 03:26:39AM +0100, Martin Jansa wrote:
> On Fri, Mar 23, 2012 at 02:17:02PM +0100, Martin Jansa wrote:
> > On Fri, Mar 23, 2012 at 12:05:25PM +0000, Richard Purdie wrote:
> > > On Thu, 2012-03-22 at 19:56 -0700, Khem Raj wrote:
> > > > Get new patches and remove the one that got merged upstream
> > > >=20
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  .../eglibc/eglibc-2.15/GLRO_dl_debug_mask.patch    |  108 ++++++++=
++++++++++++
> > > >  .../eglibc-2.15/armv4-eabi-compile-fix.patch       |   25 -----
> > > >  .../eglibc/eglibc-2.15/initgroups_keys.patch       |   20 ++++
> > > >  meta/recipes-core/eglibc/eglibc_2.15.bb            |    5 +-
> > > >  4 files changed, 131 insertions(+), 27 deletions(-)
> > > >  create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/GLRO_dl_de=
bug_mask.patch
> > > >  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/armv4-eabi=
-compile-fix.patch
> > > >  create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/initgroups=
_keys.patch
> > >=20
> > > Since 2.15 isn't the default I'm tempted to merge this despite the po=
int
> > > we're at in the release cycle. I'd like to give anyone using this the
> > > opportunity to comment first though.
> >=20
> > I'm testing this on all archs I'm using (armv4t, armv5te, armv7a,
> > x86-64) and will report tomorrow.
>=20
> Doesn't look related to this change, but I got interesing error on other
> buildhost (on mine everything seems fine sofar including tests on
> target), I don't have log from armv4t build on mine, because it's on tmpfs
> and there was unexpected reboot when I wasn't home :/.
>=20
> Failing is testing ld from armv4t-oe-linux-gnueabi.gcc-cross-intermediate:
> configure:4894: checking whether /var/lib/jenkins/jobs/shr-core/workspace=
/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnue=
abi.gcc-cross-intermediate/gcc/arm-oe-linux-gnueabi/4.6.4/as is GNU as
> configure:4908: result: yes
> configure:4913: checking whether /var/lib/jenkins/jobs/shr-core/workspace=
/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnue=
abi.gcc-cross-intermediate/gcc/arm-oe-linux-gnueabi/4.6.4/ld is GNU ld
> configure:4927: result: yes
> configure:4937: checking for /var/lib/jenkins/jobs/shr-core/workspace/shr=
-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueabi.=
gcc-cross-intermediate/gcc/arm-oe-linux-gnueabi/4.6.4/as
> configure:4964: result: /var/lib/jenkins/jobs/shr-core/workspace/shr-core=
/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueabi.gcc-c=
ross-intermediate/gcc/arm-oe-linux-gnueabi/4.6.4/as
> configure:4979: checking version of /var/lib/jenkins/jobs/shr-core/worksp=
ace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-g=
nueabi.gcc-cross-intermediate/gcc/arm-oe-linux-gnueabi/4.6.4/as
> configure:4989: result: 2.22, ok
> configure:5000: checking for /var/lib/jenkins/jobs/shr-core/workspace/shr=
-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueabi.=
gcc-cross-intermediate/gcc/arm-oe-linux-gnueabi/4.6.4/ld
> configure:5027: result: /var/lib/jenkins/jobs/shr-core/workspace/shr-core=
/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueabi.gcc-c=
ross-intermediate/gcc/arm-oe-linux-gnueabi/4.6.4/ld
> configure:5042: checking version of /var/lib/jenkins/jobs/shr-core/worksp=
ace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-g=
nueabi.gcc-cross-intermediate/gcc/arm-oe-linux-gnueabi/4.6.4/ld
> configure:5052: result: v. ?.??, bad

this could be partially fixed by
--- ../glibc-2.15/configure     2012-03-30 11:22:50.507987687 +0200
+++ ../glibc-2.15/configure.new 2012-03-30 11:22:39.934987828 +0200
@@ -4804,6 +4804,7 @@
   { $as_echo "$as_me:${as_lineno-$LINENO}: checking version of $LD" >&5
 $as_echo_n "checking version of $LD... " >&6; }
   ac_prog_version=3D`$LD --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9][0-=
9]*\.[0-9.]*\).*$/\1/p'`
+  test -z $ac_prog_version && ac_prog_version=3D`$LD --version 2>&1 | sed =
-n 's/^.*GNU gold.* Binutils \([0-9][0-9]*\.[0-9.]*\)) .*$/\1/p'`
   case $ac_prog_version in
     '') ac_prog_version=3D"v. ?.??, bad";
        ac_verc_fail=3Dyes;;

But later it fails with:
checking for i386 TLS support... no
configure: error: the assembler must support TLS

configure:7901: result: running configure fragment for sysdeps/i386/elf
configure:88: checking for i386 TLS support
configure:110: gcc -c -g -O2 conftest.s 1>&5
conftest.s: Assembler messages:
conftest.s:8: Error: @TLSLDM reloc is not supported with 64-bit output form=
at
conftest.s:8: Error: junk `@TLSLDM' after expression
conftest.s:9: Error: relocated field and relocation type differ in signedne=
ss
conftest.s:10: Error: relocated field and relocation type differ in signedn=
ess
conftest.s:11: Error: relocated field and relocation type differ in signedn=
ess
conftest.s:12: Error: @GOTNTPOFF reloc is not supported with 64-bit output =
format
conftest.s:12: Error: junk `@GOTNTPOFF' after expression
conftest.s:14: Error: @NTPOFF reloc is not supported with 64-bit output for=
mat
conftest.s:14: Error: junk `@NTPOFF' after expression
configure:113: $? =3D 1
configure:121: result: no
configure:124: error: the assembler must support TLS

So eglibc should always use ld.bfd even with gold enabled for rest of build=
 and not ld found in=20
sysroots/x86_64-linux/usr/libexec/armv5te-oe-linux-gnueabi.gcc-cross-interm=
ediate

> working is testing ld directly from native sysroot:
> configure:4894: checking whether /OE/shr-core/tmp-eglibc/sysroots/x86_64-=
linux/usr/libexec/armv5te-oe-linux-gnueabi.gcc-cross-intermediate/gcc/arm-o=
e-linux-gnueabi/4.6.4/as is GNU as
> configure:4908: result: yes
> configure:4913: checking whether /OE/shr-core/tmp-eglibc/sysroots/x86_64-=
linux/usr/bin/armv5te-oe-linux-gnueabi/arm-oe-linux-gnueabi-ld.bfd is GNU ld
> configure:4927: result: yes
> configure:4937: checking for /OE/shr-core/tmp-eglibc/sysroots/x86_64-linu=
x/usr/libexec/armv5te-oe-linux-gnueabi.gcc-cross-intermediate/gcc/arm-oe-li=
nux-gnueabi/4.6.4/as
> configure:4964: result: /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr=
/libexec/armv5te-oe-linux-gnueabi.gcc-cross-intermediate/gcc/arm-oe-linux-g=
nueabi/4.6.4/as
> configure:4979: checking version of /OE/shr-core/tmp-eglibc/sysroots/x86_=
64-linux/usr/libexec/armv5te-oe-linux-gnueabi.gcc-cross-intermediate/gcc/ar=
m-oe-linux-gnueabi/4.6.4/as
> configure:4989: result: 2.22, ok
> configure:5000: checking for /OE/shr-core/tmp-eglibc/sysroots/x86_64-linu=
x/usr/bin/armv5te-oe-linux-gnueabi/arm-oe-linux-gnueabi-ld.bfd
> configure:5027: result: /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr=
/bin/armv5te-oe-linux-gnueabi/arm-oe-linux-gnueabi-ld.bfd
> configure:5042: checking version of /OE/shr-core/tmp-eglibc/sysroots/x86_=
64-linux/usr/bin/armv5te-oe-linux-gnueabi/arm-oe-linux-gnueabi-ld.bfd
> configure:5052: result: 2.22, ok
>=20
> Cheers,
>=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jB+02Y6wHc2pEa2x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk91fXYACgkQN1Ujt2V2gBzGFQCbBMiCVfCvF0+sjRPMNJf0jR6I
ReMAnRZy3KbKTLQ+qnCazWswhOBHanVz
=XADD
-----END PGP SIGNATURE-----

--jB+02Y6wHc2pEa2x--
