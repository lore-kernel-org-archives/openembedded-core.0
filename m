Return-Path: <patrick.vogelaar.dev@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567B0FB44AE
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 05:29:48 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14989.1777008578639255667
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 22:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=vUa4WzlP;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151, mailfrom: patrick.vogelaar.dev@mailbox.org)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g21jp5j3Cz9tjX
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 07:29:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777008574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=e0T5Wcxey9EgkT+NxTqxbq2IEvfRgkg8zzuHXTOlk0I=;
	b=vUa4WzlPccCTYcMYZ1celHTByFKD59xCePUzZKPp1XYvM3ymsW6cj+wFH63tmnuePPw8Ct
	Im3EJ3zZCVp+3Ltiaw8XUDFCC2NdxgrvfJRmbB7pRKsiyiEGZC5skydH7wsF32/8gyUvLb
	rBj/7oL/ceNpOQAeNEb+ficXmlWo90TpB6ArMCWZ9BbHF41yHVwqFMMmVB6UKPIEFwCZvB
	NTxU6DksYgUxjojNaf4MS1vKY0PZawc1QsIhq4JP1/gVbW8OrmMKDroJhdyZzl542nFFVQ
	Hn42ZAcFFq1RjxsXoEjKgIJb4bKRC4mg9/O20RXyrCdA7gQeWE2gqr1ftkCiuQ==
Date: Fri, 24 Apr 2026 07:29:34 +0200 (CEST)
From: patrick.vogelaar.dev@mailbox.org
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Message-ID: <711678500.248994.1777008574252@app.mailbox.org>
Subject: DPKG Issue - guidance neede
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-MBO-RS-ID: 725c0d1e80cf556d1ad
X-MBO-RS-META: fe5wp65meeoosqm1x54gmm1fyk9idsbb
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 05:29:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235836

Hi all,

we are building a custom distribution and are using a shared sstate cache. Now we discovered an edge case where it causes problems if parts of the CIs build path exist but is not accessible due to permissions.

Build path CI: /var/jenkins_home/.../build

If now on my local machine the directory /var/jenkins_home exists but is not accessible due to permissions the build fails in do_rootfs with:
dpkg: error: error opening configuration directory '/var/jenkins_home/.../build/tmp/.../recipe-sysroot-native/etc/dpkg/dpkg.cfg.d': Permission denied

If this directory does not exist dpkg fails silent and there is no problem at all. But if it cannot access it because of permissions it throws an error.

What would the workflow now be?
Provide a patch to the dpkg project and also add the patch to the recipe? or something else?
Should I create a bugzilla issue?
...

Would be great to get some support on the typical next steps.

Thanks for the guidance
Patrick

