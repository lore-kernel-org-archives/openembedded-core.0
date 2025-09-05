Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A84CA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 18:16:01 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.720.1757096152047920074
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 11:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout02.t-online.de (Postfix) with SMTP id B79932A045
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Sep 2025 20:15:49 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.165.160]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uuayP-1g8aLR0; Fri, 5 Sep 2025 20:15:45 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] glib-2.0: update 2.84.4 -> 2.86.0
Date: Fri,  5 Sep 2025 20:15:38 +0200
Message-ID: <20250905181538.155818-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1757096145-6AFFAC1C-3CD6EB54/0/0 CLEAN NORMAL
X-TOI-MSGID: 974667cf-f4f7-48f7-be5e-0fad05e26e6d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 18:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223035

Overview of changes in GLib 2.86.0, 2025-09-05
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Rework how platform-specific introspected GIO APIs have to be imported =
to fix
  problems with backwards-compatibility provision for it, by removing dup=
licate
  platform-specific symbols from `Gio-2.0`. Users of platform-specific GI=
O APIs
  should be unaffected, as `GIRepository` will now automatically import
  `GioWin32-2.0` or `GioUnix-2.0` when asked to import `Gio-2.0`. However=
,
  projects generating introspection data which depends on types from eith=
er of
  those platform-specific GIRs must make sure they depend on those GIRs
  explicitly, rather than just transitively depending on them through `Gi=
o-2.0`
  (#3744, work by Emmanuele Bassi, Marco Trevisan, Florian M=C3=BCllner, =
and others)

* Fix file existence queries on Solaris, broken due to unexpected flags h=
andling
  within `faccessat()` (#3770, work by Niveditha Rau)

* Bugs fixed:
  - #3744 GDesktopAppInfo API disappeared after girepository-2.0 port (Em=
manuele
    Bassi)
  - #3768 g_test_trap_subprocess does not check G_TEST_SUBPROCESS_INHERIT=
_STDIN
    (Philip Withnall)
  - !4751 gtestutils: Fix a slightly broken example in a doc comment
  - !4754 Update Polish translation 250825
  - !4758 Update Swedish translation
  - !4762 gio: gmemorymonitorpsi: Replace GRegex with g_str_has_prefix()
  - !4765 girepository: Add an assertion to help scan-build
  - !4767 glocalfile: Disable faccessat()-based query_exists on Solaris
  - !4768 gmessages: Fix win32_keep_fatal_message regression
  - !4769 docs: Fix typos
  - !4770 Update Chinese translation
  - !4771 Update Georgian translation
  - !4772 po: Update Persian translation.

* Translation updates:
  - Chinese (China) (lumingzh)
  - Georgian (NorwayFun)
  - Persian (Danial Behzadi)
  - Polish (Piotr Dr=C4=85g)
  - Swedish (Anders Jonsson)

Overview of changes in GLib 2.85.4, 2025-08-22
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Follow symlink (instead of overwriting it) when updating `mimeapps.list=
`
  (#3579, work by Rafael Gir=C3=A3o)

* Bugs fixed:
  - #3579 mimeapps.list is overwritten if it is a symlink (Rafael Gir=C3=A3=
o)
  - #3724 Crash in g_hash_table_add after 252645135 elements (Tobias Stoe=
ckmann)
  - #3743 g_utf8_validate out parameter has wrong type (two)
  - #3751 meta: clang-format refers to a broken link (Rafael Gir=C3=A3o)
  - #3758 Out-of-bounds read in GMemoryMonitorPoll (Philip Withnall)
  - #3760 Stack overflow when recursing within g_log_structured() with
    `G_LOG_FLAG_RECURSION` (Tobias Stoeckmann)
  - #3761 Regression in g_printf() - can no longer output formatted value=
s
    containing NUL bytes (Luca Bacci)
  - #3766 Update sl.po (Slovenian) (Martin)
  - !4714 gmain: Reformat docs to fully use gi-docgen and match style gui=
