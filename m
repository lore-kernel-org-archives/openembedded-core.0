Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA9BE7716A
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 11:17:51 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.34323.1734261461243503530
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 03:17:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout04.t-online.de (Postfix) with SMTP id 8A8C812B
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 12:17:39 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.40.43]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tMmd0-4LzpHl0; Sun, 15 Dec 2024 12:17:38 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] glib-2.0: update 2.82.2 -> 2.82.4
Date: Sun, 15 Dec 2024 12:17:35 +0100
Message-ID: <20241215111735.2731546-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1734261458-257F99E5-2E2447AB/10/3626336762 SUSPECT URL
X-TOI-MSGID: a0688d23-7e3a-4f40-b2c6-b44188e3e44f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 11:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208745

- remove backported patches

Overview of changes in GLib 2.82.4, 2024-12-11
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Fix a double-unref crash which affects many apps which use pygobject to
  export objects on D-Bus (#3559, work by Sebastian Dr=C3=B6ge, Philip Wi=
thnall)

* Bugs fixed:
  - #3559 2.82.3 regression: lollypop crashes on startup (Philip Withnall=
)
  - !4430 Backport !4427 =E2=80=9CRevert "gdbus: Fix leak of method invoc=
ation when
    registering an object with closures"=E2=80=9D to glib-2-82
  - !4434 Backport !4432 and !4433 =E2=80=9Cci: Add release component to =
automate
    tarball publishing=E2=80=9D to glib-2-82

Overview of changes in GLib 2.82.3, 2024-12-09
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Fix compatibility with tzdata 2024b (#3502, work by Rebecca N. Palmer a=
nd
  Simon McVittie)

* Bugs fixed:
  - #3502 Test regressions with tzdata 2024b (Rebecca N. Palmer)
  - !4357 Backport !4356 =E2=80=9Cgdatetime test: Do not assume PST8PDT w=
as always
    exactly -8/-7=E2=80=9D to glib-2-82
  - !4370 Backport !4350 =E2=80=9Cglib: Don't require GLIB_DOMAIN to be a=
 NUL-terminated
    string=E2=80=9D to glib-2-82
  - !4380 Backport !4378 =E2=80=9Cgio: Fix GFileEnumerator leaks in gio t=
ools=E2=80=9D to
    glib-2-82
  - !4381 Backport !4373 =E2=80=9Cmacos: Remove extraous space from type =
identifier=E2=80=9D to
    glib-2-82
  - !4388 Backport !4232 =E2=80=9Crefstring: Fix race between releasing a=
nd re-acquiring
    an interned GRefString=E2=80=9D to glib-2-82
  - !4397 Backport !4395 =E2=80=9Cappmonitor: Fix warning building test=E2=
=80=9D to glib-2-82
  - !4400 Backport !4398 =E2=80=9Cgrefstring: Mark a variable as potentia=
lly unused=E2=80=9D to
    glib-2-82
  - !4417 Backport !4415 =E2=80=9Cgdbus: Fix leak of method invocation wh=
en registering
    an object with closures=E2=80=9D to glib-2-82

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../files/gdatetime-test-fail-0001.patch      | 69 -------------------
 .../files/gdatetime-test-fail-0002.patch      | 62 -----------------
 .../files/gdatetime-test-fail-0003.patch      | 60 ----------------
 ...l_2.82.2.bb =3D> glib-2.0-initial_2.82.4.bb} |  0
 ...{glib-2.0_2.82.2.bb =3D> glib-2.0_2.82.4.bb} |  0
 meta/recipes-core/glib-2.0/glib.inc           |  5 +-
 6 files changed, 1 insertion(+), 195 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/files/gdatetime-test-fail-=
0001.patch
 delete mode 100644 meta/recipes-core/glib-2.0/files/gdatetime-test-fail-=
0002.patch
 delete mode 100644 meta/recipes-core/glib-2.0/files/gdatetime-test-fail-=
