Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63451D1267A
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:14 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14099.1764566279734838755
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=01I1K3GD;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rz/VPwmm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019ad858b631-32dfa49d-20f9-4c5d-897f-26c0f20289ca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566283;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JxmeVSWSlCSN9ZCUh93yRdMsF+rqhKaCQf4p3PRgzXg=;
	b=01I1K3GDlLW9FiZVfd1/LqcnNbEkXpLXXzHRrPoRvqvLC20Kql2NBmHUorUFAMw8
	NZ2HeWKndPzE8w16JkzF1uwkyiyEecTNGUSZo3OAezBg0FsuBjp6irn/vDFFYM6OSlc
	gHKRonMLfC9umwkvQiUff9Ykd6OTIEQtfBb6M5Vc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566283;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JxmeVSWSlCSN9ZCUh93yRdMsF+rqhKaCQf4p3PRgzXg=;
	b=rz/VPwmmbQ1v+1HCllcphz0FvG8FuWeslJ5KvElRJ5Hv33JapxEgrdwDqp3cRE8z
	MboEd1REaT4gHIQ4hjtDJQwoG/yk/Ose9yxcsom4Jx+DwXJdI9wuQQp+tUXQe7HHMDY
	rxIz+IHWK1Mk7oTKeVYQ/aVTQXHT6jdid6kQIls8=
Content-Type: multipart/mixed; boundary="===============3631028361545282587=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyyaml: upgrading to 6.0.3 FAILED
Message-ID: <0101019ad858b631-32dfa49d-20f9-4c5d-897f-26c0f20289ca-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227021

--===============3631028361545282587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyyaml* to *6.0.3* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-pyyaml' failed
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
--===============3631028361545282587==--

