Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 78768731A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 09:16:51 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id p63so10827175wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 01:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version;
	bh=3R+kd1TgAAFJM+Bu7c6AlOtZ3TRMD4yHyknoIfHLm+U=;
	b=tv0H1PQWoEheaaA0qvfuHllnIrNiGEpdRgTB/piV9W4G9kjpdhfyzxSOismOrjXpFg
	Uv7gLxVqsMqCOq4rTdU9PnoSehqc0/oEgVIRTiLtYxU8E4LXMU+OzKQs4qz6GLdjqEBD
	tBq1fgImgvRQAEqZKdysDt++iERJwymNeoJyhuNdhucMpGLA6RGiV+PtrXmAWjb3mDdc
	uQkTi0m9gPTdF/n8w+oOPLkbMDmI/Nqoffqfnwlmw27VmdvNvSPbUxsOepYg4Ov5vEjt
	LYI6h4mTKiXXORlgxKthliPJ6hw5iKRGT33dJW7KaXeGX7SZNblAjIscW4wye/Gs9a5o
	du7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-type:subject:date:message-id:to
	:mime-version;
	bh=3R+kd1TgAAFJM+Bu7c6AlOtZ3TRMD4yHyknoIfHLm+U=;
	b=GKV2ZxSZCGO9H0L0niFhG3GWGwZhlYKHR7SzxZEt1fWyFgW/YjNgg2v0rFU2GBDY0M
	u7hzTvFa931pHHj7nnhVc7TrS2YmAdX4Tca7eY3WuFhgr/RMlKp6hjSTmFD2iXAoW2O9
	WAFtkdT9A76o/yZPwqbqzdr4D1h3Gk4r7S7GMpOPOAyU0NnL2VjKfwD48iMvDJHQU4sa
	IvGfCJDAKY+FCwFgjhbh910rg+n16gQUPT7mUgXIm6/pnZPzo80ztEifXxU42FLgs4IV
	tt/Ng5PICPD0veQ0ek0MPLfZPPt9kVSlbyZ3ZdoZiULgefwgXw+hje/PWV8vut6iiIpX
	dR/g==
X-Gm-Message-State: AG10YOTS5OJ+xtx4cqfYAec1EyXz5faF0ccANu5G1h0x5wb5IeSPhDp7PXnKP/QaGN+ulA==
X-Received: by 10.194.3.72 with SMTP id a8mr558272wja.103.1455268612163;
	Fri, 12 Feb 2016 01:16:52 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	gb9sm11111991wjb.26.2016.02.12.01.16.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Feb 2016 01:16:51 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Fri, 12 Feb 2016 10:16:49 +0100
Message-Id: <4791DC93-C4E6-4CB1-B5B1-DDD8AFFFDC39@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [jethro][PATCH v2] glibc: add patch from release/2.22/master fix memory corruption
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
X-List-Received-Date: Fri, 12 Feb 2016 09:16:52 -0000
X-Groupsio-MsgNum: 78041
Content-Type: multipart/signed;
	boundary="Apple-Mail=_AE90CA62-4B28-4580-9BF2-A06F28D5BB56";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_AE90CA62-4B28-4580-9BF2-A06F28D5BB56
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Since default fstab contains empty lines, this might be a reasonable =
patch
long running services using getmntent.

This patch is backported from:
=
https://sourceware.org/git/gitweb.cgi?p=3Dglibc.git;a=3Dcommit;h=3D3007f79=
7a1a596e954f44879a5a7267966186ba4

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 ...ntent-fix-memory-corruption-w-blank-lines.patch | 199 =
+++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.22.bb              |   1 +
 2 files changed, 200 insertions(+)
 create mode 100644 =
meta/recipes-core/glibc/glibc/getmntent-fix-memory-corruption-w-blank-line=
s.patch

