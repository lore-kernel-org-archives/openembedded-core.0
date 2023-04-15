Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2061C83003
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:29 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.13798.1681581684512381810
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=i0SBmHK0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018786143e9e-b0b346ca-7f1c-451b-b2cb-c2b15593f4d6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fTvHzNNK4gZtcNW2Q/vXmhosjfei+TyQ8MQI2cTAOTE=;
	b=i0SBmHK0dMaQJIZeRz6iVb6h0GptTlgbKMy8pOA6MemMUus/oSX3eCUF+PbRSvgS
	RwnmGQrOMqz2Rfo4noDTzgEW6sJ+e9RIpRx3KGu15SiyNl2heL0xuKhmjsbQJat9Gyi
	oLxKRajIhDHL5o2J2CJPZhh84EeDWf9rEVrb7sMc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fTvHzNNK4gZtcNW2Q/vXmhosjfei+TyQ8MQI2cTAOTE=;
	b=nrsO4nDfgs4ZS3iOsBEaYSkF1nNdtoU+uqTbx9d4KZW15l4swzruN9kKxRYbiDiE
	eSsSdeRAJYsRmBLF1pEFRyp+nmaOSbcCYVvDLibFXtq0CAqMqxEbDvSLyWjYibJvphn
	yIKgF7JoIKJM92mIJ57EEuqxeh2j1kQ8JYr6nutU=
Content-Type: multipart/mixed; boundary="===============7723878133886042112=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-devtools: upgrading to 1.22.2 SUCCEEDED
Message-ID: <0101018786143e9e-b0b346ca-7f1c-451b-b2cb-c2b15593f4d6-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180082

--===============7723878133886042112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gst-devtools* to *1.22.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gst-devtools-upgrade-1.22.0-1.22.2.patch
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
--===============7723878133886042112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gst-devtools/gst-devtools-dbg: FILELIST: removed "/usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2200.0 /usr/lib/.debug/libgstvalidate-1.0.so.0.2200.0", added "/usr/lib/.debug/libgstvalidate-1.0.so.0.2202.0 /usr/lib/.debug/libgstvalidate-default-overrides-1.0.so.0.2202.0"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dbg: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dbg: PKGSIZE changed from 1973216 to 1973972 (+0%)
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dbg: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dev: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dev: PKGSIZE changed from 394408 to 394908 (+0%)
packages/core2-32-poky-linux/gst-devtools/gst-devtools-dev: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-doc: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-doc: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-locale: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-locale: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-src: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-src: PKGSIZE changed from 907396 to 907753 (+0%)
packages/core2-32-poky-linux/gst-devtools/gst-devtools-src: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools-staticdev: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gst-devtools/gst-devtools-staticdev: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2200.0 /usr/lib/libgstvalidate-1.0.so.0.2200.0", added "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2202.0 /usr/lib/libgstvalidate-1.0.so.0.2202.0"
packages/core2-32-poky-linux/gst-devtools/gst-devtools: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gst-devtools/gst-devtools: PKGSIZE changed from 1532762 to 1533700 (+0%)
packages/core2-32-poky-linux/gst-devtools/gst-devtools: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gst-devtools: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gst-devtools: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gst-devtools: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.22.0.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch" to "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-1.22.2.tar.xz file://0001-connect-has-a-different-signature-on-musl.patch"
Changes to packages/core2-32-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2200.0 to libgstvalidate-1.0.so.0.2202.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2200.0 to libgstvalidate-default-overrides-1.0.so.0.2202.0
  /usr/lib/libgstvalidate-1.0.so.0.2200.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2202.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2200.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2202.0

--===============7723878133886042112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gst-devtools/gst-devtools: FILELIST: removed "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2200.0 /usr/lib/libgstvalidate-1.0.so.0.2200.0", added "/usr/lib/libgstvalidate-default-overrides-1.0.so.0.2202.0 /usr/lib/libgstvalidate-1.0.so.0.2202.0"
Changes to packages/core2-32-poky-linux/gst-devtools (sysroot):
  /usr/lib/libgstvalidate-1.0.so.0 changed symlink target from libgstvalidate-1.0.so.0.2200.0 to libgstvalidate-1.0.so.0.2202.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0 changed symlink target from libgstvalidate-default-overrides-1.0.so.0.2200.0 to libgstvalidate-default-overrides-1.0.so.0.2202.0
  /usr/lib/libgstvalidate-1.0.so.0.2200.0 moved to /usr/lib/libgstvalidate-1.0.so.0.2202.0
  /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2200.0 moved to /usr/lib/libgstvalidate-default-overrides-1.0.so.0.2202.0

--===============7723878133886042112==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-devtools-upgrade-1.22.0-1.22.2.patch"

RnJvbSBhNzM0Y2VkYTc0NTkwMGUyZTY0ZWY1ZDE2ZmI2ZmNjZmZiYzk3YjcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTU6NDI6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3QtZGV2dG9vbHM6IHVwZ3JhZGUgMS4yMi4wIC0+IDEuMjIuMgoKLS0tCiAuLi4ve2dzdC1kZXZ0
b29sc18xLjIyLjAuYmIgPT4gZ3N0LWRldnRvb2xzXzEuMjIuMi5iYn0gICAgICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdC1kZXZ0b29sc18xLjIyLjAuYmIg
PT4gZ3N0LWRldnRvb2xzXzEuMjIuMi5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzXzEuMjIuMC5iYiBiL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yMi4yLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3QtZGV2dG9vbHNfMS4yMi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzXzEuMjIuMi5iYgppbmRleCAzZTlhNzg5ZDI0Li44YjI4
MmJiYjdiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
LWRldnRvb2xzXzEuMjIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0LWRldnRvb2xzXzEuMjIuMi5iYgpAQCAtMTIsNyArMTIsNyBAQCBTUkNfVVJJID0gImh0
dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LWRldnRvb2xzL2dzdC1kZXZ0
b29scy0ke1BWfQogICAgICAgICAgICBmaWxlOi8vMDAwMS1jb25uZWN0LWhhcy1hLWRpZmZlcmVu
dC1zaWduYXR1cmUtb24tbXVzbC5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjRkMjFmZWU1YzE1ZjI4NzdjMGIxZjZjMmRhMGNkYmE2N2NlN2NhYWIyYzE5OWFi
MjdlOTFhMTM5NGQ1YmExOTUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWI2MjcyNmQzZTI3YTg3
ODIzNjlhMjRmZDYzNjRhODg4NWVkMjQ2MmIzYmJkYWIwOTFkZmZjODEzOWVlMDZkOCIKIAogREVQ
RU5EUyA9ICJqc29uLWdsaWIgZ2xpYi0yLjAgZ2xpYi0yLjAtbmF0aXZlIGdzdHJlYW1lcjEuMCBn
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlIgogUlJFQ09NTUVORFM6JHtQTn0gPSAiZ2l0IgotLSAK
Mi4zOS4yCgo=

--===============7723878133886042112==--

