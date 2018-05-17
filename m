Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8DCC1748A7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 10:17:31 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id 144-v6so8057432iti.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 03:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Tj5P3ol2n3tlWOWo3IsnvNYBOBhRMksKWx2ZwfuMTgc=;
	b=Myz0Xh1ThcAXFGG7E+uBkbAQq0gknUyYjVzJisUMzRAuyB4betqwOlzOlBzUx5r2XU
	rBzDiCa8Qwhs04ryv4EUXgQyfUlieD75ezC0CMZZjec8wB9mbrADV7YlWVHTHvJGSa9K
	aIWpErszmBdH8hKle5d/40g5GQmsZfFw3rIDbcSH15wRRxDhUOgRxW1dlJariokeB5HE
	saKEylSeb+CC+KNX6rgtddr1/1k2TMXGYIWAQlX5WWmBtmn4HZeSf1m1w71D/bO92DB6
	ZB5/xh6VfwST3MMfwdWey6O6ipDPith54AXSKVwwZlD8sKcf2cSMAmb9Qr1fNwHysPK7
	eoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Tj5P3ol2n3tlWOWo3IsnvNYBOBhRMksKWx2ZwfuMTgc=;
	b=FxwgRLDXlkjHmi7ty2at3abCg/9DhzRtbRJCwcjeUEF2cLbOCzV/65Uwv3P3udPtC1
	PzdDElcx0WUGjSTVZGDT/tm0TByK0TZop30vvOW5WAV01igcKxzxuskyEfQh7CVtPkhm
	bxJ8IelZ68AAmQQZxq2KK9cnwWoRqPZbBaMMwzQf/O9GrMKK9YQUiEHez2mG5L9frwko
	gamKKQI3r14ITnW08hguKtdVw02uVSjTFyXgh1k4cFqMeQEJ1ZpjFYg/kAvANeJa1lEc
	0x7vsCwc0ksqiMp/QSIeM5gf9bIktBREyM3oNwkTjSla3ZPxIh+FflEjWDZPcypwY+3I
	np9Q==
X-Gm-Message-State: ALKqPwc33AQw3i1OcU1U6wffN2HqPUWaZlPhDbThT3j1BAk8X+1P1h/2
	Q7XNvwk8vtmi/GpKsGHorUSBl6zcGBhgBXpOmZDc0g==
X-Google-Smtp-Source: AB8JxZrniSNxbMKnMSEstcODqcoAD588iNRqFGojtp7pwjfSYXKZGUVIHgwLPvbnVRuY1RBCcDSLx0xKUDcyCqE/l0A=
X-Received: by 2002:a24:d2c4:: with SMTP id
	z187-v6mr2022429itf.60.1526552252308; 
	Thu, 17 May 2018 03:17:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Thu, 17 May 2018 03:17:11 -0700 (PDT)
In-Reply-To: <071e32634705a36ce4132ab884b3cf11079b4d37.1526452205.git.raj.khem@gmail.com>
References: <cover.1526452205.git.raj.khem@gmail.com>
	<071e32634705a36ce4132ab884b3cf11079b4d37.1526452205.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 May 2018 11:17:11 +0100
Message-ID: <CAJTo0Lbcs8uy6hujw7S9GHR6fnEX11wUZh2tz37_2fusw9iNFQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] ovmf: Fix build with gcc8
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
X-List-Received-Date: Thu, 17 May 2018 10:17:31 -0000
Content-Type: text/plain; charset="UTF-8"

Even when I pick from the branch instead of the mail, I suspect the
line endings are messed up and this won't apply.  Can you
double-check?

(I *hate* the ovmf recipe for this reason and am very tempted to just
run dos2unix over the tree after unpack!)

Ross