0003.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.82.2.bb =3D> glib-=
2.0-initial_2.82.4.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.82.2.bb =3D> glib-2.0_2.82=
.4.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0001.pa=
tch b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0001.patch
deleted file mode 100644
index 2ee9a40d3d..0000000000
--- a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0001.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From fc893fe975126ca7d5fcf76b66b5c0ccbd4128d5 Mon Sep 17 00:00:00 2001
-From: "Rebecca N. Palmer" <rebecca_palmer@zoho.com>
-Date: Fri, 11 Oct 2024 09:38:52 +0100
-Subject: [PATCH] gdatetime test: Do not assume PST8PDT was always exactl=
y
- -8/-7
-
-In newer tzdata, it is an alias for America/Los_Angeles, which has a
-slightly different meaning: DST did not exist there before 1883. As a
-result, we can no longer hard-code the knowledge that interval 0 is
-standard time and interval 1 is summer time, and instead we need to look
-up the correct intervals from known timestamps.
-
-Resolves: https://gitlab.gnome.org/GNOME/glib/-/issues/3502
-Bug-Debian: https://bugs.debian.org/1084190
-[smcv: expand commit message, fix whitespace]
-Signed-off-by: Simon McVittie <smcv@debian.org>
-
-Upstream-Status: Backport
-[https://github.com/GNOME/glib/commit/c0619f08e6c608fd6464d2f0c6970ef0bb=
fb9ecf]
-
-Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
----
- glib/tests/gdatetime.c | 22 ++++++++++++++++------
- 1 file changed, 16 insertions(+), 6 deletions(-)
-
-diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
-index d46f653..2eefc41 100644
---- a/glib/tests/gdatetime.c
-+++ b/glib/tests/gdatetime.c
-@@ -2930,6 +2930,7 @@ test_posix_parse (void)
- {
-   GTimeZone *tz;
-   GDateTime *gdt1, *gdt2;
-+  gint i1, i2;
-=20
-   /* Check that an unknown zone name falls back to UTC. */
-   G_GNUC_BEGIN_IGNORE_DEPRECATIONS
-@@ -2953,16 +2954,25 @@ test_posix_parse (void)
-=20
- /* This fails rules_from_identifier on Unix (though not on Windows)
-  * but passes anyway because PST8PDT is a zone name.
-+ *
-+ * Intervals i1 and i2 (rather than 0 and 1) are needed because in
-+ * recent tzdata, PST8PDT may be an alias for America/Los_Angeles,
-+ * and hence be aware that DST has not always existed.
-+ * https://bugs.debian.org/1084190
-  */
-   tz =3D g_time_zone_new_identifier ("PST8PDT");
-   g_assert_nonnull (tz);
-   g_assert_cmpstr (g_time_zone_get_identifier (tz), =3D=3D, "PST8PDT");
--  g_assert_cmpstr (g_time_zone_get_abbreviation (tz, 0), =3D=3D, "PST")=
;
--  g_assert_cmpint (g_time_zone_get_offset (tz, 0), =3D=3D, - 8 * 3600);
--  g_assert (!g_time_zone_is_dst (tz, 0));
--  g_assert_cmpstr (g_time_zone_get_abbreviation (tz, 1), =3D=3D, "PDT")=
;
--  g_assert_cmpint (g_time_zone_get_offset (tz, 1), =3D=3D,- 7 * 3600);
--  g_assert (g_time_zone_is_dst (tz, 1));
-+  /* a date in winter =3D non-DST */
-+  i1 =3D g_time_zone_find_interval (tz, G_TIME_TYPE_STANDARD, 0);
-+  /* approximately 6 months in seconds, i.e. a date in summer =3D DST *=
/
-+  i2 =3D g_time_zone_find_interval (tz, G_TIME_TYPE_DAYLIGHT, 15000000)=
;
-+  g_assert_cmpstr (g_time_zone_get_abbreviation (tz, i1), =3D=3D, "PST"=
);
-+  g_assert_cmpint (g_time_zone_get_offset (tz, i1), =3D=3D, - 8 * 3600)=
;
-+  g_assert (!g_time_zone_is_dst (tz, i1));
-+  g_assert_cmpstr (g_time_zone_get_abbreviation (tz, i2), =3D=3D, "PDT"=
);
-+  g_assert_cmpint (g_time_zone_get_offset (tz, i2), =3D=3D,- 7 * 3600);
-+  g_assert (g_time_zone_is_dst (tz, i2));
-   g_time_zone_unref (tz);
-=20
-   tz =3D g_time_zone_new_identifier ("PST8PDT6:32:15");
diff --git a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0002.pa=
tch b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0002.patch
deleted file mode 100644
index a03d05f0bf..0000000000
--- a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0002.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 1110f463fe084ba2675e044be2e045f7c0224a7f Mon Sep 17 00:00:00 2001
-From: Simon McVittie <smcv@debian.org>
-Date: Fri, 18 Oct 2024 11:03:19 +0100
-Subject: [PATCH] gdatetime test: Try to make PST8PDT test more obviously
- correct
-
-Instead of using timestamp 0 as a magic number (in this case interpreted
-as 1970-01-01T00:00:00-08:00), calculate a timestamp from a recent
-year/month/day in winter, in this case 2024-01-01T00:00:00-08:00.
-
-Similarly, instead of using a timestamp 15 million seconds later
-(1970-06-23T15:40:00-07:00), calculate a timestamp from a recent
-year/month/day in summer, in this case 2024-07-01T00:00:00-07:00.
-
-Signed-off-by: Simon McVittie <smcv@debian.org>
-
-Upstream-Status: Backport
-[https://github.com/GNOME/glib/commit/30e9cfa5733003cd1079e0e9e8a4bff1a1=
91171a]
-
-Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
----
- glib/tests/gdatetime.c | 15 +++++++--------
- 1 file changed, 7 insertions(+), 8 deletions(-)
-
-diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
-index 2eefc41..728b873 100644
---- a/glib/tests/gdatetime.c
-+++ b/glib/tests/gdatetime.c
-@@ -2954,19 +2954,16 @@ test_posix_parse (void)
-=20
- /* This fails rules_from_identifier on Unix (though not on Windows)
-  * but passes anyway because PST8PDT is a zone name.
-- *
-- * Intervals i1 and i2 (rather than 0 and 1) are needed because in
-- * recent tzdata, PST8PDT may be an alias for America/Los_Angeles,
-- * and hence be aware that DST has not always existed.
-- * https://bugs.debian.org/1084190
-  */
-   tz =3D g_time_zone_new_identifier ("PST8PDT");
-   g_assert_nonnull (tz);
-   g_assert_cmpstr (g_time_zone_get_identifier (tz), =3D=3D, "PST8PDT");
-   /* a date in winter =3D non-DST */
--  i1 =3D g_time_zone_find_interval (tz, G_TIME_TYPE_STANDARD, 0);
--  /* approximately 6 months in seconds, i.e. a date in summer =3D DST *=
/
--  i2 =3D g_time_zone_find_interval (tz, G_TIME_TYPE_DAYLIGHT, 15000000)=
;
-+  gdt1 =3D g_date_time_new (tz, 2024, 1, 1, 0, 0, 0);
-+  i1 =3D g_time_zone_find_interval (tz, G_TIME_TYPE_STANDARD, g_date_ti=
me_to_unix (gdt1));
-+  /* a date in summer =3D DST */
-+  gdt2 =3D g_date_time_new (tz, 2024, 7, 1, 0, 0, 0);
-+  i2 =3D g_time_zone_find_interval (tz, G_TIME_TYPE_DAYLIGHT, g_date_ti=
me_to_unix (gdt2));
-   g_assert_cmpstr (g_time_zone_get_abbreviation (tz, i1), =3D=3D, "PST"=
);
-   g_assert_cmpint (g_time_zone_get_offset (tz, i1), =3D=3D, - 8 * 3600)=
;
-   g_assert (!g_time_zone_is_dst (tz, i1));
-@@ -2974,6 +2971,8 @@ test_posix_parse (void)
-   g_assert_cmpint (g_time_zone_get_offset (tz, i2), =3D=3D,- 7 * 3600);
-   g_assert (g_time_zone_is_dst (tz, i2));
-   g_time_zone_unref (tz);
-+  g_date_time_unref (gdt1);
-+  g_date_time_unref (gdt2);
-=20
-   tz =3D g_time_zone_new_identifier ("PST8PDT6:32:15");
- #ifdef G_OS_WIN32
diff --git a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0003.pa=
tch b/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0003.patch
deleted file mode 100644
index 2ef5fbb993..0000000000
--- a/meta/recipes-core/glib-2.0/files/gdatetime-test-fail-0003.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 5652c74a14b31b730d26de74ca9dcae1df5c1883 Mon Sep 17 00:00:00 2001
-From: Simon McVittie <smcv@debian.org>
-Date: Fri, 18 Oct 2024 11:23:42 +0100
-Subject: [PATCH] gdatetime test: Fall back if legacy System V PST8PDT is=
 not
- available
-
-On recent versions of Debian, PST8PDT is part of the tzdata-legacy
-package, which is not always installed and might disappear in future.
-Successfully tested with and without tzdata-legacy on Debian unstable.
-
-Signed-off-by: Simon McVittie <smcv@debian.org>
-
-Upstream-Status: Backport
-[https://github.com/GNOME/glib/commit/fe2699369f79981dcf913af4cfd98b342b=
84a9c1]
-
-Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
----
- glib/tests/gdatetime.c | 19 +++++++++++++++++--
- 1 file changed, 17 insertions(+), 2 deletions(-)
-
-diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
-index 728b873..9e1acd0 100644
---- a/glib/tests/gdatetime.c
-+++ b/glib/tests/gdatetime.c
-@@ -2931,6 +2931,7 @@ test_posix_parse (void)
-   GTimeZone *tz;
-   GDateTime *gdt1, *gdt2;
-   gint i1, i2;
-+  const char *expect_id;
-=20
-   /* Check that an unknown zone name falls back to UTC. */
-   G_GNUC_BEGIN_IGNORE_DEPRECATIONS
-@@ -2953,11 +2954,25 @@ test_posix_parse (void)
-   g_time_zone_unref (tz);
-=20
- /* This fails rules_from_identifier on Unix (though not on Windows)
-- * but passes anyway because PST8PDT is a zone name.
-+ * but can pass anyway because PST8PDT is a legacy System V zone name.
-  */
-   tz =3D g_time_zone_new_identifier ("PST8PDT");
-+  expect_id =3D "PST8PDT";
-+
-+#ifndef G_OS_WIN32
-+  /* PST8PDT is in tzdata's "backward" set, packaged as tzdata-legacy a=
nd
-+   * not always present in some OSs; fall back to the equivalent geogra=
phical
-+   * name if the "backward" time zones are absent. */
-+  if (tz =3D=3D NULL)
-+    {
-+      g_test_message ("Legacy PST8PDT time zone not available, falling =
back");
-+      tz =3D g_time_zone_new_identifier ("America/Los_Angeles");
-+      expect_id =3D "America/Los_Angeles";
-+    }
-+#endif
-+
-   g_assert_nonnull (tz);
--  g_assert_cmpstr (g_time_zone_get_identifier (tz), =3D=3D, "PST8PDT");
-+  g_assert_cmpstr (g_time_zone_get_identifier (tz), =3D=3D, expect_id);
-   /* a date in winter =3D non-DST */
-   gdt1 =3D g_date_time_new (tz, 2024, 1, 1, 0, 0, 0);
-   i1 =3D g_time_zone_find_interval (tz, G_TIME_TYPE_STANDARD, g_date_ti=
me_to_unix (gdt1));
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.2.bb b/meta=
/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.82.2.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.82.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.82.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
index 666d3ef8ef..9d50a95c40 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -227,15 +227,12 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-=
${PV}.tar.xz \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-on=
ly-.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.pa=
tch \
            file://skip-timeout.patch \
-           file://gdatetime-test-fail-0001.patch \
-           file://gdatetime-test-fail-0002.patch \
-           file://gdatetime-test-fail-0003.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch \=20
                                 file://0001-meson.build-do-not-enable-pi=
dfd-features-on-native-g.patch \
                               "
=20
-SRC_URI[sha256sum] =3D "ab45f5a323048b1659ee0fbda5cecd94b099ab3e4b9abf26=
ae06aeb3e781fd63"
+SRC_URI[sha256sum] =3D "37dd0877fe964cd15e9a2710b044a1830fb1bd93652a6d0c=
b6b8b2dff187c709"
=20
 # Find any meson cross files in FILESPATH that are relevant for the curr=
ent
 # build (using siteinfo) and add them to EXTRA_OEMESON.
--=20
2.47.1


