Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16566.1792647344548176053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 22:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ueIq7Ffp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pUrqAitB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a1621bada5-3f91cc63-0f60-41bb-a135-7e89a1fef608-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792647343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QAen9BpkQ3v9ME26mA4zghKYIJ6uio1SApMTNuB5+qs=;
	b=ueIq7Ffp43fYL50nC6gz0MvA1FFSERdX72pDPo8folRofGG8ALKbGv2nacacgzGs
	+8o07qgxHUFSjuLjTdGNMvaQPBebdCvbuWXizDPTsAN/LeA3OUMhlFYskBJlOIfUIft
	GU4GhUdB2o59yC246Pz2VEXxTkZRYJwoZbs2qXqo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792647343;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QAen9BpkQ3v9ME26mA4zghKYIJ6uio1SApMTNuB5+qs=;
	b=pUrqAitBCn55xAsCJnxou5a/moSnB5KUe3qm+2bOv+K9L5FrpG7+l/0gBFDI9TFN
	heixLWddKLdqjOIz6XeKOHTnMK+26VFOjzpLMb3SKGJGIomm/DOneKmgHiCv2/rEuv6
	jshSz7h3PaG36B54jIIbedyEQMAR2sewy/Gz6XPs=
Content-Type: multipart/mixed; boundary="===============3217065883882882098=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Sumanth Gavini <sumanth.gavini@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] man-pages: upgrading to 6.20 SUCCEEDED
Message-ID: <010101a1621bada5-3f91cc63-0f60-41bb-a135-7e89a1fef608-000000@us-west-2.amazonses.com>
Date: Thu, 22 Oct 2026 05:35:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.22-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 05:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248416

--===============3217065883882882098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *man-pages* to *6.20* has Succeeded.

Next steps:
    - apply the patch: git am 0001-man-pages-upgrade-6.19-6.20.patch
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
From cb3bbdfde8461e1d51060b8789f3013c7fb252d8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 22 Oct 2026 05:29:55 +0000
Subject: [PATCH] man-pages: upgrade 6.19 -> 6.20

==================== Changes in man-pages-6.20 ====================
Released: 2026-10-21, Dongo
git-bisect-rebase.1
file_attr.2type
proc_sys_fs_inotify.5(split from proc_sys_fs(5))
sys_block.5(previously, sysfs(5))
sys_bus.5(previously, sysfs(5))
sys_class.5(previously, sysfs(5))
sys_class_net.5(previously, sysfs(5))
sys_dev.5(previously, sysfs(5))
sys_devices.5(previously, sysfs(5))
sys_firmware.5(previously, sysfs(5))
sys_fs.5(previously, sysfs(5))
sys_fs_cgroup.5(previously, sysfs(5))
sys_fs_smackfs.5(previously, sysfs(5))
sys_hypervisor.5(previously, sysfs(5))
sys_kernel.5(previously, sysfs(5))
sys_kernel_cgroup.5(previously, sysfs(5))
sys_kernel_debug.5(previously, sysfs(5))
sys_kernel_mm.5(previously, sysfs(5))
sys_module.5(previously, sysfs(5))
sys_power.5(previously, sysfs(5))
sysfs.5(split into many pages)
man1/
diffman-git.1
--
man2/
fallocate.2
FALLOC_FL_WRITE_ZEROES
man*/
landlock*.?
LANDLOCK_ADD_RULE_QUIET
man5/
proc_pid_smaps_rollup.5(proc_pid_smaps(5))
   -  Improve portability to systems without gcc(1).
   -  Allow printing the commands with make(1)'s --no-silent.
-  src/bin/
   -  git-bisect-rebase: Add program.
