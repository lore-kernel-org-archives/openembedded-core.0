Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08021C25B55
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:15:00 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.22327.1701436492161031600
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Da+Fd/aP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=MYARkPHE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018c25848ba8-bb978417-677e-415b-9b74-96e1431722e2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436493;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Xoscda99AzmbxHMs++gPYxh0+N259MAxrx1zqnG+ihU=;
	b=Da+Fd/aPw2mVLM9tf0Oa/rQrrRAFa8C2IE4uEE+OhU0/VUbZgW6tB5vKv0MS5wbt
	GoUFOcFh51Z20PX7n2/NX3drh/OxW0Xabr45/Q2f0P38fiLRuYPgq8Qiu/bJPqQlSES
	iMHNvZGSPqUluMhCD+bvWb1ysvr/iIzhmW+nxllQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436493;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Xoscda99AzmbxHMs++gPYxh0+N259MAxrx1zqnG+ihU=;
	b=MYARkPHERJI76TQIB/TTjuOIgAFJojjfP2I5iTUb7fhuZcdRnSVfU0mdFezpK9wW
	pIpeP5D5Mfbs0PvrPeW4ID7XUhcae7W2FLhwR82LFIiHbtGbA6LLfJfinrQgLHp0WdD
	WG5joLHBsQR+rm+bBWBZJRQRZodES35Sx4Bhv+yQ=
Content-Type: multipart/mixed; boundary="===============7368321729115893401=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Victor Kamensky <victor.kamensky7@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemtap: upgrading to 5.0 FAILED
Message-ID: <0101018c25848ba8-bb978417-677e-415b-9b74-96e1431722e2-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191644

--===============7368321729115893401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemtap* to *5.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-systemtap-upgrade-4.9-5.0.patch
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
From 83bc9b77d0cb53f6bdd7bf6313db98f498482f5c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Dec 2023 12:33:56 +0000
Subject: [PATCH] systemtap: upgrade 4.9 -> 5.0

---
 .../systemtap/0001-release-date-fix.patch     | 37 -------------------
 .../recipes-kernel/systemtap/systemtap_git.bb |  5 ++-
 .../systemtap/systemtap_git.inc               |  4 +-
 3 files changed, 6 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch b/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch
deleted file mode 100644
index 3dcb369ec3..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From ebb424eee5599fcc131901c0d82d0bfc0d2f57ab Mon Sep 17 00:00:00 2001
-From: "Frank Ch. Eigler" <fche@redhat.com>
-Date: Fri, 28 Apr 2023 13:51:27 -0400
-Subject: [PATCH] release date fix
-
-Upstream-Status: Backport
----
- NEWS           | 2 +-
- systemtap.spec | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/NEWS b/NEWS
-index 695bc990c..46859e304 100644
---- a/NEWS
-+++ b/NEWS
-@@ -1,4 +1,4 @@
--* What's new in version 4.9, 2023-04-27
-+* What's new in version 4.9, 2023-04-28
- 
- - ISystemtap: the new interactive systemtap jupyter kernel. This provides
-   a simple GUI for writing/running Systemtap scripts in an easy, incremental
-diff --git a/systemtap.spec b/systemtap.spec
-index 59814f112..fd8023264 100644
---- a/systemtap.spec
-+++ b/systemtap.spec
-@@ -1307,7 +1307,7 @@ exit 0
- 
- # PRERELEASE
- %changelog
--* Thu Apr 27 2023 Frank Ch. Eigler <fche@redhat.com> - 4.9-1
-+* Fri Apr 28 2023 Frank Ch. Eigler <fche@redhat.com> - 4.9-1
- - Upstream release, see wiki page below for detailed notes.
-   https://sourceware.org/systemtap/wiki/SystemTapReleases
- 
--- 
-2.40.1
-
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index d320a8a5e0..03f74cde7c 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -6,7 +6,10 @@ HOMEPAGE = "https://sourceware.org/systemtap/"
 
 require systemtap_git.inc
 
-SRC_URI += " \
+SRC_URI += "git://sourceware.org/git/systemtap.git;branch=master;protocol=https \
+           file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
+           file://0001-Install-python-modules-to-correct-library-dir.patch \
+           file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
            file://0001-improve-reproducibility-for-c-compiling.patch \
            file://0001-staprun-address-ncurses-6.3-failures.patch \
            "
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index de3750ff04..af15239fac 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,7 +1,7 @@
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "418f0a45ca4473491385b5c7eef777607bbdb3b7"
-PV = "4.9"
+SRCREV = "e72dc118e563c645d93a1a2d771e8d90e8fec1ae"
+PV = "5.0"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git;branch=master;protocol=https \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
-- 
2.39.2


