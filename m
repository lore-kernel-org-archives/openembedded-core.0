Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7412BC63707
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:33 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.46822.1669908626679545683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=c+K3nb8I;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010184ce4f8175-d8bb9c2f-2fae-489d-ae39-c99b79e0018c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908628;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5Av4cHKT8dibh6KUL2TUvWLWcOOvqHShaRTPxk6mS7Q=;
	b=c+K3nb8IeV/s9/rPj5zkdxzvgGeSOJvDJnYeGQk7XvY4cslEoDB6mmfv7MkWP5W9
	lYYQDA0RqlWzCcMg4BvzlnO5Svzpet4WRyidh2ett7Joctt9UkqHI7GA5Pw4PFX0QwR
	pfJ1/oNI4OZfGy5YHLJKhQJJ6j4ndb3q+MJnt6YE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908628;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5Av4cHKT8dibh6KUL2TUvWLWcOOvqHShaRTPxk6mS7Q=;
	b=kS/yNKZnzPbq8hwyfe8ZWBEx4+5VyYU+I8zj+QPUXmbMcpgl0WJVtTlgB8AkA127
	dA8sw4qbW2Ej1jBrKmfAq3Ji6nJDtnJpbLs6LhfXTx5FT41YEBBdstKCZx7psET6LV1
	QDieBSk8uXoar71kBHL7ggCFj4mFeykZtLj3xQ5A=
Content-Type: multipart/mixed; boundary="===============5895982216559452822=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Victor Kamensky <victor.kamensky7@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemtap-uprobes: upgrading to 4.8 SUCCEEDED
Message-ID: <01010184ce4f8175-d8bb9c2f-2fae-489d-ae39-c99b79e0018c-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:27 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174178

--===============5895982216559452822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemtap-uprobes* to *4.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemtap-uprobes-upgrade-4.7-4.8.patch
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
--===============5895982216559452822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/systemtap: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap: SRC_URI changed from "git://sourceware.org/git/systemtap.git;branch=master file://0001-Do-not-let-configure-write-a-python-location-into-th.patch file://0001-Install-python-modules-to-correct-library-dir.patch file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch file://python-3.11.patch file://0001-improve-reproducibility-for-c-compiling.patch file://0001-staprun-address-ncurses-6.3-failures.patch" to "git://sourceware.org/git/systemtap.git;branch=master file://0001-Do-not-let-configure-write-a-python-location-into-th.patch file://0001-Install-python-modules-to-correct-library-dir.patch file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch file://0001-improve-reproducibility-for-c-compiling.patch file://0001-staprun-address-ncurses-6.3-failures.patch"
packages/core2-32-poky-linux/systemtap: PKGV changed from 4.7 [default] to 4.8 [default]
Changes to packages/core2-32-poky-linux/systemtap (sysroot):
  /usr/share/systemtap/examples/general/pyexample.stp was added
  /usr/share/systemtap/examples/security-band-aids/cve-2016-0728-templatized.stp was added
  /usr/share/systemtap/examples/security-band-aids/cve-2018-6485-templatized.stp was added
  /usr/share/systemtap/examples/security-band-aids/security-bandaid-template.stp was added
  /usr/share/systemtap/tapset/livepatch.stp was added
  /usr/share/systemtap/examples/general/py2example.stp was removed
  /usr/share/systemtap/examples/general/py3example.stp was removed
  /usr/share/systemtap/examples/general/tapset was removed
  /usr/share/systemtap/examples/general/tapset/python2_local.stp was removed
  /usr/share/systemtap/examples/general/tapset/python3_local.stp was removed
  /usr/share/systemtap/examples/general/tapset/python_local.stpm was removed