de
  - !4720 Disable GMemoryMonitorPsi on Solaris
  - !4727 garray: Improve and migrate documentation to gi-docgen
  - !4735 build: Fix stp files for development versions
  - !4736 systemtap: Use correct formatters/types
  - !4738 docs: Add Thomas Haller as a co-maintainer of GObject
  - !4739 Annotate ref/unref functions as transfer full
  - !4740 gstrfuncs: Check parameter validity
  - !4742 garray: Fix g_array_binary_search description
  - !4743 Update Russian translation
  - !4744 tests/gio: skip Unix socket-mock tests on Windows
  - !4747 tests/printf: Use proper compare helper for unsigned types
  - !4748 gconstructor: Add attribute used for TLS callback pointer

* Translation updates:
  - Russian (jtux270)
  - Slovenian (Martin)

Overview of changes in GLib 2.85.3, 2025-08-08
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Fix encoding of output from `g_print()` and `g_printerr()` when locale =
is set
  to `.utf8` on Windows (#3341, work by Luca Bacci)

* Bugs fixed:
  - #3341 `g_print` and `g_printerr` will cause encoding errors on Window=
s when
    locale is set to `.utf8` (Luca Bacci)
  - #3739 Crash in accept_ready() of GThreadedSocketService Under High Lo=
ad
    (Philip Withnall)
  - #3740 Documentation of g_win32_error_message  does not contain inform=
ation
    about the behaviour when FormatMessageW failed (Philip Withnall)
  - #3755 AIX: Unwanted symbol needs to be removed for AIX platform: getp=
wnam_r,
    getpwuid_r (Parth Patel)
  - !4706 gthreadpool: Clean up when g_thread_pool_new fails
  - !4707 tests: Skip slow mainloop test on valgrind
  - !4708 gfilenamecompleter: Fix g_object_unref() of undefined value
  - !4709 tests: Connect to GMemoryMonitor signals earlier
  - !4712 tests/thread-pool: Add a thread-pool fail test
  - !4713 Fix test error for GMemoryMonitor
  - !4715 gdbuserror: Reformat docs to fully use gi-docgen and match styl=
e guide
  - !4722 tests: Add missing unistd.h header to thread-pool test
  - !4723 tests: Add a missing poll condition to socket-listener test
  - !4724 garray: Pass errors through GByteArray functions
  - !4725 garray: Add checks to g_ptr_array_extend_and_steal
  - !4726 Add a basic GFilenameCompleter test
  - !4728 gbitlock: Fix documentation issues
  - !4729 [RFC] Tests: do not set a timeout in Python tests
  - !4730 gstrfuncs: Always treat G_MININT64 in g_ascii_strtoll
  - !4731 glocalfile: Disable faccessat()-based query_exists on OpenBSD
  - !4733 gvalue: Reformat docs to fully use gi-docgen and match style gu=
ide
  - !4734 gspawn: Improve docstring for g_spawn_async()

Overview of changes in GLib 2.85.2, 2025-07-21
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* New Linux PSI based backend for `GMemoryMonitor` as an option to use in=
stead
  of the existing Low Memory Monitor daemon backend (!4481, work by Kate =
Hsuan)

* Bugs fixed:
  - #1443 Deadlock between g_module_open() and dlopen() when called from =
a
    constructor
  - #2848 Doc: clarification request regarding g_match_info_fetch_pos ret=
urn
    value (Mark Lautman)
  - #3712 Crash in g_thread_pool_new_full
  - #3713 call g_file_enumerator_close in g_file_enumerator_finalize is n=
ot safe
    (fbrouille)
  - #3716 (CVE-2025-7039) (#YWH-PGM9867-104) Buffer Under-read on GLib th=
rough
    glib/gfileutils.c via get_tmp_file() (Michael Catanzaro)
  - #3721 GFile leak in g_local_file_set_display_name during error handli=
ng
    (Philip Withnall, Michael Catanzaro)
  - #3725 Deadlock on source_destroy_lock inside g_main_context_unref() a=
nd
    g_source_destroy() (with child sources) (Matthew Waters)
  - #3726 GApplication sometimes fails to call before_emit (Matthias Clas=
en)
  - !4481 gio: gmemorymonitorpsi: Replace GMemoryMonitor backend with ker=
