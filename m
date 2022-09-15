Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A5BC6FD2B
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web12.10520.1663251512770482893
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=eSD7KJ+B;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 010101834183f879-83acc3e5-3f5a-4b20-a3a0-bbe31ca832a9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tSoBXa5d1SMLaKpCkh8tOVEqWPpFcax1cEfFYKhed84=;
	b=eSD7KJ+BRlXc0iEWxTHs86s0668fQFvup6Cej8rdfSZALcmkiTClxP8ngd8X6xbK
	IH4WkBcu8I9nv4qxfU6p5sKVdaCQVhd+CMk6yCcjkdvukvMFGynCH3sjtv9DAqGXUvE
	lzUYlFInPrsm4WL5FZS3F1Jo18eytqmNafFVjiqU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251511;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tSoBXa5d1SMLaKpCkh8tOVEqWPpFcax1cEfFYKhed84=;
	b=DfvWsknQcvyAr+vTHXiwPN93N3XyQHuq22/Ni6K+iwqdhQ1YZO+IJMwGWTlPcx7l
	hI1kghvOlX8/h3L2EyaESc0t+H7YivG+sIFNB5/J3Gp0d/vvVqRBM0U3E0Wcyn40UCN
	pKO3o8YB9uufJCQDfxt2LjNG8WzCRzITGYSvjpSI=
Content-Type: multipart/mixed; boundary="===============2805858560050659062=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ovmf: upgrading to edk2-stable202208 FAILED
Message-ID: 
 <010101834183f879-83acc3e5-3f5a-4b20-a3a0-bbe31ca832a9-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:31 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170708

--===============2805858560050659062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ovmf* to *edk2-stable202208* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-ovmf-upgrade-edk2-stable202205-edk2-stable202208.patch
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
--===============2805858560050659062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 2 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-9678f57e62c5980be734f0a9437672fbe6dc8ed9"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9678f57e62c5980be734f0a9437672fbe6dc8ed9"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 25 Local 14 Mirrors 0 Missed 11 Current 238 (56% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 806 of 1137 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_fetch)
NOTE: Running task 820 of 1137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_fetch)
NOTE: recipe ovmf-edk2-stable202208-r0: task do_fetch: Started
NOTE: recipe ovmf-native-edk2-stable202208-r0: task do_fetch: Started
NOTE: recipe ovmf-edk2-stable202208-r0: task do_fetch: Succeeded
NOTE: Running task 1114 of 1137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_unpack)
NOTE: recipe ovmf-edk2-stable202208-r0: task do_unpack: Started
NOTE: recipe ovmf-native-edk2-stable202208-r0: task do_fetch: Succeeded
NOTE: Running task 1115 of 1137 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_unpack)
NOTE: Running task 1116 of 1137 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe ovmf-native-edk2-stable202208-r0: task do_unpack: Started
NOTE: recipe ovmf-native-edk2-stable202208-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ovmf-native-edk2-stable202208-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ovmf-edk2-stable202208-r0: task do_unpack: Succeeded
NOTE: Running task 1117 of 1137 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_patch)
NOTE: recipe ovmf-edk2-stable202208-r0: task do_patch: Started
NOTE: recipe ovmf-edk2-stable202208-r0: task do_patch: Failed
NOTE: recipe ovmf-native-edk2-stable202208-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1117 tasks of which 1111 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_patch
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: ovmf-edk2-stable202208-r0 do_patch: Applying patch '0005-Committing-changes-from-do_patch.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ovmf/edk2-stable202208-r0/git'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ovmf/edk2-stable202208-r0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0005-Committing-changes-from-do_patch.patch
patching file BaseTools/Source/C/Makefiles/app.makefile
Hunk #1 FAILED at 10 (different line endings).
1 out of 1 hunk FAILED -- rejects in file BaseTools/Source/C/Makefiles/app.makefile
patching file BaseTools/Source/C/VfrCompile/GNUmakefile
Hunk #1 FAILED at 18 (different line endings).
1 out of 1 hunk FAILED -- rejects in file BaseTools/Source/C/VfrCompile/GNUmakefile
patching file OvmfPkg/build.sh
Patch 0005-Committing-changes-from-do_patch.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/ovmf/edk2-stable202208-r0/temp/log.do_patch.308591
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ovmf/ovmf_git.bb:do_patch) failed with exit code '1'

