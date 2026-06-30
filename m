Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4C2C43602
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 05:52:36 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15163.1782798751403633914
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 22:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=s9QsbTYZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=aInIXfzS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019f171611bf-2b784629-e21d-46be-9d5b-db8a15a9aa85-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782798750;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ARIHAiVb5Z45hQt+TSrdCHtckfM7WG58Lfn/KswGBm8=;
	b=s9QsbTYZmb9Gb6gYoQ1uEmwjxkjbKV1MDIrkoAJ/mg9W8zo2NlU1DF4hlfPkPViU
	EsGrhIAyrKLEwUY9OHpcq+33WVMDbU+W6dW3Ur6R6c99YLPtD0zX4TEjHpBnaDi9LDF
	7u1rckP2ussqwOgPF+ZBt7qmVPTFJuDNKiizrQbA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782798750;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ARIHAiVb5Z45hQt+TSrdCHtckfM7WG58Lfn/KswGBm8=;
	b=aInIXfzSl/wj0yPhSZqmP+4/rwJfipzCGYNHYX+YJWU1si2a98ZsP/3nL63tEvwZ
	itmNa4n/OfzLB31J/qAwVhCmK/iCAthglqo4Fx2+zuKEn2OdGv73fQqJ6O4KFMN3rDF
	ESVw+bOedBEIt3kZDxIRWJbAeGRdP3/LJuqEt9MQ=
Content-Type: multipart/mixed; boundary="===============3404021505099657088=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] acl: upgrading to 2.4.0 SUCCEEDED
Message-ID: <0101019f171611bf-2b784629-e21d-46be-9d5b-db8a15a9aa85-000000@us-west-2.amazonses.com>
Date: Tue, 30 Jun 2026 05:52:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.30-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 05:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239847

--===============3404021505099657088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *acl* to *2.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-acl-upgrade-2.3.2-2.4.0.patch
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
From 051007f02197165c795e372c8732437f7166840e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 30 Jun 2026 05:48:53 +0000
Subject: [PATCH] acl: upgrade 2.3.2 -> 2.4.0

---
 ...t_uid-fix-memory-wasting-loop-if-use.patch | 49 -------------------
 ...isc.test-Don-t-mix-stdout-and-stderr.patch | 35 -------------
 .../attr/{acl_2.3.2.bb => acl_2.4.0.bb}       |  4 +-
 3 files changed, 1 insertion(+), 87 deletions(-)
 delete mode 100644 meta/recipes-support/attr/acl/0001-libmisc-__acl_get_uid-fix-memory-wasting-loop-if-use.patch
 delete mode 100644 meta/recipes-support/attr/acl/0001-test-misc.test-Don-t-mix-stdout-and-stderr.patch
 rename meta/recipes-support/attr/{acl_2.3.2.bb => acl_2.4.0.bb} (90%)

diff --git a/meta/recipes-support/attr/acl/0001-libmisc-__acl_get_uid-fix-memory-wasting-loop-if-use.patch b/meta/recipes-support/attr/acl/0001-libmisc-__acl_get_uid-fix-memory-wasting-loop-if-use.patch
deleted file mode 100644
index 5052bdaa2f..0000000000
--- a/meta/recipes-support/attr/acl/0001-libmisc-__acl_get_uid-fix-memory-wasting-loop-if-use.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 56abe432b65801f31277fb9a3bca0f9e31502315 Mon Sep 17 00:00:00 2001
-From: Matthias Gerstner <matthias.gerstner@suse.de>
-Date: Thu, 25 Apr 2024 12:43:49 +0200
-Subject: [PATCH] libmisc: __acl_get_uid(): fix memory wasting loop if user
- does not exist
-
-I noticed that `acl_from_text()` unexpectedly returns ENOMEM for invalid
-user names. The reason for this is a missing break statement in the for
-loop in `__acl_get_uid()`, which causes the loop to act as if ERANGE was
-returned from `getpwnam_r()`, thereby exponentially increasing the
-buffer size to (in my case) multiple gigabytes, until `grow_buffer()`
-reports ENOMEM, which terminates the `__acl_get_uid()` function.
-
-This is a pretty costly "no such user" lookup that can disturb a
-process's heap memory management, but can also cause a process to fail
-e.g. if it is multithreaded and other threads encounter an ENOMEM,
-before `__acl_get_uid()` frees the gigantic heap buffer and returns.
-The allocated memory isn't actually used. Therefore on Linux it should
-not affect other processes by default, due to its overcommit memory
-and lazy memory allocation strategy.
-
-Fix this by properly terminating the for loop on any conditions except
-an ERANGE error being reported. The same break statement correctly
-exists in `__acl_get_gid()` already.
-
-Fixes: 3737f00 ("use thread-safe getpwnam_r and getgrnam_r")
-Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- libmisc/uid_gid_lookup.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libmisc/uid_gid_lookup.c b/libmisc/uid_gid_lookup.c
-index a4f21f6..74baab4 100644
---- a/libmisc/uid_gid_lookup.c
-+++ b/libmisc/uid_gid_lookup.c
-@@ -91,6 +91,7 @@ __acl_get_uid(const char *token, uid_t *uid_p)
- 		if (err == ERANGE)
- 			continue;
- 		errno = err ? err : EINVAL;
-+		break;
- 	}
- 	free(buffer);
- 	return result ? 0 : -1;
--- 
-2.43.0
-
diff --git a/meta/recipes-support/attr/acl/0001-test-misc.test-Don-t-mix-stdout-and-stderr.patch b/meta/recipes-support/attr/acl/0001-test-misc.test-Don-t-mix-stdout-and-stderr.patch
deleted file mode 100644
index 5aa3f3224c..0000000000
--- a/meta/recipes-support/attr/acl/0001-test-misc.test-Don-t-mix-stdout-and-stderr.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 47f8039ec9bd08b629775c8e788d11e41fa95f14 Mon Sep 17 00:00:00 2001
-From: Andreas Gruenbacher <agruenba@redhat.com>
-Date: Mon, 24 Mar 2025 21:14:09 +0100
-Subject: [PATCH] test/misc.test: Don't mix stdout and stderr
-
-In different environments, we may not get the stdout and stderr output
-in the order the run script expects, so check both separately.
-
-Fixes: https://savannah.nongnu.org/bugs/?66944
-Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- test/misc.test | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/test/misc.test b/test/misc.test
-index 06b3136..57c02e5 100644
---- a/test/misc.test
-+++ b/test/misc.test
-@@ -440,8 +440,9 @@ Dangling symlink test https://savannah.nongnu.org/bugs/?28131
- 	> other::r-x
- 	> 
- 	$ setfacl -R -m u:bin:rw d
--	$ getfacl -RL d
-+	$ getfacl -RL d > /dev/null
- 	> getfacl: d/b: No such file or directory
-+	$ getfacl -RL d 2> /dev/null
- 	> # file: d
- 	> # owner: %TUSER
- 	> # group: %TGROUP
--- 
-2.43.0
-
diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-support/attr/acl_2.4.0.bb
similarity index 90%
rename from meta/recipes-support/attr/acl_2.3.2.bb
rename to meta/recipes-support/attr/acl_2.4.0.bb
index a405cc2692..ef9ee492a0 100644
--- a/meta/recipes-support/attr/acl_2.3.2.bb
+++ b/meta/recipes-support/attr/acl_2.4.0.bb
@@ -16,11 +16,9 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=c781d70ed2b4d48995b790403217a249 \
 DEPENDS = "attr"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.gz \
