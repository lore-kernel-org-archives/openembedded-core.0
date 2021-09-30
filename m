Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD1CC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 12:26:02 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web09.11599.1633004761878984395
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 05:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 1D13FC000D;
	Thu, 30 Sep 2021 12:25:58 +0000 (UTC)
Message-ID: <6f6642ab0c455ec1ef934987bd417d016dd77596.camel@bootlin.com>
Subject: Re: [OE-core][PATCH v3] libevent: mark util/monotonic_prc_fallback
 as retriable
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, "Yu, Mingli" <mingli.yu@windriver.com>
Date: Thu, 30 Sep 2021 14:25:58 +0200
In-Reply-To: 
 <CANNYZj_PKN51p1-ovmt17WwJZd2oUtxeWWNBzYPZbGY1XmiyFg@mail.gmail.com>
References: <20210929150204.3573031-1-thomas.perrot@bootlin.com>
	 <CANNYZj_PKN51p1-ovmt17WwJZd2oUtxeWWNBzYPZbGY1XmiyFg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ode2y6Agp/sy+//7GRvJ"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Sep 2021 12:26:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156492


--=-ode2y6Agp/sy+//7GRvJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, 2021-09-30 at 10:50 +0200, Alexander Kanavin wrote:
> Please submit the patch upstream first. Also note the syntax:
>=20
> Upstream-Status: Pending
> Upstream-Status: Backport [from where]
>=20

I'm currently submitting a reworked patch for the libevent master
branch, because since 2.1.12 there were some changes that required
reworking the patch 0004.

I will correct the syntax of upstream status, thank you.

Best regards,
Thomas

> Alex
>=20
> On Wed, 29 Sept 2021 at 17:02, Thomas Perrot <
> thomas.perrot@bootlin.com> wrote:
> > Backport a patch to fix the below ptest failure:
> > =C2=A0# ./run-ptest
> > =C2=A0Running tests:
> > =C2=A0EVPORT
> > =C2=A0Skipping test
> > =C2=A0KQUEUE
> > =C2=A0Skipping test
> > =C2=A0EPOLL
> > =C2=A0test-eof: OKAY
> > =C2=A0test-dumpevents: OKAY (output not checked)
> > =C2=A0regress:
> > =C2=A0 FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478:
> > assert(diff.tv_sec =3D=3D 0): 1 vs 0 util/monotonic_prc_fallback:
> > =C2=A0 [monotonic_prc_fallback FAILED]
> > =C2=A01/312 TESTS FAILED. (33 skipped)
> > =C2=A0FAILED
> > =C2=A0regress_debug:
> > =C2=A0 FAIL ../libevent-2.1.12-stable/test/regress_util.c:1478:
> > assert(diff.tv_sec =3D=3D 0): 1 vs 0 util/monotonic_prc_fallback:
> > =C2=A0 [monotonic_prc_fallback FAILED]
> > =C2=A01/312 TESTS FAILED. (33 skipped)
> > =C2=A0FAILED
> > =C2=A0[snip]
> >=20
> > (From OE-Core rev: edecbbdacab5227c75e4a199e124389f8036b421)
> >=20
> > [YOCTO #14507]
> >=20
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > ---
> > =C2=A0...-monotonic_prc_fallback-as-retriable.patch | 28 +++++++
> > =C2=A0...ts-are-marked-failed-only-when-all-a.patch | 81
> > +++++++++++++++++++
> > =C2=A0.../libevent/libevent/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 10 +--
> > =C2=A0.../libevent/libevent_2.1.12.bb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-
> > =C2=A04 files changed, 117 insertions(+), 6 deletions(-)
> > =C2=A0create mode 100644 meta/recipes-support/libevent/libevent/0003-
> > test-
> > mark-util-monotonic_prc_fallback-as-retriable.patch
> > =C2=A0create mode 100644 meta/recipes-support/libevent/libevent/0004-
> > test-
> > retriable-tests-are-marked-failed-only-when-all-a.patch
> >=20
> > diff --git a/meta/recipes-support/libevent/libevent/0003-test-mark-
> > util-monotonic_prc_fallback-as-retriable.patch b/meta/recipes-
> > support/libevent/libevent/0003-test-mark-util-
> > monotonic_prc_fallback-
> > as-retriable.patch
> > new file mode 100644
> > index 000000000000..8a2c78983e1d
> > --- /dev/null
> > +++ b/meta/recipes-support/libevent/libevent/0003-test-mark-util-
> > monotonic_prc_fallback-as-retriable.patch
> > @@ -0,0 +1,28 @@
> > +From d01a57a998798da977c470f3b8d6a457c1adb144 Mon Sep 17 00:00:00
> > 2001
> > +From: Azat Khuzhin <azat@libevent.org>
> > +Date: Sun, 19 Sep 2021 00:57:31 +0300
> > +Subject: [PATCH] test: mark util/monotonic_prc_fallback as
> > retriable
> > +
> > +Refs: #1193
> > +
> > +Upstream-status: Backported
> > +---
> > + test/regress_util.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/test/regress_util.c b/test/regress_util.c
> > +index 45caa2700a40..a9e80db20149 100644
> > +--- a/test/regress_util.c
> > ++++ b/test/regress_util.c
> > +@@ -1672,7 +1672,7 @@ struct testcase_t util_testcases[] =3D {
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ "monotonic_res_fallback", test_evutil_mon=
otonic_res,
> > TT_OFF_BY_DEFAULT, &basic_setup, (void*)"fallback" },
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ "monotonic_prc", test_evutil_monotonic_pr=
c, 0,
> > &basic_setup, (void*)"" },
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ "monotonic_prc_precise", test_evutil_mono=
tonic_prc,
> > TT_RETRIABLE, &basic_setup, (void*)"precise" },
> > +-=C2=A0 =C2=A0 =C2=A0 { "monotonic_prc_fallback", test_evutil_monotoni=
c_prc, 0,
> > &basic_setup, (void*)"fallback" },
> > ++=C2=A0 =C2=A0 =C2=A0 { "monotonic_prc_fallback", test_evutil_monotoni=
c_prc,
> > TT_RETRIABLE, &basic_setup, (void*)"fallback" },
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ "date_rfc1123", test_evutil_date_rfc1123,=
 0, NULL, NULL
