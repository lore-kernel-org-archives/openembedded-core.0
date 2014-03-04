Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6674D6EEDC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 19:21:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Mar 2014 11:21:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,587,1389772800"; d="scan'208";a="486011598"
Received: from unknown (HELO [10.255.14.19]) ([10.255.14.19])
	by fmsmga001.fm.intel.com with ESMTP; 04 Mar 2014 11:21:05 -0800
Message-ID: <531627A0.7030802@linux.intel.com>
Date: Tue, 04 Mar 2014 11:21:04 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, 
 openembedded-core@lists.openembedded.org
References: <1393819222-9697-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1393819222-9697-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] Upgrade to systemd-stable v208
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
X-List-Received-Date: Tue, 04 Mar 2014 19:21:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/02/2014 08:00 PM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   ...-Use-bin-mkdir-instead-of-host-mkdir-path.patch | 31 --------
>   ...ournal-Add-missing-byte-order-conversions.patch | 60 ----------------
>   .../journal-file-protect-against-alloca-0.patch    | 23 ------
>   ...n-appending-to-journal-file-allocate-larg.patch | 83 ----------------------
>   .../systemd/journald-add-missing-error-check.patch | 16 -----
>   .../systemd/journald-fix-minor-memory-leak.patch   | 16 -----
>   .../systemd/systemd-pam-fix-fallocate.patch        | 24 +++----
>   meta/recipes-core/systemd/systemd_208.bb           | 17 ++---
>   8 files changed, 19 insertions(+), 251 deletions(-)
>   delete mode 100644 meta/recipes-core/systemd/systemd/0001-Use-bin-mkdir-instead-of-host-mkdir-path.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/journal-Add-missing-byte-order-conversions.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/journal-file-protect-against-alloca-0.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/journal-when-appending-to-journal-file-allocate-larg.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/journald-add-missing-error-check.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/journald-fix-minor-memory-leak.patch
>

This still has an issue with ptest enabled
install 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/Makefile 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/README.testsuite 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/TEST-01-BASIC 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/TEST-02-CRYPTSETUP 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/TEST-03-JOBS 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/a.service 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/b.service 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/c.service 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/d.service 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/e.service 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/end.service 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/f.service 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/g.service 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/h.service 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/hello-after-sleep.target 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/hello.service 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/rule-syntax-check.py 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/rules-test.sh 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/sched_idle_bad.service 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/sched_idle_ok.service 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/sched_rr_bad.service 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/sched_rr_change.service 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/sched_rr_ok.service 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/sleep.service 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/sys.tar.xz 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/test-functions 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/testsuite.target 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/udev-test.pl 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/git/test/unstoppable.service 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/image/usr/lib/systemd/ptest/test
ERROR: Function failed: do_install_ptest_base (log file is located at 
/srv/hdd/builds/world/tmp/work/ppc7400-poky-linux/systemd/1_208+gitAUTOINC+255eb046a7-r0/temp/log.do_install_ptest_base.9647)

Thanks
	Sau!


