Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98363D11714
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:25 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13944.1764566298643080045
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PRNgIGPx;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=LJeuH+KX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019ad858fefa-de410cf8-8cd1-4af4-b00c-875efe59c119-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566302;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+Blj2TCIyrFAczOCHBNM4g7u7G4qbqQNjiBw1PM3l0o=;
	b=PRNgIGPxzG3qUKTn/1GeYmC8WzRrJHlx01qSVoVEDvpupY2k7Qh2XLKcsKhUuDs1
	tkoDSTVCRfV+LqAAOrqND+I4VJnEgXlqbAm8xCiD6PArlk40LyaWr61EG/psx1ZsGUT
	EM0ntlFDaZsgRkXGzENO6mEkvnrUwJ0abuMbsJms=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566302;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+Blj2TCIyrFAczOCHBNM4g7u7G4qbqQNjiBw1PM3l0o=;
	b=LJeuH+KXRfdjQEs7jd6c1kPrcghNJtexJ9af54neKNDoPRKho6OGRYsAWvus2JIi
	KX051a2unXfakvPZFuPfZSRzpoPquMD1E2yCVozC7qs+1C3axWhnGWOBpXPk3sg4dYB
	rPmwFMN2TbyECbCRpDa3zB/VSDT59NlueyP+Lilc=
Content-Type: multipart/mixed; boundary="===============1566534988327489459=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] sqlite3: upgrading to 3.51.1 FAILED
Message-ID: <0101019ad858fefa-de410cf8-8cd1-4af4-b00c-875efe59c119-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227105

--===============1566534988327489459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sqlite3* to *3.51.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake sqlite3' failed
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
--===============1566534988327489459==--

