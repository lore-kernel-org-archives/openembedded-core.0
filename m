Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135A0C5AD2C
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 06:00:03 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4795.1786255202118238028
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 23:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=lIShmZVI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BI5Wpi4O;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019fe51b52fb-e6d93df0-a962-4397-9b50-b1318cbf574d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786255201;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TPmZKm1byGjoBIkRpPKmV4re+nNTvHYLs4IKukzTBV4=;
	b=lIShmZVICrDEWDAAxWvYlB0UIJkyimvTA4o3siJYFpINSnub0yUuGJB9UNhW2HLv
	KmRK/2wF6+2XAIYzU/NEJZpoE8YPgm1WGMkcSi06ttJNzgBkYdiWRdm8Gd8qYJDVVSQ
	Hx64VZF+JmNvxLKnw+EmmuElLLbFqZF/T9Hh86iw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786255201;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TPmZKm1byGjoBIkRpPKmV4re+nNTvHYLs4IKukzTBV4=;
	b=BI5Wpi4OVaf3cyDBcXkjK7e9tTn5v7LdcFzlJn8jA3JF+9FLlDtA8cfHw6IEpr//
	P81RGzE+vZ6we3RYb+/jG0XbZzFkNNcMzSORLh1CnSIMnemP8fqq4avads5wjJ6RwVQ
	NQ22lWqMSJjkrYIcurc6rdZNaH1fnFVIuSAGXlNE=
Content-Type: multipart/mixed; boundary="===============3651164024661795183=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?b?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm-sequoia-crypto-policy: upgrading to
 c42da772d5fcedc55aee8f2a3348e7d718551910 SUCCEEDED
Message-ID: <0101019fe51b52fb-e6d93df0-a962-4397-9b50-b1318cbf574d-000000@us-west-2.amazonses.com>
Date: Sun, 9 Aug 2026 06:00:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.09-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 06:00:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243059

--===============3651164024661795183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm-sequoia-crypto-policy* to *c42da772d5fcedc55aee8f2a3348e7d718551910* has Succeeded.

Next steps:
    - apply the patch: git am 0001-rpm-sequoia-crypto-policy-upgrade-to-latest-revision.patch
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
From aeb36946a7cf9849d66e3f5c146a3da3b2bd4bca Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 9 Aug 2026 05:35:40 +0000
Subject: [PATCH] rpm-sequoia-crypto-policy: upgrade to latest revision

c42da77 Add support for SLH-DSA variants standardized in OpenPGP
b952499 openssh: add mldsa44-ed25519 signature algorithm
6ce654c .gitlab-ci.yml: stop installing oqsprovider
e26630f java: use CHACHA20_POLY1305 cipher name...
275d084 java: fix MD5withECDSA concatenating with RIPEMD160withRSA
742b3ad policies/modules/NO-HMAC-SHA1: introduce
fb779fc java: use SHA3-### names with a dash
---
 .../rpm-sequoia/rpm-sequoia-crypto-policy_git.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index 1c97938e08..c094f3b205 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -10,7 +10,7 @@ inherit allarch python3native
 
 SRC_URI = "git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master"
 
-SRCREV = "1abb8a404613f33a2f98eb83e827b046d0820048"
+SRCREV = "c42da772d5fcedc55aee8f2a3348e7d718551910"
 UPSTREAM_CHECK_COMMITS = "1"
 
 do_compile () {
-- 
2.47.1


--===============3651164024661795183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/rpm-sequoia-crypto-policy/rpm-sequoia-crypto-policy: PKGSIZE changed from 1985 to 2093 (+5%)

--===============3651164024661795183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="rpm-sequoia-crypto-policy-changelog.txt"

Changelog for rpm-sequoia-crypto-policy: git -> git

c42da77 Add support for SLH-DSA variants standardized in OpenPGP
b952499 openssh: add mldsa44-ed25519 signature algorithm
6ce654c .gitlab-ci.yml: stop installing oqsprovider
e26630f java: use CHACHA20_POLY1305 cipher name...
275d084 java: fix MD5withECDSA concatenating with RIPEMD160withRSA
742b3ad policies/modules/NO-HMAC-SHA1: introduce
fb779fc java: use SHA3-### names with a dash

--===============3651164024661795183==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rpm-sequoia-crypto-policy-upgrade-to-latest-revision.patch"

RnJvbSBhZWIzNjk0NmE3Y2Y5ODQ5ZDY2ZTNmNWMxNDZhM2RhM2IyYmQ0YmNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgOSBBdWcgMjAyNiAwNTozNTo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJw
bS1zZXF1b2lhLWNyeXB0by1wb2xpY3k6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgpjNDJk
YTc3IEFkZCBzdXBwb3J0IGZvciBTTEgtRFNBIHZhcmlhbnRzIHN0YW5kYXJkaXplZCBpbiBPcGVu
UEdQCmI5NTI0OTkgb3BlbnNzaDogYWRkIG1sZHNhNDQtZWQyNTUxOSBzaWduYXR1cmUgYWxnb3Jp
dGhtCjZjZTY1NGMgLmdpdGxhYi1jaS55bWw6IHN0b3AgaW5zdGFsbGluZyBvcXNwcm92aWRlcgpl
MjY2MzBmIGphdmE6IHVzZSBDSEFDSEEyMF9QT0xZMTMwNSBjaXBoZXIgbmFtZS4uLgoyNzVkMDg0
IGphdmE6IGZpeCBNRDV3aXRoRUNEU0EgY29uY2F0ZW5hdGluZyB3aXRoIFJJUEVNRDE2MHdpdGhS
U0EKNzQyYjNhZCBwb2xpY2llcy9tb2R1bGVzL05PLUhNQUMtU0hBMTogaW50cm9kdWNlCmZiNzc5
ZmMgamF2YTogdXNlIFNIQTMtIyMjIG5hbWVzIHdpdGggYSBkYXNoCi0tLQogLi4uL3JwbS1zZXF1
b2lhL3JwbS1zZXF1b2lhLWNyeXB0by1wb2xpY3lfZ2l0LmJiICAgICAgICAgICAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JwbS1zZXF1b2lhL3JwbS1zZXF1b2lhLWNyeXB0
by1wb2xpY3lfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JwbS1zZXF1b2lhL3JwbS1z
ZXF1b2lhLWNyeXB0by1wb2xpY3lfZ2l0LmJiCmluZGV4IDFjOTc5MzhlMDguLmMwOTRmM2IyMDUg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ycG0tc2VxdW9pYS9ycG0tc2VxdW9p
YS1jcnlwdG8tcG9saWN5X2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtLXNl
cXVvaWEvcnBtLXNlcXVvaWEtY3J5cHRvLXBvbGljeV9naXQuYmIKQEAgLTEwLDcgKzEwLDcgQEAg
aW5oZXJpdCBhbGxhcmNoIHB5dGhvbjNuYXRpdmUKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIu
Y29tL3JlZGhhdC1jcnlwdG8vZmVkb3JhLWNyeXB0by1wb2xpY2llcy5naXQ7cHJvdG9jb2w9aHR0
cHM7YnJhbmNoPW1hc3RlciIKIAotU1JDUkVWID0gIjFhYmI4YTQwNDYxM2YzM2EyZjk4ZWI4M2U4
MjdiMDQ2ZDA4MjAwNDgiCitTUkNSRVYgPSAiYzQyZGE3NzJkNWZjZWRjNTVhZWU4ZjJhMzM0OGU3
ZDcxODU1MTkxMCIKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIKIAogZG9fY29tcGlsZSAo
KSB7Ci0tIAoyLjQ3LjEKCg==

--===============3651164024661795183==--

