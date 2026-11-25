Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36437.1795585771272125299
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:49:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=timpjDEx;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XDkOjDfW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a2114083c7-2a4c69e0-3781-41bb-b09f-1dfadc6c535e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795585770;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IOrs2ZGc/3HA5h0hSKShUy9VHyOb+Khl9ARF4ixpLFM=;
	b=timpjDExArVWpTewy/eWINFcXEpACTJQ0bGQZQaGDA0CH82OMR1qYCWy24vPMW6v
	ExpK6foWgEViJBc/gkSrp0HmTppu0ppJRYNgeL1Dyg8nmNWAECW+rSeWuIVLQB/+zwE
	zLsgA6tqx0i6+d7pizraZtpKDGuLplhzO0LtE4pw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795585770;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IOrs2ZGc/3HA5h0hSKShUy9VHyOb+Khl9ARF4ixpLFM=;
	b=XDkOjDfWJb2bZXXekXpBScvCC8oz6z/xPK381dkNg1P1prshUpR3nQkx1zsKlksT
	cRX7Q5YJubUcd655P66ZRObhPBdqk8SHKOCQVvRZThciJ2/LRMKOLwPBP5YUbD8TuqV
	tdUK9nSF4F0E5ic6nPB77NiV3CVZpIV0SK+DAwKY=
Content-Type: multipart/mixed; boundary="===============6888513347962636522=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Thejas Raj <thejas.raj@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pseudo: upgrading to 1.99.2 FAILED
Message-ID: <010101a2114083c7-2a4c69e0-3781-41bb-b09f-1dfadc6c535e-000000@us-west-2.amazonses.com>
Date: Wed, 25 Nov 2026 05:49:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.25-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251153

--===============6888513347962636522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *pseudo* to *1.99.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-pseudo-upgrade-1.99.0-1.99.2.patch
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
From f7d140719df3a7663fca1a99f9091636634443a0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 25 Nov 2026 05:16:59 +0000
Subject: [PATCH] pseudo: upgrade 1.99.0 -> 1.99.2

Makefile.in: call this 1.99.2
Replace FASTOP with requests that don't wait for a reply
Send client requests over one shared datagram socket
pseudo_server: Log when running in a confined SELinux domain
ports/linux: Report SELinux as disabled under pseudo
README.security: Describe io_uring refusal and the host fallback
ports/linux: Refuse io_uring in the kernel rather than be bypassed by it
ports/linux/pseudo_wrappers: Report io_uring as unsupported in syscall()
openat2: Look at dirfd for an empty path
ports/linux: Pass an empty openat() path to the kernel
ports/linux: Wrap name_to_handle_at() and open_by_handle_at()
pseudo_client: Fail when the local state directory isn't writable
ports/linux/pseudo_wrappers: Fake seccomp strict mode in syscall()
ports/linux/pseudo_wrappers: Fake seccomp filters set by prctl()
test-seccomp: Check that seccomp is never really enabled
ports/linux/pseudo_wrappers: Report Landlock as unsupported
pseudo_client: Connect to the server without changing directory
test-landlock: Add a Landlock sandbox test
Wrap execvpe(), fexecve() and execveat()
wrappers: Don't re-block signals in nested wrapper calls
pseudo_util: Skip unneeded lstat calls when canonicalizing paths
configure: Fix the --enable-profiling default
doc: Update README and doc/ to match the code
configure: Require GCC 5 or later
ports/linux: Don't require <linux/mount.h>
pseudo.1: Update to match the current code
pseudo_util: Write the event log to PSEUDO_EVLOG_FILE
pseudo: List -p in the usage message
pseudo_util: Fix the date format in the event log dump
AGENTS.md: Add to assist future developers
pseudo_util: Make -v and numeric PSEUDO_DEBUG add debug flags
pseudo: Fix the -k severity option
pseudo_util: Store PSEUDO_SEVERITY as severity names
pseudo_server: Set highest_client to the new client when growing
pseudo_server: Lower highest_client when the highest client closes
configure: Fix --disable-* options
pseudo_server: Always use epoll
pseudo_server: Drop an idle client when out of file descriptors
pseudo_server: Skip events for clients closed earlier in the batch
ports/linux: Drop redundant PSEUDO_LINK_SYMLINK_BEHAVIOR override
ports/common/subports: Show the unknown OS name in the error
pseudo_util: Remove stale with_libpseudo() comment
Replace #if 0 strerror() debug messages with a comment
Remove unused #if 0 debug code
patches/yocto-older-glibc-symbols.patch: Update to latest YP version
ports: Let the port define how pseudo stats files
ports/unix: Remove guts overridden by the Linux port
ports: Remove PSEUDO_NO_REAL_AT_FUNCTIONS
test-parallel-ops: Add a parallel create/rename/link/chmod test
ports: check created files under the path lock before recording them
ports: hold the path lock in create and metadata wrappers
pseudo_client: serialize path changes across clients
Makefile.in: Declare 1.99.1
README.security: Add information specific to file/process security
test-chroot-proc-dev: Add /proc and /dev within a chroot test
test-proc-fd: Add a stale directory descriptor case
pseudo_client.h: remove dangling pseudo_client_fdpath declaration
pseudo_client: resolve /proc/<pid>/fd/<n> to the descriptor
makewrappers: Allow the wrapper architecture to be set for cross builds
makewrappers: Change 'Warning' to 'Info'
makewrappers: Don't generate unused _int paths with noignore_path
ports: Remove Darwin (macOS) support
test: Skip open_tree tests when the function or syscall is unavailable
ports/linux/guts: Fix uninitialized pseudo_path in open_tree wrappers
---
 .../pseudo/files/older-glibc-symbols.patch    | 57 -------------------
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  5 +-
 2 files changed, 3 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch

