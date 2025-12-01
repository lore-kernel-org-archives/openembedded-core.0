Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D01D1267D
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:14 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13911.1764566275843661686
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ge99J0+k;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=r4SJHNtz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019ad858b344-785223c1-fa24-4e75-826e-7da7d177961b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566283;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=48ICDmvmyunl6yg1vwqR0llYCNnC+1/ZzStyce85qDk=;
	b=ge99J0+kZRE5g7kNbi0VpDr9ju/1HFJn9Bfti/Yx94r2XAxPAVWA5LTofE9OBZjD
	l47pzbAZTjnAEi7h0lCi7rHBgS7M8hJ3chXEA7LsshDlxHNGSV8YhOE+lmffTiMRyj/
	8JFtKyY9Hh2Z4IbLkBW4Y2GhjjU9QpnAXm4ZDyEY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566283;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=48ICDmvmyunl6yg1vwqR0llYCNnC+1/ZzStyce85qDk=;
	b=r4SJHNtz/YFBm5faTEr6rMx9jD6V/0dCqcbFs5V6IS7iGqut/4Bqd0Cns5ypTzSc
	CB7XKJX0fhXhr0n/vZ4SmdHoG2M6nGSf2tyX4rQLxAQdS/w6TsPiszl0mhSLdz+k+xM
	iSHBm3MP9bYoxl1d/aOIcTxV41fbH0e+ZGMjsLh4=
Content-Type: multipart/mixed; boundary="===============0059072979344457337=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest-subtests: upgrading to 0.15.0 FAILED
Message-ID: <0101019ad858b344-785223c1-fa24-4e75-826e-7da7d177961b-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227020

--===============0059072979344457337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pytest-subtests* to *0.15.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-pytest-subtests' failed
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
--===============0059072979344457337==--