-           file://0001-libmisc-__acl_get_uid-fix-memory-wasting-loop-if-use.patch \
-           file://0001-test-misc.test-Don-t-mix-stdout-and-stderr.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "5f2bdbad629707aa7d85c623f994aa8a1d2dec55a73de5205bac0bf6058a2f7c"
+SRC_URI[sha256sum] = "73c853c3d44e1f693e5a96a986f1bd19d3d0dac2c7d453e796177774bc4e5f6a"
 
 inherit autotools gettext ptest
 
-- 
2.47.1


--===============3404021505099657088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wayland-protocols/wayland-protocols-dev: FILES: removed "/lib/lib*.so /lib/*.o /lib/*.la"
packages/all-poky-linux/wayland-protocols/wayland-protocols-staticdev: FILES: removed "/lib/*.a"
packages/all-poky-linux/wayland-protocols/wayland-protocols: FILES: removed "/lib/*.so.* /sbin/* /bin/*", added "/usr/lib/*.so.*"
packages/x86-64-v3-poky-linux/acl/acl-dbg: PV changed from "2.3.2" to "2.4.0"
packages/x86-64-v3-poky-linux/acl/acl-dbg: RRECOMMENDS: removed "libattr-dbg"
packages/x86-64-v3-poky-linux/acl/acl-dbg: PKGSIZE changed from 368440 to 439288 (+19%)
packages/x86-64-v3-poky-linux/acl/acl-dbg: PKGV changed from 2.3.2 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/acl/acl-dbg: FILELIST: removed "/usr/lib/.debug/libacl.so.1.1.2302", added "/usr/lib/.debug/libacl.so.1.2.2400"
packages/x86-64-v3-poky-linux/acl/acl-dev: PV changed from "2.3.2" to "2.4.0"
packages/x86-64-v3-poky-linux/acl/acl-dev: RRECOMMENDS: removed "libattr-dev"
packages/x86-64-v3-poky-linux/acl/acl-dev: PKGSIZE changed from 6482 to 6866 (+6%)
packages/x86-64-v3-poky-linux/acl/acl-dev: PKGV changed from 2.3.2 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/acl/acl-doc: PV changed from "2.3.2" to "2.4.0"
packages/x86-64-v3-poky-linux/acl/acl-doc: PKGSIZE changed from 222615 to 235588 (+6%)
packages/x86-64-v3-poky-linux/acl/acl-doc: PKGV changed from 2.3.2 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/acl/acl-doc: FILELIST: added "/usr/share/man/man3/acl_set_file_at.3 /usr/share/man/man3/acl_extended_file_at.3 /usr/share/man/man3/acl_get_file_at.3 /usr/share/man/man3/acl_delete_def_file_at.3"
packages/x86-64-v3-poky-linux/acl/acl-locale-de: PV changed from "2.3.2" to "2.4.0"
packages/x86-64-v3-poky-linux/acl/acl-locale-de: PKGSIZE changed from 8722 to 9261 (+6%)
packages/x86-64-v3-poky-linux/acl/acl-locale-de: PKGV changed from 2.3.2 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/acl/acl-locale-en+boldquot: PV changed from "2.3.2" to "2.4.0"
packages/x86-64-v3-poky-linux/acl/acl-locale-en+boldquot: PKGSIZE changed from 8581 to 9091 (+6%)
packages/x86-64-v3-poky-linux/acl/acl-locale-en+boldquot: PKGV changed from 2.3.2 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/acl/acl-locale-en+quot: PV changed from "2.3.2" to "2.4.0"
packages/x86-64-v3-poky-linux/acl/acl-locale-en+quot: PKGSIZE changed from 8497 to 9007 (+6%)
packages/x86-64-v3-poky-linux/acl/acl-locale-en+quot: PKGV changed from 2.3.2 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/acl/acl-locale-es: PV changed from "2.3.2" to "2.4.0"
packages/x86-64-v3-poky-linux/acl/acl-locale-es: PKGSIZE changed from 6972 to 6751 (-3%)
packages/x86-64-v3-poky-linux/acl/acl-locale-es: PKGV changed from 2.3.2 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/acl/acl-locale-fr: PV changed from "2.3.2" to "2.4.0"
packages/x86-64-v3-poky-linux/acl/acl-locale-fr: PKGSIZE changed from 7691 to 7440 (-3%)
packages/x86-64-v3-poky-linux/acl/acl-locale-fr: PKGV changed from 2.3.2 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/acl/acl-locale-gl: PV changed from "2.3.2" to "2.4.0"
packages/x86-64-v3-poky-linux/acl/acl-locale-gl: PKGSIZE changed from 6970 to 6738 (-3%)
packages/x86-64-v3-poky-linux/acl/acl-locale-gl: PKGV changed from 2.3.2 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/acl/acl-locale-ka: PV changed from "2.3.2" to "2.4.0"
packages/x86-64-v3-poky-linux/acl/acl-locale-ka: PKGSIZE changed from 13107 to 10125 (-23%)
packages/x86-64-v3-poky-linux/acl/acl-locale-ka: PKGV changed from 2.3.2 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/acl/acl-locale-pl: PV changed from "2.3.2" to "2.4.0"
packages/x86-64-v3-poky-linux/acl/acl-locale-pl: PKGSIZE changed from 9321 to 7204 (-23%)
packages/x86-64-v3-poky-linux/acl/acl-locale-pl: PKGV changed from 2.3.2 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/acl/acl-locale-sv: PV changed from "2.3.2" to "2.4.0"
packages/x86-64-v3-poky-linux/acl/acl-locale-sv: PKGSIZE changed from 6704 to 6491 (-3%)
packages/x86-64-v3-poky-linux/acl/acl-locale-sv: PKGV changed from 2.3.2 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/acl/acl-ptest: PV changed from "2.3.2" to "2.4.0"
packages/x86-64-v3-poky-linux/acl/acl-ptest: RDEPENDS: removed "libattr (['>= 2.5.2'])"
packages/x86-64-v3-poky-linux/acl/acl-ptest: PKGSIZE changed from 42237 to 25258 (-40%)
packages/x86-64-v3-poky-linux/acl/acl-ptest: PKGV changed from 2.3.2 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/acl/acl-ptest: FILELIST: removed "/usr/lib/acl/ptest/setfacl-X.test /usr/lib/acl/ptest/sbits-restore.test /usr/lib/acl/ptest/getfacl-recursive.test /usr/lib/acl/ptest/cp.test /usr/lib/acl/ptest/utf8-filenames.test /usr/lib/acl/ptest/getfacl-lfs.test /usr/lib/acl/ptest/getfacl-noacl.test /usr/lib/acl/ptest/malformed-restore.test /usr/lib/acl/ptest/misc.test"
packages/x86-64-v3-poky-linux/acl/acl-src: PV changed from "2.3.2" to "2.4.0"
packages/x86-64-v3-poky-linux/acl/acl-src: PKGSIZE changed from 204219 to 234173 (+15%)
packages/x86-64-v3-poky-linux/acl/acl-src: PKGV changed from 2.3.2 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/acl/acl-src: FILELIST: directory renamed /usr/src/debug/acl/2.3.2/tools -> /usr/src/debug/acl/2.4.0/tools, directory renamed /usr/src/debug/acl/2.3.2/test -> /usr/src/debug/acl/2.4.0/test, removed "/usr/src/debug/acl/2.3.2/libmisc/next_line.c /usr/src/debug/acl/2.3.2/libacl/libobj.h /usr/src/debug/acl/2.3.2/libacl/acl_get_qualifier.c /usr/src/debug/acl/2.3.2/libacl/acl_copy_entry.c /usr/src/debug/acl/2.3.2/libacl/acl_set_qualifier.c /usr/src/debug/acl/2.3.2/libacl/__libobj.c /usr/src/debug/acl/2.3.2/libacl/acl_entries.c /usr/src/debug/acl/2.3.2/libacl/acl_get_fd.c /usr/src/debug/acl/2.3.2/libacl/acl_set_fd.c /usr/src/debug/acl/2.3.2/libacl/acl_cmp.c /usr/src/debug/acl/2.3.2/libacl/acl_dup.c /usr/src/debug/acl/2.3.2/include/walk_tree.h /usr/src/debug/acl/2.3.2/libacl/acl_get_file.c /usr/src/debug/acl/2.3.2/libacl/acl_set_file.c /usr/src/debug/acl/2.3.2/libacl/libacl.h /usr/src/debug/acl/2.3.2/libmisc/walk_tree.c /usr/src/debug/acl/2.3.2/libmisc/unquote.c 
 /usr/src/debug/acl/2.3.2/libacl/acl_extended_file_nofollow.c /usr/src/debug/acl/2.3.2/libacl/__acl_to_any_text.c /usr/src/debug/acl/2.3.2/libacl/__apply_mask_to_mode.c /usr/src/debug/acl/2.3.2/libacl/acl_to_text.c /usr/src/debug/acl/2.3.2/libacl/acl_from_mode.c /usr/src/debug/acl/2.3.2/libacl/acl_clear_perms.c /usr/src/debug/acl/2.3.2/libacl/acl_extended_file.c /usr/src/debug/acl/2.3.2/libacl/perm_copy_fd.c /usr/src/debug/acl/2.3.2/include/acl.h /usr/src/debug/acl/2.3.2/libacl/acl_valid.c /usr/src/debug/acl/2.3.2/libacl/acl_copy_int.c /usr/src/debug/acl/2.3.2/libacl/acl_get_permset.c /usr/src/debug/acl/2.3.2/libacl/__acl_from_xattr.h /usr/src/debug/acl/2.3.2/libacl/acl_set_permset.c /usr/src/debug/acl/2.3.2/libmisc/high_water_alloc.c /usr/src/debug/acl/2.3.2/libacl/acl_free.c /usr/src/debug/acl/2.3.2/libacl/__acl_from_xattr.c /usr/src/debug/acl/2.3.2/libacl/acl_init.c /usr/src/debug/acl/2.3.2/libacl/acl_size.c /usr/src/debug/acl/2.3.2/libacl/acl_check.c /usr/src/debug/acl/2.3.2/liba
 cl/acl_add_perm.c /usr/src/debug/acl/2.3.2/libacl/acl_delete_perm.c /usr/src/debug/acl/2.3.2/libacl/acl_get_perm.c /usr/src/debug/acl/2.3.2/libmisc/quote.c /usr/src/debug/acl/2.3.2/libacl/__acl_extended_file.h /usr/src/debug/acl/2.3.2/libacl/acl_calc_mask.c /usr/src/debug/acl/2.3.2/libacl/__acl_extended_file.c /usr/src/debug/acl/2.3.2/libacl/acl_from_text.c /usr/src/debug/acl/2.3.2/libmisc/uid_gid_lookup.c /usr/src/debug/acl/2.3.2/include/libacl.h /usr/src/debug/acl/2.3.2/include/acl_ea.h /usr/src/debug/acl/2.3.2/libacl/acl_error.c /usr/src/debug/acl/2.3.2/libacl/acl_set_tag_type.c /usr/src/debug/acl/2.3.2/libacl/perm_copy_file.c /usr/src/debug/acl/2.3.2/libacl/__acl_to_xattr.h /usr/src/debug/acl/2.3.2/libacl/acl_equiv_mode.c /usr/src/debug/acl/2.3.2/libacl/acl_copy_ext.c /usr/src/debug/acl/2.3.2/libacl/acl_extended_fd.c /usr/src/debug/acl/2.3.2/libacl/acl_to_any_text.c /usr/src/debug/acl/2.3.2/libacl/__acl_to_xattr.c /usr/src/debug/acl/2.3.2/include/misc.h /usr/src/debug/acl/2.3.2/
 libacl/acl_get_entry.c /usr/src/debug/acl/2.3.2/libacl/acl_delete_entry.c /usr/src/debug/acl/2.3.2/libacl/acl_create_entry.c /usr/src/debug/acl/2.3.2/libacl/__acl_reorder_obj_p.c /usr/src/debug/acl/2.3.2/libacl/acl_get_tag_type.c /usr/src/debug/acl/2.3.2/libacl/acl_delete_def_file.c", added "/usr/src/debug/acl/2.4.0/libacl/acl_set_qualifier.c /usr/src/debug/acl/2.4.0/libacl/acl_get_qualifier.c /usr/src/debug/acl/2.4.0/libacl/acl_cmp.c /usr/src/debug/acl/2.4.0/libacl/acl_dup.c /usr/src/debug/acl/2.4.0/include/walk_tree.h /usr/src/debug/acl/2.4.0/include/xattrat.h /usr/src/debug/acl/2.4.0/libacl/libacl.h /usr/src/debug/acl/2.4.0/libmisc/unquote.c /usr/src/debug/acl/2.4.0/libacl/acl_valid.c /usr/src/debug/acl/2.4.0/libmisc/fchmodat_compat.c /usr/src/debug/acl/2.4.0/libacl/acl_delete_perm.c /usr/src/debug/acl/2.4.0/include/libacl.h /usr/src/debug/acl/2.4.0/libmisc/setxattrat_compat.c /usr/src/debug/acl/2.4.0/libmisc/getxattrat_compat.c /usr/src/debug/acl/2.4.0/include/xattrat_compat.h /
 usr/src/debug/acl/2.4.0/libacl/__acl_to_xattr.h /usr/src/debug/acl/2.4.0/libacl/acl_extended_file_at.c /usr/src/debug/acl/2.4.0/libacl/acl_extended_fd.c /usr/src/debug/acl/2.4.0/libacl/__acl_to_xattr.c /usr/src/debug/acl/2.4.0/libacl/acl_entries.c /usr/src/debug/acl/2.4.0/libacl/acl_get_file.c /usr/src/debug/acl/2.4.0/libacl/acl_set_file.c /usr/src/debug/acl/2.4.0/libacl/acl_to_text.c /usr/src/debug/acl/2.4.0/libacl/acl_clear_perms.c /usr/src/debug/acl/2.4.0/libacl/acl_extended_file.c /usr/src/debug/acl/2.4.0/libacl/acl_delete_def_file_at.c /usr/src/debug/acl/2.4.0/libacl/acl_copy_int.c /usr/src/debug/acl/2.4.0/libacl/__acl_from_xattr.h /usr/src/debug/acl/2.4.0/libacl/__acl_from_xattr.c /usr/src/debug/acl/2.4.0/libacl/acl_calc_mask.c /usr/src/debug/acl/2.4.0/libacl/acl_copy_ext.c /usr/src/debug/acl/2.4.0/libacl/__acl_reorder_obj_p.c /usr/src/debug/acl/2.4.0/libacl/acl_set_tag_type.c /usr/src/debug/acl/2.4.0/libacl/acl_delete_entry.c /usr/src/debug/acl/2.4.0/libacl/acl_create_entry.c
  /usr/src/debug/acl/2.4.0/libacl/acl_get_tag_type.c /usr/src/debug/acl/2.4.0/libmisc/listxattrat_compat.c /usr/src/debug/acl/2.4.0/libacl/libobj.h /usr/src/debug/acl/2.4.0/libacl/acl_copy_entry.c /usr/src/debug/acl/2.4.0/libmisc/walk_tree.c /usr/src/debug/acl/2.4.0/libmisc/xattrat.c /usr/src/debug/acl/2.4.0/libacl/acl_extended_file_nofollow.c /usr/src/debug/acl/2.4.0/libacl/acl_from_mode.c /usr/src/debug/acl/2.4.0/libacl/perm_copy_fd.c /usr/src/debug/acl/2.4.0/include/acl.h /usr/src/debug/acl/2.4.0/libacl/acl_get_permset.c /usr/src/debug/acl/2.4.0/libacl/acl_set_permset.c /usr/src/debug/acl/2.4.0/libmisc/high_water_alloc.c /usr/src/debug/acl/2.4.0/libmisc/removexattrat_compat.c /usr/src/debug/acl/2.4.0/include/fchmodat_compat.h /usr/src/debug/acl/2.4.0/libacl/acl_add_perm.c /usr/src/debug/acl/2.4.0/libacl/acl_get_perm.c /usr/src/debug/acl/2.4.0/libacl/acl_from_text.c /usr/src/debug/acl/2.4.0/libmisc/uid_gid_lookup.c /usr/src/debug/acl/2.4.0/include/acl_ea.h /usr/src/debug/acl/2.4.0/
 libacl/acl_equiv_mode.c /usr/src/debug/acl/2.4.0/libacl/acl_to_any_text.c /usr/src/debug/acl/2.4.0/include/misc.h /usr/src/debug/acl/2.4.0/libacl/acl_get_entry.c /usr/src/debug/acl/2.4.0/libmisc/next_line.c /usr/src/debug/acl/2.4.0/libmisc/proc-self-fd.c /usr/src/debug/acl/2.4.0/libacl/acl_get_file_at.c /usr/src/debug/acl/2.4.0/libacl/acl_set_file_at.c /usr/src/debug/acl/2.4.0/libmisc/proc-self-fd.h /usr/src/debug/acl/2.4.0/libacl/__libobj.c /usr/src/debug/acl/2.4.0/libacl/acl_get_fd.c /usr/src/debug/acl/2.4.0/libacl/acl_set_fd.c /usr/src/debug/acl/2.4.0/libacl/__acl_apply_mask_to_mode.c /usr/src/debug/acl/2.4.0/libacl/__acl_to_any_text.c /usr/src/debug/acl/2.4.0/libacl/acl_free.c /usr/src/debug/acl/2.4.0/libacl/acl_init.c /usr/src/debug/acl/2.4.0/libacl/acl_size.c /usr/src/debug/acl/2.4.0/libacl/acl_check.c /usr/src/debug/acl/2.4.0/libmisc/quote.c /usr/src/debug/acl/2.4.0/libacl/acl_error.c /usr/src/debug/acl/2.4.0/libacl/perm_copy_file.c /usr/src/debug/acl/2.4.0/libacl/acl_delete_
 def_file.c"
