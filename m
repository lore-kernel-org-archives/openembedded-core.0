Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F80DC021BE
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 00:40:32 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.706.1740444027644737812
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Feb 2025 16:40:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout12.t-online.de (Postfix) with SMTP id C14C3294
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 01:39:26 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.235.213]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tmiys-2aSJN30; Tue, 25 Feb 2025 01:39:26 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][oe-core][PATCH 1/4] glib-2.0: update 2.82.4 -> 2.83.4
Date: Tue, 25 Feb 2025 01:39:57 +0100
Message-ID: <20250225004000.3673-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1740443966-47FFD681-0B75CB35/0/0 CLEAN NORMAL
X-TOI-MSGID: 8b216808-ba3e-4266-adc9-4d803ef1f207
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 00:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211856

Overview of changes in GLib 2.83.4, 2025-02-20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Fix Python shebang paths so they work on Windows again (#3331, work by
  Dan Yeaw and others)

* Fix refcounting semantics of `g_dbus_connection_register_object_with_cl=
osures()`
  by adding a replacement API (#3560, work by Philip Withnall)

* Support static vfuncs in GIRepository (!4457, work by Philip Chimento)

* Add support for QNX8.0 (!4466, work by Felix Xing)

* Add a soft dependency on C11 =E2=80=94 if your toolchain doesn=E2=80=99=
t support C11, you have
  six months to tell us before this becomes a hard dependency (!4473)

* Port from `net.hadess.PowerProfiles` to `org.freedesktop.UPower.PowerPr=
ofiles`
  for `GPowerProfileMonitorDBus` (!4478, work by Marco Trevisan)

* Bugs fixed:
  - #3331 Windows build broken because of Python paths (Dan Yeaw)
  - #3448 Use after free in GCancellableSource test (Marco Trevisan (Trev=
i=C3=B1o))
  - #3560 Fix refcounting semantics of
    g_dbus_connection_register_object_with_closures() (Philip Withnall)
  - #3578 gkeyfile: Honor C in $LANGUAGE as gettext does (Ga=C3=ABl Bonit=
hon)
  - #3587 g_app_info_launch crashes on macos (Andre Miranda)
  - #3592 GDBusConnection does not handle serial number overflow (Philip
    Withnall)
  - #3595 Toolchain documentation should mention that GLib assumes functi=
ons can
    be called through wrongly-typed function pointers (Demi Obenour)
  - #3612 cancellable unit test crashes in /cancellable-source/threaded-d=
ispose
    (Marco Trevisan (Trevi=C3=B1o))
  - #3613 Potentially revert g_win32_com_clear() due to pulling in window=
s.h
  - !3255 Drop TypeNode reference counting
  - !4046 Add G_OPTION_FLAG_DEPRECATED
  - !4457 Support static vfuncs in GIRepository
  - !4461 docs: Update the release documentation for the new release work=
flow
  - !4464 gosxappinfo: Fix leak
  - !4466 Add support for QNX8.0
  - !4468 Registry backend fixes
  - !4471 glib.supp: Ignore once-per-thread leak from SysprofCollector
  - !4472 gkeyfile: Convert docs to gi-docgen linking syntax
  - !4473 build: Add a soft dependency on C11
  - !4475 docs: Fix invalid references and broken links
  - !4476 tests: Cleanup python tests and add tests for gi-compile-reposi=
tory
    and gi-inspect-typelib
  - !4477 gcancellable: remove sketchy source ref/unref
  - !4478 gio/powerprofilemonitordbus: Use newer D-Bus API
  - !4479 docs: Make docs more markdown-ish
  - !4483 tests: Fix a memory leak if a callable-info test is skipped
  - !4486 meson: Fix typo in comment about python shebang
  - !4487 gio/gfilemonitor: Use atomic API to get / store cancelled state
  - !4488 gmain: Use atomic logic to handle internal GSource flags
  - !4490 gio/subprocess: Lock while writing on shared pid and status val=
ues
  - !4491 Update Brazilian Portuguese translation
  - !4492 gfilemonitor: Various cleanups and minor fixes to property hand=
ling
  - !4493 gdbus: Add g_clear_dbus_signal_subscription() inline convenienc=
