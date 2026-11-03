Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5336.1793687202716750930
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 22:26:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jSFo2v2O;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=yd9IK0/H;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a1a016b2fb-ad8b8eee-6444-4bd6-bd48-f11fca2c0fba-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793687204;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mM/Ow3Qmay+IVXsNRE/EqcQQACWK5BZVuL2loG6wD7A=;
	b=jSFo2v2OEioMb0dSBusDcijZqzdMHzZp/sdU5MUknS+aEmoY1S3e8jj+MRldNjzc
	4icAT0wLaaU+0NTuM1Vs0mFDogb/3UeAZyJxEgkBcVyyWTz8Ja8eLxYGiiLpIANJLJk
	ZWqapbKop04/47LtPcvkB+rIE7wb+uoA0IOpVWOY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793687204;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mM/Ow3Qmay+IVXsNRE/EqcQQACWK5BZVuL2loG6wD7A=;
	b=yd9IK0/H0L1PYavxm9vdRhTZ3HoKm/aIuWR6AVh7XA6RMi9xqf8godjT5WEmR/53
	Zd0+UIbg5t0Ktt4p3UfmnfRgZ7MzFYKRZb2k+TrMW2xmsrXckRagFbAnrJdb7i4Qv+r
	9qJh6OvAyMZZPXCvffp1GVAW+MoAcY+GPUaS3fpc=
Content-Type: multipart/mixed; boundary="===============2933015205592631436=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-validation-layers: upgrading to 1.4.363.1 SUCCEEDED
Message-ID: <010101a1a016b2fb-ad8b8eee-6444-4bd6-bd48-f11fca2c0fba-000000@us-west-2.amazonses.com>
Date: Tue, 3 Nov 2026 06:26:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.03-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 06:26:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249239

--===============2933015205592631436==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-validation-layers* to *1.4.363.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-validation-layers-upgrade-1.4.363.0-1.4.363.1.patch
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
From 578cf4363bd7d58d9c6c48ad125ab4f103194941 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 3 Nov 2026 06:16:43 +0000
Subject: [PATCH] vulkan-validation-layers: upgrade 1.4.363.0 -> 1.4.363.1

