Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 59BBE7CF9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 06:50:07 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 10so3099296wmk.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 23:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=/ljQelXHs8lT9f+gaN+c1K8ocArsTzsxQ4Ihj3h5QLE=;
	b=JyiwgCPwlikpVp89+NNK2lx7p5Btm0roD0Y2ZK+/u1byuGqwVTkxFARdpzrXTI2pOE
	unqJc+E2FfLmScpgqpO1AYR7C+C1tX5b15lWm6As1iBi8p5cg3QprGwQcNmomHIOqMbO
	gm9dVBwxNNOB+E+NV3OyEP0/DQbgK70D4tB3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=/ljQelXHs8lT9f+gaN+c1K8ocArsTzsxQ4Ihj3h5QLE=;
	b=BI7wbDYQZww+vInWX/u4Ah8+qlxfXmHv3GJEg7nzDI0LyeXqS0/89j2qW3gajfxHYT
	f4/8XzpsAOrR5NOi16e+Cl2jJG+jvyQdNqL4S9XUYfuAp4S0XtD4dHDFZwqB/mVO3hHK
	Sp3GZnSrKsx4s4oNkx0ikjCR0ES4b2prMfhJSW0RP07tqgWmf1tSo94rCNlm44cIpWqI
	xOvvdQLF+6Kd+sNAqNrmOYZ1dqYppSMQqEgKun4+aIsBmIVM/DNetAxvuFekgS7BAQI+
	AVG1+lF+MjF5Y9IR+M1eyZTBun/L/ynVnXLZ3SzELpIMrROozAuupNrHYtwvVIHqTUL5
	Yenw==
X-Gm-Message-State: APjAAAVV5ZGLwlMUWM/N9qlql/kBQwiWycI7oKDGa1DsJNWvuV2q3S6h
	GJ7CesBa9nptQPZHoQAVTojjUQ==
X-Google-Smtp-Source: APXvYqwml6AMawTbArwBeguGYDDVV2HKd0IsKbzTEEMzhBnY3PZ6b72YrSfzki2c8O2SLFOrDQ+g7g==
X-Received: by 2002:a1c:7518:: with SMTP id o24mr432325wmc.42.1556088608034;
	Tue, 23 Apr 2019 23:50:08 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b8sm13971176wrf.21.2019.04.23.23.50.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Apr 2019 23:50:07 -0700 (PDT)
Message-ID: <b161abdfa2cb9aaf65ecffd7b1dcb0d9d2d2aca2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 07:50:06 +0100
In-Reply-To: <20190423161916.25572-3-alex.kanavin@gmail.com>
References: <20190423161916.25572-1-alex.kanavin@gmail.com>
	<20190423161916.25572-3-alex.kanavin@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 3/9] gtk-doc.bbclass: unify option setting for meson-based recipes
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
X-List-Received-Date: Wed, 24 Apr 2019 06:50:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2019-04-23 at 18:19 +0200, Alexander Kanavin wrote:
> This is done similarly to gobject-introspection work by Andreas
> Müller,
> and allows dropping duplicate clutter from the recipes.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/classes/gtk-doc.bbclass                       | 11 +++++++++++
>  meta/recipes-core/glib-2.0/glib.inc                |  6 +-----
>  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb |  6 ------
>  meta/recipes-gnome/json-glib/json-glib_1.4.4.bb    |  7 -------
>  meta/recipes-graphics/clutter/clutter-gtk-1.0.inc  |  6 +-----
>  meta/recipes-graphics/pango/pango_1.42.4.bb        |  5 +----
>  meta/recipes-support/atk/at-spi2-core_2.30.0.bb    |  6 +-----
>  meta/recipes-support/atk/atk_2.30.0.bb             |  6 ------
>  meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb |  7 +------
>  9 files changed, 16 insertions(+), 44 deletions(-)

Its this patch which is causing gobject-introspection-native to fail to
build:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/530

https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/411

Cheers,

Richard


