Return-Path: <yoctoproject@neumann-web.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF29CC433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 12:28:22 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by mx.groups.io with SMTP id smtpd.web08.6240.1643372902027314914
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 04:28:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: neumann-web.eu, ip: 80.241.56.152,
 mailfrom: yoctoproject@neumann-web.eu)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4JlcDy3PKPz9sQV;
	Fri, 28 Jan 2022 13:28:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Date: Fri, 28 Jan 2022 13:28:12 +0100 (CET)
From: yoctoproject@neumann-web.eu
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Message-ID: <731519568.294808.1643372892075@office.mailbox.org>
Subject: [RFC] support for multi project toolchain-cmake
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jan 2022 12:28:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161077

Hello everybody,

regarding my bug report
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14703 I was
forwarded to here to discuss requirements for a proper fix.

In the report, I already mentioned a non-generic workaround for that.
By extending the CMAKE_FIND_ROOT_PATH with CMAKE_INSTALL_PREFIX.
However this probably doesn't cover all ways a toolchain can be used.

Another solution could be to respect the user provided path and
instead of overwriting the CMAKE_FIND_ROOT_PATH variable, to only
extent it by the toolchains location.
This however would make it quite easy for a toolchain build to break
isolation, when wrong user input is set. I don't know how strong your
requirements regarding that would be.

So feedback how a fix should look like and what requirements it needs
to fulfill would be appreciated.

best regards
Tobias

