Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5E5C64EAF
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.855.1667349634115655152
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cSAUP7ZM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018435c85896-647b2b02-6ca4-4d36-9d51-72f9b640700d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KYf2IUQ6G75TQ+OeecqXRCNsflYFVk1XB2RvC2i+AWw=;
	b=cSAUP7ZM5mljQGWwylCBKkI/+Pb3spuu5eu5P8rK7B2f0OvAmi/BlQX8kGiIucj9
	vgR5LurlMSrxCyrnoEp6jS+FZ2iaKhxLvAQu1uOtX1gL9a5Yhir5XTxboGuS6iFPtVl
	zy4Hd2kgKLqhZgovQrI5E0yBmnSTlOr4TEBTh59s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KYf2IUQ6G75TQ+OeecqXRCNsflYFVk1XB2RvC2i+AWw=;
	b=g3ZlELMeZkiM5zuWe5n6rh8E5BRuJ53IO5F4YzixvuEKeyeANW2rZdXH9NIYVe5e
	AtqipOsU8LNdvsEw35JBhgVH48gnJ72pl68jvHMlnobY8yJODmRIQNmZbxXZgFlxbxu
	PIa2tK/PuWfFHM6eTFLii9c3x4ZLbpWQFq1Mo/48=
Content-Type: multipart/mixed; boundary="===============7932759625675633217=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-psutil: upgrading to 5.9.3 SUCCEEDED
Message-ID: <0101018435c85896-647b2b02-6ca4-4d36-9d51-72f9b640700d-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172441

--===============7932759625675633217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-psutil* to *5.9.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-psutil-upgrade-5.9.2-5.9.3.patch
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
--===============7932759625675633217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-psutil: PV changed from "5.9.2" to "5.9.3"
packages/core2-32-poky-linux/python3-psutil: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/psutil/psutil-5.9.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/psutil/psutil-5.9.3.tar.gz"
packages/core2-32-poky-linux/python3-psutil: PKGV changed from 5.9.2 [default] to 5.9.3 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-dbg: PV changed from "5.9.2" to "5.9.3"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-dbg: PKGSIZE changed from 109560 to 114856 (+5%)
packages/core2-32-poky-linux/python3-psutil/python3-psutil-dbg: PKGV changed from 5.9.2 [default] to 5.9.3 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-dev: PV changed from "5.9.2" to "5.9.3"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-dev: PKGV changed from 5.9.2 [default] to 5.9.3 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-doc: PV changed from "5.9.2" to "5.9.3"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-doc: PKGV changed from 5.9.2 [default] to 5.9.3 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-locale: PV changed from "5.9.2" to "5.9.3"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-locale: PKGV changed from 5.9.2 [default] to 5.9.3 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-src: PV changed from "5.9.2" to "5.9.3"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-src: PKGSIZE changed from 55004 to 60903 (+11%)
packages/core2-32-poky-linux/python3-psutil/python3-psutil-src: PKGV changed from 5.9.2 [default] to 5.9.3 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-staticdev: PV changed from "5.9.2" to "5.9.3"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-staticdev: PKGV changed from 5.9.2 [default] to 5.9.3 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-tests: PV changed from "5.9.2" to "5.9.3"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-tests: PKGSIZE changed from 1311233 to 1318529 (+1%)
packages/core2-32-poky-linux/python3-psutil/python3-psutil-tests: PKGV changed from 5.9.2 [default] to 5.9.3 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil: PV changed from "5.9.2" to "5.9.3"
packages/core2-32-poky-linux/python3-psutil/python3-psutil: PKGSIZE changed from 865572 to 867348 (+0%)
packages/core2-32-poky-linux/python3-psutil/python3-psutil: PKGV changed from 5.9.2 [default] to 5.9.3 [default]
Changes to packages/core2-32-poky-linux/python3-psutil (sysroot):
  /usr/lib/python3.11/site-packages/psutil-5.9.2.dist-info moved to /usr/lib/python3.11/site-packages/psutil-5.9.3.dist-info

--===============7932759625675633217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-psutil/python3-psutil-src: PKGSIZE changed from 55004 to 60903 (+11%)
Changes to packages/core2-32-poky-linux/python3-psutil (sysroot):
  /usr/lib/python3.11/site-packages/psutil-5.9.2.dist-info moved to /usr/lib/python3.11/site-packages/psutil-5.9.3.dist-info

--===============7932759625675633217==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-psutil-upgrade-5.9.2-5.9.3.patch"

RnJvbSAxNDExNWEyYjRjZDEzMmZiNWU4NGRkZTU5Y2JjN2I4YzhhYzUxMTc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxMDo0NjozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHN1dGlsOiB1cGdyYWRlIDUuOS4yIC0+IDUuOS4zCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtcHN1dGlsXzUuOS4yLmJiID0+IHB5dGhvbjMtcHN1dGlsXzUuOS4zLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHN1dGlsXzUuOS4yLmJiID0+IHB5
dGhvbjMtcHN1dGlsXzUuOS4zLmJifSAoODclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1wc3V0aWxfNS45LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHN1dGlsXzUuOS4zLmJiCnNpbWlsYXJpdHkgaW5kZXggODcl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wc3V0aWxf
NS45LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
c3V0aWxfNS45LjMuYmIKaW5kZXggNWIzMTAxNDY1Ny4uZjA5OTgwMzE1MCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBzdXRpbF81LjkuMi5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHN1dGlsXzUuOS4zLmJiCkBA
IC0zLDcgKzMsNyBAQCBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWUzNWZkOWYyNzFkMTlkNWY3NDJmMjBhOWQxZjhiYjhiIgog
SE9NRVBBR0UgPSAiaHR0cHM6Ly9weXBpLm9yZy9wcm9qZWN0L3BzdXRpbC8iCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICJmZWI4NjFhMTBiNmMzYmIwMDcwMTA2M2IzN2U0YWZjNzU0ZjgyMTdmMGYw
OWM0MjI4MDU4NmJkNmFjNzEyYjVjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdjY2ZjZGZlYTRm
YzRiMGEwMmNhMmMzMWRlN2ZjZDE4NmJlYjljZmY4MjA3ODAwZTE0YWI2NmY3OWM3NzNhZjYiCiAK
IGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0tIAoyLjMxLjEKCg==

--===============7932759625675633217==--

