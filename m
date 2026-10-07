Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4F28CA600C
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 05:48:44 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1829.1791352117751337737
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 22:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=iah25eLK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rF/vq9zl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a114e81618-bbf76308-562a-4d2b-b7f0-7f091a2b68ff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791352116;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=BX+IkzZQ7Ni6ZVXIDeY5g0XuMBNuBYBHtZNgh3PGQdk=;
	b=iah25eLKuG/feJGCVSYQfiAb9mvy5qXX6lrlXxAkdohUG8wnrFV6Q87zlq6tWO1U
	P5Y0PH3J3dQ3mfIjfCHBw8OuYjJxEWD0NnaBIDAOKLZ7oPTNW/dg4RbcLJZGN5uQBLg
	JlIzoL7wGmBsXpoLGrK502EGvvktEv3tQ7GtrN90=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791352116;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=BX+IkzZQ7Ni6ZVXIDeY5g0XuMBNuBYBHtZNgh3PGQdk=;
	b=rF/vq9zlwE0tZv6Mkptgi34s5LJDnm6VEerwfNOjhJuMCvNAHpxAOFwNozu+f0n0
	cO1sAZjIQvWLCZzhKbR3mfsJQeACkS2ylHL0UWn9X30eI2MIHTNQGlmFyDqLPMdzCa9
	P/mRjhzxqU5wRZHzSmPp6s6csinSEZbZ3zmQK+yA=
Content-Type: multipart/mixed; boundary="===============8419304859790431784=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] log4cplus: upgrading to 2.2.1 SUCCEEDED
Message-ID: <010101a114e81618-bbf76308-562a-4d2b-b7f0-7f091a2b68ff-000000@us-west-2.amazonses.com>
Date: Wed, 7 Oct 2026 05:48:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.07-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 05:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247361

--===============8419304859790431784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *log4cplus* to *2.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-log4cplus-upgrade-2.2.0.1-2.2.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 3e1211fb68e3be05318e36b318b14fb4f64fee24 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 7 Oct 2026 05:26:41 +0000
Subject: [PATCH] log4cplus: upgrade 2.2.0.1 -> 2.2.1

