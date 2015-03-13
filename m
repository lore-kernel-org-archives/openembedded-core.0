Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id A2FD36013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 13:45:22 +0000 (UTC)
Received: by wghk14 with SMTP id k14so23338382wgh.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 06:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HXDHBl6Mp/9wj5J6cIJH13u0/nVmiI99SLLtx/+tp5s=;
	b=fOL0jJqUknKM0yfur6zcI1awmO98RlzNJCcaf6PSe4CZWjJLzU81ATg2GfAlRSi+rk
	HzVvhBRO3kdjyTIi/Zkv9v4rGarrHDJDkJHKJhyeeN03Fy3Pocr4a9N7Y3YA1qMl2xiw
	G7MjERS2DPTbPTFgFD8IlSZS6dISbmDje9sON0RbQKLi5kIgFBaV5Lt2qYtPKoVqjahe
	YJm6KTTL/ii3fDGMFScPfRhueriEFDF6xOI/n2NwSHkisSIjBXDaN+VtqrVtRc7TTUHT
	q0mRcEEERHQFT+pw3TBbxBmQgB0hZrV2sdNuikF3Lyr0hk7gfX9lAxolgls0ZBiDXWTG
	MBRA==
X-Received: by 10.194.190.10 with SMTP id gm10mr97868880wjc.91.1426254323009; 
	Fri, 13 Mar 2015 06:45:23 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e18sm2880609wjz.27.2015.03.13.06.45.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Mar 2015 06:45:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 13 Mar 2015 14:46:15 +0100
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20150313134615.GA2345@jama>
References: <1425491208-7670-1-git-send-email-sgw@linux.intel.com>
	<55012FB3.2030404@windriver.com>
MIME-Version: 1.0
In-Reply-To: <55012FB3.2030404@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: Upgrade to 1.0.2
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
X-List-Received-Date: Fri, 13 Mar 2015 13:45:24 -0000
X-Groupsio-MsgNum: 63299
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline

--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2015 at 02:18:27PM +0800, Robert Yang wrote:
>=20
> I met this error when building openflow in meta-networking, I guess it ma=
ybe
> related to the upgraded:
>=20
> x86_64-wrs-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=
=3Dsse=20
> --sysroot=3D/buildarea/lyang1/test_qemux86-64/bitbake_build/tmp/sysroots/=
qemux86-64 -Wstrict-prototypes=20
>   -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wno-sign-compare=20
> -Wpointer-arith -Wdeclaration-after-statement -Wformat-security -Wswitch-=
enum=20
> -Wunused-parameter -Wstrict-aliasing -Wbad-function-cast -Wcast-align=20
> -Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes=20
> -Wmissing-field-initializers -Wno-override-init -export-dynamic -Wl,-O1=
=20
> -Wl,--hash-style=3Dgnu -Wl,--as-needed -o secchan/ofprotocol secchan/disc=
overy.o=20
> secchan/emerg-flow.o secchan/fail-open.o secchan/failover.o secchan/in-ba=
nd.o=20
> secchan/port-watcher.o secchan/protocol-stat.o secchan/ratelimit.o=20
> secchan/secchan.o secchan/status.o secchan/stp-secchan.o lib/libopenflow.=
a -ldl=20
> -L/buildarea/lyang1/test_qemux86-64/bitbake_build/tmp/sysroots/qemux86-64=
/usr/lib64=20
> -lssl
> /buildarea/lyang1/test_qemux86-64/bitbake_build/tmp/sysroots/x86_64-linux=
/usr/libexec/x86_64-wrs-linux/gcc/x86_64-wrs-linux/4.9.2/ld:=20
> lib/libopenflow.a(vconn-ssl.o): undefined reference to symbol=20
> 'ERR_error_string@@OPENSSL_1.0.0'
> /buildarea/lyang1/test_qemux86-64/bitbake_build/tmp/sysroots/qemux86-64/l=
ib64/libcrypto.so.1.0.0:=20
> error adding symbols: DSO missing from command line
> collect2: error: ld returned 1 exit status

python-pyopenssl is also failing since this upgrade:

| x86_64-oe-linux-gcc -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3D=
sse --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-=
64 -DNDEBUG -g -O3 -Wall -Wstrict-prototypes -O2 -pipe -g -feliminate-unuse=
d-debug-types -fPIC -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qe=
mux86-64/usr/include/python2.7 -c OpenSSL/crypto/crl.c -o build/temp.linux-=
x86_64-2.7/OpenSSL/crypto/crl.o
| OpenSSL/crypto/crl.c:6:23: error: static declaration of 'X509_REVOKED_dup=
' follows non-static declaration
|  static X509_REVOKED * X509_REVOKED_dup(X509_REVOKED *orig) {
|                        ^
| In file included from /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/=
qemux86-64/usr/include/openssl/ssl.h:156:0,
|                  from OpenSSL/crypto/x509.h:17,
|                  from OpenSSL/crypto/crypto.h:30,
|                  from OpenSSL/crypto/crl.c:3:
| /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include=
/openssl/x509.h:751:15: note: previous declaration of 'X509_REVOKED_dup' wa=
s here
|  X509_REVOKED *X509_REVOKED_dup(X509_REVOKED *rev);
|                ^
| OpenSSL/crypto/crl.c: In function 'init_crypto_crl':
| OpenSSL/crypto/crl.c:285:5: warning: dereferencing type-punned pointer wi=
ll break strict-aliasing rules [-Wstrict-aliasing]
|      Py_INCREF((PyObject *)&crypto_CRL_Type);
|      ^
| error: command 'x86_64-oe-linux-gcc' failed with exit status 1
| ERROR: python setup.py build_ext execution failed.
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/python-pyopenssl/0.13-r1=
/temp/log.do_compile.21838)
NOTE: recipe python-pyopenssl-0.13-r1: task do_compile: Failed
ERROR: Task 19005 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-o=
e/recipes-devtools/python/python-pyopenssl_0.13.bb, do_compile) failed with=
 exit code '1'

