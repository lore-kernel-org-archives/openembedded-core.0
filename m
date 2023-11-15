Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D8EC54FB0
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:14 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.14617.1700059029474879731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KZzAmBoD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QYAnmeza;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018bd36a2b7f-1529631b-9e66-4cda-a280-e16ad15ee414-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059032;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EEMDrdH29VgVlNvHOUj6LCWlSpC5Lht8njcNwTw9x4k=;
	b=KZzAmBoDj9oVjDmq5t16r1HLmZeBw5mA53Hw4mC9IlymAD1rfZJqA6futYLU+yGp
	S2QpMSIP0KoXsuAQrUX/QIfUeAG9/AjDVmGs27cVu9rN9qEG4MCDjAmJl25KzawNeqm
	WLuaqG+UW+yfV0PrY8NdozW8r0N0wsjlabDqWoxc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059032;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EEMDrdH29VgVlNvHOUj6LCWlSpC5Lht8njcNwTw9x4k=;
	b=QYAnmezaJ8Zv643LSRPITCOUt6LspUo98bBBS0fIag26lwSJmEtehrLjEGY2QGz9
	vqcs5oA1Ds/RlUFF/O+jAD5w0WpxxEOkTRhDaQ2P2BZDj/iiu3MHWjvO12kBy6L+c7+
	P+RDjDlThmRLKce3BT5EaCmxTjrBMIWpbwmL5P10=
Content-Type: multipart/mixed; boundary="===============8627217443348478215=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Victor Kamensky <victor.kamensky7@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemtap: upgrading to 5.0 FAILED
Message-ID: <0101018bd36a2b7f-1529631b-9e66-4cda-a280-e16ad15ee414-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190698

--===============8627217443348478215==
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
From 26fea144751658c36c85332c622bfeb687e8d088 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 12:40:00 +0000
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


--===============8627217443348478215==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemtap-upgrade-4.9-5.0.patch"