---
 .../man-pages/{man-pages_6.19.bb => man-pages_6.20.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/man-pages/{man-pages_6.19.bb => man-pages_6.20.bb} (96%)

diff --git a/meta/recipes-extended/man-pages/man-pages_6.19.bb b/meta/recipes-extended/man-pages/man-pages_6.20.bb
similarity index 96%
rename from meta/recipes-extended/man-pages/man-pages_6.19.bb
rename to meta/recipes-extended/man-pages/man-pages_6.20.bb
index 8aaf5271e1..a3ac2f5380 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.19.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.20.bb
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://README;md5=494f3aa5d486baf2068b41eb1eec4570 \
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "fc0c620f07b4eba8ede128fbc267db5ebb4a67bab1aca3b01e5734956baf5572"
+SRC_URI[sha256sum] = "46f325713f2fd75c8d1f4fa42748153526a44846806d37028fab85cd0143de46"
 
 inherit manpages lib_package
 
-- 
2.47.1


--===============3217065883882882098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/man-pages: SRC_URI changed from "https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-6.19.tar.gz" to "https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-6.20.tar.gz"
packages/x86-64-v3-poky-linux/man-pages: PV changed from "6.19" to "6.20"
packages/x86-64-v3-poky-linux/man-pages: PKGV changed from 6.19 [default] to 6.20 [default]
packages/x86-64-v3-poky-linux/man-pages/man-pages-bin: PV changed from "6.19" to "6.20"
packages/x86-64-v3-poky-linux/man-pages/man-pages-bin: PKGSIZE changed from 12335 to 18421 (+49%)
packages/x86-64-v3-poky-linux/man-pages/man-pages-bin: PKGV changed from 6.19 [default] to 6.20 [default]
packages/x86-64-v3-poky-linux/man-pages/man-pages-bin: FILELIST: added "/usr/bin/git-bisect-rebase--continue /usr/bin/git-bisect-rebase /usr/bin/git-bisect-rebase--callback"
packages/x86-64-v3-poky-linux/man-pages/man-pages-dbg: PV changed from "6.19" to "6.20"
packages/x86-64-v3-poky-linux/man-pages/man-pages-dbg: PKGV changed from 6.19 [default] to 6.20 [default]
packages/x86-64-v3-poky-linux/man-pages/man-pages-dev: PV changed from "6.19" to "6.20"
packages/x86-64-v3-poky-linux/man-pages/man-pages-dev: PKGV changed from 6.19 [default] to 6.20 [default]
packages/x86-64-v3-poky-linux/man-pages/man-pages-doc: PV changed from "6.19" to "6.20"
packages/x86-64-v3-poky-linux/man-pages/man-pages-doc: PKGV changed from 6.19 [default] to 6.20 [default]
packages/x86-64-v3-poky-linux/man-pages/man-pages-locale: PV changed from "6.19" to "6.20"
packages/x86-64-v3-poky-linux/man-pages/man-pages-locale: PKGV changed from 6.19 [default] to 6.20 [default]
packages/x86-64-v3-poky-linux/man-pages/man-pages-src: PV changed from "6.19" to "6.20"
packages/x86-64-v3-poky-linux/man-pages/man-pages-src: PKGV changed from 6.19 [default] to 6.20 [default]
packages/x86-64-v3-poky-linux/man-pages/man-pages-staticdev: PV changed from "6.19" to "6.20"
packages/x86-64-v3-poky-linux/man-pages/man-pages-staticdev: PKGV changed from 6.19 [default] to 6.20 [default]
packages/x86-64-v3-poky-linux/man-pages/man-pages: PV changed from "6.19" to "6.20"
packages/x86-64-v3-poky-linux/man-pages/man-pages: PKGSIZE changed from 7883262 to 7907073 (+0%)
packages/x86-64-v3-poky-linux/man-pages/man-pages: PKGV changed from 6.19 [default] to 6.20 [default]
packages/x86-64-v3-poky-linux/man-pages/man-pages: FILELIST: added "/usr/share/man/man5/proc_pid_smaps_rollup.5 /usr/share/man/man5/sys_fs.5 /usr/share/man/man5/sys_kernel_mm.5 /usr/share/man/man5/sys_kernel.5 /usr/share/man/man5/sys_firmware.5 /usr/share/man/man5/sys_dev.5 /usr/share/man/man1/git-bisect-rebase.1 /usr/share/man/man5/sys_fs_cgroup.5 /usr/share/man/man5/sys_class.5 /usr/share/man/man5/sys_bus.5 /usr/share/man/man5/sys_fs_smackfs.5 /usr/share/man/man5/sys_kernel_cgroup.5 /usr/share/man/man5/sys_hypervisor.5 /usr/share/man/man5/sys_block.5 /usr/share/man/man5/sys_kernel_debug.5 /usr/share/man/man5/sys_power.5 /usr/share/man/man5/proc_sys_fs_inotify.5 /usr/share/man/man5/sys_class_net.5 /usr/share/man/man5/sys_module.5 /usr/share/man/man5/sys_devices.5 /usr/share/man/man2type/file_attr.2type"

--===============3217065883882882098==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-man-pages-upgrade-6.19-6.20.patch"

RnJvbSBjYjNiYmRmZGU4NDYxZTFkNTEwNjBiODc4OWYzMDEzYzdmYjI1MmQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjIgT2N0IDIwMjYgMDU6Mjk6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
YW4tcGFnZXM6IHVwZ3JhZGUgNi4xOSAtPiA2LjIwCgo9PT09PT09PT09PT09PT09PT09PSBDaGFu
Z2VzIGluIG1hbi1wYWdlcy02LjIwID09PT09PT09PT09PT09PT09PT09ClJlbGVhc2VkOiAyMDI2
LTEwLTIxLCBEb25nbwpnaXQtYmlzZWN0LXJlYmFzZS4xCmZpbGVfYXR0ci4ydHlwZQpwcm9jX3N5
c19mc19pbm90aWZ5LjUoc3BsaXQgZnJvbSBwcm9jX3N5c19mcyg1KSkKc3lzX2Jsb2NrLjUocHJl
dmlvdXNseSwgc3lzZnMoNSkpCnN5c19idXMuNShwcmV2aW91c2x5LCBzeXNmcyg1KSkKc3lzX2Ns
YXNzLjUocHJldmlvdXNseSwgc3lzZnMoNSkpCnN5c19jbGFzc19uZXQuNShwcmV2aW91c2x5LCBz
eXNmcyg1KSkKc3lzX2Rldi41KHByZXZpb3VzbHksIHN5c2ZzKDUpKQpzeXNfZGV2aWNlcy41KHBy
ZXZpb3VzbHksIHN5c2ZzKDUpKQpzeXNfZmlybXdhcmUuNShwcmV2aW91c2x5LCBzeXNmcyg1KSkK
c3lzX2ZzLjUocHJldmlvdXNseSwgc3lzZnMoNSkpCnN5c19mc19jZ3JvdXAuNShwcmV2aW91c2x5
LCBzeXNmcyg1KSkKc3lzX2ZzX3NtYWNrZnMuNShwcmV2aW91c2x5LCBzeXNmcyg1KSkKc3lzX2h5
cGVydmlzb3IuNShwcmV2aW91c2x5LCBzeXNmcyg1KSkKc3lzX2tlcm5lbC41KHByZXZpb3VzbHks
IHN5c2ZzKDUpKQpzeXNfa2VybmVsX2Nncm91cC41KHByZXZpb3VzbHksIHN5c2ZzKDUpKQpzeXNf
a2VybmVsX2RlYnVnLjUocHJldmlvdXNseSwgc3lzZnMoNSkpCnN5c19rZXJuZWxfbW0uNShwcmV2
aW91c2x5LCBzeXNmcyg1KSkKc3lzX21vZHVsZS41KHByZXZpb3VzbHksIHN5c2ZzKDUpKQpzeXNf
cG93ZXIuNShwcmV2aW91c2x5LCBzeXNmcyg1KSkKc3lzZnMuNShzcGxpdCBpbnRvIG1hbnkgcGFn
ZXMpCm1hbjEvCmRpZmZtYW4tZ2l0LjEKLS0KbWFuMi8KZmFsbG9jYXRlLjIKRkFMTE9DX0ZMX1dS
SVRFX1pFUk9FUwptYW4qLwpsYW5kbG9jayouPwpMQU5ETE9DS19BRERfUlVMRV9RVUlFVAptYW41
Lwpwcm9jX3BpZF9zbWFwc19yb2xsdXAuNShwcm9jX3BpZF9zbWFwcyg1KSkKICAgLSAgSW1wcm92
ZSBwb3J0YWJpbGl0eSB0byBzeXN0ZW1zIHdpdGhvdXQgZ2NjKDEpLgogICAtICBBbGxvdyBwcmlu
dGluZyB0aGUgY29tbWFuZHMgd2l0aCBtYWtlKDEpJ3MgLS1uby1zaWxlbnQuCi0gIHNyYy9iaW4v
CiAgIC0gIGdpdC1iaXNlY3QtcmViYXNlOiBBZGQgcHJvZ3JhbS4KLS0tCiAuLi4vbWFuLXBhZ2Vz
L3ttYW4tcGFnZXNfNi4xOS5iYiA9PiBtYW4tcGFnZXNfNi4yMC5iYn0gICAgICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFuLXBhZ2VzL3ttYW4tcGFnZXNfNi4xOS5iYiA9PiBtYW4t
cGFnZXNfNi4yMC5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
bWFuLXBhZ2VzL21hbi1wYWdlc182LjE5LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21hbi1w
YWdlcy9tYW4tcGFnZXNfNi4yMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFuLXBhZ2VzL21hbi1wYWdlc182LjE5LmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbWFuLXBhZ2VzL21hbi1wYWdlc182LjIwLmJiCmluZGV4
IDhhYWY1MjcxZTEuLmEzYWMyZjUzODAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9tYW4tcGFnZXMvbWFuLXBhZ2VzXzYuMTkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L21hbi1wYWdlcy9tYW4tcGFnZXNfNi4yMC5iYgpAQCAtMjAsNyArMjAsNyBAQCBMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9SRUFETUU7bWQ1PTQ5NGYzYWE1ZDQ4NmJhZjIwNjhiNDFlYjFlZWM0
NTcwIFwKIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC9kb2NzLyR7QlBOfS8k
e0JQfS50YXIuZ3ogXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmYzBj
NjIwZjA3YjRlYmE4ZWRlMTI4ZmJjMjY3ZGI1ZWJiNGE2N2JhYjFhY2EzYjAxZTU3MzQ5NTZiYWY1
NTcyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ2ZjMyNTcxM2YyZmQ3NWM4ZDFmNGZhNDI3NDgx
NTM1MjZhNDQ4NDY4MDZkMzcwMjhmYWI4NWNkMDE0M2RlNDYiCiAKIGluaGVyaXQgbWFucGFnZXMg
bGliX3BhY2thZ2UKIAotLSAKMi40Ny4xCgo=

--===============3217065883882882098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="man-pages-changelog.txt"

==================== Changes in man-pages-6.20 ====================
Released: 2026-10-21, Dongo
git-bisect-rebase.1
file_attr.2type
proc_sys_fs_inotify.5(split from proc_sys_fs(5))
sys_block.5(previously, sysfs(5))
sys_bus.5(previously, sysfs(5))
sys_class.5(previously, sysfs(5))
sys_class_net.5(previously, sysfs(5))
sys_dev.5(previously, sysfs(5))
sys_devices.5(previously, sysfs(5))
sys_firmware.5(previously, sysfs(5))
sys_fs.5(previously, sysfs(5))
sys_fs_cgroup.5(previously, sysfs(5))
sys_fs_smackfs.5(previously, sysfs(5))
sys_hypervisor.5(previously, sysfs(5))
sys_kernel.5(previously, sysfs(5))
sys_kernel_cgroup.5(previously, sysfs(5))
sys_kernel_debug.5(previously, sysfs(5))
sys_kernel_mm.5(previously, sysfs(5))
sys_module.5(previously, sysfs(5))
sys_power.5(previously, sysfs(5))
sysfs.5(split into many pages)
man1/
diffman-git.1
--
man2/
fallocate.2
FALLOC_FL_WRITE_ZEROES
man*/
landlock*.?
LANDLOCK_ADD_RULE_QUIET
man5/
proc_pid_smaps_rollup.5(proc_pid_smaps(5))
   -  Improve portability to systems without gcc(1).
   -  Allow printing the commands with make(1)'s --no-silent.
-  src/bin/
   -  git-bisect-rebase: Add program.

--===============3217065883882882098==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/man-pages/man-pages-bin: PKGSIZE changed from 12335 to 18421 (+49%)
packages/x86-64-v3-poky-linux/man-pages/man-pages-bin: FILELIST: added "/usr/bin/git-bisect-rebase--callback /usr/bin/git-bisect-rebase--continue /usr/bin/git-bisect-rebase"
packages/x86-64-v3-poky-linux/man-pages/man-pages: FILELIST: added "/usr/share/man/man5/sys_block.5 /usr/share/man/man5/sys_module.5 /usr/share/man/man5/sys_dev.5 /usr/share/man/man5/sys_kernel_cgroup.5 /usr/share/man/man5/sys_kernel.5 /usr/share/man/man5/sys_hypervisor.5 /usr/share/man/man5/sys_fs.5 /usr/share/man/man5/sys_firmware.5 /usr/share/man/man5/proc_sys_fs_inotify.5 /usr/share/man/man2type/file_attr.2type /usr/share/man/man5/sys_fs_cgroup.5 /usr/share/man/man5/sys_devices.5 /usr/share/man/man5/sys_bus.5 /usr/share/man/man1/git-bisect-rebase.1 /usr/share/man/man5/sys_kernel_mm.5 /usr/share/man/man5/proc_pid_smaps_rollup.5 /usr/share/man/man5/sys_class_net.5 /usr/share/man/man5/sys_fs_smackfs.5 /usr/share/man/man5/sys_kernel_debug.5 /usr/share/man/man5/sys_class.5 /usr/share/man/man5/sys_power.5"

--===============3217065883882882098==--
