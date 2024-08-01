Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE85C54742
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:12 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.75737.1722536823011266854
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cEsNgIE8;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=3qjynpkn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101910f32040f-34b4c016-e01b-45eb-8f86-b7721f5e48ea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NgGRSKP+PHDJh0UDkuqF/uohih8VELblk0eTW63s/JU=;
	b=cEsNgIE82NnFzrWyeOTWxZVUkAYhyXCmnwnuJRPdHqltOuFEnmbq8ltaiPqMq9mW
	EKwaawjHYn7ssmBgm2yNgFbR6eCW1g02/Nq6BTg1Ztb9hSvlPA49DoTOmJ6DeBlwNKY
	UqcMhzCXUtRvGKS9dvdpqeZdPMu+FBEumYHqcYL0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NgGRSKP+PHDJh0UDkuqF/uohih8VELblk0eTW63s/JU=;
	b=3qjynpknzuWMzWvWRNDljePhYNArazHk+WufNxM1mj45KOodEFeUfO7b1BKCApgB
	viZLX4oSogw8p3sUgeWv2sOnt1OkDxHQDn2lpzBYuvRO7YYHp4p3lsfzkHDCMIDRf0u
	7k90Kcms1rwI9FKptm8z/Z2ywNkXWcu6+SArgK2I=
Content-Type: multipart/mixed; boundary="===============5233007729842904279=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>, Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva-initial,libva: upgrading to 2.22.0,2.22.0 SUCCEEDED
Message-ID: <010101910f32040f-34b4c016-e01b-45eb-8f86-b7721f5e48ea-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202772

--===============5233007729842904279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libva-initial,libva* to *2.22.0,2.22.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libva-initial-libva-upgrade-2.20.0-2.22.0-2.20.0-2.2.patch
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
From ca5241dea37cca23e7f78d468ff6e818f552d660 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 07:38:54 +0000
Subject: [PATCH] libva-initial,libva: upgrade 2.20.0 -> 2.22.0,2.20.0 ->
 2.22.0

---
 .../libva/{libva-initial_2.20.0.bb => libva-initial_2.22.0.bb}  | 0
 meta/recipes-graphics/libva/libva.inc                           | 2 +-
 .../recipes-graphics/libva/{libva_2.20.0.bb => libva_2.22.0.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva-initial_2.20.0.bb => libva-initial_2.22.0.bb} (100%)
 rename meta/recipes-graphics/libva/{libva_2.20.0.bb => libva_2.22.0.bb} (100%)

diff --git a/meta/recipes-graphics/libva/libva-initial_2.20.0.bb b/meta/recipes-graphics/libva/libva-initial_2.22.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva-initial_2.20.0.bb
rename to meta/recipes-graphics/libva/libva-initial_2.22.0.bb
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index 486291bced..784ab8b79f 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -18,7 +18,7 @@ LICENSE = "MIT"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "f72bdb4f48dfe71ad01f1cbefe069672a2c949a6abd51cf3c4d4784210badc49"
+SRC_URI[sha256sum] = "e3da2250654c8d52b3f59f8cb3f3d8e7fb1a2ee64378dbc400fbc5663de7edb8"
 
 S = "${WORKDIR}/libva-${PV}"
 
diff --git a/meta/recipes-graphics/libva/libva_2.20.0.bb b/meta/recipes-graphics/libva/libva_2.22.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva_2.20.0.bb
rename to meta/recipes-graphics/libva/libva_2.22.0.bb
-- 
2.44.0


--===============5233007729842904279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libva-initial/libva-initial-dev: FILELIST: added "/usr/include/va/va_dec_vvc.h"
Changes to packages/core2-64-poky-linux/libva-initial (sysroot):
  /usr/include/va/va_dec_vvc.h was added
