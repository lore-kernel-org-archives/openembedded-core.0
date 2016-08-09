Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8B16475E80
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 08:29:24 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i5so1648656wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2016 01:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Rjj1sCZSZbUXmoQoZjKRkinUNc0QQfTuixTGFm7Ax8o=;
	b=g0yr/harGVATG4x+NCbMmPLWC+2I9OMyZYEt72Wu7APzlvOuEKQjCN9YNRql3jIDMq
	Y+QJ7BIGRH9Tk44UknYUSRXNnVSW0LQB9cp1XlHSPp6UrZcgH6S1hiy1Z7ZaxL9Szmbv
	Wk0ilzauSIptZ0GhVBTyDsuhisfrpO1uMpk6Can6pFBfZl/SPI3Sh4Ig0APWpQjs+U4T
	V0++FfQEhOi+4bByNi7CE+zyI9CAEPDAcA7fG9isQi2qzXnwZYXf8FL5DmoKPD9NWUuB
	jmAZa98gMl7wyaiWrU45P/KngZTsjTdaeH2gHwg2eLo0OoT7hRVZKnD+ux3wVALHUyPN
	uoGQ==
X-Gm-Message-State: AEkoout05ib25OSeqgBjB8wgp6xNivuJPyh0rQoauYhFDVbS2EKCnToE5YyGWY/d5m1ZMg==
X-Received: by 10.194.63.39 with SMTP id d7mr86890986wjs.13.1470731364308;
	Tue, 09 Aug 2016 01:29:24 -0700 (PDT)
Received: from localhost ([185.46.212.59])
	by smtp.gmail.com with ESMTPSA id g67sm2109926wme.5.2016.08.09.01.29.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 09 Aug 2016 01:29:23 -0700 (PDT)
Message-ID: <1470731376.4581.25.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 09 Aug 2016 09:29:36 +0100
In-Reply-To: <20160808225101.32385-1-raj.khem@gmail.com>
References: <20160808225101.32385-1-raj.khem@gmail.com>
X-Mailer: Evolution 3.20.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] webkitgtk: Disable gold for mips/mips64
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
X-List-Received-Date: Tue, 09 Aug 2016 08:29:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-08-08 at 15:51 -0700, Khem Raj wrote:
> with binutils 2.27, mips has got the gold support
> but it doesnt work for webkitgtk _yet_ therefore
> disable it for now.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.12.3.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb b/meta/recipes-
> sato/webkit/webkitgtk_2.12.3.bb
> index f2ba8b6..d9f1c30 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
> @@ -75,6 +75,8 @@ EXTRA_OECMAKE_append_armv4 = " -DENABLE_JIT=OFF "
>  # binutils 2.25.1 has a bug on aarch64:
>  # https://sourceware.org/bugzilla/show_bug.cgi?id=18430
>  EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
> +EXTRA_OECMAKE_append_mips = " -DUSE_LD_GOLD=OFF "
> +EXTRA_OECMAKE_append_mips64 = " -DUSE_LD_GOLD=OFF "

What about mipsel and mips64el? Should need the same I would think...


