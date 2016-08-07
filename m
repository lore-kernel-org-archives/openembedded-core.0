Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 25A72760AA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Aug 2016 14:44:07 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id x189so19035747qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Aug 2016 07:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2XygzRyoVDeHFgv4Uj8YSNQ/6p8pZOdnF9fkajpHjlw=;
	b=WLHuKE4dO7APf+uyyYD57F/oJ/f65I1heg+minBklmKdCR9KhntyiJprR0Pp6ufjlS
	gM8MWzKrj8V59zbjjScg1hbcfuqvoqtUlg6Ci3nX34Dh6T8zmq2D7V1Gmm0eSJnMpbZl
	tQcKoHbBVHM6WMPjPS1cDar/Lrqvr7mvipLJEWBj70Hi8T1MGLkejRc9jLA21YauQo6B
	ILXOJ/P+O8O71GwXKOLwe3tEAa/DdQHuNpHtKkuDNHyBbirPDw2LvI+koiz/IrPP0syw
	yfQFUqks6zedihiu/c1isXG8ysNpPdvq4LJ2oYGpCBDBHvE5rgstMdCh9PruXLxMWgIA
	orMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2XygzRyoVDeHFgv4Uj8YSNQ/6p8pZOdnF9fkajpHjlw=;
	b=Rihbs3I7K/5ukXhJUpPMg740mklUgPlM19+kKmDjQPJBS65me12wEbXUE/QIZQWx0z
	0/pndUD4XQu3ztwZ2QDcKO+02FelaGPhMZkeIX6WHg2zbpNIbUnLe09l+mCvBmyihGhN
	pOuqR/AD+pnhEiJ32biP8xVjxD6pU4H684wgAhvpf27IBdZYkiU3th+p/zM1j4Pq+2h7
	UCDTLwWjJiA2K7JyZuiPX1h0IYxUdbFOP58bbppkJVMW9xWPRHSxAJrTml4VXhfAOhm7
	YtwWNJIFsbiKHiL8YtKrcGABhHarD8ULDK/JH4D9QL5zia3Bvq3A6d9m89OyGBdbVwZv
	sIOA==
X-Gm-Message-State: AEkoouvumMW5adSMFg0l8f3X2ZRMvL5Gx4pJXUHshq1WxtryTzraWQHxBV+554QuvlqIEdHRwd29iOmAKInN2g==
X-Received: by 10.55.186.195 with SMTP id k186mr24575526qkf.166.1470581047671; 
	Sun, 07 Aug 2016 07:44:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.215.13 with HTTP; Sun, 7 Aug 2016 07:43:37 -0700 (PDT)
In-Reply-To: <7e8b65b32c46371860e3c2a3c7e76bf5279fb4ba.1470127858.git.liezhi.yang@windriver.com>
References: <cover.1470127858.git.liezhi.yang@windriver.com>
	<7e8b65b32c46371860e3c2a3c7e76bf5279fb4ba.1470127858.git.liezhi.yang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Aug 2016 07:43:37 -0700
Message-ID: <CAMKF1spQ5gP-78DTTK8+jvkJFx6WSF9YQKw8+Jv7xvrRqNYYQQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] strace: 4.12 -> 4.13
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
X-List-Received-Date: Sun, 07 Aug 2016 14:44:10 -0000
Content-Type: text/plain; charset=UTF-8

this broke musl/mips64 see

http://errors.yoctoproject.org/Errors/Details/74499/

On Tue, Aug 2, 2016 at 1:51 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> Updated Makefile-ptest.patch
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-devtools/strace/strace/Makefile-ptest.patch     | 12 ++++--------
>  .../strace/{strace_4.12.bb => strace_4.13.bb}                |  4 ++--
>  2 files changed, 6 insertions(+), 10 deletions(-)
>  rename meta/recipes-devtools/strace/{strace_4.12.bb => strace_4.13.bb} (91%)
>
> diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
> index 824031e..2b76e8a 100644
> --- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
> +++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
> @@ -10,23 +10,22 @@ Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
>   2 files changed, 19 insertions(+), 1 deletion(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 0209bac..b969e25 100644
>  --- a/configure.ac
>  +++ b/configure.ac
>  @@ -36,7 +36,7 @@ AC_INIT([strace],
>   AC_CONFIG_SRCDIR([strace.c])
>   AC_CONFIG_AUX_DIR([.])
>   AC_CONFIG_HEADERS([config.h])
> --AM_INIT_AUTOMAKE([foreign nostdinc dist-xz no-dist-gzip silent-rules parallel-tests])
> -+AM_INIT_AUTOMAKE([foreign nostdinc dist-xz no-dist-gzip silent-rules serial-tests])
> +-AM_INIT_AUTOMAKE([foreign nostdinc dist-xz silent-rules parallel-tests])
> ++AM_INIT_AUTOMAKE([foreign nostdinc dist-xz silent-rules serial-tests])
>   AM_MAINTAINER_MODE
>   AC_CANONICAL_HOST
>
>  diff --git a/tests/Makefile.am b/tests/Makefile.am
> -index 0f23b4b..429f7e9 100644
> +index 9023029..e1917fa 100644
>  --- a/tests/Makefile.am
>  +++ b/tests/Makefile.am
> -@@ -332,3 +332,21 @@ ksysent.h: $(srcdir)/ksysent.sed
> +@@ -784,3 +784,21 @@ ksysent.h: $(srcdir)/ksysent.sed
>
>   BUILT_SOURCES = ksysent.h
>   CLEANFILES = ksysent.h $(TESTS:=.tmp)
> @@ -48,6 +47,3 @@ index 0f23b4b..429f7e9 100644
>  +              sed -i -e 's/$${srcdir=.}/./g' $(DESTDIR)/$(TESTDIR)/$$file; \
>  +      done
>  +      for i in net net-fd scm_rights-fd sigaction; do sed -i -e 's/$$srcdir/./g' $(DESTDIR)/$(TESTDIR)/$$i.test; done
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-devtools/strace/strace_4.12.bb b/meta/recipes-devtools/strace/strace_4.13.bb
> similarity index 91%
> rename from meta/recipes-devtools/strace/strace_4.12.bb
> rename to meta/recipes-devtools/strace/strace_4.13.bb
> index 70d7402..1a576b3 100644
> --- a/meta/recipes-devtools/strace/strace_4.12.bb
> +++ b/meta/recipes-devtools/strace/strace_4.13.bb
> @@ -14,8 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
>             file://0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch \
>             "
>
> -SRC_URI[md5sum] = "efb8611fc332e71ec419c53f59faa93e"
> -SRC_URI[sha256sum] = "51144b78cb9ba22211b95a5aafe0af3694c0d575b25975d80ca9dd4dfd7c1e59"
> +SRC_URI[md5sum] = "4b78c7febdd24c79d5147824d1a080a3"
> +SRC_URI[sha256sum] = "d48f732576c91ece36a5843d63f9be054c40ef59f1e4773986042636861625d7"
>
>  inherit autotools ptest bluetooth
>
> --
> 2.9.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