>=20
> // Robert
>=20
> On 03/05/2015 01:46 AM, Saul Wold wrote:
> > Rebased numerous patches
> > removed aarch64 initial work since it's part of upstream now
> > Imported a few additional patches from Debian to support the version-sc=
ript
> > and blacklist additional bad certificates.
> >
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> >   .../openssl/openssl/Makefiles-ptest.patch          |  36 +--
> >   .../openssl/openssl/debian/c_rehash-compat.patch   |  58 +++-
> >   .../openssl/openssl/debian/debian-targets.patch    |  25 +-
> >   .../openssl/openssl/debian/version-script.patch    | 311 ++++++++++--=
---------
> >   .../debian1.0.2/block_digicert_malaysia.patch      |  29 ++
> >   .../openssl/debian1.0.2/block_diginotar.patch      |  67 +++++
> >   .../openssl/openssl/debian1.0.2/padlock_conf.patch |  31 ++
> >   .../openssl/engines-install-in-libdir-ssl.patch    |  42 +--
> >   .../openssl/openssl/fix-cipher-des-ede3-cfb1.patch |  21 +-
> >   .../openssl/openssl/initial-aarch64-bits.patch     | 120 --------
> >   ...-pointer-dereference-in-EVP_DigestInit_ex.patch |  22 +-
> >   ...NULL-pointer-dereference-in-dh_pub_encode.patch |  41 +--
> >   .../openssl/openssl/openssl_fix_for_x32.patch      |  85 ++----
> >   .../openssl/openssl/ptest-deps.patch               |  16 +-
> >   .../openssl/update-version-script-for-1.0.2.patch  |  66 +++++
> >   .../{openssl_1.0.1k.bb =3D> openssl_1.0.2.bb}        |  19 +-
> >   16 files changed, 522 insertions(+), 467 deletions(-)
> >   create mode 100644 meta/recipes-connectivity/openssl/openssl/debian1.=
0.2/block_digicert_malaysia.patch
> >   create mode 100644 meta/recipes-connectivity/openssl/openssl/debian1.=
0.2/block_diginotar.patch
> >   create mode 100644 meta/recipes-connectivity/openssl/openssl/debian1.=
0.2/padlock_conf.patch
> >   delete mode 100644 meta/recipes-connectivity/openssl/openssl/initial-=
aarch64-bits.patch
> >   create mode 100644 meta/recipes-connectivity/openssl/openssl/update-v=
ersion-script-for-1.0.2.patch
> >   rename meta/recipes-connectivity/openssl/{openssl_1.0.1k.bb =3D> open=
ssl_1.0.2.bb} (84%)
> >
> > diff --git a/meta/recipes-connectivity/openssl/openssl/Makefiles-ptest.=
patch b/meta/recipes-connectivity/openssl/openssl/Makefiles-ptest.patch
> > index ac53a91..249446a 100644
> > --- a/meta/recipes-connectivity/openssl/openssl/Makefiles-ptest.patch
> > +++ b/meta/recipes-connectivity/openssl/openssl/Makefiles-ptest.patch
> > @@ -5,10 +5,11 @@ Signed-off-by: Anders Roxell <anders.roxell@enea.com>
> >   Signed-off-by: Maxin B. John <maxin.john@enea.com>
> >   Upstream-Status: Pending
> >   ---
> > -diff -uNr a/Makefile b/Makefile
> > ---- a/Makefile.org	2012-05-10 17:06:02.000000000 +0200
> > -+++ b/Makefile.org	2012-10-27 00:05:55.359424024 +0200
> > -@@ -411,8 +411,16 @@
> > +Index: openssl-1.0.2/Makefile.org
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- openssl-1.0.2.orig/Makefile.org
> > ++++ openssl-1.0.2/Makefile.org
> > +@@ -451,8 +451,16 @@ rehash.time: certs apps
> >    test:   tests
> >
> >    tests: rehash
> > @@ -26,11 +27,11 @@ diff -uNr a/Makefile b/Makefile
> >    	OPENSSL_CONF=3Dapps/openssl.cnf util/opensslwrap.sh version -a
> >
> >    report:
> > -diff --git a/test/Makefile b/test/Makefile
> > -index 3912f82..1696767 100644
> > ---- a/test/Makefile
> > -+++ b/test/Makefile
> > -@@ -128,7 +128,7 @@ tests:	exe apps $(TESTS)
> > +Index: openssl-1.0.2/test/Makefile
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- openssl-1.0.2.orig/test/Makefile
> > ++++ openssl-1.0.2/test/Makefile
> > +@@ -137,7 +137,7 @@ tests:	exe apps $(TESTS)
> >    apps:
> >    	@(cd ..; $(MAKE) DIRS=3Dapps all)
> >
> > @@ -39,28 +40,28 @@ index 3912f82..1696767 100644
> >    	test_des test_idea test_sha test_md4 test_md5 test_hmac \
> >    	test_md2 test_mdc2 test_wp \
> >    	test_rmd test_rc2 test_rc4 test_rc5 test_bf test_cast test_aes \
> > -@@ -138,6 +138,11 @@ alltests: \
> > - 	test_ss test_ca test_engine test_evp test_ssl test_tsa test_ige \
> > - 	test_jpake test_cms
> > +@@ -148,6 +148,11 @@ alltests: \
> > + 	test_jpake test_srp test_cms test_ocsp test_v3name test_heartbeat \
> > + 	test_constant_time
> >
> >   +alltests:
> >   +	@(for i in $(all-tests); do \
> >   +	( $(MAKE) $$i && echo "PASS: $$i" ) || echo "FAIL: $$i"; \
> >   +	done)
> >   +
> > - test_evp:
> > + test_evp: $(EVPTEST)$(EXE_EXT) evptests.txt
> >    	../util/shlib_wrap.sh ./$(EVPTEST) evptests.txt
> >
> > -@@ -203,7 +208,7 @@ test_x509:
> > +@@ -213,7 +218,7 @@ test_x509: ../apps/openssl$(EXE_EXT) tx5
> >    	echo test second x509v3 certificate
> >    	sh ./tx509 v3-cert2.pem 2>/dev/null
> >
> > --test_rsa: $(RSATEST)$(EXE_EXT)
> > -+test_rsa:
> > +-test_rsa: $(RSATEST)$(EXE_EXT) ../apps/openssl$(EXE_EXT) trsa testrsa=
=2Epem
> > ++test_rsa: ../apps/openssl$(EXE_EXT) trsa testrsa.pem
> >    	@sh ./trsa 2>/dev/null
> >    	../util/shlib_wrap.sh ./$(RSATEST)
> >
> > -@@ -298,11 +303,11 @@ test_tsa:
> > +@@ -313,11 +318,11 @@ test_tsa: ../apps/openssl$(EXE_EXT) test
> >    	  sh ./testtsa; \
> >    	fi
> >
> > @@ -73,3 +74,4 @@ index 3912f82..1696767 100644
> >   +test_jpake:
> >    	@echo "Test JPAKE"
> >    	../util/shlib_wrap.sh ./$(JPAKETEST)
> > +
> > diff --git a/meta/recipes-connectivity/openssl/openssl/debian/c_rehash-=
compat.patch b/meta/recipes-connectivity/openssl/openssl/debian/c_rehash-co=
mpat.patch
> > index ac1b19b..3943e2c 100644
> > --- a/meta/recipes-connectivity/openssl/openssl/debian/c_rehash-compat.=
patch
> > +++ b/meta/recipes-connectivity/openssl/openssl/debian/c_rehash-compat.=
patch
> > @@ -1,38 +1,58 @@
> > -Upstream-Status: Backport [debian]
> > -
> >   From 83f318d68bbdab1ca898c94576a838cc97df4700 Mon Sep 17 00:00:00 2001
> >   From: Ludwig Nussel <ludwig.nussel@suse.de>
> >   Date: Wed, 21 Apr 2010 15:52:10 +0200
> >   Subject: [PATCH] also create old hash for compatibility
> >
> > +Upstream-Status: Backport [debian]
> > +
> >   ---
> >    tools/c_rehash.in |    8 +++++++-
> >    1 files changed, 7 insertions(+), 1 deletions(-)
> >
> > -Index: openssl-1.0.0d/tools/c_rehash.in
> > +Index: openssl-1.0.2~beta3/tools/c_rehash.in
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- openssl-1.0.0d.orig/tools/c_rehash.in	2011-04-13 20:41:28.00000000=
0 +0000
> > -+++ openssl-1.0.0d/tools/c_rehash.in	2011-04-13 20:41:28.000000000 +00=
00
> > -@@ -86,6 +86,7 @@
> > - 			}
> > +--- openssl-1.0.2~beta3.orig/tools/c_rehash.in
> > ++++ openssl-1.0.2~beta3/tools/c_rehash.in
> > +@@ -8,8 +8,6 @@ my $prefix;
> > +
> > + my $openssl =3D $ENV{OPENSSL} || "openssl";
> > + my $pwd;
> > +-my $x509hash =3D "-subject_hash";
> > +-my $crlhash =3D "-hash";
> > + my $verbose =3D 0;
> > + my $symlink_exists=3Deval {symlink("",""); 1};
> > + my $removelinks =3D 1;
> > +@@ -18,10 +16,7 @@ my $removelinks =3D 1;
> > + while ( $ARGV[0] =3D~ '-.*' ) {
> > +     my $flag =3D shift @ARGV;
> > +     last if ( $flag eq '--');
> > +-    if ( $flag =3D~ /-old/) {
> > +-	    $x509hash =3D "-subject_hash_old";
> > +-	    $crlhash =3D "-hash_old";
> > +-    } elsif ( $flag =3D~ /-h/) {
> > ++    if ( $flag =3D~ /-h/) {
> > + 	    help();
> > +     } elsif ( $flag eq '-n' ) {
> > + 	    $removelinks =3D 0;
> > +@@ -113,7 +108,9 @@ sub hash_dir {
> > + 			next;
> >    		}
> >    		link_hash_cert($fname) if($cert);
> >   +		link_hash_cert_old($fname) if($cert);
> >    		link_hash_crl($fname) if($crl);
> > ++		link_hash_crl_old($fname) if($crl);
> >    	}
> >    }
> > -@@ -119,8 +120,9 @@
> > +
> > +@@ -146,6 +143,7 @@ sub check_file {
> >
> >    sub link_hash_cert {
> >    		my $fname =3D $_[0];
> > -+		my $hashopt =3D $_[1] || '-subject_hash';
> > ++		my $x509hash =3D $_[1] || '-subject_hash';
> >    		$fname =3D~ s/'/'\\''/g;
> > --		my ($hash, $fprint) =3D `"$openssl" x509 -hash -fingerprint -noout =
-in "$fname"`;
> > -+		my ($hash, $fprint) =3D `"$openssl" x509 $hashopt -fingerprint -noo=
ut -in "$fname"`;
> > + 		my ($hash, $fprint) =3D `"$openssl" x509 $x509hash -fingerprint -no=
out -in "$fname"`;
> >    		chomp $hash;
> > - 		chomp $fprint;
> > - 		$fprint =3D~ s/^.*=3D//;
> > -@@ -150,6 +152,10 @@
> > +@@ -177,10 +175,20 @@ sub link_hash_cert {
> >    		$hashlist{$hash} =3D $fprint;
> >    }
> >
> > @@ -40,6 +60,16 @@ Index: openssl-1.0.0d/tools/c_rehash.in
> >   +		link_hash_cert($_[0], '-subject_hash_old');
> >   +}
> >   +
> > ++sub link_hash_crl_old {
> > ++		link_hash_crl($_[0], '-hash_old');
> > ++}
> > ++
> > ++
> >    # Same as above except for a CRL. CRL links are of the form <hash>.r=
<n>
> >
> >    sub link_hash_crl {
> > + 		my $fname =3D $_[0];
> > ++		my $crlhash =3D $_[1] || "-hash";
> > + 		$fname =3D~ s/'/'\\''/g;
> > + 		my ($hash, $fprint) =3D `"$openssl" crl $crlhash -fingerprint -noou=
t -in '$fname'`;
> > + 		chomp $hash;
> > diff --git a/meta/recipes-connectivity/openssl/openssl/debian/debian-ta=
rgets.patch b/meta/recipes-connectivity/openssl/openssl/debian/debian-targe=
ts.patch
> > index 8101edf..39d4328 100644
> > --- a/meta/recipes-connectivity/openssl/openssl/debian/debian-targets.p=
atch
> > +++ b/meta/recipes-connectivity/openssl/openssl/debian/debian-targets.p=
atch
> > @@ -1,12 +1,12 @@
> >   Upstream-Status: Backport [debian]
> >
> > -Index: openssl-1.0.1/Configure
> > +Index: openssl-1.0.2/Configure
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- openssl-1.0.1.orig/Configure	2012-03-17 15:37:54.000000000 +0000
> > -+++ openssl-1.0.1/Configure	2012-03-17 16:13:49.000000000 +0000
> > -@@ -105,6 +105,10 @@
> > +--- openssl-1.0.2.orig/Configure
> > ++++ openssl-1.0.2/Configure
> > +@@ -107,6 +107,10 @@ my $gcc_devteam_warn =3D "-Wall -pedantic
> >
> > - my $gcc_devteam_warn =3D "-Wall -pedantic -DPEDANTIC -Wno-long-long -=
Wsign-compare -Wmissing-prototypes -Wshadow -Wformat -Werror -DCRYPTO_MDEBU=
G_ALL -DCRYPTO_MDEBUG_ABORT -DREF_CHECK -DOPENSSL_NO_DEPRECATED";
> > + my $clang_disabled_warnings =3D "-Wno-language-extension-token -Wno-e=
xtended-offsetof -Wno-padded -Wno-shorten-64-to-32 -Wno-format-nonliteral -=
Wno-missing-noreturn -Wno-unused-parameter -Wno-sign-conversion -Wno-unreac=
hable-code -Wno-conversion -Wno-documentation -Wno-missing-variable-declara=
tions -Wno-cast-align -Wno-incompatible-pointer-types-discards-qualifiers -=
Wno-missing-variable-declarations -Wno-missing-field-initializers -Wno-unus=
ed-macros -Wno-disabled-macro-expansion -Wno-conditional-uninitialized -Wno=
-switch-enum";
> >
> >   +# There are no separate CFLAGS/CPPFLAGS/LDFLAGS, set everything in C=
FLAGS
> >   +my $debian_cflags =3D `dpkg-buildflags --get CFLAGS` . `dpkg-buildfl=
ags --get CPPFLAGS` . `dpkg-buildflags --get LDFLAGS` . "-Wa,--noexecstack =
-Wall";
> > @@ -15,7 +15,7 @@ Index: openssl-1.0.1/Configure
> >    my $strict_warnings =3D 0;
> >
> >    my $x86_gcc_des=3D"DES_PTR DES_RISC1 DES_UNROLL";
> > -@@ -338,6 +342,48 @@
> > +@@ -343,6 +347,55 @@ my %table=3D(
> >    "osf1-alpha-cc",  "cc:-std1 -tune host -O4 -readonly_strings::(unkno=
wn):::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${alpha_asm}:dlfcn:alpha-osf1-shared:::=
=2Eso",
> >    "tru64-alpha-cc", "cc:-std1 -tune host -fast -readonly_strings::-pth=
read:::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${alpha_asm}:dlfcn:alpha-osf1-shared::=
-msym:.so",
> >
> > @@ -23,9 +23,9 @@ Index: openssl-1.0.1/Configure
> >   +"debian-alpha","gcc:-DTERMIO ${debian_cflags}::-D_REENTRANT::-ldl:SI=
XTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${alpha_asm}:dlfcn:linux-s=
hared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> >   +"debian-alpha-ev4","gcc:-DTERMIO ${debian_cflags} -mcpu=3Dev4::-D_RE=
ENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${alpha_as=
m}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> >   +"debian-alpha-ev5","gcc:-DTERMIO ${debian_cflags} -mcpu=3Dev5::-D_RE=
ENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${alpha_as=
m}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> > -+"debian-armeb","gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRAN=
T::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${no_asm}:dlf=
cn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> > -+"debian-armel","gcc:-DL_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRAN=
T::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${no_asm}:dlf=
cn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> > -+"debian-armhf","gcc:-DL_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRAN=
T::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${no_asm}:dlf=
cn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> > ++"debian-arm64","gcc:-DL_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRAN=
T::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${=
no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> > ++"debian-armel","gcc:-DL_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRAN=
T::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${armv4_asm}:=
dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> > ++"debian-armhf","gcc:-DL_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRAN=
T::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL BF_PTR:${armv4_asm}:=
dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> >   +"debian-amd64", "gcc:-m64 -DL_ENDIAN -DTERMIO ${debian_cflags} -DMD3=
2_REG_T=3Dint::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES=
_UNROLL:${x86_64_asm}:elf:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR)=
=2E\$(SHLIB_MINOR):::",
> >   +"debian-avr32", "gcc:-DB_ENDIAN -DTERMIO ${debian_cflags} -fomit-fra=
me-pointer::-D_REENTRANT::-ldl:BN_LLONG_BF_PTR:${no_asm}:dlfcn:linux-shared=
:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> >   +"debian-kfreebsd-amd64","gcc:-m64 -DL_ENDIAN -DTERMIOS ${debian_cfla=
gs} -DMD32_REG_T=3Dint::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DE=
S_INT DES_UNROLL:${x86_64_asm}:elf:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHL=
IB_MAJOR).\$(SHLIB_MINOR)",
> > @@ -40,15 +40,21 @@ Index: openssl-1.0.1/Configure
> >   +"debian-m68k","gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRAN=
T::-ldl:BN_LLONG MD2_CHAR RC4_INDEX:${no_asm}:dlfcn:linux-shared:-fPIC::.so=
=2E\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> >   +"debian-mips",   "gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENT=
RANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_as=
m}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> >   +"debian-mipsel",   "gcc:-DL_ENDIAN -DTERMIO ${debian_cflags}::-D_REE=
NTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RISC2:${no_=
asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> > ++"debian-mipsn32",   "mips64-linux-gnuabin32-gcc:-DB_ENDIAN -DTERMIO $=
{debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES=
_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\=
$(SHLIB_MINOR)",
> > ++"debian-mipsn32el",   "mips64el-linux-gnuabin32-gcc:-DL_ENDIAN -DTERM=
IO ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT=
 DES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJO=
R).\$(SHLIB_MINOR)",
> > ++"debian-mips64",   "mips64-linux-gnuabi64-gcc:-DB_ENDIAN -DTERMIO ${d=
ebian_cflags}::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_U=
NROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(=
SHLIB_MINOR)",
> > ++"debian-mips64el",   "mips64el-linux-gnuabi64-gcc:-DL_ENDIAN -DTERMIO=
 ${debian_cflags}::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT D=
ES_UNROLL DES_RISC2:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR)=
=2E\$(SHLIB_MINOR)",
> >   +"debian-netbsd-i386",	"gcc:-DL_ENDIAN -DTERMIOS ${debian_cflags} -m4=
86::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${no_asm}:dlfcn:bsd=
-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> >   +"debian-netbsd-m68k",	"gcc:-DB_ENDIAN -DTERMIOS ${debian_cflags}::(u=
nknown):::BN_LLONG MD2_CHAR RC4_INDEX DES_UNROLL:${no_asm}:dlfcn:bsd-gcc-sh=
ared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> >   +"debian-netbsd-sparc",	"gcc:-DB_ENDIAN -DTERMIOS ${debian_cflags} -m=
v8::(unknown):::BN_LLONG MD2_CHAR RC4_INDEX DES_UNROLL:${no_asm}:dlfcn:bsd-=
gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> >   +"debian-openbsd-alpha","gcc:-DTERMIOS ${debian_cflags}::(unknown):::=
SIXTY_FOUR_BIT_LONG DES_INT DES_PTR DES_RISC2:${no_asm}:dlfcn:bsd-gcc-share=
d:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> >   +"debian-openbsd-i386",  "gcc:-DL_ENDIAN -DTERMIOS ${debian_cflags} -=
m486::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_asm}:a.out:=
dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> >   +"debian-openbsd-mips","gcc:-DL_ENDIAN ${debian_cflags}::(unknown)::B=
N_LLONG MD2_CHAR RC4_INDEX RC4_CHAR DES_UNROLL DES_RISC2 DES_PTR BF_PTR:${n=
o_asm}:dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> > ++"debian-or1k", "gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRAN=
T::-ldl:BN_LLONG DES_RISC1:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB=
_MAJOR).\$(SHLIB_MINOR)",
> >   +"debian-powerpc","gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENT=
RANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_RISC1 DES_UNROLL:${ppc32_asm}:li=
nux32:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> >   +"debian-powerpcspe","gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_RE=
ENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_RISC1 DES_UNROLL:${ppc32_asm}=
:linux32:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> >   +"debian-ppc64","gcc:-m64 -DB_ENDIAN -DTERMIO ${debian_cflags}::-D_RE=
ENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_RISC1 DES_UNROLL:$=
{ppc64_asm}:linux64:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SH=
LIB_MINOR)",
> > ++"debian-ppc64el","gcc:-m64 -DL_ENDIAN -DTERMIO ${debian_cflags}::-D_R=
EENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_RISC1 DES_UNROLL:=
${ppc64_asm}:linux64le:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$=
(SHLIB_MINOR)",
> >   +"debian-s390","gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRAN=
T::-ldl:RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL:${no_asm}:dlfcn:linux-shared:=
-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> >   +"debian-s390x","gcc:-DB_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTRA=
NT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL:${no_asm=
}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> >   +"debian-sh3",   "gcc:-DL_ENDIAN -DTERMIO ${debian_cflags}::-D_REENTR=
ANT::-ldl:BN_LLONG:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).=
\$(SHLIB_MINOR)",
> > @@ -60,6 +66,7 @@ Index: openssl-1.0.1/Configure
> >   +"debian-sparc-v8","gcc:-DB_ENDIAN -DTERMIO ${debian_cflags} -mcpu=3D=
v8 -DBN_DIV2W::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF=
_PTR:${sparcv8_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_=
MINOR)",
> >   +"debian-sparc-v9","gcc:-DB_ENDIAN -DTERMIO ${debian_cflags} -mcpu=3D=
v9 -Wa,-Av8plus -DULTRASPARC -DBN_DIV2W::-D_REENTRANT::-ldl:BN_LLONG RC4_CH=
AR RC4_CHUNK DES_UNROLL BF_PTR:${sparcv9_asm}:dlfcn:linux-shared:-fPIC::.so=
=2E\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> >   +"debian-sparc64","gcc:-m64 -DB_ENDIAN -DTERMIO ${debian_cflags} -DUL=
TRASPARC -DBN_DIV2W::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_INT=
 DES_PTR DES_RISC1 DES_UNROLL BF_PTR:${sparcv9_asm}:dlfcn:linux-shared:-fPI=
C:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> > ++"debian-x32","gcc:-mx32 -DL_ENDIAN -DTERMIO ${debian_cflags} -DMD32_R=
EG_T=3Dint::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT RC4_CHUNK DES_INT DES_UNROLL:=
${x86_64_asm}:elf:dlfcn:linux-shared:-fPIC:-mx32:.so.\$(SHLIB_MAJOR).\$(SHL=
IB_MINOR):::x32",
> >   +
> >    ####
> >    #### Variety of LINUX:-)
> > diff --git a/meta/recipes-connectivity/openssl/openssl/debian/version-s=
cript.patch b/meta/recipes-connectivity/openssl/openssl/debian/version-scri=
pt.patch
> > index ece8b9b..a249180 100644
> > --- a/meta/recipes-connectivity/openssl/openssl/debian/version-script.p=
atch
> > +++ b/meta/recipes-connectivity/openssl/openssl/debian/version-script.p=
atch
> > @@ -1,10 +1,8 @@
> > -Upstream-Status: Backport [debian]
> > -
> > -Index: openssl-1.0.1d/Configure
> > +Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/Configure
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- openssl-1.0.1d.orig/Configure	2013-02-06 19:41:43.000000000 +0100
> > -+++ openssl-1.0.1d/Configure	2013-02-06 19:41:43.000000000 +0100
> > -@@ -1621,6 +1621,8 @@
> > +--- openssl-1.0.2~beta1.obsolete.0.0498436515490575.orig/Configure	201=
4-02-24 21:02:30.000000000 +0100
> > ++++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/Configure	2014-02-=
24 21:02:30.000000000 +0100
> > +@@ -1651,6 +1651,8 @@
> >    		}
> >    	}
> >
> > @@ -13,11 +11,11 @@ Index: openssl-1.0.1d/Configure
> >    open(IN,'<Makefile.org') || die "unable to read Makefile.org:$!\n";
> >    unlink("$Makefile.new") || die "unable to remove old $Makefile.new:$=
!\n" if -e "$Makefile.new";
> >    open(OUT,">$Makefile.new") || die "unable to create $Makefile.new:$!=
\n";
> > -Index: openssl-1.0.1d/openssl.ld
> > +Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >   --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> > -+++ openssl-1.0.1d/openssl.ld	2013-02-06 19:44:25.000000000 +0100
> > -@@ -0,0 +1,4620 @@
> > ++++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld	2014-02=
-24 22:19:08.601827266 +0100
> > +@@ -0,0 +1,4615 @@
> >   +OPENSSL_1.0.0 {
> >   +	global:
> >   +		BIO_f_ssl;
> > @@ -2229,20 +2227,16 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		ERR_load_COMP_strings;
> >   +		PKCS12_item_decrypt_d2i;
> >   +		ASN1_UTF8STRING_it;
> > -+		ASN1_UTF8STRING_it;
> >   +		ENGINE_unregister_ciphers;
> >   +		ENGINE_get_ciphers;
> >   +		d2i_OCSP_BASICRESP;
> >   +		KRB5_CHECKSUM_it;
> > -+		KRB5_CHECKSUM_it;
> >   +		EC_POINT_add;
> >   +		ASN1_item_ex_i2d;
> >   +		OCSP_CERTID_it;
> > -+		OCSP_CERTID_it;
> >   +		d2i_OCSP_RESPBYTES;
> >   +		X509V3_add1_i2d;
> >   +		PKCS7_ENVELOPE_it;
> > -+		PKCS7_ENVELOPE_it;
> >   +		UI_add_input_boolean;
> >   +		ENGINE_unregister_RSA;
> >   +		X509V3_EXT_nconf;
> > @@ -2254,19 +2248,15 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		ENGINE_register_all_RAND;
> >   +		ENGINE_load_dynamic;
> >   +		PBKDF2PARAM_it;
> > -+		PBKDF2PARAM_it;
> >   +		EXTENDED_KEY_USAGE_new;
> >   +		EC_GROUP_clear_free;
> >   +		OCSP_sendreq_bio;
> >   +		ASN1_item_digest;
> >   +		OCSP_BASICRESP_delete_ext;
> >   +		OCSP_SIGNATURE_it;
> > -+		OCSP_SIGNATURE_it;
> > -+		X509_CRL_it;
> >   +		X509_CRL_it;
> >   +		OCSP_BASICRESP_add_ext;
> >   +		KRB5_ENCKEY_it;
> > -+		KRB5_ENCKEY_it;
> >   +		UI_method_set_closer;
> >   +		X509_STORE_set_purpose;
> >   +		i2d_ASN1_GENERALSTRING;
> > @@ -2277,7 +2267,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		OCSP_REQUEST_get_ext_by_OBJ;
> >   +		_ossl_old_des_random_key;
> >   +		ASN1_T61STRING_it;
> > -+		ASN1_T61STRING_it;
> >   +		EC_GROUP_method_of;
> >   +		i2d_KRB5_APREQ;
> >   +		_ossl_old_des_encrypt;
> > @@ -2293,7 +2282,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		OCSP_SINGLERESP_get_ext_count;
> >   +		UI_ctrl;
> >   +		_shadow_DES_rw_mode;
> > -+		_shadow_DES_rw_mode;
> >   +		asn1_do_adb;
> >   +		ASN1_template_i2d;
> >   +		ENGINE_register_DH;
> > @@ -2307,8 +2295,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		KRB5_ENCKEY_free;
> >   +		OCSP_resp_get0;
> >   +		GENERAL_NAME_it;
> > -+		GENERAL_NAME_it;
> > -+		ASN1_GENERALIZEDTIME_it;
> >   +		ASN1_GENERALIZEDTIME_it;
> >   +		X509_STORE_set_flags;
> >   +		EC_POINT_set_compressed_coordinates_GFp;
> > @@ -2330,21 +2316,18 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		EC_POINT_set_affine_coords_GFp;
> >   +		_ossl_old_des_options;
> >   +		SXNET_it;
> > -+		SXNET_it;
> >   +		UI_dup_input_boolean;
> >   +		PKCS12_add_CSPName_asc;
> >   +		EC_POINT_is_at_infinity;
> >   +		ENGINE_load_cryptodev;
> >   +		DSO_convert_filename;
> >   +		POLICYQUALINFO_it;
> > -+		POLICYQUALINFO_it;
> >   +		ENGINE_register_ciphers;
> >   +		BN_mod_lshift_quick;
> >   +		DSO_set_filename;
> >   +		ASN1_item_free;
> >   +		KRB5_TKTBODY_free;
> >   +		AUTHORITY_KEYID_it;
> > -+		AUTHORITY_KEYID_it;
> >   +		KRB5_APREQBODY_new;
> >   +		X509V3_EXT_REQ_add_nconf;
> >   +		ENGINE_ctrl_cmd_string;
> > @@ -2352,19 +2335,15 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		EVP_MD_CTX_init;
> >   +		EXTENDED_KEY_USAGE_free;
> >   +		PKCS7_ATTR_SIGN_it;
> > -+		PKCS7_ATTR_SIGN_it;
> >   +		UI_add_error_string;
> >   +		KRB5_CHECKSUM_free;
> >   +		OCSP_REQUEST_get_ext;
> >   +		ENGINE_load_ubsec;
> >   +		ENGINE_register_all_digests;
> >   +		PKEY_USAGE_PERIOD_it;
> > -+		PKEY_USAGE_PERIOD_it;
> >   +		PKCS12_unpack_authsafes;
> >   +		ASN1_item_unpack;
> >   +		NETSCAPE_SPKAC_it;
> > -+		NETSCAPE_SPKAC_it;
> > -+		X509_REVOKED_it;
> >   +		X509_REVOKED_it;
> >   +		ASN1_STRING_encode;
> >   +		EVP_aes_128_ecb;
> > @@ -2376,7 +2355,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		UI_dup_info_string;
> >   +		_ossl_old_des_xwhite_in2out;
> >   +		PKCS12_it;
> > -+		PKCS12_it;
> >   +		OCSP_SINGLERESP_get_ext_by_critical;
> >   +		OCSP_SINGLERESP_get_ext_by_crit;
> >   +		OCSP_CERTSTATUS_free;
> > @@ -2395,10 +2373,8 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		ENGINE_unregister_DSA;
> >   +		_ossl_old_des_key_sched;
> >   +		X509_EXTENSION_it;
> > -+		X509_EXTENSION_it;
> >   +		i2d_KRB5_AUTHENT;
> >   +		SXNETID_it;
> > -+		SXNETID_it;
> >   +		d2i_OCSP_SINGLERESP;
> >   +		EDIPARTYNAME_new;
> >   +		PKCS12_certbag2x509;
> > @@ -2409,10 +2385,8 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		d2i_KRB5_APREQBODY;
> >   +		UI_method_get_flusher;
> >   +		X509_PUBKEY_it;
> > -+		X509_PUBKEY_it;
> >   +		_ossl_old_des_enc_read;
> >   +		PKCS7_ENCRYPT_it;
> > -+		PKCS7_ENCRYPT_it;
> >   +		i2d_OCSP_RESPONSE;
> >   +		EC_GROUP_get_cofactor;
> >   +		PKCS12_unpack_p7data;
> > @@ -2430,10 +2404,8 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		PKCS12_item_i2d_encrypt;
> >   +		X509_add1_ext_i2d;
> >   +		PKCS7_SIGNER_INFO_it;
> > -+		PKCS7_SIGNER_INFO_it;
> >   +		KRB5_PRINCNAME_new;
> >   +		PKCS12_SAFEBAG_it;
> > -+		PKCS12_SAFEBAG_it;
> >   +		EC_GROUP_get_order;
> >   +		d2i_OCSP_RESPID;
> >   +		OCSP_request_verify;
> > @@ -2448,42 +2420,32 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		EVP_MD_CTX_create;
> >   +		OCSP_resp_find_status;
> >   +		X509_ALGOR_it;
> > -+		X509_ALGOR_it;
> > -+		ASN1_TIME_it;
> >   +		ASN1_TIME_it;
> >   +		OCSP_request_set1_name;
> >   +		OCSP_ONEREQ_get_ext_count;
> >   +		UI_get0_result;
> >   +		PKCS12_AUTHSAFES_it;
> > -+		PKCS12_AUTHSAFES_it;
> >   +		EVP_aes_256_ecb;
> >   +		PKCS12_pack_authsafes;
> >   +		ASN1_IA5STRING_it;
> > -+		ASN1_IA5STRING_it;
> >   +		UI_get_input_flags;
> >   +		EC_GROUP_set_generator;
> >   +		_ossl_old_des_string_to_2keys;
> >   +		OCSP_CERTID_free;
> >   +		X509_CERT_AUX_it;
> > -+		X509_CERT_AUX_it;
> > -+		CERTIFICATEPOLICIES_it;
> >   +		CERTIFICATEPOLICIES_it;
> >   +		_ossl_old_des_ede3_cbc_encrypt;
> >   +		RAND_set_rand_engine;
> >   +		DSO_get_loaded_filename;
> >   +		X509_ATTRIBUTE_it;
> > -+		X509_ATTRIBUTE_it;
> >   +		OCSP_ONEREQ_get_ext_by_NID;
> >   +		PKCS12_decrypt_skey;
> >   +		KRB5_AUTHENT_it;
> > -+		KRB5_AUTHENT_it;
> >   +		UI_dup_error_string;
> >   +		RSAPublicKey_it;
> > -+		RSAPublicKey_it;
> >   +		i2d_OCSP_REQUEST;
> >   +		PKCS12_x509crl2certbag;
> >   +		OCSP_SERVICELOC_it;
> > -+		OCSP_SERVICELOC_it;
> >   +		ASN1_item_sign;
> >   +		X509_CRL_set_issuer_name;
> >   +		OBJ_NAME_do_all_sorted;
> > @@ -2494,30 +2456,23 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		ENGINE_get_digest;
> >   +		OCSP_RESPONSE_print;
> >   +		KRB5_TKTBODY_it;
> > -+		KRB5_TKTBODY_it;
> >   +		ACCESS_DESCRIPTION_it;
> > -+		ACCESS_DESCRIPTION_it;
> > -+		PKCS7_ISSUER_AND_SERIAL_it;
> >   +		PKCS7_ISSUER_AND_SERIAL_it;
> >   +		PBE2PARAM_it;
> > -+		PBE2PARAM_it;
> >   +		PKCS12_certbag2x509crl;
> >   +		PKCS7_SIGNED_it;
> > -+		PKCS7_SIGNED_it;
> >   +		ENGINE_get_cipher;
> >   +		i2d_OCSP_CRLID;
> >   +		OCSP_SINGLERESP_new;
> >   +		ENGINE_cmd_is_executable;
> >   +		RSA_up_ref;
> >   +		ASN1_GENERALSTRING_it;
> > -+		ASN1_GENERALSTRING_it;
> >   +		ENGINE_register_DSA;
> >   +		X509V3_EXT_add_nconf_sk;
> >   +		ENGINE_set_load_pubkey_function;
> >   +		PKCS8_decrypt;
> >   +		PEM_bytes_read_bio;
> >   +		DIRECTORYSTRING_it;
> > -+		DIRECTORYSTRING_it;
> >   +		d2i_OCSP_CRLID;
> >   +		EC_POINT_is_on_curve;
> >   +		CRYPTO_set_locked_mem_ex_functions;
> > @@ -2525,7 +2480,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		d2i_KRB5_CHECKSUM;
> >   +		ASN1_item_dup;
> >   +		X509_it;
> > -+		X509_it;
> >   +		BN_mod_add;
> >   +		KRB5_AUTHDATA_free;
> >   +		_ossl_old_des_cbc_cksum;
> > @@ -2534,7 +2488,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		EC_POINT_get_Jprojective_coordinates_GFp;
> >   +		EC_POINT_get_Jproj_coords_GFp;
> >   +		ZLONG_it;
> > -+		ZLONG_it;
> >   +		CRYPTO_get_locked_mem_ex_functions;
> >   +		CRYPTO_get_locked_mem_ex_funcs;
> >   +		ASN1_TIME_check;
> > @@ -2544,41 +2497,30 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		_ossl_old_des_ede3_cfb64_encrypt;
> >   +		_ossl_odes_ede3_cfb64_encrypt;
> >   +		ASN1_BMPSTRING_it;
> > -+		ASN1_BMPSTRING_it;
> >   +		ASN1_tag2bit;
> >   +		UI_method_set_flusher;
> >   +		X509_ocspid_print;
> >   +		KRB5_ENCDATA_it;
> > -+		KRB5_ENCDATA_it;
> >   +		ENGINE_get_load_pubkey_function;
> >   +		UI_add_user_data;
> >   +		OCSP_REQUEST_delete_ext;
> >   +		UI_get_method;
> >   +		OCSP_ONEREQ_free;
> >   +		ASN1_PRINTABLESTRING_it;
> > -+		ASN1_PRINTABLESTRING_it;
> >   +		X509_CRL_set_nextUpdate;
> >   +		OCSP_REQUEST_it;
> > -+		OCSP_REQUEST_it;
> > -+		OCSP_BASICRESP_it;
> >   +		OCSP_BASICRESP_it;
> >   +		AES_ecb_encrypt;
> >   +		BN_mod_sqr;
> >   +		NETSCAPE_CERT_SEQUENCE_it;
> > -+		NETSCAPE_CERT_SEQUENCE_it;
> > -+		GENERAL_NAMES_it;
> >   +		GENERAL_NAMES_it;
> >   +		AUTHORITY_INFO_ACCESS_it;
> > -+		AUTHORITY_INFO_ACCESS_it;
> > -+		ASN1_FBOOLEAN_it;
> >   +		ASN1_FBOOLEAN_it;
> >   +		UI_set_ex_data;
> >   +		_ossl_old_des_string_to_key;
> >   +		ENGINE_register_all_RSA;
> >   +		d2i_KRB5_PRINCNAME;
> >   +		OCSP_RESPBYTES_it;
> > -+		OCSP_RESPBYTES_it;
> > -+		X509_CINF_it;
> >   +		X509_CINF_it;
> >   +		ENGINE_unregister_digests;
> >   +		d2i_EDIPARTYNAME;
> > @@ -2588,7 +2530,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		OCSP_RESPDATA_free;
> >   +		d2i_KRB5_TICKET;
> >   +		OTHERNAME_it;
> > -+		OTHERNAME_it;
> >   +		EVP_MD_CTX_cleanup;
> >   +		d2i_ASN1_GENERALSTRING;
> >   +		X509_CRL_set_version;
> > @@ -2598,7 +2539,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		OCSP_REQUEST_free;
> >   +		OCSP_REQUEST_add1_ext_i2d;
> >   +		X509_VAL_it;
> > -+		X509_VAL_it;
> >   +		EC_POINTs_make_affine;
> >   +		EC_POINT_mul;
> >   +		X509V3_EXT_add_nconf;
> > @@ -2606,7 +2546,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		X509_CRL_add1_ext_i2d;
> >   +		_ossl_old_des_fcrypt;
> >   +		DISPLAYTEXT_it;
> > -+		DISPLAYTEXT_it;
> >   +		X509_CRL_set_lastUpdate;
> >   +		OCSP_BASICRESP_free;
> >   +		OCSP_BASICRESP_add1_ext_i2d;
> > @@ -2619,7 +2558,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		UI_get0_result_string;
> >   +		ASN1_GENERALSTRING_new;
> >   +		X509_SIG_it;
> > -+		X509_SIG_it;
> >   +		ERR_set_implementation;
> >   +		ERR_load_EC_strings;
> >   +		UI_get0_action_string;
> > @@ -2634,35 +2572,27 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		OCSP_ONEREQ_get_ext_by_OBJ;
> >   +		ASN1_primitive_new;
> >   +		ASN1_PRINTABLE_it;
> > -+		ASN1_PRINTABLE_it;
> >   +		EVP_aes_192_ecb;
> >   +		OCSP_SIGNATURE_new;
> >   +		LONG_it;
> > -+		LONG_it;
> > -+		ASN1_VISIBLESTRING_it;
> >   +		ASN1_VISIBLESTRING_it;
> >   +		OCSP_SINGLERESP_add1_ext_i2d;
> >   +		d2i_OCSP_CERTID;
> >   +		ASN1_item_d2i_fp;
> >   +		CRL_DIST_POINTS_it;
> > -+		CRL_DIST_POINTS_it;
> >   +		GENERAL_NAME_print;
> >   +		OCSP_SINGLERESP_delete_ext;
> >   +		PKCS12_SAFEBAGS_it;
> > -+		PKCS12_SAFEBAGS_it;
> >   +		d2i_OCSP_SIGNATURE;
> >   +		OCSP_request_add1_nonce;
> >   +		ENGINE_set_cmd_defns;
> >   +		OCSP_SERVICELOC_free;
> >   +		EC_GROUP_free;
> >   +		ASN1_BIT_STRING_it;
> > -+		ASN1_BIT_STRING_it;
> > -+		X509_REQ_it;
> >   +		X509_REQ_it;
> >   +		_ossl_old_des_cbc_encrypt;
> >   +		ERR_unload_strings;
> >   +		PKCS7_SIGN_ENVELOPE_it;
> > -+		PKCS7_SIGN_ENVELOPE_it;
> >   +		EDIPARTYNAME_free;
> >   +		OCSP_REQINFO_free;
> >   +		EC_GROUP_new_curve_GFp;
> > @@ -2687,7 +2617,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		OCSP_CRLID_free;
> >   +		OCSP_BASICRESP_get1_ext_d2i;
> >   +		RSAPrivateKey_it;
> > -+		RSAPrivateKey_it;
> >   +		ENGINE_register_all_DH;
> >   +		i2d_EDIPARTYNAME;
> >   +		EC_POINT_get_affine_coordinates_GFp;
> > @@ -2695,10 +2624,8 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		OCSP_CRLID_new;
> >   +		ENGINE_get_flags;
> >   +		OCSP_ONEREQ_it;
> > -+		OCSP_ONEREQ_it;
> >   +		UI_process;
> >   +		ASN1_INTEGER_it;
> > -+		ASN1_INTEGER_it;
> >   +		EVP_CipherInit_ex;
> >   +		UI_get_string_type;
> >   +		ENGINE_unregister_DH;
> > @@ -2707,7 +2634,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		bn_dup_expand;
> >   +		OCSP_cert_id_new;
> >   +		BASIC_CONSTRAINTS_it;
> > -+		BASIC_CONSTRAINTS_it;
> >   +		BN_mod_add_quick;
> >   +		EC_POINT_new;
> >   +		EVP_MD_CTX_destroy;
> > @@ -2717,7 +2643,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		EC_POINT_free;
> >   +		DH_up_ref;
> >   +		X509_NAME_ENTRY_it;
> > -+		X509_NAME_ENTRY_it;
> >   +		UI_get_ex_new_index;
> >   +		BN_mod_sub_quick;
> >   +		OCSP_ONEREQ_add_ext;
> > @@ -2730,7 +2655,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		ENGINE_register_complete;
> >   +		X509V3_EXT_nconf_nid;
> >   +		ASN1_SEQUENCE_it;
> > -+		ASN1_SEQUENCE_it;
> >   +		UI_set_default_method;
> >   +		RAND_query_egd_bytes;
> >   +		UI_method_get_writer;
> > @@ -2738,8 +2662,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		PEM_def_callback;
> >   +		ENGINE_cleanup;
> >   +		DIST_POINT_it;
> > -+		DIST_POINT_it;
> > -+		OCSP_SINGLERESP_it;
> >   +		OCSP_SINGLERESP_it;
> >   +		d2i_KRB5_TKTBODY;
> >   +		EC_POINT_cmp;
> > @@ -2758,24 +2680,20 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		OCSP_cert_to_id;
> >   +		OCSP_RESPID_new;
> >   +		OCSP_RESPDATA_it;
> > -+		OCSP_RESPDATA_it;
> >   +		d2i_OCSP_RESPDATA;
> >   +		ENGINE_register_all_complete;
> >   +		OCSP_check_validity;
> >   +		PKCS12_BAGS_it;
> > -+		PKCS12_BAGS_it;
> >   +		OCSP_url_svcloc_new;
> >   +		ASN1_template_free;
> >   +		OCSP_SINGLERESP_add_ext;
> >   +		KRB5_AUTHENTBODY_it;
> > -+		KRB5_AUTHENTBODY_it;
> >   +		X509_supported_extension;
> >   +		i2d_KRB5_AUTHDATA;
> >   +		UI_method_get_opener;
> >   +		ENGINE_set_ex_data;
> >   +		OCSP_REQUEST_print;
> >   +		CBIGNUM_it;
> > -+		CBIGNUM_it;
> >   +		KRB5_TICKET_new;
> >   +		KRB5_APREQ_new;
> >   +		EC_GROUP_get_curve_GFp;
> > @@ -2785,27 +2703,20 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		OCSP_single_get0_status;
> >   +		BN_swap;
> >   +		POLICYINFO_it;
> > -+		POLICYINFO_it;
> >   +		ENGINE_set_destroy_function;
> >   +		asn1_enc_free;
> >   +		OCSP_RESPID_it;
> > -+		OCSP_RESPID_it;
> >   +		EC_GROUP_new;
> >   +		EVP_aes_256_cbc;
> >   +		i2d_KRB5_PRINCNAME;
> >   +		_ossl_old_des_encrypt2;
> >   +		_ossl_old_des_encrypt3;
> >   +		PKCS8_PRIV_KEY_INFO_it;
> > -+		PKCS8_PRIV_KEY_INFO_it;
> > -+		OCSP_REQINFO_it;
> >   +		OCSP_REQINFO_it;
> >   +		PBEPARAM_it;
> > -+		PBEPARAM_it;
> >   +		KRB5_AUTHENTBODY_new;
> >   +		X509_CRL_add0_revoked;
> >   +		EDIPARTYNAME_it;
> > -+		EDIPARTYNAME_it;
> > -+		NETSCAPE_SPKI_it;
> >   +		NETSCAPE_SPKI_it;
> >   +		UI_get0_test_string;
> >   +		ENGINE_get_cipher_engine;
> > @@ -2817,14 +2728,12 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		UI_method_get_reader;
> >   +		OCSP_BASICRESP_get_ext_count;
> >   +		ASN1_ENUMERATED_it;
> > -+		ASN1_ENUMERATED_it;
> >   +		UI_set_result;
> >   +		i2d_KRB5_TICKET;
> >   +		X509_print_ex_fp;
> >   +		EVP_CIPHER_CTX_set_padding;
> >   +		d2i_OCSP_RESPONSE;
> >   +		ASN1_UTCTIME_it;
> > -+		ASN1_UTCTIME_it;
> >   +		_ossl_old_des_enc_write;
> >   +		OCSP_RESPONSE_new;
> >   +		AES_set_encrypt_key;
> > @@ -2834,14 +2743,11 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		OCSP_onereq_get0_id;
> >   +		ENGINE_set_default_ciphers;
> >   +		NOTICEREF_it;
> > -+		NOTICEREF_it;
> >   +		X509V3_EXT_CRL_add_nconf;
> >   +		OCSP_REVOKEDINFO_it;
> > -+		OCSP_REVOKEDINFO_it;
> >   +		AES_encrypt;
> >   +		OCSP_REQUEST_new;
> >   +		ASN1_ANY_it;
> > -+		ASN1_ANY_it;
> >   +		CRYPTO_ex_data_new_class;
> >   +		_ossl_old_des_ncbc_encrypt;
> >   +		i2d_KRB5_TKTBODY;
> > @@ -2864,19 +2770,15 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		ENGINE_load_nuron;
> >   +		_ossl_old_des_pcbc_encrypt;
> >   +		PKCS12_MAC_DATA_it;
> > -+		PKCS12_MAC_DATA_it;
> >   +		OCSP_accept_responses_new;
> >   +		asn1_do_lock;
> >   +		PKCS7_ATTR_VERIFY_it;
> > -+		PKCS7_ATTR_VERIFY_it;
> > -+		KRB5_APREQBODY_it;
> >   +		KRB5_APREQBODY_it;
> >   +		i2d_OCSP_SINGLERESP;
> >   +		ASN1_item_ex_new;
> >   +		UI_add_verify_string;
> >   +		_ossl_old_des_set_key;
> >   +		KRB5_PRINCNAME_it;
> > -+		KRB5_PRINCNAME_it;
> >   +		EVP_DecryptInit_ex;
> >   +		i2d_OCSP_CERTID;
> >   +		ASN1_item_d2i_bio;
> > @@ -2890,20 +2792,17 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		OCSP_BASICRESP_new;
> >   +		OCSP_REQUEST_get_ext_by_NID;
> >   +		KRB5_APREQ_it;
> > -+		KRB5_APREQ_it;
> >   +		ENGINE_get_destroy_function;
> >   +		CONF_set_nconf;
> >   +		ASN1_PRINTABLE_free;
> >   +		OCSP_BASICRESP_get_ext_by_NID;
> >   +		DIST_POINT_NAME_it;
> > -+		DIST_POINT_NAME_it;
> >   +		X509V3_extensions_print;
> >   +		_ossl_old_des_cfb64_encrypt;
> >   +		X509_REVOKED_add1_ext_i2d;
> >   +		_ossl_old_des_ofb_encrypt;
> >   +		KRB5_TKTBODY_new;
> >   +		ASN1_OCTET_STRING_it;
> > -+		ASN1_OCTET_STRING_it;
> >   +		ERR_load_UI_strings;
> >   +		i2d_KRB5_ENCKEY;
> >   +		ASN1_template_new;
> > @@ -2911,8 +2810,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		ASN1_item_i2d_fp;
> >   +		KRB5_PRINCNAME_free;
> >   +		PKCS7_RECIP_INFO_it;
> > -+		PKCS7_RECIP_INFO_it;
> > -+		EXTENDED_KEY_USAGE_it;
> >   +		EXTENDED_KEY_USAGE_it;
> >   +		EC_GFp_simple_method;
> >   +		EC_GROUP_precompute_mult;
> > @@ -2920,42 +2817,33 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		UI_method_set_writer;
> >   +		KRB5_AUTHENT_new;
> >   +		X509_CRL_INFO_it;
> > -+		X509_CRL_INFO_it;
> >   +		DSO_set_name_converter;
> >   +		AES_set_decrypt_key;
> >   +		PKCS7_DIGEST_it;
> > -+		PKCS7_DIGEST_it;
> >   +		PKCS12_x5092certbag;
> >   +		EVP_DigestInit_ex;
> >   +		i2a_ACCESS_DESCRIPTION;
> >   +		OCSP_RESPONSE_it;
> > -+		OCSP_RESPONSE_it;
> > -+		PKCS7_ENC_CONTENT_it;
> >   +		PKCS7_ENC_CONTENT_it;
> >   +		OCSP_request_add0_id;
> >   +		EC_POINT_make_affine;
> >   +		DSO_get_filename;
> >   +		OCSP_CERTSTATUS_it;
> > -+		OCSP_CERTSTATUS_it;
> >   +		OCSP_request_add1_cert;
> >   +		UI_get0_output_string;
> >   +		UI_dup_verify_string;
> >   +		BN_mod_lshift;
> >   +		KRB5_AUTHDATA_it;
> > -+		KRB5_AUTHDATA_it;
> >   +		asn1_set_choice_selector;
> >   +		OCSP_basic_add1_status;
> >   +		OCSP_RESPID_free;
> >   +		asn1_get_field_ptr;
> >   +		UI_add_input_string;
> >   +		OCSP_CRLID_it;
> > -+		OCSP_CRLID_it;
> >   +		i2d_KRB5_AUTHENTBODY;
> >   +		OCSP_REQUEST_get_ext_count;
> >   +		ENGINE_load_atalla;
> >   +		X509_NAME_it;
> > -+		X509_NAME_it;
> > -+		USERNOTICE_it;
> >   +		USERNOTICE_it;
> >   +		OCSP_REQINFO_new;
> >   +		OCSP_BASICRESP_get_ext;
> > @@ -2965,33 +2853,27 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		i2d_KRB5_ENCDATA;
> >   +		X509_PURPOSE_set;
> >   +		X509_REQ_INFO_it;
> > -+		X509_REQ_INFO_it;
> >   +		UI_method_set_opener;
> >   +		ASN1_item_ex_free;
> >   +		ASN1_BOOLEAN_it;
> > -+		ASN1_BOOLEAN_it;
> >   +		ENGINE_get_table_flags;
> >   +		UI_create_method;
> >   +		OCSP_ONEREQ_add1_ext_i2d;
> >   +		_shadow_DES_check_key;
> > -+		_shadow_DES_check_key;
> >   +		d2i_OCSP_REQINFO;
> >   +		UI_add_info_string;
> >   +		UI_get_result_minsize;
> >   +		ASN1_NULL_it;
> > -+		ASN1_NULL_it;
> >   +		BN_mod_lshift1;
> >   +		d2i_OCSP_ONEREQ;
> >   +		OCSP_ONEREQ_new;
> >   +		KRB5_TICKET_it;
> > -+		KRB5_TICKET_it;
> >   +		EVP_aes_192_cbc;
> >   +		KRB5_TICKET_free;
> >   +		UI_new;
> >   +		OCSP_response_create;
> >   +		_ossl_old_des_xcbc_encrypt;
> >   +		PKCS7_it;
> > -+		PKCS7_it;
> >   +		OCSP_REQUEST_get_ext_by_critical;
> >   +		OCSP_REQUEST_get_ext_by_crit;
> >   +		ENGINE_set_flags;
> > @@ -3000,11 +2882,9 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		EVP_Digest;
> >   +		OCSP_ONEREQ_delete_ext;
> >   +		ASN1_TBOOLEAN_it;
> > -+		ASN1_TBOOLEAN_it;
> >   +		ASN1_item_new;
> >   +		ASN1_TIME_to_generalizedtime;
> >   +		BIGNUM_it;
> > -+		BIGNUM_it;
> >   +		AES_cbc_encrypt;
> >   +		ENGINE_get_load_privkey_function;
> >   +		ENGINE_get_load_privkey_fn;
> > @@ -3016,7 +2896,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		EC_POINT_point2oct;
> >   +		KRB5_APREQ_free;
> >   +		ASN1_OBJECT_it;
> > -+		ASN1_OBJECT_it;
> >   +		OCSP_crlID_new;
> >   +		OCSP_crlID2_new;
> >   +		CONF_modules_load_file;
> > @@ -3074,7 +2953,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		i2d_ASN1_UNIVERSALSTRING;
> >   +		ASN1_UNIVERSALSTRING_free;
> >   +		ASN1_UNIVERSALSTRING_it;
> > -+		ASN1_UNIVERSALSTRING_it;
> >   +		d2i_ASN1_UNIVERSALSTRING;
> >   +		EVP_des_ede3_ecb;
> >   +		X509_REQ_print_ex;
> > @@ -3130,14 +3008,12 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		HMAC_CTX_set_flags;
> >   +		d2i_PROXY_CERT_INFO_EXTENSION;
> >   +		PROXY_POLICY_it;
> > -+		PROXY_POLICY_it;
> >   +		i2d_PROXY_POLICY;
> >   +		i2d_PROXY_CERT_INFO_EXTENSION;
> >   +		d2i_PROXY_POLICY;
> >   +		PROXY_CERT_INFO_EXTENSION_new;
> >   +		PROXY_CERT_INFO_EXTENSION_free;
> >   +		PROXY_CERT_INFO_EXTENSION_it;
> > -+		PROXY_CERT_INFO_EXTENSION_it;
> >   +		PROXY_POLICY_free;
> >   +		PROXY_POLICY_new;
> >   +		BN_MONT_CTX_set_locked;
> > @@ -3174,7 +3050,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		BN_BLINDING_get_thread_id;
> >   +		X509_STORE_CTX_set0_param;
> >   +		POLICY_MAPPING_it;
> > -+		POLICY_MAPPING_it;
> >   +		STORE_parse_attrs_start;
> >   +		POLICY_CONSTRAINTS_free;
> >   +		EVP_PKEY_add1_attr_by_NID;
> > @@ -3183,7 +3058,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		STORE_set_method;
> >   +		GENERAL_SUBTREE_free;
> >   +		NAME_CONSTRAINTS_it;
> > -+		NAME_CONSTRAINTS_it;
> >   +		ECDH_get_default_method;
> >   +		PKCS12_add_safe;
> >   +		EC_KEY_new_by_curve_name;
> > @@ -3226,7 +3100,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		ENGINE_get_default_ECDH;
> >   +		EC_KEY_get_conv_form;
> >   +		ASN1_OCTET_STRING_NDEF_it;
> > -+		ASN1_OCTET_STRING_NDEF_it;
> >   +		STORE_delete_public_key;
> >   +		STORE_get_public_key;
> >   +		STORE_modify_arbitrary;
> > @@ -3383,7 +3256,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		ENGINE_load_padlock;
> >   +		EC_GROUP_set_curve_name;
> >   +		X509_CERT_PAIR_it;
> > -+		X509_CERT_PAIR_it;
> >   +		STORE_meth_get_revoke_fn;
> >   +		STORE_method_get_revoke_function;
> >   +		STORE_method_set_get_function;
> > @@ -3510,7 +3382,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		pqueue_pop;
> >   +		STORE_ATTR_INFO_get0_cstr;
> >   +		POLICY_CONSTRAINTS_it;
> > -+		POLICY_CONSTRAINTS_it;
> >   +		STORE_get_ex_new_index;
> >   +		EVP_PKEY_get_attr_by_OBJ;
> >   +		X509_VERIFY_PARAM_add0_policy;
> > @@ -3558,8 +3429,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		STORE_modify_crl;
> >   +		STORE_list_private_key_start;
> >   +		POLICY_MAPPINGS_it;
> > -+		POLICY_MAPPINGS_it;
> > -+		GENERAL_SUBTREE_it;
> >   +		GENERAL_SUBTREE_it;
> >   +		EC_GROUP_get_curve_name;
> >   +		PEM_write_X509_CERT_PAIR;
> > @@ -3692,15 +3561,12 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		BIO_set_callback_arg;
> >   +		v3_addr_add_prefix;
> >   +		IPAddressOrRange_it;
> > -+		IPAddressOrRange_it;
> >   +		BIO_set_flags;
> >   +		ASIdentifiers_it;
> > -+		ASIdentifiers_it;
> >   +		v3_addr_get_range;
> >   +		BIO_method_type;
> >   +		v3_addr_inherits;
> >   +		IPAddressChoice_it;
> > -+		IPAddressChoice_it;
> >   +		AES_ige_encrypt;
> >   +		v3_addr_add_range;
> >   +		EVP_CIPHER_CTX_nid;
> > @@ -3721,7 +3587,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		BIO_clear_flags;
> >   +		i2d_ASRange;
> >   +		IPAddressRange_it;
> > -+		IPAddressRange_it;
> >   +		IPAddressChoice_new;
> >   +		ASIdentifierChoice_new;
> >   +		ASRange_free;
> > @@ -3742,7 +3607,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		BIO_test_flags;
> >   +		i2d_ASIdentifierChoice;
> >   +		ASRange_it;
> > -+		ASRange_it;
> >   +		d2i_ASIdentifiers;
> >   +		ASRange_new;
> >   +		d2i_IPAddressChoice;
> > @@ -3751,7 +3615,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		EVP_Cipher;
> >   +		i2d_IPAddressOrRange;
> >   +		ASIdOrRange_it;
> > -+		ASIdOrRange_it;
> >   +		EVP_CIPHER_nid;
> >   +		i2d_IPAddressChoice;
> >   +		EVP_CIPHER_CTX_block_size;
> > @@ -3762,7 +3625,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		v3_addr_is_canonical;
> >   +		i2d_IPAddressRange;
> >   +		IPAddressFamily_it;
> > -+		IPAddressFamily_it;
> >   +		v3_asid_inherits;
> >   +		EVP_CIPHER_CTX_cipher;
> >   +		EVP_CIPHER_CTX_get_app_data;
> > @@ -3772,7 +3634,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		d2i_IPAddressOrRange;
> >   +		v3_addr_canonize;
> >   +		ASIdentifierChoice_it;
> > -+		ASIdentifierChoice_it;
> >   +		EVP_MD_CTX_md;
> >   +		d2i_ASIdentifierChoice;
> >   +		BIO_method_name;
> > @@ -3795,7 +3656,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		SEED_set_key;
> >   +		EVP_seed_cfb128;
> >   +		X509_EXTENSIONS_it;
> > -+		X509_EXTENSIONS_it;
> >   +		X509_get1_ocsp;
> >   +		OCSP_REQ_CTX_free;
> >   +		i2d_X509_EXTENSIONS;
> > @@ -3803,7 +3663,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		OCSP_sendreq_new;
> >   +		d2i_X509_EXTENSIONS;
> >   +		X509_ALGORS_it;
> > -+		X509_ALGORS_it;
> >   +		X509_ALGOR_get0;
> >   +		X509_ALGOR_set0;
> >   +		AES_unwrap_key;
> > @@ -3848,7 +3707,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		CMS_SignerInfo_verify;
> >   +		CMS_data;
> >   +		CMS_ContentInfo_it;
> > -+		CMS_ContentInfo_it;
> >   +		d2i_CMS_ReceiptRequest;
> >   +		CMS_compress;
> >   +		CMS_digest_create;
> > @@ -3893,7 +3751,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		CMS_RecipientInfo_kekri_get0_id;
> >   +		CMS_verify_receipt;
> >   +		CMS_ReceiptRequest_it;
> > -+		CMS_ReceiptRequest_it;
> >   +		PEM_read_bio_CMS;
> >   +		CMS_get1_crls;
> >   +		CMS_add0_recipient_key;
> > @@ -4032,7 +3889,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		TS_REQ_dup;
> >   +		GENERAL_NAME_dup;
> >   +		ASN1_SEQUENCE_ANY_it;
> > -+		ASN1_SEQUENCE_ANY_it;
> >   +		WHIRLPOOL;
> >   +		X509_STORE_get1_crls;
> >   +		ENGINE_get_pkey_asn1_meth;
> > @@ -4103,7 +3959,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		DIST_POINT_set_dpname;
> >   +		i2d_ISSUING_DIST_POINT;
> >   +		ASN1_SET_ANY_it;
> > -+		ASN1_SET_ANY_it;
> >   +		EVP_PKEY_CTX_get_data;
> >   +		TS_STATUS_INFO_print_bio;
> >   +		EVP_PKEY_derive_init;
> > @@ -4263,7 +4118,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		EVP_DigestSignFinal;
> >   +		TS_RESP_CTX_set_def_policy;
> >   +		NETSCAPE_X509_it;
> > -+		NETSCAPE_X509_it;
> >   +		TS_RESP_create_response;
> >   +		PKCS7_SIGNER_INFO_get0_algs;
> >   +		TS_TST_INFO_get_nonce;
> > @@ -4322,7 +4176,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		EVP_CIPHER_do_all_sorted;
> >   +		EVP_PKEY_CTX_free;
> >   +		ISSUING_DIST_POINT_it;
> > -+		ISSUING_DIST_POINT_it;
> >   +		d2i_TS_MSG_IMPRINT_fp;
> >   +		X509_STORE_get1_certs;
> >   +		EVP_PKEY_CTX_get_operation;
> > @@ -4615,7 +4468,6 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		X509_signature_dump;
> >   +		d2i_RSA_PSS_PARAMS;
> >   +		RSA_PSS_PARAMS_it;
> > -+		RSA_PSS_PARAMS_it;
> >   +		RSA_PSS_PARAMS_free;
> >   +		X509_sign_ctx;
> >   +		i2d_RSA_PSS_PARAMS;
> > @@ -4638,10 +4490,151 @@ Index: openssl-1.0.1d/openssl.ld
> >   +		CRYPTO_memcmp;
> >   +} OPENSSL_1.0.1;
> >   +
> > -Index: openssl-1.0.1d/engines/openssl.ld
> > ++OPENSSL_1.0.2 {
> > ++	global:
> > ++		SSL_CTX_set_alpn_protos;
> > ++		SSL_set_alpn_protos;
> > ++		SSL_CTX_set_alpn_select_cb;
> > ++		SSL_get0_alpn_selected;
> > ++		SSL_CTX_set_custom_cli_ext;
> > ++		SSL_CTX_set_custom_srv_ext;
> > ++		SSL_CTX_set_srv_supp_data;
> > ++		SSL_CTX_set_cli_supp_data;
> > ++		SSL_set_cert_cb;
> > ++		SSL_CTX_use_serverinfo;
> > ++		SSL_CTX_use_serverinfo_file;
> > ++		SSL_CTX_set_cert_cb;
> > ++		SSL_CTX_get0_param;
> > ++		SSL_get0_param;
> > ++		SSL_certs_clear;
> > ++		DTLSv1_2_method;
> > ++		DTLSv1_2_server_method;
> > ++		DTLSv1_2_client_method;
> > ++		DTLS_method;
> > ++		DTLS_server_method;
> > ++		DTLS_client_method;
> > ++		SSL_CTX_get_ssl_method;
> > ++		SSL_CTX_get0_certificate;
> > ++		SSL_CTX_get0_privatekey;
> > ++		SSL_COMP_set0_compression_methods;
> > ++		SSL_COMP_free_compression_methods;
> > ++		SSL_CIPHER_find;
> > ++		SSL_is_server;
> > ++		SSL_CONF_CTX_new;
> > ++		SSL_CONF_CTX_finish;
> > ++		SSL_CONF_CTX_free;
> > ++		SSL_CONF_CTX_set_flags;
> > ++		SSL_CONF_CTX_clear_flags;
> > ++		SSL_CONF_CTX_set1_prefix;
> > ++		SSL_CONF_CTX_set_ssl;
> > ++		SSL_CONF_CTX_set_ssl_ctx;
> > ++		SSL_CONF_cmd;
> > ++		SSL_CONF_cmd_argv;
> > ++		SSL_CONF_cmd_value_type;
> > ++		SSL_trace;
> > ++		SSL_CIPHER_standard_name;
> > ++		SSL_get_tlsa_record_byname;
> > ++		ASN1_TIME_diff;
> > ++		BIO_hex_string;
> > ++		CMS_RecipientInfo_get0_pkey_ctx;
> > ++		CMS_RecipientInfo_encrypt;
> > ++		CMS_SignerInfo_get0_pkey_ctx;
> > ++		CMS_SignerInfo_get0_md_ctx;
> > ++		CMS_SignerInfo_get0_signature;
> > ++		CMS_RecipientInfo_kari_get0_alg;
> > ++		CMS_RecipientInfo_kari_get0_reks;
> > ++		CMS_RecipientInfo_kari_get0_orig_id;
> > ++		CMS_RecipientInfo_kari_orig_id_cmp;
> > ++		CMS_RecipientEncryptedKey_get0_id;
> > ++		CMS_RecipientEncryptedKey_cert_cmp;
> > ++		CMS_RecipientInfo_kari_set0_pkey;
> > ++		CMS_RecipientInfo_kari_get0_ctx;
> > ++		CMS_RecipientInfo_kari_decrypt;
> > ++		CMS_SharedInfo_encode;
> > ++		DH_compute_key_padded;
> > ++		d2i_DHxparams;
> > ++		i2d_DHxparams;
> > ++		DH_get_1024_160;
> > ++		DH_get_2048_224;
> > ++		DH_get_2048_256;
> > ++		DH_KDF_X9_42;
> > ++		ECDH_KDF_X9_62;
> > ++		ECDSA_METHOD_new;
> > ++		ECDSA_METHOD_free;
> > ++		ECDSA_METHOD_set_app_data;
> > ++		ECDSA_METHOD_get_app_data;
> > ++		ECDSA_METHOD_set_sign;
> > ++		ECDSA_METHOD_set_sign_setup;
> > ++		ECDSA_METHOD_set_verify;
> > ++		ECDSA_METHOD_set_flags;
> > ++		ECDSA_METHOD_set_name;
> > ++		EVP_des_ede3_wrap;
> > ++		EVP_aes_128_wrap;
> > ++		EVP_aes_192_wrap;
> > ++		EVP_aes_256_wrap;
> > ++		EVP_aes_128_cbc_hmac_sha256;
> > ++		EVP_aes_256_cbc_hmac_sha256;
> > ++		CRYPTO_128_wrap;
> > ++		CRYPTO_128_unwrap;
> > ++		OCSP_REQ_CTX_nbio;
> > ++		OCSP_REQ_CTX_new;
> > ++		OCSP_set_max_response_length;
> > ++		OCSP_REQ_CTX_i2d;
> > ++		OCSP_REQ_CTX_nbio_d2i;
> > ++		OCSP_REQ_CTX_get0_mem_bio;
> > ++		OCSP_REQ_CTX_http;
> > ++		RSA_padding_add_PKCS1_OAEP_mgf1;
> > ++		RSA_padding_check_PKCS1_OAEP_mgf1;
> > ++		RSA_OAEP_PARAMS_free;
> > ++		RSA_OAEP_PARAMS_it;
> > ++		RSA_OAEP_PARAMS_new;
> > ++		SSL_get_sigalgs;
> > ++		SSL_get_shared_sigalgs;
> > ++		SSL_check_chain;
> > ++		X509_chain_up_ref;
> > ++		X509_http_nbio;
> > ++		X509_CRL_http_nbio;
> > ++		X509_REVOKED_dup;
> > ++		i2d_re_X509_tbs;
> > ++		X509_get0_signature;
> > ++		X509_get_signature_nid;
> > ++		X509_CRL_diff;
> > ++		X509_chain_check_suiteb;
> > ++		X509_CRL_check_suiteb;
> > ++		X509_check_host;
> > ++		X509_check_email;
> > ++		X509_check_ip;
> > ++		X509_check_ip_asc;
> > ++		X509_STORE_set_lookup_crls_cb;
> > ++		X509_STORE_CTX_get0_store;
> > ++		X509_VERIFY_PARAM_set1_host;
> > ++		X509_VERIFY_PARAM_add1_host;
> > ++		X509_VERIFY_PARAM_set_hostflags;
> > ++		X509_VERIFY_PARAM_get0_peername;
> > ++		X509_VERIFY_PARAM_set1_email;
> > ++		X509_VERIFY_PARAM_set1_ip;
> > ++		X509_VERIFY_PARAM_set1_ip_asc;
> > ++		X509_VERIFY_PARAM_get0_name;
> > ++		X509_VERIFY_PARAM_get_count;
> > ++		X509_VERIFY_PARAM_get0;
> > ++		X509V3_EXT_free;
> > ++		EC_GROUP_get_mont_data;
> > ++		EC_curve_nid2nist;
> > ++		EC_curve_nist2nid;
> > ++		PEM_write_bio_DHxparams;
> > ++		PEM_write_DHxparams;
> > ++		SSL_CTX_add_client_custom_ext;
> > ++		SSL_CTX_add_server_custom_ext;
> > ++		SSL_extension_supported;
> > ++		BUF_strnlen;
> > ++		sk_deep_copy;
> > ++		SSL_test_functions;
> > ++} OPENSSL_1.0.1d;
> > ++
> > +Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/openssl=
=2Eld
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >   --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> > -+++ openssl-1.0.1d/engines/openssl.ld	2013-02-06 19:41:43.000000000 +0=
100
> > ++++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/openssl.ld=
	2014-02-24 21:02:30.000000000 +0100
