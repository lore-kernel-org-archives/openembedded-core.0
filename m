Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAFED116FD
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:25 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14132.1764566303859339281
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Yw5WHTEK;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=GGWjwdfZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019ad8590239-075905d3-6da4-4f10-93a7-4d63d7792b3c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566303;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NcGEk83CP1gL8xQwV2Xiv4v/neqerfIjYrLIDVN5J3c=;
	b=Yw5WHTEKR+/RGPPnmrJ4WSnKvChmOXx4aamYMyYBrXxTDOj3bYiHJ8fClwJdnmW0
	3qKl5J099eeKEPwr/zS+Z7svdOvJenoyVar4ccPQSf6b7fgybnDZU3uz7Ie5n3rNtDr
	d4BVZv8ebvzswwNNNiiD5xnm77SMB+cYMwR5JQ2U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566303;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NcGEk83CP1gL8xQwV2Xiv4v/neqerfIjYrLIDVN5J3c=;
	b=GGWjwdfZsZrUnRcGvj3hoQ7T/x28FWjmffne5yxDgaNnQicQZe0uUdjipUidDaAC
	DfBr/IYUlZbx/OopFMxNNZ1N3AJHQseh0XKUPXkxXF6NEk288OrzQQw4J3aGEv6+ymM
	EP0z0j2kMVFYap9YTNmlVHNRnLLM5KEc3fdnxHA4=
Content-Type: multipart/mixed; boundary="===============8996636147895220284=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] vte: upgrading to 0.82.2 FAILED
Message-ID: <0101019ad8590239-075905d3-6da4-4f10-93a7-4d63d7792b3c-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227112

--===============8996636147895220284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vte* to *0.82.2* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake vte' failed
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
--===============8996636147895220284==--

