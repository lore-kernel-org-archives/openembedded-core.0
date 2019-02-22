Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
	[209.85.210.45])
	by mail.openembedded.org (Postfix) with ESMTP id C8E8C7CC02
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 09:41:20 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id n71so1327579ota.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 01:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KxvZWzHtpAQCjBLykqBqnc5UnLeaK5W7Q5rogjJZGzA=;
	b=nmnFIiIHW35/B081JJBhmv8pcZKHiOMnbdkcuWCyi3aot6EYWgpPadhlXy1Kucxu0o
	kgxDj9xGO96E6VjFJy8QRr6XmqJPUHR6afI1GQQ49If84XeANs4zTj18SOZw7N7su+Nn
	RM5eXonVdShNfN4VERKs/sFsZp+xta+spRqqOA+BeWbmhUTnEId1mG5W9ihMQvUU71+/
	BycDylgsBfYAzMRH9digsyNF9YDpQIh9uzWeUAV22wYVnip3kZaHmbOYXowh4iY/pLMW
	yIW49WfRCgm6izkSS3B6VF2BMLxp0ISclXz03Csic7uMAcwSo0ywkJNituZwCfciU/MT
	fUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KxvZWzHtpAQCjBLykqBqnc5UnLeaK5W7Q5rogjJZGzA=;
	b=Oqzp9jK245LV8VqtzWJRHxpoPpQYrNP+6cMb1dwg2O0SEe28tCU4P5nwxcEtKG7EOP
	CUjABpH9oLNoQiPX1jP4OPQfhiI5UFFDrDygdXVWUWzKctpd+QQw4cyN6rz8v4wkgXSC
	n4X2h6mlua4faQERBnqhNhxgqIaee+ZqixqFlevQxJTGxVd8IN76I53FX/awGQs1GZF7
	HwOibMq1yZTOTWQKC3EOz/S8+c4rEu4QwMndfSf7McvidcxOc1msY0VHnnmS9DdXMdS6
	6e12Yvc69UsaUaxhIR3IxJWPpXCkXp9AtMQ+mb77TE4i1k7oGV5yhzoVGUQ1Sh2Vij0p
	H+Cg==
X-Gm-Message-State: AHQUAuZcCl4Xy4uEM5v14yHDr78+9wdo4ErcznUGYct91SYXHDrtacRV
	d6VwePpXdPN8mD4V3ke8OHIM7xAeyvIwPswLj3E=
X-Google-Smtp-Source: AHgI3IYVoHkZqcR1/qsXp2UyAR6f7VGP5PB5ivd5lpCn8c8QuNT3tfYqkQ/YQrv/2+oiuMRtQYS7z6P7C9rQ5WSxfD0=
X-Received: by 2002:a9d:4ca:: with SMTP id 68mr2205709otm.96.1550828481836;
	Fri, 22 Feb 2019 01:41:21 -0800 (PST)
MIME-Version: 1.0
References: <20190222093725.624-1-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20190222093725.624-1-hongl.fnst@cn.fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 22 Feb 2019 10:41:09 +0100
Message-ID: <CANNYZj9axq33e=Q6v73v3JrVt+whfVSB+BcR8JDZu+w31OTUHw@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] cairo:upgrade to 1.17.2
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
X-List-Received-Date: Fri, 22 Feb 2019 09:41:22 -0000
Content-Type: text/plain; charset="UTF-8"

1.17.2 is a development version (see the upstream-version-is-even
inherit), so the update should be to 1.16.latest, or 1.18.latest, if
there is one.

You can check with 'devtool latest-version cairo'.

Alex

On Fri, 22 Feb 2019 at 10:37, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> Upgrade cairo from 1.16.0 to 1.17.2
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../cairo/{cairo_1.16.0.bb => cairo_1.17.2.bb}              | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-graphics/cairo/{cairo_1.16.0.bb => cairo_1.17.2.bb} (94%)
>
> diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.17.2.bb
> similarity index 94%
> rename from meta/recipes-graphics/cairo/cairo_1.16.0.bb
> rename to meta/recipes-graphics/cairo/cairo_1.17.2.bb
> index 3e176930cc..fadec5711b 100644
> --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> +++ b/meta/recipes-graphics/cairo/cairo_1.17.2.bb
> @@ -22,12 +22,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
>
>  DEPENDS = "fontconfig glib-2.0 libpng pixman zlib"
>
> -SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
> +SRC_URI = "http://cairographics.org/snapshots/cairo-${PV}.tar.xz \
>             file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \
>            "
>
> -SRC_URI[md5sum] = "f19e0353828269c22bd72e271243a552"
> -SRC_URI[sha256sum] = "5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331"
> +SRC_URI[md5sum] = "321a07adaeb125cb5513079256d465fb"
> +SRC_URI[sha256sum] = "6b70d4655e2a47a22b101c666f4b29ba746eda4aa8a0f7255b32b2e9408801df"
>
>  inherit autotools pkgconfig upstream-version-is-even gtk-doc multilib_script
>
> --
> 2.17.2
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

