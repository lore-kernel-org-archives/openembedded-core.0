Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4259CC25B7B
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:28:52 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.17600.1690907330634867851
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=L9zOMqUm;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ydq+oPIK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010189b1ee4b0a-9ecd3555-65f6-490a-9461-5ce2fc66c032-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907331;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=s8zW9XDFa5tjARsReDcSRHV2HbVC8bq2b2U8FDQR7l0=;
	b=L9zOMqUmlVADQUiviv/T9+aY6FeJskoQDjIOgBKmrW1SVzm9VnOcRQBvWcQ/M8xg
	WLo8EYVj2nzV2EouJQBtliBPBh07Ko7dtwmYsu/jkFACy+lJGTclEbO0Pxv110eQwzg
	mNV5loXn1Io4Le9FL2THKlU2SjGiymZfuHPBRwzg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907331;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=s8zW9XDFa5tjARsReDcSRHV2HbVC8bq2b2U8FDQR7l0=;
	b=Ydq+oPIKhZ/fpG0OAnOA6kRn063PtEFgsPr+edhrKt/OB0Rt1EkbveoOHD+gPsWO
	pmIdqdT4K/hCE+RaGukHom0pCRuqvxJJy1M9ybCDqK7Ft2aWys6/Qjd8nc5AzGrDpdR
	+6wKudgGtuO9YVBsfvSiFY8vNhjF6tKLraLJ2rIk=
Content-Type: multipart/mixed; boundary="===============0600516012117130747=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.250.1 SUCCEEDED
Message-ID: <01010189b1ee4b0a-9ecd3555-65f6-490a-9461-5ce2fc66c032-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185309

--===============0600516012117130747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glslang* to *1.3.250.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.3.250.0-1.3.250.1.patch
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
From c405caf40583525de640b0d67270f3580e7b4109 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Aug 2023 13:45:23 +0000
Subject: [PATCH] glslang: upgrade 1.3.250.0 -> 1.3.250.1

---
 .../glslang/{glslang_1.3.250.0.bb => glslang_1.3.250.1.bb}        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.3.250.0.bb => glslang_1.3.250.1.bb} (100%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.3.250.0.bb b/meta/recipes-graphics/glslang/glslang_1.3.250.1.bb
similarity index 100%
rename from meta/recipes-graphics/glslang/glslang_1.3.250.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.3.250.1.bb
-- 
2.39.2


--===============0600516012117130747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glslang/glslang-dbg: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-dbg: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang-dev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-dev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang-doc: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-doc: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang-locale: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-locale: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang-src: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-src: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang-staticdev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang-staticdev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang/glslang: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang/glslang: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/glslang: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/glslang: PV changed from "1.3.250.0" to "1.3.250.1"

--===============0600516012117130747==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.250.0-1.3.250.1.patch"

RnJvbSBjNDA1Y2FmNDA1ODM1MjVkZTY0MGIwZDY3MjcwZjM1ODBlN2I0MTA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBdWcgMjAyMyAxMzo0NToyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
c2xhbmc6IHVwZ3JhZGUgMS4zLjI1MC4wIC0+IDEuMy4yNTAuMQoKLS0tCiAuLi4vZ2xzbGFuZy97
Z2xzbGFuZ18xLjMuMjUwLjAuYmIgPT4gZ2xzbGFuZ18xLjMuMjUwLjEuYmJ9ICAgICAgICB8IDAK
IDEgZmlsZSBjaGFuZ2VkLCAwIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcve2dsc2xhbmdfMS4zLjI1MC4wLmJiID0+IGds
c2xhbmdfMS4zLjI1MC4xLmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuMy4yNTAuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI1MC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuMy4yNTAuMC5i
YgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjUw
LjEuYmIKLS0gCjIuMzkuMgoK

--===============0600516012117130747==--