diff --git a/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch b/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
deleted file mode 100644
index f42b32b8d9..0000000000
--- a/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-If we link against a newer glibc 2.34 and then try and our LD_PRELOAD is run against a
-binary on a host with an older libc, we see symbol errors since in glibc 2.34, pthread 
-and dl are merged into libc itself.
-
-We need to use the older form of linking so use glibc binaries from an older release
-to force this. We only use minimal symbols from these anyway.
-
-pthread_atfork is problematic, particularly on arm so use the internal glibc routine
-it maps too. This was always present in the main libc from 2.3.2 onwards.
-
-Yes this is horrible. Better solutions welcome.
-
-There is more info in the bug: [YOCTO #14521]
-
-Upstream-Status: Inappropriate [this patch is native and nativesdk]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Tweak library search order, make prebuilt lib ahead of recipe lib
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- Makefile.in       | 2 +-
- pseudo_wrappers.c | 5 ++++-
- 2 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -120,7 +120,7 @@ $(PSEUDODB): pseudodb.o $(SHOBJS) $(DBOBJS) pseudo_ipc.o | $(BIN)
- libpseudo: $(LIBPSEUDO)
- 
- $(LIBPSEUDO): $(WRAPOBJS) pseudo_client.o pseudo_client_scanf.o pseudo_ipc.o $(SHOBJS) | $(LIB)
--	$(CC) $(CFLAGS) $(CFLAGS_PSEUDO) -shared -o $(LIBPSEUDO) \
-+	$(CC) $(CFLAGS)  -Lprebuilt/$(shell uname -m)-linux/lib/ $(CFLAGS_PSEUDO) -shared -o $(LIBPSEUDO) \
- 		pseudo_client.o pseudo_client_scanf.o pseudo_ipc.o \
- 		$(WRAPOBJS) $(SHOBJS) $(LDFLAGS) $(CLIENT_LDFLAGS)
- 
-diff --git a/pseudo_wrappers.c b/pseudo_wrappers.c
---- a/pseudo_wrappers.c
-+++ b/pseudo_wrappers.c
-@@ -100,10 +100,13 @@ static void libpseudo_atfork_child(void)
- 	pseudo_mutex_holder = 0;
- }
- 
-+extern void *__dso_handle;
-+extern int __register_atfork (void (*) (void), void (*) (void), void (*) (void), void *);
-+
- static void
- _libpseudo_init(void) {
- 	if (!_libpseudo_initted)
--		pthread_atfork(NULL, NULL, libpseudo_atfork_child);
-+		__register_atfork (NULL, NULL, libpseudo_atfork_child, &__dso_handle == NULL ? NULL : __dso_handle);
- 
- 	pseudo_getlock();
- 	pseudo_antimagic();
--- 
-2.27.0
-
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index f8903dbb63..94d7d3cd12 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -4,6 +4,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
            file://fallback-passwd \
            file://fallback-group \
            file://0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch \
+           http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=prebuilt \
            "
 SRC_URI:append:class-native = " \
     http://downloads.yoctoproject.org/mirror/sources/pseudo-prebuilt-2.33.tar.xz;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/prebuilt;name=prebuilt \
@@ -13,8 +14,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "75222afce8836d12e58b7e85c2dd6057518257a1"
-PV = "1.99.0+git"
+SRCREV = "f0e39e3c83db4820eef6fcef96bedae057503cf5"
+PV = "1.99.2"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be
-- 
2.47.1


--===============6888513347962636522==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pseudo-upgrade-1.99.0-1.99.2.patch"

RnJvbSBmN2QxNDA3MTlkZjNhNzY2M2ZjYTFhOTlmOTA5MTYzNjYzNDQ0M2EwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjUgTm92IDIwMjYgMDU6MTY6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
c2V1ZG86IHVwZ3JhZGUgMS45OS4wIC0+IDEuOTkuMgoKTWFrZWZpbGUuaW46IGNhbGwgdGhpcyAx
Ljk5LjIKUmVwbGFjZSBGQVNUT1Agd2l0aCByZXF1ZXN0cyB0aGF0IGRvbid0IHdhaXQgZm9yIGEg
cmVwbHkKU2VuZCBjbGllbnQgcmVxdWVzdHMgb3ZlciBvbmUgc2hhcmVkIGRhdGFncmFtIHNvY2tl
dApwc2V1ZG9fc2VydmVyOiBMb2cgd2hlbiBydW5uaW5nIGluIGEgY29uZmluZWQgU0VMaW51eCBk
b21haW4KcG9ydHMvbGludXg6IFJlcG9ydCBTRUxpbnV4IGFzIGRpc2FibGVkIHVuZGVyIHBzZXVk
bwpSRUFETUUuc2VjdXJpdHk6IERlc2NyaWJlIGlvX3VyaW5nIHJlZnVzYWwgYW5kIHRoZSBob3N0
IGZhbGxiYWNrCnBvcnRzL2xpbnV4OiBSZWZ1c2UgaW9fdXJpbmcgaW4gdGhlIGtlcm5lbCByYXRo
ZXIgdGhhbiBiZSBieXBhc3NlZCBieSBpdApwb3J0cy9saW51eC9wc2V1ZG9fd3JhcHBlcnM6IFJl
cG9ydCBpb191cmluZyBhcyB1bnN1cHBvcnRlZCBpbiBzeXNjYWxsKCkKb3BlbmF0MjogTG9vayBh
dCBkaXJmZCBmb3IgYW4gZW1wdHkgcGF0aApwb3J0cy9saW51eDogUGFzcyBhbiBlbXB0eSBvcGVu
YXQoKSBwYXRoIHRvIHRoZSBrZXJuZWwKcG9ydHMvbGludXg6IFdyYXAgbmFtZV90b19oYW5kbGVf
YXQoKSBhbmQgb3Blbl9ieV9oYW5kbGVfYXQoKQpwc2V1ZG9fY2xpZW50OiBGYWlsIHdoZW4gdGhl
IGxvY2FsIHN0YXRlIGRpcmVjdG9yeSBpc24ndCB3cml0YWJsZQpwb3J0cy9saW51eC9wc2V1ZG9f
d3JhcHBlcnM6IEZha2Ugc2VjY29tcCBzdHJpY3QgbW9kZSBpbiBzeXNjYWxsKCkKcG9ydHMvbGlu
dXgvcHNldWRvX3dyYXBwZXJzOiBGYWtlIHNlY2NvbXAgZmlsdGVycyBzZXQgYnkgcHJjdGwoKQp0
ZXN0LXNlY2NvbXA6IENoZWNrIHRoYXQgc2VjY29tcCBpcyBuZXZlciByZWFsbHkgZW5hYmxlZApw
b3J0cy9saW51eC9wc2V1ZG9fd3JhcHBlcnM6IFJlcG9ydCBMYW5kbG9jayBhcyB1bnN1cHBvcnRl
ZApwc2V1ZG9fY2xpZW50OiBDb25uZWN0IHRvIHRoZSBzZXJ2ZXIgd2l0aG91dCBjaGFuZ2luZyBk
aXJlY3RvcnkKdGVzdC1sYW5kbG9jazogQWRkIGEgTGFuZGxvY2sgc2FuZGJveCB0ZXN0CldyYXAg
ZXhlY3ZwZSgpLCBmZXhlY3ZlKCkgYW5kIGV4ZWN2ZWF0KCkKd3JhcHBlcnM6IERvbid0IHJlLWJs
b2NrIHNpZ25hbHMgaW4gbmVzdGVkIHdyYXBwZXIgY2FsbHMKcHNldWRvX3V0aWw6IFNraXAgdW5u
ZWVkZWQgbHN0YXQgY2FsbHMgd2hlbiBjYW5vbmljYWxpemluZyBwYXRocwpjb25maWd1cmU6IEZp
eCB0aGUgLS1lbmFibGUtcHJvZmlsaW5nIGRlZmF1bHQKZG9jOiBVcGRhdGUgUkVBRE1FIGFuZCBk
b2MvIHRvIG1hdGNoIHRoZSBjb2RlCmNvbmZpZ3VyZTogUmVxdWlyZSBHQ0MgNSBvciBsYXRlcgpw
b3J0cy9saW51eDogRG9uJ3QgcmVxdWlyZSA8bGludXgvbW91bnQuaD4KcHNldWRvLjE6IFVwZGF0
ZSB0byBtYXRjaCB0aGUgY3VycmVudCBjb2RlCnBzZXVkb191dGlsOiBXcml0ZSB0aGUgZXZlbnQg
bG9nIHRvIFBTRVVET19FVkxPR19GSUxFCnBzZXVkbzogTGlzdCAtcCBpbiB0aGUgdXNhZ2UgbWVz
c2FnZQpwc2V1ZG9fdXRpbDogRml4IHRoZSBkYXRlIGZvcm1hdCBpbiB0aGUgZXZlbnQgbG9nIGR1
bXAKQUdFTlRTLm1kOiBBZGQgdG8gYXNzaXN0IGZ1dHVyZSBkZXZlbG9wZXJzCnBzZXVkb191dGls
OiBNYWtlIC12IGFuZCBudW1lcmljIFBTRVVET19ERUJVRyBhZGQgZGVidWcgZmxhZ3MKcHNldWRv
OiBGaXggdGhlIC1rIHNldmVyaXR5IG9wdGlvbgpwc2V1ZG9fdXRpbDogU3RvcmUgUFNFVURPX1NF
VkVSSVRZIGFzIHNldmVyaXR5IG5hbWVzCnBzZXVkb19zZXJ2ZXI6IFNldCBoaWdoZXN0X2NsaWVu
dCB0byB0aGUgbmV3IGNsaWVudCB3aGVuIGdyb3dpbmcKcHNldWRvX3NlcnZlcjogTG93ZXIgaGln
aGVzdF9jbGllbnQgd2hlbiB0aGUgaGlnaGVzdCBjbGllbnQgY2xvc2VzCmNvbmZpZ3VyZTogRml4
IC0tZGlzYWJsZS0qIG9wdGlvbnMKcHNldWRvX3NlcnZlcjogQWx3YXlzIHVzZSBlcG9sbApwc2V1
ZG9fc2VydmVyOiBEcm9wIGFuIGlkbGUgY2xpZW50IHdoZW4gb3V0IG9mIGZpbGUgZGVzY3JpcHRv
cnMKcHNldWRvX3NlcnZlcjogU2tpcCBldmVudHMgZm9yIGNsaWVudHMgY2xvc2VkIGVhcmxpZXIg
aW4gdGhlIGJhdGNoCnBvcnRzL2xpbnV4OiBEcm9wIHJlZHVuZGFudCBQU0VVRE9fTElOS19TWU1M
SU5LX0JFSEFWSU9SIG92ZXJyaWRlCnBvcnRzL2NvbW1vbi9zdWJwb3J0czogU2hvdyB0aGUgdW5r
bm93biBPUyBuYW1lIGluIHRoZSBlcnJvcgpwc2V1ZG9fdXRpbDogUmVtb3ZlIHN0YWxlIHdpdGhf
bGlicHNldWRvKCkgY29tbWVudApSZXBsYWNlICNpZiAwIHN0cmVycm9yKCkgZGVidWcgbWVzc2Fn
ZXMgd2l0aCBhIGNvbW1lbnQKUmVtb3ZlIHVudXNlZCAjaWYgMCBkZWJ1ZyBjb2RlCnBhdGNoZXMv
eW9jdG8tb2xkZXItZ2xpYmMtc3ltYm9scy5wYXRjaDogVXBkYXRlIHRvIGxhdGVzdCBZUCB2ZXJz
aW9uCnBvcnRzOiBMZXQgdGhlIHBvcnQgZGVmaW5lIGhvdyBwc2V1ZG8gc3RhdHMgZmlsZXMKcG9y
dHMvdW5peDogUmVtb3ZlIGd1dHMgb3ZlcnJpZGRlbiBieSB0aGUgTGludXggcG9ydApwb3J0czog
UmVtb3ZlIFBTRVVET19OT19SRUFMX0FUX0ZVTkNUSU9OUwp0ZXN0LXBhcmFsbGVsLW9wczogQWRk
IGEgcGFyYWxsZWwgY3JlYXRlL3JlbmFtZS9saW5rL2NobW9kIHRlc3QKcG9ydHM6IGNoZWNrIGNy
ZWF0ZWQgZmlsZXMgdW5kZXIgdGhlIHBhdGggbG9jayBiZWZvcmUgcmVjb3JkaW5nIHRoZW0KcG9y
dHM6IGhvbGQgdGhlIHBhdGggbG9jayBpbiBjcmVhdGUgYW5kIG1ldGFkYXRhIHdyYXBwZXJzCnBz
ZXVkb19jbGllbnQ6IHNlcmlhbGl6ZSBwYXRoIGNoYW5nZXMgYWNyb3NzIGNsaWVudHMKTWFrZWZp
bGUuaW46IERlY2xhcmUgMS45OS4xClJFQURNRS5zZWN1cml0eTogQWRkIGluZm9ybWF0aW9uIHNw
ZWNpZmljIHRvIGZpbGUvcHJvY2VzcyBzZWN1cml0eQp0ZXN0LWNocm9vdC1wcm9jLWRldjogQWRk
IC9wcm9jIGFuZCAvZGV2IHdpdGhpbiBhIGNocm9vdCB0ZXN0CnRlc3QtcHJvYy1mZDogQWRkIGEg
c3RhbGUgZGlyZWN0b3J5IGRlc2NyaXB0b3IgY2FzZQpwc2V1ZG9fY2xpZW50Lmg6IHJlbW92ZSBk
YW5nbGluZyBwc2V1ZG9fY2xpZW50X2ZkcGF0aCBkZWNsYXJhdGlvbgpwc2V1ZG9fY2xpZW50OiBy
ZXNvbHZlIC9wcm9jLzxwaWQ+L2ZkLzxuPiB0byB0aGUgZGVzY3JpcHRvcgptYWtld3JhcHBlcnM6
IEFsbG93IHRoZSB3cmFwcGVyIGFyY2hpdGVjdHVyZSB0byBiZSBzZXQgZm9yIGNyb3NzIGJ1aWxk
cwptYWtld3JhcHBlcnM6IENoYW5nZSAnV2FybmluZycgdG8gJ0luZm8nCm1ha2V3cmFwcGVyczog
RG9uJ3QgZ2VuZXJhdGUgdW51c2VkIF9pbnQgcGF0aHMgd2l0aCBub2lnbm9yZV9wYXRoCnBvcnRz
OiBSZW1vdmUgRGFyd2luIChtYWNPUykgc3VwcG9ydAp0ZXN0OiBTa2lwIG9wZW5fdHJlZSB0ZXN0
cyB3aGVuIHRoZSBmdW5jdGlvbiBvciBzeXNjYWxsIGlzIHVuYXZhaWxhYmxlCnBvcnRzL2xpbnV4
L2d1dHM6IEZpeCB1bmluaXRpYWxpemVkIHBzZXVkb19wYXRoIGluIG9wZW5fdHJlZSB3cmFwcGVy
cwotLS0KIC4uLi9wc2V1ZG8vZmlsZXMvb2xkZXItZ2xpYmMtc3ltYm9scy5wYXRjaCAgICB8IDU3
IC0tLS0tLS0tLS0tLS0tLS0tLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vcHNldWRv
X2dpdC5iYiAgICB8ICA1ICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNTkg
ZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Bz
ZXVkby9maWxlcy9vbGRlci1nbGliYy1zeW1ib2xzLnBhdGNoCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3BzZXVkby9maWxlcy9vbGRlci1nbGliYy1zeW1ib2xzLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BzZXVkby9maWxlcy9vbGRlci1nbGliYy1zeW1ib2xzLnBh
dGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBmNDJiMzJiOGQ5Li4wMDAwMDAwMDAw
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vZmlsZXMvb2xkZXItZ2xpYmMtc3lt
Ym9scy5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDU3ICswLDAgQEAKLUlmIHdlIGxpbmsgYWdh
aW5zdCBhIG5ld2VyIGdsaWJjIDIuMzQgYW5kIHRoZW4gdHJ5IGFuZCBvdXIgTERfUFJFTE9BRCBp
cyBydW4gYWdhaW5zdCBhCi1iaW5hcnkgb24gYSBob3N0IHdpdGggYW4gb2xkZXIgbGliYywgd2Ug
c2VlIHN5bWJvbCBlcnJvcnMgc2luY2UgaW4gZ2xpYmMgMi4zNCwgcHRocmVhZCAKLWFuZCBkbCBh
cmUgbWVyZ2VkIGludG8gbGliYyBpdHNlbGYuCi0KLVdlIG5lZWQgdG8gdXNlIHRoZSBvbGRlciBm
b3JtIG9mIGxpbmtpbmcgc28gdXNlIGdsaWJjIGJpbmFyaWVzIGZyb20gYW4gb2xkZXIgcmVsZWFz
ZQotdG8gZm9yY2UgdGhpcy4gV2Ugb25seSB1c2UgbWluaW1hbCBzeW1ib2xzIGZyb20gdGhlc2Ug
YW55d2F5LgotCi1wdGhyZWFkX2F0Zm9yayBpcyBwcm9ibGVtYXRpYywgcGFydGljdWxhcmx5IG9u
IGFybSBzbyB1c2UgdGhlIGludGVybmFsIGdsaWJjIHJvdXRpbmUKLWl0IG1hcHMgdG9vLiBUaGlz
IHdhcyBhbHdheXMgcHJlc2VudCBpbiB0aGUgbWFpbiBsaWJjIGZyb20gMi4zLjIgb253YXJkcy4K
LQotWWVzIHRoaXMgaXMgaG9ycmlibGUuIEJldHRlciBzb2x1dGlvbnMgd2VsY29tZS4KLQotVGhl
cmUgaXMgbW9yZSBpbmZvIGluIHRoZSBidWc6IFtZT0NUTyAjMTQ1MjFdCi0KLVVwc3RyZWFtLVN0
YXR1czogSW5hcHByb3ByaWF0ZSBbdGhpcyBwYXRjaCBpcyBuYXRpdmUgYW5kIG5hdGl2ZXNka10K
LVNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5k
YXRpb24ub3JnPgotCi1Ud2VhayBsaWJyYXJ5IHNlYXJjaCBvcmRlciwgbWFrZSBwcmVidWlsdCBs
aWIgYWhlYWQgb2YgcmVjaXBlIGxpYgotU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1
LmppYUB3aW5kcml2ZXIuY29tPgotLS0tCi0gTWFrZWZpbGUuaW4gICAgICAgfCAyICstCi0gcHNl
dWRvX3dyYXBwZXJzLmMgfCA1ICsrKystCi0gMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9NYWtlZmlsZS5pbiBiL01ha2VmaWxl
LmluCi0tLS0gYS9NYWtlZmlsZS5pbgotKysrIGIvTWFrZWZpbGUuaW4KLUBAIC0xMjAsNyArMTIw
LDcgQEAgJChQU0VVRE9EQik6IHBzZXVkb2RiLm8gJChTSE9CSlMpICQoREJPQkpTKSBwc2V1ZG9f
aXBjLm8gfCAkKEJJTikKLSBsaWJwc2V1ZG86ICQoTElCUFNFVURPKQotIAotICQoTElCUFNFVURP
KTogJChXUkFQT0JKUykgcHNldWRvX2NsaWVudC5vIHBzZXVkb19jbGllbnRfc2NhbmYubyBwc2V1
ZG9faXBjLm8gJChTSE9CSlMpIHwgJChMSUIpCi0tCSQoQ0MpICQoQ0ZMQUdTKSAkKENGTEFHU19Q
U0VVRE8pIC1zaGFyZWQgLW8gJChMSUJQU0VVRE8pIFwKLSsJJChDQykgJChDRkxBR1MpICAtTHBy
ZWJ1aWx0LyQoc2hlbGwgdW5hbWUgLW0pLWxpbnV4L2xpYi8gJChDRkxBR1NfUFNFVURPKSAtc2hh
cmVkIC1vICQoTElCUFNFVURPKSBcCi0gCQlwc2V1ZG9fY2xpZW50Lm8gcHNldWRvX2NsaWVudF9z
Y2FuZi5vIHBzZXVkb19pcGMubyBcCi0gCQkkKFdSQVBPQkpTKSAkKFNIT0JKUykgJChMREZMQUdT
KSAkKENMSUVOVF9MREZMQUdTKQotIAotZGlmZiAtLWdpdCBhL3BzZXVkb193cmFwcGVycy5jIGIv
cHNldWRvX3dyYXBwZXJzLmMKLS0tLSBhL3BzZXVkb193cmFwcGVycy5jCi0rKysgYi9wc2V1ZG9f
d3JhcHBlcnMuYwotQEAgLTEwMCwxMCArMTAwLDEzIEBAIHN0YXRpYyB2b2lkIGxpYnBzZXVkb19h
dGZvcmtfY2hpbGQodm9pZCkKLSAJcHNldWRvX211dGV4X2hvbGRlciA9IDA7Ci0gfQotIAotK2V4
dGVybiB2b2lkICpfX2Rzb19oYW5kbGU7Ci0rZXh0ZXJuIGludCBfX3JlZ2lzdGVyX2F0Zm9yayAo
dm9pZCAoKikgKHZvaWQpLCB2b2lkICgqKSAodm9pZCksIHZvaWQgKCopICh2b2lkKSwgdm9pZCAq
KTsKLSsKLSBzdGF0aWMgdm9pZAotIF9saWJwc2V1ZG9faW5pdCh2b2lkKSB7Ci0gCWlmICghX2xp
YnBzZXVkb19pbml0dGVkKQotLQkJcHRocmVhZF9hdGZvcmsoTlVMTCwgTlVMTCwgbGlicHNldWRv
X2F0Zm9ya19jaGlsZCk7Ci0rCQlfX3JlZ2lzdGVyX2F0Zm9yayAoTlVMTCwgTlVMTCwgbGlicHNl
dWRvX2F0Zm9ya19jaGlsZCwgJl9fZHNvX2hhbmRsZSA9PSBOVUxMID8gTlVMTCA6IF9fZHNvX2hh
bmRsZSk7Ci0gCi0gCXBzZXVkb19nZXRsb2NrKCk7Ci0gCXBzZXVkb19hbnRpbWFnaWMoKTsKLS0t
IAotMi4yNy4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vcHNl
dWRvX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vcHNldWRvX2dpdC5iYgpp
bmRleCBmODkwM2RiYjYzLi45NGQ3ZDNjZDEyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHNldWRvL3BzZXVkb19naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Bz
ZXVkby9wc2V1ZG9fZ2l0LmJiCkBAIC00LDYgKzQsNyBAQCBTUkNfVVJJID0gImdpdDovL2dpdC55
b2N0b3Byb2plY3Qub3JnL3BzZXVkbzticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKICAg
ICAgICAgICAgZmlsZTovL2ZhbGxiYWNrLXBhc3N3ZCBcCiAgICAgICAgICAgIGZpbGU6Ly9mYWxs
YmFjay1ncm91cCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLW1ha2V3cmFwcGVycy1BbGxvdy10
aGUtd3JhcHBlci1hcmNoaXRlY3R1cmUtdG8tYmUtc2UucGF0Y2ggXAorICAgICAgICAgICBodHRw
Oi8vZG93bmxvYWRzLnlvY3RvcHJvamVjdC5vcmcvbWlycm9yL3NvdXJjZXMvcHNldWRvLXByZWJ1
aWx0LTIuMzMudGFyLnh6O3N1YmRpcj0ke0JCX0dJVF9ERUZBVUxUX0RFU1RTVUZGSVh9L3ByZWJ1
aWx0O25hbWU9cHJlYnVpbHQgXAogICAgICAgICAgICAiCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1u
YXRpdmUgPSAiIFwKICAgICBodHRwOi8vZG93bmxvYWRzLnlvY3RvcHJvamVjdC5vcmcvbWlycm9y
L3NvdXJjZXMvcHNldWRvLXByZWJ1aWx0LTIuMzMudGFyLnh6O3N1YmRpcj0ke0JCX0dJVF9ERUZB
VUxUX0RFU1RTVUZGSVh9L3ByZWJ1aWx0O25hbWU9cHJlYnVpbHQgXApAQCAtMTMsOCArMTQsOCBA
QCBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmVzZGsgPSAiIFwKICAgICBmaWxlOi8vb2xkZXIt
Z2xpYmMtc3ltYm9scy5wYXRjaCIKIFNSQ19VUklbcHJlYnVpbHQuc2hhMjU2c3VtXSA9ICJlZDlm
NDU2ODU2ZTlkODYzNTlmMTY5ZjQ2YTcwYWQ3YmU0MTkwZDYwNDAyODJiODRjOGQ5N2I5OTA3MjQ4
NWFhIgogCi1TUkNSRVYgPSAiNzUyMjJhZmNlODgzNmQxMmU1OGI3ZTg1YzJkZDYwNTc1MTgyNTdh
MSIKLVBWID0gIjEuOTkuMCtnaXQiCitTUkNSRVYgPSAiZjBlMzllM2M4M2RiNDgyMGVlZjZmY2Vm
OTZiZWRhZTA1NzUwM2NmNSIKK1BWID0gIjEuOTkuMiIKIAogIyBsYXJnZWZpbGUgYW5kIDY0Yml0
IHRpbWVfdCBzdXBwb3J0IGFkZHMgdGhlc2UgbWFjcm9zIHZpYSBjb21waWxlciBmbGFncyBnbG9i
YWxseQogIyByZW1vdmUgdGhlbSBmb3IgcHNldWRvIHNpbmNlIHBzZXVkbyBpbnRlcmNlcHRzIHNv
bWUgb2YgdGhlIGZ1bmN0aW9ucyB3aGljaCB3aWxsIGJlCi0tIAoyLjQ3LjEKCg==

--===============6888513347962636522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb: Unable to get checksum for nativesdk-pseudo SRC_URI entry older-glibc-symbols.patch: file could not be found
The following paths were searched:
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo-1.99.2/poky/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo/poky/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/files/poky/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo-1.99.2/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo-1.99.2/x86-64/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo/x86-64/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/files/x86-64/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo-1.99.2/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo/older-glibc-symbols.patch
/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
ERROR: Parsing halted due to errors, see error messages above

--===============6888513347962636522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="pseudo-changelog.txt"

Makefile.in: call this 1.99.2
Replace FASTOP with requests that don't wait for a reply
Send client requests over one shared datagram socket
pseudo_server: Log when running in a confined SELinux domain
ports/linux: Report SELinux as disabled under pseudo
README.security: Describe io_uring refusal and the host fallback
ports/linux: Refuse io_uring in the kernel rather than be bypassed by it
ports/linux/pseudo_wrappers: Report io_uring as unsupported in syscall()
openat2: Look at dirfd for an empty path
ports/linux: Pass an empty openat() path to the kernel
ports/linux: Wrap name_to_handle_at() and open_by_handle_at()
pseudo_client: Fail when the local state directory isn't writable
ports/linux/pseudo_wrappers: Fake seccomp strict mode in syscall()
ports/linux/pseudo_wrappers: Fake seccomp filters set by prctl()
test-seccomp: Check that seccomp is never really enabled
ports/linux/pseudo_wrappers: Report Landlock as unsupported
pseudo_client: Connect to the server without changing directory
test-landlock: Add a Landlock sandbox test
Wrap execvpe(), fexecve() and execveat()
wrappers: Don't re-block signals in nested wrapper calls
pseudo_util: Skip unneeded lstat calls when canonicalizing paths
configure: Fix the --enable-profiling default
doc: Update README and doc/ to match the code
configure: Require GCC 5 or later
ports/linux: Don't require <linux/mount.h>
pseudo.1: Update to match the current code
pseudo_util: Write the event log to PSEUDO_EVLOG_FILE
pseudo: List -p in the usage message
pseudo_util: Fix the date format in the event log dump
AGENTS.md: Add to assist future developers
pseudo_util: Make -v and numeric PSEUDO_DEBUG add debug flags
pseudo: Fix the -k severity option
pseudo_util: Store PSEUDO_SEVERITY as severity names
pseudo_server: Set highest_client to the new client when growing
pseudo_server: Lower highest_client when the highest client closes
configure: Fix --disable-* options
pseudo_server: Always use epoll
pseudo_server: Drop an idle client when out of file descriptors
pseudo_server: Skip events for clients closed earlier in the batch
ports/linux: Drop redundant PSEUDO_LINK_SYMLINK_BEHAVIOR override
ports/common/subports: Show the unknown OS name in the error
pseudo_util: Remove stale with_libpseudo() comment
Replace #if 0 strerror() debug messages with a comment
Remove unused #if 0 debug code
patches/yocto-older-glibc-symbols.patch: Update to latest YP version
ports: Let the port define how pseudo stats files
ports/unix: Remove guts overridden by the Linux port
ports: Remove PSEUDO_NO_REAL_AT_FUNCTIONS
test-parallel-ops: Add a parallel create/rename/link/chmod test
ports: check created files under the path lock before recording them
ports: hold the path lock in create and metadata wrappers
pseudo_client: serialize path changes across clients
Makefile.in: Declare 1.99.1
README.security: Add information specific to file/process security
test-chroot-proc-dev: Add /proc and /dev within a chroot test
test-proc-fd: Add a stale directory descriptor case
pseudo_client.h: remove dangling pseudo_client_fdpath declaration
pseudo_client: resolve /proc/<pid>/fd/<n> to the descriptor
makewrappers: Allow the wrapper architecture to be set for cross builds
makewrappers: Change 'Warning' to 'Info'
makewrappers: Don't generate unused _int paths with noignore_path
ports: Remove Darwin (macOS) support
test: Skip open_tree tests when the function or syscall is unavailable
ports/linux/guts: Fix uninitialized pseudo_path in open_tree wrappers

--===============6888513347962636522==--