> >   @@ -0,0 +1,10 @@
> >   +OPENSSL_1.0.0 {
> >   +	global:
> > @@ -4653,10 +4646,10 @@ Index: openssl-1.0.1d/engines/openssl.ld
> >   +		*;
> >   +};
> >   +
> > -Index: openssl-1.0.1d/engines/ccgost/openssl.ld
> > +Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/ccgost/=
openssl.ld
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >   --- /dev/null	1970-01-01 00:00:00.000000000 +0000
> > -+++ openssl-1.0.1d/engines/ccgost/openssl.ld	2013-02-06 19:41:43.00000=
0000 +0100
> > ++++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/ccgost/ope=
nssl.ld	2014-02-24 21:02:30.000000000 +0100
> >   @@ -0,0 +1,10 @@
> >   +OPENSSL_1.0.0 {
> >   +	global:
> > diff --git a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/bloc=
k_digicert_malaysia.patch b/meta/recipes-connectivity/openssl/openssl/debia=
n1.0.2/block_digicert_malaysia.patch
> > new file mode 100644
> > index 0000000..c43bcd1
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/block_digic=
ert_malaysia.patch
> > @@ -0,0 +1,29 @@
> > +From: Raphael Geissert <geissert@debian.org>
> > +Description: make X509_verify_cert indicate that any certificate whose
> > + name contains "Digicert Sdn. Bhd." (from Malaysia) is revoked.
> > +Forwarded: not-needed
> > +Origin: vendor
> > +Last-Update: 2011-11-05
> > +
> > +Upstream-Status: Backport [debian]
> > +
> > +
> > +Index: openssl-1.0.2~beta1/crypto/x509/x509_vfy.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- openssl-1.0.2~beta1.orig/crypto/x509/x509_vfy.c	2014-02-25 00:16:1=
2.488028844 +0100
> > ++++ openssl-1.0.2~beta1/crypto/x509/x509_vfy.c	2014-02-25 00:16:12.484=
028929 +0100
> > +@@ -964,10 +964,11 @@
> > + 	for (i =3D sk_X509_num(ctx->chain) - 1; i >=3D 0; i--)
> > + 		{
> > + 		x =3D sk_X509_value(ctx->chain, i);
> > +-		/* Mark DigiNotar certificates as revoked, no matter
> > +-		 * where in the chain they are.
> > ++		/* Mark certificates containing the following names as
> > ++		 * revoked, no matter where in the chain they are.
> > + 		 */
> > +-		if (x->name && strstr(x->name, "DigiNotar"))
> > ++		if (x->name && (strstr(x->name, "DigiNotar") ||
> > ++			strstr(x->name, "Digicert Sdn. Bhd.")))
> > + 			{
> > + 			ctx->error =3D X509_V_ERR_CERT_REVOKED;
> > + 			ctx->error_depth =3D i;
> > diff --git a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/bloc=
k_diginotar.patch b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/b=
lock_diginotar.patch
> > new file mode 100644
> > index 0000000..0c1a0b6
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/block_digin=
otar.patch
> > @@ -0,0 +1,67 @@
> > +From: Raphael Geissert <geissert@debian.org>
> > +Description: make X509_verify_cert indicate that any certificate whose
> > + name contains "DigiNotar" is revoked.
> > +Forwarded: not-needed
> > +Origin: vendor
> > +Last-Update: 2011-09-08
> > +Bug: http://bugs.debian.org/639744
> > +Reviewed-by: Kurt Roeckx <kurt@roeckx.be>
> > +Reviewed-by: Dr Stephen N Henson <shenson@drh-consultancy.co.uk>
> > +
> > +This is not meant as final patch.
> > +
> > +Upstream-Status: Backport [debian]
> > +
> > +
> > +Index: openssl-1.0.2/crypto/x509/x509_vfy.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- openssl-1.0.2.orig/crypto/x509/x509_vfy.c
> > ++++ openssl-1.0.2/crypto/x509/x509_vfy.c
> > +@@ -119,6 +119,7 @@ static int check_trust(X509_STORE_CTX *c
> > + static int check_revocation(X509_STORE_CTX *ctx);
> > + static int check_cert(X509_STORE_CTX *ctx);
> > + static int check_policy(X509_STORE_CTX *ctx);
> > ++static int check_ca_blacklist(X509_STORE_CTX *ctx);
> > +
> > + static int get_crl_score(X509_STORE_CTX *ctx, X509 **pissuer,
> > +                          unsigned int *preasons, X509_CRL *crl, X509 =
*x);
> > +@@ -438,6 +439,9 @@ int X509_verify_cert(X509_STORE_CTX *ctx
> > +     if (!ok)
> > +         goto end;
> > +
> > ++	ok =3D check_ca_blacklist(ctx);
> > ++	if(!ok) goto end;
> > ++
> > + #ifndef OPENSSL_NO_RFC3779
> > +     /* RFC 3779 path validation, now that CRL check has been done */
> > +     ok =3D v3_asid_validate_path(ctx);
> > +@@ -938,6 +942,29 @@ static int check_crl_time(X509_STORE_CTX
> > +     return 1;
> > + }
> > +
> > ++static int check_ca_blacklist(X509_STORE_CTX *ctx)
> > ++	{
> > ++	X509 *x;
> > ++	int i;
> > ++	/* Check all certificates against the blacklist */
> > ++	for (i =3D sk_X509_num(ctx->chain) - 1; i >=3D 0; i--)
> > ++		{
> > ++		x =3D sk_X509_value(ctx->chain, i);
> > ++		/* Mark DigiNotar certificates as revoked, no matter
> > ++		 * where in the chain they are.
> > ++		 */
> > ++		if (x->name && strstr(x->name, "DigiNotar"))
> > ++			{
> > ++			ctx->error =3D X509_V_ERR_CERT_REVOKED;
> > ++			ctx->error_depth =3D i;
> > ++			ctx->current_cert =3D x;
> > ++			if (!ctx->verify_cb(0,ctx))
> > ++				return 0;
> > ++			}
> > ++		}
> > ++	return 1;
> > ++	}
> > ++
> > + static int get_crl_sk(X509_STORE_CTX *ctx, X509_CRL **pcrl, X509_CRL =
**pdcrl,
> > +                       X509 **pissuer, int *pscore, unsigned int *prea=
sons,
> > +                       STACK_OF(X509_CRL) *crls)
> > diff --git a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/padl=
ock_conf.patch b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/padl=
ock_conf.patch
> > new file mode 100644
> > index 0000000..61dcf45
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/padlock_con=
f.patch
> > @@ -0,0 +1,31 @@
> > +
> > +Upstream-Status: Backport [debian]
> > +
> > +--- openssl/apps/openssl.cnf.orig	2012-06-06 00:45:56.000000000 +0200
> > ++++ openssl/apps/openssl.cnf	2012-06-06 00:46:46.000000000 +0200
> > +@@ -19,6 +19,8 @@
> > + # (Alternatively, use a configuration file that has only
> > + # X.509v3 extensions in its main [=3D default] section.)
> > +
> > ++openssl_conf =3D openssl_def
> > ++
> > + [ new_oids ]
> > +
> > + # We can add new OIDs in here for use by 'ca', 'req' and 'ts'.
> > +@@ -348,3 +350,16 @@
> > + 				# (optional, default: no)
> > + ess_cert_id_chain	=3D no	# Must the ESS cert id chain be included?
> > + 				# (optional, default: no)
> > ++
> > ++[openssl_def]
> > ++engines =3D engine_section
> > ++
> > ++[engine_section]
> > ++padlock =3D padlock_section
> > ++
> > ++[padlock_section]
> > ++soft_load=3D1
> > ++init=3D1
> > ++default_algorithms =3D ALL
> > ++dynamic_path=3Dpadlock
> > ++
> > diff --git a/meta/recipes-connectivity/openssl/openssl/engines-install-=
in-libdir-ssl.patch b/meta/recipes-connectivity/openssl/openssl/engines-ins=
tall-in-libdir-ssl.patch
> > index d8a6f1a..a574648 100644
> > --- a/meta/recipes-connectivity/openssl/openssl/engines-install-in-libd=
ir-ssl.patch
> > +++ b/meta/recipes-connectivity/openssl/openssl/engines-install-in-libd=
ir-ssl.patch
> > @@ -1,11 +1,11 @@
> >   Upstream-Status: Inappropriate [configuration]
> >
> >
> > -Index: openssl-1.0.0/engines/Makefile
> > +Index: openssl-1.0.2/engines/Makefile
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- openssl-1.0.0.orig/engines/Makefile
> > -+++ openssl-1.0.0/engines/Makefile
> > -@@ -107,7 +107,7 @@
> > +--- openssl-1.0.2.orig/engines/Makefile
> > ++++ openssl-1.0.2/engines/Makefile
> > +@@ -107,13 +107,13 @@ install:
> >    	@[ -n "$(INSTALLTOP)" ] # should be set by top Makefile...
> >    	@if [ -n "$(SHARED_LIBS)" ]; then \
> >    		set -e; \
> > @@ -14,16 +14,19 @@ Index: openssl-1.0.0/engines/Makefile
> >    		for l in $(LIBNAMES); do \
> >    			( echo installing $$l; \
> >    			  pfx=3Dlib; \
> > -@@ -119,13 +119,13 @@
> > + 			  if expr "$(PLATFORM)" : "Cygwin" >/dev/null; then \
> > + 				sfx=3D".so"; \
> > +-				cp cyg$$l.dll $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$=
pfx$$l$$sfx.new; \
> > ++				cp cyg$$l.dll $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engine=
s/$$pfx$$l$$sfx.new; \
> > + 			  else \
> > + 				case "$(CFLAGS)" in \
> > + 				*DSO_BEOS*)	sfx=3D".so";;	\
> > +@@ -122,10 +122,10 @@ install:
> >    				*DSO_WIN32*)	sfx=3D"eay32.dll"; pfx=3D;;	\
> >    				*)		sfx=3D".bad";;	\
> >    				esac; \
> >   -				cp $$pfx$$l$$sfx $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engine=
s/$$pfx$$l$$sfx.new; \
> >   +				cp $$pfx$$l$$sfx $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/en=
gines/$$pfx$$l$$sfx.new; \
> > - 			  else \
> > - 				sfx=3D".so"; \
> > --				cp cyg$$l.dll $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$=
pfx$$l$$sfx.new; \
> > -+				cp cyg$$l.dll $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/engine=
s/$$pfx$$l$$sfx.new; \
> >    			  fi; \
> >   -			  chmod 555 $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pf=
x$$l$$sfx.new; \
> >   -			  mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l=
$$sfx.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$$pfx$$l$$sfx );=
 \
> > @@ -32,20 +35,25 @@ Index: openssl-1.0.0/engines/Makefile
> >    		done; \
> >    	fi
> >    	@target=3Dinstall; $(RECURSIVE_MAKE)
> > -Index: openssl-1.0.0/engines/ccgost/Makefile
> > +Index: openssl-1.0.2/engines/ccgost/Makefile
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- openssl-1.0.0.orig/engines/ccgost/Makefile
> > -+++ openssl-1.0.0/engines/ccgost/Makefile
> > -@@ -53,13 +53,13 @@
> > +--- openssl-1.0.2.orig/engines/ccgost/Makefile
> > ++++ openssl-1.0.2/engines/ccgost/Makefile
> > +@@ -47,7 +47,7 @@ install:
> > + 		pfx=3Dlib; \
> > + 		if expr "$(PLATFORM)" : "Cygwin" >/dev/null; then \
> > + 			sfx=3D".so"; \
> > +-			cp cyg$(LIBNAME).dll $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engi=
nes/$${pfx}$(LIBNAME)$$sfx.new; \
> > ++			cp cyg$(LIBNAME).dll $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/=
engines/$${pfx}$(LIBNAME)$$sfx.new; \
> > + 		else \
> > + 			case "$(CFLAGS)" in \
> > + 			*DSO_BEOS*) sfx=3D".so";; \
> > +@@ -56,10 +56,10 @@ install:
> >    			*DSO_WIN32*) sfx=3D"eay32.dll"; pfx=3D;; \
> >    			*) sfx=3D".bad";; \
> >    			esac; \
> >   -			cp $${pfx}$(LIBNAME)$$sfx $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR=
)/engines/$${pfx}$(LIBNAME)$$sfx.new; \
> >   +			cp $${pfx}$(LIBNAME)$$sfx $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR=
)/ssl/engines/$${pfx}$(LIBNAME)$$sfx.new; \
> > - 		else \
> > - 			sfx=3D".so"; \
> > --			cp cyg$(LIBNAME).dll $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engi=
nes/$${pfx}$(LIBNAME)$$sfx.new; \
> > -+			cp cyg$(LIBNAME).dll $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/ssl/=
engines/$${pfx}$(LIBNAME)$$sfx.new; \
> >    		fi; \
> >   -		chmod 555 $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$${pfx}=
$(LIBNAME)$$sfx.new; \
> >   -		mv -f $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$${pfx}$(LI=
BNAME)$$sfx.new $(INSTALL_PREFIX)$(INSTALLTOP)/$(LIBDIR)/engines/$${pfx}$(L=
IBNAME)$$sfx; \
> > diff --git a/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-e=
de3-cfb1.patch b/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-e=
de3-cfb1.patch
> > index f0e1778..06d1ea6 100644
> > --- a/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb=
1.patch
> > +++ b/meta/recipes-connectivity/openssl/openssl/fix-cipher-des-ede3-cfb=
1.patch
> > @@ -6,17 +6,16 @@ http://rt.openssl.org/Ticket/Display.html?id=3D2867
> >
> >   Signed-Off-By: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> >
> > -diff --git a/crypto/evp/e_des3.c b/crypto/evp/e_des3.c
> > -index 3232cfe..df84922 100644
> > +Index: openssl-1.0.2/crypto/evp/e_des3.c
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- a/crypto/evp/e_des3.c
> > -+++ b/crypto/evp/e_des3.c
> > -@@ -173,7 +173,7 @@ static int des_ede3_cfb1_cipher(EVP_CIPHER_CTX *ct=
x, unsigned char *out,
> > +--- openssl-1.0.2.orig/crypto/evp/e_des3.c
> > ++++ openssl-1.0.2/crypto/evp/e_des3.c
> > +@@ -211,7 +211,7 @@ static int des_ede3_cfb1_cipher(EVP_CIPH
> >        size_t n;
> > -     unsigned char c[1],d[1];
> > +     unsigned char c[1], d[1];
> >
> > --    for(n=3D0 ; n < inl ; ++n)
> > -+    for(n=3D0 ; n < inl*8 ; ++n)
> > - 	{
> > - 	c[0]=3D(in[n/8]&(1 << (7-n%8))) ? 0x80 : 0;
> > -	DES_ede3_cfb_encrypt(c,d,1,1,
> > +-    for (n =3D 0; n < inl; ++n) {
> > ++    for (n =3D 0; n * 8 < inl; ++n) {
> > +         c[0] =3D (in[n / 8] & (1 << (7 - n % 8))) ? 0x80 : 0;
> > +         DES_ede3_cfb_encrypt(c, d, 1, 1,
> > +                              &data(ctx)->ks1, &data(ctx)->ks2,
> > diff --git a/meta/recipes-connectivity/openssl/openssl/initial-aarch64-=
bits.patch b/meta/recipes-connectivity/openssl/openssl/initial-aarch64-bits=
=2Epatch
> > deleted file mode 100644
> > index 770097d..0000000
> > --- a/meta/recipes-connectivity/openssl/openssl/initial-aarch64-bits.pa=
tch
> > +++ /dev/null
> > @@ -1,120 +0,0 @@
> > -From: Andy Polyakov <appro@openssl.org>
> > -Date: Sun, 13 Oct 2013 17:15:15 +0000 (+0200)
> > -Subject: Initial aarch64 bits.
> > -X-Git-Url: http://git.openssl.org/gitweb/?p=3Dopenssl.git;a=3Dcommitdi=
ff_plain;h=3D039081b80977e2a5de84e1f88f8b4d025b559956
> > -
> > -Initial aarch64 bits.
> > -Upstream-Status: backport (will be included in 1.0.2)
> > ----
> > - crypto/bn/bn_lcl.h       |    9 +++++++++
> > - crypto/md32_common.h     |   18 ++++++++++++++++++
> > - crypto/modes/modes_lcl.h |    8 ++++++++
> > - crypto/sha/sha512.c      |   13 +++++++++++++
> > - 4 files changed, 48 insertions(+)
> > -
> > -Index: openssl-1.0.1f/crypto/bn/bn_lcl.h
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- openssl-1.0.1f.orig/crypto/bn/bn_lcl.h	2014-01-06 15:47:42.0000000=
00 +0200
> > -+++ openssl-1.0.1f/crypto/bn/bn_lcl.h	2014-02-28 10:37:55.495979037 +0=
200
> > -@@ -300,6 +300,15 @@
> > - 	     : "r"(a), "r"(b));
> > - #    endif
> > - #  endif
> > -+# elif defined(__aarch64__) && defined(SIXTY_FOUR_BIT_LONG)
> > -+#  if defined(__GNUC__) && __GNUC__>=3D2
> > -+#   define BN_UMULT_HIGH(a,b)  ({  \
> > -+   register BN_ULONG ret;      \
> > -+   asm ("umulh %0,%1,%2"   \
> > -+        : "=3Dr"(ret)        \
> > -+        : "r"(a), "r"(b));     \
> > -+   ret;            })
> > -+#  endif
> > - # endif		/* cpu */
> > - #endif		/* OPENSSL_NO_ASM */
> > -
> > -Index: openssl-1.0.1f/crypto/md32_common.h
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- openssl-1.0.1f.orig/crypto/md32_common.h	2014-01-06 15:47:42.00000=
0000 +0200
> > -+++ openssl-1.0.1f/crypto/md32_common.h	2014-02-28 10:39:21.751979107 =
+0200
> > -@@ -213,6 +213,24 @@
> > - 				   asm ("bswapl %0":"=3Dr"(r):"0"(r));	\
> > - 				   *((unsigned int *)(c))=3Dr; (c)+=3D4; r;	})
> > - #   endif
> > -+#  elif defined(__aarch64__)
> > -+#   if defined(__BYTE_ORDER__)
> > -+#    if defined(__ORDER_LITTLE_ENDIAN__) && __BYTE_ORDER__=3D=3D__ORD=
ER_LITTLE_ENDIAN__
> > -+#     define HOST_c2l(c,l) ({ unsigned int r;      \
> > -+                  asm ("rev    %w0,%w1"    \
> > -+                   :"=3Dr"(r)        \
> > -+                   :"r"(*((const unsigned int *)(c))));\
> > -+                  (c)+=3D4; (l)=3Dr;       })
> > -+#     define HOST_l2c(l,c) ({ unsigned int r;      \
> > -+                  asm ("rev    %w0,%w1"    \
> > -+                   :"=3Dr"(r)        \
> > -+                   :"r"((unsigned int)(l)));\
> > -+                  *((unsigned int *)(c))=3Dr; (c)+=3D4; r; })
> > -+#    elif defined(__ORDER_BIG_ENDIAN__) && __BYTE_ORDER__=3D=3D__ORDE=
R_BIG_ENDIAN__
> > -+#     define HOST_c2l(c,l) ((l)=3D*((const unsigned int *)(c)), (c)+=
=3D4, (l))
> > -+#     define HOST_l2c(l,c) (*((unsigned int *)(c))=3D(l), (c)+=3D4, (=
l))
> > -+#    endif
> > -+#   endif
> > - #  endif
> > - # endif
> > - #endif
> > -Index: openssl-1.0.1f/crypto/modes/modes_lcl.h
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- openssl-1.0.1f.orig/crypto/modes/modes_lcl.h	2014-02-28 10:47:48.7=
31979011 +0200
> > -+++ openssl-1.0.1f/crypto/modes/modes_lcl.h	2014-02-28 10:48:49.707978=
919 +0200
> > -@@ -29,6 +29,7 @@
> > - #if defined(__i386)	|| defined(__i386__)	|| \
> > -     defined(__x86_64)	|| defined(__x86_64__)	|| \
> > -     defined(_M_IX86)	|| defined(_M_AMD64)	|| defined(_M_X64) || \
> > -+    defined(__aarch64__)           || \
> > -     defined(__s390__)	|| defined(__s390x__)
> > - # undef STRICT_ALIGNMENT
> > - #endif
> > -@@ -50,6 +51,13 @@
> > - #  define BSWAP4(x) ({	u32 ret=3D(x);			\
> > - 			asm ("bswapl %0"		\
> > - 			: "+r"(ret));	ret;		})
> > -+# elif defined(__aarch64__)
> > -+#  define BSWAP8(x) ({ u64 ret;            \
> > -+           asm ("rev %0,%1"        \
> > -+           : "=3Dr"(ret) : "r"(x)); ret; })
> > -+#  define BSWAP4(x) ({ u32 ret;            \
> > -+           asm ("rev %w0,%w1"      \
> > -+           : "=3Dr"(ret) : "r"(x)); ret; })
> > - # elif (defined(__arm__) || defined(__arm)) && !defined(STRICT_ALIGNM=
ENT)
> > - #  define BSWAP8(x) ({	u32 lo=3D(u64)(x)>>32,hi=3D(x);	\
> > - 			asm ("rev %0,%0; rev %1,%1"	\
> > -Index: openssl-1.0.1f/crypto/sha/sha512.c
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- openssl-1.0.1f.orig/crypto/sha/sha512.c	2014-01-06 15:47:42.000000=
000 +0200
> > -+++ openssl-1.0.1f/crypto/sha/sha512.c	2014-02-28 10:52:14.579978981 +=
0200
> > -@@ -55,6 +55,7 @@
> > - #if defined(__i386) || defined(__i386__) || defined(_M_IX86) || \
> > -     defined(__x86_64) || defined(_M_AMD64) || defined(_M_X64) || \
> > -     defined(__s390__) || defined(__s390x__) || \
> > -+    defined(__aarch64__) || \
> > -     defined(SHA512_ASM)
> > - #define SHA512_BLOCK_CAN_MANAGE_UNALIGNED_DATA
> > - #endif
> > -@@ -347,6 +348,18 @@
> > - 				asm ("rotrdi %0,%1,%2"	\
> > - 				: "=3Dr"(ret)		\
> > - 				: "r"(a),"K"(n)); ret;	})
> > -+#  elif defined(__aarch64__)
> > -+#   define ROTR(a,n)   ({ SHA_LONG64 ret;      \
> > -+               asm ("ror %0,%1,%2" \
> > -+               : "=3Dr"(ret)     \
> > -+               : "r"(a),"I"(n)); ret;  })
> > -+#   if  defined(__BYTE_ORDER__) && defined(__ORDER_LITTLE_ENDIAN__) &=
& \
> > -+   __BYTE_ORDER__=3D=3D__ORDER_LITTLE_ENDIAN__
> > -+#    define PULL64(x)  ({ SHA_LONG64 ret;          \
> > -+               asm ("rev   %0,%1"      \
> > -+               : "=3Dr"(ret)         \
> > -+               : "r"(*((const SHA_LONG64 *)(&(x))))); ret;     })
> > -+#   endif
> > - #  endif
> > - # elif defined(_MSC_VER)
> > - #  if defined(_WIN64)	/* applies to both IA-64 and AMD64 */
> > diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NU=
LL-pointer-dereference-in-EVP_DigestInit_ex.patch b/meta/recipes-connectivi=
ty/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit=
_ex.patch
> > index c161e62..cebc8cf 100644
> > --- a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-poin=
ter-dereference-in-EVP_DigestInit_ex.patch
> > +++ b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-poin=
ter-dereference-in-EVP_DigestInit_ex.patch
> > @@ -8,14 +8,16 @@ http://www.mail-archive.com/openssl-dev@openssl.org/m=
sg32860.html
> >
> >   Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> >   ---
> > ---- a/crypto/evp/digest.c
> > -+++ b/crypto/evp/digest.c
> > -@@ -199,7 +199,7 @@
> > - 		return 0;
> > - 		}
> > +Index: openssl-1.0.2/crypto/evp/digest.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- openssl-1.0.2.orig/crypto/evp/digest.c
> > ++++ openssl-1.0.2/crypto/evp/digest.c
> > +@@ -208,7 +208,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, c
> > +         return 0;
> > +     }
> >    #endif
> > --	if (ctx->digest !=3D type)
> > -+	if (type && (ctx->digest !=3D type))
> > - 		{
> > - 		if (ctx->digest && ctx->digest->ctx_size)
> > - 			OPENSSL_free(ctx->md_data);
> > +-    if (ctx->digest !=3D type) {
> > ++    if (type && (ctx->digest !=3D type)) {
> > +         if (ctx->digest && ctx->digest->ctx_size)
> > +             OPENSSL_free(ctx->md_data);
> > +         ctx->digest =3D type;
> > diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NU=
LL-pointer-dereference-in-dh_pub_encode.patch b/meta/recipes-connectivity/o=
penssl/openssl/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch
> > index 3e93fe4..d7047bb 100644
> > --- a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-poin=
ter-dereference-in-dh_pub_encode.patch
> > +++ b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-poin=
ter-dereference-in-dh_pub_encode.patch
> > @@ -8,32 +8,19 @@ http://www.mail-archive.com/openssl-dev@openssl.org/m=
sg32859.html
> >
> >   Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> >   ---
> > ---- a/crypto/dh/dh_ameth.c
> > -+++ b/crypto/dh/dh_ameth.c
> > -@@ -139,6 +139,12 @@
> > - 	dh=3Dpkey->pkey.dh;
> > +Index: openssl-1.0.2/crypto/dh/dh_ameth.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- openssl-1.0.2.orig/crypto/dh/dh_ameth.c
> > ++++ openssl-1.0.2/crypto/dh/dh_ameth.c
> > +@@ -161,6 +161,11 @@ static int dh_pub_encode(X509_PUBKEY *pk
> > +     dh =3D pkey->pkey.dh;
> >
> > - 	str =3D ASN1_STRING_new();
> > -+	if (!str)
> > -+		{
> > -+		DHerr(DH_F_DH_PUB_ENCODE, ERR_R_MALLOC_FAILURE);
> > -+		goto err;
> > -+		}
> > +     str =3D ASN1_STRING_new();
> > ++    if (!str) {
> > ++        DHerr(DH_F_DH_PUB_ENCODE, ERR_R_MALLOC_FAILURE);
> > ++        goto err;
> > ++    }
> >   +
> > - 	str->length =3D i2d_DHparams(dh, &str->data);
> > - 	if (str->length <=3D 0)
> > - 		{
> > ---- a/crypto/dsa/dsa_ameth.c
> > -+++ b/crypto/dsa/dsa_ameth.c
> > -@@ -148,6 +148,11 @@
> > - 		{
> > - 		ASN1_STRING *str;
> > - 		str =3D ASN1_STRING_new();
> > -+		if (!str)
> > -+			{
> > -+			DSAerr(DSA_F_DSA_PUB_ENCODE, ERR_R_MALLOC_FAILURE);
> > -+			goto err;
> > -+			}
> > - 		str->length =3D i2d_DSAparams(dsa, &str->data);
> > - 		if (str->length <=3D 0)
> > - 			{
> > +     str->length =3D i2d_dhp(pkey, dh, &str->data);
> > +     if (str->length <=3D 0) {
> > +         DHerr(DH_F_DH_PUB_ENCODE, ERR_R_MALLOC_FAILURE);
> > diff --git a/meta/recipes-connectivity/openssl/openssl/openssl_fix_for_=
x32.patch b/meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.p=
atch
> > index 93ce034..cbce32c 100644
> > --- a/meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.pat=
ch
> > +++ b/meta/recipes-connectivity/openssl/openssl/openssl_fix_for_x32.pat=
ch
> > @@ -6,64 +6,13 @@ Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.c=
om> 2011/07/13
> >
> >   ported the patch to the 1.0.0e version
> >   Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/01
> > -Index: openssl-1.0.1e/Configure
> > +Index: openssl-1.0.2/crypto/bn/bn.h
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- openssl-1.0.1e.orig/Configure
> > -+++ openssl-1.0.1e/Configure
> > -@@ -402,6 +402,7 @@ my %table=3D(
> > - "linux-ia64-ecc","ecc:-DL_ENDIAN -DTERMIO -O2 -Wall -no_cpprt::-D_REE=
NTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT:${ia64_asm}:dlfcn:linux-=
shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> > - "linux-ia64-icc","icc:-DL_ENDIAN -DTERMIO -O2 -Wall -no_cpprt::-D_REE=
NTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_INT:${ia64_asm}:dl=
fcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> > - "linux-x86_64",	"gcc:-m64 -DL_ENDIAN -DTERMIO -O3 -Wall::-D_REENTRANT=
::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_UNROLL:${x86_64_asm}:elf:d=
lfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::64",
> > -+"linux-x32", "gcc:-mx32 -DL_ENDIAN -DTERMIO -O3 -Wall -DMD32_REG_T=3D=
int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT RC4_CHUNK DES_INT DES_UNROLL:${x86_6=
4_asm}:elf:dlfcn:linux-shared:-fPIC:-mx32:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINO=
R):::x32",
> > - "linux64-s390x",	"gcc:-m64 -DB_ENDIAN -DTERMIO -O3 -Wall::-D_REENTRAN=
T::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL:${s390x_a=
sm}:64:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::=
64",
> > - #### So called "highgprs" target for z/Architecture CPUs
> > - # "Highgprs" is kernel feature first implemented in Linux 2.6.32, see
> > -Index: openssl-1.0.1e/crypto/bn/asm/x86_64-gcc.c
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- openssl-1.0.1e.orig/crypto/bn/asm/x86_64-gcc.c
> > -+++ openssl-1.0.1e/crypto/bn/asm/x86_64-gcc.c
> > -@@ -55,7 +55,7 @@
> > -  *    machine.
> > -  */
> > -
> > --#ifdef _WIN64
> > -+#if defined _WIN64 || !defined __LP64__
> > - #define BN_ULONG unsigned long long
> > - #else
> > - #define BN_ULONG unsigned long
> > -@@ -192,9 +192,9 @@ BN_ULONG bn_add_words (BN_ULONG *rp, con
> > - 	asm (
> > - 	"	subq	%2,%2		\n"
> > - 	".p2align 4			\n"
> > --	"1:	movq	(%4,%2,8),%0	\n"
> > --	"	adcq	(%5,%2,8),%0	\n"
> > --	"	movq	%0,(%3,%2,8)	\n"
> > -+	"1:	movq	(%q4,%2,8),%0	\n"
> > -+	"	adcq	(%q5,%2,8),%0	\n"
> > -+	"	movq	%0,(%q3,%2,8)	\n"
> > - 	"	leaq	1(%2),%2	\n"
> > - 	"	loop	1b		\n"
> > - 	"	sbbq	%0,%0		\n"
> > -@@ -215,9 +215,9 @@ BN_ULONG bn_sub_words (BN_ULONG *rp, con
> > - 	asm (
> > - 	"	subq	%2,%2		\n"
> > - 	".p2align 4			\n"
> > --	"1:	movq	(%4,%2,8),%0	\n"
> > --	"	sbbq	(%5,%2,8),%0	\n"
> > --	"	movq	%0,(%3,%2,8)	\n"
> > -+	"1:	movq	(%q4,%2,8),%0	\n"
> > -+	"	sbbq	(%q5,%2,8),%0	\n"
> > -+	"	movq	%0,(%q3,%2,8)	\n"
> > - 	"	leaq	1(%2),%2	\n"
> > - 	"	loop	1b		\n"
> > - 	"	sbbq	%0,%0		\n"
> > -Index: openssl-1.0.1e/crypto/bn/bn.h
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- openssl-1.0.1e.orig/crypto/bn/bn.h
> > -+++ openssl-1.0.1e/crypto/bn/bn.h
> > -@@ -172,6 +172,13 @@ extern "C" {
> > +--- openssl-1.0.2.orig/crypto/bn/bn.h
> > ++++ openssl-1.0.2/crypto/bn/bn.h
> > +@@ -173,6 +173,13 @@ extern "C" {
> > + #  endif
> >    # endif
> > - #endif
> >
> >   +/* Address type.  */
> >   +#ifdef _WIN64
> > @@ -72,19 +21,19 @@ Index: openssl-1.0.1e/crypto/bn/bn.h
> >   +#define BN_ADDR unsigned long
> >   +#endif
> >   +
> > - /* assuming long is 64bit - this is the DEC Alpha
> > -  * unsigned long long is only 64 bits :-(, don't define
> > -  * BN_LLONG for the DEC Alpha */
> > -Index: openssl-1.0.1e/crypto/bn/bn_exp.c
> > + /*
> > +  * assuming long is 64bit - this is the DEC Alpha unsigned long long =
is only
> > +  * 64 bits :-(, don't define BN_LLONG for the DEC Alpha
> > +Index: openssl-1.0.2/crypto/bn/bn_exp.c
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- openssl-1.0.1e.orig/crypto/bn/bn_exp.c
> > -+++ openssl-1.0.1e/crypto/bn/bn_exp.c
> > -@@ -567,7 +567,7 @@ static int MOD_EXP_CTIME_COPY_FROM_PREBU
> > -
> > - /* Given a pointer value, compute the next address that is a cache li=
ne multiple. */
> > +--- openssl-1.0.2.orig/crypto/bn/bn_exp.c
> > ++++ openssl-1.0.2/crypto/bn/bn_exp.c
> > +@@ -638,7 +638,7 @@ static int MOD_EXP_CTIME_COPY_FROM_PREBU
> > +  * multiple.
> > +  */
> >    #define MOD_EXP_CTIME_ALIGN(x_) \
> > --	((unsigned char*)(x_) + (MOD_EXP_CTIME_MIN_CACHE_LINE_WIDTH - (((siz=
e_t)(x_)) & (MOD_EXP_CTIME_MIN_CACHE_LINE_MASK))))
> > +-        ((unsigned char*)(x_) + (MOD_EXP_CTIME_MIN_CACHE_LINE_WIDTH -=
 (((size_t)(x_)) & (MOD_EXP_CTIME_MIN_CACHE_LINE_MASK))))
> >   +	((unsigned char*)(x_) + (MOD_EXP_CTIME_MIN_CACHE_LINE_WIDTH - (((BN=
_ADDR)(x_)) & (MOD_EXP_CTIME_MIN_CACHE_LINE_MASK))))
> >
> > - /* This variant of BN_mod_exp_mont() uses fixed windows and the speci=
al
> > -  * precomputation memory layout to limit data-dependency to a minimum
> > + /*
> > +  * This variant of BN_mod_exp_mont() uses fixed windows and the speci=
al
> > diff --git a/meta/recipes-connectivity/openssl/openssl/ptest-deps.patch=
 b/meta/recipes-connectivity/openssl/openssl/ptest-deps.patch
> > index 527e10c..ef6d179 100644
> > --- a/meta/recipes-connectivity/openssl/openssl/ptest-deps.patch
> > +++ b/meta/recipes-connectivity/openssl/openssl/ptest-deps.patch
> > @@ -10,11 +10,11 @@ Upstream-Status: Inappropriate [config]
> >
> >   Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> >
> > -diff --git a/test/Makefile b/test/Makefile
> > -index e6fcfb4..5ae043b 100644
> > ---- a/test/Makefile
> > -+++ b/test/Makefile
> > -@@ -322,11 +322,11 @@ test_cms:
> > +Index: openssl-1.0.2/test/Makefile
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- openssl-1.0.2.orig/test/Makefile
> > ++++ openssl-1.0.2/test/Makefile
> > +@@ -330,7 +330,7 @@ test_cms: ../apps/openssl$(EXE_EXT) cms-
> >    	@echo "CMS consistency test"
> >    	$(PERL) cms-test.pl
> >
> > @@ -23,8 +23,12 @@ index e6fcfb4..5ae043b 100644
> >    	@echo "Test SRP"
> >    	../util/shlib_wrap.sh ./srptest
> >
> > +@@ -342,7 +342,7 @@ test_v3name: $(V3NAMETEST)$(EXE_EXT)
> > + 	@echo "Test X509v3_check_*"
> > + 	../util/shlib_wrap.sh ./$(V3NAMETEST)
> > +
> >   -test_heartbeat: $(HEARTBEATTEST)$(EXE_EXT)
> >   +test_heartbeat:
> >    	../util/shlib_wrap.sh ./$(HEARTBEATTEST)
> >
> > - lint:
> > + test_constant_time: $(CONSTTIMETEST)$(EXE_EXT)
> > diff --git a/meta/recipes-connectivity/openssl/openssl/update-version-s=
cript-for-1.0.2.patch b/meta/recipes-connectivity/openssl/openssl/update-ve=
rsion-script-for-1.0.2.patch
> > new file mode 100644
> > index 0000000..fcfccfa
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/openssl/openssl/update-version-script-f=
or-1.0.2.patch
> > @@ -0,0 +1,66 @@
> > +Index: openssl-1.0.2/openssl.ld
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- openssl-1.0.2.orig/openssl.ld
> > ++++ openssl-1.0.2/openssl.ld
> > +@@ -4618,3 +4618,61 @@ OPENSSL_1.0.1d {
> > + 		CRYPTO_memcmp;
> > + } OPENSSL_1.0.1;
> > +
> > ++OPENSSL_1.0.2 {
> > ++	global:
> > ++		ASN1_TIME_diff;
> > ++		CMS_RecipientInfo_get0_pkey_ctx;
> > ++		CMS_RecipientInfo_kari_get0_ctx;
> > ++		CMS_SignerInfo_get0_pkey_ctx;
> > ++		DH_get_1024_160;
> > ++		DH_get_2048_224;
> > ++		DH_get_2048_256;
> > ++		DTLS_client_method;
> > ++		DTLS_server_method;
> > ++		DTLSv1_2_client_method;
> > ++		DTLSv1_2_server_method;
> > ++		EC_curve_nid2nist;
> > ++		EC_curve_nist2nid;
> > ++		EVP_aes_128_cbc_hmac_sha256;
> > ++		EVP_aes_128_wrap;
> > ++		EVP_aes_192_wrap;
> > ++		EVP_aes_256_cbc_hmac_sha256;
> > ++		EVP_aes_256_wrap;
> > ++		EVP_des_ede3_wrap;
> > ++		OCSP_REQ_CTX_http;
> > ++		OCSP_REQ_CTX_new;
> > ++		PEM_write_bio_DHxparams;
> > ++		SSL_CIPHER_find;
> > ++		SSL_CONF_CTX_finish;
> > ++		SSL_CONF_CTX_free;
> > ++		SSL_CONF_CTX_new;
> > ++		SSL_CONF_CTX_set_flags;
> > ++		SSL_CONF_CTX_set_ssl_ctx;
> > ++		SSL_CONF_cmd;
> > ++		SSL_CONF_cmd_argv;
> > ++		SSL_CTX_add_client_custom_ext;
> > ++		SSL_CTX_add_server_custom_ext;
> > ++		SSL_CTX_set_alpn_protos;
> > ++		SSL_CTX_set_alpn_select_cb;
> > ++		SSL_CTX_set_cert_cb;
> > ++		SSL_CTX_use_serverinfo_file;
> > ++		SSL_certs_clear;
> > ++		SSL_check_chain;
> > ++		SSL_get0_alpn_selected;
> > ++		SSL_get_shared_sigalgs;
> > ++		SSL_get_sigalgs;
> > ++		SSL_is_server;
> > ++		X509_CRL_diff;
> > ++		X509_CRL_http_nbio;
> > ++		X509_STORE_set_lookup_crls_cb;
> > ++		X509_VERIFY_PARAM_set1_email;
> > ++		X509_VERIFY_PARAM_set1_host;
> > ++		X509_VERIFY_PARAM_set1_ip_asc;
> > ++		X509_chain_check_suiteb;
> > ++		X509_chain_up_ref;
> > ++		X509_check_email;
> > ++		X509_check_host;
> > ++		X509_check_ip_asc;
> > ++		X509_get_signature_nid;
> > ++		X509_http_nbio;
> > ++} OPENSSL_1.0.1d;
> > diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1k.bb b/meta=
/recipes-connectivity/openssl/openssl_1.0.2.bb
> > similarity index 84%
> > rename from meta/recipes-connectivity/openssl/openssl_1.0.1k.bb
> > rename to meta/recipes-connectivity/openssl/openssl_1.0.2.bb
> > index 16ffc58..79537f9 100644
> > --- a/meta/recipes-connectivity/openssl/openssl_1.0.1k.bb
> > +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2.bb
> > @@ -16,21 +16,22 @@ SRC_URI +=3D "file://configure-targets.patch \
> >               file://oe-ldflags.patch \
> >               file://engines-install-in-libdir-ssl.patch \
> >               file://openssl-fix-link.patch \
> > -            file://debian/version-script.patch \
> > -            file://debian/pic.patch \
> > -            file://debian/c_rehash-compat.patch \
> > +            file://debian1.0.2/block_diginotar.patch \
> > +            file://debian1.0.2/block_digicert_malaysia.patch \
> > +            file://debian1.0.2/padlock_conf.patch \
> >               file://debian/ca.patch \
> > -            file://debian/make-targets.patch \
> > -            file://debian/no-rpath.patch \
> > +            file://debian/c_rehash-compat.patch \
> > +            file://debian/debian-targets.patch \
> >               file://debian/man-dir.patch \
> >               file://debian/man-section.patch \
> > +            file://debian/no-rpath.patch \
> >               file://debian/no-symbolic.patch \
> > -            file://debian/debian-targets.patch \
> > +            file://debian/pic.patch \
> > +            file://debian/version-script.patch \
> >               file://openssl_fix_for_x32.patch \
> >               file://fix-cipher-des-ede3-cfb1.patch \
> >               file://openssl-avoid-NULL-pointer-dereference-in-EVP_Dige=
stInit_ex.patch \
> >               file://openssl-avoid-NULL-pointer-dereference-in-dh_pub_e=
ncode.patch \
> > -            file://initial-aarch64-bits.patch \
> >               file://find.pl \
> >               file://openssl-fix-des.pod-error.patch \
> >               file://Makefiles-ptest.patch \
> > @@ -38,8 +39,8 @@ SRC_URI +=3D "file://configure-targets.patch \
> >               file://run-ptest \
> >              "
> >
> > -SRC_URI[md5sum] =3D "d4f002bd22a56881340105028842ae1f"
> > -SRC_URI[sha256sum] =3D "8f9faeaebad088e772f4ef5e38252d472be4d878c6b3a2=
718c10a4fcebe7a41c"
> > +SRC_URI[md5sum] =3D "38373013fc85c790aabf8837969c5eba"
> > +SRC_URI[sha256sum] =3D "8c48baf3babe0d505d16cfc0cf272589c66d3624264098=
213db0fb00034728e9"
> >
> >   PACKAGES =3D+ " \
> >   	${PN}-engines \
> >
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUC6icACgkQN1Ujt2V2gBzZOQCdHxQh1K/E8A0Pi4XSGmV5diP9
YeUAn07Q3/CoYWEFf4J2yd2AUmJqCszU
=N8In
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
