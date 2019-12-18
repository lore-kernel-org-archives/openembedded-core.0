Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5518C7FE61
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 10:00:43 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g17so1584620wro.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 02:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=U+p+Gm/M2oRrernMDgu2UHkbDzKbEAIbnv61c49gAEw=;
	b=RATcZExIjbU04oZyrFJal5siAHeb9nA6fYAAYSBHp8+eLqFh5FFtIgHHGVAUhhPXns
	tjWAcZpYl2RiMfU8pNI0FHruKq+TIZRv5w7SlrxpPti0WsJCsoUGr4Xxk9ZzW1EsFuip
	OkkfvvJHr+ZlwmuTXAwM4GolvwmYDnYzI42OY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=U+p+Gm/M2oRrernMDgu2UHkbDzKbEAIbnv61c49gAEw=;
	b=UTq/S5MX11hTcdx38GIIyHrwqwzQTW/LxFh2ea4ZORU45F4qRzv4om647WilVVAb0M
	lO5mGmwkdbpjp1p9yVBQTRgu1IeWbXov4xWKkTR/sfI90bPEfUg/2A+79+kuX7yqgkIo
	mDLwjxwhSV33OXrPhYsL0RVatqA1nFLaSrahawXIVry+MfgBhwaFCbMypKjFNO503VzA
	U6/KIWKhdDI0fwJifOC2HyGVqTly6Mm0YHtdE2tuFsydBqPOqwBKxUeVfQqp78VLnqA3
	eQvewJQtDXKlJnA67e8j1SrolPryazh9HNpHbcGetmiq0yiFJLh1igK4B9pBa5I6/lwR
	oyvQ==
X-Gm-Message-State: APjAAAVs3LQ/Fs0b9xSorGvNwd9GlNhSOKcb94yt+79qjRn+hWBQNx0e
	VhWhX6coHny5SlokNJw1JPY/5kyHEDU=
X-Google-Smtp-Source: APXvYqwsRoBw4bgzG9N9rQ6NqMWLCao89IXX6f009wwNtJ507ztoGvAFbq4dom9PFNVb0WG2pBV0Xw==
X-Received: by 2002:a05:6000:cf:: with SMTP id
	q15mr1754523wrx.393.1576663244090; 
	Wed, 18 Dec 2019 02:00:44 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s19sm1857758wmj.33.2019.12.18.02.00.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 02:00:43 -0800 (PST)
Message-ID: <5b4bdd1facaee89ae67e41961ac3e9abb01004bb.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 10:00:42 +0000
In-Reply-To: <20191217160012.42152-1-alex.kanavin@gmail.com>
References: <20191217160012.42152-1-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] gettext-minimal-native: update to 0.20.1
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
X-List-Received-Date: Wed, 18 Dec 2019 10:00:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-12-17 at 17:00 +0100, Alexander Kanavin wrote:
> Rather than update a tarball, I took m4 files directly from an
> install of 0.20.1.
> 
> The patch is dropped as guile has long been removed from oe-core.

I ran this series through the autobuilder in comparative isolation.

qemuarm failed:

https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/1368

native failure on centos7

https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/704
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/357

nspr-native failure on aarch64

(the oe-selftests from that build were not from your changes).

Cheers,

Richard


