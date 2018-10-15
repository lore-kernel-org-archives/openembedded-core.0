Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 086BD60401
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 12:58:42 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id u22so18732346ota.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 05:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Z9UlGifnhuoDxr2nTVS2zfxNFvVO4mAT22Dd5u2igWQ=;
	b=pto28MlGA6f2eHuh5Y03MOcQyDZx312oP97yTi04hvj2aqcVST/EzjqsVUhUf5cGb4
	oGN2wmaRfA1xnAUOWOBzEQN1t5jon84sT7tn8Cf0Dfa4EdhZc4ZWYZOhpj/O1CviJDB8
	fMEPSS8OxSiNJTVbEvmr6CKPCHLLOyZe7k93Njr3IaNRL3AdBKFLDA3XYlH+m+erTr4j
	NcfCOxkzL/o9L3EdR1gkYFA/7vYC8qo0IaFXsuq63bn4ji26iwVbIk7LeGYTyauHCp5/
	O9LBq7uZijUoVrkbj2k84W6xy2bnNofWcBCqZv41fPlMFz/Hkebfal2KJ8oeEPj4Ok6B
	qDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Z9UlGifnhuoDxr2nTVS2zfxNFvVO4mAT22Dd5u2igWQ=;
	b=anTIapNiQHSFqi6qbKAhx4fsZigGWRyaZ7VAoYB68YukWLkrHr7khfwrdGHs8lyw0U
	Ttuj22wmgjFGIlixZJIwD19SvMXP/nPEHzmDLDv4pK2Ti7JaXmDkbEciX9s+WtyTj8Po
	0LLZ0GBf6vSL9Hnw9ZtDIvTOkBYq495rE4/0sf9/75o4raWcLczI2XTpiLBQ+2ThN2+g
	PczZWpWLOWbKdpgdaJoLHpLcoFCVlt/m6QpXE89F4mYvDED4OSFPmMTNjIkmMP47wtlq
	3DsZRp72JOyiMyTf8ILKJqM1nZIZ9w0bOcY6XxDScAIxhuJgNau+BoD6FhHFjnz51B1c
	jTNw==
X-Gm-Message-State: ABuFfojdi1JtLryC7J8gkdDw6hryKE8Edb/gH+I6UiYpx2p5NRngROIb
	+pf92E1+Ss8zpEJAr1vRclXH2uSz9TSN/zUDoTkaJg==
X-Google-Smtp-Source: ACcGV61HDfxzEvvkxYSo42oE21kR8tfHTvaggVbfKND8LDw/vA1sy2hdNYyUZd7KXb6a8KavN6NTqdurBwhRcVUh28I=
X-Received: by 2002:a9d:3ee4:: with SMTP id b91mr11322501otc.330.1539608323895;
	Mon, 15 Oct 2018 05:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <1539581457-120937-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1539581457-120937-1-git-send-email-changqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Oct 2018 13:58:32 +0100
Message-ID: <CAJTo0LZ+U1t=rnLcrZMDD+AoS-SbJ23Hc1fd9twa4qRFh=N1sQ@mail.gmail.com>
To: changqing.li@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] freetype: remove compile of windows resource files
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
X-List-Received-Date: Mon, 15 Oct 2018 12:58:43 -0000
Content-Type: text/plain; charset="UTF-8"

Is this breaking the build of Freetype for mingw32?  Seems like it
would be easier change meta-mingw to just export RC in the SDK
environment using overrides.

