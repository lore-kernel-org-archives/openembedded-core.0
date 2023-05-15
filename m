Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF313C88CB3
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:16 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.3752.1684186746207888922
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fOva+qdQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010188215a4973-a0003a33-6aa2-4362-a296-e25c3c26ec19-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186745;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DF46hWbstuEt3bXsCZV7cVS9XpIKLadY41J+AbxkQs0=;
	b=fOva+qdQf8B39escmuq+aF1nPD8sSgCywept0IwXJjMyQqxy1eQTvRfu7eutTZVn
	CeQQauxUZUy3zz5Pj5zbPyl7DJ9xFpGFpe6NbSNknTq/CJx5fRvoM8PP/rS8oMKbMp9
	Qarcn3gMMhEb0C9CtZuTFTcaNUsj7St8Q7o4Hk30=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186745;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DF46hWbstuEt3bXsCZV7cVS9XpIKLadY41J+AbxkQs0=;
	b=AVCoJHOi8YBvT9b1ZLITvBZAioeIAA8BoLRthxzmBe09RrAn5alvTqAoo+dwJs1V
	d8FRPlarwSNwBsItJ1XJPIa29xx4WDykyLrTH0P1En5OyFvHdOqkHD9qtfh7+0G2GET
	bqxFqU+oKDetrkCroU5TyS87HCH9uBIwMk3YsEBE=
Content-Type: multipart/mixed; boundary="===============1441637395163081316=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mobile-broadband-provider-info: upgrading to 20230416 SUCCEEDED
Message-ID: <01010188215a4973-a0003a33-6aa2-4362-a296-e25c3c26ec19-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181275

--===============1441637395163081316==
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
--===============1441637395163081316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mobile-broadband-provider-info: PKGV changed from 20221107 [default] to 20230416 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info: PV changed from "20221107" to "20230416"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dbg: PKGV changed from 20221107 [default] to 20230416 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dbg: PV changed from "20221107" to "20230416"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dev: PKGV changed from 20221107 [default] to 20230416 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-dev: PV changed from "20221107" to "20230416"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-doc: PKGV changed from 20221107 [default] to 20230416 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-doc: PV changed from "20221107" to "20230416"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-locale: PKGV changed from 20221107 [default] to 20230416 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-locale: PV changed from "20221107" to "20230416"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-src: PKGV changed from 20221107 [default] to 20230416 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-src: PV changed from "20221107" to "20230416"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-staticdev: PKGV changed from 20221107 [default] to 20230416 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info-staticdev: PV changed from "20221107" to "20230416"
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PKGV changed from 20221107 [default] to 20230416 [default]
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PKGSIZE changed from 518766 to 521960 (+1%)
packages/core2-32-poky-linux/mobile-broadband-provider-info/mobile-broadband-provider-info: PV changed from "20221107" to "20230416"

--===============1441637395163081316==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mobile-broadband-provider-info-upgrade-20221107-2023.patch"

RnJvbSBkYWUyNDRmOGQwZTE4MDIyZjhjODkxNDA3YzFmOWY3YjUyNTJhZGFhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMDY6NDY6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
b2JpbGUtYnJvYWRiYW5kLXByb3ZpZGVyLWluZm86IHVwZ3JhZGUgMjAyMjExMDcgLT4gMjAyMzA0
MTYKCi0tLQogLi4uL21vYmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5mb19naXQuYmIgICAgICAg
ICAgICAgICAgICAgICB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L21v
YmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5mby9tb2JpbGUtYnJvYWRiYW5kLXByb3ZpZGVyLWlu
Zm9fZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9tb2JpbGUtYnJvYWRiYW5kLXBy
b3ZpZGVyLWluZm8vbW9iaWxlLWJyb2FkYmFuZC1wcm92aWRlci1pbmZvX2dpdC5iYgppbmRleCBl
ODAyYmNlZTE4Li5hNDAzMGI3YjMyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L21vYmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5mby9tb2JpbGUtYnJvYWRiYW5kLXByb3Zp
ZGVyLWluZm9fZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbW9iaWxlLWJy
b2FkYmFuZC1wcm92aWRlci1pbmZvL21vYmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5mb19naXQu
YmIKQEAgLTUsOCArNSw4IEBAIFNFQ1RJT04gPSAibmV0d29yayIKIExJQ0VOU0UgPSAiUEQiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT04Nzk2NDU3OWIyYThlY2U0YmM2
NzQ0ZDJkYzlhOGIwNCIKIAotU1JDUkVWID0gIjIyYTVkZTNlZjYzNzk5MGNlMDMxNDFmNzg2ZmJk
YjMyN2U5YzVhM2YiCi1QViA9ICIyMDIyMTEwNyIKK1NSQ1JFViA9ICJhYWU3YzY4NjcxZDIyNWU2
ZDM1MjI0NjEzZDViOTgxOTJiOWIyZmZlIgorUFYgPSAiMjAyMzA0MTYiCiBQRSA9ICIxIgogCiBT
UkNfVVJJID0gImdpdDovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvbW9iaWxlLWJyb2FkYmFuZC1w
cm92aWRlci1pbmZvLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbiIKLS0gCjIuMzkuMgoK

--===============1441637395163081316==--