sync: Fix semaphore host wait for cross-queue synchronization
---
 ...ayers_1.4.363.0.bb => vulkan-validation-layers_1.4.363.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.4.363.0.bb => vulkan-validation-layers_1.4.363.1.bb} (97%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.363.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.363.1.bb
similarity index 97%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.363.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.363.1.bb
index 10f74b49ec..58aa70e9e4 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.363.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.363.1.bb
@@ -9,7 +9,7 @@ LICENSE = "Apache-2.0 AND BSL-1.0 AND MIT AND BSD-2-Clause AND (Apache-2.0 WITH
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=15158583155fe4efc33ea65c1370a177"
 
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.363;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "15c64e73db67e27ff0215708fbe48684a35c6827"
+SRCREV = "317cff060893783f96d4174f50491e6374eb3714"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.47.1


--===============2933015205592631436==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/vulkan-validation-layers: PV changed from "1.4.363.0" to "1.4.363.1"
packages/x86-64-v3-poky-linux/vulkan-validation-layers: PKGV changed from 1.4.363.0 [default] to 1.4.363.1 [default]
packages/x86-64-v3-poky-linux/vulkan-validation-layers: SRC_URI changed from "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.363;protocol=https;tag=vulkan-sdk-1.4.363.0" to "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.363;protocol=https;tag=vulkan-sdk-1.4.363.1"
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dbg: PV changed from "1.4.363.0" to "1.4.363.1"
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dbg: PKGV changed from 1.4.363.0 [default] to 1.4.363.1 [default]
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dbg: PKGSIZE changed from 374107832 to 374144344 (+0%)
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dev: PV changed from "1.4.363.0" to "1.4.363.1"
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-dev: PKGV changed from 1.4.363.0 [default] to 1.4.363.1 [default]
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-doc: PV changed from "1.4.363.0" to "1.4.363.1"
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-doc: PKGV changed from 1.4.363.0 [default] to 1.4.363.1 [default]
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-locale: PV changed from "1.4.363.0" to "1.4.363.1"
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-locale: PKGV changed from 1.4.363.0 [default] to 1.4.363.1 [default]
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-src: PV changed from "1.4.363.0" to "1.4.363.1"
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-src: FILELIST: directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/external/vma -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/external/vma, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/gpuav/resources -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/gpuav/resources, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/vulkan/generated -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/vulkan/generated, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/utils -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/utils, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/gpuav/core -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/gpuav/core, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers -> /usr/src/debug/vulk
 an-validation-layers/1.4.363.1/layers, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/drawdispatch -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/drawdispatch, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/gpuav/shaders/validation_cmd -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/gpuav/shaders/validation_cmd, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/stateless -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/stateless, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/error_message -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/error_message, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/legacy -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/legacy, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/chassis -> /usr/src/debug/vulkan-validation-layers/1.4.36
 3.1/layers/chassis, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/gpuav/spirv -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/gpuav/spirv, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/gpuav/descriptor_validation -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/gpuav/descriptor_validation, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/gpuav/shaders/setup -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/gpuav/shaders/setup, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/gpu_dump -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/gpu_dump, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/gpuav/validation_cmd -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/gpuav/validation_cmd, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/core_checks -> /usr/src/debug/vulkan-valid
 ation-layers/1.4.363.1/layers/core_checks, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/state_tracker -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/state_tracker, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/gpuav/instrumentation -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/gpuav/instrumentation, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/object_tracker -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/object_tracker, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/thread_tracker -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/thread_tracker, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/external -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/external, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/sync -> /usr/src/debug/vulkan-validation-layers/1
 .4.363.1/layers/sync, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/gpuav/debug_printf -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/gpuav/debug_printf, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/best_practices -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/best_practices, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/containers -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/containers, directory renamed /usr/src/debug/vulkan-validation-layers/1.4.363.0/layers/gpuav/shaders -> /usr/src/debug/vulkan-validation-layers/1.4.363.1/layers/gpuav/shaders
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-src: PKGV changed from 1.4.363.0 [default] to 1.4.363.1 [default]
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-src: PKGSIZE changed from 35929616 to 35930513 (+0%)
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-staticdev: PV changed from "1.4.363.0" to "1.4.363.1"
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers-staticdev: PKGV changed from 1.4.363.0 [default] to 1.4.363.1 [default]
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers: PV changed from "1.4.363.0" to "1.4.363.1"
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers: PKGV changed from 1.4.363.0 [default] to 1.4.363.1 [default]
packages/x86-64-v3-poky-linux/vulkan-validation-layers/vulkan-validation-layers: PKGSIZE changed from 29152222 to 29156318 (+0%)

--===============2933015205592631436==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="vulkan-validation-layers-changelog.txt"

sync: Fix semaphore host wait for cross-queue synchronization

--===============2933015205592631436==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-validation-layers-upgrade-1.4.363.0-1.4.363.1.patch"

RnJvbSA1NzhjZjQzNjNiZDdkNThkOWM2YzQ4YWQxMjVhYjRmMTAzMTk0OTQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMyBOb3YgMjAyNiAwNjoxNjo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi12YWxpZGF0aW9uLWxheWVyczogdXBncmFkZSAxLjQuMzYzLjAgLT4gMS40LjM2My4xCgpz
eW5jOiBGaXggc2VtYXBob3JlIGhvc3Qgd2FpdCBmb3IgY3Jvc3MtcXVldWUgc3luY2hyb25pemF0
aW9uCi0tLQogLi4uYXllcnNfMS40LjM2My4wLmJiID0+IHZ1bGthbi12YWxpZGF0aW9uLWxheWVy
c18xLjQuMzYzLjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2Fu
LXZhbGlkYXRpb24tbGF5ZXJzXzEuNC4zNjMuMC5iYiA9PiB2dWxrYW4tdmFsaWRhdGlvbi1sYXll
cnNfMS40LjM2My4xLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy92dWxrYW4vdnVsa2FuLXZhbGlkYXRpb24tbGF5ZXJzXzEuNC4zNjMuMC5iYiBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXZhbGlkYXRpb24tbGF5ZXJzXzEuNC4zNjMuMS5i
YgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
dnVsa2FuL3Z1bGthbi12YWxpZGF0aW9uLWxheWVyc18xLjQuMzYzLjAuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXZhbGlkYXRpb24tbGF5ZXJzXzEuNC4z
NjMuMS5iYgppbmRleCAxMGY3NGI0OWVjLi41OGFhNzBlOWU0IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12YWxpZGF0aW9uLWxheWVyc18xLjQuMzYzLjAu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdmFsaWRhdGlvbi1s
YXllcnNfMS40LjM2My4xLmJiCkBAIC05LDcgKzksNyBAQCBMSUNFTlNFID0gIkFwYWNoZS0yLjAg
QU5EIEJTTC0xLjAgQU5EIE1JVCBBTkQgQlNELTItQ2xhdXNlIEFORCAoQXBhY2hlLTIuMCBXSVRI
CiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9MTUxNTg1ODMxNTVm
ZTRlZmMzM2VhNjVjMTM3MGExNzciCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJv
bm9zR3JvdXAvVnVsa2FuLVZhbGlkYXRpb25MYXllcnMuZ2l0O2JyYW5jaD12dWxrYW4tc2RrLTEu
NC4zNjM7cHJvdG9jb2w9aHR0cHM7dGFnPXZ1bGthbi1zZGstJHtQVn0iCi1TUkNSRVYgPSAiMTVj
NjRlNzNkYjY3ZTI3ZmYwMjE1NzA4ZmJlNDg2ODRhMzVjNjgyNyIKK1NSQ1JFViA9ICIzMTdjZmYw
NjA4OTM3ODNmOTZkNDE3NGY1MDQ5MWU2Mzc0ZWIzNzE0IgogCiBSRVFVSVJFRF9ESVNUUk9fRkVB
VFVSRVMgPSAidnVsa2FuIgogCi0tIAoyLjQ3LjEKCg==

--===============2933015205592631436==--
