Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B54D11718
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:14 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14100.1764566279770090488
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DvRr0GDO;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ISmyv3/p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019ad858dc06-cccba304-70c8-46d6-8bea-dd35ba9ff58b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566293;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=O5tltSzcrB+sRvphX6sJfFezvW/oX6K64ciakxG+a9o=;
	b=DvRr0GDOcYwqWqRNRsnRcVc0uRjCSkf+Z7eFLopAxfApvntEh5CLuMshVpWkuEBS
	na8HonoBmgTQLTtiU34grkqi/vLNpOF9j15KdRsKPKh3lAYDpwJ6tG897OsZ+5nFG9V
	ARYRwKnzPy6ywtJK6nz1sCYs/uI6K2FAgFUI3Nqc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566293;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=O5tltSzcrB+sRvphX6sJfFezvW/oX6K64ciakxG+a9o=;
	b=ISmyv3/pnM6teLTYZtzTRo4/IcWHFsf2aYZw7QAnF97TUsdgyNRMorzec8lkc3h2
	leJ5rlqajzy1GoNvHeitWneMBqw3jplD0ICV0O2ZvCAuCZTmjIsktbA+KprvUGPhveL
	bmT3QCRmqE7AtBVJtlobIvQT5qepx+fIyOdedVv4=
Content-Type: multipart/mixed; boundary="===============0414115066533917460=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] freetype: upgrading to 2.14.1 FAILED
Message-ID: <0101019ad858dc06-cccba304-70c8-46d6-8bea-dd35ba9ff58b-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227061

--===============0414115066533917460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *freetype* to *2.14.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake freetype' failed
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
--===============0414115066533917460==--

