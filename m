Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5CC0C678DD
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:18 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.20191.1672605968666811430
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UBIN1Rk9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101856f15a734-c531f3b8-4e36-4eac-a970-dafd5a811f17-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605968;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AOoyW6H+y/QuuQmwgo4dyiFqBjDQ7aVj3Sx5ClEBPig=;
	b=UBIN1Rk99nVEngfjMxhZCUQadrERu+th7X+x2Qt/fg1B3sziBlkly74+FEWHL+3Y
	gGSBYZg1feNI6uMkKNJzhvdog9nR2HEUp2pDijN8iELF4njUD5S5eYL1EM6NdarXjzS
	wmdePKXaTJcC0/SpIPl43pfraBWs3Cs0ot+mPo8M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605968;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AOoyW6H+y/QuuQmwgo4dyiFqBjDQ7aVj3Sx5ClEBPig=;
	b=I8f8m72gvDHHAeQRrmzRA1y0GjmLKxUkEB/ej8YD6JMbPQ04gr1cExadZT8q7Qha
	ioZ24DLNWX7uPPiJ3ATFMQf8mW/g1p+C3QouoHAjiwSPryK9MH1+S6S9xY89elryhQ+
	pQzn5vcoHU+JRuqP7g/WbLvOwituT2bpCYu59tMU=
Content-Type: multipart/mixed; boundary="===============4924290376338147702=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kmscube: upgrading to 345111481d654b38a72b5c3629151dc74f7a82bc
 SUCCEEDED
Message-ID: <010101856f15a734-c531f3b8-4e36-4eac-a970-dafd5a811f17-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175282

--===============4924290376338147702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kmscube* to *345111481d654b38a72b5c3629151dc74f7a82bc* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kmscube-upgrade-to-latest-revision.patch
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
--===============4924290376338147702==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kmscube-upgrade-to-latest-revision.patch"

RnJvbSBlNjQzNDgzNjNiYjQ3ZjMwYzE1Zjc4ZTkwZDJjZDdkZDQ2NjM2ZTQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAxMzozODoxNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGtt
c2N1YmU6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy9rbXNjdWJlL2ttc2N1YmVfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2ttc2N1YmUva21zY3ViZV9naXQuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mva21zY3Vi
ZS9rbXNjdWJlX2dpdC5iYgppbmRleCA2ZWQ5N2RmYWZlLi5iMmMxMGUwOWZiIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYgpAQCAtMTAsNyArMTAsNyBA
QCBERVBFTkRTID0gInZpcnR1YWwvbGliZ2xlczMgdmlydHVhbC9saWJnbGVzMiB2aXJ0dWFsL2Vn
bCBsaWJkcm0iCiAKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL2ttc2N1YmUuYztiZWdpbmxp
bmU9MTtlbmRsaW5lPTIzO21kNT04YjMwOWQ0ZWU2N2I3MzE1ZmY3MzgxMjcwZGQ2MzFmYiIKIAot
U1JDUkVWID0gIjNiZjZlZTFhMDIzMzQzODZkODdjZmUzNTZjM2JmYjBiMjRlMWZlZDgiCitTUkNS
RVYgPSAiMzQ1MTExNDgxZDY1NGIzOGE3MmI1YzM2MjkxNTFkYzc0ZjdhODJiYyIKIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL2ttc2N1YmU7YnJhbmNoPW1hc3Rl
cjtwcm90b2NvbD1odHRwcyIKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIKIAotLSAKMi4z
Ny4zCgo=

--===============4924290376338147702==--

