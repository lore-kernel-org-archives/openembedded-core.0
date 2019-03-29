Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
	[209.85.166.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1D4107D09B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 12:04:49 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id v4so1517444ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 05:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=pd6rJX3WbpJmLolVL4aN97LvlDs6LXTFFfIxn2je91A=;
	b=kV6dZfMYHGVfhJG6+tJNwkxIPMbneaaDNcp1HLEAM4FFdRGMgGEo0V8ihmadgGAGXx
	2xK3v7+SYU5FzygJT+1nvlTIm3wePyXcGJzN1avKW2E8fJj4OTTgJGzCC3wmRYR+OKt2
	WrUS2uBj7m3tnMBKsOkr4sSAaHJiKUcTnALwHfSvWksgRYRhtOUSV45qaHn930VxlbY2
	X/uu1xJ3n9GKyrVgA7WkDoN0saT+S/ob1eYpL7U6YD3gEC0LDVUxlfFY1MDoCaCKPv75
	KnbGr3w13Cxm66BGofEOvpDb5eNcWY3IAKx4vT7aCnhYMqACTYYsyhxawDZ8LvkGOD8o
	JHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=pd6rJX3WbpJmLolVL4aN97LvlDs6LXTFFfIxn2je91A=;
	b=IndjdaJOYk3nechsiOvRUubqisfyhfUY0NZFLdxVS9EAuNFYnBMdwJ6h7L2aE6Z2O4
	wNDT/cUfHZmx/Mx6SjOd0IlROil1ZFzb+BMY3yBvgynSFSRefBetx14LOiuBr1mUAvgq
	9gnImwB0DiBZoQYw8e8cY2KtVVFFQVAfg0+KND3/JpN8y5wxr0bET5YWrONkUf6uVhlc
	t0Lj0Dzq2J01qJHJ9y47nYa+0qN7aFI2029A1LWvyIUf8K5Nbzn6VeIh//ZNhG+mFtfx
	H1DuUwH1U7qVCCWzx7EHIZWndz2HKS9vCZQ3LV7LE+GjEtNo3qWQBYgdbvXKd+S7V0m3
	S7SQ==
X-Gm-Message-State: APjAAAXrBizlbeBawmCoaCdkovF59HP7sAXTYtjO7BGEmwg/wqMlGRi5
	be8LBxtnRmFAhCvfPvIgtcMoiLZdpaHEyfR1CJ1bQg==
X-Google-Smtp-Source: APXvYqxkD/I1MPHAU11CXyfRz9P3Ogb/nN3+zOzzPUa8FUmvRrOuNSD70LiB8OCVQ4k9eMA3W6UPTJaSc7w+5zwXlkI=
X-Received: by 2002:a6b:3c05:: with SMTP id k5mr3930111iob.270.1553861091056; 
	Fri, 29 Mar 2019 05:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190326102919.7348-1-schnitzeltony@gmail.com>
In-Reply-To: <20190326102919.7348-1-schnitzeltony@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 29 Mar 2019 12:04:40 +0000
Message-ID: <CAJTo0La2G+3qUPzXOC6B0Mjwr70ygPuttHuNzfV85GRy3pZYpQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk+3: add librsvg to DEPENDS
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
X-List-Received-Date: Fri, 29 Mar 2019 12:04:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

But GTK+ doesn't depend on librsvg at all, and this is a failure in
adwaita-icon-theme.  Why doesn't the dependency belong on
adwaita-icon-theme?

Ross

On Tue, 26 Mar 2019 at 10:30, Andreas M=C3=BCller <schnitzeltony@gmail.com>=
 wrote:
>
> adwaita-icon-themes failes to create symbolic icons. In log.do_install wh=
en
> calling gtk-encode-symbolic-svg there many complaints
>
> | Can't load file: Unrecognized image file format
>
> We fail her now due to:
>
> commit 7f6c57635ff4e1edf7a46c49af34846ad0a4bf73
> Author: Alexander Kanavin <alex.kanavin@gmail.com>
> Date:   Wed Jan 30 11:59:25 2019 +0100
>
> gtk+3: remove the gtk-icon-utils-native recipe
>
> gtk-icon-utils-native had librsvg in its DEPENDS. We do not add librsvg-n=
ative
> because same issue would occure for gtk-encode-symbolic-svg on target.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta/recipes-gnome/gtk+/gtk+3.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/=
gtk+3.inc
> index 77b6c31536..b58641a470 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3.inc
> +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
> @@ -5,7 +5,7 @@ HOMEPAGE =3D "http://www.gtk.org"
>  BUGTRACKER =3D "https://bugzilla.gnome.org/"
>  SECTION =3D "libs"
>
> -DEPENDS =3D "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf \
> +DEPENDS =3D "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf librsvg \
>             gdk-pixbuf-native"
>
>  LICENSE =3D "LGPLv2 & LGPLv2+ & LGPLv2.1+"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

