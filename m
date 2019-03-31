Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8EDB36BC7A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 13:56:00 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id v7so5164846oie.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 06:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KI3ELP6K27EDtVWVPlRcxVpUp9em6J2ERCq6+d4PRRw=;
	b=ck55K7wI9znPFiJJtn6XWUZNj2EVPRI+WCRxFq0phEyCbyXr2eb2vnGlVIArKbOFWb
	jMorsvatji4sbccWLc91NldNy7ry8gf+eNEtcEEex2oSCVAc8ptnJekGXoNavDJ8Q0ku
	7U83PZQG3Aq2QZdNo2ykKc/lSyQyVOcJ6kXzSUDtH2gKtePf9atrMFy+tpu1/A3PaA4X
	9sPt32SCMEMj891VQQ5g/bczE0yn1DnoJIgN5PXxHsPATsSgi1f6lmBgH8Z6TR1qtv7w
	YDHlojMjW6FGPmMdwheTVqtzpMad8eB0CMQZyqooASUmTbAG4L8lgZWaPOULKQIkQTkO
	2n3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KI3ELP6K27EDtVWVPlRcxVpUp9em6J2ERCq6+d4PRRw=;
	b=jU1ilyS+8YK0S0xXxWBX4BZGwje+8MCulN8okOmXXY19aH0ILaONOI2kNvwLCAHfbb
	9pHXuG+teQRjrYunq7wDvw5CGkiUASezDrlSKykkRbHDzaiXjXunxOwBNg0Nn9JlQkP1
	8qDAftQ7z5FazM81iAZXYBDJmpzUDMjVHHtOcsaXzAOTyTVcz/HZ1X3Q1I7Cm8gK8CRU
	kLPGI9ucMhx56DW6vfgAmbquBM3vNSkYVVEgr4A0jCXYl07fgATYvQyP2FZYlCF5QtK0
	NVOd/RzWhR5QaPgDT/9Lk1C8IVnumNmPDL8+JQjWSJQG8rKt8amcdn331CO7XGTGzV1J
	x2Uw==
X-Gm-Message-State: APjAAAV+s1vM0abms5I7ygwlNoiWvH3GnTgXuK1JxXhhtvvjpT5f/XDB
	lD1o/Dn0Wsj0PKDx1qFNpaO1P47Us0srEZZm9Wimbg==
X-Google-Smtp-Source: APXvYqwjgRGjQxWuPkJeuLw1IFDtgHh+UcdqP8+L6SSJi4df/9IB+rY25jhXNy00M8GXXvzcCb1knVlUwswbIVRGT2M=
X-Received: by 2002:aca:ac94:: with SMTP id v142mr9741572oie.135.1554040561499;
	Sun, 31 Mar 2019 06:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190331004115.16429-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190331004115.16429-1-open.source@oleksandr-kravchuk.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 31 Mar 2019 15:55:49 +0200
Message-ID: <CANNYZj8hm5szOHGPijdQ3HMnwKM8qpOfH6ZQQ+sDA1SQMzK5Cg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pango: update to 1.43.0
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
X-List-Received-Date: Sun, 31 Mar 2019 13:56:00 -0000
Content-Type: text/plain; charset="UTF-8"

1.43.0 is a development release.
You can use 'devtool latest-version pango' to find out what the latest
stable release is (facilitated by 'inherit upstream-version-is-even').

BTW, would you want to be the maintainer for some of these items?
You'll get patches from Automated Upgrade Helper whenever there is a
new version. YP is struggling to find people for this activity; many
existing maintainers have become unresponsive.

Alex

On Sun, 31 Mar 2019 at 01:41, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../pango/{pango_1.42.4.bb => pango_1.43.0.bb}                | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/pango/{pango_1.42.4.bb => pango_1.43.0.bb} (93%)
>
> diff --git a/meta/recipes-graphics/pango/pango_1.42.4.bb b/meta/recipes-graphics/pango/pango_1.43.0.bb
> similarity index 93%
> rename from meta/recipes-graphics/pango/pango_1.42.4.bb
> rename to meta/recipes-graphics/pango/pango_1.43.0.bb
> index d3357f82de..e91e02a837 100644
> --- a/meta/recipes-graphics/pango/pango_1.42.4.bb
> +++ b/meta/recipes-graphics/pango/pango_1.43.0.bb
> @@ -18,8 +18,8 @@ inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspec
>  SRC_URI += "file://run-ptest \
>              file://insensitive-diff.patch"
>
> -SRC_URI[archive.md5sum] = "deb171a31a3ad76342d5195a1b5bbc7c"
> -SRC_URI[archive.sha256sum] = "1d2b74cd63e8bd41961f2f8d952355aa0f9be6002b52c8aa7699d9f5da597c9d"
> +SRC_URI[archive.md5sum] = "2df040d3f6a4ed9bc316a70b35adcd8b"
> +SRC_URI[archive.sha256sum] = "d2c0c253a5328a0eccb00cdd66ce2c8713fabd2c9836000b6e22a8b06ba3ddd2"
>
>  DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

