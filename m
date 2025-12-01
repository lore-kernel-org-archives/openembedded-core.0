Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE09D11718
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:00 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13897.1764566264045401888
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=pYfyfURH;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=atV68J1R;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019ad8588c61-297b0fc2-aace-452f-99c7-0d51d9f240cb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566273;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XsxQpXfGbRggWXWbsswe0/0KxgZg74vQEqxcljCUe6k=;
	b=pYfyfURHtPcb3Wk7+l5fqJUKYIXVw6AB9sz7tPsOC2WsTyFexMNHKXl97wwUfzgS
	YmjTBW0TYWZtVnm2RBEUGWX7ANimAiz0BXHeurs7PGc6ulDyPQra090ZOGqjPLowNk7
	2xVH/XYjJqYclzMLdqOZGfoesYv9jYEKCgxu7Wh0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566273;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XsxQpXfGbRggWXWbsswe0/0KxgZg74vQEqxcljCUe6k=;
	b=atV68J1R5D+FbXvLss0vRC+mOLDjJHuHq+BlWQfk1sUUSzc9oUvWEjKFbJzTceks
	1feUB9xnNsnpETdn8l/CMKv0WWrQlBHKDwBMR1kiE+NttQU2u1VL+gTA4BEsgcp8js+
	UztVCouz95yq4CItKEu31O1jyTHEE3odAb6XhNmM=
Content-Type: multipart/mixed; boundary="===============1128361869104384902=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-attrs: upgrading to 25.4.0 FAILED
Message-ID: <0101019ad8588c61-297b0fc2-aace-452f-99c7-0d51d9f240cb-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226987

--===============1128361869104384902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-attrs* to *25.4.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-attrs' failed
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
--===============1128361869104384902==--