diff --git =
a/meta/recipes-core/glibc/glibc/getmntent-fix-memory-corruption-w-blank-li=
nes.patch =
b/meta/recipes-core/glibc/glibc/getmntent-fix-memory-corruption-w-blank-li=
nes.patch
new file mode 100644
index 0000000..7f9b4bc
--- /dev/null
+++ =
b/meta/recipes-core/glibc/glibc/getmntent-fix-memory-corruption-w-blank-li=
nes.patch
@@ -0,0 +1,199 @@
+commit 3007f797a1a596e954f44879a5a7267966186ba4
+Author: Mike Frysinger <vapier@gentoo.org>
+Date:   Fri Aug 28 17:08:49 2015 -0400
+
+    getmntent: fix memory corruption w/blank lines [BZ #18887]
+
+    The fix for BZ #17273 introduced a single byte of memory corruption =
when
+    the line is entirely blank.  It would walk back past the start of =
the
+    buffer if the heap happened to be 0x20 or 0x09 and then write a NUL =
byte.
+    	buffer =3D '\n';
+    	end_ptr =3D buffer;
+    	while (end_ptr[-1] =3D=3D ' ' || end_ptr[-1] =3D=3D '\t')
+    		end_ptr--;
+    	*end_ptr =3D '\0';
+
+    Fix that and rework the tests.  Adding the testcase for BZ #17273 =
to the
+    existing \040 parser does not really make sense as it's unrelated, =
and
+    leads to confusing behavior: it implicitly relies on the new entry =
being
+    longer than the previous entry (since it just rewinds the FILE*).  =
Split
+    it out into its own dedicated testcase instead.
+
+    (cherry picked from commit =
b0e805fa0d6fea33745952df7b7f5442ca4c374f)
+
+    Upstream-Status: Backport
+    - Backported from =
https://sourceware.org/git/gitweb.cgi?p=3Dglibc.git;a=3Dcommit;h=3D3007f79=
7a1a596e954f44879a5a7267966186ba4
+      because of incompatibility with other patches for glibc.
+
+    Signed-off-by: Jens Rehsack <sno@netbsd.org>
+
+diff --git a/misc/Makefile b/misc/Makefile
+index aecb0da..2f5edf6 100644
+--- a/misc/Makefile
++++ b/misc/Makefile
+@@ -76,7 +76,8 @@ install-lib :=3D libg.a
+ gpl2lgpl :=3D error.c error.h
+
+ tests :=3D tst-dirname tst-tsearch tst-fdset tst-mntent tst-hsearch \
+-	 tst-pselect tst-insremque tst-mntent2 bug-hsearch1
++	 tst-pselect tst-insremque tst-mntent2 bug-hsearch1 \
++	 tst-mntent-blank-corrupt tst-mntent-blank-passno
+ tests-$(OPTION_POSIX_WIDE_CHAR_DEVICE_IO) +=3D tst-error1
+ tests-$(OPTION_EGLIBC_FCVT) +=3D tst-efgcvt
+ ifeq ($(run-built-tests),yes)
+diff --git a/misc/mntent_r.c b/misc/mntent_r.c
+index 6159873..4f26998 100644
+--- a/misc/mntent_r.c
++++ b/misc/mntent_r.c
+@@ -136,7 +136,9 @@ __getmntent_r (FILE *stream, struct mntent *mp, =
char *buffer, int bufsiz)
+       end_ptr =3D strchr (buffer, '\n');
+       if (end_ptr !=3D NULL)	/* chop newline */
+ 	{
+-	  while (end_ptr[-1] =3D=3D ' ' || end_ptr[-1] =3D=3D '\t')
++	  /* Do not walk past the start of buffer if it's all =
whitespace.  */
++	  while (end_ptr !=3D buffer
++		 && (end_ptr[-1] =3D=3D ' ' || end_ptr[-1] =3D=3D '\t'))
+             end_ptr--;
+ 	  *end_ptr =3D '\0';
+ 	}
+diff --git a/misc/tst-mntent-blank-corrupt.c =
b/misc/tst-mntent-blank-corrupt.c
+new file mode 100644
+index 0000000..92266a3
+--- /dev/null
++++ b/misc/tst-mntent-blank-corrupt.c
+@@ -0,0 +1,45 @@
++/* Make sure blank lines does not cause memory corruption BZ #18887.
++
++   Copyright (C) 2009-2015 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be =
useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#include <mntent.h>
++#include <stdio.h>
++#include <string.h>
++
++/* Make sure blank lines don't trigger memory corruption.  This =
doesn't happen
++   for all targets though, so it's a best effort test BZ #18887.  */
++static int
++do_test (void)
++{
++  FILE *fp;
++
++  fp =3D tmpfile ();
++  fputs ("\n \n/foo\\040dir /bar\\040dir auto bind \t \n", fp);
++  rewind (fp);
++
++  /* The corruption happens here ...  */
++  getmntent (fp);
++  /* ... but trigers here.  */
++  endmntent (fp);
++
++  /* If the test failed, we would crash, and not hit this point.  */
++  return 0;
++}
++
++#define TEST_FUNCTION do_test ()
++#include "../test-skeleton.c"
+diff --git a/misc/tst-mntent-blank-passno.c =
b/misc/tst-mntent-blank-passno.c
+new file mode 100644
+index 0000000..fc04291
+--- /dev/null
++++ b/misc/tst-mntent-blank-passno.c
+@@ -0,0 +1,53 @@
++/* Make sure trailing whitespace is handled properly BZ #17273.
++
++   Copyright (C) 2009-2015 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be =
useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#include <mntent.h>
++#include <stdio.h>
++#include <string.h>
++
++/* Check entries to make sure trailing whitespace is ignored and we =
return the
++   correct passno value BZ #17273.  */
++static int
++do_test (void)
++{
++  int result =3D 0;
++  FILE *fp;
++  struct mntent *mnt;
++
++  fp =3D tmpfile ();
++  fputs ("/foo\\040dir /bar\\040dir auto bind \t \n", fp);
++  rewind (fp);
++
++  mnt =3D getmntent (fp);
++  if (strcmp (mnt->mnt_fsname, "/foo dir") !=3D 0
++      || strcmp (mnt->mnt_dir, "/bar dir") !=3D 0
++      || strcmp (mnt->mnt_type, "auto") !=3D 0
++      || strcmp (mnt->mnt_opts, "bind") !=3D 0
++      || mnt->mnt_freq !=3D 0
++      || mnt->mnt_passno !=3D 0)
++    {
++      puts ("Error while reading entry with trailing whitespaces");
++      result =3D 1;
++    }
++
++  return result;
++}
++
++#define TEST_FUNCTION do_test ()
++#include "../test-skeleton.c"
+diff --git a/misc/tst-mntent.c b/misc/tst-mntent.c
+index 876c89f..820b354 100644
+--- a/misc/tst-mntent.c
++++ b/misc/tst-mntent.c
+@@ -73,26 +73,6 @@ main (int argc, char *argv[])
+ 	  puts ("Error while reading written entry back in");
+ 	  result =3D 1;
+ 	}
+-
+-      /* Part III: Entry with whitespaces at the end of a line. */
+-      rewind (fp);
+-
+-      fputs ("/foo\\040dir /bar\\040dir auto bind \t \n", fp);
+-
+-      rewind (fp);
+-
+-      mnt =3D getmntent (fp);
+-
+-      if (strcmp (mnt->mnt_fsname, "/foo dir") !=3D 0
+-	  || strcmp (mnt->mnt_dir, "/bar dir") !=3D 0
+-	  || strcmp (mnt->mnt_type, "auto") !=3D 0
+-	  || strcmp (mnt->mnt_opts, "bind") !=3D 0
+-	  || mnt->mnt_freq !=3D 0
+-	  || mnt->mnt_passno !=3D 0)
+-	{
+-	  puts ("Error while reading entry with trailing whitespaces");
+-	  result =3D 1;
+-	}
+    }
+
+   return result;
diff --git a/meta/recipes-core/glibc/glibc_2.22.bb =
b/meta/recipes-core/glibc/glibc_2.22.bb
index e512672..7183f46 100644
--- a/meta/recipes-core/glibc/glibc_2.22.bb
+++ b/meta/recipes-core/glibc/glibc_2.22.bb
@@ -46,6 +46,7 @@ SRC_URI =3D =
"${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
            file://CVE-2015-9761_1.patch \
            file://CVE-2015-9761_2.patch \
            file://CVE-2015-8776.patch \