packages/core2-32-poky-linux/systemtap/systemtap-dbg: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-dbg: PKGSIZE changed from 58106136 to 58645048 (+1%)
packages/core2-32-poky-linux/systemtap/systemtap-dbg: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-dev: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-dev: PKGSIZE changed from 22718 to 22433 (-1%)
packages/core2-32-poky-linux/systemtap/systemtap-dev: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-doc: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-doc: PKGSIZE changed from 468954 to 469215 (+0%)
packages/core2-32-poky-linux/systemtap/systemtap-doc: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-examples: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-examples: FILELIST: removed "/usr/share/systemtap/examples/general/tapset/python2_local.stp /usr/share/systemtap/examples/general/py3example.stp /usr/share/systemtap/examples/general/py2example.stp /usr/share/systemtap/examples/general/tapset/python_local.stpm /usr/share/systemtap/examples/general/tapset/python3_local.stp", added "/usr/share/systemtap/examples/general/pyexample.stp /usr/share/systemtap/examples/security-band-aids/cve-2016-0728-templatized.stp /usr/share/systemtap/examples/security-band-aids/security-bandaid-template.stp /usr/share/systemtap/examples/security-band-aids/cve-2018-6485-templatized.stp"
packages/core2-32-poky-linux/systemtap/systemtap-examples: PKGSIZE changed from 1505292 to 1484450 (-1%)
packages/core2-32-poky-linux/systemtap/systemtap-examples: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-exporter: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-exporter: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-locale-cs: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-locale-cs: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-locale-en: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-locale-en: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-locale-fr: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-locale-fr: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-locale-pl: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-locale-pl: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-python: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-python: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-runtime: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-runtime: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-src: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-src: PKGSIZE changed from 2914280 to 2942351 (+1%)
packages/core2-32-poky-linux/systemtap/systemtap-src: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap-staticdev: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap-staticdev: PKGV changed from 4.7 [default] to 4.8 [default]
packages/core2-32-poky-linux/systemtap/systemtap: PV changed from "4.7" to "4.8"
packages/core2-32-poky-linux/systemtap/systemtap: FILELIST: added "/usr/share/systemtap/tapset/livepatch.stp"
packages/core2-32-poky-linux/systemtap/systemtap: PKGSIZE changed from 9613929 to 9680063 (+1%)
packages/core2-32-poky-linux/systemtap/systemtap: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes: SRC_URI changed from "git://sourceware.org/git/systemtap.git;branch=master file://0001-Do-not-let-configure-write-a-python-location-into-th.patch file://0001-Install-python-modules-to-correct-library-dir.patch file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch file://python-3.11.patch" to "git://sourceware.org/git/systemtap.git;branch=master file://0001-Do-not-let-configure-write-a-python-location-into-th.patch file://0001-Install-python-modules-to-correct-library-dir.patch file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch"
packages/qemux86-poky-linux/systemtap-uprobes: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-dbg: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-dbg: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-dev: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-dev: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-doc: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-doc: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-locale: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-locale: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-src: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-src: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-staticdev: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes-staticdev: PKGV changed from 4.7 [default] to 4.8 [default]
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes: PV changed from "4.7" to "4.8"
packages/qemux86-poky-linux/systemtap-uprobes/systemtap-uprobes: PKGV changed from 4.7 [default] to 4.8 [default]

--===============5895982216559452822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/systemtap (sysroot):
  /usr/share/systemtap/examples/general/pyexample.stp was added
  /usr/share/systemtap/examples/security-band-aids/cve-2016-0728-templatized.stp was added
  /usr/share/systemtap/examples/security-band-aids/cve-2018-6485-templatized.stp was added
  /usr/share/systemtap/examples/security-band-aids/security-bandaid-template.stp was added
  /usr/share/systemtap/tapset/livepatch.stp was added
  /usr/share/systemtap/examples/general/py2example.stp was removed
  /usr/share/systemtap/examples/general/py3example.stp was removed
  /usr/share/systemtap/examples/general/tapset was removed
  /usr/share/systemtap/examples/general/tapset/python2_local.stp was removed
  /usr/share/systemtap/examples/general/tapset/python3_local.stp was removed
  /usr/share/systemtap/examples/general/tapset/python_local.stpm was removed
packages/core2-32-poky-linux/systemtap/systemtap-examples: FILELIST: removed "/usr/share/systemtap/examples/general/tapset/python2_local.stp /usr/share/systemtap/examples/general/tapset/python3_local.stp /usr/share/systemtap/examples/general/py2example.stp /usr/share/systemtap/examples/general/tapset/python_local.stpm /usr/share/systemtap/examples/general/py3example.stp", added "/usr/share/systemtap/examples/security-band-aids/cve-2018-6485-templatized.stp /usr/share/systemtap/examples/security-band-aids/cve-2016-0728-templatized.stp /usr/share/systemtap/examples/security-band-aids/security-bandaid-template.stp /usr/share/systemtap/examples/general/pyexample.stp"
packages/core2-32-poky-linux/systemtap/systemtap: FILELIST: added "/usr/share/systemtap/tapset/livepatch.stp"

