Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F6D3C38A2E
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:54:14 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.481.1664643226986642411
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VBBRTOiD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 010101839477dd70-8cac05a1-3f0c-4aef-a485-46d926497a27-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643227;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sO6r/d0pwZOwH6BhjV8QZK7Kd8vnoMIDMWL2lopY/5Q=;
	b=VBBRTOiDU8PZ9cvVyTYOJAmCNj2Dav/n358LzXCFFdqiHpFpCKhaxLX5morz+OGM
	F+FFZWRdjyc6vqNMspIFdoLL+QuDodIScrBaIP1JqNuaHih0pr6drXdWnd573rwor7x
	/7zd4wIvKvZtqNw10KDY+dz8GPgGWeBD74onGtYY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643227;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sO6r/d0pwZOwH6BhjV8QZK7Kd8vnoMIDMWL2lopY/5Q=;
	b=JLTQBHTl2Lb1f6xxEqZ71bXHwLka0evXsXKwZ/ySpS+kO27FEWTn4arqPj/oJnhx
	SkpowLgjGKP6cRnb+Kqc00SouxFN6e5OV3/MWFF13JsYFeHl9P1Oz4eXC8EvpADGjHk
	NBejOHPCtZHj44EdjCUgH2XHIc2K+5AdWDaCgPOs=
Content-Type: multipart/mixed; boundary="===============6091489988668628530=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.29.3 SUCCEEDED
Message-ID: 
 <010101839477dd70-8cac05a1-3f0c-4aef-a485-46d926497a27-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:54:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171279

--===============6091489988668628530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *repo* to *2.29.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.29.2-2.29.3.patch
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
--===============6091489988668628530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/repo: PV changed from "2.29.2" to "2.29.3"
packages/core2-32-poky-linux/repo: PKGV changed from 2.29.2 [default] to 2.29.3 [default]
packages/core2-32-poky-linux/repo/repo-dbg: PV changed from "2.29.2" to "2.29.3"
packages/core2-32-poky-linux/repo/repo-dbg: PKGV changed from 2.29.2 [default] to 2.29.3 [default]
packages/core2-32-poky-linux/repo/repo-dev: PV changed from "2.29.2" to "2.29.3"
packages/core2-32-poky-linux/repo/repo-dev: PKGV changed from 2.29.2 [default] to 2.29.3 [default]
packages/core2-32-poky-linux/repo/repo-doc: PV changed from "2.29.2" to "2.29.3"
packages/core2-32-poky-linux/repo/repo-doc: PKGV changed from 2.29.2 [default] to 2.29.3 [default]
packages/core2-32-poky-linux/repo/repo-locale: PV changed from "2.29.2" to "2.29.3"
packages/core2-32-poky-linux/repo/repo-locale: PKGV changed from 2.29.2 [default] to 2.29.3 [default]
packages/core2-32-poky-linux/repo/repo-src: PV changed from "2.29.2" to "2.29.3"
packages/core2-32-poky-linux/repo/repo-src: PKGV changed from 2.29.2 [default] to 2.29.3 [default]
packages/core2-32-poky-linux/repo/repo-staticdev: PV changed from "2.29.2" to "2.29.3"
packages/core2-32-poky-linux/repo/repo-staticdev: PKGV changed from 2.29.2 [default] to 2.29.3 [default]
packages/core2-32-poky-linux/repo/repo: PV changed from "2.29.2" to "2.29.3"
packages/core2-32-poky-linux/repo/repo: PKGV changed from 2.29.2 [default] to 2.29.3 [default]

--===============6091489988668628530==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.29.2-2.29.3.patch"

RnJvbSAyN2VjODQzOWUwZGMzMGM3YzVlYzY4OWVkNWJkY2Q4MjFkNWRjMDA1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAwODo1OTo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi4yOS4yIC0+IDIuMjkuMwoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cmVwby97cmVwb18yLjI5LjIuYmIgPT4gcmVwb18yLjI5LjMuYmJ9IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3JlcG8ve3JlcG9fMi4yOS4yLmJiID0+IHJlcG9fMi4yOS4zLmJifSAoOTUlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4yOS4yLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjI5LjMuYmIKc2ltaWxhcml0eSBpbmRl
eCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjI5LjIu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi4yOS4zLmJiCmlu
ZGV4IDQyZmQxOGFjMjQuLjY2YjYzMmMyOWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9yZXBvL3JlcG9fMi4yOS4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBv
L3JlcG9fMi4yOS4zLmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogU1JDX1VS
SSA9ICJnaXQ6Ly9nZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVwby5naXQ7cHJvdG9jb2w9
aHR0cHM7YnJhbmNoPW1haW4gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1weXRob24zLXNoZWJh
bmcucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiODkxZThmNzJjZTM1NTFhMTljMzc3
NDU2NTc0YmJmYmVhYzVjOGI4ZSIKK1NSQ1JFViA9ICJhY2M0Yzg1N2EwYjZlMmUzM2UzNjQ3MDI4
Y2JkMzEyNDk4ZmQ1OTAwIgogCiBNSVJST1JTICs9ICJnaXQ6Ly9nZXJyaXQuZ29vZ2xlc291cmNl
LmNvbS9naXQtcmVwby5naXQgZ2l0Oi8vZ2l0aHViLmNvbS9HZXJyaXRDb2RlUmV2aWV3L2dpdC1y
ZXBvLmdpdCIKIAotLSAKMi4zMS4xCgo=

--===============6091489988668628530==--