e
    function
  - !4494 gio/subprocess: Initialize pid variable to 0
  - !4495 gio/gvolumemonitor: Suggest disconnecting signals
  - !4496 Update Polish translation for GNOME 48
  - !4497 tests: Fix a minor leak in a new GSubprocess test
  - !4498 gdatetime: Fix integer overflow when parsing very long ISO8601 =
inputs

* Translation updates:
  - Polish (Piotr Dr=C4=85g)
  - Portuguese (Brazil) (Rafael Fontenelle)

Overview of changes in GLib 2.83.3, 2025-01-23
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Fix build-time paths appearing in generated `Gio-2.0.gir` and
  `GioUnix-2.0.gir` files (#3564, work by Simon McVittie)

* Fix crash on macOS when opening links (#3568, work by John Ralls)

* Bugs fixed:
  - #3558 Recent `(inout)` changes caused unintended side-effects with
    `GWeakRef` (Michael Catanzaro)
  - #3561 Missing nullable annotation on parameter user_data and on the r=
eturn
    value of GVfsFileLookupFunc callback (fbrouille)
  - #3562 GBytes semantics of handling empty strings are inconsistent and
    confusing (Philip Withnall)
  - #3563 Bad anchor link in g_signal_connect() documentation
  - #3564 build-time paths to gio/gunixmounts.h, etc. end up in Gio-2.0.g=
ir,
    GioUnix-2.0.gir (Simon McVittie)
  - #3568 Links crash application on MacOS due to lack of machine-id file=
 (John
    Ralls)
  - #3569 Requirement of GUnixMountMonitor for a Valid Timestamp from
    unix_mount_at is not Suffeciently Documented (Philip Withnall)
  - #3582 gmacros:  _G_BOOLEAN_EXPR_IMPL is incompatible with c++ functio=
ns
    marked constexpr
  - !3885 [th/gdataset-index] add a lookup index (GHashTable) to `GData`
  - !4392 GWin32: Add g_win32_com_clear()
  - !4436 docs: Add --generate-md to the gdbus-codegen documentation
  - !4437 docs: Fix some backslash escaping issues in doc comments
  - !4440 gio, gobject: Improve reproducibility of enumtypes headers
  - !4441 gstrfuncs: Drop a redundant paragraph
  - !4442 Don't define test setups unless we're testing
  - !4443 build: Make the introspection feature yield
  - !4444 Fix pointer-to-paramref syntax in docs
  - !4446 gio: Fix a link to a specifications document
  - !4449 Add several assertions to help static analysis and fix some GIR
    annotations
  - !4450 Fix GCC version detection for GUINT*_SWAP_LE_BE
  - !4454 gioenums: Add deprecation for FLAGS_NONE
  - !4455 docs: Use gi-docgen syntax in main-loop.md
  - !4458 docs: Document more extension points
  - !4460 docs: Clarify that g_array_unref() works like g_ptr_array_unref=
().

Overview of changes in GLib 2.83.2, 2024-12-11
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* This release has the same code as 2.83.1, but contains a fix for releas=
e
  archive generation which means that 2.83.1 does not have a release arch=
ive

* Bugs fixed:
  - !4433 ci: Enable -Dintrospection for dist builds

Overview of changes in GLib 2.83.1, 2024-12-11
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Bugs fixed:
  - #1251 gio/tests/contenttype fails on OS X: "public.directory" !=3D
    "public.folder"
  - #3441 Bump minimum supported version of macOS (John Ralls)
  - #3493 Heap buffer overflow read in utf8_verify_ascii() (Philip Withna=
ll)
  - #3511 Build failure =E2=80=9C'ifunc' is not supported on this target=E2=
=80=9D with muslc
    (Philip Withnall)
  - #3517 Silent linked-list corruption in g_static_resource_init() on re=
dundant
    calls
  - #3524 Wrong parameter type for g_enum_register_static in GObject-2.0.=
gir
    (Jan-Willem Harmannij)
  - #3526 Segfault in statically linked binary during initialization of i=
funcs
    since 2.83.0 (Philip Withnall)
  - #3532 g_converter_output_stream_write() can return 0 (Benjamin Otte)
  - #3540 g_signal_connect on "notify::non-existant-property" doesn't war=
n for
    invalid property (Sid)
  - #3545 Modernize the default value for g_thread_pool_set_max_unused_th=
reads
    (Matthias Clasen)
  - #3546 Make the thread name available (Matthias Clasen)
  - #3548 Fix g_settings_schema_has_key() to work with extended schemas
  - #3552 Missing nullable annotation for `log_domain` in `GLogFunc` call=
back
    (Roberto Leinardi)
  - #3559 2.82.3 regression: lollypop crashes on startup (Philip Withnall=
)
  - !4232 refstring: Fix race between releasing and re-acquiring an inter=
