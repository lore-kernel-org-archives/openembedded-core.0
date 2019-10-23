Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 641DA7DF61
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 07:46:29 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z9so20852657wrl.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 00:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=mBumTb/2yAJn/xO7yKmQNKfYrgrrMVE3291/lJyr74Y=;
	b=FrPZHy8zieSpV+9vARaDCQAuMMjFU9jbcwH0plv/0P+nRf0ZDokTxF/jhFAacXO1EQ
	hlQQUnzmxJ0HirZswuoKklxJSSkAiP1F8KltlhIZLowyWtDaO1sq3aOn5KphbAXiP3Ob
	CAnMbJV9H6iwadE45h1TDX37VWzQBfMSZRObc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=mBumTb/2yAJn/xO7yKmQNKfYrgrrMVE3291/lJyr74Y=;
	b=DWykImk4tA2E8MOGSdvUM1+KV/cWk4wQW66fCEOeQT8JwXVBXx7AC88c1E4Okk/Huv
	3pseWGkpzpNqexqEKhtFmxC5WTYUH4ZmORZcsu3GgouS76Bzl36g0oGcxslkGZhs0ceS
	WMVH4cn6awOgmCJDxfGC9WKAnXixc1JQgZikBNflVbmxu2wbGeuPC1HvEnq4fuXRAGHJ
	Z7hiD4DKVeeimoFQjoeo2mnoG0yRXHQ3zf9p8SHo5ALj5vDFs6sqnzR21U4g0saIZ15I
	q73Hwl+ZEMCyjkqxB4HyUkoiPWir47RLwoXuluB+8ZkZWviTDGbRdkj3GxpFhzbvH57m
	50RA==
X-Gm-Message-State: APjAAAWG4+4Kl5kW++0TYVJYRqcrZt8Xt5ba+qCpTBR968a+TBmDSzhB
	chfNy1leHVP3hRegUE+aAG97AA==
X-Google-Smtp-Source: APXvYqxzy7UAUgnxWU6YuK3n0Vd4pvsLJxlL33h6eVjELq3ntA+sY0V7GDiayKrDcczCXIGZ+hBDFQ==
X-Received: by 2002:adf:aacc:: with SMTP id i12mr6447909wrc.15.1571816790008; 
	Wed, 23 Oct 2019 00:46:30 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w15sm13106866wro.65.2019.10.23.00.46.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 23 Oct 2019 00:46:28 -0700 (PDT)
Message-ID: <926a535b1b0b32de2bae2ebb393401c79525b97a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alistair Francis <alistair23@gmail.com>, Alistair Francis
	<alistair@alistair23.me>
Date: Wed, 23 Oct 2019 08:46:27 +0100
In-Reply-To: <CAKmqyKMtXBO6Z2NUC5ewYwYOHneorfrbiMJOf6PZfsg7hybR1Q@mail.gmail.com>
References: <20191012165433.24511-1-alistair@alistair23.me>
	<CAKmqyKMtXBO6Z2NUC5ewYwYOHneorfrbiMJOf6PZfsg7hybR1Q@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade to 19.2.1
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
X-List-Received-Date: Wed, 23 Oct 2019 07:46:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-10-22 at 15:07 -0700, Alistair Francis wrote:
> On Sat, Oct 12, 2019 at 9:54 AM Alistair Francis <
> alistair@alistair23.me> wrote:
> > Upgrade mesa and mesa-gl to 19.2.1.
> > 
> > The license hash change was a trivial new line removal.
> > 
> > The glx-tls option was removed as it isn't included in the
> > meson.build
> > file.
> > 
> > The -Dasm=false was removed as it also is no longer included.
> > 
> > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> 
> Ping!

It caused multiple failures on the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1160
(musl-qemux86)
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1162
(musl-qemux86-64)
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/1141
(libsdl2 compile fail)
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/40
(libsdl2 compile fail)

Cheers,

Richard