--===============7368321729115893401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb: Unable to get checksum for systemtap-uprobes SRC_URI entry 0001-release-date-fix.patch: file could not be found
The following paths were searched:
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap/poky/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-uprobes-5.0/poky/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-uprobes/poky/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/files/poky/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap/qemux86-64/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-uprobes-5.0/qemux86-64/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-uprobes/qemux86-64/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/files/qemux86-64/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap/qemuall/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-uprobes-5.0/qemuall/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-uprobes/qemuall/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/files/qemuall/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap/x86-64/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-uprobes-5.0/x86-64/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-uprobes/x86-64/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/files/x86-64/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-uprobes-5.0/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-uprobes/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/files/0001-release-date-fix.patch
ERROR: /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap_git.bb: Unable to get checksum for nativesdk-systemtap SRC_URI entry 0001-release-date-fix.patch: file could not be found
The following paths were searched:
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-5.0/poky/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap/poky/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/files/poky/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-5.0/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/files/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-5.0/x86-64/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap/x86-64/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/files/x86-64/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-5.0/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/files/0001-release-date-fix.patch
ERROR: /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-native_git.bb: Unable to get checksum for nativesdk-systemtap-native SRC_URI entry 0001-release-date-fix.patch: file could not be found
The following paths were searched:
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-5.0/poky/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap/poky/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/files/poky/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-5.0/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/files/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-5.0/x86-64/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap/x86-64/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/files/x86-64/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap-5.0/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/systemtap/0001-release-date-fix.patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/systemtap/files/0001-release-date-fix.patch
ERROR: Parsing halted due to errors, see error messages above

--===============7368321729115893401==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemtap-upgrade-4.9-5.0.patch"