packages/core2-64-poky-linux/libva/libva-dev: FILELIST: added "/usr/include/va/va_dec_vvc.h /usr/include/va/va_dri3.h /usr/include/va/va_trace.h"
packages/core2-64-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva-glx.so.2.2000.0", added "/usr/lib/libva-glx.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva-src: PKGSIZE changed from 1106445 to 1254668 (+13%)
packages/core2-64-poky-linux/libva/libva-wayland: PKGSIZE changed from 18689 to 27033 (+45%)
packages/core2-64-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva-wayland.so.2.2000.0", added "/usr/lib/libva-wayland.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva-x11: PKGSIZE changed from 26741 to 30837 (+15%)
packages/core2-64-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva-x11.so.2.2000.0", added "/usr/lib/libva-x11.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva: PKGSIZE changed from 208966 to 233542 (+12%)
packages/core2-64-poky-linux/libva/libva: FILELIST: removed "/usr/lib/libva.so.2.2000.0 /usr/lib/libva-drm.so.2.2000.0", added "/usr/lib/libva-drm.so.2.2200.0 /usr/lib/libva.so.2.2200.0"
Changes to packages/core2-64-poky-linux/libva (sysroot):
  /usr/lib/libva-drm.so.2 changed symlink target from libva-drm.so.2.2000.0 to libva-drm.so.2.2200.0
  /usr/lib/libva-glx.so.2 changed symlink target from libva-glx.so.2.2000.0 to libva-glx.so.2.2200.0
  /usr/lib/libva.so.2 changed symlink target from libva.so.2.2000.0 to libva.so.2.2200.0
  /usr/lib/libva-wayland.so.2 changed symlink target from libva-wayland.so.2.2000.0 to libva-wayland.so.2.2200.0
  /usr/lib/libva-x11.so.2 changed symlink target from libva-x11.so.2.2000.0 to libva-x11.so.2.2200.0
  /usr/lib/libva-drm.so.2.2000.0 moved to /usr/lib/libva-drm.so.2.2200.0
  /usr/lib/libva-glx.so.2.2000.0 moved to /usr/lib/libva-glx.so.2.2200.0
  /usr/lib/libva.so.2.2000.0 moved to /usr/lib/libva.so.2.2200.0
  /usr/lib/libva-wayland.so.2.2000.0 moved to /usr/lib/libva-wayland.so.2.2200.0
  /usr/lib/libva-x11.so.2.2000.0 moved to /usr/lib/libva-x11.so.2.2200.0
  /usr/include/va/va_dec_vvc.h was added
  /usr/include/va/va_dri3.h was added
  /usr/include/va/va_trace.h was added

--===============5233007729842904279==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libva-initial-libva-upgrade-2.20.0-2.22.0-2.20.0-2.2.patch"

RnJvbSBjYTUyNDFkZWEzN2NjYTIzZTdmNzhkNDY4ZmY2ZTgxOGY1NTJkNjYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAwNzozODo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnZhLWluaXRpYWwsbGlidmE6IHVwZ3JhZGUgMi4yMC4wIC0+IDIuMjIuMCwyLjIwLjAgLT4KIDIu
MjIuMAoKLS0tCiAuLi4vbGlidmEve2xpYnZhLWluaXRpYWxfMi4yMC4wLmJiID0+IGxpYnZhLWlu
aXRpYWxfMi4yMi4wLmJifSAgfCAwCiBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEu
aW5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiAuLi4vcmVjaXBlcy1ncmFwaGlj
cy9saWJ2YS97bGlidmFfMi4yMC4wLmJiID0+IGxpYnZhXzIuMjIuMC5iYn0gfCAwCiAzIGZpbGVz
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL2xpYnZhL3tsaWJ2YS1pbml0aWFsXzIuMjAuMC5iYiA9PiBsaWJ2YS1pbml0
aWFsXzIuMjIuMC5iYn0gKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZh
L3tsaWJ2YV8yLjIwLjAuYmIgPT4gbGlidmFfMi4yMi4wLmJifSAoMTAwJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEtaW5pdGlhbF8yLjIwLjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEtaW5pdGlhbF8yLjIyLjAuYmIKc2ltaWxh
cml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS9s
aWJ2YS1pbml0aWFsXzIuMjAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xp
YnZhL2xpYnZhLWluaXRpYWxfMi4yMi4wLmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvbGlidmEvbGlidmEuaW5jIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZh
LmluYwppbmRleCA0ODYyOTFiY2VkLi43ODRhYjhiNzlmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9s
aWJ2YS9saWJ2YS5pbmMKQEAgLTE4LDcgKzE4LDcgQEAgTElDRU5TRSA9ICJNSVQiCiAKIFNSQ19V
UkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7UFZ9L2xpYnZhLSR7UFZ9LnRhci5i
ejIiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT0yZTQ4OTQwZjk0YWNi
MGFmNTgyZTVlZjAzNTM3ODAwZiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmNzJiZGI0ZjQ4ZGZl
NzFhZDAxZjFjYmVmZTA2OTY3MmEyYzk0OWE2YWJkNTFjZjNjNGQ0Nzg0MjEwYmFkYzQ5IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gImUzZGEyMjUwNjU0YzhkNTJiM2Y1OWY4Y2IzZjNkOGU3ZmIxYTJl
ZTY0Mzc4ZGJjNDAwZmJjNTY2M2RlN2VkYjgiCiAKIFMgPSAiJHtXT1JLRElSfS9saWJ2YS0ke1BW
fSIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhXzIuMjAu
MC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS9saWJ2YV8yLjIyLjAuYmIKc2ltaWxh
cml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS9s
aWJ2YV8yLjIwLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS9saWJ2
YV8yLjIyLjAuYmIKLS0gCjIuNDQuMAoK