> diff --git a/meta/recipes-core/systemd/systemd/0001-Use-bin-mkdir-instead-of-host-mkdir-path.patch b/meta/recipes-core/systemd/systemd/0001-Use-bin-mkdir-instead-of-host-mkdir-path.patch
> deleted file mode 100644
> index 25988fc..0000000
> --- a/meta/recipes-core/systemd/systemd/0001-Use-bin-mkdir-instead-of-host-mkdir-path.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 5599ab4ae3fe74cdd9699f2874badf241f0148fe Mon Sep 17 00:00:00 2001
> -From: Jonathan Liu <net147@gmail.com>
> -Date: Wed, 28 Aug 2013 19:09:49 -0700
> -Subject: [PATCH] Use /bin/mkdir instead of host mkdir path
> -
> -If the host system has /usr/bin/mkdir, autoconf would set MKDIR_P to
> -/usr/bin/mkdir when it should be /bin/mkdir. As a result, the
> -kmod-static-nodes service fails to start on the target because
> -/usr/bin/mkdir doesn't exist. This has been observed when building
> -systemd on Arch Linux host.
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -Signed-off-by: Jonathan Liu <net147@gmail.com>
> ----
> - units/kmod-static-nodes.service.in | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/units/kmod-static-nodes.service.in b/units/kmod-static-nodes.service.in
> -index d8a8420..1daed5f 100644
> ---- a/units/kmod-static-nodes.service.in
> -+++ b/units/kmod-static-nodes.service.in
> -@@ -14,5 +14,5 @@ ConditionCapability=CAP_MKNOD
> - [Service]
> - Type=oneshot
> - RemainAfterExit=yes
> --ExecStartPre=@MKDIR_P@ /run/tmpfiles.d
> -+ExecStartPre=/bin/mkdir -p /run/tmpfiles.d
> - ExecStart=@KMOD@ static-nodes --format=tmpfiles --output=/run/tmpfiles.d/kmod.conf
> ---
> -1.8.3.4
> -
> diff --git a/meta/recipes-core/systemd/systemd/journal-Add-missing-byte-order-conversions.patch b/meta/recipes-core/systemd/systemd/journal-Add-missing-byte-order-conversions.patch
> deleted file mode 100644
> index 21ea0f9..0000000
> --- a/meta/recipes-core/systemd/systemd/journal-Add-missing-byte-order-conversions.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -From 43539d6b60ef0db3e98d00bef0024614c8c1807a Mon Sep 17 00:00:00 2001
> -From: George McCollister <george.mccollister@gmail.com>
> -Date: Tue, 31 Dec 2013 14:37:32 -0600
> -Subject: [PATCH] journal: Add missing byte order conversions
> -
> -Convert entry_array.items[0] to host byte order prior to passing it to
> -chain_cache_put().
> -
> -[zj: also use le64toh in journal-verify.c]
> -
> -https://bugs.freedesktop.org/show_bug.cgi?id=73194
> -
> -Upstream-Status: Backport [Fedora]
> ----
> - src/journal/journal-file.c   | 4 ++--
> - src/journal/journal-verify.c | 6 +++---
> - 2 files changed, 5 insertions(+), 5 deletions(-)
> -
> -Index: systemd-208/src/journal/journal-file.c
> -===================================================================
> ---- systemd-208.orig/src/journal/journal-file.c	2014-02-07 22:51:44.000000000 -0800
> -+++ systemd-208/src/journal/journal-file.c	2014-02-07 22:58:40.665062951 -0800
> -@@ -1447,7 +1447,7 @@
> -
> - found:
> -         /* Let's cache this item for the next invocation */
> --        chain_cache_put(f->chain_cache, ci, first, a, o->entry_array.items[0], t);
> -+        chain_cache_put(f->chain_cache, ci, first, a, le64toh(o->entry_array.items[0]), t);
> -
> -         r = journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
> -         if (r < 0)
> -@@ -1624,7 +1624,7 @@
> -                 return 0;
> -
> -         /* Let's cache this item for the next invocation */
> --        chain_cache_put(f->chain_cache, ci, first, a, array->entry_array.items[0], t);
> -+        chain_cache_put(f->chain_cache, ci, first, a, le64toh(array->entry_array.items[0]), t);
> -
> -         if (subtract_one && i == 0)
> -                 p = last_p;
> -Index: systemd-208/src/journal/journal-verify.c
> -===================================================================
> ---- systemd-208.orig/src/journal/journal-verify.c	2013-08-13 13:02:46.000000000 -0700
> -+++ systemd-208/src/journal/journal-verify.c	2014-02-07 22:57:14.849308409 -0800
> -@@ -249,12 +249,12 @@
> -                 }
> -
> -                 for (i = 0; i < journal_file_entry_array_n_items(o); i++)
> --                        if (o->entry_array.items[i] != 0 &&
> --                            !VALID64(o->entry_array.items[i])) {
> -+                        if (le64toh(o->entry_array.items[i]) != 0 &&
> -+                            !VALID64(le64toh(o->entry_array.items[i]))) {
> -                                 log_error(OFSfmt": invalid object entry array item (%"PRIu64"/%"PRIu64"): "OFSfmt,
> -                                           offset,
> -                                           i, journal_file_entry_array_n_items(o),
> --                                          o->entry_array.items[i]);
> -+                                          le64toh(o->entry_array.items[i]));
> -                                 return -EBADMSG;
> -                         }
> -
> diff --git a/meta/recipes-core/systemd/systemd/journal-file-protect-against-alloca-0.patch b/meta/recipes-core/systemd/systemd/journal-file-protect-against-alloca-0.patch
> deleted file mode 100644
> index 953373e..0000000
> --- a/meta/recipes-core/systemd/systemd/journal-file-protect-against-alloca-0.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -From a25fd0d4bd3cf652e55c24e7dc873fe530fa111a Mon Sep 17 00:00:00 2001
> -From: Thomas Hindoe Paaboel Andersen <phomes@gmail.com>
> -Date: Mon, 16 Dec 2013 23:35:30 +0100
> -Subject: [PATCH] journal-file: protect against alloca(0)
> -
> ----
> - src/journal/journal-file.c | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/journal/journal-file.c b/src/journal/journal-file.c
> -index 090cf97..8ea258b 100644
> ---- a/src/journal/journal-file.c
> -+++ b/src/journal/journal-file.c
> -@@ -2737,7 +2737,8 @@ int journal_file_copy_entry(JournalFile *from, JournalFile *to, Object *o, uint6
> -         ts.realtime = le64toh(o->entry.realtime);
> -
> -         n = journal_file_entry_n_items(o);
> --        items = alloca(sizeof(EntryItem) * n);
> -+        /* alloca() can't take 0, hence let's allocate at least one */
> -+        items = alloca(sizeof(EntryItem) * MAX(1u, n));
> -
> -         for (i = 0; i < n; i++) {
> -                 uint64_t l, h;
> diff --git a/meta/recipes-core/systemd/systemd/journal-when-appending-to-journal-file-allocate-larg.patch b/meta/recipes-core/systemd/systemd/journal-when-appending-to-journal-file-allocate-larg.patch
> deleted file mode 100644
> index 89573bb..0000000
> --- a/meta/recipes-core/systemd/systemd/journal-when-appending-to-journal-file-allocate-larg.patch
> +++ /dev/null
> @@ -1,83 +0,0 @@
> -From c0658e1948c301177b1527227be0c18932cd7cce Mon Sep 17 00:00:00 2001
> -From: Lennart Poettering <lennart@poettering.net>
> -Date: Tue, 26 Nov 2013 18:39:42 +0100
> -Subject: [PATCH] journal: when appending to journal file, allocate larger
> - blocks at once
> -
> -(cherry picked from commit a676e66535e12458ea6d366a653f8dd60f982504)
> -
> -Conflicts:
> -	src/journal/journal-file.c
> ----
> - src/journal/journal-file.c | 26 +++++++++++++++++---------
> - 1 file changed, 17 insertions(+), 9 deletions(-)
> -
> -Upstream-Status: Backport
> -
> -Index: systemd-208/src/journal/journal-file.c
> -===================================================================
> ---- systemd-208.orig/src/journal/journal-file.c	2014-02-07 22:37:06.013722798 -0800
> -+++ systemd-208/src/journal/journal-file.c	2014-02-07 22:44:51.563341090 -0800
> -@@ -68,6 +68,9 @@
> - /* How many entries to keep in the entry array chain cache at max */
> - #define CHAIN_CACHE_MAX 20
> -
> -+/* How much to increase the journal file size at once each time we allocate something new. */
> -+#define FILE_SIZE_INCREASE (8ULL*1024ULL*1024ULL)              /* 8MB */
> -+
> - int journal_file_set_online(JournalFile *f) {
> -         assert(f);
> -
> -@@ -218,8 +221,7 @@
> -         journal_file_set_online(f);
> -
> -         /* Sync the online state to disk */
> --        msync(f->header, PAGE_ALIGN(sizeof(Header)), MS_SYNC);
> --        fdatasync(f->fd);
> -+        fsync(f->fd);
> -
> -         return 0;
> - }
> -@@ -313,7 +315,7 @@
> - }
> -
> - static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size) {
> --        uint64_t old_size, new_size;
> -+        uint64_t old_size, new_size, file_size;
> -         int r;
> -
> -         assert(f);
> -@@ -333,12 +335,10 @@
> -         if (new_size <= old_size)
> -                 return 0;
> -
> --        if (f->metrics.max_size > 0 &&
> --            new_size > f->metrics.max_size)
> -+        if (f->metrics.max_size > 0 && new_size > f->metrics.max_size)
> -                 return -E2BIG;
> -
> --        if (new_size > f->metrics.min_size &&
> --            f->metrics.keep_free > 0) {
> -+        if (new_size > f->metrics.min_size && f->metrics.keep_free > 0) {
> -                 struct statvfs svfs;
> -
> -                 if (fstatvfs(f->fd, &svfs) >= 0) {
> -@@ -363,8 +363,16 @@
> -         if (r != 0)
> -                 return -r;
> -
> --        if (fstat(f->fd, &f->last_stat) < 0)
> --                return -errno;
> -+        /* Increase the file size a bit further than this, so that we
> -+         * we can create larger memory maps to cache */
> -+        file_size = ((new_size+FILE_SIZE_INCREASE-1) / FILE_SIZE_INCREASE) * FILE_SIZE_INCREASE;
> -+        if (file_size > (uint64_t) f->last_stat.st_size) {
> -+                if (file_size > new_size)
> -+                        ftruncate(f->fd, file_size);
> -+
> -+                if (fstat(f->fd, &f->last_stat) < 0)
> -+                        return -errno;
> -+        }
> -
> -         f->header->arena_size = htole64(new_size - le64toh(f->header->header_size));
> -
> diff --git a/meta/recipes-core/systemd/systemd/journald-add-missing-error-check.patch b/meta/recipes-core/systemd/systemd/journald-add-missing-error-check.patch
> deleted file mode 100644
> index 10590e1..0000000
> --- a/meta/recipes-core/systemd/systemd/journald-add-missing-error-check.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Upstream-Status: Backport [Fedora]
> -
> -Index: systemd-208/src/journal/journal-file.c
> -===================================================================
> ---- systemd-208.orig/src/journal/journal-file.c	2013-08-13 13:02:46.397707086 -0700
> -+++ systemd-208/src/journal/journal-file.c	2014-02-07 22:29:01.398794277 -0800
> -@@ -907,7 +907,8 @@
> -
> -         osize = offsetof(Object, field.payload) + size;
> -         r = journal_file_append_object(f, OBJECT_FIELD, osize, &o, &p);
> --
> -+	if (r < 0)
> -+		return r;
> -         o->field.hash = htole64(hash);
> -         memcpy(o->field.payload, field, size);
> -
> diff --git a/meta/recipes-core/systemd/systemd/journald-fix-minor-memory-leak.patch b/meta/recipes-core/systemd/systemd/journald-fix-minor-memory-leak.patch
> deleted file mode 100644
> index 9b90ed2..0000000
> --- a/meta/recipes-core/systemd/systemd/journald-fix-minor-memory-leak.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Fix minor memory leak
> -
> -Upstream-Status: Backport [Fedora]
> -
> -Index: systemd-208/src/journal/journal-vacuum.c
> -===================================================================
> ---- systemd-208.orig/src/journal/journal-vacuum.c	2013-09-12 05:51:57.258256643 -0700
> -+++ systemd-208/src/journal/journal-vacuum.c	2014-02-07 22:35:55.695747001 -0800
> -@@ -277,6 +277,7 @@
> -                                 freed += size;
> -                         } else if (errno != ENOENT)
> -                                 log_warning("Failed to delete %s/%s: %m", directory, p);
> -+			free(p);
> -
> -                         continue;
> -                 }
> diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
> index d1740ef..05223d3 100644
> --- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
> +++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
> @@ -1,10 +1,10 @@
>   Upstream-Status: Denied [no desire for uclibc support]
>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> -Index: systemd-208/src/journal/journal-file.c
> +Index: git/src/journal/journal-file.c
>   ===================================================================
> ---- systemd-208.orig/src/journal/journal-file.c	2014-02-14 00:05:05.000000000 -0800
> -+++ systemd-208/src/journal/journal-file.c	2014-02-14 00:08:41.338821677 -0800
> +--- git.orig/src/journal/journal-file.c	2014-03-02 16:25:38.000000000 -0800
> ++++ git/src/journal/journal-file.c	2014-03-02 16:27:24.151238740 -0800
>   @@ -38,6 +38,8 @@
>    #include "compress.h"
>    #include "fsprg.h"
> @@ -17,13 +17,13 @@ Index: systemd-208/src/journal/journal-file.c
>   @@ -316,7 +318,7 @@
>
>    static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size) {
> -         uint64_t old_size, new_size, file_size;
> +         uint64_t old_size, new_size;
>   -        int r;
>   +        int r = 0;
>
>            assert(f);
>
> -@@ -359,9 +361,24 @@
> +@@ -364,9 +366,24 @@
>            /* Note that the glibc fallocate() fallback is very
>               inefficient, hence we try to minimize the allocation area
>               as we can. */
> @@ -46,13 +46,13 @@ Index: systemd-208/src/journal/journal-file.c
>   +               return -errno;
>   +#endif /* HAVE_POSIX_FALLOCATE */
>
> -         /* Increase the file size a bit further than this, so that we
> -          * we can create larger memory maps to cache */
> -Index: systemd-208/src/journal/journald-kmsg.c
> +         if (fstat(f->fd, &f->last_stat) < 0)
> +                 return -errno;
> +Index: git/src/journal/journald-kmsg.c
>   ===================================================================
> ---- systemd-208.orig/src/journal/journald-kmsg.c	2014-02-14 00:05:05.000000000 -0800
> -+++ systemd-208/src/journal/journald-kmsg.c	2014-02-14 00:05:47.498823000 -0800
> -@@ -407,6 +407,7 @@
> +--- git.orig/src/journal/journald-kmsg.c	2014-03-02 16:25:38.000000000 -0800
> ++++ git/src/journal/journald-kmsg.c	2014-03-02 16:26:35.419237826 -0800
> +@@ -408,6 +408,7 @@
>
>    int server_open_kernel_seqnum(Server *s) {
>            int fd;
> @@ -60,7 +60,7 @@ Index: systemd-208/src/journal/journald-kmsg.c
>            uint64_t *p;
>
>            assert(s);
> -@@ -420,8 +421,19 @@
> +@@ -421,8 +422,19 @@
>                    log_error("Failed to open /run/systemd/journal/kernel-seqnum, ignoring: %m");
>                    return 0;
>            }
> diff --git a/meta/recipes-core/systemd/systemd_208.bb b/meta/recipes-core/systemd/systemd_208.bb
> index 1bcedaa..6762173 100644
> --- a/meta/recipes-core/systemd/systemd_208.bb
> +++ b/meta/recipes-core/systemd/systemd_208.bb
> @@ -17,22 +17,20 @@ SECTION = "base/shell"
>
>   inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest
>
> -SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
> -           file://0001-Use-bin-mkdir-instead-of-host-mkdir-path.patch \
> +SRCREV = "255eb046a7bcb90e60a3a54302bc1250c1aed26a"
> +
> +PV = "208+git${SRCPV}"
> +
> +SRC_URI = "git://anongit.freedesktop.org/systemd/systemd-stable;branch=v208-stable;protocol=git \
>              file://binfmt-install.patch \
> -           file://journald-add-missing-error-check.patch \
> -           file://journald-fix-minor-memory-leak.patch \
> -           file://journal-when-appending-to-journal-file-allocate-larg.patch \
> -           file://journal-file-protect-against-alloca-0.patch \
> -           file://journal-Add-missing-byte-order-conversions.patch \
>              file://touchscreen.rules \
>              ${UCLIBCPATCHES} \
>              file://00-create-volatile.conf \
>              file://init \
>              file://run-ptest \
>             "
> -SRC_URI[md5sum] = "df64550d92afbffb4f67a434193ee165"
> -SRC_URI[sha256sum] = "aa64fa864466fd5727005c55d61c092828b94b4f857272c0b503695022146390"
> +
> +S = "${WORKDIR}/git"
>
>   UCLIBCPATCHES = ""
>   UCLIBCPATCHES_libc-uclibc = "file://systemd-pam-configure-check-uclibc.patch \
> @@ -76,7 +74,6 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
>                    --disable-manpages \
>                    --disable-coredump \
>                    --disable-introspection \
> -                 --disable-tcpwrap \
>                    --enable-split-usr \
>                    --without-python \
>                    --with-sysvrcnd-path=${sysconfdir} \
>

