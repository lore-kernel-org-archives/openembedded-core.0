Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98391D12667
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:01 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13897.1764566264045401888
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MKU2dazF;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=b8/AyDtp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019ad858645a-d0dcc3c9-2553-41fa-b9a4-6d2abb7405d1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566263;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Vd2fx91ijYHNqtuTxCYTzz9SgGP2cwIMUt7dcwpBu7o=;
	b=MKU2dazFACrnimtwwyIc5Rv6J/2sf2fnlWS2fKvoZpqF+lfjFSxnzKAAG98k9ca4
	LkijSrslr+1CXOcu/8LngCq62jlgrbMEoIzGlrJTqhLR/2ctLx3yLodDO+a5Ds9M5DC
	WW743mGptAiw6wZlDJLDmOmt6eTOVLJwGXYxcNhM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566263;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Vd2fx91ijYHNqtuTxCYTzz9SgGP2cwIMUt7dcwpBu7o=;
	b=b8/AyDtp9VBq32ZYB2ByvW38Gn08PgmYUGj3q9pk8dHUxPgdIJW9egwosikNauxW
	QFRurO5tQBaXsILd+1pJigNMbbb3HBqW3n8DCol28pGWis47L8RiW63z5IFAGCKxvKG
	sjbS7eqK43U71V0tlzSy6Z/W6uijQXKreOJ+fz8U=
Content-Type: multipart/mixed; boundary="===============0382570112194201829=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>, 
	Chen Qi <Qi.Chen@windriver.com>, 
	Viswanath Kraleti <quic_vkraleti@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH]
 systemd-systemctl-native,systemd-boot,systemd,systemd-boot-native: upgrading
 to 258.2,258.2,258.2,258.2 FAILED
Message-ID: <0101019ad858645a-d0dcc3c9-2553-41fa-b9a4-6d2abb7405d1-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226958

--===============0382570112194201829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemd-systemctl-native,systemd-boot,systemd,systemd-boot-native* to *258.2,258.2,258.2,258.2* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake systemd-systemctl-native systemd-boot systemd systemd-boot-native' failed
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
--===============0382570112194201829==--

