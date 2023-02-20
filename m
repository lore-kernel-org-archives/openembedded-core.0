Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1467EC636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 16:25:01 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.17439.1676910296021924012
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 08:24:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout03.t-online.de (Postfix) with SMTP id 5F1891D9CD;
	Mon, 20 Feb 2023 17:24:48 +0100 (CET)
Received: from [192.168.178.83] ([79.219.230.185]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pU8y5-3R8pLE0; Mon, 20 Feb 2023 17:24:45 +0100
Date: Mon, 20 Feb 2023 17:24:40 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][RFC][PATCH] glib-2.0: update 2.74.5 -> 2.75.3
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <490EQR.SDWVS44VRMTF@t-online.de>
In-Reply-To: 
	<CANNYZj--bPnnBKRhbY5oO_WvuRN+gdP0yxOU-3OeLHjfGdsbiA@mail.gmail.com>
References: <20230220161045.97515-1-f_l_k@t-online.de>
	<MQZDQR.7MY2GTZPCC242@t-online.de>
	<CANNYZj--bPnnBKRhbY5oO_WvuRN+gdP0yxOU-3OeLHjfGdsbiA@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-r/2yK4sz9GQyP0Tp+qqF"
X-TOI-EXPURGATEID: 150726::1676910285-17FFA778-2C8D19D8/0/0 CLEAN NORMAL
X-TOI-MSGID: 6976eb8e-ac4c-4133-b418-78edcb1dfb0d
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 16:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177437

--=-r/2yK4sz9GQyP0Tp+qqF
Content-Type: text/plain; charset=us-ascii; format=flowed

Gnome Release is planned for the end of march, thus I've updated my 
local layers to build gnome 44 beta for testing and found only some 
minor bugs so far.

But you are right, that would be a close call

