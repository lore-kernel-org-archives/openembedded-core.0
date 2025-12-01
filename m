Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB72D111A8
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:25 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13928.1764566286089269369
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LopY3lSy;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=K656e/5I;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019ad858e374-995b785a-3810-4899-a91d-dcff5d1ba5d0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BoGCpJP98mPyHrmUjw2Iep08fuIiU5R/jq83GVKDsRI=;
	b=LopY3lSyMdyGHZsfsODaKs1RIO0JSWdCXw5AMY/wT6cqAg+2qnU+MLyMTF9m6Be9
	Bm87zg4YymSipC1s61eYS4OXrMOktuAzAS1Vfbouwg3JdoTH3BJ6b8FdNtb/yDgq7pP
	GDIvNfQ1POxJvxldcr1T0s5O10oVs2Pxa9SKHLPs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BoGCpJP98mPyHrmUjw2Iep08fuIiU5R/jq83GVKDsRI=;
	b=K656e/5IAPh7BRWoQN5Cvwb4OIZmViMfRQvzyKQp8UfohiqsD683Z2zDe9Imm/fD
	+03CyTRS7URA0iJkX47NEkb2R95uOemRAEC45xGnTygEb4krRr5WomLNGzmwrmn/Mtk
	iCT1SCpF0ZS3mRbZcS/GEE4ES7NqNWCoAX+j/4GQ=
Content-Type: multipart/mixed; boundary="===============2961382248077612791=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-llvm-translator: upgrading to 21.1.3 FAILED
Message-ID: <0101019ad858e374-995b785a-3810-4899-a91d-dcff5d1ba5d0-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227068

--===============2961382248077612791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-llvm-translator* to *21.1.3* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake spirv-llvm-translator' failed
NOTE: Reconnecting to bitbake server...
ERROR: A builtin fragment 'machine/qemux86-64' is used while MACHINE has already got an assignment.
Please either disable the fragment or remove the value assignment.
To disable the fragment, use 'bitbake-config-build disable-fragment machine/qemux86-64'.
ERROR: Unable to parse /srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/__init__.py
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/__init__.py", line 262, in fatal
    raise BBHandledException()
bb.BBHandledException




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2961382248077612791==--

