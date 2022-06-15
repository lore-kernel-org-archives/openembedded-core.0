Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E014FCCA488
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:45 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.4450.1655298222304536281
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Bnb4eE5J;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 010101816776662e-fb15c415-53a2-4fe3-8e9e-c2da64440d8e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=itm/6dfcKdWW0xnsdAgsTIRROPS/7cQkIIipPbHhXys=;
	b=Bnb4eE5JlqZuPusVLqyo22r2un624DsZ8fL14bx3jKjeOgY3KkbtVC6Gd6Wmp1Mv
	vqmfJcWqnRU2B/pPA1CwYUleIb8JRGEuz3wPKF6oshwIeRk65YmMjQQo6yBPFl9AxMa
	/9VvkQufkw877SKUFGTZvtCcETUhm7eNqLU6yYbg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=itm/6dfcKdWW0xnsdAgsTIRROPS/7cQkIIipPbHhXys=;
	b=kWEtaW91xxwocM3ACKldsDeXhkwoMjMpkmPGW/z8yEBfMfLFo2qDbuANNHKpPWdP
	EsAsVv81wxMeywVeqSAqBsXgwUGF9XsP5shDGy1Gt7FaIBNXrM/3/1D/WPgyIgycit7
	b4anOOlHpzCmJKEXaWwm5KVjGtq1S+udxGLnJe9E=
Content-Type: multipart/mixed; boundary="===============0519007994462461110=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to
 c8d967340e71ae7dbf707b25769f4673b0babcef FAILED
Message-ID: 
 <010101816776662e-fb15c415-53a2-4fe3-8e9e-c2da64440d8e-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166971

--===============0519007994462461110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *c8d967340e71ae7dbf707b25769f4673b0babcef* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake vulkan-samples' failed
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.

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
--===============0519007994462461110==--

