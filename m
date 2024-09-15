Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACB1C36003
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:18 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.115651.1726410842115314443
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=WC5HVGtv;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=tFrTEn/+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010191f61add51-ef982254-3083-4dee-a96e-0fe680ae5e6d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Oeo8efS0f+C/N6sjcgm+LtnvKE5q8YNpE5KuVnctiIc=;
	b=WC5HVGtv+0KzFxDUogFKT8wCOxUv96E9VyiE8sOFkQFT+kMCWLw424NuGWI6NYAj
	4WJFlSDPbO8qL+DQvQ5VXqdyfzRAP85DpVCcXVoDEnomeFzMsJgfVXwZcnj2T5N43Vz
	vajqsOW6wifWDl84J4hWvfRARi/2XkQ3lor24Q44=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Oeo8efS0f+C/N6sjcgm+LtnvKE5q8YNpE5KuVnctiIc=;
	b=tFrTEn/+UPSRJMvykYyXBC7SulEV8XARwSQMNwCXBN5r9x+cGe0Uy6TOTzghHdnP
	mxXhJVNhorfiTEB49S7Z2uRBJB7wz1CWg7uQ+Yvy2wzOzMrcHB6LU8WsVS45+jJJd9Z
	ul4YCmH/f9cgUUH7vM4SuHeYj3kKDUrBALYsWe2g=
Content-Type: multipart/mixed; boundary="===============0379150472786287646=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to cd97968b03708bd16868cdac1511c583cc82974b
 SUCCEEDED
Message-ID: <01010191f61add51-ef982254-3083-4dee-a96e-0fe680ae5e6d-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204573

--===============0379150472786287646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *puzzles* to *cd97968b03708bd16868cdac1511c583cc82974b* has Succeeded.

Next steps:
    - apply the patch: git am 0001-puzzles-upgrade-to-latest-revision.patch
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
From af695da0c40b831f75f17bb77b09f086f89c7b50 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 12:47:59 +0000
Subject: [PATCH] puzzles: upgrade to latest revision

---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index b47d3d3f30..5bf047001e 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "1c1899ee1c4e0a83808998359addb1efb66322f8"
+SRCREV = "cd97968b03708bd16868cdac1511c583cc82974b"
 PE = "2"
 PV = "0.0+git"
 
-- 
2.44.0


--===============0379150472786287646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+cd97968b03
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+cd97968b03
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+cd97968b03
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+cd97968b03
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+cd97968b03
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+cd97968b03
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+cd97968b03

--===============0379150472786287646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+cd97968b03
packages/core2-64-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 19629176 to 19797440 (+1%)
packages/core2-64-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+cd97968b03
packages/core2-64-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+cd97968b03
packages/core2-64-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+cd97968b03
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+cd97968b03
packages/core2-64-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3853044 to 3848203 (-0%)
packages/core2-64-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+cd97968b03
packages/core2-64-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+1c1899ee1c to 0.0+git0+cd97968b03

--===============0379150472786287646==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSBhZjY5NWRhMGM0MGI4MzFmNzVmMTdiYjc3YjA5ZjA4NmY4OWM3YjUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMTI6NDc6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0
by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vcHV6
emxlcy9wdXp6bGVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19n
aXQuYmIKaW5kZXggYjQ3ZDNkM2YzMC4uNWJmMDQ3MDAxZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by9w
dXp6bGVzL3B1enpsZXNfZ2l0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFJFUVVJUkVEX0RJU1RST19G
RUFUVVJFUyA9ICJ4MTEiCiBTUkNfVVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24v
cHV6emxlcy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMiCiAKIFVQU1RSRUFNX0NIRUNL
X0NPTU1JVFMgPSAiMSIKLVNSQ1JFViA9ICIxYzE4OTllZTFjNGUwYTgzODA4OTk4MzU5YWRkYjFl
ZmI2NjMyMmY4IgorU1JDUkVWID0gImNkOTc5NjhiMDM3MDhiZDE2ODY4Y2RhYzE1MTFjNTgzY2M4
Mjk3NGIiCiBQRSA9ICIyIgogUFYgPSAiMC4wK2dpdCIKIAotLSAKMi40NC4wCgo=

--===============0379150472786287646==--

