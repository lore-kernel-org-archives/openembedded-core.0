Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA1DC3DA48
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:10 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.129637.1692086041169952320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FmDRMr0V;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jaweiqTS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010189f82ff678-c9b5cf12-beb6-4716-b995-e89d4c73382e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086040;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=C4AYDvQKwXiqk3FnL9ciWWnrZ/6GMwbx7oyjkfknqnA=;
	b=FmDRMr0VBx38/EP0iUxZ7SGm+WN9Ip61aes/19GayYGj6ujyPawWFv+bNu9bQtwm
	47aduiq3nRQDdzeHPNMqeZyu8FOCUD+iAV9hntwPNeen4dTzbJ62RvuSyhwzZIAnYKe
	hKIryKdAWoBG4FReZRaVoHLwJFJh2SdH6efF61xw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086040;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=C4AYDvQKwXiqk3FnL9ciWWnrZ/6GMwbx7oyjkfknqnA=;
	b=jaweiqTS2khLQPiI71APl2JDzM1do7cXqBUVPFZ2Xv9CKOyukeLO5KbCo2ZQBzUy
	+jovSVIMReYLL/4RckQcB8s33/FzhJcuyN2m302j7XKZq9eIheTIhW/tk9LyzT0vzjX
	Q7cPi/j/2JTxVJAPboFq3HbCGuiET/pWfVbb1gR8=
Content-Type: multipart/mixed; boundary="===============8774037042017338377=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] connman: upgrading to 1.42 FAILED
Message-ID: <01010189f82ff678-c9b5cf12-beb6-4716-b995-e89d4c73382e-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185947

--===============8774037042017338377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *connman* to *1.42* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake connman' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
Removing 7 recipes from the core2-32 sysroot...done.
Removing 6 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'udev' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/ofono/ofono_2.1.bb DEPENDS on or otherwise requires it)
eudev PROVIDES udev but was skipped: conflicting distro feature 'systemd' (in DISTRO_FEATURES)
systemd PROVIDES udev but was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'connman' has no buildable providers.
Missing or unbuildable dependency chain was: ['connman', 'bluez5', 'udev']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8774037042017338377==--

