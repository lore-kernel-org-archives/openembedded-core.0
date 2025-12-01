Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F3E4D1266D
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:02 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14080.1764566267354778964
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jS4z5DIp;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=tCpEQDJs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019ad858ad5d-dd188d47-da51-4d77-8cd9-ce1aae837298-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566281;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/7ddtzT+yrq8vbX+aVgF+zI55f0NSbHnhaBfa2SApwg=;
	b=jS4z5DIpnbHnRm7YQYNMZGO7dUFsUJKZbPqvKv9rRAXygQh/LeRxR+++06DN0+jM
	MGVCxdF+yLJ68Mo6D7V9LgI0EnpoylY9OQsUaa8ebdosfhfcRYtg/O224vULTfUI+4w
	tGhlG0PKNV7eIzO/NV6mVZaevlisQOdKmgEOItNQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566281;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/7ddtzT+yrq8vbX+aVgF+zI55f0NSbHnhaBfa2SApwg=;
	b=tCpEQDJs2KzYHN0gfLyjXX2u6E/g8wVOcEFyDwK21eYkw9yZjBw5pQ4zvURt0sDP
	gtaxew4LK5/1+d/4QYdvzcp3eeg215ZzLdtDJ9nSgxn2FJoElta6PER8SyleknkzxmQ
	fREGZMc5CJMDsjC72YfUG4lkL/X9LrmSmJeaJKgw=
Content-Type: multipart/mixed; boundary="===============3882196425685982334=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-poetry-core: upgrading to 2.2.1 FAILED
Message-ID: <0101019ad858ad5d-dd188d47-da51-4d77-8cd9-ce1aae837298-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227012

--===============3882196425685982334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-poetry-core* to *2.2.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-poetry-core' failed
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
--===============3882196425685982334==--

