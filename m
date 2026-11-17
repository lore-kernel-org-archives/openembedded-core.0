Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11777.1794893343578220843
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 21:29:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=D263qWjz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Rxwi2EAZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a1e7fae788-a39ab37c-cafc-464c-9200-3ee039cbafca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794893342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sTG9fITDVX4fIs8HAoVkvgv84dHwCTgWbSFdbHqEexE=;
	b=D263qWjz8QoenZsOIeukLKMTIVKtRIAGHXrCyvfvx1QxM++SNgz+FvUwDWqhMzaW
	xbPNSWdCaB/akZxw5bxT03G1eQTeMFNkqYhuBDhCiL2GTlOp1hmrHNv3sgYCJoQwNp5
	b9JMUTulJDokAorNaY8G6t2R3I7l/8zwkfbs+3IY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794893342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sTG9fITDVX4fIs8HAoVkvgv84dHwCTgWbSFdbHqEexE=;
	b=Rxwi2EAZWrVwdDhgTwTrtLZi26oBubRu8Jw7uufciFxf6vh4Vsuba8vY4ZXZ1qsM
	R6A9jXfxXr88etpfoIsM86gIOmGA7WVZs9JKiLA3FnzwsFCwffBPdOhS8ZxrFOYdnBp
	xIDH3wGf7Y4Cdp3eqRLhaynU+WxgZ6K/kx8CIl2g=
Content-Type: multipart/mixed; boundary="===============5809148570586474559=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: =?utf-8?b?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm-sequoia-crypto-policy: upgrading to
 e8bf08b2eb8b9ad6dddd2090e2aad54fdb6d2103 SUCCEEDED
Message-ID: <010101a1e7fae788-a39ab37c-cafc-464c-9200-3ee039cbafca-000000@us-west-2.amazonses.com>
Date: Tue, 17 Nov 2026 05:29:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.17-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 05:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250402

--===============5809148570586474559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm-sequoia-crypto-policy* to *e8bf08b2eb8b9ad6dddd2090e2aad54fdb6d2103* has Succeeded.

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
From a9a9921ddf9f45a99fb1d9035472d53d7b70877e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 17 Nov 2026 05:13:01 +0000
Subject: [PATCH] rpm-sequoia-crypto-policy: upgrade to latest revision

openssh: remove @openssh.com off ssh-mldsa44-ed25519
---
 .../rpm-sequoia/rpm-sequoia-crypto-policy_git.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
index ab6a3755e5..35f849f05c 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -10,7 +10,7 @@ inherit allarch python3native
 
 SRC_URI = "git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master"
 
-SRCREV = "14a7b30a95489e38e63c61779e2410cbf5884613"
+SRCREV = "e8bf08b2eb8b9ad6dddd2090e2aad54fdb6d2103"
 UPSTREAM_CHECK_COMMITS = "1"
 
 do_compile () {
-- 
2.47.1


--===============5809148570586474559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="rpm-sequoia-crypto-policy-changelog.txt"

openssh: remove @openssh.com off ssh-mldsa44-ed25519

--===============5809148570586474559==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-rpm-sequoia-crypto-policy-upgrade-to-latest-revision.patch"

RnJvbSBhOWE5OTIxZGRmOWY0NWE5OWZiMWQ5MDM1NDcyZDUzZDdiNzA4NzdlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTcgTm92IDIwMjYgMDU6MTM6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
cG0tc2VxdW9pYS1jcnlwdG8tcG9saWN5OiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKb3Bl
bnNzaDogcmVtb3ZlIEBvcGVuc3NoLmNvbSBvZmYgc3NoLW1sZHNhNDQtZWQyNTUxOQotLS0KIC4u
Li9ycG0tc2VxdW9pYS9ycG0tc2VxdW9pYS1jcnlwdG8tcG9saWN5X2dpdC5iYiAgICAgICAgICAg
ICAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ycG0tc2VxdW9pYS9ycG0tc2Vx
dW9pYS1jcnlwdG8tcG9saWN5X2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9ycG0tc2Vx
dW9pYS9ycG0tc2VxdW9pYS1jcnlwdG8tcG9saWN5X2dpdC5iYgppbmRleCBhYjZhMzc1NWU1Li4z
NWY4NDlmMDVjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtLXNlcXVvaWEv
cnBtLXNlcXVvaWEtY3J5cHRvLXBvbGljeV9naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3JwbS1zZXF1b2lhL3JwbS1zZXF1b2lhLWNyeXB0by1wb2xpY3lfZ2l0LmJiCkBAIC0xMCw3
ICsxMCw3IEBAIGluaGVyaXQgYWxsYXJjaCBweXRob24zbmF0aXZlCiAKIFNSQ19VUkkgPSAiZ2l0
Oi8vZ2l0bGFiLmNvbS9yZWRoYXQtY3J5cHRvL2ZlZG9yYS1jcnlwdG8tcG9saWNpZXMuZ2l0O3By
b3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIiCiAKLVNSQ1JFViA9ICIxNGE3YjMwYTk1NDg5ZTM4
ZTYzYzYxNzc5ZTI0MTBjYmY1ODg0NjEzIgorU1JDUkVWID0gImU4YmYwOGIyZWI4YjlhZDZkZGRk
MjA5MGUyYWFkNTRmZGI2ZDIxMDMiCiBVUFNUUkVBTV9DSEVDS19DT01NSVRTID0gIjEiCiAKIGRv
X2NvbXBpbGUgKCkgewotLSAKMi40Ny4xCgo=

--===============5809148570586474559==--
