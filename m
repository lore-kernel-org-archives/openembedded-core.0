Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id D3E4678439
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 18:20:11 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id p31so10901965ota.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 10:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=h0s6aKb1qt44Ah9F6ah6QZNzH9qHUHbSQ/oCkCy0vlM=;
	b=QwpKJ/bYpR1O79qv4UZ5ymoLRhTvl3xM3ACstbv2EDPIwNmUXv50ijaQ5yKZGAU6LL
	qIQhb2LDn7TN32tEPSot4R+EkM5Mi/3yJGeFyeTSjC8ZL3pTa7AKDxP4fT5xhaSD97cd
	S5fDs9di4eQZC+yVvpcf+piJNblb9pt8chPufZ5++DCMuoR6rdC28DR7bMFV8t5b+lOP
	+Mw9dM8U6wQu8IkN9uO5/RFFpe7p1/utYtKC9oLDddMslWYtfudvc78mGRLsM80XoeYi
	Md/RJ3byCwwZgJahrT1Ej3icQCR4ddEPK4sD2uxhQCr1VU2bQ7guzj1kpv39dPPEqjWk
	SfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=h0s6aKb1qt44Ah9F6ah6QZNzH9qHUHbSQ/oCkCy0vlM=;
	b=UceEIm9GJliuvyLPfU45H5AEnq7rt4ButFw0O3Ihixu7pdlu8THVJ8lX+iOJoN7M5e
	uq92A8hWmDjB4XZVElXFuCWM9XIc0yZBAPiGAnoZqicxXMY+rDiJtmc02ZQHUqhQ+uam
	/SzEi1MVt24MmH9nCHIYsD9nxkhpVn8uicUmqNVDyzYCzzyh3qLIXz5NLQEVv/7HIbRM
	RNTfekKnYGRIxJQRHLiNHChGYzRrgEggxuz3UK/CEqUpRMmHEYSxfowJ0WDim7nPP2M8
	IkT0aNCUnLF8GB5ID6qydKriUPg39p3hiwBPBHJGIeIz91rpRWvxhdCgJr0SXMYmdKCG
	NA1g==
X-Gm-Message-State: AKGB3mIo3o8VX9pC3Q5cPfpc6QfUUhvVO9ACQ+/SYHQu+9miXZMwWfxV
	uH3cXfP3ypQvggP0LqPiNQRouj0M
X-Google-Smtp-Source: ACJfBosVyeaJ8bz8B7ogqP6uPViHyPUsesfW79BImb6M+EiJ3fievFx+KfpdRUbSQZjfFr4kftA1UQ==
X-Received: by 10.157.40.168 with SMTP id s37mr2935382ota.159.1513707612458;
	Tue, 19 Dec 2017 10:20:12 -0800 (PST)
Received: from mail-ot0-f178.google.com (mail-ot0-f178.google.com.
	[74.125.82.178])
	by smtp.gmail.com with ESMTPSA id q8sm398376otc.33.2017.12.19.10.20.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Dec 2017 10:20:11 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f178.google.com with SMTP id d44so8005242otd.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 10:20:10 -0800 (PST)
X-Received: by 10.157.14.215 with SMTP id 81mr2813182otj.284.1513707610410;
	Tue, 19 Dec 2017 10:20:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.41.233 with HTTP; Tue, 19 Dec 2017 10:20:09 -0800 (PST)
In-Reply-To: <20171219181423.32539-1-otavio@ossystems.com.br>
References: <20171219181423.32539-1-otavio@ossystems.com.br>
Date: Tue, 19 Dec 2017 16:20:09 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqWMkofCJ3UrnBCRjYbVLBreVw1cm=o_NbGi1oAD3Rfdw@mail.gmail.com>
Message-ID: <CAP9ODKqWMkofCJ3UrnBCRjYbVLBreVw1cm=o_NbGi1oAD3Rfdw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] image_types_wic.bbclass: Ensure '-c image_wic' works
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
X-List-Received-Date: Tue, 19 Dec 2017 18:20:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 19, 2017 at 4:14 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> The 'wic' image may use files which has been deployed (e.g in
> do_deploy) for some partitions that may need to be copied in a
> specific partition or filesystem (e.g a bootloader).
>
> When using 'bitbake <image> -c image_wic', from a clean build, the
> contents of do_deploy must also be available so we need to ensure all
> do_deploy of the image dependencies has been complete.
>
> Reported-by: Fabio Berton <fabio.berton@ossystems.com.br>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

This patch needs to be applied on:

 - master
 - rocko
 - pyro
 - morty
 - krogoth

It is an annoying bug that has a simple fix.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

