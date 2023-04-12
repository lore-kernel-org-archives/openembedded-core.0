Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C505C7619A
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 07:57:37 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.37387.1681286248168190085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Apr 2023 00:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cv3Jai9n;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2D0A1FF809;
	Wed, 12 Apr 2023 07:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681286245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gkdQhaOAp9kj/kdUE14Ar5w4YjyQ3dtFz6C6yOzz+4k=;
	b=cv3Jai9nCf8b3blROCJjnNYR81GKM5a1u7Kw5Vyi56vtgY/AgSVsuYCbyF2zEUYvsv0oN7
	E/vRyla/uGZv2hD2FEpsHrbej43eTyQISXGapZJQXGp1ZPOVYPMaFGhFQUlq+k6tExC833
	+pdeMkYgyKFZ4i/n0y5Xu0FN1pcOgvz8hc80YGkoWCNbK9HnlqW4fm9BPIeSwLEJ1XWRJa
	OJRWaiKMhIAdUtLfSugORh7/pyIL3qDFdvi1NUUYkGh5nUTfdsHYJPkzyC60OrYiJdjh/P
	BG6FNFnhMf7m+LOB/w6q063OIjwsAx6hn+gsg1BWi4IVZY8nfs6M83VYVIZ2lw==
Date: Wed, 12 Apr 2023 09:57:22 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Louis Rannou" <lrannou@baylibre.com>
Cc: openembedded-core@lists.openembedded.org, khilman@baylibre.com
Subject: Re: [OE-core] [PATCH v4 1/2] oeqa/utils/qemurunner: change the
 serial runner
Message-ID: <20230412095722.79b78b4e@booty>
In-Reply-To: <20230411150503.2105880-2-lrannou@baylibre.com>
References: <20230411150503.2105880-1-lrannou@baylibre.com>
	<20230411150503.2105880-2-lrannou@baylibre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 07:57:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179941

Hello Louis,

On Tue, 11 Apr 2023 17:05:02 +0200
"Louis Rannou" <lrannou@baylibre.com> wrote:

> [YOCTO #15021]
> 
> Create a new runner run_serial_socket which usage matches the traditional ssh

Nit: I'm not a native English speaker, but I think "whose usage" is the
correct form.

> runner. Its return status is 0 when the command succeeded or 0 when it
> failed. If an error is encountered, it raises an Exception.

Should be "or a negative error when it fails"?

I'm taking the patch for testing with these two changes, let me know if
I should do otherwise.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