packages/x86-64-v3-poky-linux/acl/acl-staticdev: PV changed from "2.3.2" to "2.4.0"
packages/x86-64-v3-poky-linux/acl/acl-staticdev: PKGV changed from 2.3.2 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/acl/acl: PV changed from "2.3.2" to "2.4.0"
packages/x86-64-v3-poky-linux/acl/acl: PKGSIZE changed from 84304 to 92440 (+10%)
packages/x86-64-v3-poky-linux/acl/acl: PKGV changed from 2.3.2 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/acl: PV changed from "2.3.2" to "2.4.0"
packages/x86-64-v3-poky-linux/acl: SRC_URI changed from "https://download.savannah.gnu.org/releases/acl/acl-2.3.2.tar.gz file://0001-libmisc-__acl_get_uid-fix-memory-wasting-loop-if-use.patch file://0001-test-misc.test-Don-t-mix-stdout-and-stderr.patch file://run-ptest" to "https://download.savannah.gnu.org/releases/acl/acl-2.4.0.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/acl: PKGV changed from 2.3.2 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/acl/libacl: PV changed from "2.3.2" to "2.4.0"
packages/x86-64-v3-poky-linux/acl/libacl: RDEPENDS: removed all items "libattr (['>= 2.5.2'])"
packages/x86-64-v3-poky-linux/acl/libacl: PKGSIZE changed from 38898 to 47090 (+21%)
packages/x86-64-v3-poky-linux/acl/libacl: PKGV changed from 2.3.2 [default] to 2.4.0 [default]
packages/x86-64-v3-poky-linux/acl/libacl: FILELIST: removed "/usr/lib/libacl.so.1.1.2302", added "/usr/lib/libacl.so.1.2.2400"
Changes to packages/x86-64-v3-poky-linux/acl (sysroot):
  /usr/lib/libacl.so.1 changed symlink target from libacl.so.1.1.2302 to libacl.so.1.2.2400
  /usr/lib/libacl.so changed symlink target from libacl.so.1.1.2302 to libacl.so.1.2.2400
  /usr/lib/libacl.so.1.1.2302 moved to /usr/lib/libacl.so.1.2.2400
