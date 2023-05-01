Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AC2CA9ED4
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:05 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.107903.1682976352561701481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=niFFAmfs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010187d935263c-e5058fd5-c68a-458a-a92f-ca02d2c41485-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+M+EWWV/f1JML6exiUBKZqzQAZNrsdvTWbbwaEDwjWs=;
	b=niFFAmfsFHStEXku1BdEvd4gNW1j2qFoz9OHc1cQU7XKzurQGunTXgW5k1IXwlPZ
	KzbilmSklOvfMQZVAzL7e3xNCmp1YPotwH1w7QyyvujfSf2OJtILjlz21n1X9RemkKI
	oCtLdY1VJu8tzErlIU9DFUUWcO180Zv7I70mM6hY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+M+EWWV/f1JML6exiUBKZqzQAZNrsdvTWbbwaEDwjWs=;
	b=UwsRDmvX1Gk8c0z4uO9Q19jfTW7yqwnI5TPmpRmRAXc6CM3zIAN0wqTy9AF2TACS
	SlZHFj442uQ9vPjF+K8ldD8WZU96f1ltDQ3K2B1vfLGxMwWidXhYIyMwPL743x2o/wU
	nmKWVAM88no7J3dY0v6wtQbuv/f0onKORycsW6ZM=
Content-Type: multipart/mixed; boundary="===============7003603776503525505=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gsettings-desktop-schemas: upgrading to 44.0 SUCCEEDED
Message-ID: <01010187d935263c-e5058fd5-c68a-458a-a92f-ca02d2c41485-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180651

--===============7003603776503525505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gsettings-desktop-schemas* to *44.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gsettings-desktop-schemas-upgrade-43.0-44.0.patch
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
--===============7003603776503525505==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gsettings-desktop-schemas-upgrade-43.0-44.0.patch"

RnJvbSAyZWQ0Yzk5MDU0MjE2ZmM5ZWM1ZmNiODc4NDA2ZWE1M2U1NGJlMDFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxNjoyOTo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
ZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXM6IHVwZ3JhZGUgNDMuMCAtPiA0NC4wCgotLS0KIC4uLmVz
a3RvcC1zY2hlbWFzXzQzLjAuYmIgPT4gZ3NldHRpbmdzLWRlc2t0b3Atc2NoZW1hc180NC4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1nbm9tZS9nc2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzL3tnc2V0
dGluZ3MtZGVza3RvcC1zY2hlbWFzXzQzLjAuYmIgPT4gZ3NldHRpbmdzLWRlc2t0b3Atc2NoZW1h
c180NC4wLmJifSAoODUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9nc2V0dGlu
Z3MtZGVza3RvcC1zY2hlbWFzL2dzZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXNfNDMuMC5iYiBiL21l
dGEvcmVjaXBlcy1nbm9tZS9nc2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzL2dzZXR0aW5ncy1kZXNr
dG9wLXNjaGVtYXNfNDQuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZ25vbWUvZ3NldHRpbmdzLWRlc2t0b3Atc2NoZW1hcy9nc2V0dGluZ3MtZGVza3Rv
cC1zY2hlbWFzXzQzLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1nbm9tZS9nc2V0dGluZ3Mt
ZGVza3RvcC1zY2hlbWFzL2dzZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXNfNDQuMC5iYgppbmRleCA5
NjZhNjdmZWFkLi44ZTMwZDVlNTI0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3Nl
dHRpbmdzLWRlc2t0b3Atc2NoZW1hcy9nc2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzXzQzLjAuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2dzZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXMvZ3NldHRp
bmdzLWRlc2t0b3Atc2NoZW1hc180NC4wLmJiCkBAIC0xMyw0ICsxMyw0IEBAIEdOT01FQkFTRUJV
SUxEQ0xBU1MgPSAibWVzb24iCiAKIGluaGVyaXQgZ25vbWViYXNlIGdzZXR0aW5ncyBnb2JqZWN0
LWludHJvc3BlY3Rpb24gZ2V0dGV4dAogCi1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI1
ZDU1NjgyODJhYjM4Yjk1NzU5ZDQyNTQwMWY3NDc2ZTU2ZjhjYmYyNjI5ODg1NTg3NDM5ZjQzYmQw
Yjg0YmJlIgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiZWIyZGU0NWNhZDkwNTk5NDg0
OWU2NDJhNjIzYWRlYjc1ZDQxYjIxYjA2MjZkNDBkMmEwN2I4ZWEyODFmZWMwZSIKLS0gCjIuMzku
MgoK

--===============7003603776503525505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dbg: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dbg: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dev: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dev: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-doc: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-doc: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ab: PKGSIZE changed from 4006 to 5482 (+37%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ab: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ab: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-as: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-as: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bg: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bg: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bs: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bs: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca+valencia: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca+valencia: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-cs: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-cs: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-da: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-da: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-de: PKGSIZE changed from 113088 to 116224 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-de: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-de: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-el: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-el: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-en-gb: PKGSIZE changed from 102592 to 105311 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-en-gb: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-en-gb: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eo: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eo: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-es: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-es: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eu: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eu: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fi: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fi: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fr: PKGSIZE changed from 119612 to 122848 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fr: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fr: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fur: PKGSIZE changed from 108103 to 114383 (+6%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fur: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fur: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gl: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gl: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gu: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gu: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-he: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-he: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hi: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hi: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hr: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hr: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hu: PKGSIZE changed from 117640 to 117667 (+0%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hu: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hu: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-id: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-id: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-is: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-is: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-it: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-it: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ja: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ja: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ka: PKGSIZE changed from 6987 to 10204 (+46%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ka: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ka: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-kk: PKGSIZE changed from 26430 to 26811 (+1%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-kk: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-kk: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lt: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lt: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lv: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lv: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ml: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ml: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ms: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ms: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nb: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nb: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ne: PKGSIZE changed from 47589 to 59959 (+26%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ne: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ne: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nl: PKGSIZE changed from 56063 to 60219 (+7%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nl: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nl: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-oc: PKGSIZE changed from 102959 to 103177 (+0%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-oc: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-oc: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-or: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-or: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pa: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pa: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pl: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pl: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt-br: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt-br: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ro: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ro: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ru: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ru: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sk: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sk: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sl: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sl: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr+latin: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr+latin: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr: PKGSIZE changed from 142864 to 146701 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sv: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sv: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tg: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tg: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tr: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tr: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ug: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ug: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-uk: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-uk: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-vi: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-vi: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-cn: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-cn: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-hk: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-hk: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-tw: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-tw: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-src: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-src: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-staticdev: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-staticdev: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas: SRC_URI changed from "https://download.gnome.org/sources//gsettings-desktop-schemas/43/gsettings-desktop-schemas-43.0.tar.xz;name=archive" to "https://download.gnome.org/sources//gsettings-desktop-schemas/44/gsettings-desktop-schemas-44.0.tar.xz;name=archive"
packages/core2-32-poky-linux/gsettings-desktop-schemas: PV changed from "43.0" to "44.0"

--===============7003603776503525505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ab: PKGSIZE changed from 4006 to 5482 (+37%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ka: PKGSIZE changed from 6987 to 10204 (+46%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ne: PKGSIZE changed from 47589 to 59959 (+26%)

--===============7003603776503525505==--