On 16 May 2018 at 07:32, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ....makefile-add-Wno-stringop-truncatio.patch |  73 ++++++++++++
>  ...ols-header.makefile-add-Wno-restrict.patch | 104 ++++++++++++++++++
>  ....makefile-revert-gcc-8-Wno-xxx-optio.patch |  55 +++++++++
>  ...-silence-false-stringop-overflow-war.patch |  65 +++++++++++
>  meta/recipes-core/ovmf/ovmf_git.bb            |   4 +
>  5 files changed, 301 insertions(+)
>  create mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-header.makefile-add-Wno-stringop-truncatio.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/0002-BaseTools-header.makefile-add-Wno-restrict.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/0003-BaseTools-header.makefile-revert-gcc-8-Wno-xxx-optio.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/0004-BaseTools-GenVtf-silence-false-stringop-overflow-war.patch
>
> diff --git a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-header.makefile-add-Wno-stringop-truncatio.patch b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-header.makefile-add-Wno-stringop-truncatio.patch
> new file mode 100644
> index 0000000000..1d1679fe7e
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-header.makefile-add-Wno-stringop-truncatio.patch
> @@ -0,0 +1,73 @@
> +From 9fce4bab014b9aa618060eba13d6dd04b0fa1b70 Mon Sep 17 00:00:00 2001
> +From: Laszlo Ersek <lersek@redhat.com>
> +Date: Fri, 2 Mar 2018 17:11:52 +0100
> +Subject: [PATCH 1/4] BaseTools/header.makefile: add "-Wno-stringop-truncation"
> +
> +gcc-8 (which is part of Fedora 28) enables the new warning
> +"-Wstringop-truncation" in "-Wall". This warning is documented in detail
> +at <https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html>; the
> +introduction says
> +
> +> Warn for calls to bounded string manipulation functions such as strncat,
> +> strncpy, and stpncpy that may either truncate the copied string or leave
> +> the destination unchanged.
> +
> +It breaks the BaseTools build with:
> +
> +> EfiUtilityMsgs.c: In function 'PrintMessage':
> +> EfiUtilityMsgs.c:484:9: error: 'strncat' output may be truncated copying
> +> between 0 and 511 bytes from a string of length 511
> +> [-Werror=stringop-truncation]
> +>          strncat (Line, Line2, MAX_LINE_LEN - strlen (Line) - 1);
> +>          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +> EfiUtilityMsgs.c:469:9: error: 'strncat' output may be truncated copying
> +> between 0 and 511 bytes from a string of length 511
> +> [-Werror=stringop-truncation]
> +>          strncat (Line, Line2, MAX_LINE_LEN - strlen (Line) - 1);
> +>          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +> EfiUtilityMsgs.c:511:5: error: 'strncat' output may be truncated copying
> +> between 0 and 511 bytes from a string of length 511
> +> [-Werror=stringop-truncation]
> +>      strncat (Line, Line2, MAX_LINE_LEN - strlen (Line) - 1);
> +>      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The right way to fix the warning would be to implement string concat with
> +snprintf(). However, Microsoft does not appear to support snprintf()
> +before VS2015
> +<https://stackoverflow.com/questions/2915672/snprintf-and-visual-studio-2010>,
> +so we just have to shut up the warning. The strncat() calls flagged above
> +are valid BTW.
> +
> +Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> +Cc: Cole Robinson <crobinso@redhat.com>
> +Cc: Liming Gao <liming.gao@intel.com>
> +Cc: Paolo Bonzini <pbonzini@redhat.com>
> +Cc: Yonghong Zhu <yonghong.zhu@intel.com>
> +Contributed-under: TianoCore Contribution Agreement 1.1
> +Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> +Reviewed-by: Liming Gao <liming.gao@intel.com>
> +---
> +Upstream-Status: Backport
> +
> + BaseTools/Source/C/Makefiles/header.makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/BaseTools/Source/C/Makefiles/header.makefile b/BaseTools/Source/C/Makefiles/header.makefile
> +index 063982b82f..6c3826aecb 100644
> +--- a/BaseTools/Source/C/Makefiles/header.makefile
> ++++ b/BaseTools/Source/C/Makefiles/header.makefile
> +@@ -47,9 +47,9 @@ INCLUDE = $(TOOL_INCLUDE) -I $(MAKEROOT) -I $(MAKEROOT)/Include/Common -I $(MAKE
> + BUILD_CPPFLAGS = $(INCLUDE) -O2
> + ifeq ($(DARWIN),Darwin)
> + # assume clang or clang compatible flags on OS X
> +-BUILD_CFLAGS = -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-declarations -Wno-self-assign -Wno-unused-result -nostdlib -c -g
> ++BUILD_CFLAGS = -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-declarations -Wno-stringop-truncation -Wno-self-assign -Wno-unused-result -nostdlib -c -g
> + else
> +-BUILD_CFLAGS = -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-declarations -Wno-unused-result -nostdlib -c -g
> ++BUILD_CFLAGS = -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-declarations -Wno-stringop-truncation -Wno-unused-result -nostdlib -c -g
> + endif
> + BUILD_LFLAGS =
> + BUILD_CXXFLAGS = -Wno-unused-result
> +--
> +2.17.0
> +
> diff --git a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-header.makefile-add-Wno-restrict.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-header.makefile-add-Wno-restrict.patch
> new file mode 100644
> index 0000000000..4a25e230ce
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-header.makefile-add-Wno-restrict.patch
> @@ -0,0 +1,104 @@
> +From 86dbdac5a25bd23deb4a0e0a97b527407e02184d Mon Sep 17 00:00:00 2001
> +From: Laszlo Ersek <lersek@redhat.com>
> +Date: Fri, 2 Mar 2018 17:11:52 +0100
> +Subject: [PATCH 2/4] BaseTools/header.makefile: add "-Wno-restrict"
> +
> +gcc-8 (which is part of Fedora 28) enables the new warning
> +"-Wrestrict" in "-Wall". This warning is documented in detail
> +at <https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html>; the
> +introduction says
> +
> +> Warn when an object referenced by a restrict-qualified parameter (or, in
> +> C++, a __restrict-qualified parameter) is aliased by another argument,
> +> or when copies between such objects overlap.
> +
> +It breaks the BaseTools build (in the Brotli compression library) with:
> +
> +> In function 'ProcessCommandsInternal',
> +>     inlined from 'ProcessCommands' at dec/decode.c:1828:10:
> +> dec/decode.c:1781:9: error: 'memcpy' accessing between 17 and 2147483631
> +> bytes at offsets 16 and 16 overlaps between 17 and 2147483631 bytes at
> +> offset 16 [-Werror=restrict]
> +>          memcpy(copy_dst + 16, copy_src + 16, (size_t)(i - 16));
> +>          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +> In function 'ProcessCommandsInternal',
> +>     inlined from 'SafeProcessCommands' at dec/decode.c:1833:10:
> +> dec/decode.c:1781:9: error: 'memcpy' accessing between 17 and 2147483631
> +> bytes at offsets 16 and 16 overlaps between 17 and 2147483631 bytes at
> +> offset 16 [-Werror=restrict]
> +>          memcpy(copy_dst + 16, copy_src + 16, (size_t)(i - 16));
> +>          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Paolo Bonzini <pbonzini@redhat.com> analyzed the Brotli source in detail,
> +and concluded that the warning is a false positive:
> +
> +> This seems safe to me, because it's preceded by:
> +>
> +>     uint8_t* copy_dst = &s->ringbuffer[pos];
> +>     uint8_t* copy_src = &s->ringbuffer[src_start];
> +>     int dst_end = pos + i;
> +>     int src_end = src_start + i;
> +>     if (src_end > pos && dst_end > src_start) {
> +>       /* Regions intersect. */
> +>       goto CommandPostWrapCopy;
> +>     }
> +>
> +> If [src_start, src_start + i) and [pos, pos + i) don't intersect, then
> +> neither do [src_start + 16, src_start + i) and [pos + 16, pos + i).
> +>
> +> The if seems okay:
> +>
> +>        (src_start + i > pos && pos + i > src_start)
> +>
> +> which can be rewritten to:
> +>
> +>        (pos < src_start + i && src_start < pos + i)
> +>
> +> Then the numbers are in one of these two orders:
> +>
> +>      pos <= src_start < pos + i <= src_start + i
> +>      src_start <= pos < src_start + i <= pos + i
> +>
> +> These two would be allowed by the "if", but they can only happen if pos
> +> == src_start so they degenerate to the same two orders above:
> +>
> +>      pos <= src_start < src_start + i <= pos + i
> +>      src_start <= pos < pos + i <= src_start + i
> +>
> +> So it is a false positive in GCC.
> +
> +Disable the warning for now.
> +
> +Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> +Cc: Cole Robinson <crobinso@redhat.com>
> +Cc: Liming Gao <liming.gao@intel.com>
> +Cc: Paolo Bonzini <pbonzini@redhat.com>
> +Cc: Yonghong Zhu <yonghong.zhu@intel.com>
> +Reported-by: Cole Robinson <crobinso@redhat.com>
> +Contributed-under: TianoCore Contribution Agreement 1.1
> +Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> +Reviewed-by: Liming Gao <liming.gao@intel.com>
> +---
> +Upstream-Status: Backport
> + BaseTools/Source/C/Makefiles/header.makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/BaseTools/Source/C/Makefiles/header.makefile b/BaseTools/Source/C/Makefiles/header.makefile
> +index 6c3826aecb..3feae10095 100644
> +--- a/BaseTools/Source/C/Makefiles/header.makefile
> ++++ b/BaseTools/Source/C/Makefiles/header.makefile
> +@@ -47,9 +47,9 @@ INCLUDE = $(TOOL_INCLUDE) -I $(MAKEROOT) -I $(MAKEROOT)/Include/Common -I $(MAKE
> + BUILD_CPPFLAGS = $(INCLUDE) -O2
> + ifeq ($(DARWIN),Darwin)
> + # assume clang or clang compatible flags on OS X
> +-BUILD_CFLAGS = -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-declarations -Wno-stringop-truncation -Wno-self-assign -Wno-unused-result -nostdlib -c -g
> ++BUILD_CFLAGS = -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-declarations -Wno-stringop-truncation -Wno-restrict -Wno-self-assign -Wno-unused-result -nostdlib -c -g
> + else
> +-BUILD_CFLAGS = -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-declarations -Wno-stringop-truncation -Wno-unused-result -nostdlib -c -g
> ++BUILD_CFLAGS = -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-declarations -Wno-stringop-truncation -Wno-restrict -Wno-unused-result -nostdlib -c -g
> + endif
> + BUILD_LFLAGS =
> + BUILD_CXXFLAGS = -Wno-unused-result
> +--
> +2.17.0
> +
> diff --git a/meta/recipes-core/ovmf/ovmf/0003-BaseTools-header.makefile-revert-gcc-8-Wno-xxx-optio.patch b/meta/recipes-core/ovmf/ovmf/0003-BaseTools-header.makefile-revert-gcc-8-Wno-xxx-optio.patch
> new file mode 100644
> index 0000000000..19f32e7cee
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/0003-BaseTools-header.makefile-revert-gcc-8-Wno-xxx-optio.patch
> @@ -0,0 +1,55 @@
> +From 6866325dd9c17412e555974dde41f9631224db52 Mon Sep 17 00:00:00 2001
> +From: Laszlo Ersek <lersek@redhat.com>
> +Date: Wed, 7 Mar 2018 10:17:28 +0100
> +Subject: [PATCH 3/4] BaseTools/header.makefile: revert gcc-8 "-Wno-xxx"
> + options on OSX
> +
> +I recently added the gcc-8 specific "-Wno-stringop-truncation" and
> +"-Wno-restrict" options to BUILD_CFLAGS, both for "Darwin" (XCODE5 /
> +clang, OSX) and otherwise (gcc, Linux / Cygwin).
> +
> +I also regression-tested the change with gcc-4.8 on Linux -- gcc-4.8 does
> +not know either of the (gcc-8 specific) "-Wno-stringop-truncation" and
> +"-Wno-restrict" options, yet the build completed fine (by GCC design).
> +
> +Regarding OSX, my expectation was that
> +
> +- XCODE5 / clang would either recognize these warnings options (because
> +  clang does recognize most -W options of gcc),
> +
> +- or, similarly to gcc, clang would simply ignore the "-Wno-xxx" flags
> +  that it didn't recognize.
> +
> +Neither is the case; the new flags have broken the BaseTools build on OSX.
> +Revert them (for OSX only).
> +
> +Cc: Liming Gao <liming.gao@intel.com>
> +Cc: Yonghong Zhu <yonghong.zhu@intel.com>
> +Reported-by: Liming Gao <liming.gao@intel.com>
> +Fixes: 1d212a83df0eaf32a6f5d4159beb2d77832e0231
> +Fixes: 9222154ae7b3eef75ae88cdb56158256227cb929
> +Contributed-under: TianoCore Contribution Agreement 1.1
> +Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> +Reviewed-by: Liming Gao <liming.gao@intel.com>
> +Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> +---
> +Upstream-Status: Backport
> + BaseTools/Source/C/Makefiles/header.makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/BaseTools/Source/C/Makefiles/header.makefile b/BaseTools/Source/C/Makefiles/header.makefile
> +index 3feae10095..6eefddb417 100644
> +--- a/BaseTools/Source/C/Makefiles/header.makefile
> ++++ b/BaseTools/Source/C/Makefiles/header.makefile
> +@@ -47,7 +47,7 @@ INCLUDE = $(TOOL_INCLUDE) -I $(MAKEROOT) -I $(MAKEROOT)/Include/Common -I $(MAKE
> + BUILD_CPPFLAGS = $(INCLUDE) -O2
> + ifeq ($(DARWIN),Darwin)
> + # assume clang or clang compatible flags on OS X
> +-BUILD_CFLAGS = -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-declarations -Wno-stringop-truncation -Wno-restrict -Wno-self-assign -Wno-unused-result -nostdlib -c -g
> ++BUILD_CFLAGS = -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-declarations -Wno-self-assign -Wno-unused-result -nostdlib -c -g
> + else
> + BUILD_CFLAGS = -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror -Wno-deprecated-declarations -Wno-stringop-truncation -Wno-restrict -Wno-unused-result -nostdlib -c -g
> + endif
> +--
> +2.17.0
> +
> diff --git a/meta/recipes-core/ovmf/ovmf/0004-BaseTools-GenVtf-silence-false-stringop-overflow-war.patch b/meta/recipes-core/ovmf/ovmf/0004-BaseTools-GenVtf-silence-false-stringop-overflow-war.patch
> new file mode 100644
> index 0000000000..5fd4e9d573
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/0004-BaseTools-GenVtf-silence-false-stringop-overflow-war.patch
> @@ -0,0 +1,65 @@
> +From dfb42a5bff78d9239a80731e337855234badef3e Mon Sep 17 00:00:00 2001
> +From: Laszlo Ersek <lersek@redhat.com>
> +Date: Fri, 2 Mar 2018 17:11:52 +0100
> +Subject: [PATCH 4/4] BaseTools/GenVtf: silence false "stringop-overflow"
> + warning with memcpy()
> +
> +gcc-8 (which is part of Fedora 28) enables the new warning
> +"-Wstringop-overflow" in "-Wall". This warning is documented in detail at
> +<https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html>; the
> +introduction says
> +
> +> Warn for calls to string manipulation functions such as memcpy and
> +> strcpy that are determined to overflow the destination buffer.
> +
> +It breaks the BaseTools build with:
> +
> +> GenVtf.c: In function 'ConvertVersionInfo':
> +> GenVtf.c:132:7: error: 'strncpy' specified bound depends on the length
> +> of the source argument [-Werror=stringop-overflow=]
> +>        strncpy (TemStr + 4 - Length, Str, Length);
> +>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +> GenVtf.c:130:14: note: length computed here
> +>      Length = strlen(Str);
> +>               ^~~~~~~~~~~
> +
> +It is a false positive because, while the bound equals the length of the
> +source argument, the destination pointer is moved back towards the
> +beginning of the destination buffer by the same amount (and this amount is
> +range-checked first, so we can't precede the start of the dest buffer).
> +
> +Replace both strncpy() calls with memcpy().
> +
> +Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> +Cc: Cole Robinson <crobinso@redhat.com>
> +Cc: Liming Gao <liming.gao@intel.com>
> +Cc: Paolo Bonzini <pbonzini@redhat.com>
> +Cc: Yonghong Zhu <yonghong.zhu@intel.com>
> +Reported-by: Cole Robinson <crobinso@redhat.com>
> +Contributed-under: TianoCore Contribution Agreement 1.1
> +Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> +Reviewed-by: Liming Gao <liming.gao@intel.com>
> +---
> +Upstream-Status: Backport
> + BaseTools/Source/C/GenVtf/GenVtf.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/BaseTools/Source/C/GenVtf/GenVtf.c b/BaseTools/Source/C/GenVtf/GenVtf.c
> +index 2ae9a7be2c..0cd33e71e9 100644
> +--- a/BaseTools/Source/C/GenVtf/GenVtf.c
> ++++ b/BaseTools/Source/C/GenVtf/GenVtf.c
> +@@ -129,9 +129,9 @@ Returns:
> +   } else {
> +     Length = strlen(Str);
> +     if (Length < 4) {
> +-      strncpy (TemStr + 4 - Length, Str, Length);
> ++      memcpy (TemStr + 4 - Length, Str, Length);
> +     } else {
> +-      strncpy (TemStr, Str + Length - 4, 4);
> ++      memcpy (TemStr, Str + Length - 4, 4);
> +     }
> +
> +     sscanf (
> +--
> +2.17.0
> +
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
> index 8750b3c528..212530acbf 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -19,6 +19,10 @@ SRC_URI = "git://github.com/tianocore/edk2.git;branch=master \
>         file://0004-ovmf-enable-long-path-file.patch \
>         file://VfrCompile-increase-path-length-limit.patch \
>         file://no-stack-protector-all-archs.patch \
> +       file://0001-BaseTools-header.makefile-add-Wno-stringop-truncatio.patch \
> +       file://0002-BaseTools-header.makefile-add-Wno-restrict.patch \
> +       file://0003-BaseTools-header.makefile-revert-gcc-8-Wno-xxx-optio.patch \
> +       file://0004-BaseTools-GenVtf-silence-false-stringop-overflow-war.patch \
>          "
>  UPSTREAM_VERSION_UNKNOWN = "1"
>
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

