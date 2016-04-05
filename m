Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 395507700A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 22:02:49 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id 191so38518943wmq.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2016 15:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=cothTTSdXTrZEaIBC7YsBul09WnMQ+h0jyU0iRXyZuM=;
	b=hi5lR5e435G0RDjbNenha3PEEe1XZD18K14hK7bMh50yN6ybNu3eNicd4dxOe5C9Za
	CE6IHFEt7UBfGxqrw0Oujh63i+A2wV7PcICOApNDdqdmrm1eXUn8RWs0w5VFR3m9cxp0
	8PNLyEdBIdidq6Ge1tvRUeb627KD4IUo7J/TesHokhHrFzbuafbJSTx+Y4ondK+YsTc2
	Amft4RjV4aLJq3haAOmW6E/+563VbvRZ0bekEgyabl1PWsBe9TamT9r/dF6jRGryMFzG
	0OzdDChpv72/IDbb9ataU6hhW+MLaphATea2cbZ1FiT3G1cW0vKAiYOY7PeWM2IbzW1n
	sDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=cothTTSdXTrZEaIBC7YsBul09WnMQ+h0jyU0iRXyZuM=;
	b=GEHtZapp5pojWv0sNojwpoQC+/8ZzQ59OmOlJHdT6qzTgsiqR41WsNpZ4tvCFWqPT2
	yqjRkDBJkXwFFid8AIXjT/LeskoBxUYuZoxU62PCMG8amVCe+HJ+9LcKyl2pxSvUf43g
	8pht3wqRycMRN8YvB0vvxp+KakZD5UQPO5zvcggVzwXvMlAgPgBNRZl4TJfr94l8jb0V
	D+NOFfi65OcaHTgPhj9i+ujicWRgiS9CaGoBAMqg7F1OYS8N6lFwpcn4y2Ws4DGhvdiv
	3m3TfVa3KsVxDirc2cJWj/6tgDg5HwWmNfsWVCMZamZhoSmmwh2GcAfUDwwMLh36VSfv
	Jz/g==
X-Gm-Message-State: AD7BkJI3sW6B7zsznlMoLpbDYT13tusHKEqyltCZxXHEJGUtKTvjiB9EUpizoj7UaKWaBbN/Vln4USMy9Fvxxw==
MIME-Version: 1.0
X-Received: by 10.28.50.133 with SMTP id y127mr20292017wmy.4.1459893770392;
	Tue, 05 Apr 2016 15:02:50 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Tue, 5 Apr 2016 15:02:50 -0700 (PDT)
In-Reply-To: <1459891560-4178-1-git-send-email-ross.burton@intel.com>
References: <1459891560-4178-1-git-send-email-ross.burton@intel.com>
Date: Tue, 5 Apr 2016 15:02:50 -0700
Message-ID: <CAJ86T=XXJtGhRqvtkXp1aAHMYN8Y0VDrUJZfDhqNkodtbOXymw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bzip2: set correct soname
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
X-List-Received-Date: Tue, 05 Apr 2016 22:02:52 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 5, 2016 at 2:26 PM, Ross Burton <ross.burton@intel.com> wrote:
> The correct name for the bzip2 shared library is libbz2.so.1.0.6, not
> libbz2.so.0.0.0.  Pass -version-info to libtool to correct this.
>
> Also fix the configure.ac so that is doesn't mention libXrender and has the
> right version.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-extended/bzip2/bzip2-1.0.6/Makefile.am  | 1 +
>  meta/recipes-extended/bzip2/bzip2-1.0.6/configure.ac | 5 +----
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/Makefile.am b/meta/recipes-extended/bzip2/bzip2-1.0.6/Makefile.am
> index 1d163b6..05d389f 100644
> --- a/meta/recipes-extended/bzip2/bzip2-1.0.6/Makefile.am
> +++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/Makefile.am
> @@ -1,5 +1,6 @@
>
>  lib_LTLIBRARIES = libbz2.la
> +libbz2_la_LDFLAGS = -version-info 1:6:0

1:6:0 or 1:0:6 ?

>
>  libbz2_la_SOURCES = blocksort.c  \
>                      huffman.c    \
> diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/configure.ac b/meta/recipes-extended/bzip2/bzip2-1.0.6/configure.ac
> index 47ee576..e2bf1bf 100644
> --- a/meta/recipes-extended/bzip2/bzip2-1.0.6/configure.ac
> +++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/configure.ac
> @@ -1,12 +1,9 @@
>  AC_PREREQ([2.57])
>
> -AC_INIT(bzip2, 2.0.5, , libXrender)
> +AC_INIT(bzip2, 1.0.6)
>  AM_INIT_AUTOMAKE(foreign)
>  AM_MAINTAINER_MODE
>
> -#AM_CONFIG_HEADER(config.h)
> -
> -# Check for progs
>  AC_PROG_CC
>  AC_PROG_LIBTOOL
>
> --
> 2.7.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