ned
    GRefString
  - !4382 girepository: gi_object_info_find_signal(): Avoid repeated allo=
cations
  - !4384 test utils: Make nonfatal assertions an option
  - !4385 gutf8: Skip ASan instrumentation for load_word
  - !4389 macos: Add extra content type tests
  - !4393 Replace procfs linuxism with kinfo freebsdism
  - !4395 appmonitor: Fix warning building test
  - !4396 tests: Factor out a function to convert FD to path
  - !4398 grefstring: Mark a variable as potentially unused
  - !4399 meson: Add variables to -uninstalled.pc files
  - !4401 testutils: Documentation improvements
  - !4403 Revert "CI: Rebuild a slightly newer version of ninja for debia=
n-
    stable-i386"
  - !4406 glib/gbytes: Be more careful when saving a GBytes of NULL
  - !4407 guri: Fix paths starting with =E2=80=98//=E2=80=99 when parsing
  - !4410 threadpool: Simplify pool thread naming
  - !4411 gdbusconnection: Allow creating connection with cross-namespace
  - !4412 gmessages: Treat DEBUG_INVOCATION=3D1 same as G_MESSAGES_DEBUG=3D=
all
  - !4413 gunicode: Update some comments in gunicode.h for Unicode 16.0.0
  - !4414 gdbus: Add a few missing `(nullable)` annotations to GDBus meth=
od
    invocation related functions
  - !4415 gdbus: Fix leak of method invocation when registering an object=
 with
    closures
  - !4421 gparam: Add link to constructed vfunc to CONSTRUCT
  - !4422 docs: Fix dead link in CONTRIBUTING
  - !4423 gio-tool: Clarify that `gio mount -l` only lists user-interesti=
ng
    things
  - !4424 ci: Ensure all variables are quoted in .gitlab-ci.yml
  - !4425 tests: Skip unsupported dbus-appinfo test on GNU/Hurd for the m=
oment
  - !4428 girepository: Expose gi-compile-repository and gi-* tools in pk=
g-
    config
  - !4429 gdbus: Add nullable annotations for fd list outs
  - !4432 ci: Add release component to automate tarball publishing

Overview of changes in GLib 2.83.0, 2024-11-06
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Update to Unicode 16.0.0; there may be bugs in linebreaking support, se=
e #3518
  (#3460, work by Philip Withnall)

* Optimise UTF-8 validation of strings, including use of ifuncs to preven=
t
  spurious warnings from sanitizers and valgrind (#3481, work by Christia=
n
  Hergert)

* Fix a potential buffer overflow in `GSocks4aProxy` (#3461, work by
  Michael Catanzaro)

* Change the default value of -Dglib_debug from `auto` to `enabled` for
  developers =E2=80=94 distributions will almost certainly want to overri=
de it to
  `-Dglib_debug=3Ddisabled` for package release builds though; see #3421

* Revert per-instance locking changes in `GCancellable` as they introduce=
d new
  races (#3448)

* Bump Meson dependency to 1.4.0 (!4244, work by Benjamin Gilbert)

* Rename multiple `g_unix_mount_*()` APIs to `g_unix_mount_entry_*()` (#3=
492,
  work by Jialu Zhou)

* Add a new `GFileMonitor` backend for macOS and BSD: libinotify-kqueue (=
!3657,
  work by Gleb Popov)

* Add APIs for sync, async and finish function annotations to libgireposi=
tory
  (!3746, work by Evan Welsh)

* Bugs fixed:
  - #3289 readlink -f fails in CI on macOS
  - #3415 module-test-library and module-test-plugin tests fail on FreeBS=
D and
    muslc (Philip Withnall)
  - #3417 Investigate trampoline performance implications in g_mutex_lock=
_impl()
    changes (Philip Withnall)
  - #3421 Default value for glib_debug meson option (Philip Withnall)
  - #3444 deprecation warnings when using gobjectnotifyqueue.c
  - #3450 Should check for epoll_create1 rather than epoll_create (Philip
    Withnall)
  - #3451 Gio.MenuModel docs have an outdated UI example (Philip Withnall=
)
  - #3456 Test /unix-mounts/get-mount-entries fails unless libmount is en=
