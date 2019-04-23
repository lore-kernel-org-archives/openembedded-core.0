Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
	[209.85.166.48])
	by mail.openembedded.org (Postfix) with ESMTP id F14EE7CA4F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 12:00:03 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id a23so8535621iot.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 05:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=g+Km/Kor5Xd4YGlPp95RUAmysXHRDLflnmeH+3Zftbs=;
	b=AdfhAk1keXXyOpvtRCmBXJnJbfmeDbLSsrXDOr2f8+c4/h1aUP+Hp4gfi9/gCYjDlm
	SPkMobV3b9R0r+fpwIj4N+XVi0p7KYKxnRw6GRO1vKk140wrRj8U4KYvVVk5qQsx6D7E
	lERgEM800juKrN9+3jbtCwZ/gWjbv6elM4IyP+JKN2VjRyp7aoJPfPUrQXf3h7meJVm/
	jr1vBn6EkrtkpxHFQKTEplWwLrllA//ed6RQ52A1QPeeN7fzYwQQa33RzCfiNc0bUTsm
	FqOqXOTEwXSr203Rk2gdUd63Oi21IY+pg4ZRcMg8ZGJJOMNtIf3/djV7h7i61CNag7gG
	6ZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=g+Km/Kor5Xd4YGlPp95RUAmysXHRDLflnmeH+3Zftbs=;
	b=kvHCzkaFtU/48DFUy2FN3eiJx00Wn30AUHJj3kxrpArtxntZldKl59dnLftGEyoSJH
	0lwTXE7AiQsFYN1EuZqgNlzx6HtQJ+2dEMULeky9yBfuhZjZv1cJHKrqxlu484PNaU04
	yjIwL2vvIk1Lb5NHgLFQLbzGoTigh3Ba5d8jPFxUHVVhAJBz2xbHSCVN7lXFhlnJFkK/
	6fsjvqx9PW2kCXnfk22+uVjW+0WnlYEHZ4P9ZRP3LCEjQggx6ePJ4ZlF5hjQiWaDLwZt
	DNVZ1GlDJ2MTu48t1JgISucRDWuLOm3Mq5kcaPTcGkJ841/c3Eh/zo8nf1g4ulUBzj05
	mDKQ==
X-Gm-Message-State: APjAAAUrNg8/DsncuiWPbizyhNgJUQ7egqVbRwO+Jgd/bSKJVqIDEiwo
	5Wmt+Y8qTPiPBVE/PtBm64QogReeFxBNIZKCnWyZWUaG
X-Google-Smtp-Source: APXvYqzgreVddz62ouxklJsgMonnF02UrEzCI855mCoPBLyLfHW8Jvfkd9RChrEdS+jBF99tWkXS62P9NQgSimeFqKw=
X-Received: by 2002:a05:6602:11a:: with SMTP id
	s26mr8426600iot.201.1556020804861; 
	Tue, 23 Apr 2019 05:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190422223648.30507-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190422223648.30507-1-open.source@oleksandr-kravchuk.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Apr 2019 12:59:54 +0100
Message-ID: <CAJTo0LYefGWi6Y8qo68oi=7RnLLVyYFYewdvrxUNnb0HZ6Y7jg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] libnotify: update to 0.7.8
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
X-List-Received-Date: Tue, 23 Apr 2019 12:00:04 -0000
Content-Type: text/plain; charset="UTF-8"

Fancy following this up with a Meson port?

Ross

On Mon, 22 Apr 2019 at 23:37, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../libnotify/{libnotify_0.7.7.bb => libnotify_0.7.8.bb}      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-gnome/libnotify/{libnotify_0.7.7.bb => libnotify_0.7.8.bb} (80%)
>
> diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.7.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
> similarity index 80%
> rename from meta/recipes-gnome/libnotify/libnotify_0.7.7.bb
> rename to meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
> index 6c299bc175..82c137ca33 100644
> --- a/meta/recipes-gnome/libnotify/libnotify_0.7.7.bb
> +++ b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
> @@ -10,8 +10,8 @@ inherit gnomebase gtk-doc distro_features_check gobject-introspection
>  # depends on gtk+3
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
> -SRC_URI[archive.md5sum] = "e9d911f6a22435e0b922f2fe71212b59"
> -SRC_URI[archive.sha256sum] = "9cb4ce315b2655860c524d46b56010874214ec27e854086c1a1d0260137efc04"
> +SRC_URI[archive.md5sum] = "babb4b07b5f21bef42a386d3d7019599"
> +SRC_URI[archive.sha256sum] = "69209e0b663776a00c7b6c0e560302a8dbf66b2551d55616304f240bba66e18c"
>
>  # there were times, we had two versions of libnotify (oe-core libnotify:0.6.x /
>  # meta-gnome libnotify3: 0.7.x)
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

