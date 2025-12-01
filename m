Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A161D11707
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:13 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13933.1764566289266793765
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=XyO5ks26;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=UYBlnkDK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019ad858c91e-c4a19313-8df2-4690-aa85-21d29ee1d3cc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CMnEwINDQjrvseCLG3lNZWZBtf/NojIzMZVQn1uAPM4=;
	b=XyO5ks268YqbUO2UVtkLugsIfRHM8MvGLeYXRCvPh/jKIZ+yeYsRiTawzKuUBHWn
	lJuKxvpxLFvm4xu5bbmusbSNOGrOxVdEPFVZRQPdDfeUC4zV+CghQOd85VZzt8shJjE
	hF/GuRGbzCYTwf/Pw2vQUlDwXnVL53aysRHXzZrs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CMnEwINDQjrvseCLG3lNZWZBtf/NojIzMZVQn1uAPM4=;
	b=UYBlnkDKbxD3B+VGBXdysC8SgOxijPsq4P4V4RKUKtGriuyvCBIz+WicS5Ngy4MC
	fMKQisW3Klyd4dg5dEDEF0GytbrpIvUBSb7Qah3PU5BjMPL1CDBmjPUetYuNTxftE7Q
	sb1AkWpduL+wz1jw0pmCvNrOy+UN7e7oDF3Q+LTg=
Content-Type: multipart/mixed; boundary="===============0666585715652304289=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] tcl: upgrading to 9.0.3 FAILED
Message-ID: <0101019ad858c91e-c4a19313-8df2-4690-aa85-21d29ee1d3cc-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227040

--===============0666585715652304289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *tcl* to *9.0.3* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake tcl' failed
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
--===============0666585715652304289==--