abled
    (Philip Withnall)
  - #3458 scan-build CI job fails due to gvdb subproject not having meson=
.build
    (Philip Withnall)
  - #3460 "404: Page not found" Error on "submitted as merge requests" Li=
nk
    (Philip Withnall)
  - #3461 Buffer overflow in set_connect_msg() (Michael Catanzaro)
  - #3464 g-ir-scanner fails silently on msys2 CI jobs (Philip Withnall)
  - #3465 Avoid GError for control flow in GResources
  - #3469 Unclear correctness of g_malloc() in pattern_coalesce() (Michae=
l
    Catanzaro)
  - #3470 Update to Unicode 16.0.0 (Philip Withnall)
  - #3472 Overactive GVariantTypeInfo collection causes considerable over=
head
    (Christian Hergert)
  - #3477 Determine policy on 32-bit support (Philip Withnall)
  - #3478 Incorrect Examples in GVariant Specification (Christian Hergert=
)
  - #3480 glib/gvariant: incorrect use of G_ANALYZER_ANALYZING (Christian
    Hergert)
  - #3481 Discussion: utf8 validation optimization (Christian Hergert)
  - #3483 mainloop Unix FD test intermittently fails on Hurd (Philip With=
nall)
  - #3484 g_app_info_launch_default_for_uri no longer works on macOS
  - #3486 GVariant inline allocation support broke i686/32-bit builds (Ch=
ristian
    Hergert)
  - #3488 `glib` does not properly detect `gobject-introspection` (Philip
    Withnall)
  - #3489 Multicast cannot be joined on Mac OS on non-default interface
    (Nirbheek Chauhan)
  - #3490 Meson: fix support for aarch64-w64-mingw32 (Windows on ARM64) (=
Carlo
    Bramini)
  - #3492 Incorrect Documentation for g_unix_mount_get_mount_path Return =
Value
    Ownership (Jialu Zhou)
  - #3500 AIX: build failure due to pollfd structure change (Parth Patel)
  - #3502 Test regressions with tzdata 2024b (Rebecca N. Palmer)
  - #3508 g_array_free and free_seg
  - #3512 AIX: Undefined symbol related to ASAN Sanitizer
  - !3657 Introduce a new GFileMonitor backend: libinotify-kqueue
  - !3746 girepository: Add APIs for sync, async, and finish function
    annotations
  - !3816 Update the wrap file for gi-docgen
  - !4126 build: Enable -Wfloat-conversion and fix warnings
  - !4176 tests: Expand tests for app launching via D-Bus
  - !4196 refstring: add GEqualFunc for ref-counted strings
  - !4202 simpleproxyresolver: Ignore host with scope id
  - !4204 Fix minor issues found by static analysis, and add some additio=
nal
    code comments
  - !4216 build: Post-release version bump
  - !4218 Persian l10n
  - !4219 tests: Run lint tests with detected bash
  - !4223 Update Korean translation
  - !4224 Update Catalan translation
  - !4225 Update Czech translation
  - !4226 Update Portuguese translation
  - !4227 gspawn: close child_err_report_fd before exiting on error
  - !4235 Update Ukrainian translation
  - !4236 Cherry pick Polish and Brazilian Portuguese translations from
    glib-2-82 to main
  - !4237 Update French translation
  - !4239 Update Galician translations for main
  - !4243 gresource: Convert docs to gi-docgen linking syntax
  - !4244 build: Bump Meson dependency to 1.4.0
  - !4245 resource: Add g_resource[s]_has_children and avoid a pointless
    allocation
  - !4248 dir: Avoid some allocations
  - !4252 gio: Fix overindented docstring of buffer argument
  - !4253 Update Bulgarian translation
  - !4254 Update British English translation (main)
  - !4256 Updated Lithuanian translation
  - !4257 Update Hungarian translation
  - !4260 Collation keys are not encoded in UTF-8
  - !4261 gsocket windows: check event before calling WSAEnumNetworkEvent=