Changes to packages/x86_64-linux/acl-native (sysroot):
  /usr/lib/libacl.so.1 changed symlink target from libacl.so.1.1.2302 to libacl.so.1.2.2400
  /usr/lib/libacl.so changed symlink target from libacl.so.1.1.2302 to libacl.so.1.2.2400
  /usr/lib/libacl.so.1.1.2302 moved to /usr/lib/libacl.so.1.2.2400

--===============3404021505099657088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/acl/acl-dbg: RRECOMMENDS: removed "libattr-dbg"
packages/x86-64-v3-poky-linux/acl/acl-dbg: PKGSIZE changed from 368440 to 439288 (+19%)
packages/x86-64-v3-poky-linux/acl/acl-dev: RRECOMMENDS: removed "libattr-dev"
packages/x86-64-v3-poky-linux/acl/acl-doc: FILELIST: added "/usr/share/man/man3/acl_set_file_at.3 /usr/share/man/man3/acl_delete_def_file_at.3 /usr/share/man/man3/acl_get_file_at.3 /usr/share/man/man3/acl_extended_file_at.3"
packages/x86-64-v3-poky-linux/acl/acl-locale-ka: PKGSIZE changed from 13107 to 10125 (-23%)
packages/x86-64-v3-poky-linux/acl/acl-locale-pl: PKGSIZE changed from 9321 to 7204 (-23%)
packages/x86-64-v3-poky-linux/acl/acl-ptest: RDEPENDS: removed "libattr (['>= 2.5.2'])"
packages/x86-64-v3-poky-linux/acl/acl-ptest: PKGSIZE changed from 42237 to 25258 (-40%)
packages/x86-64-v3-poky-linux/acl/acl-ptest: FILELIST: removed "/usr/lib/acl/ptest/sbits-restore.test /usr/lib/acl/ptest/utf8-filenames.test /usr/lib/acl/ptest/misc.test /usr/lib/acl/ptest/getfacl-lfs.test /usr/lib/acl/ptest/setfacl-X.test /usr/lib/acl/ptest/malformed-restore.test /usr/lib/acl/ptest/getfacl-noacl.test /usr/lib/acl/ptest/getfacl-recursive.test /usr/lib/acl/ptest/cp.test"
packages/x86-64-v3-poky-linux/acl/acl-src: PKGSIZE changed from 204219 to 234173 (+15%)
packages/x86-64-v3-poky-linux/acl/libacl: RDEPENDS: removed all items "libattr (['>= 2.5.2'])"
packages/x86-64-v3-poky-linux/acl/libacl: PKGSIZE changed from 38898 to 47090 (+21%)
packages/x86-64-v3-poky-linux/acl/libacl: FILELIST: removed "/usr/lib/libacl.so.1.1.2302", added "/usr/lib/libacl.so.1.2.2400"
Changes to packages/x86-64-v3-poky-linux/acl (sysroot):
  /usr/lib/libacl.so.1 changed symlink target from libacl.so.1.1.2302 to libacl.so.1.2.2400
  /usr/lib/libacl.so changed symlink target from libacl.so.1.1.2302 to libacl.so.1.2.2400
  /usr/lib/libacl.so.1.1.2302 moved to /usr/lib/libacl.so.1.2.2400