--===============2805858560050659062==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ovmf-upgrade-edk2-stable202205-edk2-stable202208.patch"

RnJvbSA2ZGFkYzViMTg5NzczMTkwNzAxMWY4NmY4YjIwZDUwNjYzNjVkNjQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMDY6NTU6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
dm1mOiB1cGdyYWRlIGVkazItc3RhYmxlMjAyMjA1IC0+IGVkazItc3RhYmxlMjAyMjA4CgotLS0K
IC4uLjAwNS1Db21taXR0aW5nLWNoYW5nZXMtZnJvbS1kb19wYXRjaC5wYXRjaCB8IDY0ICsrKysr
KysrKysrKysrKysrKysKIG1ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZl9naXQuYmIgICAgICAg
ICAgICB8ICA1ICstCiAyIGZpbGVzIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mLzAw
MDUtQ29tbWl0dGluZy1jaGFuZ2VzLWZyb20tZG9fcGF0Y2gucGF0Y2gKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWYvMDAwNS1Db21taXR0aW5nLWNoYW5nZXMtZnJvbS1k
b19wYXRjaC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZi8wMDA1LUNvbW1pdHRp
bmctY2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAuLjRjZGY3YTI0ODAKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhL3JlY2lwZXMt
Y29yZS9vdm1mL292bWYvMDAwNS1Db21taXR0aW5nLWNoYW5nZXMtZnJvbS1kb19wYXRjaC5wYXRj
aApAQCAtMCwwICsxLDY0IEBACitGcm9tIDlmOTAxZTgxOGU1ZjUxNzQ0Y2JiNGE4NWY1Njc5ODg5
YTkxNmQ0MDcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBPcGVuRW1iZWRkZWQgPG9l
LnBhdGNoQG9lPgorRGF0ZTogVGh1LCAxNSBTZXAgMjAyMiAwNjo1NDo1NyArMDAwMAorU3ViamVj
dDogW1BBVENIXSBDb21taXR0aW5nIGNoYW5nZXMgZnJvbSBkb19wYXRjaAorCistLS0KKyBCYXNl
VG9vbHMvU291cmNlL0MvTWFrZWZpbGVzL2FwcC5tYWtlZmlsZSB8ICA2ICsrKysrKworIEJhc2VU
b29scy9Tb3VyY2UvQy9WZnJDb21waWxlL0dOVW1ha2VmaWxlIHwgMTAgKysrKysrKysrKworIE92
bWZQa2cvYnVpbGQuc2ggICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KKyAzIGZpbGVz
IGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKKworZGlmZiAtLWdpdCBh
L0Jhc2VUb29scy9Tb3VyY2UvQy9NYWtlZmlsZXMvYXBwLm1ha2VmaWxlIGIvQmFzZVRvb2xzL1Nv
dXJjZS9DL01ha2VmaWxlcy9hcHAubWFrZWZpbGUKK2luZGV4IDZhMmE4ZjVlOGEuLjU5MTNkMjI2
ODAgMTAwNjQ0CistLS0gYS9CYXNlVG9vbHMvU291cmNlL0MvTWFrZWZpbGVzL2FwcC5tYWtlZmls
ZQorKysrIGIvQmFzZVRvb2xzL1NvdXJjZS9DL01ha2VmaWxlcy9hcHAubWFrZWZpbGUKK0BAIC0x
MCw2ICsxMCwxMiBAQCBNQUtFUk9PVCA/PSAuLi8uLgorIGluY2x1ZGUgJChNQUtFUk9PVCkvTWFr
ZWZpbGVzL2hlYWRlci5tYWtlZmlsZQorIAorIEFQUExJQ0FUSU9OID0gJChNQUtFUk9PVCkvYmlu
LyQoQVBQTkFNRSkKKytDQyA9IHg4Nl82NC1wb2t5LWxpbnV4LWdjYyAgLW02NCAtbWFyY2g9Y29y
ZTIgLW10dW5lPWNvcmUyIC1tc3NlMyAtbWZwbWF0aD1zc2UgLWZzdGFjay1wcm90ZWN0b3Itc3Ry
b25nICAtTzIgLURfRk9SVElGWV9TT1VSQ0U9MiAtV2Zvcm1hdCAtV2Zvcm1hdC1zZWN1cml0eSAt
V2Vycm9yPWZvcm1hdC1zZWN1cml0eSAtLXN5c3Jvb3Q9L2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdv
cmtlci9hdWgvYnVpbGQvYnVpbGQvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9v
dm1mL2VkazItc3RhYmxlMjAyMjA1LXIwL2RldnRvb2x0bXAtZnNhZGk3dDUvd29ya2Rpci9yZWNp
cGUtc3lzcm9vdAorK0NYWCA9IHg4Nl82NC1wb2t5LWxpbnV4LWcrKyAgLW02NCAtbWFyY2g9Y29y
ZTIgLW10dW5lPWNvcmUyIC1tc3NlMyAtbWZwbWF0aD1zc2UgLWZzdGFjay1wcm90ZWN0b3Itc3Ry
b25nICAtTzIgLURfRk9SVElGWV9TT1VSQ0U9MiAtV2Zvcm1hdCAtV2Zvcm1hdC1zZWN1cml0eSAt
V2Vycm9yPWZvcm1hdC1zZWN1cml0eSAtLXN5c3Jvb3Q9L2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdv
cmtlci9hdWgvYnVpbGQvYnVpbGQvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9v
dm1mL2VkazItc3RhYmxlMjAyMjA1LXIwL2RldnRvb2x0bXAtZnNhZGk3dDUvd29ya2Rpci9yZWNp
cGUtc3lzcm9vdAorK0FTID0geDg2XzY0LXBva3ktbGludXgtYXMgIAorK0FSID0geDg2XzY0LXBv
a3ktbGludXgtZ2NjLWFyCisrTEQgPSB4ODZfNjQtcG9reS1saW51eC1sZCAtLXN5c3Jvb3Q9L2hv
bWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgvYnVpbGQvYnVpbGQvYnVpbGQvdG1wL3dvcmsv
Y29yZTItNjQtcG9reS1saW51eC9vdm1mL2VkazItc3RhYmxlMjAyMjA1LXIwL2RldnRvb2x0bXAt
ZnNhZGk3dDUvd29ya2Rpci9yZWNpcGUtc3lzcm9vdCAgCisrTElOS0VSID0gJChDQykKKyAKKyAu
UEhPTlk6YWxsCisgYWxsOiAkKE1BS0VST09UKS9iaW4gJChBUFBMSUNBVElPTikKK2RpZmYgLS1n
aXQgYS9CYXNlVG9vbHMvU291cmNlL0MvVmZyQ29tcGlsZS9HTlVtYWtlZmlsZSBiL0Jhc2VUb29s
cy9Tb3VyY2UvQy9WZnJDb21waWxlL0dOVW1ha2VmaWxlCitpbmRleCBmYzMyOTk0NGI5Li5hMGJh
MzljZjdmIDEwMDY0NAorLS0tIGEvQmFzZVRvb2xzL1NvdXJjZS9DL1ZmckNvbXBpbGUvR05VbWFr
ZWZpbGUKKysrKyBiL0Jhc2VUb29scy9Tb3VyY2UvQy9WZnJDb21waWxlL0dOVW1ha2VmaWxlCitA
QCAtMTgsOCArMTgsMTggQEAgT0JKRUNUUyA9IEFQYXJzZXIubyBETGV4ZXJCYXNlLm8gQVRva2Vu
QnVmZmVyLm8gRWZpVmZyUGFyc2VyLm8gVmZyTGV4ZXIubyBWZnJTeW4KKyAgICAgICAgICAgVmZy
Rm9ybVBrZy5vIFZmckVycm9yLm8gVmZyVXRpbGl0eUxpYi5vIFZmckNvbXBpbGVyLm8KKyBpZmVx
ICgkKENYWCksIGxsdm0pCisgVkZSX0NQUEZMQUdTID0gLVduby1kZXByZWNhdGVkLXJlZ2lzdGVy
IC1EUENDVFNfVVNFX05BTUVTUEFDRV9TVEQgJChCVUlMRF9DUFBGTEFHUykKKytDQyA9IHg4Nl82
NC1wb2t5LWxpbnV4LWdjYyAgLW02NCAtbWFyY2g9Y29yZTIgLW10dW5lPWNvcmUyIC1tc3NlMyAt
bWZwbWF0aD1zc2UgLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nICAtTzIgLURfRk9SVElGWV9TT1VS
Q0U9MiAtV2Zvcm1hdCAtV2Zvcm1hdC1zZWN1cml0eSAtV2Vycm9yPWZvcm1hdC1zZWN1cml0eSAt
LXN5c3Jvb3Q9L2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgvYnVpbGQvYnVpbGQvYnVp
bGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9vdm1mL2VkazItc3RhYmxlMjAyMjA1LXIw
L2RldnRvb2x0bXAtZnNhZGk3dDUvd29ya2Rpci9yZWNpcGUtc3lzcm9vdAorK0NYWCA9IHg4Nl82
NC1wb2t5LWxpbnV4LWcrKyAgLW02NCAtbWFyY2g9Y29yZTIgLW10dW5lPWNvcmUyIC1tc3NlMyAt
bWZwbWF0aD1zc2UgLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nICAtTzIgLURfRk9SVElGWV9TT1VS
Q0U9MiAtV2Zvcm1hdCAtV2Zvcm1hdC1zZWN1cml0eSAtV2Vycm9yPWZvcm1hdC1zZWN1cml0eSAt
LXN5c3Jvb3Q9L2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgvYnVpbGQvYnVpbGQvYnVp
bGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9vdm1mL2VkazItc3RhYmxlMjAyMjA1LXIw
L2RldnRvb2x0bXAtZnNhZGk3dDUvd29ya2Rpci9yZWNpcGUtc3lzcm9vdAorK0FTID0geDg2XzY0
LXBva3ktbGludXgtYXMgIAorK0FSID0geDg2XzY0LXBva3ktbGludXgtZ2NjLWFyCisrTEQgPSB4
ODZfNjQtcG9reS1saW51eC1sZCAtLXN5c3Jvb3Q9L2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtl
ci9hdWgvYnVpbGQvYnVpbGQvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9vdm1m
L2VkazItc3RhYmxlMjAyMjA1LXIwL2RldnRvb2x0bXAtZnNhZGk3dDUvd29ya2Rpci9yZWNpcGUt
c3lzcm9vdCAgCisgZWxzZQorIFZGUl9DUFBGTEFHUyA9IC1EUENDVFNfVVNFX05BTUVTUEFDRV9T
VEQgJChCVUlMRF9DUFBGTEFHUykKKytDQyA9IHg4Nl82NC1wb2t5LWxpbnV4LWdjYyAgLW02NCAt
bWFyY2g9Y29yZTIgLW10dW5lPWNvcmUyIC1tc3NlMyAtbWZwbWF0aD1zc2UgLWZzdGFjay1wcm90
ZWN0b3Itc3Ryb25nICAtTzIgLURfRk9SVElGWV9TT1VSQ0U9MiAtV2Zvcm1hdCAtV2Zvcm1hdC1z
ZWN1cml0eSAtV2Vycm9yPWZvcm1hdC1zZWN1cml0eSAtLXN5c3Jvb3Q9L2hvbWUvcG9reWJ1aWxk
L3lvY3RvLXdvcmtlci9hdWgvYnVpbGQvYnVpbGQvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9r
eS1saW51eC9vdm1mL2VkazItc3RhYmxlMjAyMjA1LXIwL2RldnRvb2x0bXAtZnNhZGk3dDUvd29y
a2Rpci9yZWNpcGUtc3lzcm9vdAorK0NYWCA9IHg4Nl82NC1wb2t5LWxpbnV4LWcrKyAgLW02NCAt
bWFyY2g9Y29yZTIgLW10dW5lPWNvcmUyIC1tc3NlMyAtbWZwbWF0aD1zc2UgLWZzdGFjay1wcm90
ZWN0b3Itc3Ryb25nICAtTzIgLURfRk9SVElGWV9TT1VSQ0U9MiAtV2Zvcm1hdCAtV2Zvcm1hdC1z
ZWN1cml0eSAtV2Vycm9yPWZvcm1hdC1zZWN1cml0eSAtLXN5c3Jvb3Q9L2hvbWUvcG9reWJ1aWxk
L3lvY3RvLXdvcmtlci9hdWgvYnVpbGQvYnVpbGQvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9r
eS1saW51eC9vdm1mL2VkazItc3RhYmxlMjAyMjA1LXIwL2RldnRvb2x0bXAtZnNhZGk3dDUvd29y
a2Rpci9yZWNpcGUtc3lzcm9vdAorK0FTID0geDg2XzY0LXBva3ktbGludXgtYXMgIAorK0FSID0g
eDg2XzY0LXBva3ktbGludXgtZ2NjLWFyCisrTEQgPSB4ODZfNjQtcG9reS1saW51eC1sZCAtLXN5
c3Jvb3Q9L2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9hdWgvYnVpbGQvYnVpbGQvYnVpbGQv
dG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9vdm1mL2VkazItc3RhYmxlMjAyMjA1LXIwL2Rl
dnRvb2x0bXAtZnNhZGk3dDUvd29ya2Rpci9yZWNpcGUtc3lzcm9vdCAgCisgZW5kaWYKKyAjIGtl
ZXAgQlVJTERfT1BURkxBR1MgbGFzdAorIFZGUl9DWFhGTEFHUyA9ICQoQlVJTERfT1BURkxBR1Mp
CitkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9idWlsZC5zaCBiL092bWZQa2cvYnVpbGQuc2gKK2luZGV4
IDE4NThkYWUzMWEuLmMwYzQwOThlOTcgMTAwNzU1CistLS0gYS9Pdm1mUGtnL2J1aWxkLnNoCisr
KysgYi9Pdm1mUGtnL2J1aWxkLnNoCitAQCAtMjQsNyArMjQsNyBAQCB0aGVuCisgIyB0aGlzIGFz
c3VtZXMgc3ZuIHB1bGxzIGhhdmUgdGhlIHNhbWUgcm9vdCBkaXIKKyAjICBleHBvcnQgRURLX1RP
T0xTX1BBVEg9YHB3ZGAvLi4vQmFzZVRvb2xzCisgIyBUaGlzIHZlcnNpb24gaXMgZm9yIHRoZSB0
b29scyBzb3VyY2UgaW4gZWRrMgorLSAgZXhwb3J0IEVES19UT09MU19QQVRIPUJCQUtFX0VES19U
T09MU19QQVRIL0Jhc2VUb29scworKyAgZXhwb3J0IEVES19UT09MU19QQVRIPS9ob21lL3Bva3li
dWlsZC95b2N0by13b3JrZXIvYXVoL2J1aWxkL2J1aWxkL2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0
LXBva3ktbGludXgvb3ZtZi9lZGsyLXN0YWJsZTIwMjIwNS1yMC9kZXZ0b29sdG1wLWZzYWRpN3Q1
L3dvcmtkaXIvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vZWRrMl9iYXNldG9vbHMvQmFz
ZVRvb2xzCisgICBlY2hvICRFREtfVE9PTFNfUEFUSAorICAgc291cmNlIGVka3NldHVwLnNoIEJh
c2VUb29scworIGVsc2UKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZl9n
aXQuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9vdm1mL292bWZfZ2l0LmJiCmluZGV4IDQwNTQyMjM5
ZTIuLjg5ZDdiZjM4MzMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL292bWYvb3ZtZl9n
aXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvb3ZtZi9vdm1mX2dpdC5iYgpAQCAtMjQsMTAg
KzI0LDExIEBAIFNSQ19VUkkgPSAiZ2l0c206Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyLmdp
dDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAgZmlsZTovLzAwMDIt
QmFzZVRvb2xzLW1ha2VmaWxlLWFkanVzdC10by1idWlsZC1pbi11bmRlci1iaXRiYWtlLnBhdGNo
IFwKICAgICAgICAgICAgZmlsZTovLzAwMDUtZGVidWctcHJlZml4LW1hcC5wYXRjaCBcCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDA2LXJlcHJvZHVjaWJsZS5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6
Ly8wMDA1LUNvbW1pdHRpbmctY2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNoIFwKICAgICAgICAg
ICAgIgogCi1QViA9ICJlZGsyLXN0YWJsZTIwMjIwNSIKLVNSQ1JFViA9ICIxNjc3OWVkZTJkMzY2
YmZjNmI3MDJlODE3MzU2Y2NmNDM0MjViY2M4IgorUFYgPSAiZWRrMi1zdGFibGUyMDIyMDgiCitT
UkNSRVYgPSAiYmEwZTBlNGM2YTE3NGI3MWIxOGNjZDZlNDczMTljYzQ1ODc4ODkzYyIKIFVQU1RS
RUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIig/UDxwdmVyPmVkazItc3RhYmxlLiopIgogCiBpbmhl
cml0IGRlcGxveQotLSAKMi4zMS4xCgo=

--===============2805858560050659062==--