s
  - !4262 Update Russian translation
  - !4264 Update Danish translation
  - !4267 Update Georgian translation
  - !4268 subprojects: Update pcre2 to 10.44
  - !4269 docs(glib): Fix link in string-utils ref
  - !4272 gio: Add a query_exists vfunc to GFile
  - !4277 tests: Add some explicit float =E2=86=92 int casts
  - !4278 GDBus: Don't log a message for G_DBUS_CONNECTION_FLAGS_CROSS_NA=
MESPACE
  - !4286 glib/gvariant: avoid GVariantType copy for stack builders
  - !4288 girepository: Make _blob_is_registered_type static inline
  - !4290 glib/gbytes: save small byte buffers inline
  - !4292 Fix incorrect use of assert/debug/check macros
  - !4293 gvarianttypeinfo: reduce caching overhead
  - !4294 gvarianttype: mark const functions as such
  - !4295 gvariant: Avoid malloc/free in valid_format_string()
  - !4296 glib/gvariant: use g_utf8_validate() for strlen
  - !4297 glib/gvarianttype: g_variant_type_is_subtype_of() fastpath
  - !4298 glib/gvariant: avoid g_renew() for definite tuples
  - !4299 glib/gvariant: Avoid extraneous GBytes ref counting
  - !4300 gpoll windows: use a threadpool when polling large number of fd=
s
  - !4301 glib/gvariant: Inline small gvariant data using C99 flexible ar=
rays
  - !4302 glib/gvariant: skip bitlock for g_variant_ref_sink()
  - !4303 gbytes: Convert docs to gi-docgen linking syntax
  - !4304 gutf8: Convert docs to gi-docgen linking syntax
  - !4305 build: switch back to c_std=3Dgnu99 pending ObjC fix
  - !4307 ci: Re-enable fatal warnings for FreeBSD CI
  - !4308 utils: Add g_steal_handle_id() to complement g_clear_handle_id(=
)
  - !4310 tests: FreeBSD doesn't use glibc
  - !4311 tests: Move fake-document-portal subprocess inside dbus-appinfo=
 test
  - !4313 remove quadratic behavior in g_string_replace
  - !4315 fuzzing: Add simple fuzz test for g_string_replace()
  - !4318 CI: Use Visual Studio 2019 for the MSVC CI
  - !4321 gvariant-core.c: Fix suffix alignment on 32-bit MSVC builds
  - !4322 gvariant: Fix unused variables when G_DISABLE_ASSERT is defined
  - !4323 gbytes: Add an assertion to placate static analysis
  - !4326 gvarianttype: Add two missing (nullable) annotations and port d=
ocs to
    gi-docgen format
  - !4327 gio/gdatainputstream: use memchr() when possible
  - !4331 gir: Ignore function-inline and method-inline elements
  - !4332 gstring: Fix a heap buffer overflow in the new g_string_replace=
() code
  - !4334 fuzzing: Add input length limits on g_string_replace() test
  - !4335 docs: Update CI platforms list and Visual Studio recommendation
  - !4338 CI/MSYS2: Fix prefix for gobject-introspection
  - !4339 Win32 cleanup: do not define STRICT
  - !4340 gsocket: Fix #ifdef for defining g_socket_get_adapter_ipv4_addr=
()
  - !4341 gio: Use g_steal_handle_id() with signal unsubscriptions
  - !4342 CI: Add manual CI job for VS2019 ARM64 builds
  - !4343 CI: Skip PCRE2 tests for now for 32-bit Visual Studio builds
  - !4344 glib/gutf8: use ifunc to check for valgrind
  - !4345 fuzzing: Add fuzz tests for GDataInputStream=E2=80=99s complex =
read methods
  - !4346 gdate: Fix minor typo in documentation comment
  - !4347 docs: Add Meson to the GSettings build integration
  - !4348 gdatainputstream: Fix length return value on UTF-8 validation f=
