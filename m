Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A864CCA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 11:20:04 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.18351.1756379996985069348
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 04:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=V/sUJ7P+;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CD0DEC6B397
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 11:19:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 191FD60303;
	Thu, 28 Aug 2025 11:19:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F05971C22D2C9;
	Thu, 28 Aug 2025 13:19:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756379988; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qGlmV2JWwxINlUmuIxaubVknjgdpR+PPYkb9vXGIafM=;
	b=V/sUJ7P+Udq7AvxeBnX2/Jnou8YCFuGYK0WZyGjuF5XI+ca6ADvkFZTStRtbJfoQb8cGNr
	0LCPdE8cF2+BPKMePRvkhhFdfzsdTUk3DbTIMW4IWeQGyfjlVrd1W3zfhkqhqLkrzF1fg5
	6cWEKtOB2FJ/Ag1+u6bt5tjv73XqzTwbEStI5ZASzphHXZSw1ln6iDJvMoriT8M7n2rdMj
	A5O3oXlHSm1MEBAZMDup9lV8gXuc2ljIItEwGSXOr6znSbNX1kKwz1sSRPs5BobwCSxqAM
	wqzqqdKvNH9DiizaCseG/EfJvpPfAUoBqk8nmepMRLkKhFTtOPqhOQzDD3PQRg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Aug 2025 13:19:35 +0200
Message-Id: <DCE0QLXNCY9D.2R8F48WOAHJRW@bootlin.com>
Subject: Re: [OE-core][PATCH] default-distrovars.inc: Switch to the
 canonical website domain
Cc: <richard.purdie@linuxfoundation.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <mhalstead@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250828104332.75862-1-mhalstead@linuxfoundation.org>
In-Reply-To: <20250828104332.75862-1-mhalstead@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 11:20:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222563

On Thu Aug 28, 2025 at 12:43 PM CEST, Michael Halstead via lists.openembedd=
ed.org wrote:
> yoctoproject.org redirects to www.yoctoproject.org. Switching to the
> true domain we avoid an unnessary redirect and avoid certifcate errors
> on a default Debian 11 installation.
>
> Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
> ---
>  meta/conf/distro/include/default-distrovars.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/=
distro/include/default-distrovars.inc
> index 9ea3b5414c..bbd936efa6 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -63,4 +63,4 @@ KERNEL_IMAGETYPES ??=3D "${KERNEL_IMAGETYPE}"
>  # fetch from the network (and warn you if not). To disable the test set
>  # the variable to be empty.
>  # Git example url: git://git.yoctoproject.org/yocto-firewall-test;protoc=
ol=3Dgit;rev=3Dmaster;branch=3Dmaster
> -CONNECTIVITY_CHECK_URIS ?=3D "https://yoctoproject.org/connectivity.html=
"
> +CONNECTIVITY_CHECK_URIS ?=3D "https://www.yoctoproject.org/connectivity.=
html"


Hi Michael,

Thanks!

Can I ask you to modify also the URLs in the test cases?
We have two occurrences in meta/lib/oeqa/buildtools/cases/https.py.

Best regards,
Mathieu


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