Am Mo, 20. Feb 2023 um 17:17:02 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> Most likely merging gnome 44 updates will have to wait until after
> mickledore is out. Historically, gnome releases happen too late for
> making it into 'spring' yocto releases.
> 
> Alex
> 
> On Mon, 20 Feb 2023 at 17:13, Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>> wrote:
>> 
>>  This was marked [RFC] because I'm unsure if glib-2.0-2.76 will be 
>> released in time for mickledore but this update would be required 
>> for the upcoming gnome 44 release. (gnome-control-center requires 
>> glib >= 2.75.0)
>> 
>>  Am Mo, 20. Feb 2023 um 17:10:45 +0100 schrieb Markus Volk 
>> <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>:
>> 
>>  - Remove backported patches - Port relocate-modules.patch 
>> Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>> --- 
>> ...-info-don-t-assume-million-in-one-ev.patch | 50 ------------ 
>> ...build-do-not-use-can_run_host_binari.patch | 48 ------------ 
>> .../glib-2.0/glib-2.0/cpp-null.patch | 77 ------------------- 
>> .../glib-2.0/glib-2.0/cpp-null2.patch | 31 -------- 
>> .../glib-2.0/glib-2.0/relocate-modules.patch | 11 ++- 
>> ...{glib-2.0_2.74.5.bb => glib-2.0_2.75.3.bb} | 6 +- 6 files 
>> changed, 8 insertions(+), 215 deletions(-) delete mode 100644 
>> meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch 
>> delete mode 100644 
>> meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch 
>> delete mode 100644 
>> meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch delete mode 
>> 100644 meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch rename 
>> meta/recipes-core/glib-2.0/{glib-2.0_2.74.5.bb => 
>> glib-2.0_2.75.3.bb} (87%) diff --git 
>> a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch 
>> b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch 
>> deleted file mode 100644 index 57ada66907..0000000000 --- 
>> a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch 
>> +++ /dev/null @@ -1,50 +0,0 @@ -From 
>> 3c56ff21b9a5fe18f9cec9b97ae1788fdf5d563e Mon Sep 17 00:00:00 2001 
>> -From: Ross Burton <ross.burton@arm.com> -Date: Tue, 6 Jul 2021 
>> 19:26:03 +0100 -Subject: [PATCH] gio/tests/g-file-info: don't assume 
>> million-in-one events - -Upstream-Status: Backport 
>> [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2990] 
>> -Signed-off-by: Ross Burton <ross.burton@arm.com> - - don't happen - 
>> -The access and creation time tests create a file, gets the time in 
>> -seconds, then gets the time in microseconds and assumes that the 
>> -difference between the two has to be above 0. - -As rare as this 
>> may be, it can happen: - -$ stat g-file-info-test-50A450 -c %y 
>> -2021-07-06 18:24:56.000000767 +0100 - -Change the test to simply 
>> assert that the difference not negative to -handle this case. - 
>> -This is the same fix as 289f8b, but that was just modification 
>> time. - ---- - gio/tests/g-file-info.c | 4 ++-- - 1 file changed, 2 
>> insertions(+), 2 deletions(-) - -diff --git 
>> a/gio/tests/g-file-info.c b/gio/tests/g-file-info.c -index 
>> d9ad045..c9b12b0 100644 ---- a/gio/tests/g-file-info.c -+++ 
>> b/gio/tests/g-file-info.c -@@ -307,7 +307,7 @@ 
>> test_g_file_info_access_time (void) - g_assert_nonnull (dt_usecs); - 
>> - ts = g_date_time_difference (dt_usecs, dt); -- g_assert_cmpint 
>> (ts, >, 0); -+ g_assert_cmpint (ts, >=, 0); - g_assert_cmpint (ts, 
>> <, G_USEC_PER_SEC); - - /* Try again with nanosecond precision. */ 
>> -@@ -442,7 +442,7 @@ test_g_file_info_creation_time (void) - 
>> g_assert_nonnull (dt_usecs); - - ts = g_date_time_difference 
>> (dt_usecs, dt); -- g_assert_cmpint (ts, >, 0); -+ g_assert_cmpint 
>> (ts, >=, 0); - g_assert_cmpint (ts, <, G_USEC_PER_SEC); - - /* Try 
>> again with nanosecond precision. */ diff --git 
>> a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch 
>> b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch 
>> deleted file mode 100644 index db08b5af55..0000000000 --- 
>> a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch 
>> +++ /dev/null @@ -1,48 +0,0 @@ -From 
>> fdbffaea2fa85c203cc6aacb5734acac65aeaa19 Mon Sep 17 00:00:00 2001 
>> -From: Alexander Kanavin <alex@linutronix.de> -Date: Fri, 11 Nov 
>> 2022 13:12:42 +0100 -Subject: [PATCH] tests/meson.build: do not use 
>> can_run_host_binaries() - -can_run_host_binaries() returns true even 
>> when cross compiling, -if there is an executable wrapper defined 
>> that can run -cross-binaries under some kind of emulation. - 
>> -Unfortunately, custom_target() will not use the wrapper -and will 
>> attempt to execute the command directly. Until -this is addressed in 
>> meson upstream, we have to disable -these targets in cross 
>> scenarios. - -Upstream-Status: Submitted 
>> [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3067] 
>> -Signed-off-by: Alexander Kanavin <alex@linutronix.de> - ---- - 
>> gio/tests/meson.build | 2 +- - glib/tests/meson.build | 2 +- - 2 
>> files changed, 2 insertions(+), 2 deletions(-) - -diff --git 
>> a/gio/tests/meson.build b/gio/tests/meson.build -index 
>> 49cfa25ce..ea59656f9 100644 ---- a/gio/tests/meson.build -+++ 
>> b/gio/tests/meson.build -@@ -652,7 +652,7 @@ if 
>> installed_tests_enabled - endforeach - endif - --if 
>> meson.can_run_host_binaries() -+if not meson.is_cross_build() - - 
>> compiler_type = '--compiler=@0@'.format(cc.get_id()) - -diff --git 
>> a/glib/tests/meson.build b/glib/tests/meson.build -index 
>> 69508178e..e4f75f302 100644 ---- a/glib/tests/meson.build -+++ 
>> b/glib/tests/meson.build -@@ -411,7 +411,7 @@ 
>> executable('testing-helper', 'testing-helper.c', - ) - - # some 
>> testing of gtester functionality --if meson.can_run_host_binaries() 
>> and host_system != 'windows' -+if not meson.is_cross_build() and 
>> host_system != 'windows' - xmllint = find_program('xmllint', 
>> required: false) - if xmllint.found() - tmpsample_xml = 
>> custom_target('tmpsample.xml', diff --git 
>> a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch 
>> b/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch deleted file 
>> mode 100644 index 63cbf90ab2..0000000000 --- 
>> a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch +++ /dev/null 
>> @@ -1,77 +0,0 @@ -From 0ca5254c5d92aec675b76b4bfa72a6885cde6066 Mon 
>> Sep 17 00:00:00 2001 -From: 
>> =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= <mail@3v1n0.net> 
>> -Date: Sat, 29 Oct 2022 04:30:52 +0200 -Subject: [PATCH] 
>> glib/gmacros: Always define NULL as nullptr in C++11 and - newer - 
>> -Upstream-Status: Backport 
>> [https://gitlab.gnome.org/GNOME/glib/-/commit/0ca5254c5d92aec675b76b4bfa72a6885cde6066] 
>> -Signed-off-by: Alexander Kanavin <alex@linutronix.de> ---- - 
>> glib/gmacros.h | 9 ++++++++- - glib/tests/cxx.cpp | 13 ------------- 
>> - 2 files changed, 8 insertions(+), 14 deletions(-) - -diff --git 
>> a/glib/gmacros.h b/glib/gmacros.h -index 5302841105..9fe8270822 
>> 100644 ---- a/glib/gmacros.h -+++ b/glib/gmacros.h -@@ -870,10 
>> +870,17 @@ - */ - #ifndef NULL - # ifdef __cplusplus --# define NULL 
>> (0L) -+# if __cplusplus >= 201103L -+# define NULL (nullptr) -+# 
>> else -+# define NULL (0L) -+# endif /* __cplusplus >= 201103L */ - # 
>> else /* !__cplusplus */ - # define NULL ((void*) 0) - # endif /* 
>> !__cplusplus */ -+#elif defined (__cplusplus) && __cplusplus >= 
>> 201103L -+# undef NULL -+# define NULL (nullptr) - #endif - - 
>> #ifndef FALSE -diff --git a/glib/tests/cxx.cpp b/glib/tests/cxx.cpp 
>> -index 6ac60791c8..045457c6e2 100644 ---- a/glib/tests/cxx.cpp -+++ 
>> b/glib/tests/cxx.cpp -@@ -34,21 +34,12 @@ test_typeof (void) - 
>> MyObject *obj3 = g_atomic_pointer_get (&obj2); - g_assert_true (obj3 
>> == obj); - --#if __cplusplus >= 201103L -- MyObject *obj4 = nullptr; 
>> --#else - MyObject *obj4 = NULL; --#endif - g_atomic_pointer_set 
>> (&obj4, obj3); - g_assert_true (obj4 == obj); - --#if __cplusplus >= 
>> 201103L -- MyObject *obj5 = nullptr; -- 
>> g_atomic_pointer_compare_and_exchange (&obj5, nullptr, obj4); 
>> --#else - MyObject *obj5 = NULL; - 
>> g_atomic_pointer_compare_and_exchange (&obj5, NULL, obj4); --#endif 
>> - g_assert_true (obj5 == obj); - - MyObject *obj6 = g_steal_pointer 
>> (&obj5); -@@ -195,11 +186,7 @@ test_steal_pointer (void) - int - 
>> main (int argc, char *argv[]) - { --#if __cplusplus >= 201103L -- 
>> g_test_init (&argc, &argv, nullptr); --#else - g_test_init (&argc, 
>> &argv, NULL); --#endif - - g_test_add_func ("/C++/typeof", 
>> test_typeof); - g_test_add_func 
>> ("/C++/atomic-pointer-compare-and-exchange", 
>> test_atomic_pointer_compare_and_exchange); --- -GitLab - diff --git 
>> a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch 
>> b/meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch deleted file 
>> mode 100644 index 763d5ce539..0000000000 --- 
>> a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch +++ /dev/null 
>> @@ -1,31 +0,0 @@ -From 7dc19632f3115e3f517c6bc80436fe72c1dcdeb4 Mon 
>> Sep 17 00:00:00 2001 -From: 
>> =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= <mail@3v1n0.net> 
>> -Date: Sat, 29 Oct 2022 04:16:00 +0200 -Subject: [PATCH] 
>> glib/tests/cxx: Ensure NULL is always casted to a pointer - type - 
>> -Otherwise it may not be recognized as valid sentinel 
>> -Upstream-Status: Backport 
>> [https://gitlab.gnome.org/GNOME/glib/-/commit/7dc19632f3115e3f517c6bc80436fe72c1dcdeb4] 
>> -Signed-off-by: Alexander Kanavin <alex@linutronix.de> ---- - 
>> glib/tests/cxx.cpp | 4 ++++ - 1 file changed, 4 insertions(+) - 
>> -diff --git a/glib/tests/cxx.cpp b/glib/tests/cxx.cpp -index 
>> 045457c6e2..aa5e0cb576 100644 ---- a/glib/tests/cxx.cpp -+++ 
>> b/glib/tests/cxx.cpp -@@ -186,7 +186,11 @@ test_steal_pointer (void) 
>> - int - main (int argc, char *argv[]) - { -+#if __cplusplus >= 
>> 201103L - g_test_init (&argc, &argv, NULL); -+#else -+ g_test_init 
>> (&argc, &argv, static_cast<void *>(NULL)); -+#endif - - 
>> g_test_add_func ("/C++/typeof", test_typeof); - g_test_add_func 
>> ("/C++/atomic-pointer-compare-and-exchange", 
>> test_atomic_pointer_compare_and_exchange); --- -GitLab diff --git 
>> a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch 
>> b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch index 
>> ae6881b61e..4a2eb3b1a7 100644 --- 
>> a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch +++ 
>> b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch @@ 
>> -14,6 +14,9 @@ Signed-off-by: Ross Burton <ross.burton@intel.com> 
>> Port patch to 2.48 Signed-off-by: Jussi Kukkonen 
>> <jussi.kukkonen@intel.com> +Port patch to 2.75 +Signed-off-by: 
>> Markus Volk <f_l_k@t-online.de> + --- gio/giomodule.c | 12 
>> +++++++++++- 1 file changed, 11 insertions(+), 1 deletion(-) @@ 
>> -31,7 +34,7 @@ index f5dbb45..c926e77 100644 #endif #include 
>> <glib/gstdio.h> -@@ -1261,7 +1263,15 @@ get_gio_module_dir (void) 
>> +@@ -1270,7 +1272,15 @@ NULL); g_free (install_dir); #else @@ -45,6 
>> +48,6 @@ index f5dbb45..c926e77 100644 + } else { + module_dir = 
>> g_strdup (GIO_MODULE_DIR); + } - #endif - } - + #ifdef __APPLE__ + 
>> #include "TargetConditionals.h" + #if TARGET_OS_OSX diff --git 
>> a/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb 
>> b/meta/recipes-core/glib-2.0/glib-2.0_2.75.3.bb similarity index 87% 
>> rename from meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb rename to 
>> meta/recipes-core/glib-2.0/glib-2.0_2.75.3.bb index 
>> d54f077cb0..40c7126120 100644 --- 
>> a/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb +++ 
>> b/meta/recipes-core/glib-2.0/glib-2.0_2.75.3.bb @@ -14,14 +14,10 @@ 
>> SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \ 
>> file://0001-Do-not-write-bindir-into-pkg-config-files.patch \ 
>> file://0001-meson-Run-atomics-test-on-clang-as-well.patch \ 
>> file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch 
>> \ - 
>> file://0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch 
>> \ - 
>> file://0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch 
>> \ - file://cpp-null.patch \ - file://cpp-null2.patch \ " 
>> SRC_URI:append:class-native = " file://relocate-modules.patch" 
>> -SRC_URI[sha256sum] = 
>> "ceba83a5999ceb31a4c4fc9921207cb9ffffd2ab1d6ec03c162d3f608a5c14c8" 
>> +SRC_URI[sha256sum] = 
>> "7c517d0aff456c35a039bce8a8df7a08ce95a8285b09d1849f8865f633f7f871" # 
>> Find any meson cross files in FILESPATH that are relevant for the 
>> current # build (using siteinfo) and add them to EXTRA_OEMESON.
>>  --
>>  2.34.1
>> 
>> 
>>  -=-=-=-=-=-=-=-=-=-=-=-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#177432): 
>> <https://lists.openembedded.org/g/openembedded-core/message/177432>
>>  Mute This Topic: 
>> <https://lists.openembedded.org/mt/97088929/1686489>
>>  Group Owner: openembedded-core+owner@lists.openembedded.org 
>> <mailto:openembedded-core+owner@lists.openembedded.org>
>>  Unsubscribe: 
>> <https://lists.openembedded.org/g/openembedded-core/unsub> 
>> [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>]
>>  -=-=-=-=-=-=-=-=-=-=-=-
>> 


--=-r/2yK4sz9GQyP0Tp+qqF
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Gnome Release is planned for the e=
nd of march, thus I've updated my local layers to build gnome 44 beta for t=
esting and found only some minor bugs so far.</div><div><br></div><div>But =
you are right,&nbsp;that would be a close call</div></div><div id=3D"geary-=
quote" dir=3D"auto"><br>Am Mo, 20. Feb 2023 um 17:17:02 +0100 schrieb Alexa=
nder Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type=3D"cite"><=
div class=3D"plaintext" style=3D"white-space: break-spaces;">Most likely me=
rging gnome 44 updates will have to wait until after
mickledore is out. Historically, gnome releases happen too late for
making it into 'spring' yocto releases.

Alex

On Mon, 20 Feb 2023 at 17:13, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-onl=
ine.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 This was marked [RFC] because I'm unsure if glib-2.0-2.76 will be released=
 in time for mickledore but this update would be required for the upcoming =
gnome 44 release. (gnome-control-center requires glib &gt;=3D 2.75.0)

 Am Mo, 20. Feb 2023 um 17:10:45 +0100 schrieb Markus Volk &lt;<a href=3D"m=
ailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;:

 - Remove backported patches - Port relocate-modules.patch Signed-off-by: M=
arkus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&g=
t; --- ...-info-don-t-assume-million-in-one-ev.patch | 50 ------------ ...b=
uild-do-not-use-can_run_host_binari.patch | 48 ------------ .../glib-2.0/gl=
ib-2.0/cpp-null.patch | 77 ------------------- .../glib-2.0/glib-2.0/cpp-nu=
ll2.patch | 31 -------- .../glib-2.0/glib-2.0/relocate-modules.patch | 11 +=
+- ...{glib-2.0_2.74.5.bb =3D&gt; glib-2.0_2.75.3.bb} | 6 +- 6 files change=
d, 8 insertions(+), 215 deletions(-) delete mode 100644 meta/recipes-core/g=
lib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.=
patch delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests=
-meson.build-do-not-use-can_run_host_binari.patch delete mode 100644 meta/r=
ecipes-core/glib-2.0/glib-2.0/cpp-null.patch delete mode 100644 meta/recipe=
s-core/glib-2.0/glib-2.0/cpp-null2.patch rename meta/recipes-core/glib-2.0/=
{glib-2.0_2.74.5.bb =3D&gt; glib-2.0_2.75.3.bb} (87%) diff --git a/meta/rec=
ipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-file-info-don-t-assume-million=
-in-one-ev.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-g-fil=
e-info-don-t-assume-million-in-one-ev.patch deleted file mode 100644 index =
57ada66907..0000000000 --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-t=
ests-g-file-info-don-t-assume-million-in-one-ev.patch +++ /dev/null @@ -1,5=
0 +0,0 @@ -From 3c56ff21b9a5fe18f9cec9b97ae1788fdf5d563e Mon Sep 17 00:00:0=
0 2001 -From: Ross Burton &lt;ross.burton@arm.com&gt; -Date: Tue, 6 Jul 202=
1 19:26:03 +0100 -Subject: [PATCH] gio/tests/g-file-info: don't assume mill=
ion-in-one events - -Upstream-Status: Backport [https://gitlab.gnome.org/GN=
OME/glib/-/merge_requests/2990] -Signed-off-by: Ross Burton &lt;ross.burton=
@arm.com&gt; - - don't happen - -The access and creation time tests create =
a file, gets the time in -seconds, then gets the time in microseconds and a=
ssumes that the -difference between the two has to be above 0. - -As rare a=
s this may be, it can happen: - -$ stat g-file-info-test-50A450 -c %y -2021=
-07-06 18:24:56.000000767 +0100 - -Change the test to simply assert that th=
e difference not negative to -handle this case. - -This is the same fix as =
289f8b, but that was just modification time. - ---- - gio/tests/g-file-info=
.c | 4 ++-- - 1 file changed, 2 insertions(+), 2 deletions(-) - -diff --git=
 a/gio/tests/g-file-info.c b/gio/tests/g-file-info.c -index d9ad045..c9b12b=
0 100644 ---- a/gio/tests/g-file-info.c -+++ b/gio/tests/g-file-info.c -@@ =
-307,7 +307,7 @@ test_g_file_info_access_time (void) - g_assert_nonnull (dt=
_usecs); - - ts =3D g_date_time_difference (dt_usecs, dt); -- g_assert_cmpi=
nt (ts, &gt;, 0); -+ g_assert_cmpint (ts, &gt;=3D, 0); - g_assert_cmpint (t=
s, &lt;, G_USEC_PER_SEC); - - /* Try again with nanosecond precision. */ -@=
@ -442,7 +442,7 @@ test_g_file_info_creation_time (void) - g_assert_nonnull=
 (dt_usecs); - - ts =3D g_date_time_difference (dt_usecs, dt); -- g_assert_=
cmpint (ts, &gt;, 0); -+ g_assert_cmpint (ts, &gt;=3D, 0); - g_assert_cmpin=
t (ts, &lt;, G_USEC_PER_SEC); - - /* Try again with nanosecond precision. *=
/ diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-meson.bui=
ld-do-not-use-can_run_host_binari.patch b/meta/recipes-core/glib-2.0/glib-2=
.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch deleted =
file mode 100644 index db08b5af55..0000000000 --- a/meta/recipes-core/glib-=
2.0/glib-2.0/0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patc=
h +++ /dev/null @@ -1,48 +0,0 @@ -From fdbffaea2fa85c203cc6aacb5734acac65ae=
aa19 Mon Sep 17 00:00:00 2001 -From: Alexander Kanavin &lt;alex@linutronix.=
de&gt; -Date: Fri, 11 Nov 2022 13:12:42 +0100 -Subject: [PATCH] tests/meson=
.build: do not use can_run_host_binaries() - -can_run_host_binaries() retur=
ns true even when cross compiling, -if there is an executable wrapper defin=
ed that can run -cross-binaries under some kind of emulation. - -Unfortunat=
ely, custom_target() will not use the wrapper -and will attempt to execute =
the command directly. Until -this is addressed in meson upstream, we have t=
o disable -these targets in cross scenarios. - -Upstream-Status: Submitted =
[https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3067] -Signed-off-by:=
 Alexander Kanavin &lt;alex@linutronix.de&gt; - ---- - gio/tests/meson.buil=
d | 2 +- - glib/tests/meson.build | 2 +- - 2 files changed, 2 insertions(+)=
, 2 deletions(-) - -diff --git a/gio/tests/meson.build b/gio/tests/meson.bu=
ild -index 49cfa25ce..ea59656f9 100644 ---- a/gio/tests/meson.build -+++ b/=
gio/tests/meson.build -@@ -652,7 +652,7 @@ if installed_tests_enabled - end=
foreach - endif - --if meson.can_run_host_binaries() -+if not meson.is_cros=
s_build() - - compiler_type =3D '--compiler=3D@0@'.format(cc.get_id()) - -d=
iff --git a/glib/tests/meson.build b/glib/tests/meson.build -index 69508178=
e..e4f75f302 100644 ---- a/glib/tests/meson.build -+++ b/glib/tests/meson.b=
uild -@@ -411,7 +411,7 @@ executable('testing-helper', 'testing-helper.c', =
- ) - - # some testing of gtester functionality --if meson.can_run_host_bin=
aries() and host_system !=3D 'windows' -+if not meson.is_cross_build() and =
host_system !=3D 'windows' - xmllint =3D find_program('xmllint', required: =
false) - if xmllint.found() - tmpsample_xml =3D custom_target('tmpsample.xm=
l', diff --git a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null.patch b/meta/=
recipes-core/glib-2.0/glib-2.0/cpp-null.patch deleted file mode 100644 inde=
x 63cbf90ab2..0000000000 --- a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null=
.patch +++ /dev/null @@ -1,77 +0,0 @@ -From 0ca5254c5d92aec675b76b4bfa72a68=
85cde6066 Mon Sep 17 00:00:00 2001 -From: =3D?UTF-8?q?Marco=3D20Trevisan=3D=
20=3D28Trevi=3DC3=3DB1o=3D29?=3D &lt;mail@3v1n0.net&gt; -Date: Sat, 29 Oct =
2022 04:30:52 +0200 -Subject: [PATCH] glib/gmacros: Always define NULL as n=
ullptr in C++11 and - newer - -Upstream-Status: Backport [https://gitlab.gn=
ome.org/GNOME/glib/-/commit/0ca5254c5d92aec675b76b4bfa72a6885cde6066] -Sign=
ed-off-by: Alexander Kanavin &lt;alex@linutronix.de&gt; ---- - glib/gmacros=
.h | 9 ++++++++- - glib/tests/cxx.cpp | 13 ------------- - 2 files changed,=
 8 insertions(+), 14 deletions(-) - -diff --git a/glib/gmacros.h b/glib/gma=
cros.h -index 5302841105..9fe8270822 100644 ---- a/glib/gmacros.h -+++ b/gl=
ib/gmacros.h -@@ -870,10 +870,17 @@ - */ - #ifndef NULL - # ifdef __cpluspl=
us --# define NULL (0L) -+# if __cplusplus &gt;=3D 201103L -+# define NULL =
(nullptr) -+# else -+# define NULL (0L) -+# endif /* __cplusplus &gt;=3D 20=
1103L */ - # else /* !__cplusplus */ - # define NULL ((void*) 0) - # endif =
/* !__cplusplus */ -+#elif defined (__cplusplus) &amp;&amp; __cplusplus &gt=
;=3D 201103L -+# undef NULL -+# define NULL (nullptr) - #endif - - #ifndef =
FALSE -diff --git a/glib/tests/cxx.cpp b/glib/tests/cxx.cpp -index 6ac60791=
c8..045457c6e2 100644 ---- a/glib/tests/cxx.cpp -+++ b/glib/tests/cxx.cpp -=
@@ -34,21 +34,12 @@ test_typeof (void) - MyObject *obj3 =3D g_atomic_pointe=
r_get (&amp;obj2); - g_assert_true (obj3 =3D=3D obj); - --#if __cplusplus &=
gt;=3D 201103L -- MyObject *obj4 =3D nullptr; --#else - MyObject *obj4 =3D =
NULL; --#endif - g_atomic_pointer_set (&amp;obj4, obj3); - g_assert_true (o=
bj4 =3D=3D obj); - --#if __cplusplus &gt;=3D 201103L -- MyObject *obj5 =3D =
nullptr; -- g_atomic_pointer_compare_and_exchange (&amp;obj5, nullptr, obj4=
); --#else - MyObject *obj5 =3D NULL; - g_atomic_pointer_compare_and_exchan=
ge (&amp;obj5, NULL, obj4); --#endif - g_assert_true (obj5 =3D=3D obj); - -=
 MyObject *obj6 =3D g_steal_pointer (&amp;obj5); -@@ -195,11 +186,7 @@ test=
