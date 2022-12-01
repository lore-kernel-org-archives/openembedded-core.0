Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE067C64E65
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:30:33 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.46824.1669908626823778299
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:30:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=J6Zyo+4r;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010184ce4f7c2b-b7dc8d73-d172-49bc-8508-b0599618111a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=X+No3M3JJbEKhqTx8eI7gQ0bZPDMV64Ml+A79pj06Oo=;
	b=J6Zyo+4rEdpLzSL5sEnaOr0b3aJCugu8joYgJGs+39rGIf516VOvpBNZ7QG++eyF
	CVxVUgE4N2f4OsuoqKbMsVcPzRaN0RYv8/FxQSze6kVyHxwcF16SQOxbc8ipFO0jlr6
	N0fhLd2u2Vp6Mb5PkynzX2YW2kgJnhLDfIYb3DzA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1669908626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=X+No3M3JJbEKhqTx8eI7gQ0bZPDMV64Ml+A79pj06Oo=;
	b=Sw0yRYXbOh9Phq10AvkAHgB1pgp40njUv9FZsdbcu3EB5AQZxms6RLvvp7XIwham
	/moPejIxgA5TnS9DSgUepg+rdORBLgyaWzqpNrhx1KDgLsYSvu3wqwaXvW/MSNHuyr4
	1XtPG8lB02evxlq+EP5tBofXp4qKPz8jdOh6G1mM=
Content-Type: multipart/mixed; boundary="===============5236244242581248662=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.30 SUCCEEDED
Message-ID: <01010184ce4f7c2b-b7dc8d73-d172-49bc-8508-b0599618111a-000000@us-west-2.amazonses.com>
Date: Thu, 1 Dec 2022 15:30:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174159

--===============5236244242581248662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.30* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.29.9-2.30.patch
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
--===============5236244242581248662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/repo: PKGV changed from 2.29.9 [default] to 2.30 [default]
packages/core2-32-poky-linux/repo: PV changed from "2.29.9" to "2.30"
packages/core2-32-poky-linux/repo/repo-dbg: PKGV changed from 2.29.9 [default] to 2.30 [default]
packages/core2-32-poky-linux/repo/repo-dbg: PV changed from "2.29.9" to "2.30"
packages/core2-32-poky-linux/repo/repo-dev: PKGV changed from 2.29.9 [default] to 2.30 [default]
packages/core2-32-poky-linux/repo/repo-dev: PV changed from "2.29.9" to "2.30"
packages/core2-32-poky-linux/repo/repo-doc: PKGV changed from 2.29.9 [default] to 2.30 [default]
packages/core2-32-poky-linux/repo/repo-doc: PV changed from "2.29.9" to "2.30"
packages/core2-32-poky-linux/repo/repo-locale: PKGV changed from 2.29.9 [default] to 2.30 [default]
packages/core2-32-poky-linux/repo/repo-locale: PV changed from "2.29.9" to "2.30"
packages/core2-32-poky-linux/repo/repo-src: PKGV changed from 2.29.9 [default] to 2.30 [default]
packages/core2-32-poky-linux/repo/repo-src: PV changed from "2.29.9" to "2.30"
packages/core2-32-poky-linux/repo/repo-staticdev: PKGV changed from 2.29.9 [default] to 2.30 [default]
packages/core2-32-poky-linux/repo/repo-staticdev: PV changed from "2.29.9" to "2.30"
packages/core2-32-poky-linux/repo/repo: PKGV changed from 2.29.9 [default] to 2.30 [default]
packages/core2-32-poky-linux/repo/repo: PV changed from "2.29.9" to "2.30"

--===============5236244242581248662==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.29.9-2.30.patch"

RnJvbSA0MTE5YmY5ZWQ5NjIzZDUxMmY2MDU5NzhmNTI1NzU1OTg5YTJlN2I2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBEZWMgMjAyMiAxMDozMTozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi4yOS45IC0+IDIuMzAKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Jl
cG8ve3JlcG9fMi4yOS45LmJiID0+IHJlcG9fMi4zMC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcmVwby97cmVwb18yLjI5LjkuYmIgPT4gcmVwb18yLjMwLmJifSAoOTUlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4yOS45LmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjMwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4yOS45LmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuMzAuYmIKaW5kZXggYTVhNWM1
Y2U4Ny4uODI5MDI0NDdiNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8v
cmVwb18yLjI5LjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjMw
LmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogU1JDX1VSSSA9ICJnaXQ6Ly9n
ZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVwby5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNo
PW1haW4gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1weXRob24zLXNoZWJhbmcucGF0Y2ggXAog
ICAgICAgICAgICAiCi1TUkNSRVYgPSAiNDcwMjBiYTI0OWMzOTc4M2E2NmMwMDMxZmQ5MjAwY2Fl
Y2ZiYmRjOCIKK1NSQ1JFViA9ICJkNjg2MzY1NDQ5YWRlMjQ4MGEyM2Y4NjUzMWE1YjY2MzBmY2Ji
N2EwIgogCiBNSVJST1JTICs9ICJnaXQ6Ly9nZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVw
by5naXQgZ2l0Oi8vZ2l0aHViLmNvbS9HZXJyaXRDb2RlUmV2aWV3L2dpdC1yZXBvLmdpdCIKIAot
LSAKMi4zMS4xCgo=

--===============5236244242581248662==--

