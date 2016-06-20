Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id EDA67731DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 16:08:48 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id d185so201731606vkg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 09:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=IxUUJyyRNqreRDweKcSvS/oK/0ki7eM3X7vwNNEkVAg=;
	b=ysYy/uv2t1XoWVePvQBrhLLikfOdcwrf0FC08w4x6QYsnqMGCBgfhrgolpXDW6Nd4p
	/+oUnuYThDTCMXPN96i6gZ7HJRh2Gi8IjLfwp6MLtaHx5mMbdghBTL1we841KE4OcKtQ
	f22WD7R/fVhcT4KjFyvJJ07x5BglcU9lxfBonCVw35rv860eNIJOa3AkApGj9icAVBWn
	hOHPyTX8EOv52iI1WkmNXK20AV6wiziWfeyzplRi4NxQaGlNBapHFAw8ZWCcYGPSv/Q/
	430Qu4asETyrKbdHYEpuKuPUJ1LeIDUt1Q5uzruwBesQnPpTFJwxKv6X0Q75Uwf3JDsJ
	ZaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=IxUUJyyRNqreRDweKcSvS/oK/0ki7eM3X7vwNNEkVAg=;
	b=cKaWHfPMTN0AsMXpu4Y8O1dCB/CBBuaddDz4xXl9AfuwGQIED0byhN/biZv0XHZrzN
	R4efvv8GduzeyB6JP9S/uB4O1nEoMpmvdfPU5070iIZuVRnHFyv8JzWz4Rl5AC4RH5tP
	PuoysFh94Ee3IPz7IOpa6BwuMDAOqsWDC5UFMhucA+K+/GR8dYJ5iS0DVqr/UwUPX3uk
	rVoLfPNU9kzRV7avem5siLKIq5wrOHbFI/NYJIqYTFd6tb2eQeQTXW2xuySnVx4bG1ai
	Mi3sheURhpQM7VstChMYPwOjaXoYHqBRONXqHWXWDe8TgqM+XfFzxO9BufIYdlGwZxt/
	1ulQ==
X-Gm-Message-State: ALyK8tJsadFk3zFD7+DxUVpprSGTtGM9AutGAcFbSxCVTGwHoMTVcJnQFw+Ftl043c4YeQ==
X-Received: by 10.31.52.204 with SMTP id b195mr5983824vka.112.1466438928628;
	Mon, 20 Jun 2016 09:08:48 -0700 (PDT)
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com.
	[209.85.213.53])
	by smtp.gmail.com with ESMTPSA id u34sm7418879uau.4.2016.06.20.09.08.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jun 2016 09:08:47 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f53.google.com with SMTP id t129so201702132vka.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 09:08:47 -0700 (PDT)
X-Received: by 10.31.56.216 with SMTP id f207mr7145788vka.135.1466438927128;
	Mon, 20 Jun 2016 09:08:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Mon, 20 Jun 2016 09:08:46 -0700 (PDT)
In-Reply-To: <CAMKF1sqBWnbCtLNbVDD7cBvMyGbXfC-uyG=ewur33gzJ3VEP5g@mail.gmail.com>
References: <CAP9ODKorODqhm-Pqe4L_m4RpTvPmW++yNngL_pAUxvFHHa7XTg@mail.gmail.com>
	<CAMKF1sqBWnbCtLNbVDD7cBvMyGbXfC-uyG=ewur33gzJ3VEP5g@mail.gmail.com>
Date: Mon, 20 Jun 2016 13:08:46 -0300
X-Gmail-Original-Message-ID: <CAP9ODKquFwEALn2SAMa-wM6M-9gFQ_KZFMoks_26UYgk-Smr6A@mail.gmail.com>
Message-ID: <CAP9ODKquFwEALn2SAMa-wM6M-9gFQ_KZFMoks_26UYgk-Smr6A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [for-krogoth] Backport for libc != glibc
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
X-List-Received-Date: Mon, 20 Jun 2016 16:08:49 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 20, 2016 at 1:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
...
>> Could those be reviewed and queued for the next backport?
>
> They look fine for backport to krogoth. Please submit pull requests

Armin can easily pick them; I gave the OE-Core hashes.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

