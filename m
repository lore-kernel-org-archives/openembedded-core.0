Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4757C369D9
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 13:33:05 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.20155.1744723976793127524
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 06:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=R436G2NM;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ON1JAuSV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019639a71f93-a30062d6-ac62-497c-9733-a8aa8e41d366-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1744723976;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L4bb69dGu2UnZ24q05Hh2P5FAH3TWwwg4xIiW8OTrG4=;
	b=R436G2NMWlCac4j2DCIPpfuAJzM2qnFpZyhcAvEs4VellrE2xOaEwvMkMKOXaf4E
	L5iMwLSV5jMLVn6n5HKWChfopvST7cwWuN0Qdjn3afpZT8jAkJtm/XGOBXOMmlRzdFb
	0OD3Z4RDzD0QeE3Uv8tof+sBw0L+xHlgN3OyqvsI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1744723976;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L4bb69dGu2UnZ24q05Hh2P5FAH3TWwwg4xIiW8OTrG4=;
	b=ON1JAuSVSS7sYOsySQCiotVTuO1zs1vrDOaLUxq0cWOEZkTQDi95gD89YjmZUJvw
	PRkTKB4cG5KpzzgFG/JXfC9LEuaDoeqeOiQ+q6VNuPS6TpEsdCCBG43/N+hQsil06Jz
	blLlYzjeO5N+SR+9ShGI3P6LMR41pQEz4pTOlsn8=
Content-Type: multipart/mixed; boundary="===============7685165430264261499=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-mako: upgrading to 1.3.10 SUCCEEDED
Message-ID: <0101019639a71f93-a30062d6-ac62-497c-9733-a8aa8e41d366-000000@us-west-2.amazonses.com>
Date: Tue, 15 Apr 2025 13:32:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214877

--===============7685165430264261499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-mako* to *1.3.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-mako-upgrade-1.3.9-1.3.10.patch
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
From 10e4e745b61262288261a91b6e2c54b08bbe6511 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Apr 2025 07:28:35 +0000
Subject: [PATCH] python3-mako: upgrade 1.3.9 -> 1.3.10

---
 .../python/{python3-mako_1.3.9.bb => python3-mako_1.3.10.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.3.9.bb => python3-mako_1.3.10.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.9.bb b/meta/recipes-devtools/python/python3-mako_1.3.10.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-mako_1.3.9.bb
rename to meta/recipes-devtools/python/python3-mako_1.3.10.bb
index 83b6149337..4facce9233 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.9.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.10.bb
@@ -10,7 +10,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 
 
-SRC_URI[sha256sum] = "b5d65ff3462870feec922dbccf38f6efb44e5714d7b593a656be86663d8600ac"
+SRC_URI[sha256sum] = "99579a6f39583fa7e5630a28c3c1f440e4e97a414b80372649c0ce338da2ea28"
 
 RDEPENDS:${PN} = "python3-html \
                   python3-markupsafe \
-- 
2.47.1


--===============7685165430264261499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-mako: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/mako/mako-1.3.9.tar.gz;downloadfilename=mako-1.3.9.tar.gz" to "https://files.pythonhosted.org/packages/source/m/mako/mako-1.3.10.tar.gz;downloadfilename=mako-1.3.10.tar.gz"
packages/core2-64-poky-linux/python3-mako: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-64-poky-linux/python3-mako: PV changed from "1.3.9" to "1.3.10"
packages/core2-64-poky-linux/python3-mako/python3-mako-dbg: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-dbg: PV changed from "1.3.9" to "1.3.10"
packages/core2-64-poky-linux/python3-mako/python3-mako-dev: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-dev: PV changed from "1.3.9" to "1.3.10"
packages/core2-64-poky-linux/python3-mako/python3-mako-doc: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-doc: PV changed from "1.3.9" to "1.3.10"
packages/core2-64-poky-linux/python3-mako/python3-mako-locale: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-locale: PV changed from "1.3.9" to "1.3.10"
packages/core2-64-poky-linux/python3-mako/python3-mako-ptest: PKGSIZE changed from 352058 to 352365 (+0%)
packages/core2-64-poky-linux/python3-mako/python3-mako-ptest: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-ptest: PV changed from "1.3.9" to "1.3.10"
packages/core2-64-poky-linux/python3-mako/python3-mako-src: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-src: PV changed from "1.3.9" to "1.3.10"
packages/core2-64-poky-linux/python3-mako/python3-mako-staticdev: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako-staticdev: PV changed from "1.3.9" to "1.3.10"
packages/core2-64-poky-linux/python3-mako/python3-mako: PKGSIZE changed from 639729 to 639941 (+0%)
packages/core2-64-poky-linux/python3-mako/python3-mako: PKGV changed from 1.3.9 [default] to 1.3.10 [default]
packages/core2-64-poky-linux/python3-mako/python3-mako: PV changed from "1.3.9" to "1.3.10"
Changes to packages/core2-64-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/WHEEL was removed

--===============7685165430264261499==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-mako-upgrade-1.3.9-1.3.10.patch"

RnJvbSAxMGU0ZTc0NWI2MTI2MjI4ODI2MWE5MWI2ZTJjNTRiMDhiYmU2NTExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXByIDIwMjUgMDc6Mjg6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1ha286IHVwZ3JhZGUgMS4zLjkgLT4gMS4zLjEwCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtbWFrb18xLjMuOS5iYiA9PiBweXRob24zLW1ha29fMS4zLjEwLmJifSAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbWFrb18xLjMuOS5iYiA9PiBweXRo
b24zLW1ha29fMS4zLjEwLmJifSAoODglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMy45LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLW1ha29fMS4zLjEwLmJiCnNpbWlsYXJpdHkgaW5kZXggODglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuMy45LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjMu
MTAuYmIKaW5kZXggODNiNjE0OTMzNy4uNGZhY2NlOTIzMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1ha29fMS4zLjkuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1ha29fMS4zLjEwLmJiCkBAIC0xMCw3ICsxMCw3
IEBAIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhIHB0ZXN0LXB5dGhv
bi1weXRlc3QKIAogCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiNWQ2NWZmMzQ2Mjg3MGZlZWM5
MjJkYmNjZjM4ZjZlZmI0NGU1NzE0ZDdiNTkzYTY1NmJlODY2NjNkODYwMGFjIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjk5NTc5YTZmMzk1ODNmYTdlNTYzMGEyOGMzYzFmNDQwZTRlOTdhNDE0Yjgw
MzcyNjQ5YzBjZTMzOGRhMmVhMjgiCiAKIFJERVBFTkRTOiR7UE59ID0gInB5dGhvbjMtaHRtbCBc
CiAgICAgICAgICAgICAgICAgICBweXRob24zLW1hcmt1cHNhZmUgXAotLSAKMi40Ny4xCgo=

--===============7685165430264261499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/mako-1.3.10.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/mako-1.3.9.dist-info/WHEEL was removed

--===============7685165430264261499==--

