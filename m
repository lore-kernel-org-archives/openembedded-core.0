Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561F0C32773
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:38 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web08.3857.1659679408122744160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Xq688PAg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101826c99fdab-5b29ed95-1360-4b98-b8ae-d6026bec705e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WjPRxYR0iy5uZcJdrqIz6lw0ZgoE1F+A65qPo553eyQ=;
	b=Xq688PAgd3GNMvMBX1aGKlnVKbamnHRFbMsp7RgUvKi9hlZ4T4n9Biqo2s1BubX8
	GayE8J8TW9f4pPLVjJqTlFF8AiEoyaimii3Xs3FP4tb5rZJBv67JDY1cIzlZsD0rjH6
	GMu++9ZMVvCBsrX1T1uIqlClXBHSgQCIfqHbLa/Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WjPRxYR0iy5uZcJdrqIz6lw0ZgoE1F+A65qPo553eyQ=;
	b=WpFFp7s4wpGHWAN4fbr1BzXLCbol6GSwkfQxDojm3mALjc8UKiseBzOOakNkBsgG
	mNHOQd3QQwtpZik0x5WvqbmTDpmMfWqERwrJT0iI6n903vNRW2xmVhn5i5s13X4O6jS
	l3/Oa57yWASrcdElpI5Imx+jOVo/Cnglzhs6+GHQ=
Content-Type: multipart/mixed; boundary="===============5910425840424649339=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 5.1.1 SUCCEEDED
Message-ID: 
 <010101826c99fdab-5b29ed95-1360-4b98-b8ae-d6026bec705e-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:27 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168892

--===============5910425840424649339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinx* to *5.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-upgrade-5.0.2-5.1.1.patch
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
--===============5910425840424649339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.10/site-packages/Sphinx-5.0.2.dist-info -> /usr/lib/python3.10/site-packages/Sphinx-5.1.1.dist-info, removed "/usr/lib/python3.10/site-packages/sphinx/util/stemmer/__pycache__/porter.cpython-310.pyc /usr/lib/python3.10/site-packages/sphinx/util/stemmer/porter.py /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES/sphinx.mo /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES/sphinx.po /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES/sphinx.js", added "/usr/lib/python3.10/site-packages/sphinx/texinputs/sphinxpackageboxes.sty"
Changes to packages/core2-32-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.10/site-packages/Sphinx-5.0.2.dist-info moved to /usr/lib/python3.10/site-packages/Sphinx-5.1.1.dist-info
  /usr/lib/python3.10/site-packages/sphinx/texinputs/sphinxpackageboxes.sty was added
  /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU was removed
  /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES was removed
  /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES/sphinx.js was removed
  /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES/sphinx.mo was removed
  /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES/sphinx.po was removed
  /usr/lib/python3.10/site-packages/sphinx/util/stemmer/porter.py was removed
  /usr/lib/python3.10/site-packages/sphinx/util/stemmer/__pycache__/porter.cpython-310.pyc was removed

--===============5910425840424649339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-sphinx: SRC_URI changed from "https://files.pythonhosted.org/packages/source/S/Sphinx/Sphinx-5.0.2.tar.gz" to "https://files.pythonhosted.org/packages/source/S/Sphinx/Sphinx-5.1.1.tar.gz"
packages/core2-32-poky-linux/python3-sphinx: PV changed from "5.0.2" to "5.1.1"
packages/core2-32-poky-linux/python3-sphinx: PKGV changed from 5.0.2 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dbg: PV changed from "5.0.2" to "5.1.1"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dbg: PKGV changed from 5.0.2 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dev: PV changed from "5.0.2" to "5.1.1"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-dev: PKGV changed from 5.0.2 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-doc: PV changed from "5.0.2" to "5.1.1"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-doc: PKGV changed from 5.0.2 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-locale: PV changed from "5.0.2" to "5.1.1"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-locale: PKGV changed from 5.0.2 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-src: PV changed from "5.0.2" to "5.1.1"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-src: PKGV changed from 5.0.2 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-staticdev: PV changed from "5.0.2" to "5.1.1"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx-staticdev: PKGV changed from 5.0.2 [default] to 5.1.1 [default]
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 13819288 to 13884489 (+0%)
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.10/site-packages/Sphinx-5.0.2.dist-info -> /usr/lib/python3.10/site-packages/Sphinx-5.1.1.dist-info, removed "/usr/lib/python3.10/site-packages/sphinx/util/stemmer/__pycache__/porter.cpython-310.pyc /usr/lib/python3.10/site-packages/sphinx/util/stemmer/porter.py /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES/sphinx.mo /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES/sphinx.js /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES/sphinx.po", added "/usr/lib/python3.10/site-packages/sphinx/texinputs/sphinxpackageboxes.sty"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PV changed from "5.0.2" to "5.1.1"
packages/core2-32-poky-linux/python3-sphinx/python3-sphinx: PKGV changed from 5.0.2 [default] to 5.1.1 [default]
Changes to packages/core2-32-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.10/site-packages/Sphinx-5.0.2.dist-info moved to /usr/lib/python3.10/site-packages/Sphinx-5.1.1.dist-info
  /usr/lib/python3.10/site-packages/sphinx/texinputs/sphinxpackageboxes.sty was added
  /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU was removed
  /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES was removed
  /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES/sphinx.js was removed
  /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES/sphinx.mo was removed
  /usr/lib/python3.10/site-packages/sphinx/locale/ru_RU/LC_MESSAGES/sphinx.po was removed
  /usr/lib/python3.10/site-packages/sphinx/util/stemmer/porter.py was removed
  /usr/lib/python3.10/site-packages/sphinx/util/stemmer/__pycache__/porter.cpython-310.pyc was removed

--===============5910425840424649339==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-5.0.2-5.1.1.patch"

RnJvbSBmMWUxOGE5NjFhZjczZDZhZTQ5OGJiNWRiMmRkMWM3NWFhMjdjZmE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgNCBBdWcgMjAyMiAyMjozMToxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc3BoaW54OiB1cGdyYWRlIDUuMC4yIC0+IDUuMS4xCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtc3BoaW54XzUuMC4yLmJiID0+IHB5dGhvbjMtc3BoaW54XzUuMS4xLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc3BoaW54XzUuMC4yLmJiID0+IHB5
dGhvbjMtc3BoaW54XzUuMS4xLmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhfNS4wLjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzUuMS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTEl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhf
NS4wLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1z
cGhpbnhfNS4xLjEuYmIKaW5kZXggNDZjYzI2ZTY3ZS4uMWJlZjIwYzJlMiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF81LjAuMi5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzUuMS4xLmJiCkBA
IC02LDcgKzYsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT03MmM1
MzZlNzhjMjFjNTY3MzExYjE5M2ZlMDBjZDI1MyIKIAogUFlQSV9QQUNLQUdFID0gIlNwaGlueCIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImIxOGU5NzhlYTc1NjU3MjBmMjYwMTljNzAyY2Q4NWM4
NDM3NmU5NDgzNzBmMWNkNDNkNjAyNjUwMTBlMWM3YjAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
YmEzMjI0YTRlMjA2ZTFmYmRlY2Y5OGE0ZmFlNDk5MmVmOWIyNGI4NWViZjdiNTg0YmIzNDAxNTZl
YWYwOGQ4OSIKIAogaW5oZXJpdCBzZXR1cHRvb2xzMyBweXBpCiAKLS0gCjIuMzEuMQoK

--===============5910425840424649339==--

