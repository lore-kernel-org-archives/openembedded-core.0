Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334D0C25B06
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 08:15:07 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.22203.1659341691398699392
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 01:14:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Qzo42zEu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 010101825878d75b-b8710af0-154e-4e1a-98d4-82eba714e340-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659341690;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1SwiiGJ0dP8wmvTL52Ik5S+77Wt1KX+QIv3+EHllO8s=;
	b=Qzo42zEuH9lYqGsbmMcCaXWvmFkCxGnXt7/iaW7eT5gDCwA7qQlNSfNfEBjn71Jk
	IH/nGlbt2LXCJ4PBQTJtzC1eXb6I8kc+Ai8RMiJv2SLEqCX3vFkUGSLPWtn7tWjJDnu
	YJ3LotwvWjH0wbZLqXxh+DJ8Ufets2iBd3auTMkw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659341690;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1SwiiGJ0dP8wmvTL52Ik5S+77Wt1KX+QIv3+EHllO8s=;
	b=fc0GAXID4yP5UFS+7o/grQo7E3AVpk6SHhym86ns8Wok1drAM/91F07KJEnstrSa
	SwaVMGXanlOvVPG2/PWSEBEOcrLJU0ByEnlfwz3QkQave3eKOIHivMTJBSkn1rtt6Py
	agjCJ5KRE1FrmexY1bI+ZoVCvApRu4HamGfgJUe0=
Content-Type: multipart/mixed; boundary="===============3017900998625718703=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rust-llvm: upgrading to 1.62.1 FAILED
Message-ID: 
 <010101825878d75b-b8710af0-154e-4e1a-98d4-82eba714e340-000000@us-west-2.amazonses.com>
Date: Mon, 1 Aug 2022 08:14:50 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 08:15:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168719

--===============3017900998625718703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rust-llvm* to *1.62.1* has Failed(get_env).

Detailed error information:

Empty environment returned
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1659 entries from dependency cache.
Parsing recipes...
Summary: There was 1 WARNING message.
Summary: There were 3 ERROR messages, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3017900998625718703==--

