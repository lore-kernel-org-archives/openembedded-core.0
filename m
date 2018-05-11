Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 450F674E82
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 10:17:46 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id d11-v6so6397260iof.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 03:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0UzfHfUmuEv+LGSH7do4hoKbLFuFv+as4oWOB3ybE4I=;
	b=vYkeCMaid9SUz/hWl6QqQveA5IihladfJeX5XkStxHuLQp9CgLUNkrkRgR1w5Is6MW
	2uAh7TfQAiNF3W+Hm/jeGE+ym9o/0Bd3zgyFsnVEkfIMEDk330JIz+5GqU18Dg4Va1x7
	Cpo3ypFedoqEu/e6GKwgWn1iaT7mQ+OgciIYENpYXgpuj7Sp6YWGBu5YryEjqcwc7SCq
	S1aRvEDt0u53SIMdlk2l/4wXfc84upoMPU7h6nbQpEIMltvCvsZdd4yDjICj7asfsMip
	ztCSIjC+PHBAjpNFeq5WEhbXJ4veyh/mLyU0Bzs/3HqC2wTVExebTUtDIGl9xfq7bgta
	2Pkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0UzfHfUmuEv+LGSH7do4hoKbLFuFv+as4oWOB3ybE4I=;
	b=TzuiHPh2LqnptAJpxmBM2vxVaA+kzpjcQ3G6Hxn7UhY0S21gTfjN9l1H/nerON2b+B
	kLBSQbFd/EPgzwGbkYYxOvTd+AOb4LHxfRCiyB+XwCc04uPWAuaKzjll9nwstpA+A0m1
	2uTfkmUGza8EjY1dE6r6phS3aT1f2+Q2f5Pf9GNHzj7COZGifFG8TOhFAjtgCrnkenQK
	xfgLb9aLRV7CNydCOxtIGgiTBubEExN28CcvcTQm0ciqQEUcZoDaqssu0F0cPpPM2uOi
	iXJMHAzQ0ZRUaY6P27lOITwLMRvNUnpegwcj70LSMaV+vm8nuSAThhxbTmYKvYPy4WLh
	9MYA==
X-Gm-Message-State: ALKqPwdYy0WYduMboPmz0b+PqMzlboVEo0zwegaxTKDlAVr0HLpyLJ55
	AOcs9kWaqcj23SKWU0Xginqpe6otsaQJjXVJ7WGR5g==
X-Google-Smtp-Source: AB8JxZrH0+HdLBoccwMtQwp41RUrNMJ1AXr4vfv2w/DrkYNsPdtJ8fKcDJO/fRQT4KbrHBjBI/e5M2AeLllubtkDAgI=
X-Received: by 2002:a6b:248e:: with SMTP id
	k136-v6mr4832761iok.270.1526033867815; 
	Fri, 11 May 2018 03:17:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Fri, 11 May 2018 03:17:27 -0700 (PDT)
In-Reply-To: <ffc349e5f97e7ff62aa6e60f52887f57e615f808.1526004301.git.Qi.Chen@windriver.com>
References: <cover.1526004301.git.Qi.Chen@windriver.com>
	<ffc349e5f97e7ff62aa6e60f52887f57e615f808.1526004301.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 May 2018 11:17:27 +0100
Message-ID: <CAJTo0LYZkPzRaym4sR6bymsgWyd9nXfe6njW0neepLmD3Y5Msw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] dbus-glib: upgrade to 0.110
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
X-List-Received-Date: Fri, 11 May 2018 10:17:47 -0000
Content-Type: text/plain; charset="UTF-8"

If dbus-glib doesn't need --with-introspect-xml anymore then the dbus
recipe can stop installing it.

Ross

On 11 May 2018 at 03:20, Chen Qi <Qi.Chen@windriver.com> wrote:
> The obsolete '--with-introspect-xml' option is removed.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/dbus/dbus-glib.inc      | 4 +---
>  meta/recipes-core/dbus/dbus-glib_0.108.bb | 4 ----
>  meta/recipes-core/dbus/dbus-glib_0.110.bb | 4 ++++
>  3 files changed, 5 insertions(+), 7 deletions(-)
>  delete mode 100644 meta/recipes-core/dbus/dbus-glib_0.108.bb
>  create mode 100644 meta/recipes-core/dbus/dbus-glib_0.110.bb
>
> diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/meta/recipes-core/dbus/dbus-glib.inc
> index 55f710f..16dbf4f 100644
> --- a/meta/recipes-core/dbus/dbus-glib.inc
> +++ b/meta/recipes-core/dbus/dbus-glib.inc
> @@ -22,9 +22,7 @@ inherit autotools pkgconfig gettext bash-completion gtk-doc
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG[tests] = "--enable-tests,,,"
>
> -EXTRA_OECONF = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml \
> -                --with-dbus-binding-tool=${STAGING_BINDIR_NATIVE}/dbus-binding-tool"
> -EXTRA_OECONF_class-native = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml"
> +EXTRA_OECONF_class-target = "--with-dbus-binding-tool=${STAGING_BINDIR_NATIVE}/dbus-binding-tool"
>
>  PACKAGES += "${PN}-tests"
>
> diff --git a/meta/recipes-core/dbus/dbus-glib_0.108.bb b/meta/recipes-core/dbus/dbus-glib_0.108.bb
> deleted file mode 100644
> index 7a9a69e..0000000
> --- a/meta/recipes-core/dbus/dbus-glib_0.108.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -require dbus-glib.inc
> -
> -SRC_URI[md5sum] = "a66a613705870752ca9786e0359aea97"
> -SRC_URI[sha256sum] = "9f340c7e2352e9cdf113893ca77ca9075d9f8d5e81476bf2bf361099383c602c"
> diff --git a/meta/recipes-core/dbus/dbus-glib_0.110.bb b/meta/recipes-core/dbus/dbus-glib_0.110.bb
> new file mode 100644
> index 0000000..8120505
> --- /dev/null
> +++ b/meta/recipes-core/dbus/dbus-glib_0.110.bb
> @@ -0,0 +1,4 @@
> +require dbus-glib.inc
> +
> +SRC_URI[md5sum] = "d7cebf1d69445cbd28b4983392145192"
> +SRC_URI[sha256sum] = "7ce4760cf66c69148f6bd6c92feaabb8812dee30846b24cd0f7395c436d7e825"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

