Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id B63457FECA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 23:02:25 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t2so5323943wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 15:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=olN1jBfmU4EInT40xMMRtDuQJvl/LChGuQtwgCfUVl4=;
	b=IoUOtTxMJV7whDkJAtVPJvUBbjNBV0pIXnmaZsArL/WAhFN2zqDqprmfxVD1Tx3vk4
	LzMNd/zxpT/Xu1Oo75IJ3CafOR+uHJzaJ9o8/J4qmrNmH7ev73oOnKm5mKJZ3vuYfwsz
	kj6JNWENUAEUzL+0pRvODHvomP6MeqhBjk3yU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=olN1jBfmU4EInT40xMMRtDuQJvl/LChGuQtwgCfUVl4=;
	b=lvYC6UAYZkEbUz9H2zOaLLMH1iYqLxXQCuBVdW9bhLT+t6/OR/KpEsb5f/QVgk8qSk
	Cq8LDalkiXvQK7BVjr6d5H0/mP1O8vqpa05nWvysUzWVt7HapAx9BTVoslcnNTHdjkmh
	W5GffcRF0vZ0VjQDvGLK+TVcr3KfEHi1mSUjLa5474ghJK4x03Cnlhr473IiLB1+l2HC
	bDmRjLXyjTrzuThia0M3GYlsInwokSfiluZ5NWNBTUQgjgN6I45oExsMg2PRZ+vvUxKN
	KziodJLtBF4dW4aSXKwXJdTXlOcFBV/QBW+rVSHRdmTJtmOVrqA3be2KXRMBERcpioyh
	VyUw==
X-Gm-Message-State: APjAAAXiYq2Z8iKobyc9hEA1Ss99ON3Iu368lKc6cGegXI4YjIWGpRl6
	311qqAjfWMeMxrQ6+4oyueZ8Yw==
X-Google-Smtp-Source: APXvYqwJn2ROhhl+KnuO/DpNXYDImVZoGtrpdF6TkvwzhVLB8ulG7xHcFfLE6BE2bOTmJtOCIIbDWA==
X-Received: by 2002:adf:e74a:: with SMTP id c10mr6990600wrn.386.1578524546413; 
	Wed, 08 Jan 2020 15:02:26 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s10sm5856275wrw.12.2020.01.08.15.02.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 15:02:25 -0800 (PST)
Message-ID: <492572ea126b424def780911c58230941842dd91.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 08 Jan 2020 23:02:24 +0000
In-Reply-To: <20200108132759.95603-5-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-5-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 05/28] python3: update to 3.8.1
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
X-List-Received-Date: Wed, 08 Jan 2020 23:02:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-01-08 at 14:27 +0100, Alexander Kanavin wrote:
> Drop backports, rebase other patches.
> 
> One patch I wasn't able to rebase as upstream code changed too much:
> 0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
> Please determine if it is still needed, produce a new version,
> and work with upstream to get it merged.
> 
> 0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch
> is removed as the use case (allowing python 2 and 3 to coexist
> in SDKs) is no longer relevant with Python 2.x reaching end of line
> and upstream has refactored the code making a rebase difficult.
> If needed, please re-add the patch to py2, rather than py3.
> 
> Python 3.8 no longer adds "m" to "3.8" in paths, so adjust the
> recipes
> and classes accordingly.
> 
> The manifest for the 3.8.0 version is updated; particularly pkgutil
> module is now packaged in -core (as other things in core need it);
> this also necessitates allowing empty -pkgutil package to avoid
> breakage across layers.


https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/1442

Cheers,

Richard


