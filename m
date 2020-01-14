Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9E1067FA44
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 21:23:48 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 20so15426811wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 13:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=LlmSTz0G/3q2VQPdhZV6m/pXJG3lwD/f1WA1jKKQrsE=;
	b=dikV9WyBhaMhBKhWD1FCzGJfm25DDPLNkCP+BA+plu+b4LZTr0dLkqG25IKIRuLzZt
	nQimiZrJ8v5EhW+lQdPW1puboJ8z0YbNKBrBY4S+tMRveZPKdejAwRZPdqMoKbPizCT4
	mXjoeDPKLNx6Ej9iCZqHR6Z0Ra8joWKZUNkzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=LlmSTz0G/3q2VQPdhZV6m/pXJG3lwD/f1WA1jKKQrsE=;
	b=COitpFneEPhQXnUlqBNczKJfhWjaAgyc9FPVOuTvUlRM86VJ70GeoX2tCD58NLmMpE
	Qv9vPn7TQRt/ghKDrzbUFWs6CKF5FmREg/Ib2/hsw3fKoBgBPYXTnXohqYyJsK5uqqjx
	5kyj6aAWgeLDB8AEEm3ePthYlcocxDcDya7xXZFJSOZWjBqVS/9o7zS2MEyihR0iYebk
	BLaMg/Z7emTs0ZxfAmzlGYg0WTT+y7iotNn348vCuAyOdqIq5Kqbk6c9icJiAm72w3UG
	iVFcf9L52z5aIp5Fn+9XO9u/HHb9DPtxZZQAUA5shov+0NJSOljUjxHbfvH938iOm2ln
	PL6A==
X-Gm-Message-State: APjAAAUONtWlqpEmv3g0I35OQANjV7+du3vuAFJeJE01GmJ/IIfpttwN
	65kEY9VE0RpyAHfswWk9LiOw+w==
X-Google-Smtp-Source: APXvYqw3EU+Y9NwBZCE4Pmo7FcSogODZv8mN3jQ8mbjwLeJbRYWEH0kx+KP42zv0oFlPKuu6yQ0/ew==
X-Received: by 2002:a7b:c775:: with SMTP id x21mr29759576wmk.59.1579037029502; 
	Tue, 14 Jan 2020 13:23:49 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e12sm21386359wrn.56.2020.01.14.13.23.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 13:23:48 -0800 (PST)
Message-ID: <9db294408a88a7f6aaeb0345731195dc920b0ce0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 21:23:47 +0000
In-Reply-To: <20200114140007.36622-11-alex.kanavin@gmail.com>
References: <20200114140007.36622-1-alex.kanavin@gmail.com>
	<20200114140007.36622-11-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 11/20] libcap: update to 2.31
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
X-List-Received-Date: Tue, 14 Jan 2020 21:23:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-01-14 at 14:59 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...-tests-do-not-run-target-executables.patch | 33
> +++++++++++++++++++
>  .../libcap/{libcap_2.27.bb => libcap_2.31.bb} |  5 +--
>  2 files changed, 36 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-support/libcap/files/0002-tests-do-
> not-run-target-executables.patch
>  rename meta/recipes-support/libcap/{libcap_2.27.bb =>
> libcap_2.31.bb} (90%)

Still issues on centos7?

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/611

Cheers,

Richard


