Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 380E577F9C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 23:50:45 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id g15so23515164wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 16:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/0TheAmkxnycptfjBY2/c0srI6nOv9/K5nQNSdzBbhY=;
	b=HyX76VwYsRugPGnqP7OYLzOqexQISdYIu7+4BjFEsbMdSjhqOnAX5ZOC/nvFEbgudm
	pmjs7Hkd5pF4x/MjR6f10QWU8CQdKVJxHpmr0KtncARAV2lDPqysMEbYjp5xc5V4Lc4R
	e9zLEcspSgK+23xV+hGUF7R0BzoMFsGvFRvmf92tBOwL5OfUnydz1W2HbTTtx6hHIMOC
	eG3ei5EfrHGbjRhwKP8tpjbLPjY/BZt9QfNh8FegQjigjAFkz8IqGSwmgOstc9Ohp57y
	Y2C672M4VLa5Mu5yNBPDaGc0wagC+oi0GsMbYAmA6R65gz80QhxIjf2QIL2wgsrcyZo5
	O2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/0TheAmkxnycptfjBY2/c0srI6nOv9/K5nQNSdzBbhY=;
	b=TzTGxAGwJjAcjIhi4jOCBX9dQkZxZHHrjphgLkuEU9v0YCdsUkt8ImEQRVcL9UKU1T
	gk8efaNsyKb+qL/I85jBJEn4sSHAaRP3O6l6l2FnjR2XvlSQeA/NkHtZdjzL41rROimw
	i9r0O3lLQ1loTv/2UEgsNamNx8tGvXSnT0PRfEdYmNWKpEdR8JicdA25vitzirzBsmVZ
	Qt4RrPmO6dd2+UMpF9VI4uBkHczUU8olRXikKFkj8xT0ekbpNsxWDjnceu5zEFCsaTgo
	wn91eVf5h7UknIDPPPQ4IAjXbg6u73anLcwgs4ehQognOJpG0c1FkHrd84dysU6eFAfh
	8bOA==
X-Gm-Message-State: AODbwcAP9C1Ab9nejdsnA4Qp6X4g6IFDTWFNxEyYjnToI5eAFZg/rsen
	GozKwO1VZ0SzlhRhwlGmGInF2kxb5g==
X-Received: by 10.80.154.165 with SMTP id p34mr22304045edb.127.1495583446892; 
	Tue, 23 May 2017 16:50:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Tue, 23 May 2017 16:50:16 -0700 (PDT)
In-Reply-To: <20170522050042.42403-8-raj.khem@gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
	<20170522050042.42403-8-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 May 2017 16:50:16 -0700
Message-ID: <CAMKF1srcyg9oX6KYPKJa03WbgeN0hvpfH4XBYzLJN+++-c_GaA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/15] xkeyboard-config: Enable nls support explicitly
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
X-List-Received-Date: Tue, 23 May 2017 23:50:46 -0000
Content-Type: text/plain; charset="UTF-8"

Drop this one, I have sent a v2

On Sun, May 21, 2017 at 10:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Helps compile when distros disable NLS
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-graphics/xorg-lib/xkeyboard-config_2.20.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.20.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.20.bb
> index d00904df21..d308e9b07b 100644
> --- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.20.bb
> +++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.20.bb
> @@ -19,6 +19,8 @@ SRC_URI[sha256sum] = "d1bfc72553c4e3ef1cd6f13eec0488cf940498b612ab8a0b362e7090c9
>  SECTION = "x11/libs"
>  DEPENDS = "intltool-native virtual/gettext util-macros libxslt-native"
>
> +USE_NLS = "yes"
> +
>  EXTRA_OECONF = "--with-xkb-rules-symlink=xorg --disable-runtime-deps"
>
>  FILES_${PN} += "${datadir}/X11/xkb"
> --
> 2.13.0
>

