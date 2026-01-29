Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DEFCD358FE
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 11:09:26 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12473.1769684960128440938
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 03:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hZV928U1;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F26C9C211FB
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 11:09:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11282606B6;
	Thu, 29 Jan 2026 11:09:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C47B2119A868E;
	Thu, 29 Jan 2026 12:09:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769684957; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SDzUwIpePIL+ljVv/gWiJHgdggIkh9p20yMPi916wqM=;
	b=hZV928U1k//czo9jyhZo12waC0csGlj/zIkvjCG0Tr/jUTcus6X5/LT0Vo3G1q+Looclqc
	3IT60Kpze43baI7WpNMRlKMVxTesw2AZYuAwAjgw+qmoLwrh7ERPBRQLb6uBzHOzykZNFT
	6WJuA9lkpQqFvaAvIBCF0vtRSFMrNMo+YI7I5SoCOnxxm1ToWvvStdOQEdBueBYvFSVSJh
	QjOzTC16rp3J3zmg+20J5kAXq7YCXWERdheptf+hQlWX3l2ycdD5dBzakP75C2vxUUS3C+
	YfT4LwpDw0mSSCcW/GkN9GVNH5eirc+xnLEuaPmmPimWE3Yy9WhMUGlCN4QGLQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 12:09:15 +0100
Message-Id: <DG10YLESIC8Z.1WG7A8NQY6SDL@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] python3-pycparser: upgrade 2.23 -> 3.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260128030515.1116-1-wangmy@fujitsu.com>
In-Reply-To: <20260128030515.1116-1-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 11:09:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230130

On Wed Jan 28, 2026 at 4:05 AM CET, wangmy via lists.openembedded.org wrote=
:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for the v2, it got better. Yet we have some ptest issues:

Failed ptests:
{'python3-cffi': ['testing/cffi0/test_parsing.py:test_dont_remove_comment_i=
n_line_directives',
                  'testing/cffi0/test_parsing.py:test_multiple_line_directi=
ves',
                  'testing/cffi0/test_parsing.py:test_commented_line_direct=
ive',
                  'testing/cffi0/test_parsing.py:test_unknown_name']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3001

Can you have a look at these?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


