Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F14C433EF
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 04:19:20 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.web12.2319.1643429957850414991
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 20:19:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org
 header.s=mail20150812 header.b=ZHQqVtQ4;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151,
 mailfrom: crg7475@mailbox.org)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Jm1LB3d7lz9sR5
	for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jan 2022 05:19:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1643429952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8CbYHKrSLdDNg1HTgj6vwheotxm2ZvmqwLPSs3V8nxQ=;
	b=ZHQqVtQ4mGzMXpFwakThHuYj6aEh/wG1s8wtWQVwBjYHlIUo0UihP7c48K6Gf+Y8MgEm8X
	xqFr0qPT8TdMkL7jJ5UBNupCVZHisNpRI0NCdD6jofen3V753k31bpvfova0fale+64+xO
	oX6jYnbV13IZ5iJfsdH35ZbKHUJI0OXHHrDp6gJjq5g/WikEvgoVUEt/wi1zoHWNG/x+kF
	dcgXE7WefgUeziRgYegW85PLZPLir59cvxwoijSEFHlt8yFXXnbqCE34y+kT2Do1hSOCke
	tIjfQIoD/g2e8X7UGOih3xTgW2aqFKYChCmZVmchCNhAjkO2jiCST47Pvw8oXg==
Message-ID: <7d9d9223-77bf-eea7-2f8f-b4e7855e40b3@mailbox.org>
Date: Sat, 29 Jan 2022 05:19:07 +0100
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Content-Language: en-US
From: Carlos Rafael Giani <crg7475@mailbox.org>
Subject: How to properly enable PAM integration - docs no longer valid?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jan 2022 04:19:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161097

According to this document:

 =C2=A0 https://wiki.yoctoproject.org/wiki/PAM_Integration

PAM can be enabled by adding this line to local.conf:

 =C2=A0 DISTRO_FEATURES_append +=3D " pam"

In newer Yocto versions, this would be:

 =C2=A0 DISTRO_FEATURES:append +=3D " pam"

and this works. I *had* to use "+=3D" instead of "=3D" here, otherwise pa=
m=20
would not be added correctly.

But, then I get this warning:

 =C2=A0 WARNING: DISTRO_FEATURES:append +=3D is not a recommended operato=
r=20
combination, please replace it

So, how am I supposed to enable PAM in local.conf if I need to enable it=20
quickly for a test by using poky and can't set up my own distro right now=
?