> > },
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ "evutil_v4addr_is_local", test_evutil_v4a=
ddr_is_local, 0,
> > NULL, NULL },
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0{ "evutil_v6addr_is_local", test_evutil_v6a=
ddr_is_local, 0,
> > NULL, NULL },
> > +--=20
> > +2.31.1
> > +
> > diff --git a/meta/recipes-support/libevent/libevent/0004-test-
> > retriable-tests-are-marked-failed-only-when-all-a.patch
> > b/meta/recipes-support/libevent/libevent/0004-test-retriable-tests-
> > are-marked-failed-only-when-all-a.patch
> > new file mode 100644
> > index 000000000000..ae7db0b7aa85
> > --- /dev/null
> > +++ b/meta/recipes-support/libevent/libevent/0004-test-retriable-
> > tests-are-marked-failed-only-when-all-a.patch
> > @@ -0,0 +1,81 @@
> > +From 36ebd92fa53c0097f1e2f9ec5aa5b5c6ec1b411d Mon Sep 17 00:00:00
> > 2001
> > +From: Thomas Perrot <thomas.perrot@bootlin.com>
> > +Date: Wed, 29 Sep 2021 13:50:35 +0200
> > +Subject: [PATCH] test: retriable tests are marked failed only when
> > all
> > + attempts have failed
> > +
> > +Fixes: #1193
> > +
> > +Upstream-status: Pending
> > +
> > +Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > +---
> > + test/tinytest.c | 13 ++++++-------
> > + test/tinytest.h |=C2=A0 2 +-
> > + 2 files changed, 7 insertions(+), 8 deletions(-)
> > +
> > +diff --git a/test/tinytest.c b/test/tinytest.c
> > +index 85dfe74a720e..bf2882418eb6 100644
> > +--- a/test/tinytest.c
> > ++++ b/test/tinytest.c
> > +@@ -310,7 +310,8 @@ testcase_run_forked_(const struct testgroup_t
> > *group,
> > +=20
> > + int
> > + testcase_run_one(const struct testgroup_t *group,
> > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct t=
estcase_t *testcase)
> > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct t=
estcase_t *testcase,
> > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const int test=
_attempts)
> > + {
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0enum outcome outcome;
> > +=20
> > +@@ -348,7 +349,7 @@ testcase_run_one(const struct testgroup_t
> > *group,
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (opt_verbosi=
ty>0 && !opt_forked)
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0puts("SKIPPED");
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {
> > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!opt_forked)
> > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!opt_forked && (=
testcase->flags & TT_RETRIABLE)
> > && !test_attempts)
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0printf("\n=C2=A0 [%s FAILED]\n", testcase-
> > >name);
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0}
> > +=20
> > +@@ -525,22 +526,20 @@ tinytest_main(int c, const char **v, struct
> > testgroup_t *groups)
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct testgrou=
p_t *group =3D &groups[i];
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (j =3D 0; g=
roup->cases[j].name; ++j) {
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0struct testcase_t *testcase =3D &group-
> > > cases[j];
> > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 int test_attempts =3D 3;
> > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 int test_attempts =3D (testcase->flags &
> > TT_RETRIABLE) ? 3: 1;
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0int test_ret_err;
> > +=20
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if (!(testcase->flags & TT_ENABLED_))
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;
> > +=20
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0for (;;) {
> > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_ret_err =3D
> > testcase_run_one(group, testcase);
> > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_ret_err =3D
> > testcase_run_one(group, testcase, test_attempts);
> > +=20
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (test_ret_err =3D=3D OK)
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
> > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(testcase->flags &
> > TT_RETRIABLE))
> > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!--test_attempts)
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf("\n=C2=A0 [RETRYING %s (%i)=
]\n",
> > testcase->name, test_attempts);
> > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!test_attempts--)
> > +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}
> > +=20
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0switch (test_ret_err) {
> > +diff --git a/test/tinytest.h b/test/tinytest.h
> > +index d321dd467542..c276b5339331 100644
> > +--- a/test/tinytest.h
> > ++++ b/test/tinytest.h
> > +@@ -92,7 +92,7 @@ char *tinytest_format_hex_(const void *,
> > unsigned
> > long);
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0tinytest_set_flag_(groups, named, 1, TT_SKI=
P)
> > +=20
> > + /** Run a single testcase in a single group. */
> > +-int testcase_run_one(const struct testgroup_t *,const struct
> > testcase_t *);
> > ++int testcase_run_one(const struct testgroup_t *,const struct
> > testcase_t *, const int test_attempts);
> > +=20
> > + void tinytest_set_aliases(const struct testlist_alias_t
> > *aliases);
> > +=20
> > +--=20
> > +2.31.1
> > +
> > diff --git a/meta/recipes-support/libevent/libevent/run-ptest
> > b/meta/recipes-support/libevent/libevent/run-ptest
> > index d3b5e793c3c5..ef4260d1c413 100644
> > --- a/meta/recipes-support/libevent/libevent/run-ptest
> > +++ b/meta/recipes-support/libevent/libevent/run-ptest
> > @@ -1,14 +1,14 @@
> > =C2=A0#!/bin/sh
> >=20
> > =C2=A0# run-ptest - 'ptest' test infrastructure shell script that
> > -#=C2=A0 =C2=A0wraps the libevent test scripts=20
> > +#=C2=A0 =C2=A0wraps the libevent test scripts
> > =C2=A0#
> > =C2=A0# Trevor Gamblin <trevor.gamblin@windriver.com>
> > =C2=A0###############################################################
> > =C2=A0LIBEVENTLIB=3D@libdir@/libevent
> > =C2=A0LOG=3D"${LIBEVENTLIB}/ptest/libevent_ptest_$(date +%Y%m%d-
> > %H%M%S).log"
> >=20
> > -cd ${LIBEVENTLIB}/ptest=20
> > +cd ${LIBEVENTLIB}/ptest
> >=20
> > =C2=A0# Run only the libevent "regress" test. All other test scripts in
> > the
> > =C2=A0# libevent "test" folder are related to performance, e.g.
> > read/write
> > @@ -16,9 +16,9 @@ cd ${LIBEVENTLIB}/ptest
> > =C2=A0# in the ptest log.
> > =C2=A0./test/regress 2>&1| sed -e '/TESTS/d' -e '/tests/d' -e '/OK/
> > s/^/PASS: / ; /FAILED/ s/^/FAIL: / ; /SKIPPED/ s/^/SKIP: / ;
> > /DISABLED/ s/^/SKIP: /' | cut -f1,2 -d ':' | tee -a ${LOG}
> >=20
> > -passed=3D`grep PASS ${LOG}|wc -l`
> > -failed=3D`grep FAIL ${LOG}|wc -l`
> > -skipped=3D`grep -E SKIP ${LOG}|wc -l`
> > +passed=3D`grep PASS: ${LOG}|wc -l`
> > +failed=3D`grep FAIL: ${LOG}|wc -l`
> > +skipped=3D`grep -E SKIP: ${LOG}|wc -l`
> > =C2=A0all=3D$((passed + failed + skipped))
> >=20
> > =C2=A0(=C2=A0 =C2=A0echo "=3D=3D=3D Test Summary =3D=3D=3D"
> > diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb
> > b/meta/recipes-support/libevent/libevent_2.1.12.bb
> > index 4b419eab226d..e26e8a9b5725 100644
> > --- a/meta/recipes-support/libevent/libevent_2.1.12.bb
> > +++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
> > @@ -16,6 +16,8 @@ SRC_URI =3D
> > "
> > https://github.com/libevent/libevent/releases/download/release-${PV}
> > -
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-test-regress_dns.=
c-patch-out-tests-that-
> > require-a-wo.patch \
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-test-regress.h-In=
crease-default-timeval-
> > tolerance-50.patch \
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-test-mark-util-mo=
notonic_prc_fallback-as-
> > retriable.patch \
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
> > =C2=A0file://0004-test-retriable-tests-are-marked-failed-only-
> > when-all-a.patch \
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> >=20
> > =C2=A0SRC_URI[sha256sum] =3D
> > "92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb"
> > @@ -56,7 +58,7 @@ do_install_ptest() {
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 do
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755=
 $file ${D}${PTEST_PATH}/test
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 done
> > -=C2=A0 =C2=A0 =C2=A0 =C2=A0=20
> > +
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# handle multilib
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i s:@libdir@:${libdir}:g ${D}${P=
TEST_PATH}/run-ptest
> > =C2=A0}
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#156488):=20
> > https://lists.openembedded.org/g/openembedded-core/message/156488
> > Mute This Topic: https://lists.openembedded.org/mt/85950365/5443093
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:=20
> > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > thomas.perrot@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20

--=20
Thomas Perrot, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com


--=-ode2y6Agp/sy+//7GRvJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEEh0B3xqajCiMDqBIhn8ALBXH+Cu0FAmFVrNYACgkQn8ALBXH+
Cu2EQQv+IL8389gUsV0HZAYQeTYUvMVQmKwQ/4Cq8p79QnzqHsUqSQK/9+VgxKOE
HR7c9m6fJrVuMLrfiMz/Zzh5Zozs3M8oBmDMY8HoBtXmf1MBkTXKfPzd3zvlaqbR
MqN4qPFm0dx/FIbxXHcrIdh6if5TvhCLs2wh9099TInCn9QrYIAOGVz87siVysHu
scm4SMBqwguKPPP9Q9mbTsRi0wQwqvmg569ju+Mv5aFAXsqm0ILuzzaBweHDxQgH
bOlhuPdirVNkB1ZJtaYetgJFTBraneRLzyaZ0wMNPmzYg985bp9lhE4Q4wo9Gayq
Q2XVSlbX37uAIHtTIlAz4Fs8j8p7HtXVmaA70M1QR9A7MXwkbx0/TfCxYmd1CtJs
1EJbA0pc9WVW2E8gnjdZ8L16XpkfK7qxdzEF6y2mJGAmlxLObP7fVkHpN263HNb3
PlTk2tFu9/bqEMIrXvVl/kbGXHM67fC58CfuhuwDj6vsLbPlLleoT8LDff4kOfyQ
0fMVaGaD
=rqAd
-----END PGP SIGNATURE-----

--=-ode2y6Agp/sy+//7GRvJ--