RnJvbSAyNmZlYTE0NDc1MTY1OGMzNmM4NTMzMmM2MjJiZmViNjg3ZThkMDg4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMTI6NDA6MDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXN0ZW10YXA6IHVwZ3JhZGUgNC45IC0+IDUuMAoKLS0tCiAuLi4vc3lzdGVtdGFwLzAwMDEtcmVs
ZWFzZS1kYXRlLWZpeC5wYXRjaCAgICAgfCAzNyAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4vcmVj
aXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcF9naXQuYmIgfCAgNSArKy0KIC4uLi9zeXN0
ZW10YXAvc3lzdGVtdGFwX2dpdC5pbmMgICAgICAgICAgICAgICB8ICA0ICstCiAzIGZpbGVzIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwLzAwMDEtcmVsZWFzZS1k
YXRlLWZpeC5wYXRjaAoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFw
L3N5c3RlbXRhcC8wMDAxLXJlbGVhc2UtZGF0ZS1maXgucGF0Y2ggYi9tZXRhL3JlY2lwZXMta2Vy
bmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAvMDAwMS1yZWxlYXNlLWRhdGUtZml4LnBhdGNoCmRlbGV0
ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAzZGNiMzY5ZWMzLi4wMDAwMDAwMDAwCi0tLSBhL21l
dGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC8wMDAxLXJlbGVhc2UtZGF0ZS1m
aXgucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzNyArMCwwIEBACi1Gcm9tIGViYjQyNGVlZTU1
OTlmY2MxMzE5MDFjMGQ4MmQwYmZjMGQyZjU3YWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1G
cm9tOiAiRnJhbmsgQ2guIEVpZ2xlciIgPGZjaGVAcmVkaGF0LmNvbT4KLURhdGU6IEZyaSwgMjgg
QXByIDIwMjMgMTM6NTE6MjcgLTA0MDAKLVN1YmplY3Q6IFtQQVRDSF0gcmVsZWFzZSBkYXRlIGZp
eAotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0Ci0tLS0KLSBORVdTICAgICAgICAgICB8IDIg
Ky0KLSBzeXN0ZW10YXAuc3BlYyB8IDIgKy0KLSAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL05FV1MgYi9ORVdTCi1pbmRleCA2
OTViYzk5MGMuLjQ2ODU5ZTMwNCAxMDA2NDQKLS0tLSBhL05FV1MKLSsrKyBiL05FV1MKLUBAIC0x
LDQgKzEsNCBAQAotLSogV2hhdCdzIG5ldyBpbiB2ZXJzaW9uIDQuOSwgMjAyMy0wNC0yNwotKyog
V2hhdCdzIG5ldyBpbiB2ZXJzaW9uIDQuOSwgMjAyMy0wNC0yOAotIAotIC0gSVN5c3RlbXRhcDog
dGhlIG5ldyBpbnRlcmFjdGl2ZSBzeXN0ZW10YXAganVweXRlciBrZXJuZWwuIFRoaXMgcHJvdmlk
ZXMKLSAgIGEgc2ltcGxlIEdVSSBmb3Igd3JpdGluZy9ydW5uaW5nIFN5c3RlbXRhcCBzY3JpcHRz
IGluIGFuIGVhc3ksIGluY3JlbWVudGFsCi1kaWZmIC0tZ2l0IGEvc3lzdGVtdGFwLnNwZWMgYi9z
eXN0ZW10YXAuc3BlYwotaW5kZXggNTk4MTRmMTEyLi5mZDgwMjMyNjQgMTAwNjQ0Ci0tLS0gYS9z
eXN0ZW10YXAuc3BlYwotKysrIGIvc3lzdGVtdGFwLnNwZWMKLUBAIC0xMzA3LDcgKzEzMDcsNyBA
QCBleGl0IDAKLSAKLSAjIFBSRVJFTEVBU0UKLSAlY2hhbmdlbG9nCi0tKiBUaHUgQXByIDI3IDIw
MjMgRnJhbmsgQ2guIEVpZ2xlciA8ZmNoZUByZWRoYXQuY29tPiAtIDQuOS0xCi0rKiBGcmkgQXBy
IDI4IDIwMjMgRnJhbmsgQ2guIEVpZ2xlciA8ZmNoZUByZWRoYXQuY29tPiAtIDQuOS0xCi0gLSBV
cHN0cmVhbSByZWxlYXNlLCBzZWUgd2lraSBwYWdlIGJlbG93IGZvciBkZXRhaWxlZCBub3Rlcy4K
LSAgIGh0dHBzOi8vc291cmNld2FyZS5vcmcvc3lzdGVtdGFwL3dpa2kvU3lzdGVtVGFwUmVsZWFz
ZXMKLSAKLS0tIAotMi40MC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lz
dGVtdGFwL3N5c3RlbXRhcF9naXQuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9z
eXN0ZW10YXBfZ2l0LmJiCmluZGV4IGQzMjBhOGE1ZTAuLjAzZjc0Y2RlN2MgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcF9naXQuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwX2dpdC5iYgpAQCAtNiw3ICs2LDEw
IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vc291cmNld2FyZS5vcmcvc3lzdGVtdGFwLyIKIAogcmVx
dWlyZSBzeXN0ZW10YXBfZ2l0LmluYwogCi1TUkNfVVJJICs9ICIgXAorU1JDX1VSSSArPSAiZ2l0
Oi8vc291cmNld2FyZS5vcmcvZ2l0L3N5c3RlbXRhcC5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2Nv
bD1odHRwcyBcCisgICAgICAgICAgIGZpbGU6Ly8wMDAxLURvLW5vdC1sZXQtY29uZmlndXJlLXdy
aXRlLWEtcHl0aG9uLWxvY2F0aW9uLWludG8tdGgucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8v
MDAwMS1JbnN0YWxsLXB5dGhvbi1tb2R1bGVzLXRvLWNvcnJlY3QtbGlicmFyeS1kaXIucGF0Y2gg
XAorICAgICAgICAgICBmaWxlOi8vMDAwMS1zdGFwcnVuLXN0YXBicGYtZG9uLXQtc3VwcG9ydC1p
bnN0YWxsaW5nLWEtbm9uLXJvb3QucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1pbXBy
b3ZlLXJlcHJvZHVjaWJpbGl0eS1mb3ItYy1jb21waWxpbmcucGF0Y2ggXAogICAgICAgICAgICBm
aWxlOi8vMDAwMS1zdGFwcnVuLWFkZHJlc3MtbmN1cnNlcy02LjMtZmFpbHVyZXMucGF0Y2ggXAog
ICAgICAgICAgICAiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9z
eXN0ZW10YXBfZ2l0LmluYyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRh
cF9naXQuaW5jCmluZGV4IGRlMzc1MGZmMDQuLmFmMTUyMzlmYWMgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcF9naXQuaW5jCisrKyBiL21ldGEvcmVj
aXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcF9naXQuaW5jCkBAIC0xLDcgKzEsNyBAQAog
TElDRU5TRSA9ICJHUEwtMi4wLW9ubHkiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZ
SU5HO21kNT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyIKLVNSQ1JFViA9ICI0MThm
MGE0NWNhNDQ3MzQ5MTM4NWI1YzdlZWY3Nzc2MDdiYmRiM2I3IgotUFYgPSAiNC45IgorU1JDUkVW
ID0gImU3MmRjMTE4ZTU2M2M2NDVkOTNhMWEyZDc3MWU4ZDkwZThmZWMxYWUiCitQViA9ICI1LjAi
CiAKIFNSQ19VUkkgPSAiZ2l0Oi8vc291cmNld2FyZS5vcmcvZ2l0L3N5c3RlbXRhcC5naXQ7YnJh
bmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLURvLW5v
dC1sZXQtY29uZmlndXJlLXdyaXRlLWEtcHl0aG9uLWxvY2F0aW9uLWludG8tdGgucGF0Y2ggXAot
LSAKMi4zOS4yCgo=

--===============8627217443348478215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1843 entries from dependency cache.
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
ERROR: Parsing halted due to errors, see error messages above

--===============8627217443348478215==--

