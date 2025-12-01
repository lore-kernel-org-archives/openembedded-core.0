Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B6FD11713
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:25 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14094.1764566273179227802
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=H4lBrBqH;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=kqIxtPsJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019ad858ffd8-6a3162c6-68e8-4002-9e2d-f7490f4c6086-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566302;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fQ7vT1Ig24KArdc1g0kObU5M8fwo5pUVK6Klod7BKeM=;
	b=H4lBrBqHtiL9ZHryf0LjOp+SBjCPWssi1yWuCzMkvyfaUBLu9Ccf2bo23iW2H2cb
	kexCmGdYwScMGJ2Oc8T+BF278FdUWMXaZCJqrdvDoN1Hg1ORRiBLe/CdfMkidDE8Ldk
	WAaN9doLiYmOSzLl6VJVp0MlDPHhfbewhbv9jqd4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566302;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fQ7vT1Ig24KArdc1g0kObU5M8fwo5pUVK6Klod7BKeM=;
	b=kqIxtPsJD26i6mchBiaZ+B0BP/gcwrS3yjhaF8h+d9f8N3ma3Sq9hjnEVAvUYQ87
	8rkPeVOC3K6kBtRI/08dJtnT6rexAvNhoLbQA7AgO4QiDiPYQUI1wzec/ko012rLdHr
	0s3VkfX669u02GtSkpouxDa1JBqI2Si8uYl5m5G0=
Content-Type: multipart/mixed; boundary="===============1186572618875025027=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libproxy: upgrading to 0.5.12 FAILED
Message-ID: <0101019ad858ffd8-6a3162c6-68e8-4002-9e2d-f7490f4c6086-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227109

--===============1186572618875025027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libproxy* to *0.5.12* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake libproxy' failed
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
--===============1186572618875025027==--

