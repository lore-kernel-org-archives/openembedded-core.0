Received: from relay.dream-property.net (relay.dream-property.net [178.19.67.222])
 by mx.groups.io with SMTP id smtpd.web12.40478.1589805017095448755
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 05:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=bad algorithm. Only rsa-sha1 or rsa-sha256 are permitted;
 spf=pass (domain: opendreambox.org, ip: 178.19.67.222, mailfrom: obi@opendreambox.org)
Received: from mail.dream-property.net (mail.dream-property.net [82.149.226.172])
	by relay.dream-property.net (Postfix) with ESMTPS id E1B86100BBBF5;
	Mon, 18 May 2020 12:30:13 +0000 (UTC)
Received: from localhost (ip-176-199-141-47.hsi06.unitymediagroup.de [176.199.141.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 1E245314212B;
	Mon, 18 May 2020 14:30:10 +0200 (CEST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=opendreambox.org;
	s=dkim; t=1589805011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c+Nn3Irchw1lpDrgD49RpAjrZpthRv9ypVbLwBrkS4Q=;
	b=qdW+72k/xVnidhZxVqdiVOwTBZTAUlLo2RL3B4VBKOxN7HQSaBmfv3Ue+DIMQnxbEURoFR
	bKCIoF2rKSLavnCg==
Date: Mon, 18 May 2020 14:29:59 +0200
From: "Andreas Oberritter" <obi@opendreambox.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: Martin Jansa <martin.jansa@gmail.com>, Patches and discussions about the
 oe-core layer <openembedded-core@lists.openembedded.org>, Richard Purdie
 <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] glibc: move ld.so.conf back to main package
Message-ID: <20200518142959.57fda0cc@opendreambox.org>
In-Reply-To: <0397befe-9f5d-a704-be07-00926fd3fffa@prevas.dk>
References: <20200518113617.31831-1-rasmus.villemoes@prevas.dk>
	<CA+chaQdZQRYMwbaAdE-TE9SNuJpwO=0Z6Qy7SR6kZxN7kpJ3qA@mail.gmail.com>
	<0397befe-9f5d-a704-be07-00926fd3fffa@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello Rasmus,

On Mon, 18 May 2020 14:12:43 +0200
Rasmus Villemoes <rasmus.villemoes@prevas.dk> wrote:

> I'm certainly open to other ways of solving this. But can we agree that
> it is a bug that the ldconfig done at build-time does not take
> /etc/ld.so.conf.d/* into account, and that that should not depend on
> whether one has ldconfig-the-binary on target?

have you tried installing ldconfig and adding it to ROOTFS_RO_UNNEEDED? It might be an improvement to include it in ROOTFS_RO_UNNEEDED by default.

Please consider use-cases where writable filesystems ship without ldconfig, but a user installs it from a package feed when needed.

Best regards,
Andreas
