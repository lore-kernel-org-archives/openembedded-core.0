Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28543C77B7A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:41 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.7619.1685693430806488207
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bIFZ+kLY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101887b2877c8-c0986e0e-3abe-4118-9e7c-116e14f14d09-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693429;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=p1oQAo3N6l7l9c6KFiAE5RxcQEd8JTFWEUvOWUL+/3Y=;
	b=bIFZ+kLYMmI69uUhFe7g7YgIA3W0PEKCNE8gzEC+cpQt7ljocfjshW0l63l2cUrs
	TaVNw4kS09yhHVp0Akl+0bGIjMfeINk0uHHiOGmkGHZrS2c0au3BQGJRuZAiR2ATeui
	PazRXU1bX8wVgCm2NhF/UOgp6PIGLFIAild7WyPU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693429;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=p1oQAo3N6l7l9c6KFiAE5RxcQEd8JTFWEUvOWUL+/3Y=;
	b=AhoQML9MP8+0b66K0tuhzFgiXMBLc/yCkd4R7UX7FjGyZddlXHeRcsWgpg7pGslt
	aO4mE+bkYm3HlF2oSoR+f2ZTEjKlH5k8zIiMvxMNnM+SazCvypLV8zk0o/mgqOAqu3Y
	7MyMrM19tHkTABb7YCX0/DNOoLbMR/obgQHgdlPE=
Content-Type: multipart/mixed; boundary="===============7501134186812723009=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mobile-broadband-provider-info: upgrading to 20230416 SUCCEEDED
Message-ID: <010101887b2877c8-c0986e0e-3abe-4118-9e7c-116e14f14d09-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:29 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182153

--===============7501134186812723009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mobile-broadband-provider-info* to *20230416* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mobile-broadband-provider-info-upgrade-20221107-2023.patch
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
--===============7501134186812723009==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mobile-broadband-provider-info-upgrade-20221107-2023.patch"

RnJvbSBiYWVmY2FkYWQ2YjY3MjVkOTUyNGRkMDA0Zjg5NjhiNDc1YzcxMmU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAwNjozMDo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1v
YmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5mbzogdXBncmFkZSAyMDIyMTEwNyAtPiAyMDIzMDQx
NgoKLS0tCiAuLi4vbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvX2dpdC5iYiAgICAgICAg
ICAgICAgICAgICAgIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9i
aWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvL21vYmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5m
b19naXQuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L21vYmlsZS1icm9hZGJhbmQtcHJv
dmlkZXItaW5mby9tb2JpbGUtYnJvYWRiYW5kLXByb3ZpZGVyLWluZm9fZ2l0LmJiCmluZGV4IGU4
MDJiY2VlMTguLmE0MDMwYjdiMzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvL21vYmlsZS1icm9hZGJhbmQtcHJvdmlk
ZXItaW5mb19naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tb2JpbGUtYnJv
YWRiYW5kLXByb3ZpZGVyLWluZm8vbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvX2dpdC5i
YgpAQCAtNSw4ICs1LDggQEAgU0VDVElPTiA9ICJuZXR3b3JrIgogTElDRU5TRSA9ICJQRCIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTg3OTY0NTc5YjJhOGVjZTRiYzY3
NDRkMmRjOWE4YjA0IgogCi1TUkNSRVYgPSAiMjJhNWRlM2VmNjM3OTkwY2UwMzE0MWY3ODZmYmRi
MzI3ZTljNWEzZiIKLVBWID0gIjIwMjIxMTA3IgorU1JDUkVWID0gImFhZTdjNjg2NzFkMjI1ZTZk
MzUyMjQ2MTNkNWI5ODE5MmI5YjJmZmUiCitQViA9ICIyMDIzMDQxNiIKIFBFID0gIjEiCiAKIFNS
Q19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9tb2JpbGUtYnJvYWRiYW5kLXBy
b3ZpZGVyLWluZm8uZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIgotLSAKMi4zOS4yCgo=

--===============7501134186812723009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mobile-broadband-provider-info: PV changed from "20221107" to "20230416"
packages/core2-32-poky-linux/mobile-broadband-provider-info: PKGV changed from 20221107 [default] to 20230416 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dbg: PV changed from "20221107" to "20230416"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dbg: PKGV changed from 20221107 [default] to 20230416 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dev: PV changed from "20221107" to "20230416"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dev: PKGV changed from 20221107 [default] to 20230416 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-doc: PV changed from "20221107" to "20230416"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-doc: PKGV changed from 20221107 [default] to 20230416 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-locale: PV changed from "20221107" to "20230416"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-locale: PKGV changed from 20221107 [default] to 20230416 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-src: PV changed from "20221107" to "20230416"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-src: PKGV changed from 20221107 [default] to 20230416 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-staticdev: PV changed from "20221107" to "20230416"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-staticdev: PKGV changed from 20221107 [default] to 20230416 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PV changed from "20221107" to "20230416"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PKGSIZE changed from 518766 to 521960 (+1%)
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PKGV changed from 20221107 [default] to 20230416 [default]

--===============7501134186812723009==--