--===============5895982216559452822==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemtap-uprobes-upgrade-4.7-4.8.patch"

RnJvbSA1YjNlMzhhYWFhYTU0ODFhZGJiNWVjZTI5MjliNDMxMzA3Zjg2NGMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAxMzozOTozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN5
c3RlbXRhcC11cHJvYmVzOiB1cGdyYWRlIDQuNyAtPiA0LjgKCi0tLQogLi4uL3N5c3RlbXRhcC9z
eXN0ZW10YXAtdXByb2Jlc19naXQuYmIgICAgICAgIHwgIDEgKwogLi4uL3N5c3RlbXRhcC9zeXN0
ZW10YXAvcHl0aG9uLTMuMTEucGF0Y2ggICAgIHwgMzcgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4u
L3N5c3RlbXRhcC9zeXN0ZW10YXBfZ2l0LmluYyAgICAgICAgICAgICAgIHwgIDUgKy0tCiAzIGZp
bGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9k
ZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwL3B5dGhvbi0z
LjExLnBhdGNoCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lz
dGVtdGFwLXVwcm9iZXNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lz
dGVtdGFwLXVwcm9iZXNfZ2l0LmJiCmluZGV4IDIxODFlNDVhOGQuLmFhYzJiODcxYTcgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcC11cHJvYmVzX2dp
dC5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAtdXByb2Jl
c19naXQuYmIKQEAgLTM4LDMgKzM4LDQgQEAgZG9faW5zdGFsbCgpIHsKIAkJaW5zdGFsbCAtbSAw
NjQ0ICR7U30vcnVudGltZS91cHJvYmVzL3Vwcm9iZXMua28gJHtEfSR7ZGF0YWRpcn0vc3lzdGVt
dGFwL3J1bnRpbWUvdXByb2Jlcy8KIAlmaQogfQorCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
a2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAvcHl0aG9uLTMuMTEucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXAvcHl0aG9uLTMuMTEucGF0Y2gKZGVsZXRlZCBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDZlMGM5N2I4ZDYuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9y
ZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwL3B5dGhvbi0zLjExLnBhdGNoCisrKyAv
ZGV2L251bGwKQEAgLTEsMzcgKzAsMCBAQAotRnJvbSAwNjllMTA5Yzk1ZDFhZmNhMTdjZDM3ODFi
MzlmMjIwY2Y4YjM5OTc4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogU3RhbiBDb3gg
PHNjb3hAcmVkaGF0LmNvbT4KLURhdGU6IFdlZCwgMTMgSnVsIDIwMjIgMDk6NDk6NTEgLTA0MDAK
LVN1YmplY3Q6IFtQQVRDSCAxLzFdIHB5dGhvbiAzLjExIHJlbW92ZWQgZGlyZWN0IGFjY2VzcyB0
byBQeUZyYW1lT2JqZWN0Ci0gbWVtYmVycwotCi1UYWtlIGludG8gYWNjb3VudCB0aGUgY2hhbmdl
IGluIFB5RnJhbWVPYmplY3QgZGVmaW5pdGlvbiB0byBhbGxvdwotYnVpbGRpbmcgc3lzdGVtdGFw
IHdpdGggcHl0aG9uIDMuMTEuICBBZGRpdGlvbmFsIHN1cHBvcnQgZm9yIHB5dGhvbgotMy4xMSBp
cyBmb3J0aGNvbWluZy4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9zb3Vy
Y2V3YXJlLm9yZy9naXQvP3A9c3lzdGVtdGFwLmdpdDthPWNvbW1pdDtoPTA2OWUxMDljOTVkMWFm
Y2ExN2NkMzc4MWIzOWYyMjBjZjhiMzk5NzhdCi1TaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgotLS0tCi0gcHl0aG9uL0hlbHBlclNEVC9fSGVscGVy
U0RULmMgfCA2ICsrKysrKwotIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKLQotZGlm
ZiAtLWdpdCBhL3B5dGhvbi9IZWxwZXJTRFQvX0hlbHBlclNEVC5jIGIvcHl0aG9uL0hlbHBlclNE
VC9fSGVscGVyU0RULmMKLWluZGV4IDk2N2NiNjA3Ny4uNGQyODcxMzJlIDEwMDY0NAotLS0tIGEv
cHl0aG9uL0hlbHBlclNEVC9fSGVscGVyU0RULmMKLSsrKyBiL3B5dGhvbi9IZWxwZXJTRFQvX0hl
bHBlclNEVC5jCi1AQCAtMTQsNyArMTQsMTMgQEAKLSAvLyBQUjI1ODQxOiBlbnN1cmUgdGhhdCB0
aGUgbGliSGVscGVyU0RULnNvIGZpbGUgY29udGFpbnMgZGVidWdpbmZvCi0gLy8gZm9yIHRoZSB0
YXBzZXQgaGVscGVyIGZ1bmN0aW9ucywgc28gdGhleSBkb24ndCBoYXZlIHRvIGxvb2sgaW50byBs
aWJweXRob24qCi0gI2luY2x1ZGUgPGZyYW1lb2JqZWN0Lmg+Ci0rLy8gcHl0aG9uIDMuMTEgcmVt
b3ZlZCBkaXJlY3QgYWNjZXNzIHRvIFB5RnJhbWVPYmplY3QgbWVtYmVycwotKy8vIGh0dHBzOi8v
ZG9jcy5weXRob24ub3JnLzMuMTEvd2hhdHNuZXcvMy4xMS5odG1sI2MtYXBpLWNoYW5nZXMKLSsj
aWYgUFlfTUFKT1JfVkVSU0lPTiA8PSAzICYmIFBZX01JTk9SX1ZFUlNJT04gPCAxMQotIFB5RnJh
bWVPYmplY3QgX2R1bW15X2ZyYW1lOwotKyNlbHNlCi0rLy9QeUZyYW1lT2JqZWN0ICpfZHVtbXlf
ZnJhbWU7Ci0rI2VuZGlmCi0gI2luY2x1ZGUgPG9iamVjdC5oPgotIFB5VmFyT2JqZWN0IF9kdW1t
eV92YXI7Ci0gI2luY2x1ZGUgPGRpY3RvYmplY3QuaD4KLS0tIAotMi4zMS4xCi0KZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcF9naXQuaW5jIGIvbWV0
YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwX2dpdC5pbmMKaW5kZXggYjA1YTVh
MmIwZC4uZDMwOWE4OTQ5NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10
YXAvc3lzdGVtdGFwX2dpdC5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAv
c3lzdGVtdGFwX2dpdC5pbmMKQEAgLTEsMTMgKzEsMTIgQEAKIExJQ0VOU0UgPSAiR1BMLTIuMC1v
bmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YjIzNGVlNGQ2OWY1
ZmNlNDQ4NmE4MGZkYWY0YTQyNjMiCi1TUkNSRVYgPSAiMGMzMzVhNzVhNzg5ZmY0NGI1MTRlNTY3
ZDQ1ODg4MWUxNWNjMjgzZCIKLVBWID0gIjQuNyIKK1NSQ1JFViA9ICJiMTc2YWZiMmU0OTExOWVm
ODQ0ZDE5M2QyN2IwNzUyYTZkODRmZThmIgorUFYgPSAiNC44IgogCiBTUkNfVVJJID0gImdpdDov
L3NvdXJjZXdhcmUub3JnL2dpdC9zeXN0ZW10YXAuZ2l0O2JyYW5jaD1tYXN0ZXIgXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1Eby1ub3QtbGV0LWNvbmZpZ3VyZS13cml0ZS1hLXB5dGhvbi1sb2Nh
dGlvbi1pbnRvLXRoLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtSW5zdGFsbC1weXRo
b24tbW9kdWxlcy10by1jb3JyZWN0LWxpYnJhcnktZGlyLnBhdGNoIFwKICAgICAgICAgICAgZmls
ZTovLzAwMDEtc3RhcHJ1bi1zdGFwYnBmLWRvbi10LXN1cHBvcnQtaW5zdGFsbGluZy1hLW5vbi1y
b290LnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovL3B5dGhvbi0zLjExLnBhdGNoIFwKICAgICAg
ICAgICAgIgogCiBDT01QQVRJQkxFX0hPU1QgPSAnKHg4Nl82NHxpLjg2fHBvd2VycGN8YXJtfGFh
cmNoNjR8bWljcm9ibGF6ZWVsfG1pcHN8cmlzY3Y2NCkuKi1saW51eCcKLS0gCjIuMzEuMQoK

--===============5895982216559452822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1669 targets, 49 skipped, 0 masked, 0 errors.
Removing 63 recipes from the core2-32 sysroot...done.
Removing 65 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'systemtap-uprobes'
systemtap-uprobes was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============5895982216559452822==--