ailure
  - !4350 glib: Don't require GLIB_DOMAIN to be a NUL-terminated string
  - !4351 Build fixes for building on Solaris & illumos
  - !4352 gdatainputstream: Use memchr() for the multi-stop-char case too
  - !4353 docs: Add CI runner maintainers to CODEOWNERS
  - !4354 glib.supp: Suppress more _g_io_module_get_default_type leaks
  - !4358 Add a CI job for Debian stable i386 (32-bit)
  - !4359 tests: Use g_assert_*() rather than g_assert() in GDateTime tes=
ts
  - !4365 fuzzing: Fix buffer overread error in the fuzz test itself
  - !4366 glocalfile: Disable faccessat()-based query_exists on FreeBSD
  - !4367 tests: Fix calls to deprecated API in unix-mounts tests
  - !4373 macos: Remove extraneous space from type identifier
  - !4374 thread: Force-limit thread name length
  - !4375 Small improvements to g_on_error_stack_trace and g_on_error_que=
ry
  - !4376 Enable GNetworkMonitorNetlink on FreeBSD
  - !4377 gvariant: Introduce G_VARIANT_BUILDER_INIT_UNSET
  - !4378 gio: Fix GFileEnumerator leaks in gio tools
  - !4383 gtask: Fix comment for auto task naming via 'g_task_set_source_=
tag()'

* Translation updates:
  - Bulgarian (twlvnn kraftwerk)
  - Catalan (Jordi Mas)
  - Czech (AsciiWolf)
  - Danish (Ask Hjorth Larsen)
  - English (United Kingdom) (Bruce Cowan)
  - French (Vincent Chatelain)
  - Galician (Fran Di=C3=A9guez)
  - Georgian (NorwayFun)
  - Hungarian (Bal=C3=A1zs =C3=9Ar)
  - Korean (Changwoo Ryu)
  - Lithuanian (Aurimas =C4=8Cernius)
  - Persian (Danial Behzadi)
  - Polish (Piotr Dr=C4=85g)
  - Portuguese (Hugo Carvalho)
  - Portuguese (Brazil) (Rafael Fontenelle)
  - Russian (jtux270)
  - Ukrainian (Yuri Chornoivan)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...Do-not-write-bindir-into-pkg-config-files.patch | 14 +++++++-------
 .../0001-Fix-DATADIRNAME-on-uclibc-Linux.patch     |  2 +-
 ...stall-gio-querymodules-as-libexec_PROGRAM.patch |  6 +++---
 ...warning-about-deprecated-paths-in-schemas.patch |  4 ++--
 ...esources.c-comment-out-a-build-host-only-.patch |  6 +++---
 ...1-meson-Run-atomics-test-on-clang-as-well.patch |  6 +++---
 ...-do-not-enable-pidfd-features-on-native-g.patch |  6 +++---
 ...t-hardcode-python-path-into-various-tools.patch |  2 +-
 .../glib-2.0/files/relocate-modules.patch          |  8 ++++----
 .../recipes-core/glib-2.0/files/skip-timeout.patch |  2 +-
 ...nitial_2.82.4.bb =3D> glib-2.0-initial_2.83.4.bb} |  0
 .../{glib-2.0_2.82.4.bb =3D> glib-2.0_2.83.4.bb}     |  0
 meta/recipes-core/glib-2.0/glib.inc                |  2 +-
 13 files changed, 29 insertions(+), 29 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.82.4.bb =3D> glib-=
2.0-initial_2.83.4.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.82.4.bb =3D> glib-2.0_2.83=
.4.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-in=
to-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-=
write-bindir-into-pkg-config-files.patch
index 4ef03f3157..c394ab3277 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-=
config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-=
config-files.patch
@@ -1,4 +1,4 @@
-From 7e00964de0ae27f868726413e46f27145807a50d Mon Sep 17 00:00:00 2001
+From 8981db5d775e04b72fb68b6a4553c87fdaedee65 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config fi=
les
@@ -15,10 +15,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
  2 files changed, 13 insertions(+), 11 deletions(-)
=20
 diff --git a/gio/meson.build b/gio/meson.build
