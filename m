Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FB8C88CB0
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:19 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.24039.1677681914651374190
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VXDIaKne;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101869da27017-06386f7d-669f-4a86-9882-d0e71715c8e8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KFXJOL55FxdLJIfv8pzqT7EZrzepdBlHANgBkyZmmks=;
	b=VXDIaKnebUEhi1gUacifyNnnkkh+2IWGx2iCg28/ZioH8W1uzXJSUWYkCgSroI82
	L9b6e8qif+YM0XQjwhtAFKFNOiX9y0FJaj+fEE+c9amjcWSEqe6QHWgPmprRWj/Avud
	ovNQ5zOZppJA2V/ugxXbFWmT1sckJE+EC/RL2tIs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681914;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KFXJOL55FxdLJIfv8pzqT7EZrzepdBlHANgBkyZmmks=;
	b=bUMoLcZd5VmyA0/4cWQa1hy6xI9l3hS+zxwnD2mXMUpC3YwL9Gg8yrclEbKz0fmA
	xP2mHojsmUZVDROq15FagOczAk+dYd89kA7+1UG+J6L3mj5cKkY133RNwfEFkLm09pV
	tEbRU2FXzqCprFiTD+taz339W2fTO7VlFPA9Y7kY=
Content-Type: multipart/mixed; boundary="===============8101007427303924308=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.32 SUCCEEDED
Message-ID: <010101869da27017-06386f7d-669f-4a86-9882-d0e71715c8e8-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177902

--===============8101007427303924308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.32* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.31-2.32.patch
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
--===============8101007427303924308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/repo: PV changed from "2.31" to "2.32"
packages/core2-32-poky-linux/repo: PKGV changed from 2.31 [default] to 2.32 [default]
packages/core2-32-poky-linux/repo/repo-dbg: PV changed from "2.31" to "2.32"
packages/core2-32-poky-linux/repo/repo-dbg: PKGV changed from 2.31 [default] to 2.32 [default]
packages/core2-32-poky-linux/repo/repo-dev: PV changed from "2.31" to "2.32"
packages/core2-32-poky-linux/repo/repo-dev: PKGV changed from 2.31 [default] to 2.32 [default]
packages/core2-32-poky-linux/repo/repo-doc: PV changed from "2.31" to "2.32"
packages/core2-32-poky-linux/repo/repo-doc: PKGV changed from 2.31 [default] to 2.32 [default]
packages/core2-32-poky-linux/repo/repo-locale: PV changed from "2.31" to "2.32"
packages/core2-32-poky-linux/repo/repo-locale: PKGV changed from 2.31 [default] to 2.32 [default]
packages/core2-32-poky-linux/repo/repo-src: PV changed from "2.31" to "2.32"
packages/core2-32-poky-linux/repo/repo-src: PKGV changed from 2.31 [default] to 2.32 [default]
packages/core2-32-poky-linux/repo/repo-staticdev: PV changed from "2.31" to "2.32"
packages/core2-32-poky-linux/repo/repo-staticdev: PKGV changed from 2.31 [default] to 2.32 [default]
packages/core2-32-poky-linux/repo/repo: PKGSIZE changed from 45804 to 45822 (+0%)
packages/core2-32-poky-linux/repo/repo: PV changed from "2.31" to "2.32"
packages/core2-32-poky-linux/repo/repo: PKGV changed from 2.31 [default] to 2.32 [default]

--===============8101007427303924308==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.31-2.32.patch"

RnJvbSBjMmE4NjljOTdjOTQ4MTAzNjVhODkyN2Q0NWU0YTg0YTJkNjhmYmRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXIgMjAyMyAwODozMzoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi4zMSAtPiAyLjMyCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBv
L3tyZXBvXzIuMzEuYmIgPT4gcmVwb18yLjMyLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9yZXBvL3tyZXBvXzIuMzEuYmIgPT4gcmVwb18yLjMyLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4zMS5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9yZXBvL3JlcG9fMi4zMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuMzEuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4zMi5iYgppbmRleCAyN2JiNWQxNjNlLi5kYzc1
NTdlZTFlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuMzEu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjMyLmJiCkBAIC0xMiw3
ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2
Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogU1JDX1VSSSA9ICJnaXQ6Ly9nZXJyaXQuZ29vZ2xl
c291cmNlLmNvbS9naXQtcmVwby5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4gXAogICAg
ICAgICAgICBmaWxlOi8vMDAwMS1weXRob24zLXNoZWJhbmcucGF0Y2ggXAogICAgICAgICAgICAi
Ci1TUkNSRVYgPSAiYTYyMTI1NGIyNjM2NjRlZmEzMDhhNjQ1MjE0ZDNkMTQwZTA2ODY3NiIKK1NS
Q1JFViA9ICI3ZmExNDliNDdhOTgwNzc5ZjAyY2NhZjFkMWRiZDVhZjVjZTlhYmM3IgogCiBNSVJS
T1JTICs9ICJnaXQ6Ly9nZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVwby5naXQgZ2l0Oi8v
Z2l0aHViLmNvbS9HZXJyaXRDb2RlUmV2aWV3L2dpdC1yZXBvLmdpdCIKIAotLSAKMi4zOS4yCgo=

--===============8101007427303924308==--

