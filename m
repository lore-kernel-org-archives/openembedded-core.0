Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 741117D61D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 08:19:46 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id w10so25731931wrm.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 01:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ZK2oYluuowQrWn5D9W2VhIFL2hgvdzI6dAasntQPZaE=;
	b=f8XouHtsd5vew9GPtfLQaiMigGok92mcCvBRVEy3+0da9tKpHNRt5t8MRlVczAN+lL
	e9DKOLEfbP/YdFYIzvMAnBHx+LBvgFXCeyrntdaVftzF74WSh1PRcF+Gqp+fcpgk6Ba0
	HfBKkAplXNIFGD62QkvjA+BfgndE4GniJk80E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ZK2oYluuowQrWn5D9W2VhIFL2hgvdzI6dAasntQPZaE=;
	b=KksKvWq0xriE2btM9HyXVgLOQC5bvj7aEKlyYYFqcLKWzNYcRH2BVBqCjt0cRX6nNg
	xL5aP9PRSglPjbH3XsorLMsdwqWi9p7wz2wDCBqqB9pnuDGL8Qtvj6gO9tVraqNCw+ZB
	/PIxASDZSeyMJm4J0e2uQv5PG648ousr6YVhtSNVUqvnS+EjNsDbQ080Ak7QckaRgxkd
	XaYWVNk2pQYr51CoU8P6zf5n9cHZL8dZGd2v42nO2LuxSrrvDHPeiS8/sMIDBT19oLAO
	ePapxGxGJYGxlMywiA7oCH5qgbnE11T3R/73+dpPMIXuwLDgr/P0A4uaHx9bIGVhvJDT
	T8OQ==
X-Gm-Message-State: APjAAAU8xTxahlfum3tC8bLpjRuO/dTnEnOij25ixjdSSi3M03Wy8eLw
	5wqQ8Hj/qH1wYerYPL4cg95Fhg==
X-Google-Smtp-Source: APXvYqzUFqQ74u4FmgFO/C2lDhXWfay1lub1xY/N03yjCR7hHnp9K/lVyY+5o3qsn0UMLzMt+ENSxA==
X-Received: by 2002:a5d:4c88:: with SMTP id z8mr49981430wrs.291.1555402787105; 
	Tue, 16 Apr 2019 01:19:47 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o4sm30310928wmo.20.2019.04.16.01.19.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 16 Apr 2019 01:19:46 -0700 (PDT)
Message-ID: <183e48d9ad8ebbda11b67f142db474d9a6c772fe.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2019 09:19:45 +0100
In-Reply-To: <20190415105457.57067-18-alex.kanavin@gmail.com>
References: <20190415105457.57067-1-alex.kanavin@gmail.com>
	<20190415105457.57067-18-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 18/19] python3-pygobject: update to 3.32.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Apr 2019 08:19:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-04-15 at 12:54 +0200, Alexander Kanavin wrote:
> Switch to meson build system.
> 
> Add a patch to disable tests.
> 
> Add "introspection" to unknown configure option whitelist, as
> this recipe needs g-i unconditionally.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../0001-Do-not-build-tests.patch             | 26
> +++++++++++++++++++
>  ..._3.28.3.bb => python3-pygobject_3.32.0.bb} | 10 ++++---
>  2 files changed, 33 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-devtools/python/python3-
> pygobject/0001-Do-not-build-tests.patch
>  rename meta/recipes-devtools/python/{python3-pygobject_3.28.3.bb =>
> python3-pygobject_3.32.0.bb} (68%)

Seems to have an issue with multilib?

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/519

Cheers,

Richard


