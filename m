Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 34A4C7FE4A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 21:22:11 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id m24so495052wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 13:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=kt+kGhPY7eZbs2jmyO6EPPraGHsedOaLNtWgiwxoPYI=;
	b=fXzKU7r6xl8OUUBnTiQzuzn/4e06BpoX3V5X7pYHU1TJuEPWKzERH+/J0nYXEVhRzn
	vfvmik0+DjMdu8/nnbfZHubRy+MeXc6BePYcPtVujox2cuoKmlXFgYhxGvGHOha46/75
	qd6JAWHr6EUjEXaN6yRqT84oYR6vd5Zk3lA8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=kt+kGhPY7eZbs2jmyO6EPPraGHsedOaLNtWgiwxoPYI=;
	b=nEtAExra4LItebZ9Ec+x0GnX+A8MmBWayJtHPHFe1BORbO4unZ0hLYpS54QUCdivRl
	6JgOSNpdJchd5PsMT5SnueEc2Wt6O4SvSd6v05KUMcZN4CslXjdP4YyXBTW5+05DDuyL
	7KT6N0mb23mqQ5mOlkodh16yNVg2TXIfsmQyJvA+rxOfRt9yKx57vpJsAT/O3ydCFe4U
	ftSdELm40dDmEr4nGYOtge9Pd3sF7uWwZlwlACe10LA4oe2OR1+scFMmbbHLKhR/P0I+
	7e5ES8QKZNG7biAeamVYx+P1q4PJASW9jbxAVP77BJQx+OyqwK3E5NxJ91fW0FcEU4Dp
	nrmQ==
X-Gm-Message-State: APjAAAXDzjoEKZ85UgkIGrQGn6pdujsH1b6nMiUwAO9nnY0HgwOlui0A
	QH+OrN+4+Bg+JsncFbAp6QZNYQ==
X-Google-Smtp-Source: APXvYqwMx2I8ZOCNW8kjONVTvgZ0I8bYbIfAltuwBgRkSBrB1DYtWumfPDj4M04YoRxIErnkwnLtVg==
X-Received: by 2002:a1c:b4c3:: with SMTP id d186mr679644wmf.140.1578518531863; 
	Wed, 08 Jan 2020 13:22:11 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id r5sm5532866wrt.43.2020.01.08.13.22.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 13:22:11 -0800 (PST)
Message-ID: <2fc677f1e980e80cd75d8b2e3c926556be06a8ef.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 08 Jan 2020 21:22:10 +0000
In-Reply-To: <20200108132759.95603-14-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-14-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 14/28] libcap: update to 2.30
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
X-List-Received-Date: Wed, 08 Jan 2020 21:22:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-01-08 at 14:27 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...-tests-do-not-run-target-executables.patch | 33
> +++++++++++++++++++
>  .../libcap/{libcap_2.27.bb => libcap_2.30.bb} |  5 +--
>  2 files changed, 36 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-support/libcap/files/0002-tests-do-
> not-run-target-executables.patch
>  rename meta/recipes-support/libcap/{libcap_2.27.bb =>
> libcap_2.30.bb} (90%)

I think this causes iputils to fail to build:

https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/331

Cheers,

Richard


