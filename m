Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5134D7FC91
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 01:14:31 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id q17so2516676pgt.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 17:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:user-agent:mime-version:content-transfer-encoding;
	bh=2ctHabbAFOTSHcyCJzLaJZgOenaHcrXmVkqF81qMN2g=;
	b=UjX8KW9tFYNGzRNLTCATT2KN86i0F5jH6FvsGPup7mwn1jb3pJWId3fubJ3NYXecA3
	OjkKj/RS6iPAZdw6AMWjKc99rrAEj4ipfMls9Qb8P7LjykqsbaivLwRHQ0XqRENLCdR7
	NQDwprb/JJQUJjUzFPtTXzk10+wnfr4846okDgrOSJl3SYeZFTKQEteRwekjP5Ro1M0V
	b+fija0e9oHyQwv0Kq+u07ohU4BvRI3wy7QbtsjkQbd3WD1GzI0eI9KJY0Wt1mc5kG6j
	TJjeeGuohK2uyDHrJRczsLi+wyxIG1FUTeCVsC56BuQT91Ooo8fDB8NTA5YnDE+BNgQC
	yjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=2ctHabbAFOTSHcyCJzLaJZgOenaHcrXmVkqF81qMN2g=;
	b=IqZnXCZoZJmkhH9tw7ox/luV6KJQ562GOBkm+FftTTP8SQeGZ8LOJpdHhAy/r+ZuZv
	FduL6xRAUn81lC7gdh3r2lXcJthuy/tuvozCvL4Sh/UYu6dp/SRmoPfPk78uMFjKGcKH
	tuQFVTHVpBGh9pZRab1HrmpbtBIsj6lSvrqjlVhAC428YFK3lPHQvnlHkRRglADbD8SJ
	q8xQsoIfmsXv8+R/hZU97NsU4R49kUD9LV916Mk1YBH44FbT5+KGrJx+73TuHZC80g/Y
	9ZgcoHW+M1de6TL0e2HWBdhnk6GafdbmXKMX9c+DEHL3DP6NQsXTh06VVpAnRL6z7aPl
	DfUg==
X-Gm-Message-State: APjAAAX+WZDz5I+cLdRGnXGZHxYh/KSEQYYpk/mCS7PCcyXXJ0lyaNP9
	WBwU30F9k/UwQJygQFT3BiCPEAvXxhk=
X-Google-Smtp-Source: APXvYqylu61EsWZmjN9ZiGAdjUJDTeci46FGv0U89SzXIqTonbEAO1PWCBOUQ+GI2SrBrJawJQQT4g==
X-Received: by 2002:a62:e308:: with SMTP id g8mr14742772pfh.121.1574385271992; 
	Thu, 21 Nov 2019 17:14:31 -0800 (PST)
Received: from tyche ([2601:646:8500:1c20::5ab7])
	by smtp.gmail.com with ESMTPSA id
	i3sm4896801pfd.154.2019.11.21.17.14.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 17:14:31 -0800 (PST)
Message-ID: <b8353d8a56480ad4eb725933e3f9c93e5c79d68f.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 17:14:30 -0800
In-Reply-To: <20191121165824.1220075-1-JPEWhacker@gmail.com>
References: <20191121165824.1220075-1-JPEWhacker@gmail.com>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
Subject: Re: [PATCH] librsvg: Fix build reproducibility
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
X-List-Received-Date: Fri, 22 Nov 2019 01:14:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-11-21 at 10:58 -0600, Joshua Watt wrote:
> librsvg was encoding the path to the build directory in order to find
> a
> font file for testing. This wouldn't work in OE anyway since the
> build
> directory isn't present at that exact location on the target, so
> remove
> the offending path to make the build reproducible.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  .../0001-Remove-non-reproducible-SRCDIR.patch | 30
> +++++++++++++++++++
>  meta/recipes-gnome/librsvg/librsvg_2.40.20.bb |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-Remove-
> non-reproducible-SRCDIR.patch
> 
> diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-Remove-non-
> reproducible-SRCDIR.patch b/meta/recipes-gnome/librsvg/librsvg/0001-
> Remove-non-reproducible-SRCDIR.patch
> new file mode 100644
> index 00000000000..75fc7f9d0b9
> --- /dev/null
> +++ b/meta/recipes-gnome/librsvg/librsvg/0001-Remove-non-
> reproducible-SRCDIR.patch
> @@ -0,0 +1,30 @@
> +From bea5156cd7e7122715b26c769c35928141a1da2c Mon Sep 17 00:00:00
> 2001
> +From: Joshua Watt <JPEWhacker@gmail.com>
> +Date: Mon, 18 Nov 2019 14:46:34 -0600
> +Subject: [PATCH] Remove non-reproducible SRCDIR
> +
> +Removes SRCDIR as the prefix for finding the test font. This
> wouldn't
> +work anyway, since that path is not present on the target.
> +
> +This patch is specific to OE, since it appears that this entire
> method
> +of testing was removed when upstream was re-written in rust
> +
> +Upstream-Status: Inappropriate [OE-specific, no longer present
> upstream]

what replaced it ( just curious ), can we backport the fix that removed
it or made obsolete ?

> +Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> +---
> + rsvg-cairo-draw.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/rsvg-cairo-draw.c b/rsvg-cairo-draw.c
> +index caa9104..cfb7ed2 100644
> +--- a/rsvg-cairo-draw.c
> ++++ b/rsvg-cairo-draw.c
> +@@ -398,7 +398,7 @@ set_font_options_for_testing (PangoContext
> *context)
> + static void
> + create_font_config_for_testing (RsvgCairoRender *render)
> + {
> +-    const char *font_path = SRCDIR
> "/tests/resources/LiberationSans-Regular.ttf";
> ++    const char *font_path = "/tests/resources/LiberationSans-
> Regular.ttf";
> + 
> +     if (render->font_config_for_testing != NULL)
> +         return;
> diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
> b/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
> index 7f98127fd01..6dd0533a5de 100644
> --- a/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
> +++ b/meta/recipes-gnome/librsvg/librsvg_2.40.20.bb
> @@ -20,6 +20,7 @@ inherit gnomebase gtk-doc pixbufcache upstream-
> version-is-even gobject-introspec
>  
>  SRC_URI += "file://gtk-option.patch \
>              file://0001-Auto-detect-Bsymbolic-fixes-configure-on-
> macOS.patch \
> +            file://0001-Remove-non-reproducible-SRCDIR.patch \
>  "
>  
>  SRC_URI[archive.md5sum] = "4949d313b0c5d9161a5c259104af5568"
> -- 
> 2.23.0
> 


