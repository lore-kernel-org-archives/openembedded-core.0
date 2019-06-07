Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id CA0457E4F1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 14:03:19 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t5so2048551wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 07:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=1YOR8AWcWvBvav8euTD/zfOWY4SWy8U0anzAlv8kfy8=;
	b=UPYafO7KIvpV50qf/vT8hJ6mCGkNRbc4LMjb3S4pQPrkrF6wn4LDYK+mag/Y7x03gc
	KbyVYRSHJz7kNlArUykO+jeNUVOVbGsGfvFCCAHqqZ2ziIn8+iPYgvxawKz6i97FmjEH
	yadpVFFpPAQSr2MUrmOb6oM8WDawX3QfBnGWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=1YOR8AWcWvBvav8euTD/zfOWY4SWy8U0anzAlv8kfy8=;
	b=db8y8A7TjWFhA5MUw5qnRuAouF0YQHJKxjuRvWCNzhWiMQI4RVZn+VHOBwcOOaTqYy
	RYgEU2wytuNur5TfxIq+NqRbRkXdvv98Wk22q8+bPzJpRSz7wotwILNf4zlFvuPr4vU/
	Ju0d+InyDYkThy0CeWjVSf/UZHEo/7hjvuF3m9nBsBpYXBW17PJ1H0+9xUM2BH0UjVh5
	2QeNYR040dZkuc6yAznIwQ8xli76BEViYj/iUAxFkmJAiLjWqHaI6EYY/BEiT848sZMq
	d5swJrU9J/oPxDwWXKPkcSnTUnm7v/Wixn7u8wQLNb7z/TIPO8HkR/hWd3Xw2DZZxAxo
	v4eg==
X-Gm-Message-State: APjAAAUceY8RBWWoyfVfMY5QB0fnzSJ6P0rHPhSz0n8fLOQIr73aYMQw
	3GpiNGLGsr/x1pr7WTGfaEbyWw==
X-Google-Smtp-Source: APXvYqwHJ+aAif5vQNh0rn+cV6zyhpCIlLckkpdHnwHoDqtHqXMdDMGaFmb6dKIZutB8820MJ5ddtQ==
X-Received: by 2002:a7b:cd84:: with SMTP id y4mr3972224wmj.41.1559916200435;
	Fri, 07 Jun 2019 07:03:20 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id y9sm4589672wma.1.2019.06.07.07.03.18
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 07 Jun 2019 07:03:19 -0700 (PDT)
Message-ID: <7249681b3f030618eb01d15a597a01c1f3a10cfe.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 07 Jun 2019 15:03:17 +0100
In-Reply-To: <20190607121954.116898-1-alex.kanavin@gmail.com>
References: <20190607121954.116898-1-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] glib-2.0: udpate 2.58.3 -> 2.60.3
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
X-List-Received-Date: Fri, 07 Jun 2019 14:03:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-06-07 at 14:19 +0200, Alexander Kanavin wrote:
> Drop autotools-specific parts from patches, as all autotools files
> have been removed upstream (meson is now the only option).
> 
> Remove autotools-specific 0001-Revert-Use-absolute-paths-in-pkg-
> config-files.patch
> 
> Remove backported fix-nl-abaltmon.patch
> 
> Add a hunk to Enable-more-tests-while-cross-compiling.patch which
> comments out
> the part of the tests that hard-codes native ld for building.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>

So far we've seen:

https://autobuilder.yoctoproject.org/typhoon/#/builders/46/builds/682
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/680

Cheers,

Richard




