Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7510C6FA94
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:42 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web12.10534.1663251514443940709
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=feemMbjB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 0101018341840172-536eaddf-a1aa-4a2a-9376-9ac049cc787d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5SbyBtLCROHABrzgIQzaUlW7kgL/S3fr4khpTDwB00g=;
	b=feemMbjBe4bRUezoB9S3CGODh02yOwG2X9fInyZ5iw5HIewIXkhHmMyMuphDWoU8
	tao/uKyDvTFq0ZVwVxFk2PmYOt+fbWaRXOk6XaGue8PtAZ03kyyUFC4pxnlkkO2lAJf
	/p/3pC3T05M1lE/BGPQZ3ajzZO5dYMp5ZoKl1AHY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5SbyBtLCROHABrzgIQzaUlW7kgL/S3fr4khpTDwB00g=;
	b=QjYKV7h8grIqg3HA5IWUNxmIZYTLtuvTZlyJ5oOCcC1VRhrK9OOOhWzU3cYLV4h3
	PDuqH9OBA4SnoowV5rqKIXVeQRhXz0aozogmRawcsCtGD32sbo1R4ksQSH75hZxuqf+
	qkQHq/jzxr5BTYS+T1CdQT9KOEJkxMGh7KeAmaVY=
Content-Type: multipart/mixed; boundary="===============4600858192365014498=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 2ce8856b7e20c28467f0b2f86429d3f54d7821a5 FAILED
Message-ID: 
 <0101018341840172-536eaddf-a1aa-4a2a-9376-9ac049cc787d-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:33 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170760

--===============4600858192365014498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *2ce8856b7e20c28467f0b2f86429d3f54d7821a5* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake vulkan-samples' failed
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.

/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'vulkan-samples'
vulkan-samples was skipped: incompatible with host i686-poky-linux (not in COMPATIBLE_HOST)


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4600858192365014498==--