--===============5233007729842904279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libva-initial: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva-initial: SRC_URI changed from "https://github.com/intel/libva/releases/download/2.20.0/libva-2.20.0.tar.bz2" to "https://github.com/intel/libva/releases/download/2.22.0/libva-2.22.0.tar.bz2"
packages/core2-64-poky-linux/libva-initial: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva-initial/libva-initial-dbg: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva-initial/libva-initial-dbg: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva-initial/libva-initial-dev: PKGSIZE changed from 630594 to 673071 (+7%)
packages/core2-64-poky-linux/libva-initial/libva-initial-dev: FILELIST: added "/usr/include/va/va_dec_vvc.h"
packages/core2-64-poky-linux/libva-initial/libva-initial-dev: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva-initial/libva-initial-dev: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva-initial/libva-initial-doc: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva-initial/libva-initial-doc: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva-initial/libva-initial-locale: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva-initial/libva-initial-locale: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva-initial/libva-initial-src: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva-initial/libva-initial-src: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva-initial/libva-initial-staticdev: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva-initial/libva-initial-staticdev: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva-initial/libva-initial: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva-initial/libva-initial: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
Changes to packages/core2-64-poky-linux/libva-initial (sysroot):
  /usr/include/va/va_dec_vvc.h was added
packages/core2-64-poky-linux/libva: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva: SRC_URI changed from "https://github.com/intel/libva/releases/download/2.20.0/libva-2.20.0.tar.bz2" to "https://github.com/intel/libva/releases/download/2.22.0/libva-2.22.0.tar.bz2"
packages/core2-64-poky-linux/libva: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-dbg: PKGSIZE changed from 850280 to 935016 (+10%)
packages/core2-64-poky-linux/libva/libva-dbg: FILELIST: removed "/usr/lib/.debug/libva-glx.so.2.2000.0 /usr/lib/.debug/libva-x11.so.2.2000.0 /usr/lib/.debug/libva-drm.so.2.2000.0 /usr/lib/.debug/libva-wayland.so.2.2000.0 /usr/lib/.debug/libva.so.2.2000.0", added "/usr/lib/.debug/libva-glx.so.2.2200.0 /usr/lib/.debug/libva-x11.so.2.2200.0 /usr/lib/.debug/libva-drm.so.2.2200.0 /usr/lib/.debug/libva-wayland.so.2.2200.0 /usr/lib/.debug/libva.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva-dbg: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-dbg: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-dev: PKGSIZE changed from 652185 to 713337 (+9%)
packages/core2-64-poky-linux/libva/libva-dev: FILELIST: added "/usr/include/va/va_dri3.h /usr/include/va/va_dec_vvc.h /usr/include/va/va_trace.h"
packages/core2-64-poky-linux/libva/libva-dev: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-dev: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-doc: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-doc: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-glx: FILELIST: removed "/usr/lib/libva-glx.so.2.2000.0", added "/usr/lib/libva-glx.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva-glx: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-glx: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-locale: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-locale: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-src: PKGSIZE changed from 1106445 to 1254668 (+13%)
packages/core2-64-poky-linux/libva/libva-src: FILELIST: directory renamed /usr/src/debug/libva/2.20.0/va/glx -> /usr/src/debug/libva/2.22.0/va/glx, directory renamed /usr/src/debug/libva/2.20.0/va/drm -> /usr/src/debug/libva/2.22.0/va/drm, directory renamed /usr/src/debug/libva/2.20.0/va/x11 -> /usr/src/debug/libva/2.22.0/va/x11, removed "/usr/src/debug/libva/2.20.0/va/va_str.h /usr/src/debug/libva/2.20.0/va/va_str.c /usr/src/debug/libva/2.20.0/va/wayland/va_backend_wayland.h /usr/src/debug/libva/2.20.0/va/va_internal.h /usr/src/debug/libva/2.20.0/va/va_vpp.h /usr/src/debug/libva/2.20.0/va/va_enc_h264.h /usr/src/debug/libva/2.20.0/va/va_drmcommon.h /usr/src/debug/libva/2.20.0/va/va_backend_vpp.h /usr/src/debug/libva/2.20.0/va/va_enc_mpeg2.h /usr/src/debug/libva/2.20.0/va/va_x11.h /usr/src/debug/libva/2.20.0/va/wayland/va_wayland_drm.c /usr/src/debug/libva/2.20.0/va/va_dec_vp9.h /usr/src/debug/libva/2.20.0/va/va_enc_vp9.h /usr/src/debug/libva/2.20.0/va/wayland/va_wayland_drm.h /usr/sr
 c/debug/libva/2.20.0/va/va_dec_vp8.h /usr/src/debug/libva/2.20.0/va/va_dec_jpeg.h /usr/src/debug/libva/2.20.0/va/va_enc_jpeg.h /usr/src/debug/libva/2.20.0/va/va_enc_vp8.h /usr/src/debug/libva/2.20.0/va/wayland/va_wayland.c /usr/src/debug/libva/2.20.0/va/va_prot.h /usr/src/debug/libva/2.20.0/va/wayland/va_wayland_private.h /usr/src/debug/libva/2.20.0/va/va_backend.h /usr/src/debug/libva/2.20.0/va/wayland-drm-client-protocol.c /usr/src/debug/libva/2.20.0/va/va_dec_av1.h /usr/src/debug/libva/2.20.0/va/va_enc_av1.h /usr/src/debug/libva/2.20.0/va/wayland-drm-client-protocol.h /usr/src/debug/libva/2.20.0/va/va_compat.c /usr/src/debug/libva/2.20.0/va/va_dec_hevc.h /usr/src/debug/libva/2.20.0/va/va.h /usr/src/debug/libva/2.20.0/va/va_backend_prot.h /usr/src/debug/libva/2.20.0/va/va_enc_hevc.h /usr/src/debug/libva/2.20.0/va/va_trace.c /usr/src/debug/libva/2.20.0/va/va.c /usr/src/debug/libva/2.20.0/va/va_trace.h", added "/usr/src/debug/libva/2.22.0/va/va_backend.h /usr/src/debug/libva/2.22.0/
 va/va_dec_av1.h /usr/src/debug/libva/2.22.0/va/va_enc_av1.h /usr/src/debug/libva/2.22.0/va/va_internal.h /usr/src/debug/libva/2.22.0/va/va_drmcommon.h /usr/src/debug/libva/2.22.0/va/va_backend_prot.h /usr/src/debug/libva/2.22.0/va/va_enc_mpeg2.h /usr/src/debug/libva/2.22.0/va/va.c /usr/src/debug/libva/2.22.0/va/va_prot.h /usr/src/debug/libva/2.22.0/va/va.h /usr/src/debug/libva/2.22.0/va/va_compat.c /usr/src/debug/libva/2.22.0/va/va_dec_jpeg.h /usr/src/debug/libva/2.22.0/va/va_enc_jpeg.h /usr/src/debug/libva/2.22.0/va/va_backend_vpp.h /usr/src/debug/libva/2.22.0/va/wayland/va_wayland_drm.h /usr/src/debug/libva/2.22.0/va/wayland/va_wayland.c /usr/src/debug/libva/2.22.0/va/va_trace.c /usr/src/debug/libva/2.22.0/va/wayland-drm-client-protocol.h /usr/src/debug/libva/2.22.0/va/va_trace.h /usr/src/debug/libva/2.22.0/va/wayland/va_wayland_private.h /usr/src/debug/libva/2.22.0/va/wayland/va_wayland_drm.c /usr/src/debug/libva/2.22.0/va/wayland/va_backend_wayland.h /usr/src/debug/libva/2.22.0/
 va/wayland-drm-client-protocol.c /usr/src/debug/libva/2.22.0/va/va_dec_vp8.h /usr/src/debug/libva/2.22.0/va/va_enc_vp8.h /usr/src/debug/libva/2.22.0/va/va_dec_vp9.h /usr/src/debug/libva/2.22.0/va/va_enc_vp9.h /usr/src/debug/libva/2.22.0/va/linux-dmabuf-v1-client-protocol.h /usr/src/debug/libva/2.22.0/va/va_str.h /usr/src/debug/libva/2.22.0/va/va_vpp.h /usr/src/debug/libva/2.22.0/va/va_enc_hevc.h /usr/src/debug/libva/2.22.0/va/va_dec_hevc.h /usr/src/debug/libva/2.22.0/va/linux-dmabuf-v1-client-protocol.c /usr/src/debug/libva/2.22.0/va/va_str.c /usr/src/debug/libva/2.22.0/va/va_x11.h /usr/src/debug/libva/2.22.0/va/va_enc_h264.h /usr/src/debug/libva/2.22.0/va/va_dec_vvc.h /usr/src/debug/libva/2.22.0/va/wayland/va_wayland_linux_dmabuf.h /usr/src/debug/libva/2.22.0/va/wayland/va_wayland_linux_dmabuf.c"