_steal_pointer (void) - int - main (int argc, char *argv[]) - { --#if __cpl=
usplus &gt;=3D 201103L -- g_test_init (&amp;argc, &amp;argv, nullptr); --#e=
lse - g_test_init (&amp;argc, &amp;argv, NULL); --#endif - - g_test_add_fun=
c ("/C++/typeof", test_typeof); - g_test_add_func ("/C++/atomic-pointer-com=
pare-and-exchange", test_atomic_pointer_compare_and_exchange); --- -GitLab =
- diff --git a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null2.patch b/meta/r=
ecipes-core/glib-2.0/glib-2.0/cpp-null2.patch deleted file mode 100644 inde=
x 763d5ce539..0000000000 --- a/meta/recipes-core/glib-2.0/glib-2.0/cpp-null=
2.patch +++ /dev/null @@ -1,31 +0,0 @@ -From 7dc19632f3115e3f517c6bc80436fe=
72c1dcdeb4 Mon Sep 17 00:00:00 2001 -From: =3D?UTF-8?q?Marco=3D20Trevisan=
=3D20=3D28Trevi=3DC3=3DB1o=3D29?=3D &lt;mail@3v1n0.net&gt; -Date: Sat, 29 O=
ct 2022 04:16:00 +0200 -Subject: [PATCH] glib/tests/cxx: Ensure NULL is alw=
ays casted to a pointer - type - -Otherwise it may not be recognized as val=
id sentinel -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib=
/-/commit/7dc19632f3115e3f517c6bc80436fe72c1dcdeb4] -Signed-off-by: Alexand=
er Kanavin &lt;alex@linutronix.de&gt; ---- - glib/tests/cxx.cpp | 4 ++++ - =
1 file changed, 4 insertions(+) - -diff --git a/glib/tests/cxx.cpp b/glib/t=
ests/cxx.cpp -index 045457c6e2..aa5e0cb576 100644 ---- a/glib/tests/cxx.cpp=
 -+++ b/glib/tests/cxx.cpp -@@ -186,7 +186,11 @@ test_steal_pointer (void) =
- int - main (int argc, char *argv[]) - { -+#if __cplusplus &gt;=3D 201103L=
 - g_test_init (&amp;argc, &amp;argv, NULL); -+#else -+ g_test_init (&amp;a=
rgc, &amp;argv, static_cast&lt;void *&gt;(NULL)); -+#endif - - g_test_add_f=
unc ("/C++/typeof", test_typeof); - g_test_add_func ("/C++/atomic-pointer-c=
ompare-and-exchange", test_atomic_pointer_compare_and_exchange); --- -GitLa=
b diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b=
/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch index ae6881b61=
e..4a2eb3b1a7 100644 --- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-mod=
ules.patch +++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch=
 @@ -14,6 +14,9 @@ Signed-off-by: Ross Burton &lt;ross.burton@intel.com&gt;=
 Port patch to 2.48 Signed-off-by: Jussi Kukkonen &lt;jussi.kukkonen@intel.=
com&gt; +Port patch to 2.75 +Signed-off-by: Markus Volk &lt;f_l_k@t-online.=
de&gt; + --- gio/giomodule.c | 12 +++++++++++- 1 file changed, 11 insertion=
s(+), 1 deletion(-) @@ -31,7 +34,7 @@ index f5dbb45..c926e77 100644 #endif =
#include &lt;glib/gstdio.h&gt; -@@ -1261,7 +1263,15 @@ get_gio_module_dir (=
void) +@@ -1270,7 +1272,15 @@ NULL); g_free (install_dir); #else @@ -45,6 +=
48,6 @@ index f5dbb45..c926e77 100644 + } else { + module_dir =3D g_strdup =
(GIO_MODULE_DIR); + } - #endif - } - + #ifdef __APPLE__ + #include "TargetC=
onditionals.h" + #if TARGET_OS_OSX diff --git a/meta/recipes-core/glib-2.0/=
glib-2.0_2.74.5.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.75.3.bb similari=
ty index 87% rename from meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb rena=
me to meta/recipes-core/glib-2.0/glib-2.0_2.75.3.bb index d54f077cb0..40c71=
26120 100644 --- a/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb +++ b/meta=
/recipes-core/glib-2.0/glib-2.0_2.75.3.bb @@ -14,14 +14,10 @@ SRC_URI =3D "=
${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \ file://0001-Do-not-wri=
te-bindir-into-pkg-config-files.patch \ file://0001-meson-Run-atomics-test-=
on-clang-as-well.patch \ file://0001-gio-tests-resources.c-comment-out-a-bu=
ild-host-only-.patch \ - file://0001-gio-tests-g-file-info-don-t-assume-mil=
lion-in-one-ev.patch \ - file://0001-gio-tests-meson.build-do-not-use-can_r=
un_host_binari.patch \ - file://cpp-null.patch \ - file://cpp-null2.patch \=
 " SRC_URI:append:class-native =3D " file://relocate-modules.patch" -SRC_UR=
I[sha256sum] =3D "ceba83a5999ceb31a4c4fc9921207cb9ffffd2ab1d6ec03c162d3f608=
a5c14c8" +SRC_URI[sha256sum] =3D "7c517d0aff456c35a039bce8a8df7a08ce95a8285=
b09d1849f8865f633f7f871" # Find any meson cross files in FILESPATH that are=
 relevant for the current # build (using siteinfo) and add them to EXTRA_OE=
MESON.
 --
 2.34.1


 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
 Links: You receive all messages sent to this group.
 View/Reply Online (#177432): <a href=3D"https://lists.openembedded.org/g/o=
penembedded-core/message/177432">https://lists.openembedded.org/g/openembed=
ded-core/message/177432</a>
 Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97088929/168=
6489">https://lists.openembedded.org/mt/97088929/1686489</a>
 Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.=
org">openembedded-core+owner@lists.openembedded.org</a>
 Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core=
/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>]
 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</blockquote></div></blockquote></div>
--=-r/2yK4sz9GQyP0Tp+qqF--


