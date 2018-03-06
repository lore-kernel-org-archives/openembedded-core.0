Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id E8A2D6FFCD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 03:09:33 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id l4so7746684pgp.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 19:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y/kD81gQVX7DzVi5EGwGXumGKn3F7hqZ3u4I808ZuJc=;
	b=V48ZpyZLFP/q0M7DGsRdNJOBuydp136dF3vhFvkfRymJLlH3rrtKHmlaVIQqAkxQOR
	aFRF1UrlLu9CMIuqdSdhRyc9ywiN8d2aDOuSS0nXtkG+HlEdtBqA5LsQHz/PDL6NLMyj
	zWVW1+2y3HqVezPYexclbox0EkcgtYW5wZQWhggnN5nfr3c4c9agKYaz8lhhYBXKsmrM
	y7DxZG+7/OTu5pbE9ZTm6cXiN6f9sBs6hsZGoy9UPbxC3PDbwZ+8I1D3XnBgYs7b8iFY
	tl9zhPFXWkOek6kxy2jhvcatnzJ9ysHcvAaY5Rwc6jxBDVH+QNMYL1zN04cU//oJC98i
	wXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y/kD81gQVX7DzVi5EGwGXumGKn3F7hqZ3u4I808ZuJc=;
	b=nOAFIjMWAldjAdWav0sjnmxdt8AsJzSZzOFW1ABCJ3g19bNrCFx7cny4XqdJ6VvIlB
	i8iVSwIZ00AWqYkoHUJ9mcBpI64QEN9eXqumc6pddTNYTQKtDgxaNRbi8oCSAUFBQleG
	Y4FKGn27qr1geBg9k/MEeH1SnlNYtnzpHw5QoBqX0aarplG1G9JP5q+Kgwhk4Yg1i9jw
	z2xqpcSsEDAeqANEMojRrq2A7/+nknwJf8PQ9AX8dflO2i+ULJudDlboNVU+9r6Bkw3m
	HIFgU0ySRo32DxjlGbaVTUraJuZSxR9fOEYptkH5QSVR8DmNP6o23eLfNn8ASMugg1zt
	mZKA==
X-Gm-Message-State: APf1xPBdDrslMetNRQn68mdQtGo+Dki08jiNjgbLW/VY2GUqdMpAElMx
	KJDA7zzOERZY8h4CYW5hW+1JpVlfoUTlbET/UHA=
X-Google-Smtp-Source: AG47ELt1epQHctpgSEoESCua7KlGk82Jqbm0P+/IkWQvdNXnJi7SJc//98EouvZSRScizb9m3jASGO2hAMR9fynl800=
X-Received: by 10.98.18.70 with SMTP id a67mr17422288pfj.213.1520305774576;
	Mon, 05 Mar 2018 19:09:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.170.69 with HTTP; Mon, 5 Mar 2018 19:09:04 -0800 (PST)
In-Reply-To: <20180305172046.21729-4-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
	<20180305172046.21729-4-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Mar 2018 19:09:04 -0800
Message-ID: <CAMKF1soz7-FcSjt7H1ihQ05nx31DwhZZN6a8Tzn-qt2B0Xzqag@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/29] gtk+: refresh patches
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
X-List-Received-Date: Tue, 06 Mar 2018 03:09:34 -0000
Content-Type: text/plain; charset="UTF-8"

You did not mention the reason why this refresh needed

On Mon, Mar 5, 2018 at 9:20 AM, Ross Burton <ross.burton@intel.com> wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-gnome/gtk+/gtk+/hardcoded_libtool.patch | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-gnome/gtk+/gtk+/hardcoded_libtool.patch b/meta/recipes-gnome/gtk+/gtk+/hardcoded_libtool.patch
> index 1ae728e70d6..9eb7f6bf5c7 100644
> --- a/meta/recipes-gnome/gtk+/gtk+/hardcoded_libtool.patch
> +++ b/meta/recipes-gnome/gtk+/gtk+/hardcoded_libtool.patch
> @@ -3,19 +3,20 @@ Upstream-Status: Inappropriate [embedded specific]
>  Updated to apply to gtk+-2.24.15
>
>  Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> -diff -Nurd gtk+-2.24.15/configure.ac gtk+-2.24.15/configure.ac
> ---- gtk+-2.24.15/configure.ac  2013-01-12 20:52:54.000000000 +0200
> -+++ gtk+-2.24.15/configure.ac  2013-02-12 21:33:30.689925967 +0200
> -@@ -415,7 +415,7 @@
> +Index: gtk+-2.24.31/configure.ac
> +===================================================================
> +--- gtk+-2.24.31.orig/configure.ac
> ++++ gtk+-2.24.31/configure.ac
> +@@ -415,7 +415,7 @@ AC_MSG_CHECKING([Whether to write depend
>   case $enable_explicit_deps in
>     auto)
>       export SED
>  -    deplibs_check_method=`(./libtool --config; echo 'eval echo \"$deplibs_check_method\"') | sh`
>  +    deplibs_check_method=`(./$host_alias-libtool --config; echo 'eval echo \"$deplibs_check_method\"') | sh`
>       if test "x$deplibs_check_method" '!=' xpass_all || test "x$enable_static" = xyes ; then
> -       enable_explicit_deps=yes
> +       enable_explicit_deps=yes
>       else
> -@@ -774,7 +774,7 @@
> +@@ -772,7 +772,7 @@ else
>       dnl Now we check to see if our libtool supports shared lib deps
>       dnl (in a rather ugly way even)
>       if $dynworks; then
> @@ -24,7 +25,7 @@ diff -Nurd gtk+-2.24.15/configure.ac gtk+-2.24.15/configure.ac
>           module_deplibs_check=`$module_libtool_config | \
>               grep '^[[a-z_]]*check[[a-z_]]*_method=[['\''"]]' | \
>               sed 's/.*[['\''"]]\(.*\)[['\''"]]$/\1/'`
> -@@ -1574,7 +1574,7 @@
> +@@ -1579,7 +1579,7 @@ fi
>   # We are using gmodule-no-export now, but I'm leaving the stripping
>   # code in place for now, since pango and atk still require gmodule.
>   export SED
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