packages/core2-64-poky-linux/libva/libva-src: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-src: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-staticdev: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-staticdev: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-wayland: PKGSIZE changed from 18689 to 27033 (+45%)
packages/core2-64-poky-linux/libva/libva-wayland: FILELIST: removed "/usr/lib/libva-wayland.so.2.2000.0", added "/usr/lib/libva-wayland.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva-wayland: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-wayland: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva-x11: PKGSIZE changed from 26741 to 30837 (+15%)
packages/core2-64-poky-linux/libva/libva-x11: FILELIST: removed "/usr/lib/libva-x11.so.2.2000.0", added "/usr/lib/libva-x11.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva-x11: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva-x11: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
packages/core2-64-poky-linux/libva/libva: PKGSIZE changed from 208966 to 233542 (+12%)
packages/core2-64-poky-linux/libva/libva: FILELIST: removed "/usr/lib/libva.so.2.2000.0 /usr/lib/libva-drm.so.2.2000.0", added "/usr/lib/libva-drm.so.2.2200.0 /usr/lib/libva.so.2.2200.0"
packages/core2-64-poky-linux/libva/libva: PV changed from "2.20.0" to "2.22.0"
packages/core2-64-poky-linux/libva/libva: PKGV changed from 2.20.0 [default] to 2.22.0 [default]
Changes to packages/core2-64-poky-linux/libva (sysroot):
  /usr/lib/libva-drm.so.2 changed symlink target from libva-drm.so.2.2000.0 to libva-drm.so.2.2200.0
  /usr/lib/libva-glx.so.2 changed symlink target from libva-glx.so.2.2000.0 to libva-glx.so.2.2200.0
  /usr/lib/libva.so.2 changed symlink target from libva.so.2.2000.0 to libva.so.2.2200.0
  /usr/lib/libva-wayland.so.2 changed symlink target from libva-wayland.so.2.2000.0 to libva-wayland.so.2.2200.0
  /usr/lib/libva-x11.so.2 changed symlink target from libva-x11.so.2.2000.0 to libva-x11.so.2.2200.0
  /usr/lib/libva-drm.so.2.2000.0 moved to /usr/lib/libva-drm.so.2.2200.0
  /usr/lib/libva-glx.so.2.2000.0 moved to /usr/lib/libva-glx.so.2.2200.0
  /usr/lib/libva.so.2.2000.0 moved to /usr/lib/libva.so.2.2200.0
  /usr/lib/libva-wayland.so.2.2000.0 moved to /usr/lib/libva-wayland.so.2.2200.0
  /usr/lib/libva-x11.so.2.2000.0 moved to /usr/lib/libva-x11.so.2.2200.0
  /usr/include/va/va_dec_vvc.h was added
  /usr/include/va/va_dri3.h was added
  /usr/include/va/va_trace.h was added

--===============5233007729842904279==--

