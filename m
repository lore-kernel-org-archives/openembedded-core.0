Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 471B8D12693
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:27 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13921.1764566282580776567
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GQAKPxiz;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Alo4H3+P;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019ad858e6f1-2154ecc5-1398-4b2e-829a-095bca4755fc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566296;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+1RxVwZ9tG4QcMaTC78vUwVAx6wnqodr7PUl9iJrsUE=;
	b=GQAKPxizVEXZ+PiEDAbB5PGe2bAljgNXMaKCKlyNMlwfvkasDffyaB8XY/ukyQOQ
	AaGEGg3z4NApLvuNmJCEqGCUpy0ljUaRSl10USNSwFSX0d8aNzfXKg8SWQhgoygJUqI
	L6iIW61dlsBqJ9L69Kklu39UzKhbap6Zbjg5eSv4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566296;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+1RxVwZ9tG4QcMaTC78vUwVAx6wnqodr7PUl9iJrsUE=;
	b=Alo4H3+PijhYY3O9ncKxojOYvqFrIou1+ln9b2Uib+VAZMLO62JkeZPLI9jRzBdP
	sOLgEoMO2ZVDNjLUxMWXOjLUjlCmmFUiinQVWqnEuD2FBc9EwT2EmhDWBTq0fLdqcL3
	PxYO9TLtj4Yg0PqvYmDdLHHgtboDLpddC5s3l+8E=
Content-Type: multipart/mixed; boundary="===============5940966733801280123=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libinput: upgrading to 1.30.0 FAILED
Message-ID: <0101019ad858e6f1-2154ecc5-1398-4b2e-829a-095bca4755fc-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227072

--===============5940966733801280123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libinput* to *1.30.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake libinput' failed
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
--===============5940966733801280123==--