RnJvbSA4M2JjOWI3N2QwY2I1M2Y2YmRkN2JmNjMxM2RiOThmNDk4NDgyZjVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAxMjozMzo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN5
c3RlbXRhcDogdXBncmFkZSA0LjkgLT4gNS4wCgotLS0KIC4uLi9zeXN0ZW10YXAvMDAwMS1yZWxl
YXNlLWRhdGUtZml4LnBhdGNoICAgICB8IDM3IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9yZWNp
cGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwX2dpdC5iYiB8ICA1ICsrLQogLi4uL3N5c3Rl
bXRhcC9zeXN0ZW10YXBfZ2l0LmluYyAgICAgICAgICAgICAgIHwgIDQgKy0KIDMgZmlsZXMgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCA0MCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0
NCBtZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAvMDAwMS1yZWxlYXNlLWRh
dGUtZml4LnBhdGNoCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAv
c3lzdGVtdGFwLzAwMDEtcmVsZWFzZS1kYXRlLWZpeC5wYXRjaCBiL21ldGEvcmVjaXBlcy1rZXJu
ZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8wMDAxLXJlbGVhc2UtZGF0ZS1maXgucGF0Y2gKZGVsZXRl
ZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDNkY2IzNjllYzMuLjAwMDAwMDAwMDAKLS0tIGEvbWV0
YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwLzAwMDEtcmVsZWFzZS1kYXRlLWZp
eC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDM3ICswLDAgQEAKLUZyb20gZWJiNDI0ZWVlNTU5
OWZjYzEzMTkwMWMwZDgyZDBiZmMwZDJmNTdhYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZy
b206ICJGcmFuayBDaC4gRWlnbGVyIiA8ZmNoZUByZWRoYXQuY29tPgotRGF0ZTogRnJpLCAyOCBB
cHIgMjAyMyAxMzo1MToyNyAtMDQwMAotU3ViamVjdDogW1BBVENIXSByZWxlYXNlIGRhdGUgZml4
Ci0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQKLS0tLQotIE5FV1MgICAgICAgICAgIHwgMiAr
LQotIHN5c3RlbXRhcC5zcGVjIHwgMiArLQotIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvTkVXUyBiL05FV1MKLWluZGV4IDY5
NWJjOTkwYy4uNDY4NTllMzA0IDEwMDY0NAotLS0tIGEvTkVXUwotKysrIGIvTkVXUwotQEAgLTEs
NCArMSw0IEBACi0tKiBXaGF0J3MgbmV3IGluIHZlcnNpb24gNC45LCAyMDIzLTA0LTI3Ci0rKiBX
aGF0J3MgbmV3IGluIHZlcnNpb24gNC45LCAyMDIzLTA0LTI4Ci0gCi0gLSBJU3lzdGVtdGFwOiB0
aGUgbmV3IGludGVyYWN0aXZlIHN5c3RlbXRhcCBqdXB5dGVyIGtlcm5lbC4gVGhpcyBwcm92aWRl
cwotICAgYSBzaW1wbGUgR1VJIGZvciB3cml0aW5nL3J1bm5pbmcgU3lzdGVtdGFwIHNjcmlwdHMg
aW4gYW4gZWFzeSwgaW5jcmVtZW50YWwKLWRpZmYgLS1naXQgYS9zeXN0ZW10YXAuc3BlYyBiL3N5
c3RlbXRhcC5zcGVjCi1pbmRleCA1OTgxNGYxMTIuLmZkODAyMzI2NCAxMDA2NDQKLS0tLSBhL3N5
c3RlbXRhcC5zcGVjCi0rKysgYi9zeXN0ZW10YXAuc3BlYwotQEAgLTEzMDcsNyArMTMwNyw3IEBA
IGV4aXQgMAotIAotICMgUFJFUkVMRUFTRQotICVjaGFuZ2Vsb2cKLS0qIFRodSBBcHIgMjcgMjAy
MyBGcmFuayBDaC4gRWlnbGVyIDxmY2hlQHJlZGhhdC5jb20+IC0gNC45LTEKLSsqIEZyaSBBcHIg
MjggMjAyMyBGcmFuayBDaC4gRWlnbGVyIDxmY2hlQHJlZGhhdC5jb20+IC0gNC45LTEKLSAtIFVw
c3RyZWFtIHJlbGVhc2UsIHNlZSB3aWtpIHBhZ2UgYmVsb3cgZm9yIGRldGFpbGVkIG5vdGVzLgot
ICAgaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9zeXN0ZW10YXAvd2lraS9TeXN0ZW1UYXBSZWxlYXNl
cwotIAotLS0gCi0yLjQwLjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0
ZW10YXAvc3lzdGVtdGFwX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5
c3RlbXRhcF9naXQuYmIKaW5kZXggZDMyMGE4YTVlMC4uMDNmNzRjZGU3YyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwX2dpdC5iYgorKysgYi9tZXRh
L3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXBfZ2l0LmJiCkBAIC02LDcgKzYsMTAg
QEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9zeXN0ZW10YXAvIgogCiByZXF1
aXJlIHN5c3RlbXRhcF9naXQuaW5jCiAKLVNSQ19VUkkgKz0gIiBcCitTUkNfVVJJICs9ICJnaXQ6
Ly9zb3VyY2V3YXJlLm9yZy9naXQvc3lzdGVtdGFwLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29s
PWh0dHBzIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDEtRG8tbm90LWxldC1jb25maWd1cmUtd3Jp
dGUtYS1weXRob24tbG9jYXRpb24taW50by10aC5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8w
MDAxLUluc3RhbGwtcHl0aG9uLW1vZHVsZXMtdG8tY29ycmVjdC1saWJyYXJ5LWRpci5wYXRjaCBc
CisgICAgICAgICAgIGZpbGU6Ly8wMDAxLXN0YXBydW4tc3RhcGJwZi1kb24tdC1zdXBwb3J0LWlu
c3RhbGxpbmctYS1ub24tcm9vdC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWltcHJv
dmUtcmVwcm9kdWNpYmlsaXR5LWZvci1jLWNvbXBpbGluZy5wYXRjaCBcCiAgICAgICAgICAgIGZp
bGU6Ly8wMDAxLXN0YXBydW4tYWRkcmVzcy1uY3Vyc2VzLTYuMy1mYWlsdXJlcy5wYXRjaCBcCiAg
ICAgICAgICAgICIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5
c3RlbXRhcF9naXQuaW5jIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFw
X2dpdC5pbmMKaW5kZXggZGUzNzUwZmYwNC4uYWYxNTIzOWZhYyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwX2dpdC5pbmMKKysrIGIvbWV0YS9yZWNp
cGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwX2dpdC5pbmMKQEAgLTEsNyArMSw3IEBACiBM
SUNFTlNFID0gIkdQTC0yLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJ
Tkc7bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIgotU1JDUkVWID0gIjQxOGYw
YTQ1Y2E0NDczNDkxMzg1YjVjN2VlZjc3NzYwN2JiZGIzYjciCi1QViA9ICI0LjkiCitTUkNSRVYg
PSAiZTcyZGMxMThlNTYzYzY0NWQ5M2ExYTJkNzcxZThkOTBlOGZlYzFhZSIKK1BWID0gIjUuMCIK
IAogU1JDX1VSSSA9ICJnaXQ6Ly9zb3VyY2V3YXJlLm9yZy9naXQvc3lzdGVtdGFwLmdpdDticmFu
Y2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtRG8tbm90
LWxldC1jb25maWd1cmUtd3JpdGUtYS1weXRob24tbG9jYXRpb24taW50by10aC5wYXRjaCBcCi0t
IAoyLjM5LjIKCg==

--===============7368321729115893401==--

