Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 354FC7C326
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 08:51:27 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g17so103844738wrr.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 01:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=R6UBbgs6ypDTgdFMLQoJhNVmZDHmuycWpinbM7aRZD4=;
	b=XXRLat8BXyeQkLPFksrlb54mNnlurn5oSPDgw0Xi+iM+VvRg5vpPTYquXJx+31VHPB
	IhoIlqTu181+w1hoEwkMh/hNHNkw2SeUEPvjWssOY4erdzzfEc+HKwqFTzqJokOq4iKH
	+SldX3P2BHBObVZ1K6j4k9uI6O2wFMKEh8uIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=R6UBbgs6ypDTgdFMLQoJhNVmZDHmuycWpinbM7aRZD4=;
	b=GS2pf/4fzqlMLJFBO0kTOZNwUQgDCybSV0gdog4N72zebiaX8LFHTrDacblfwJnWFL
	NDjNrYvwBBUO2jlMkxGebRtTV0Poa3IeKys1Pc8SAx8mGLSslVAE0rOD0a3rQs8uAoBR
	5I5rZI2Hy1IwuTJxpuyoXWh2ty9o825/pXtT3WC95sdiDTormRb1N6L+51egWMgEbIUv
	+bEyEHfzA1vCahYcGDfGGEVIY0w+A5vO6OJjje46vvwUMkB4vHAlxdNomnqygLSB8kjW
	zLsdrUPgTdfg/S6o8U/gpRmWfNNFGaZsFElsWPENfSZq8KZDbTaecTcmaWhQ1QJk7VIw
	vm7Q==
X-Gm-Message-State: APjAAAVQO/0zMFiZmrvMf7QlNx8D4xkeFRSikQeG0cmRKoz6Zk2X/mAl
	fsMGcJ6UVJ00VJS+/9Aj4JnSzw==
X-Google-Smtp-Source: APXvYqybdEg9+epI1dPhqpVtxVIngl6aVMGxczSd9rszS1szfcGh4TJUjsiu4HplbHM3Ye1vzHmLeg==
X-Received: by 2002:a5d:63c8:: with SMTP id c8mr41790799wrw.21.1565599887832; 
	Mon, 12 Aug 2019 01:51:27 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a142sm11064818wme.2.2019.08.12.01.51.26
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 12 Aug 2019 01:51:26 -0700 (PDT)
Message-ID: <f9a2c6d0399f2998821c91386434d88b776283cb.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 12 Aug 2019 09:51:25 +0100
In-Reply-To: <CAMRc=MfE4sO7BAsmFdnQnogdXJ-TpJTkDODgLaxxKoirVVVngA@mail.gmail.com>
References: <20190730072254.10730-1-brgl@bgdev.pl>
	<CAMRc=MfE4sO7BAsmFdnQnogdXJ-TpJTkDODgLaxxKoirVVVngA@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] qemu: fix patch authorship
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
X-List-Received-Date: Mon, 12 Aug 2019 08:51:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2019-08-12 at 09:01 +0200, Bartosz Golaszewski wrote:
> wt., 30 lip 2019 o 09:22 Bartosz Golaszewski <brgl@bgdev.pl>
> napisał(a):
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > 
> > I accidentally changed the patch author when backporting this from
> > upstream qemu. This commit restores the original author.
> > 
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  ...4-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch |
> > 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-
> > to-handle-variably-sized-SIOCGSTAMP-w.patch b/meta/recipes-
> > devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-
> > SIOCGSTAMP-w.patch
> > index 2feb567f1c..f7939b84bf 100644
> > --- a/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-
> > handle-variably-sized-SIOCGSTAMP-w.patch
> > +++ b/meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-
> > handle-variably-sized-SIOCGSTAMP-w.patch
> > @@ -1,5 +1,5 @@
> >  From 8104018ba4c66e568d2583a3a0ee940851ee7471 Mon Sep 17 00:00:00
> > 2001
> > -From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > +From: Daniel P. Berrangé <berrange@redhat.com>
> >  Date: Tue, 23 Jul 2019 17:50:00 +0200
> >  Subject: [PATCH] linux-user: fix to handle variably sized
> > SIOCGSTAMP with new
> >   kernels
> > --
> > 2.21.0
> > 
> 
> Gentle ping.

The original patch hadn't merged when this was posted and you were the
author of the original submission to us so it was squashed. You can see
the correct author in:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=57d702ed5de571751517568872eda2b5ba9fa8df

Cheers,

Richard