Changes to packages/x86_64-linux/acl-native (sysroot):
  /usr/lib/libacl.so.1 changed symlink target from libacl.so.1.1.2302 to libacl.so.1.2.2400
  /usr/lib/libacl.so changed symlink target from libacl.so.1.1.2302 to libacl.so.1.2.2400
  /usr/lib/libacl.so.1.1.2302 moved to /usr/lib/libacl.so.1.2.2400

--===============3404021505099657088==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-acl-upgrade-2.3.2-2.4.0.patch"

RnJvbSAwNTEwMDdmMDIxOTcxNjVjNzk1ZTM3MmM4NzMyNDM3ZjcxNjY4NDBlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMzAgSnVuIDIwMjYgMDU6NDg6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
Y2w6IHVwZ3JhZGUgMi4zLjIgLT4gMi40LjAKCi0tLQogLi4udF91aWQtZml4LW1lbW9yeS13YXN0
aW5nLWxvb3AtaWYtdXNlLnBhdGNoIHwgNDkgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uaXNjLnRl
c3QtRG9uLXQtbWl4LXN0ZG91dC1hbmQtc3RkZXJyLnBhdGNoIHwgMzUgLS0tLS0tLS0tLS0tLQog
Li4uL2F0dHIve2FjbF8yLjMuMi5iYiA9PiBhY2xfMi40LjAuYmJ9ICAgICAgIHwgIDQgKy0KIDMg
ZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDg3IGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2F0dHIvYWNsLzAwMDEtbGlibWlzYy1fX2Fj
bF9nZXRfdWlkLWZpeC1tZW1vcnktd2FzdGluZy1sb29wLWlmLXVzZS5wYXRjaAogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2F0dHIvYWNsLzAwMDEtdGVzdC1taXNjLnRl
c3QtRG9uLXQtbWl4LXN0ZG91dC1hbmQtc3RkZXJyLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVz
LXN1cHBvcnQvYXR0ci97YWNsXzIuMy4yLmJiID0+IGFjbF8yLjQuMC5iYn0gKDkwJSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hdHRyL2FjbC8wMDAxLWxpYm1pc2MtX19hY2xf
Z2V0X3VpZC1maXgtbWVtb3J5LXdhc3RpbmctbG9vcC1pZi11c2UucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9hdHRyL2FjbC8wMDAxLWxpYm1pc2MtX19hY2xfZ2V0X3VpZC1maXgtbWVtb3J5
LXdhc3RpbmctbG9vcC1pZi11c2UucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDUwNTJiZGFhMmYuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXR0ci9h
Y2wvMDAwMS1saWJtaXNjLV9fYWNsX2dldF91aWQtZml4LW1lbW9yeS13YXN0aW5nLWxvb3AtaWYt
dXNlLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNDkgKzAsMCBAQAotRnJvbSA1NmFiZTQzMmI2
NTgwMWYzMTI3N2ZiOWEzYmNhMGY5ZTMxNTAyMzE1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQot
RnJvbTogTWF0dGhpYXMgR2Vyc3RuZXIgPG1hdHRoaWFzLmdlcnN0bmVyQHN1c2UuZGU+Ci1EYXRl
OiBUaHUsIDI1IEFwciAyMDI0IDEyOjQzOjQ5ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIGxpYm1p
c2M6IF9fYWNsX2dldF91aWQoKTogZml4IG1lbW9yeSB3YXN0aW5nIGxvb3AgaWYgdXNlcgotIGRv
ZXMgbm90IGV4aXN0Ci0KLUkgbm90aWNlZCB0aGF0IGBhY2xfZnJvbV90ZXh0KClgIHVuZXhwZWN0
ZWRseSByZXR1cm5zIEVOT01FTSBmb3IgaW52YWxpZAotdXNlciBuYW1lcy4gVGhlIHJlYXNvbiBm
b3IgdGhpcyBpcyBhIG1pc3NpbmcgYnJlYWsgc3RhdGVtZW50IGluIHRoZSBmb3IKLWxvb3AgaW4g
YF9fYWNsX2dldF91aWQoKWAsIHdoaWNoIGNhdXNlcyB0aGUgbG9vcCB0byBhY3QgYXMgaWYgRVJB
TkdFIHdhcwotcmV0dXJuZWQgZnJvbSBgZ2V0cHduYW1fcigpYCwgdGhlcmVieSBleHBvbmVudGlh
bGx5IGluY3JlYXNpbmcgdGhlCi1idWZmZXIgc2l6ZSB0byAoaW4gbXkgY2FzZSkgbXVsdGlwbGUg
Z2lnYWJ5dGVzLCB1bnRpbCBgZ3Jvd19idWZmZXIoKWAKLXJlcG9ydHMgRU5PTUVNLCB3aGljaCB0
ZXJtaW5hdGVzIHRoZSBgX19hY2xfZ2V0X3VpZCgpYCBmdW5jdGlvbi4KLQotVGhpcyBpcyBhIHBy
ZXR0eSBjb3N0bHkgIm5vIHN1Y2ggdXNlciIgbG9va3VwIHRoYXQgY2FuIGRpc3R1cmIgYQotcHJv
Y2VzcydzIGhlYXAgbWVtb3J5IG1hbmFnZW1lbnQsIGJ1dCBjYW4gYWxzbyBjYXVzZSBhIHByb2Nl
c3MgdG8gZmFpbAotZS5nLiBpZiBpdCBpcyBtdWx0aXRocmVhZGVkIGFuZCBvdGhlciB0aHJlYWRz
IGVuY291bnRlciBhbiBFTk9NRU0sCi1iZWZvcmUgYF9fYWNsX2dldF91aWQoKWAgZnJlZXMgdGhl
IGdpZ2FudGljIGhlYXAgYnVmZmVyIGFuZCByZXR1cm5zLgotVGhlIGFsbG9jYXRlZCBtZW1vcnkg
aXNuJ3QgYWN0dWFsbHkgdXNlZC4gVGhlcmVmb3JlIG9uIExpbnV4IGl0IHNob3VsZAotbm90IGFm
ZmVjdCBvdGhlciBwcm9jZXNzZXMgYnkgZGVmYXVsdCwgZHVlIHRvIGl0cyBvdmVyY29tbWl0IG1l
bW9yeQotYW5kIGxhenkgbWVtb3J5IGFsbG9jYXRpb24gc3RyYXRlZ3kuCi0KLUZpeCB0aGlzIGJ5
IHByb3Blcmx5IHRlcm1pbmF0aW5nIHRoZSBmb3IgbG9vcCBvbiBhbnkgY29uZGl0aW9ucyBleGNl
cHQKLWFuIEVSQU5HRSBlcnJvciBiZWluZyByZXBvcnRlZC4gVGhlIHNhbWUgYnJlYWsgc3RhdGVt
ZW50IGNvcnJlY3RseQotZXhpc3RzIGluIGBfX2FjbF9nZXRfZ2lkKClgIGFscmVhZHkuCi0KLUZp
eGVzOiAzNzM3ZjAwICgidXNlIHRocmVhZC1zYWZlIGdldHB3bmFtX3IgYW5kIGdldGdybmFtX3Ii
KQotU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBHcnVlbmJhY2hlciA8YWdydWVuYmFAcmVkaGF0LmNv
bT4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydAotU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0
b24gPHJvc3MuYnVydG9uQGFybS5jb20+Ci0tLS0KLSBsaWJtaXNjL3VpZF9naWRfbG9va3VwLmMg
fCAxICsKLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKLQotZGlmZiAtLWdpdCBhL2xp
Ym1pc2MvdWlkX2dpZF9sb29rdXAuYyBiL2xpYm1pc2MvdWlkX2dpZF9sb29rdXAuYwotaW5kZXgg
YTRmMjFmNi4uNzRiYWFiNCAxMDA2NDQKLS0tLSBhL2xpYm1pc2MvdWlkX2dpZF9sb29rdXAuYwot
KysrIGIvbGlibWlzYy91aWRfZ2lkX2xvb2t1cC5jCi1AQCAtOTEsNiArOTEsNyBAQCBfX2FjbF9n
ZXRfdWlkKGNvbnN0IGNoYXIgKnRva2VuLCB1aWRfdCAqdWlkX3ApCi0gCQlpZiAoZXJyID09IEVS
QU5HRSkKLSAJCQljb250aW51ZTsKLSAJCWVycm5vID0gZXJyID8gZXJyIDogRUlOVkFMOwotKwkJ
YnJlYWs7Ci0gCX0KLSAJZnJlZShidWZmZXIpOwotIAlyZXR1cm4gcmVzdWx0ID8gMCA6IC0xOwot
LS0gCi0yLjQzLjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvYXR0ci9hY2wv
MDAwMS10ZXN0LW1pc2MudGVzdC1Eb24tdC1taXgtc3Rkb3V0LWFuZC1zdGRlcnIucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9hdHRyL2FjbC8wMDAxLXRlc3QtbWlzYy50ZXN0LURvbi10LW1p
eC1zdGRvdXQtYW5kLXN0ZGVyci5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
NWFhM2YzMjI0Yy4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hdHRyL2Fj
bC8wMDAxLXRlc3QtbWlzYy50ZXN0LURvbi10LW1peC1zdGRvdXQtYW5kLXN0ZGVyci5wYXRjaAor
KysgL2Rldi9udWxsCkBAIC0xLDM1ICswLDAgQEAKLUZyb20gNDdmODAzOWVjOWJkMDhiNjI5Nzc1
YzhlNzg4ZDExZTQxZmE5NWYxNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEFuZHJl
YXMgR3J1ZW5iYWNoZXIgPGFncnVlbmJhQHJlZGhhdC5jb20+Ci1EYXRlOiBNb24sIDI0IE1hciAy
MDI1IDIxOjE0OjA5ICswMTAwCi1TdWJqZWN0OiBbUEFUQ0hdIHRlc3QvbWlzYy50ZXN0OiBEb24n
dCBtaXggc3Rkb3V0IGFuZCBzdGRlcnIKLQotSW4gZGlmZmVyZW50IGVudmlyb25tZW50cywgd2Ug
bWF5IG5vdCBnZXQgdGhlIHN0ZG91dCBhbmQgc3RkZXJyIG91dHB1dAotaW4gdGhlIG9yZGVyIHRo
ZSBydW4gc2NyaXB0IGV4cGVjdHMsIHNvIGNoZWNrIGJvdGggc2VwYXJhdGVseS4KLQotRml4ZXM6
IGh0dHBzOi8vc2F2YW5uYWgubm9uZ251Lm9yZy9idWdzLz82Njk0NAotU2lnbmVkLW9mZi1ieTog
QW5kcmVhcyBHcnVlbmJhY2hlciA8YWdydWVuYmFAcmVkaGF0LmNvbT4KLQotVXBzdHJlYW0tU3Rh
dHVzOiBCYWNrcG9ydAotU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFy
bS5jb20+Ci0tLS0KLSB0ZXN0L21pc2MudGVzdCB8IDMgKystCi0gMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvdGVzdC9taXNjLnRl
c3QgYi90ZXN0L21pc2MudGVzdAotaW5kZXggMDZiMzEzNi4uNTdjMDJlNSAxMDA2NDQKLS0tLSBh
L3Rlc3QvbWlzYy50ZXN0Ci0rKysgYi90ZXN0L21pc2MudGVzdAotQEAgLTQ0MCw4ICs0NDAsOSBA
QCBEYW5nbGluZyBzeW1saW5rIHRlc3QgaHR0cHM6Ly9zYXZhbm5haC5ub25nbnUub3JnL2J1Z3Mv
PzI4MTMxCi0gCT4gb3RoZXI6OnIteAotIAk+IAotIAkkIHNldGZhY2wgLVIgLW0gdTpiaW46cncg
ZAotLQkkIGdldGZhY2wgLVJMIGQKLSsJJCBnZXRmYWNsIC1STCBkID4gL2Rldi9udWxsCi0gCT4g
Z2V0ZmFjbDogZC9iOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Ci0rCSQgZ2V0ZmFjbCAtUkwg
ZCAyPiAvZGV2L251bGwKLSAJPiAjIGZpbGU6IGQKLSAJPiAjIG93bmVyOiAlVFVTRVIKLSAJPiAj
IGdyb3VwOiAlVEdST1VQCi0tLSAKLTIuNDMuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9hdHRyL2FjbF8yLjMuMi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2F0dHIvYWNs
XzIuNC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1z
dXBwb3J0L2F0dHIvYWNsXzIuMy4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9h
dHRyL2FjbF8yLjQuMC5iYgppbmRleCBhNDA1Y2MyNjkyLi5lZjllZTQ5MmEwIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9hdHRyL2FjbF8yLjMuMi5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC9hdHRyL2FjbF8yLjQuMC5iYgpAQCAtMTYsMTEgKzE2LDkgQEAgTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vZG9jL0NPUFlJTkc7bWQ1PWM3ODFkNzBlZDJiNGQ0ODk5NWI3OTA0
MDMyMTdhMjQ5IFwKIERFUEVORFMgPSAiYXR0ciIKIAogU1JDX1VSSSA9ICIke1NBVkFOTkFIX0dO
VV9NSVJST1J9L2FjbC8ke0JQfS50YXIuZ3ogXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1saWJt
aXNjLV9fYWNsX2dldF91aWQtZml4LW1lbW9yeS13YXN0aW5nLWxvb3AtaWYtdXNlLnBhdGNoIFwK
LSAgICAgICAgICAgZmlsZTovLzAwMDEtdGVzdC1taXNjLnRlc3QtRG9uLXQtbWl4LXN0ZG91dC1h
bmQtc3RkZXJyLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAg
ICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1ZjJiZGJhZDYyOTcwN2FhN2Q4NWM2MjNmOTk0
YWE4YTFkMmRlYzU1YTczZGU1MjA1YmFjMGJmNjA1OGEyZjdjIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjczYzg1M2MzZDQ0ZTFmNjkzZTVhOTZhOTg2ZjFiZDE5ZDNkMGRhYzJjN2Q0NTNlNzk2MTc3
Nzc0YmM0ZTVmNmEiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIGdldHRleHQgcHRlc3QKIAotLSAKMi40
Ny4xCgo=

--===============3404021505099657088==--