nel PSI
    event
  - !4665 gio: enums: Fix GBusNameOwnerFlags's annotation
  - !4667 Incorrect output parameter handling in closure helper of
    g_settings_bind_with_mapping_closures
  - !4669 Add missing `(array zero-terminated=3D1)` annotations
  - !4676 Fix IPv6 scope-id from DNS responses being lost
  - !4680 gbacktrace: Correctly wait for children on Unix
  - !4681 (CVE-2025-6052) gstring: Improve
    g_string_expand/g_string_append_len_inline checks
  - !4682 gio-tool-launch: fix %k field code expansion
  - !4683 gio-tool-launch: Fix mismatched curly quotes in translatable st=
rings
  - !4684 garray: Support unallocated zero terminated arrays
  - !4685 garray: Use g_array_elt_len/pos where appropriate
  - !4687 gstring: Fix g_string_append_vprintf overflow
  - !4690 garray: Fix out of boundary write in g_ptr_array_copy
  - !4692 tests: Fix a minor leak in array-test
  - !4693 tests: Loosen string comparison assertion in gio-tool.py
  - !4694 tests: Do not always skip array overflow checks
  - !4695 garray: Add more element_size > 0 checks
  - !4698 garray: Avoid exponential growth in g_array_copy
  - !4699 garray: Set capacity in terminated take functions
  - !4700 gfileutils: Fix OOB read in g_build_path(name)_va
  - !4701 gbacktrace: Fix OOB write in stack_trace
  - !4702 gio/filenamecompleter: Fix leaks
  - !4703 application: NULL check for options
  - !4704 tests: Add a regression test for GApplication command line hand=
ling

Overview of changes in GLib 2.85.1, 2025-06-13
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Re-add the option of a singleton to `GIRepository` (#3664, work by
  Christian Hergert)

* Add support for the `e` flag (O_CLOEXEC) to `g_fopen()` (!4564, work by
  Luca Bacci and Philip Withnall)

* Make the `sysprof` Meson option yield when using GLib as a subproject (=
!4659,
  work by Matthias Clasen)

* Use the Meson built-in `localedir` option (!4661, work by
  Kleis Auke Wolthuizen)

* Bugs fixed:
  - #1665 g_file_trash() should return PERMISSION_DENIED if files can't b=
e
    deleted (Ignacy Kuchci=C5=84ski)
  - #3664 Lack of g_irepository_get_default() equivalent makes cross-libr=
ary
    integration extremely difficult (Christian Hergert)
  - #3698 Misleading autogenerated hints in the documentation of
    g_async_queue_pop() (Alicia Boya Garc=C3=ADa)
  - !4560 glib/gnulib/printf.c: Sync with gnulib
  - !4564 gstdio: Add support for the `e` flag (O_CLOEXEC) to g_fopen()
  - !4637 Rework Windows implementation of g_getenv()
  - !4641 [th/gobj-drop-bit-lock] gobject: drop object_bit_lock() functio=
ns
  - !4642 [th/gobj-empty-notify-queue] gobject: optimize notify-queue han=
dling
    for a single freeze
  - !4643 GRegex: apply monospace typeface in description
  - !4644 gio: add annotations on parameters of 'g_file_monitor_emit_even=
t' and
    of 'g_vfs_get_file_for_path'
  - !4645 gregex: Clarify docs for end_pos
  - !4646 GRegex: update class description
  - !4649 GAsyncQueue: assert non-null data in push_sorted()
  - !4650 tests: Add atomics to asyncqueue test global variables
  - !4651 Meson: Add libglib_static dependency for use in tests
  - !4652 gobject: clarify in documentation that g_value_set_boxed copies
  - !4654 Fix buffer overflow in string-test
  - !4655 gstring: Fix overflow check when expanding the string
  - !4657 docs: Stop hiding the Unix-like APIs which are in Gio-2.0.gir
  - !4658 gmarkup: make documentation more discoverable
  - !4659 Make the sysprof feature yield
  - !4661 meson: Use the appropriate localedir option

Overview of changes in GLib 2.85.0, 2025-05-20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * Preserve mode for existing file when creating a temporary file for ato=
mic
   updates with g_file_set_contents() (dconf#76, work by Wesley Hershberg=
er)

 * Fix race conditions between g_main_context_unref() and g_source_*() me=
