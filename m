Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467D1C25B0C
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 08:15:07 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.22199.1659341690240293621
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 01:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YfO1elyV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101825878d517-7be99361-cf05-411f-bc2f-dd08dbcea0b9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659341690;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dpGLSR1EKYGX3mb2f9K3nlugjjqGUzE9I3RvG8oMHaE=;
	b=YfO1elyVrsMflZrwwvyUgB6/hD/ZhuQVL6J7HpxrbttqtTUt6LaL46rPK1dFJNRs
	SMbqYLp8BOATF0jZ0PwUvq514x1X3odWbjJJuJlWo+eMK9vd1ujgqv+8J04x1wsqRPC
	PgbRJ81Co8Af7oK98CMPQ1ZL8kisJAy8q38GiwAw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659341690;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dpGLSR1EKYGX3mb2f9K3nlugjjqGUzE9I3RvG8oMHaE=;
	b=RtGFrWV259/kWcGwLDPk7ddKDGEzbgz8+t+IdsntMQp1XjkEPDGd2PnSp/aJsqOF
	pfmZ1vSX0VU1sh0Z0YJbo7v/eAnTQU1UTHKjS4ZnuDxN78uRhPc2rm/uOIRm6BmwgEn
	vA5UD2cwuIfPmwIEX749XPhHem87B6RnhxKfGXH8=
Content-Type: multipart/mixed; boundary="===============3868761846851806219=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hypothesis: upgrading to 6.53.0 FAILED
Message-ID: 
 <010101825878d517-7be99361-cf05-411f-bc2f-dd08dbcea0b9-000000@us-west-2.amazonses.com>
Date: Mon, 1 Aug 2022 08:14:50 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 08:15:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168703

--===============3868761846851806219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-hypothesis* to *6.53.0* has Failed(get_env).

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
--===============3868761846851806219==--