# Unreleased (2.2.1)

  - **IMPORTANT**: CMake builds now require CMake 3.20 or later. The
    implementation language remains C++11. GitHub PR #698.

  - **IMPORTANT**: iOS builds now use CMake's native platform support. The
    legacy custom iOS toolchain, `IOS_PLATFORM`/`CMAKE_IOS_*` variables, and
    ARMv7/i386 build scripts have been removed. The obsolete Android
    `LIBRARY_OUTPUT_PATH_ROOT` toolchain integration has also been removed.
    GitHub PR #698.

  - Prevent `DailyRollingFileAppender` process-exit rollover from accessing a
    destroyed directory separator string when `RollOnClose` is enabled. Keep
    the separator valid throughout shutdown by using a constant character.
    GitHub issue #272. GitHub PR #711.

  - Fix `TimeBasedRollingFileAppender` archive cleanup when consecutive
    cleanups cross a partial rollover period, so expired archives are not
    skipped during sparse logging. GitHub issue #634. GitHub PR #687,
    backported in #690. (fhgffy)

  - Fix `TimeBasedRollingFileAppender` rollover when `File` is omitted or
    empty. Keep completed dated files and append to the next `FilenamePattern`
    destination, preserving existing messages during repeated rollover and
    `RollOnClose`. Initial opening still honors `Append`. GitHub issue #668.
    GitHub PR #697.

  - Honor `CreateDirs` for dated archive directories in
    `TimeBasedRollingFileAppender` with a fixed `File`. On rename failure,
    preserve the active log and retry the original archive destination on the
    next eligible event instead of truncating the log. Report rename errors
    through the appender's error handler. GitHub issue #644. GitHub PR #708.

  - Fix `TimeBasedRollingFileAppender` period recovery across sequential
    process restarts. Use the modification time of a nonempty fixed `File`
    opened with `Append=true` to select its archive period, and roll over an
    expired period before writing the first eligible new event. Retain that
    period through stream reopens and failed rollover retries. GitHub issue
    #588. GitHub PR #710.

  - Fix accounting for asynchronous events dropped when the nonblocking thread
    pool queue is full. Appender shutdown and destruction can now finish after
    accepted events drain when `log4cplus.threadPoolBlockOnFull=false`. GitHub
    PR #694.

  - Fix asynchronous event accounting when an accepted nonblocking task
    finishes with an exception before its result is polled. Decrement the
    pending count only once, preventing unsigned underflow and shutdown hangs
    after queued work has drained. GitHub PR #716.

  - Fix `AsyncAppender::close()` to join its queue worker even after the
    worker stops running, so `close()` waits for thread-local cleanup after
    worker failure. Preserve queue draining and the synchronous logging
    fallback. GitHub PR #705.

  - Update the internal ThreadPool to recover safely from worker creation and
    pool growth failures, create one worker when a zero size is requested,
    reclaim retired workers, and wait for complete worker exit during
    shutdown. GitHub issue #646. GitHub PR #701 and ThreadPool PR
    log4cplus/ThreadPool#3.

  - Fix Windows DLL cleanup hangs and crashes during process termination
    through `exit()` or `ExitProcess()`. Skip resource cleanup once Windows
    has started terminating threads. Pending logging may be lost during
    process termination; orderly shutdown still drains accepted events. GitHub
    issue #408. GitHub PR #703.

  - Keep fractional timestamp padding for `%q` and `%Q` valid during startup
    and shutdown by replacing global strings with constant literal tables.
    Preserve the existing formatted output. GitHub issue #273. GitHub PR #714.

  - Fix installed CMake packages to discover `Threads` for static
    multithreaded libraries and provide `log4cplus::log4cplus` for static and
    Unicode builds with decorated library names. Add installed-package
    consumer regression coverage for shared/static and narrow/Unicode
    configurations. GitHub PR #690.

  - Generate CMake pkg-config metadata using the selected library name,
    including static/Unicode decoration and the Windows Debug postfix. Refresh
    the installed metadata when switching build configurations. GitHub PR
    #698.

  - Enable the internal thread pool in the handwritten MSBuild projects,
    restoring asynchronous logging support in both shared and static builds.
    GitHub PR #698.

  - Fix Windows archive-cleanup unit-test compilation and fixture creation.
    Remove an obsolete Win32 stream test source dependency from MinGW
    Autotools builds. GitHub PR #691 and #698.

  - Move Visual Studio 2019 and 2022 CMake/MSBuild CI builds to GitHub Actions
    with explicit `v142`/`v143` toolsets. Retain Visual Studio 2017 on
    AppVeyor and update its CMake installation to satisfy the new minimum
    version. GitHub PR #691 and #699.

  - Support native CMake device and Simulator builds for iOS 15 and la

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../log4cplus/{log4cplus_2.2.0.1.bb => log4cplus_2.2.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/log4cplus/{log4cplus_2.2.0.1.bb => log4cplus_2.2.1.bb} (91%)

diff --git a/meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb b/meta/recipes-devtools/log4cplus/log4cplus_2.2.1.bb
similarity index 91%
rename from meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb
rename to meta/recipes-devtools/log4cplus/log4cplus_2.2.1.bb
index a10dd175a2..6aa29fb953 100644
--- a/meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb
+++ b/meta/recipes-devtools/log4cplus/log4cplus_2.2.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
 GITHUB_TAG = "REL_${@d.getVar('PV').replace('.', '_')}"
 
 SRC_URI = "https://github.com/log4cplus/log4cplus/releases/download/${GITHUB_TAG}/log4cplus-${PV}.tar.gz"
-SRC_URI[sha256sum] = "374175c22fabe752eb1c20138e732b69ae191e641f92d32c9432985cd860a2df"
+SRC_URI[sha256sum] = "e19d9b294f8c4c8f60467e0f456e1a347c81d479369d5840afc80c1137b7db6c"
 
 UPSTREAM_CHECK_URI = "https://github.com/log4cplus/log4cplus/releases"
 UPSTREAM_CHECK_REGEX = "log4cplus-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.47.1


--===============8419304859790431784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/log4cplus/log4cplus-dev: FILELIST: added "/usr/include/log4cplus/androidappender.h"
packages/x86-64-v3-poky-linux/log4cplus/log4cplus: FILELIST: removed "/usr/lib/liblog4cplusU-2.2.so.11.0.0 /usr/lib/liblog4cplus-2.2.so.11.0.0", added "/usr/lib/liblog4cplus-2.2.so.11.1.0 /usr/lib/liblog4cplusU-2.2.so.11.1.0"
Changes to packages/x86-64-v3-poky-linux/log4cplus (sysroot):
  /usr/lib/liblog4cplus-2.2.so.11 changed symlink target from liblog4cplus-2.2.so.11.0.0 to liblog4cplus-2.2.so.11.1.0
  /usr/lib/liblog4cplus.so changed symlink target from liblog4cplus-2.2.so.11.0.0 to liblog4cplus-2.2.so.11.1.0
  /usr/lib/liblog4cplusU-2.2.so.11 changed symlink target from liblog4cplusU-2.2.so.11.0.0 to liblog4cplusU-2.2.so.11.1.0
  /usr/lib/liblog4cplusU.so changed symlink target from liblog4cplusU-2.2.so.11.0.0 to liblog4cplusU-2.2.so.11.1.0
  /usr/lib/liblog4cplus-2.2.so.11.0.0 moved to /usr/lib/liblog4cplus-2.2.so.11.1.0
  /usr/lib/liblog4cplusU-2.2.so.11.0.0 moved to /usr/lib/liblog4cplusU-2.2.so.11.1.0
  /usr/include/log4cplus/androidappender.h was added

--===============8419304859790431784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="log4cplus-changelog.txt"

# Unreleased (2.2.1)

  - **IMPORTANT**: CMake builds now require CMake 3.20 or later. The
    implementation language remains C++11. GitHub PR #698.

  - **IMPORTANT**: iOS builds now use CMake's native platform support. The
    legacy custom iOS toolchain, `IOS_PLATFORM`/`CMAKE_IOS_*` variables, and
    ARMv7/i386 build scripts have been removed. The obsolete Android
    `LIBRARY_OUTPUT_PATH_ROOT` toolchain integration has also been removed.
    GitHub PR #698.

  - Prevent `DailyRollingFileAppender` process-exit rollover from accessing a
    destroyed directory separator string when `RollOnClose` is enabled. Keep
    the separator valid throughout shutdown by using a constant character.
    GitHub issue #272. GitHub PR #711.

  - Fix `TimeBasedRollingFileAppender` archive cleanup when consecutive
    cleanups cross a partial rollover period, so expired archives are not
    skipped during sparse logging. GitHub issue #634. GitHub PR #687,
    backported in #690. (fhgffy)

  - Fix `TimeBasedRollingFileAppender` rollover when `File` is omitted or
    empty. Keep completed dated files and append to the next `FilenamePattern`
    destination, preserving existing messages during repeated rollover and
    `RollOnClose`. Initial opening still honors `Append`. GitHub issue #668.
    GitHub PR #697.

  - Honor `CreateDirs` for dated archive directories in
    `TimeBasedRollingFileAppender` with a fixed `File`. On rename failure,
    preserve the active log and retry the original archive destination on the
    next eligible event instead of truncating the log. Report rename errors
    through the appender's error handler. GitHub issue #644. GitHub PR #708.

  - Fix `TimeBasedRollingFileAppender` period recovery across sequential
    process restarts. Use the modification time of a nonempty fixed `File`
    opened with `Append=true` to select its archive period, and roll over an
    expired period before writing the first eligible new event. Retain that
    period through stream reopens and failed rollover retries. GitHub issue
    #588. GitHub PR #710.

  - Fix accounting for asynchronous events dropped when the nonblocking thread
    pool queue is full. Appender shutdown and destruction can now finish after
    accepted events drain when `log4cplus.threadPoolBlockOnFull=false`. GitHub
    PR #694.

  - Fix asynchronous event accounting when an accepted nonblocking task
    finishes with an exception before its result is polled. Decrement the
    pending count only once, preventing unsigned underflow and shutdown hangs
    after queued work has drained. GitHub PR #716.

  - Fix `AsyncAppender::close()` to join its queue worker even after the
    worker stops running, so `close()` waits for thread-local cleanup after
    worker failure. Preserve queue draining and the synchronous logging
    fallback. GitHub PR #705.

  - Update the internal ThreadPool to recover safely from worker creation and
    pool growth failures, create one worker when a zero size is requested,
    reclaim retired workers, and wait for complete worker exit during
    shutdown. GitHub issue #646. GitHub PR #701 and ThreadPool PR
    log4cplus/ThreadPool#3.

  - Fix Windows DLL cleanup hangs and crashes during process termination
    through `exit()` or `ExitProcess()`. Skip resource cleanup once Windows
    has started terminating threads. Pending logging may be lost during
    process termination; orderly shutdown still drains accepted events. GitHub
    issue #408. GitHub PR #703.

  - Keep fractional timestamp padding for `%q` and `%Q` valid during startup
    and shutdown by replacing global strings with constant literal tables.
    Preserve the existing formatted output. GitHub issue #273. GitHub PR #714.

  - Fix installed CMake packages to discover `Threads` for static
    multithreaded libraries and provide `log4cplus::log4cplus` for static and
    Unicode builds with decorated library names. Add installed-package
    consumer regression coverage for shared/static and narrow/Unicode
    configurations. GitHub PR #690.

  - Generate CMake pkg-config metadata using the selected library name,
    including static/Unicode decoration and the Windows Debug postfix. Refresh
    the installed metadata when switching build configurations. GitHub PR
    #698.

  - Enable the internal thread pool in the handwritten MSBuild projects,
    restoring asynchronous logging support in both shared and static builds.
    GitHub PR #698.

  - Fix Windows archive-cleanup unit-test compilation and fixture creation.
    Remove an obsolete Win32 stream test source dependency from MinGW
    Autotools builds. GitHub PR #691 and #698.

  - Move Visual Studio 2019 and 2022 CMake/MSBuild CI builds to GitHub Actions
    with explicit `v142`/`v143` toolsets. Retain Visual Studio 2017 on
    AppVeyor and update its CMake installation to satisfy the new minimum
    version. GitHub PR #691 and #699.

  - Support native CMake device and Simulator builds for iOS 15 and later. iOS
    builds default to static libraries with tests and the logging server
    disabled, and disable interprocedural optimization so that installed
    archives can be packaged into an XCFramework. GitHub PR #698.

  - Add the Android-only `log4cplus::AndroidAppender`, which writes formatted
    events to Logcat through system `liblog`. Its `Tag` property defaults to
    `log4cplus`; tags and long message chunks preserve UTF-8 boundaries.
    Android production builds now link `liblog`, with static CMake consumers
    receiving the dependency without an absolute NDK path. GitHub PR #698.

  - Modernize Android build and installed-package validation using NDK r29,
    C++11, API level 21, and all four current NDK ABIs. The logging server now
    defaults to disabled on Android. GitHub PR #698.

  - Add iOS archive and XCFramework CI validation. Mobile CI checks
    compilation, linking, installation and packaging, without running device
    tests. GitHub PR #698.

  - Preserve the configured IPv6 setting when `SocketAppender` and
    `SysLogAppender` reconnect. Improve Apple socket portability by preventing
    `SIGPIPE` on socket writes and avoiding descriptor and size narrowing.
    GitHub PR #698.

--===============8419304859790431784==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-log4cplus-upgrade-2.2.0.1-2.2.1.patch"

RnJvbSAzZTEyMTFmYjY4ZTNiZTA1MzE4ZTM2YjMxOGIxNGZiNGY2NGZlZTI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNyBPY3QgMjAyNiAwNToyNjo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxv
ZzRjcGx1czogdXBncmFkZSAyLjIuMC4xIC0+IDIuMi4xCgojIFVucmVsZWFzZWQgKDIuMi4xKQoK
ICAtICoqSU1QT1JUQU5UKio6IENNYWtlIGJ1aWxkcyBub3cgcmVxdWlyZSBDTWFrZSAzLjIwIG9y
IGxhdGVyLiBUaGUKICAgIGltcGxlbWVudGF0aW9uIGxhbmd1YWdlIHJlbWFpbnMgQysrMTEuIEdp
dEh1YiBQUiAjNjk4LgoKICAtICoqSU1QT1JUQU5UKio6IGlPUyBidWlsZHMgbm93IHVzZSBDTWFr
ZSdzIG5hdGl2ZSBwbGF0Zm9ybSBzdXBwb3J0LiBUaGUKICAgIGxlZ2FjeSBjdXN0b20gaU9TIHRv
b2xjaGFpbiwgYElPU19QTEFURk9STWAvYENNQUtFX0lPU18qYCB2YXJpYWJsZXMsIGFuZAogICAg
QVJNdjcvaTM4NiBidWlsZCBzY3JpcHRzIGhhdmUgYmVlbiByZW1vdmVkLiBUaGUgb2Jzb2xldGUg
QW5kcm9pZAogICAgYExJQlJBUllfT1VUUFVUX1BBVEhfUk9PVGAgdG9vbGNoYWluIGludGVncmF0
aW9uIGhhcyBhbHNvIGJlZW4gcmVtb3ZlZC4KICAgIEdpdEh1YiBQUiAjNjk4LgoKICAtIFByZXZl
bnQgYERhaWx5Um9sbGluZ0ZpbGVBcHBlbmRlcmAgcHJvY2Vzcy1leGl0IHJvbGxvdmVyIGZyb20g
YWNjZXNzaW5nIGEKICAgIGRlc3Ryb3llZCBkaXJlY3Rvcnkgc2VwYXJhdG9yIHN0cmluZyB3aGVu
IGBSb2xsT25DbG9zZWAgaXMgZW5hYmxlZC4gS2VlcAogICAgdGhlIHNlcGFyYXRvciB2YWxpZCB0
aHJvdWdob3V0IHNodXRkb3duIGJ5IHVzaW5nIGEgY29uc3RhbnQgY2hhcmFjdGVyLgogICAgR2l0
SHViIGlzc3VlICMyNzIuIEdpdEh1YiBQUiAjNzExLgoKICAtIEZpeCBgVGltZUJhc2VkUm9sbGlu
Z0ZpbGVBcHBlbmRlcmAgYXJjaGl2ZSBjbGVhbnVwIHdoZW4gY29uc2VjdXRpdmUKICAgIGNsZWFu
dXBzIGNyb3NzIGEgcGFydGlhbCByb2xsb3ZlciBwZXJpb2QsIHNvIGV4cGlyZWQgYXJjaGl2ZXMg
YXJlIG5vdAogICAgc2tpcHBlZCBkdXJpbmcgc3BhcnNlIGxvZ2dpbmcuIEdpdEh1YiBpc3N1ZSAj
NjM0LiBHaXRIdWIgUFIgIzY4NywKICAgIGJhY2twb3J0ZWQgaW4gIzY5MC4gKGZoZ2ZmeSkKCiAg
LSBGaXggYFRpbWVCYXNlZFJvbGxpbmdGaWxlQXBwZW5kZXJgIHJvbGxvdmVyIHdoZW4gYEZpbGVg
IGlzIG9taXR0ZWQgb3IKICAgIGVtcHR5LiBLZWVwIGNvbXBsZXRlZCBkYXRlZCBmaWxlcyBhbmQg
YXBwZW5kIHRvIHRoZSBuZXh0IGBGaWxlbmFtZVBhdHRlcm5gCiAgICBkZXN0aW5hdGlvbiwgcHJl
c2VydmluZyBleGlzdGluZyBtZXNzYWdlcyBkdXJpbmcgcmVwZWF0ZWQgcm9sbG92ZXIgYW5kCiAg
ICBgUm9sbE9uQ2xvc2VgLiBJbml0aWFsIG9wZW5pbmcgc3RpbGwgaG9ub3JzIGBBcHBlbmRgLiBH
aXRIdWIgaXNzdWUgIzY2OC4KICAgIEdpdEh1YiBQUiAjNjk3LgoKICAtIEhvbm9yIGBDcmVhdGVE
aXJzYCBmb3IgZGF0ZWQgYXJjaGl2ZSBkaXJlY3RvcmllcyBpbgogICAgYFRpbWVCYXNlZFJvbGxp
bmdGaWxlQXBwZW5kZXJgIHdpdGggYSBmaXhlZCBgRmlsZWAuIE9uIHJlbmFtZSBmYWlsdXJlLAog
ICAgcHJlc2VydmUgdGhlIGFjdGl2ZSBsb2cgYW5kIHJldHJ5IHRoZSBvcmlnaW5hbCBhcmNoaXZl
IGRlc3RpbmF0aW9uIG9uIHRoZQogICAgbmV4dCBlbGlnaWJsZSBldmVudCBpbnN0ZWFkIG9mIHRy
dW5jYXRpbmcgdGhlIGxvZy4gUmVwb3J0IHJlbmFtZSBlcnJvcnMKICAgIHRocm91Z2ggdGhlIGFw
cGVuZGVyJ3MgZXJyb3IgaGFuZGxlci4gR2l0SHViIGlzc3VlICM2NDQuIEdpdEh1YiBQUiAjNzA4
LgoKICAtIEZpeCBgVGltZUJhc2VkUm9sbGluZ0ZpbGVBcHBlbmRlcmAgcGVyaW9kIHJlY292ZXJ5
IGFjcm9zcyBzZXF1ZW50aWFsCiAgICBwcm9jZXNzIHJlc3RhcnRzLiBVc2UgdGhlIG1vZGlmaWNh
dGlvbiB0aW1lIG9mIGEgbm9uZW1wdHkgZml4ZWQgYEZpbGVgCiAgICBvcGVuZWQgd2l0aCBgQXBw
ZW5kPXRydWVgIHRvIHNlbGVjdCBpdHMgYXJjaGl2ZSBwZXJpb2QsIGFuZCByb2xsIG92ZXIgYW4K
ICAgIGV4cGlyZWQgcGVyaW9kIGJlZm9yZSB3cml0aW5nIHRoZSBmaXJzdCBlbGlnaWJsZSBuZXcg
ZXZlbnQuIFJldGFpbiB0aGF0CiAgICBwZXJpb2QgdGhyb3VnaCBzdHJlYW0gcmVvcGVucyBhbmQg
ZmFpbGVkIHJvbGxvdmVyIHJldHJpZXMuIEdpdEh1YiBpc3N1ZQogICAgIzU4OC4gR2l0SHViIFBS
ICM3MTAuCgogIC0gRml4IGFjY291bnRpbmcgZm9yIGFzeW5jaHJvbm91cyBldmVudHMgZHJvcHBl
ZCB3aGVuIHRoZSBub25ibG9ja2luZyB0aHJlYWQKICAgIHBvb2wgcXVldWUgaXMgZnVsbC4gQXBw
ZW5kZXIgc2h1dGRvd24gYW5kIGRlc3RydWN0aW9uIGNhbiBub3cgZmluaXNoIGFmdGVyCiAgICBh
Y2NlcHRlZCBldmVudHMgZHJhaW4gd2hlbiBgbG9nNGNwbHVzLnRocmVhZFBvb2xCbG9ja09uRnVs
bD1mYWxzZWAuIEdpdEh1YgogICAgUFIgIzY5NC4KCiAgLSBGaXggYXN5bmNocm9ub3VzIGV2ZW50
IGFjY291bnRpbmcgd2hlbiBhbiBhY2NlcHRlZCBub25ibG9ja2luZyB0YXNrCiAgICBmaW5pc2hl
cyB3aXRoIGFuIGV4Y2VwdGlvbiBiZWZvcmUgaXRzIHJlc3VsdCBpcyBwb2xsZWQuIERlY3JlbWVu
dCB0aGUKICAgIHBlbmRpbmcgY291bnQgb25seSBvbmNlLCBwcmV2ZW50aW5nIHVuc2lnbmVkIHVu
ZGVyZmxvdyBhbmQgc2h1dGRvd24gaGFuZ3MKICAgIGFmdGVyIHF1ZXVlZCB3b3JrIGhhcyBkcmFp
bmVkLiBHaXRIdWIgUFIgIzcxNi4KCiAgLSBGaXggYEFzeW5jQXBwZW5kZXI6OmNsb3NlKClgIHRv
IGpvaW4gaXRzIHF1ZXVlIHdvcmtlciBldmVuIGFmdGVyIHRoZQogICAgd29ya2VyIHN0b3BzIHJ1
bm5pbmcsIHNvIGBjbG9zZSgpYCB3YWl0cyBmb3IgdGhyZWFkLWxvY2FsIGNsZWFudXAgYWZ0ZXIK
ICAgIHdvcmtlciBmYWlsdXJlLiBQcmVzZXJ2ZSBxdWV1ZSBkcmFpbmluZyBhbmQgdGhlIHN5bmNo
cm9ub3VzIGxvZ2dpbmcKICAgIGZhbGxiYWNrLiBHaXRIdWIgUFIgIzcwNS4KCiAgLSBVcGRhdGUg
dGhlIGludGVybmFsIFRocmVhZFBvb2wgdG8gcmVjb3ZlciBzYWZlbHkgZnJvbSB3b3JrZXIgY3Jl
YXRpb24gYW5kCiAgICBwb29sIGdyb3d0aCBmYWlsdXJlcywgY3JlYXRlIG9uZSB3b3JrZXIgd2hl
biBhIHplcm8gc2l6ZSBpcyByZXF1ZXN0ZWQsCiAgICByZWNsYWltIHJldGlyZWQgd29ya2Vycywg
YW5kIHdhaXQgZm9yIGNvbXBsZXRlIHdvcmtlciBleGl0IGR1cmluZwogICAgc2h1dGRvd24uIEdp
dEh1YiBpc3N1ZSAjNjQ2LiBHaXRIdWIgUFIgIzcwMSBhbmQgVGhyZWFkUG9vbCBQUgogICAgbG9n
NGNwbHVzL1RocmVhZFBvb2wjMy4KCiAgLSBGaXggV2luZG93cyBETEwgY2xlYW51cCBoYW5ncyBh
bmQgY3Jhc2hlcyBkdXJpbmcgcHJvY2VzcyB0ZXJtaW5hdGlvbgogICAgdGhyb3VnaCBgZXhpdCgp
YCBvciBgRXhpdFByb2Nlc3MoKWAuIFNraXAgcmVzb3VyY2UgY2xlYW51cCBvbmNlIFdpbmRvd3MK
ICAgIGhhcyBzdGFydGVkIHRlcm1pbmF0aW5nIHRocmVhZHMuIFBlbmRpbmcgbG9nZ2luZyBtYXkg
YmUgbG9zdCBkdXJpbmcKICAgIHByb2Nlc3MgdGVybWluYXRpb247IG9yZGVybHkgc2h1dGRvd24g
c3RpbGwgZHJhaW5zIGFjY2VwdGVkIGV2ZW50cy4gR2l0SHViCiAgICBpc3N1ZSAjNDA4LiBHaXRI
dWIgUFIgIzcwMy4KCiAgLSBLZWVwIGZyYWN0aW9uYWwgdGltZXN0YW1wIHBhZGRpbmcgZm9yIGAl
cWAgYW5kIGAlUWAgdmFsaWQgZHVyaW5nIHN0YXJ0dXAKICAgIGFuZCBzaHV0ZG93biBieSByZXBs
YWNpbmcgZ2xvYmFsIHN0cmluZ3Mgd2l0aCBjb25zdGFudCBsaXRlcmFsIHRhYmxlcy4KICAgIFBy
ZXNlcnZlIHRoZSBleGlzdGluZyBmb3JtYXR0ZWQgb3V0cHV0LiBHaXRIdWIgaXNzdWUgIzI3My4g
R2l0SHViIFBSICM3MTQuCgogIC0gRml4IGluc3RhbGxlZCBDTWFrZSBwYWNrYWdlcyB0byBkaXNj
b3ZlciBgVGhyZWFkc2AgZm9yIHN0YXRpYwogICAgbXVsdGl0aHJlYWRlZCBsaWJyYXJpZXMgYW5k
IHByb3ZpZGUgYGxvZzRjcGx1czo6bG9nNGNwbHVzYCBmb3Igc3RhdGljIGFuZAogICAgVW5pY29k
ZSBidWlsZHMgd2l0aCBkZWNvcmF0ZWQgbGlicmFyeSBuYW1lcy4gQWRkIGluc3RhbGxlZC1wYWNr
YWdlCiAgICBjb25zdW1lciByZWdyZXNzaW9uIGNvdmVyYWdlIGZvciBzaGFyZWQvc3RhdGljIGFu
ZCBuYXJyb3cvVW5pY29kZQogICAgY29uZmlndXJhdGlvbnMuIEdpdEh1YiBQUiAjNjkwLgoKICAt
IEdlbmVyYXRlIENNYWtlIHBrZy1jb25maWcgbWV0YWRhdGEgdXNpbmcgdGhlIHNlbGVjdGVkIGxp
YnJhcnkgbmFtZSwKICAgIGluY2x1ZGluZyBzdGF0aWMvVW5pY29kZSBkZWNvcmF0aW9uIGFuZCB0
aGUgV2luZG93cyBEZWJ1ZyBwb3N0Zml4LiBSZWZyZXNoCiAgICB0aGUgaW5zdGFsbGVkIG1ldGFk
YXRhIHdoZW4gc3dpdGNoaW5nIGJ1aWxkIGNvbmZpZ3VyYXRpb25zLiBHaXRIdWIgUFIKICAgICM2
OTguCgogIC0gRW5hYmxlIHRoZSBpbnRlcm5hbCB0aHJlYWQgcG9vbCBpbiB0aGUgaGFuZHdyaXR0
ZW4gTVNCdWlsZCBwcm9qZWN0cywKICAgIHJlc3RvcmluZyBhc3luY2hyb25vdXMgbG9nZ2luZyBz
dXBwb3J0IGluIGJvdGggc2hhcmVkIGFuZCBzdGF0aWMgYnVpbGRzLgogICAgR2l0SHViIFBSICM2
OTguCgogIC0gRml4IFdpbmRvd3MgYXJjaGl2ZS1jbGVhbnVwIHVuaXQtdGVzdCBjb21waWxhdGlv
biBhbmQgZml4dHVyZSBjcmVhdGlvbi4KICAgIFJlbW92ZSBhbiBvYnNvbGV0ZSBXaW4zMiBzdHJl
YW0gdGVzdCBzb3VyY2UgZGVwZW5kZW5jeSBmcm9tIE1pbkdXCiAgICBBdXRvdG9vbHMgYnVpbGRz
LiBHaXRIdWIgUFIgIzY5MSBhbmQgIzY5OC4KCiAgLSBNb3ZlIFZpc3VhbCBTdHVkaW8gMjAxOSBh
bmQgMjAyMiBDTWFrZS9NU0J1aWxkIENJIGJ1aWxkcyB0byBHaXRIdWIgQWN0aW9ucwogICAgd2l0
aCBleHBsaWNpdCBgdjE0MmAvYHYxNDNgIHRvb2xzZXRzLiBSZXRhaW4gVmlzdWFsIFN0dWRpbyAy
MDE3IG9uCiAgICBBcHBWZXlvciBhbmQgdXBkYXRlIGl0cyBDTWFrZSBpbnN0YWxsYXRpb24gdG8g
c2F0aXNmeSB0aGUgbmV3IG1pbmltdW0KICAgIHZlcnNpb24uIEdpdEh1YiBQUiAjNjkxIGFuZCAj
Njk5LgoKICAtIFN1cHBvcnQgbmF0aXZlIENNYWtlIGRldmljZSBhbmQgU2ltdWxhdG9yIGJ1aWxk
cyBmb3IgaU9TIDE1IGFuZCBsYQoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVkcyA1
MDAwIGNoYXJhY3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4gYXR0
YWNobWVudCB0byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLi9sb2c0Y3BsdXMve2xvZzRjcGx1c18y
LjIuMC4xLmJiID0+IGxvZzRjcGx1c18yLjIuMS5iYn0gICAgICB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9sb2c0Y3BsdXMve2xvZzRjcGx1c18yLjIuMC4xLmJiID0+IGxvZzRjcGx1c18yLjIu
MS5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbG9nNGNwbHVz
L2xvZzRjcGx1c18yLjIuMC4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xvZzRjcGx1cy9s
b2c0Y3BsdXNfMi4yLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2xvZzRjcGx1cy9sb2c0Y3BsdXNfMi4yLjAuMS5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2xvZzRjcGx1cy9sb2c0Y3BsdXNfMi4yLjEuYmIKaW5kZXgg
YTEwZGQxNzVhMi4uNmFhMjlmYjk1MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2xvZzRjcGx1cy9sb2c0Y3BsdXNfMi4yLjAuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbG9nNGNwbHVzL2xvZzRjcGx1c18yLjIuMS5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT00MWU4ZTA2MGMyNjgyMjg4NmI1OTJhYjQ3
NjVjNzU2YiIKIEdJVEhVQl9UQUcgPSAiUkVMXyR7QGQuZ2V0VmFyKCdQVicpLnJlcGxhY2UoJy4n
LCAnXycpfSIKIAogU1JDX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vbG9nNGNwbHVzL2xvZzRj
cGx1cy9yZWxlYXNlcy9kb3dubG9hZC8ke0dJVEhVQl9UQUd9L2xvZzRjcGx1cy0ke1BWfS50YXIu
Z3oiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzc0MTc1YzIyZmFiZTc1MmViMWMyMDEzOGU3MzJi
NjlhZTE5MWU2NDFmOTJkMzJjOTQzMjk4NWNkODYwYTJkZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICJlMTlkOWIyOTRmOGM0YzhmNjA0NjdlMGY0NTZlMWEzNDdjODFkNDc5MzY5ZDU4NDBhZmM4MGMx
MTM3YjdkYjZjIgogCiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL2xv
ZzRjcGx1cy9sb2c0Y3BsdXMvcmVsZWFzZXMiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJsb2c0
Y3BsdXMtKD9QPHB2ZXI+XGQrKFwuXGQrKSspXC50YXIiCi0tIAoyLjQ3LjEKCg==

--===============8419304859790431784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/log4cplus: PV changed from "2.2.0.1" to "2.2.1"
packages/x86-64-v3-poky-linux/log4cplus: PKGV changed from 2.2.0.1 [default] to 2.2.1 [default]
packages/x86-64-v3-poky-linux/log4cplus: SRC_URI changed from "https://github.com/log4cplus/log4cplus/releases/download/REL_2_2_0_1/log4cplus-2.2.0.1.tar.gz" to "https://github.com/log4cplus/log4cplus/releases/download/REL_2_2_1/log4cplus-2.2.1.tar.gz"
packages/x86-64-v3-poky-linux/log4cplus/log4cplus-dbg: PV changed from "2.2.0.1" to "2.2.1"
packages/x86-64-v3-poky-linux/log4cplus/log4cplus-dbg: PKGV changed from 2.2.0.1 [default] to 2.2.1 [default]
packages/x86-64-v3-poky-linux/log4cplus/log4cplus-dbg: FILELIST: removed "/usr/lib/.debug/liblog4cplusU-2.2.so.11.0.0 /usr/lib/.debug/liblog4cplus-2.2.so.11.0.0", added "/usr/lib/.debug/liblog4cplus-2.2.so.11.1.0 /usr/lib/.debug/liblog4cplusU-2.2.so.11.1.0"
packages/x86-64-v3-poky-linux/log4cplus/log4cplus-dbg: PKGSIZE changed from 22126352 to 21999600 (-1%)
packages/x86-64-v3-poky-linux/log4cplus/log4cplus-dev: PV changed from "2.2.0.1" to "2.2.1"
packages/x86-64-v3-poky-linux/log4cplus/log4cplus-dev: PKGV changed from 2.2.0.1 [default] to 2.2.1 [default]
packages/x86-64-v3-poky-linux/log4cplus/log4cplus-dev: FILELIST: added "/usr/include/log4cplus/androidappender.h"
packages/x86-64-v3-poky-linux/log4cplus/log4cplus-dev: PKGSIZE changed from 439283 to 443351 (+1%)
packages/x86-64-v3-poky-linux/log4cplus/log4cplus-doc: PV changed from "2.2.0.1" to "2.2.1"
packages/x86-64-v3-poky-linux/log4cplus/log4cplus-doc: PKGV changed from 2.2.0.1 [default] to 2.2.1 [default]
packages/x86-64-v3-poky-linux/log4cplus/log4cplus-locale: PV changed from "2.2.0.1" to "2.2.1"
packages/x86-64-v3-poky-linux/log4cplus/log4cplus-locale: PKGV changed from 2.2.0.1 [default] to 2.2.1 [default]
packages/x86-64-v3-poky-linux/log4cplus/log4cplus-src: PV changed from "2.2.0.1" to "2.2.1"
packages/x86-64-v3-poky-linux/log4cplus/log4cplus-src: PKGV changed from 2.2.0.1 [default] to 2.2.1 [default]
packages/x86-64-v3-poky-linux/log4cplus/log4cplus-src: FILELIST: directory renamed /usr/src/debug/log4cplus/2.2.0.1/include/log4cplus/helpers -> /usr/src/debug/log4cplus/2.2.1/include/log4cplus/helpers, directory renamed /usr/src/debug/log4cplus/2.2.0.1/include/log4cplus/spi -> /usr/src/debug/log4cplus/2.2.1/include/log4cplus/spi, directory renamed /usr/src/debug/log4cplus/2.2.0.1/include/log4cplus/thread/impl -> /usr/src/debug/log4cplus/2.2.1/include/log4cplus/thread/impl, directory renamed /usr/src/debug/log4cplus/2.2.0.1/include/log4cplus/thread -> /usr/src/debug/log4cplus/2.2.1/include/log4cplus/thread, directory renamed /usr/src/debug/log4cplus/2.2.0.1/include/log4cplus/internal -> /usr/src/debug/log4cplus/2.2.1/include/log4cplus/internal, directory renamed /usr/src/debug/log4cplus/2.2.0.1/include/log4cplus -> /usr/src/debug/log4cplus/2.2.1/include/log4cplus, directory renamed /usr/src/debug/log4cplus/2.2.0.1/threadpool -> /usr/src/debug/log4cplus/2.2.1/threadpool, removed "/usr
 /src/debug/log4cplus/2.2.0.1/src/logger.cxx /usr/src/debug/log4cplus/2.2.0.1/src/patternlayout.cxx /usr/src/debug/log4cplus/2.2.0.1/src/clogger.cxx /usr/src/debug/log4cplus/2.2.0.1/src/loggingevent.cxx /usr/src/debug/log4cplus/2.2.0.1/src/fileappender.cxx /usr/src/debug/log4cplus/2.2.0.1/src/env.cxx /usr/src/debug/log4cplus/2.2.0.1/src/mdc.cxx /usr/src/debug/log4cplus/2.2.0.1/src/appenderattachableimpl.cxx /usr/src/debug/log4cplus/2.2.0.1/src/ndc.cxx /usr/src/debug/log4cplus/2.2.0.1/src/socket-unix.cxx /usr/src/debug/log4cplus/2.2.0.1/src/syslogappender.cxx /usr/src/debug/log4cplus/2.2.0.1/src/tls.cxx /usr/src/debug/log4cplus/2.2.0.1/src/lockfile.cxx /usr/src/debug/log4cplus/2.2.0.1/src/socket-win32.cxx /usr/src/debug/log4cplus/2.2.0.1/src/rootlogger.cxx /usr/src/debug/log4cplus/2.2.0.1/src/layout.cxx /usr/src/debug/log4cplus/2.2.0.1/src/objectregistry.cxx /usr/src/debug/log4cplus/2.2.0.1/src/stringhelper-iconv.cxx /usr/src/debug/log4cplus/2.2.0.1/src/log4judpappender.cxx /usr/src/d
 ebug/log4cplus/2.2.0.1/src/nullappender.cxx /usr/src/debug/log4cplus/2.2.0.1/src/nteventlogappender.cxx /usr/src/debug/log4cplus/2.2.0.1/src/win32debugappender.cxx /usr/src/debug/log4cplus/2.2.0.1/src/configurator.cxx /usr/src/debug/log4cplus/2.2.0.1/src/fileinfo.cxx /usr/src/debug/log4cplus/2.2.0.1/src/appender.cxx /usr/src/debug/log4cplus/2.2.0.1/src/callbackappender.cxx /usr/src/debug/log4cplus/2.2.0.1/src/property.cxx /usr/src/debug/log4cplus/2.2.0.1/src/timehelper.cxx /usr/src/debug/log4cplus/2.2.0.1/src/eventcounter.cxx /usr/src/debug/log4cplus/2.2.0.1/src/consoleappender.cxx /usr/src/debug/log4cplus/2.2.0.1/src/snprintf.cxx /usr/src/debug/log4cplus/2.2.0.1/src/hierarchylocker.cxx /usr/src/debug/log4cplus/2.2.0.1/src/win32consoleappender.cxx /usr/src/debug/log4cplus/2.2.0.1/src/exception.cxx /usr/src/debug/log4cplus/2.2.0.1/src/asyncappender.cxx /usr/src/debug/log4cplus/2.2.0.1/src/loggerimpl.cxx /usr/src/debug/log4cplus/2.2.0.1/src/loglog.cxx /usr/src/debug/log4cplus/2.2.0.1/
 src/global-init.cxx /usr/src/debug/log4cplus/2.2.0.1/src/loggingmacros.cxx /usr/src/debug/log4cplus/2.2.0.1/src/socketappender.cxx /usr/src/debug/log4cplus/2.2.0.1/src/stringhelper-cxxlocale.cxx /usr/src/debug/log4cplus/2.2.0.1/src/socket.cxx /usr/src/debug/log4cplus/2.2.0.1/src/stringhelper.cxx /usr/src/debug/log4cplus/2.2.0.1/src/pointer.cxx /usr/src/debug/log4cplus/2.2.0.1/src/socketbuffer.cxx /usr/src/debug/log4cplus/2.2.0.1/src/loglevel.cxx /usr/src/debug/log4cplus/2.2.0.1/src/syncprims.cxx /usr/src/debug/log4cplus/2.2.0.1/src/stringhelper-clocale.cxx /usr/src/debug/log4cplus/2.2.0.1/src/hierarchy.cxx /usr/src/debug/log4cplus/2.2.0.1/src/connectorthread.cxx /usr/src/debug/log4cplus/2.2.0.1/src/version.cxx /usr/src/debug/log4cplus/2.2.0.1/src/threads.cxx /usr/src/debug/log4cplus/2.2.0.1/src/filter.cxx /usr/src/debug/log4cplus/2.2.0.1/src/factory.cxx /usr/src/debug/log4cplus/2.2.0.1/src/queue.cxx", added "/usr/src/debug/log4cplus/2.2.1/src/exception.cxx /usr/src/debug/log4cplus/2
 .2.1/src/objectregistry.cxx /usr/src/debug/log4cplus/2.2.1/src/factory.cxx /usr/src/debug/log4cplus/2.2.1/src/fileinfo.cxx /usr/src/debug/log4cplus/2.2.1/src/clogger.cxx /usr/src/debug/log4cplus/2.2.1/src/pointer.cxx /usr/src/debug/log4cplus/2.2.1/src/callbackappender.cxx /usr/src/debug/log4cplus/2.2.1/src/appender.cxx /usr/src/debug/log4cplus/2.2.1/src/property.cxx /usr/src/debug/log4cplus/2.2.1/src/stringhelper-clocale.cxx /usr/src/debug/log4cplus/2.2.1/src/asyncappender.cxx /usr/src/debug/log4cplus/2.2.1/src/queue.cxx /usr/src/debug/log4cplus/2.2.1/src/eventcounter.cxx /usr/src/debug/log4cplus/2.2.1/src/version.cxx /usr/src/debug/log4cplus/2.2.1/src/rootlogger.cxx /usr/src/debug/log4cplus/2.2.1/src/socket-win32.cxx /usr/src/debug/log4cplus/2.2.1/src/socketbuffer.cxx /usr/src/debug/log4cplus/2.2.1/src/stringhelper-cxxlocale.cxx /usr/src/debug/log4cplus/2.2.1/src/hierarchy.cxx /usr/src/debug/log4cplus/2.2.1/src/threads.cxx /usr/src/debug/log4cplus/2.2.1/src/connectorthread.cxx /usr
 /src/debug/log4cplus/2.2.1/src/androidappender.cxx /usr/src/debug/log4cplus/2.2.1/src/global-init.cxx /usr/src/debug/log4cplus/2.2.1/src/loggerimpl.cxx /usr/src/debug/log4cplus/2.2.1/src/env.cxx /usr/src/debug/log4cplus/2.2.1/src/mdc.cxx /usr/src/debug/log4cplus/2.2.1/src/ndc.cxx /usr/src/debug/log4cplus/2.2.1/src/patternlayout.cxx /usr/src/debug/log4cplus/2.2.1/src/syslogappender.cxx /usr/src/debug/log4cplus/2.2.1/src/timehelper.cxx /usr/src/debug/log4cplus/2.2.1/src/tls.cxx /usr/src/debug/log4cplus/2.2.1/src/loglevel.cxx /usr/src/debug/log4cplus/2.2.1/src/loggingevent.cxx /usr/src/debug/log4cplus/2.2.1/src/win32consoleappender.cxx /usr/src/debug/log4cplus/2.2.1/src/layout.cxx /usr/src/debug/log4cplus/2.2.1/src/socket.cxx /usr/src/debug/log4cplus/2.2.1/src/appenderattachableimpl.cxx /usr/src/debug/log4cplus/2.2.1/src/nteventlogappender.cxx /usr/src/debug/log4cplus/2.2.1/src/fileappender.cxx /usr/src/debug/log4cplus/2.2.1/src/nullappender.cxx /usr/src/debug/log4cplus/2.2.1/src/socke
 tappender.cxx /usr/src/debug/log4cplus/2.2.1/src/filter.cxx /usr/src/debug/log4cplus/2.2.1/src/lockfile.cxx /usr/src/debug/log4cplus/2.2.1/src/logger.cxx /usr/src/debug/log4cplus/2.2.1/src/hierarchylocker.cxx /usr/src/debug/log4cplus/2.2.1/src/socket-unix.cxx /usr/src/debug/log4cplus/2.2.1/src/configurator.cxx /usr/src/debug/log4cplus/2.2.1/src/stringhelper.cxx /usr/src/debug/log4cplus/2.2.1/src/syncprims.cxx /usr/src/debug/log4cplus/2.2.1/src/consoleappender.cxx /usr/src/debug/log4cplus/2.2.1/src/snprintf.cxx /usr/src/debug/log4cplus/2.2.1/src/stringhelper-iconv.cxx /usr/src/debug/log4cplus/2.2.1/src/loggingmacros.cxx /usr/src/debug/log4cplus/2.2.1/src/log4judpappender.cxx /usr/src/debug/log4cplus/2.2.1/src/loglog.cxx /usr/src/debug/log4cplus/2.2.1/src/win32debugappender.cxx"
packages/x86-64-v3-poky-linux/log4cplus/log4cplus-src: PKGSIZE changed from 827848 to 906359 (+9%)
packages/x86-64-v3-poky-linux/log4cplus/log4cplus-staticdev: PV changed from "2.2.0.1" to "2.2.1"
packages/x86-64-v3-poky-linux/log4cplus/log4cplus-staticdev: PKGV changed from 2.2.0.1 [default] to 2.2.1 [default]
packages/x86-64-v3-poky-linux/log4cplus/log4cplus: PV changed from "2.2.0.1" to "2.2.1"
packages/x86-64-v3-poky-linux/log4cplus/log4cplus: PKGV changed from 2.2.0.1 [default] to 2.2.1 [default]
packages/x86-64-v3-poky-linux/log4cplus/log4cplus: FILELIST: removed "/usr/lib/liblog4cplusU-2.2.so.11.0.0 /usr/lib/liblog4cplus-2.2.so.11.0.0", added "/usr/lib/liblog4cplus-2.2.so.11.1.0 /usr/lib/liblog4cplusU-2.2.so.11.1.0"
packages/x86-64-v3-poky-linux/log4cplus/log4cplus: PKGSIZE changed from 1672101 to 1659749 (-1%)
Changes to packages/x86-64-v3-poky-linux/log4cplus (sysroot):
  /usr/lib/liblog4cplus-2.2.so.11 changed symlink target from liblog4cplus-2.2.so.11.0.0 to liblog4cplus-2.2.so.11.1.0
  /usr/lib/liblog4cplus.so changed symlink target from liblog4cplus-2.2.so.11.0.0 to liblog4cplus-2.2.so.11.1.0
  /usr/lib/liblog4cplusU-2.2.so.11 changed symlink target from liblog4cplusU-2.2.so.11.0.0 to liblog4cplusU-2.2.so.11.1.0
  /usr/lib/liblog4cplusU.so changed symlink target from liblog4cplusU-2.2.so.11.0.0 to liblog4cplusU-2.2.so.11.1.0
  /usr/lib/liblog4cplus-2.2.so.11.0.0 moved to /usr/lib/liblog4cplus-2.2.so.11.1.0
  /usr/lib/liblog4cplusU-2.2.so.11.0.0 moved to /usr/lib/liblog4cplusU-2.2.so.11.1.0
  /usr/include/log4cplus/androidappender.h was added

--===============8419304859790431784==--