Ross
On Mon, 15 Oct 2018 at 06:32, <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> remove compile of windows resource file to fix compile
> fail problem of freetype when build windows sdk.
>
> when build windows sdk, include meta-mingw layer, and
> SDKMACHINE set to i686-mingw32, meta-mingw have
> export variable RC, and from freetype 3.29, it add better
> support to  build FreeType  as  a DLL  on Windows  using
> Visual C, but we don't need this. so remove it.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  ...-remove-compile-of-windows-resource-files.patch | 71 ++++++++++++++++++++++
>  meta/recipes-graphics/freetype/freetype_2.9.1.bb   |  1 +
>  2 files changed, 72 insertions(+)
>  create mode 100644 meta/recipes-graphics/freetype/freetype/0001-freetype-remove-compile-of-windows-resource-files.patch
>
> diff --git a/meta/recipes-graphics/freetype/freetype/0001-freetype-remove-compile-of-windows-resource-files.patch b/meta/recipes-graphics/freetype/freetype/0001-freetype-remove-compile-of-windows-resource-files.patch
> new file mode 100644
> index 0000000..2daba28
> --- /dev/null
> +++ b/meta/recipes-graphics/freetype/freetype/0001-freetype-remove-compile-of-windows-resource-files.patch
> @@ -0,0 +1,71 @@
> +From b6c1c1c96006452873132db1b15e2d0b9576a7fb Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Mon, 15 Oct 2018 11:25:23 +0800
> +Subject: [PATCH] freetype: remove compile of windows resource files
> +
> +remove compile of windows resource file to fix compile
> +fail problem of freetype when build windows sdk.
> +
> +when build windows sdk, include meta-mingw, and
> +SDKMACHINE set to i686-mingw32, meta-mingw have
> +export variable RC, and from freetype 3.29, it add better
> +support to  build FreeType  as  a DLL  on Windows  using
> +Visual C, but we don't need this. so remove it.
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + builds/freetype.mk     | 17 -----------------
> + builds/unix/unix-cc.in |  7 -------
> + 2 files changed, 24 deletions(-)
> +
> +diff --git a/builds/freetype.mk b/builds/freetype.mk
> +index 6f68a0f..4287869 100644
> +--- a/builds/freetype.mk
> ++++ b/builds/freetype.mk
> +@@ -247,23 +247,6 @@ OBJECTS_LIST += $(FTINIT_OBJ)
> + $(FTINIT_OBJ): $(FTINIT_SRC) $(FREETYPE_H)
> +       $(FT_COMPILE) $T$(subst /,$(COMPILER_SEP),$@ $<)
> +
> +-
> +-# ftver component
> +-#
> +-#  The VERSIONINFO resource `ftver.rc' contains version and copyright
> +-#  to be compiled by windres and tagged into DLL usually.
> +-#
> +-ifneq ($(RC),)
> +-  FTVER_SRC := $(BASE_DIR)/ftver.rc
> +-  FTVER_OBJ := $(OBJ_DIR)/ftver.$O
> +-
> +-  OBJECTS_LIST += $(FTVER_OBJ)
> +-
> +-  $(FTVER_OBJ): $(FTVER_SRC)
> +-      $(RC) -o $@ $<
> +-endif
> +-
> +-
> + # All FreeType library objects.
> + #
> + OBJ_M := $(BASE_OBJ_M) $(BASE_EXT_OBJ) $(DRV_OBJS_M)
> +diff --git a/builds/unix/unix-cc.in b/builds/unix/unix-cc.in
> +index b24c408..603897c 100644
> +--- a/builds/unix/unix-cc.in
> ++++ b/builds/unix/unix-cc.in
> +@@ -90,13 +90,6 @@ ANSIFLAGS := @XX_ANSIFLAGS@
> + CCraw := $(CC)
> + CC    := $(LIBTOOL) --mode=compile $(CCraw)
> +
> +-# Resource compiler to use on Cygwin/MinGW, usually windres.
> +-#
> +-RCraw := @RC@
> +-ifneq ($(RCraw),)
> +-  RC := $(LIBTOOL) --tag=RC --mode=compile $(RCraw)
> +-endif
> +-
> + # Linker flags.
> + #
> + LDFLAGS           := @LDFLAGS@
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-graphics/freetype/freetype_2.9.1.bb b/meta/recipes-graphics/freetype/freetype_2.9.1.bb
> index 1e6f66e..b7d090d 100644
> --- a/meta/recipes-graphics/freetype/freetype_2.9.1.bb
> +++ b/meta/recipes-graphics/freetype/freetype_2.9.1.bb
> @@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=4af6221506f202774ef74f64932878a1
>
>  SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
>             file://use-right-libtool.patch \
> +           file://0001-freetype-remove-compile-of-windows-resource-files.patch \
>            "
>
>  UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/freetype/files/freetype2/"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