+	   file://getmntent-fix-memory-corruption-w-blank-lines.patch \
 "

 SRC_URI +=3D "\
--
2.6.3


--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_AE90CA62-4B28-4580-9BF2-A06F28D5BB56
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWvaMCAAoJEESZlq7c5QqdYqkP/1zpk3nI21FePcHt3JEwoI+X
b2hMVgnz7MlTr4tRBDoJUlRhL6g0kM+egrrchQ1kUAIlgtBCbxZjsuNwSbN++VGN
HyzQxMJXURQ9uxE/qJA14BvllfTwmimS+fMtvgflUJo4YsZ2jjYVmTraQ4k+zROb
zRi7OPaS+CYXXJGfGUofDySxuTKggqxDeTobulICNJNda0t31RwcJmbDtS1k8xQZ
vObU95HiZmdOOzx6EBJJ5njN0OYFEJCQkUUo9ZwzrfB1iplVBTRU/wvhN33BlBrx
gqVB3XOd6jNuX5Fl73T/mUlrE4Fx/otvUip4S8t41M44d64Yo6ah8ZJ792jbrv5a
iN7ebO2ELmvoGTfmKcFxCFbasXr7a4MrB4Ulh+T2IUC0T5ccq3ELa5qqz5evGwDA
wyNqbHqooGJYfdgtOJOMmHAnuPi+R2ym04MTb87TR9bQZ3YDUH47QLInM0pf16v7
h3KqdEVXTQOI+KLNq7YbZnpmbMqJUhZLmtJ8xc99nxKNVPaBARMuHKnXx/cGd5il
RXu6C3xoQBdH52CP35TEu9+Y5sb3suEq4I7po5jKQZkG/2JauUcM4Y5o4ygszW0i
HB3kslmXXMyK47bCLjZkLE+MO6S98MDs1wqb+TFoFVvuyciAcSa2E5pI1IQ/29ZW
Sq75JyisKVZ4JPGvWnp4
=oT5a
-----END PGP SIGNATURE-----

--Apple-Mail=_AE90CA62-4B28-4580-9BF2-A06F28D5BB56--
