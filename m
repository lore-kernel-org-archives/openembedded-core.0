Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D066AC63704
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:45 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web09.5201.1668517537765281018
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=gltisTXg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101847b6524f7-de9fa84a-7df7-4bda-a9de-ccf682fae6aa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517537;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AaQdI2RDBcs3td2IAgHvqoHUpFeBSWoRJp40yf9/RAM=;
	b=gltisTXgD+RzhyinplfCQtRYzu2VPRsTKs2y3gmCDmY2SNhcbTKNaTz8aDEGGp4g
	WkwdHUAx+OyjAm/uHdzULBA+AQOI62ctuglFzeR6LYxEtIX/ve+dJLFinxrdqcH+/jj
	Cro7nuxGp0AE+xOSW6qUwmD3zMJlJaQbiCjynrkI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517537;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AaQdI2RDBcs3td2IAgHvqoHUpFeBSWoRJp40yf9/RAM=;
	b=eaBf6FwAE+VSlcWSAUXAETvTRN7pcy0yBxRIbrzyPjZVAkC3syfrlmisz5PST+R2
	95X8Qj9NlK+OrSxVzyPefcT06PuwA4ts0dMkTbbpgwMbx4Z6YlKTO/CiunaHCxvIZjx
	qTpoQ6i4GSSF6KLASL4J+qLvSO6TBYhwdtuYB0Dc=
Content-Type: multipart/mixed; boundary="===============5540021340147186815=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsoup: upgrading to 3.2.2 SUCCEEDED
Message-ID: <010101847b6524f7-de9fa84a-7df7-4bda-a9de-ccf682fae6aa-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:37 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173338

--===============5540021340147186815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsoup* to *3.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsoup-upgrade-3.2.1-3.2.2.patch
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
--===============5540021340147186815==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsoup-upgrade-3.2.1-3.2.2.patch"

RnJvbSBhODhkZjk0YTQzMzUzYjM2NDg5MjZhMDI5NTU0MGU0OWE4NTc0NjAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMTI6NTQ6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzb3VwOiB1cGdyYWRlIDMuMi4xIC0+IDMuMi4yCgotLS0KIC4uLi9saWJzb3VwL3tsaWJzb3Vw
XzMuMi4xLmJiID0+IGxpYnNvdXBfMy4yLjIuYmJ9ICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1zdXBwb3J0L2xpYnNvdXAve2xpYnNvdXBfMy4yLjEuYmIgPT4gbGlic291cF8zLjIuMi5i
Yn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJzb3VwL2xpYnNv
dXBfMy4yLjEuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJzb3VwL2xpYnNvdXBfMy4yLjIu
YmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGlic291cC9saWJzb3VwXzMuMi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJzb3VwL2xpYnNvdXBfMy4yLjIuYmIKaW5kZXggZDE0NjY3ZWE4ZS4uZTE2Y2QxNzcwNSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlic291cC9saWJzb3VwXzMuMi4xLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnNvdXAvbGlic291cF8zLjIuMi5iYgpAQCAtMTIs
NyArMTIsNyBAQCBERVBFTkRTID0gImdsaWItMi4wIGdsaWItMi4wLW5hdGl2ZSBsaWJ4bWwyIHNx
bGl0ZTMgbGlicHNsIG5naHR0cDIiCiBTSFJUX1ZFUiA9ICIke0BkLmdldFZhcignUFYnKS5zcGxp
dCgnLicpWzBdfS4ke0BkLmdldFZhcignUFYnKS5zcGxpdCgnLicpWzFdfSIKIAogU1JDX1VSSSA9
ICIke0dOT01FX01JUlJPUn0vbGlic291cC8ke1NIUlRfVkVSfS9saWJzb3VwLSR7UFZ9LnRhci54
eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiMWViM2QyYzNiZTQ5ZmJiZDA1MWE3MWY2NTMyYzk2
MjZiY2VjZWE2OTc4MzE5MDY5MGNkN2U0ZGZkZjI4ZjI5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjgzNjczYzY4NWI5MTBmYjdkMzlmMWYyOGVlZTVhZmJlZmI3MWMwNTc5OGZjMzUwYWMzYmYxYjg4
NWUxZWZhYTEiCiAKIFBST1ZJREVTID0gImxpYnNvdXAtMy4wIgogQ1ZFX1BST0RVQ1QgPSAibGli
c291cCIKLS0gCjIuMzEuMQoK

--===============5540021340147186815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libsoup: SRC_URI changed from "https://download.gnome.org/sources//libsoup/3.2/libsoup-3.2.1.tar.xz" to "https://download.gnome.org/sources//libsoup/3.2/libsoup-3.2.2.tar.xz"
packages/core2-32-poky-linux/libsoup: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-dbg: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-dbg: PKGSIZE changed from 1618836 to 1617568 (-0%)
packages/core2-32-poky-linux/libsoup/libsoup-dbg: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-dev: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-dev: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-doc: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-doc: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ab: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ab: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-an: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-an: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-as: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-as: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-be: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-be: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-bg: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-bg: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-bn-in: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-bn-in: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-bs: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-bs: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca+valencia: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca+valencia: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-cs: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-cs: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-da: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-da: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-de: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-de: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-el: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-el: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-en-gb: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-en-gb: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-eo: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-eo: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-es: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-es: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-et: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-et: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-eu: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-eu: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fa: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fa: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fi: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fi: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fr: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fr: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fur: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fur: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-gd: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-gd: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-gl: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-gl: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-gu: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-gu: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-he: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-he: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-hi: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-hi: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-hr: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-hr: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-hu: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-hu: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-id: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-id: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-it: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-it: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ja: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ja: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ka: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ka: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-kn: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-kn: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ko: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ko: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-lt: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-lt: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-lv: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-lv: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ml: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ml: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-mr: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-mr: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ms: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ms: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-nb: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-nb: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ne: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ne: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-nl: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-nl: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-oc: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-oc: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-or: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-or: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pa: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pa: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pl: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pl: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt-br: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt-br: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ro: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ro: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ru: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ru: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sk: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sk: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sl: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sl: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr+latin: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr+latin: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sv: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sv: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ta: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ta: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-te: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-te: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-tg: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-tg: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-th: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-th: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-tr: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-tr: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ug: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ug: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-uk: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-uk: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-uz+cyrillic: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-uz+cyrillic: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-vi: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-vi: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-cn: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-cn: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-hk: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-hk: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-tw: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-tw: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-src: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-src: PKGSIZE changed from 1748815 to 1750485 (+0%)
packages/core2-32-poky-linux/libsoup/libsoup-src: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup-staticdev: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup-staticdev: PV changed from "3.2.1" to "3.2.2"
packages/core2-32-poky-linux/libsoup/libsoup: PKGV changed from 3.2.1 [default] to 3.2.2 [default]
packages/core2-32-poky-linux/libsoup/libsoup: PV changed from "3.2.1" to "3.2.2"

--===============5540021340147186815==--