thods
   (#803, work by Matthew Waters)

 * Allow file handles inside nested containers when using the `gdbus call=
`
   command (#3624, work by Julian Sparber)

 * Fix DNS resolution of local addresses in offline mode (#3641, work by
   Patrick Griffis)

 * Various performance improvements to GObject locking (various MRs by
   Thomas Haller)

 * Prefer matches occurring earlier in the string when searching
   `GDesktopAppInfo`s, improving search for apps in gnome-shell (!4369, w=
ork by
   Fina Wilke)

 * Fix thread safety of `GClosure` flags (!4575, !4577, work by Sam James=
 and
   Philip Withnall)

* Bugs fixed:
  - GNOME/dconf#76 dconf update can set incorrect permissions to dconf sy=
stem db
    (Wesley Hershberger)
  - #490 Not clearly documented behavior of g_key_file_set_comment functi=
on.
    (marklkram)
  - #803 g_main_context_unref() versus g_source_*() race (Matthew Waters)
  - #1002 GObject doesn't support removing a weak reference in a GWeakNot=
ify for
    the same object
  - #1250 gsocketlistener: Fix IPv4 listen() error-handling resulting in =
use-
    after-free
  - #2377 Document that `g_socket_address_get_native_size()` can return `=
-1` on
    errors
  - #2544 Consider `g_log_always_fatal` for aborting in
    `g_log_structured_array()` (sid)
  - #3405 Enable -Wconversion warnings by default (progress towards this,=
 but it
    is not complete)
  - #3616 docs: Broken link in GioActionEntry (Philip Withnall)
  - #3617 Add generalised version of g_date_get_monday_week_of_year() (Ph=
ilip
    Withnall)
  - #3624 `gdbus call` should look for file handles inside nested contain=
ers
    (Julian Sparber)
  - #3630 2.84.0 build failure on Linux: ../gio/gnetworkmonitornetlink.c:=
47:10:
    fatal error: netlink/netlink_route.h: No such file or directory (Phil=
ip
    Withnall)
  - #3634 test failure with gobject-introspection 1.83.4: warning: elemen=
t
    doc:format from state 3 is unknown, ignoring (Philip Withnall)
  - #3636 gio/trash does not handle special characters well
  - #3641 GResolver: Local DNS resolution failure in offline mode (Patric=
k
    Griffis)
  - #3642 `g_cancellable_connect()` documentation incorrect (Marco Trevis=
an
    (Trevi=C3=B1o))
  - #3643 g_cancellable_connect(): is it safe to unref cancellable from
    callback? (Marco Trevisan (Trevi=C3=B1o))
  - #3649 Crash with some registry key values in GWin32AppInfo (Philip Wi=
thnall)
  - #3656 Set SYSLOG_IDENTIFIER when logging to journald (Axel Karjalaine=
n)
  - #3657 girepository: Wrong typelib path on Windows
  - #3663 Cannot use GZlibCompressor in GTK testsuite (Benjamin Otte)
  - #3684 UAF in GSignalGroup weak notify callbacks (Thomas Haller)
  - #3686 docs.gtk.org doesn't mention that GSourceFuncs.finalize may be =
NULL
    (BZZZZ)
  - #3693 Random failures in debian-i386-stable
  - !4185 [th/gobject-no-object-locks-pt1-notify] use
    `g_datalist_id_update_atomic()` instead of OPTIONAL_BIT_LOCK_NOTIFY
  - !4247 mappedfile: Avoid some allocations
  - !4369 gdesktopappinfo: Prefer matches that occur earlier in the match=
 string
  - !4387 Fix various -Wshorten-64-to-32 warnings
  - !4484 Memory sanitizer fixes
  - !4489 gobject: Be consistent in using atomic logic to handle the
    GParamSpecPool
  - !4520 [th/gdataset-cleanup] minor cleanups of gdataset
  - !4536 [th/gobj-closure-array-atomic] use g_datalist_id_update_atomic(=
) for
    array of closure watches
  - !4541 gsettings: Port docs to gi-docgen format, add missing annotatio=
ns and
    make various improvements
  - !4544 tests: Don't install runner scripts without installed_tests
  - !4545 Update French translation
  - !4547 Update Catalan translation
  - !4548 Update Turkish translation
  - !4551 Updated Danish translation
  - !4552 Update Persian translation
  - !4553 docs: Document GSignalFlags members added after 2.0
  - !4554 Update Indonesian translation
  - !4555 tests: Add a test for g_object_freeze_notify() being called too=
 often
  - !4557 gfileinfo: Slightly expand docs for
    g_file_info_get_attribute_as_string()
  - !4558 gi: Dynamically set doc-format
  - !4561 tests: Various fixes to create temporary files in /tmp rather t=
han the
    build directory
  - !4562 gdbusnameowning: Convert docs to gi-docgen linking syntax
  - !4563 giounix-private: Fix macro for checking for epoll_create1()
  - !4565 Fix LGPL in header
  - !4567 gutils: make documentation of g_set_prgname() clearer
  - !4568 docs: Add some detail
  - !4569 Update Romanian translation
  - !4570 gspawn-win32: Fix potential integer overflows in argv handling
  - !4571 gvarianttype: Improve docs on type validation
  - !4575 gclosure: fix ATOMIC_CHANGE_FIELD to read vint atomically
  - !4577 gclosure: Allow full set of closure flags to be queried atomica=
lly
  - !4578 [th/bit-lock-and-set] bitlock: add g_bit_lock_and_get() and
    g_bit_unlock_and_set() API
  - !4579 tests: Add missing unistd.h include to scannerapi.c
  - !4581 [th/gobj-no-weak-ref-lock] drop OPTIONAL_BIT_LOCK_WEAK_REFS obj=
ect
    lock for `g_object_weak_{ref,unref}()`
  - !4583 thread: fix Linux detection
  - !4585 gfile: Expand documentation around file info for inaccessible f=
iles
  - !4586 [th/gobj-doc-weakref] clear #GWeakRef earlier in
    g_object_run_dispose() and reword docs about #GWeakRef
  - !4588 gstring: carefully handle gssize parameters
  - !4590 Various -Wsign-conversion warning fixes
  - !4591 gthreadedresolver: fix crash in loopback interface check
  - !4592 gstring: Make len_unsigned unsigned
  - !4594 Enable -Wsign-conversion for girepository, gthread, gmodule
  - !4596 docs: Mention how to run the test suite in CONTRIBUTING.md
  - !4598 gtlsconnection: Fix annotation
  - !4599 Mark pointer as (type gpointer)
  - !4601 garray: Fix annotations
  - !4602 docs: fix typo glong: ULONG_MAX -> LONG_MAX
  - !4603 Fix GNetworkMonitorNetlink operation under a FreeBSD jail with =
shared
    network stack
  - !4604 cocoa: add support for GBytesIcon in notification backend
  - !4605 gparamspecs: Use standard min/max constants rather than literal=
s
  - !4606 gobject, girepository: Fix several -Wsign-conversion warnings o=
n macOS
  - !4609 Update Portuguese translation
  - !4610 Update Ukrainian translation
  - !4613 Update macOS job for new CI runner
  - !4615 shell: Handle empty comment gracefully
  - !4619 gslist: Improve documentation for append / prepend / insert met=
hods
  - !4620 glocalfile: Disable faccessat()-based query_exists on Android
  - !4621 gallocator: mark as deprecated
  - !4627 [th/gsignalgroup-dispose] gsignalgroup: make GSignalGroup.dispo=
se() a
    bit more reentrant
  - !4628 [th/gdataset-fix-zero-key] fix and cleanup related to using a z=
ero
    GQuark for keys in GData
  - !4631 Update German translation
  - !4632 win32: Only print one OS version
  - !4633 gzlibcompressor: Convert docs to gi-docgen linking syntax
  - !4638 docs: Fix formatting of definition lists

* Translation updates:
  - Catalan (Jordi Mas)
  - Danish (Ask Hjorth Larsen)
  - French (Vincent Chatelain)
  - German (Philipp Kiemle)
  - Indonesian (Andika Triwidada)
  - Persian (Danial Behzadi)
  - Portuguese (Hugo Carvalho)
  - Romanian (Antonio Marin)
  - Turkish (Sabri =C3=9Cnal)
  - Ukrainian (Yuri Chornoivan)

- remove backport patches

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../glib-2.0/files/CVE-2025-6052-1.patch      | 97 -------------------
 .../glib-2.0/files/CVE-2025-6052-2.patch      | 35 -------
 ...l_2.84.4.bb =3D> glib-2.0-initial_2.86.0.bb} |  0
 ...{glib-2.0_2.84.4.bb =3D> glib-2.0_2.86.0.bb} |  0
 meta/recipes-core/glib-2.0/glib.inc           |  4 +-
 5 files changed, 1 insertion(+), 135 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/files/CVE-2025-6052-1.patc=
h
 delete mode 100644 meta/recipes-core/glib-2.0/files/CVE-2025-6052-2.patc=
h
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.84.4.bb =3D> glib-=
2.0-initial_2.86.0.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.84.4.bb =3D> glib-2.0_2.86=
.0.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/CVE-2025-6052-1.patch b/met=
a/recipes-core/glib-2.0/files/CVE-2025-6052-1.patch
deleted file mode 100644
index a344735ee4..0000000000
--- a/meta/recipes-core/glib-2.0/files/CVE-2025-6052-1.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 6aa97beda32bb337370858862f4efe2f3372619f Mon Sep 17 00:00:00 2001
-From: Tobias Stoeckmann <tobias@stoeckmann.org>
-Date: Mon, 7 Jul 2025 20:52:24 +0200
-Subject: [PATCH] gstring: Fix g_string_sized_new segmentation fault
-
-If glib is compiled with -Dglib_assert=3Dfalse, i.e. no asserts
-enabled, then g_string_sized_new(G_MAXSIZE) leads to a segmentation
-fault due to an out of boundary write.
-
-This happens because the overflow check was moved into
-g_string_maybe_expand which is not called by g_string_sized_new.
-
-By assuming that string->allocated_len is always larger than
-string->len (and the code would be in huge trouble if that is not true),
-the G_UNLIKELY check in g_string_maybe_expand can be rephrased to
-avoid a potential G_MAXSIZE overflow.
-
-This in turn leads to 150-200 bytes smaller compiled library
-depending on gcc and clang versions, and one less check for the most
-common code paths.
-
-Reverts https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4655 and
-reorders internal g_string_maybe_expand check to still fix
-CVE-2025-6052.
-
-CVE: CVE-2025-6052
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
6aa97beda32bb337370858862f4efe2f3372619f]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- glib/gstring.c      | 10 +++++-----
- glib/tests/string.c | 18 ++++++++++++++++++
- 2 files changed, 23 insertions(+), 5 deletions(-)
-
-diff --git a/glib/gstring.c b/glib/gstring.c
-index 010a8e976..24c4bfb40 100644
---- a/glib/gstring.c
-+++ b/glib/gstring.c
-@@ -68,6 +68,10 @@ static void
- g_string_expand (GString *string,
-                  gsize    len)
- {
-+  /* Detect potential overflow */
-+  if G_UNLIKELY ((G_MAXSIZE - string->len - 1) < len)
-+    g_error ("adding %" G_GSIZE_FORMAT " to string would overflow", len=
);
-+
-   string->allocated_len =3D g_nearest_pow (string->len + len + 1);
-   /* If the new size is bigger than G_MAXSIZE / 2, only allocate enough
-    * memory for this string and don't over-allocate.
-@@ -82,11 +86,7 @@ static inline void
- g_string_maybe_expand (GString *string,
-                        gsize    len)
- {
--  /* Detect potential overflow */
--  if G_UNLIKELY ((G_MAXSIZE - string->len - 1) < len)
--    g_error ("adding %" G_GSIZE_FORMAT " to string would overflow", len=
);
--
--  if (G_UNLIKELY (string->len + len >=3D string->allocated_len))
-+  if (G_UNLIKELY (len >=3D string->allocated_len - string->len))
-     g_string_expand (string, len);
- }
-=20
-diff --git a/glib/tests/string.c b/glib/tests/string.c
-index aa363c57a..e3bc4a02e 100644
---- a/glib/tests/string.c
-+++ b/glib/tests/string.c
-@@ -767,6 +767,23 @@ test_string_new_take_null (void)
-   g_string_free (g_steal_pointer (&string), TRUE);
- }
-=20
-+static void
-+test_string_sized_new (void)
-+{
-+
-+  if (g_test_subprocess ())
-+    {
-+      GString *string =3D g_string_sized_new (G_MAXSIZE);
-+      g_string_free (string, TRUE);
-+    }
-+  else
-+    {
-+      g_test_trap_subprocess (NULL, 0, G_TEST_SUBPROCESS_DEFAULT);
-+      g_test_trap_assert_failed ();
-+      g_test_trap_assert_stderr ("*string would overflow*");
-+    }
-+}
-+
- int
- main (int   argc,
-       char *argv[])
-@@ -796,6 +813,7 @@ main (int   argc,
-   g_test_add_func ("/string/test-string-steal", test_string_steal);
-   g_test_add_func ("/string/test-string-new-take", test_string_new_take=
);
-   g_test_add_func ("/string/test-string-new-take/null", test_string_new=
_take_null);
-+  g_test_add_func ("/string/sized-new", test_string_sized_new);
-=20
-   return g_test_run();
- }
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2025-6052-2.patch b/met=
a/recipes-core/glib-2.0/files/CVE-2025-6052-2.patch
deleted file mode 100644
index 703dfdf46c..0000000000
--- a/meta/recipes-core/glib-2.0/files/CVE-2025-6052-2.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 3752760c5091eaed561ec11636b069e529533514 Mon Sep 17 00:00:00 2001
-From: Tobias Stoeckmann <tobias@stoeckmann.org>
-Date: Mon, 7 Jul 2025 20:57:41 +0200
-Subject: [PATCH] gstring: Improve g_string_append_len_inline checks
-
-Use the same style for the G_LIKELY check here as in g_string_sized_new.
-The check could overflow on 32 bit systems.
-
-Also improve the memcpy/memmove check to use memcpy if val itself is
-adjacent to end + len_unsigned, which means that no overlapping exists.
-
-CVE: CVE-2025-6052
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
3752760c5091eaed561ec11636b069e529533514]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- glib/gstring.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/glib/gstring.h b/glib/gstring.h
-index e817176c9..c5e64b33a 100644
---- a/glib/gstring.h
-+++ b/glib/gstring.h
-@@ -232,10 +232,10 @@ g_string_append_len_inline (GString    *gstring,
-   else
-     len_unsigned =3D (gsize) len;
-=20
--  if (G_LIKELY (gstring->len + len_unsigned < gstring->allocated_len))
-+  if (G_LIKELY (len_unsigned < gstring->allocated_len - gstring->len))
-     {
-       char *end =3D gstring->str + gstring->len;
--      if (G_LIKELY (val + len_unsigned <=3D end || val > end + len_unsi=
gned))
-+      if (G_LIKELY (val + len_unsigned <=3D end || val >=3D end + len_u=
nsigned))
-         memcpy (end, val, len_unsigned);
-       else
-         memmove (end, val, len_unsigned);
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.4.bb b/meta=
/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.84.4.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.86.0.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.84.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
index c80396a0f1..f9cb3417ec 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -231,14 +231,12 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-=
${PV}.tar.xz \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-on=
ly-.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.pa=
tch \
            file://skip-timeout.patch \
-           file://CVE-2025-6052-1.patch \
-           file://CVE-2025-6052-2.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pi=
dfd-features-on-native-g.patch \
                               "
=20
-SRC_URI[sha256sum] =3D "8a9ea10943c36fc117e253f80c91e477b673525ae4576294=
2858aef57631bb90"
+SRC_URI[sha256sum] =3D "b5739972d737cfb0d6fd1e7f163dfe650e2e03740bb3b8d4=
08e4d1faea580d6d"
=20
 # Find any meson cross files in FILESPATH that are relevant for the curr=
ent
 # build (using siteinfo) and add them to EXTRA_OEMESON.
--=20
2.50.1


