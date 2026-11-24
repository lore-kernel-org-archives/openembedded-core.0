Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24719.1795541894114345336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 09:38:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@automation.yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=kzG0rnsm;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=vdGoZ7mN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a20ea300fc-311df9d0-05f9-497c-9783-5bd6eb71f476-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795541893; i=@automation.yoctoproject.org;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date;
	bh=KWhxroiJJoeoqpvynYtMmvAL/4733YeeIo5LgCAKjhw=;
	b=kzG0rnsmITytz1Fk8Ks0Mq7jSVbOBgDq4zt0TiwLaRpMUq32jVUWUeS6M9/qMVTq
	Y+UvUyVsqDHj6lTzMSIyxP1rZdvL06PxKqD08Pv49TgPWPWvUJjBpR7Um1eOVjMc3tI
	mfd831bH1G9DzRdgSPRrQSYKeF3Kc3ek6PHSmM3A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795541893;
	h=From:To:CC:Subject:In-Reply-To:References:MIME-Version:Content-type:Message-ID:Date:Feedback-ID;
	bh=KWhxroiJJoeoqpvynYtMmvAL/4733YeeIo5LgCAKjhw=;
	b=vdGoZ7mNmP3PpZQnG3OFJr/frNCJ04J1SSMYYlBeOjtGUzYsZUkqDsDRSmKJEXES
	HkLYiX/rLp6g8yl1eMHH0LRxVhMbO3fDByBXdJNecv8JqZyRXlDmzokd3zyJl7+HyZw
	oMW+2woersqLxS/XG4DQOygrJiSGwzV98/Mr73d4=
From: patchtest@automation.yoctoproject.org
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
CC: openembedded-core@lists.openembedded.org
Subject: Patchtest results for [PATCH 05/11] zstd: upgrade 1.5.7 -> 1.6.0
In-Reply-To: <20261124171807.74394-6-jaipaul.cheernam@est.tech>
References: <20261124171807.74394-6-jaipaul.cheernam@est.tech>
MIME-Version: 1.0" +         "
Content-type: Multipart/Mixed;boundary="NextPart"
Message-ID: <010101a20ea300fc-311df9d0-05f9-497c-9783-5bd6eb71f476-000000@us-west-2.amazonses.com>
Date: Tue, 24 Nov 2026 17:38:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.24-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251068

--NextPart
Content-Type: text/plain

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Tests failed for the patch, but the results log could not be processed due to excessive result line length.
---

Please address the issues identified and
submit a new revision of the patch, or alternatively, reply to this
email with an explanation of why the patch should be accepted. If you
believe these results are due to an error in patchtest, please submit a
bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
under 'Yocto Project Subprojects'). For more information on specific
failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
you!

--NextPart


--NextPart--