-index 76d67cd..0584ff5 100644
+index 5d91b89..1a8da12 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -885,17 +885,18 @@ libgio_dep =3D declare_dependency(link_with : libg=
io,
+@@ -901,17 +901,18 @@ libgio_dep =3D declare_dependency(link_with : libg=
io,
  pkg.generate(libgio,
    requires : ['glib-2.0', 'gobject-2.0'],
    variables : [
@@ -43,13 +43,13 @@ index 76d67cd..0584ff5 100644
 +    'gresource=3Dgresource',
 +    'gsettings=3Dgsettings',
    ],
-   version : glib_version,
-   install_dir : glib_pkgconfigreldir,
+   uninstalled_variables : [
+     'gio=3D${prefix}/gio/gio',
 diff --git a/glib/meson.build b/glib/meson.build
-index 9f1515b..a40e4f5 100644
+index 837960d..97d4af0 100644
 --- a/glib/meson.build
 +++ b/glib/meson.build
-@@ -447,9 +447,10 @@ pkg.generate(libglib,
+@@ -443,9 +443,10 @@ pkg.generate(libglib,
    subdirs : ['glib-2.0'],
    extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
    variables : [
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-ucl=
ibc-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-o=
n-uclibc-Linux.patch
index c1d55d87b6..19fffbdc5f 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Lin=
ux.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Lin=
ux.patch
@@ -1,4 +1,4 @@
-From 979d3ddf77abfd00c1e2108cde4aef2d015257b0 Mon Sep 17 00:00:00 2001
+From 48bfc87e9f757cf65ad967520860bfd7526c36f2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodul=
es-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Insta=
ll-gio-querymodules-as-libexec_PROGRAM.patch
index 9599156eaf..89ba10ff6d 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-l=
ibexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-l=
ibexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 54f9e7fcbd6345846c379a47c20245259a83d42a Mon Sep 17 00:00:00 2001
+From b8dcbf03b315d31759176e9d4fd389e8fda6ffcd Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
@@ -13,10 +13,10 @@ Upstream-Status: Inappropriate [OE specific]
  1 file changed, 1 insertion(+)
=20
 diff --git a/gio/meson.build b/gio/meson.build
-index 1c9a369..76d67cd 100644
+index 854b95a..5d91b89 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -1009,6 +1009,7 @@ gio_querymodules =3D executable('gio-querymodules'=
, 'gio-querymodules.c', 'giomodu
+@@ -1038,6 +1038,7 @@ gio_querymodules =3D executable('gio-querymodules'=
, 'gio-querymodules.c', 'giomodu
    c_args : gio_c_args,
    # intl.lib is not compatible with SAFESEH
    link_args : noseh_link_args,
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-abo=
ut-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0=
001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index e4c193cfbb..ebdf957272 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-depr=
ecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-depr=
ecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From 1300572dfc8e488a3edaed8cb1f22fcf2303e452 Mon Sep 17 00:00:00 2001
+From bdb2772d672e95584585e902689936559c5db05d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.co=
m>
  1 file changed, 13 deletions(-)
=20
 diff --git a/gio/glib-compile-schemas.c b/gio/glib-compile-schemas.c
-index 54b980b..be05894 100644
+index 81e675f..1a10a8d 100644
 --- a/gio/glib-compile-schemas.c
 +++ b/gio/glib-compile-schemas.c
 @@ -1232,19 +1232,6 @@ parse_state_start_schema (ParseState  *state,
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-=
comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0=
001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index bf3fb93bea..771b03e66d 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment=
-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment=
-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From ec777a7f17c28e72f7b0bdcec385656533c50cca Mon Sep 17 00:00:00 2001
+From 8cb75d3bc368ee108a4b14bc57a92bd0c0b2e10e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only te=
st
@@ -13,10 +13,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/gio/tests/resources.c b/gio/tests/resources.c
-index f7dc039..f708876 100644
+index ee9cee4..ff844c1 100644
 --- a/gio/tests/resources.c
 +++ b/gio/tests/resources.c
-@@ -1068,7 +1068,7 @@ main (int   argc,
+@@ -1196,7 +1196,7 @@ main (int   argc,
    g_test_add_func ("/resource/automatic", test_resource_automatic);
    /* This only uses automatic resources too, so it tests the constructo=
rs and destructors */
    g_test_add_func ("/resource/module", test_resource_module);
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test=
-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run=
-atomics-test-on-clang-as-well.patch
index 9b26ea8e84..e5878a1428 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-cla=
ng-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-cla=
ng-as-well.patch
@@ -1,4 +1,4 @@
-From 8b8953adcd0071c39a78e6d2fd437ad0e149591d Mon Sep 17 00:00:00 2001
+From 502984fe340a76c92e2c04235f43fdcb47728806 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index 5beb14d..963815f 100644
+index a8bcadc..041b68e 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -2050,7 +2050,7 @@ atomicdefine =3D '''
+@@ -2075,7 +2075,7 @@ atomicdefine =3D '''
  # We know that we can always use real ("lock free") atomic operations w=
ith MSVC
  if cc.get_id() =3D=3D 'msvc' or cc.get_id() =3D=3D 'clang-cl' or cc.lin=
ks(atomictest, name : 'atomic ops')
    have_atomic_lock_free =3D true
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-ena=
ble-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0=
001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index 80f26b738a..e512940e34 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pid=
fd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pid=
fd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From 51d592900e8acdec4f043ceeb23e32d27dded8eb Mon Sep 17 00:00:00 2001
+From d5e566c45a9ab4d7e51104ab176e6eb5f705f91d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native gli=
b
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/meson.build b/meson.build
-index 963815f..4d4a9f3 100644
+index 041b68e..155bfd4 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -1048,7 +1048,8 @@ if cc.links('''#include <sys/syscall.h>
+@@ -1073,7 +1073,8 @@ if cc.links('''#include <sys/syscall.h>
                   waitid (P_PIDFD, 0, &child_info, WEXITED | WNOHANG);
                   return 0;
                 }''', name : 'pidfd_open(2) system call')
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python=
-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do=
-not-hardcode-python-path-into-various-tools.patch
index 8184c9636c..d26f944d51 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-i=
nto-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-i=
nto-various-tools.patch
@@ -1,4 +1,4 @@
-From cc02206c156cb99c441e56a51639cd5ca64efae9 Mon Sep 17 00:00:00 2001
+From 211927d2caa4a81e1131c2210e1db838104a1fb9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/me=
ta/recipes-core/glib-2.0/files/relocate-modules.patch
index f4bee2f02e..ddf464526c 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From afe2c1e5854102c0e75f9e70a6569c9f2b6360d8 Mon Sep 17 00:00:00 2001
+From 456bac53f19d3094aa2007054c87d86c9d65b423 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native =
builds
@@ -18,10 +18,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.c=
om>
  1 file changed, 7 deletions(-)
=20
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index aa6272f..26aebf7 100644
+index 76c2028..6deba7c 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
-@@ -1263,11 +1263,6 @@ get_gio_module_dir (void)
+@@ -1260,11 +1260,6 @@ get_gio_module_dir (void)
        g_free (install_dir);
  #else
        module_dir =3D g_strdup (GIO_MODULE_DIR);
@@ -33,7 +33,7 @@ index aa6272f..26aebf7 100644
  #include <dlfcn.h>
        {
          g_autofree gchar *path =3D NULL;
-@@ -1286,8 +1281,6 @@ get_gio_module_dir (void)
+@@ -1283,8 +1278,6 @@ get_gio_module_dir (void)
                }
            }
        }
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/r=
ecipes-core/glib-2.0/files/skip-timeout.patch
index e5f09a4e2d..138e970553 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From 7cd21568601b78720f92955f1e794ca4f11c225d Mon Sep 17 00:00:00 2001
+From 51bfcab0b60bd57f4d3463c479fdf47e645cd6fe Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb b/meta=
/recipes-core/glib-2.0/glib-2.0-initial_2.83.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.83.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.83.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.83.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
index 9d50a95c40..3727716021 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -232,7 +232,7 @@ SRC_URI:append:class-native =3D " file://relocate-mod=
ules.patch \
                                 file://0001-meson.build-do-not-enable-pi=
dfd-features-on-native-g.patch \
                               "
=20
-SRC_URI[sha256sum] =3D "37dd0877fe964cd15e9a2710b044a1830fb1bd93652a6d0c=
b6b8b2dff187c709"
+SRC_URI[sha256sum] =3D "4edc4dc184f46d1220694b7775c5d7c62265c83b0e9632d8=
44da127c181fc391"
=20
 # Find any meson cross files in FILESPATH that are relevant for the curr=
ent
 # build (using siteinfo) and add them to EXTRA_OEMESON.
--=20
2.48.1


