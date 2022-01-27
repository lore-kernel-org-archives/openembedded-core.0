Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E154C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 21:01:58 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web09.3839.1643317317157443114
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 13:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YJps2Eit;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id 200so3813904qki.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 13:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JiCIeNxUSN2JGxgoJ4qnfDzYc+SrMaLx0jCAx3JXukU=;
        b=YJps2Eit/p+SsI+SYwxeJEyZu9VEsUoq/K+HE2MU3s7ocywy1R7LM0wHdVqYuz7nkO
         FLvfI1TQ7sHtJI6oDCPNtQ2Z58c2/z8WqJTLKbPs93W08tV+hr7HDxebWBUIxeqCAg1B
         qIwm7EsvgQZV64/GhPhTIKC3vNSfEPgqScipA+BYnjUEkzAwvPZnKD5hH77gtPexs0vM
         RomEt9STRT05HsxaYWYsyft/+bRCW9b9MckU/ckQNDDWuVHBsmfYfbOh5WKOVYQMJVzH
         htplD5VL+Li2zMf53bv+hNnMsKCnLY2O2FeRq9w3SzNkHd0YVrXZ/VlwVUextfJILACI
         EncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JiCIeNxUSN2JGxgoJ4qnfDzYc+SrMaLx0jCAx3JXukU=;
        b=YblbV815QwDFTnDsQ/r9fW1sgCSLr4afSJXAyZHBBLMO2LaFwUEEmTl9BAwZpiu3Xe
         DHjZS9K+pH990jwUYoakYSmmAaNet3Y217Lwpq3B6cemL+ShqKqO/Z3bi00IWLR8tAyW
         fgKtIMq6MKvXP2B7w43d2Jd9lL1gzFxXKGo85OGQfWC3qo46NDI7PnL96cI91K0c84VA
         er7cmUct3KQ5U+oIR4oIGKo8Bawm5Eg0nHRj4Jzc+slkQ8KMKX0ky1AdcpfunFQIeQ+E
         4ySNbK1fZ3kOBUOOfjpVlL6nZw8ATP4YNbmi0cUTAT30sDSa54ZONmP+UqVRCOn9VSdp
         5WVA==
X-Gm-Message-State: AOAM530WbNfpMWT3ZPreS3b3cOTZ6lBgX4H374mWXzj+cMTcsTJ/tMsV
	F+5dJQQNtfWHZrVanLVgmJY3Efw0HnozMWdwx5U=
X-Google-Smtp-Source: 
 ABdhPJyk/ssz5gWqiF8D/wpUQNYH+83BYyTYVQ0lfb9OUpTCX0NN3/f6ZEytoMcoqciWu7NuzJqh42NGgm+4lKUUmzQ=
X-Received: by 2002:a37:6493:: with SMTP id
 y141mr3876588qkb.180.1643317316141;
 Thu, 27 Jan 2022 13:01:56 -0800 (PST)
MIME-Version: 1.0
References: <20220127102005.3050843-1-alex@linutronix.de>
 <20220127102005.3050843-11-alex@linutronix.de>
 <CAMKF1sq7fqtf8ShGYhu7MnyYMuNse6wx29xo2WzzheawKJ0fSQ@mail.gmail.com>
 <16CE388D38E12D03.16917@lists.openembedded.org>
 <CANNYZj9WaCo8vm_BD2fW2i7W-1uAZFPAs88OznouZ3+dEavsyw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9WaCo8vm_BD2fW2i7W-1uAZFPAs88OznouZ3+dEavsyw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jan 2022 13:01:45 -0800
Message-ID: 
 <CAMKF1sqov5GWhnBHwzUhF2aO1QUYhB4SMHaXJ5JgbYd+qhtQ5g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 11/17] zstd: update 1.5.0 -> 1.5.2
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>,
 Joshua Watt <JPEWhacker@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e1c58605d696a0e8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 21:01:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161057

--000000000000e1c58605d696a0e8
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 27, 2022 at 12:10 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> I think zstd changelog for 1.5.1 settles the issue:
>
> https://github.com/facebook/zstd/releases/tag/v1.5.1
>

Yeah indeed

 thanks

>
> Alex
>
> On Thu, 27 Jan 2022 at 20:51, Alexander Kanavin via lists.openembedded.org
> <alex.kanavin=gmail.com@lists.openembedded.org> wrote:
>
>> On Thu, 27 Jan 2022 at 19:56, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> quick look shows that size of zstd package reduces quite a bit, I wonder
>>> why
>>>
>>>   -4720   KiB zstd
>>>   +2932   KiB zstd
>>>
>>> small is ofcourse better, but I wonder what could reduce it so much
>>> between 1.5.0 and 1.5.2
>>>
>>
>> buildhistory-diff does not reveal anything fishy:
>>
>> alex@nereus:~/development/poky/build-64-alt$ buildhistory-diff
>> Changes to packages/core2-64-poky-linux/zstd (sysroot):
>>   /usr/lib/libzstd.so.1 changed symlink target from libzstd.so.1.5.0 to
>> libzstd.so.1.5.2
>>   /usr/lib/libzstd.so changed symlink target from libzstd.so.1.5.0 to
>> libzstd.so.1.5.2
>>   /usr/lib/libzstd.so.1.5.0 moved to /usr/lib/libzstd.so.1.5.2
>> packages/core2-64-poky-linux/zstd/zstd-dbg: PKGSIZE changed from 23736192
>> to 16994448 (-28%)
>> packages/core2-64-poky-linux/zstd/zstd-src: PKGSIZE changed from 2741079
>> to 3050284 (+11%)
>> packages/core2-64-poky-linux/zstd/zstd-staticdev: PKGSIZE changed from
>> 9332966 to 6596796 (-29%)
>> packages/core2-64-poky-linux/zstd/zstd: PKGSIZE changed from 3279119 to
>> 2407719 (-27%)
>> packages/core2-64-poky-linux/zstd/zstd: FILELIST: removed
>> "/usr/lib/libzstd.so.1.5.0", added "/usr/lib/libzstd.so.1.5.2"
>> Changes to packages/x86_64-linux/zstd-native (sysroot):
>>   /usr/lib/libzstd.so.1 changed symlink target from libzstd.so.1.5.0 to
>> libzstd.so.1.5.2
>>   /usr/lib/libzstd.so changed symlink target from libzstd.so.1.5.0 to
>> libzstd.so.1.5.2
>>   /usr/lib/libzstd.so.1.5.0 moved to /usr/lib/libzstd.so.1.5.2
>>
>> Alex
>>
>>
>>
>>
>>>
>>> On Thu, Jan 27, 2022 at 2:20 AM Alexander Kanavin
>>> <alex.kanavin@gmail.com> wrote:
>>> >
>>> > Drop patches merged upstream.
>>> >
>>> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>>> > ---
>>> >  ...rt-all-wildcard-file-list-expansions.patch |  81 --------
>>> >  .../zstd/zstd/0001-MinGW-Build-Fixes.patch    | 193 ------------------
>>> >  .../zstd/{zstd_1.5.0.bb => zstd_1.5.2.bb}     |   7 +-
>>> >  3 files changed, 2 insertions(+), 279 deletions(-)
>>> >  delete mode 100644
>>> meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
>>> >  delete mode 100644
>>> meta/recipes-extended/zstd/zstd/0001-MinGW-Build-Fixes.patch
>>> >  rename meta/recipes-extended/zstd/{zstd_1.5.0.bb => zstd_1.5.2.bb}
>>> (86%)
>>> >
>>> > diff --git
>>> a/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
>>> b/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
>>> > deleted file mode 100644
>>> > index 3d23648f5b..0000000000
>>> > ---
>>> a/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
>>> > +++ /dev/null
>>> > @@ -1,81 +0,0 @@
>>> > -From 77c7963c7a0f1c455f20520d5c7b1ec9b17a44fb Mon Sep 17 00:00:00 2001
>>> > -From: Alexander Kanavin <alex.kanavin@gmail.com>
>>> > -Date: Wed, 23 Dec 2020 19:14:32 +0100
>>> > -Subject: [PATCH] Makefile: sort all wildcard file list expansions
>>> > -
>>> > -Otherwise the order is non-deterministic and breaks
>>> > -reproducible builds.
>>> > -
>>> > -Upstream-Status: Submitted [
>>> https://github.com/facebook/zstd/pull/2895]
>>> > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>>> > -
>>> > ----
>>> > - programs/Makefile   | 10 +++++-----
>>> > - tests/Makefile      |  4 ++--
>>> > - tests/fuzz/Makefile |  2 +-
>>> > - 3 files changed, 8 insertions(+), 8 deletions(-)
>>> > -
>>> > -diff --git a/programs/Makefile b/programs/Makefile
>>> > -index 599fb02f..2c416467 100644
>>> > ---- a/programs/Makefile
>>> > -+++ b/programs/Makefile
>>> > -@@ -74,11 +74,11 @@ ZSTDLEGACY_DIR := $(ZSTDDIR)/legacy
>>> > -
>>> > - vpath %.c $(ZSTDLIB_COMMON) $(ZSTDLIB_COMPRESS)
>>> $(ZSTDLIB_DECOMPRESS) $(ZDICT_DIR) $(ZSTDLEGACY_DIR)
>>> > -
>>> > --ZSTDLIB_COMMON_C := $(wildcard $(ZSTDLIB_COMMON)/*.c)
>>> > --ZSTDLIB_COMPRESS_C := $(wildcard $(ZSTDLIB_COMPRESS)/*.c)
>>> > --ZSTDLIB_DECOMPRESS_C := $(wildcard $(ZSTDLIB_DECOMPRESS)/*.c)
>>> > -+ZSTDLIB_COMMON_C := $(sort $(wildcard $(ZSTDLIB_COMMON)/*.c))
>>> > -+ZSTDLIB_COMPRESS_C := $(sort $(wildcard $(ZSTDLIB_COMPRESS)/*.c))
>>> > -+ZSTDLIB_DECOMPRESS_C := $(sort $(wildcard $(ZSTDLIB_DECOMPRESS)/*.c))
>>> > - ZSTDLIB_CORE_SRC := $(ZSTDLIB_DECOMPRESS_C) $(ZSTDLIB_COMMON_C)
>>> $(ZSTDLIB_COMPRESS_C)
>>> > --ZDICT_SRC := $(wildcard $(ZDICT_DIR)/*.c)
>>> > -+ZDICT_SRC := $(sort $(wildcard $(ZDICT_DIR)/*.c))
>>> > -
>>> > - ZSTD_LEGACY_SUPPORT ?= 5
>>> > - ZSTDLEGACY_SRC :=
>>> > -@@ -93,7 +93,7 @@ ZSTDLIB_FULL_SRC = $(sort $(ZSTDLIB_CORE_SRC)
>>> $(ZSTDLEGACY_SRC) $(ZDICT_SRC))
>>> > - ZSTDLIB_LOCAL_SRC = $(notdir $(ZSTDLIB_FULL_SRC))
>>> > - ZSTDLIB_LOCAL_OBJ := $(ZSTDLIB_LOCAL_SRC:.c=.o)
>>> > -
>>> > --ZSTD_CLI_SRC := $(wildcard *.c)
>>> > -+ZSTD_CLI_SRC := $(sort $(wildcard *.c))
>>> > - ZSTD_CLI_OBJ := $(ZSTD_CLI_SRC:.c=.o)
>>> > -
>>> > - ZSTD_ALL_SRC = $(ZSTDLIB_LOCAL_SRC) $(ZSTD_CLI_SRC)
>>> > -diff --git a/tests/Makefile b/tests/Makefile
>>> > -index 85553007..b71cdba8 100644
>>> > ---- a/tests/Makefile
>>> > -+++ b/tests/Makefile
>>> > -@@ -49,7 +49,7 @@ ZSTDDECOMP_FILES := $(ZSTDDIR)/decompress/*.c
>>> > - ZSTD_FILES  := $(ZSTDDECOMP_FILES) $(ZSTDCOMMON_FILES)
>>> $(ZSTDCOMP_FILES)
>>> > - ZDICT_FILES := $(ZSTDDIR)/dictBuilder/*.c
>>> > -
>>> > --ZSTD_F1 := $(wildcard $(ZSTD_FILES))
>>> > -+ZSTD_F1 := $(sort $(wildcard $(ZSTD_FILES)))
>>> > - ZSTD_OBJ1 := $(subst $(ZSTDDIR)/common/,zstdm_,$(ZSTD_F1))
>>> > - ZSTD_OBJ2 := $(subst $(ZSTDDIR)/compress/,zstdc_,$(ZSTD_OBJ1))
>>> > - ZSTD_OBJ3 := $(subst $(ZSTDDIR)/decompress/,zstdd_,$(ZSTD_OBJ2))
>>> > -@@ -202,7 +202,7 @@ bigdict: $(ZSTDMT_OBJECTS) $(PRGDIR)/datagen.c
>>> bigdict.c
>>> > - invalidDictionaries : $(ZSTD_OBJECTS) invalidDictionaries.c
>>> > -
>>> > - legacy : CPPFLAGS += -I$(ZSTDDIR)/legacy -DZSTD_LEGACY_SUPPORT=4
>>> > --legacy : $(ZSTD_FILES) $(wildcard $(ZSTDDIR)/legacy/*.c) legacy.c
>>> > -+legacy : $(ZSTD_FILES) $(sort $(wildcard $(ZSTDDIR)/legacy/*.c))
>>> legacy.c
>>> > -
>>> > - decodecorpus : LDLIBS += -lm
>>> > - decodecorpus : $(filter-out zstdc_zstd_compress.o, $(ZSTD_OBJECTS))
>>> $(ZDICT_FILES) $(PRGDIR)/util.c $(PRGDIR)/timefn.c decodecorpus.c
>>> > -diff --git a/tests/fuzz/Makefile b/tests/fuzz/Makefile
>>> > -index ccb574b7..b1cb2935 100644
>>> > ---- a/tests/fuzz/Makefile
>>> > -+++ b/tests/fuzz/Makefile
>>> > -@@ -62,7 +62,7 @@ FUZZ_SRC       := \
>>> > -       $(ZSTDCOMP_SRC) \
>>> > -       $(ZSTDDICT_SRC) \
>>> > -       $(ZSTDLEGACY_SRC)
>>> > --FUZZ_SRC := $(wildcard $(FUZZ_SRC))
>>> > -+FUZZ_SRC := $(sort $(wildcard $(FUZZ_SRC)))
>>> > -
>>> > - FUZZ_D_OBJ1 := $(subst $(ZSTDDIR)/common/,d_lib_common_,$(FUZZ_SRC))
>>> > - FUZZ_D_OBJ2 := $(subst
>>> $(ZSTDDIR)/compress/,d_lib_compress_,$(FUZZ_D_OBJ1))
>>> > diff --git
>>> a/meta/recipes-extended/zstd/zstd/0001-MinGW-Build-Fixes.patch
>>> b/meta/recipes-extended/zstd/zstd/0001-MinGW-Build-Fixes.patch
>>> > deleted file mode 100644
>>> > index a0e00dca03..0000000000
>>> > --- a/meta/recipes-extended/zstd/zstd/0001-MinGW-Build-Fixes.patch
>>> > +++ /dev/null
>>> > @@ -1,193 +0,0 @@
>>> > -From ab9a34c92eec815ef214470c927ddbe2e950e7e5 Mon Sep 17 00:00:00 2001
>>> > -From: Joshua Watt <JPEWhacker@gmail.com>
>>> > -Date: Wed, 26 May 2021 09:15:40 -0500
>>> > -Subject: [PATCH] MinGW Build Fixes
>>> > -
>>> > -Fixes building on MinGW by
>>> > - 1) Exporting the OS variable so that it is visible to sub-make
>>> > -    invocations
>>> > - 2) Fixing the extension handling so that make correctly identifies
>>> when
>>> > -    targets need to be rebuilt. Without the correct handling, make
>>> would
>>> > -    rebuild the executable targets when running `make install` because
>>> > -    it couldn't find them with the correct extension.
>>> > -
>>> > -Upstream-Status: Submitted [
>>> https://github.com/facebook/zstd/pull/2685]
>>> > -Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>>> > ----
>>> > - Makefile          |  1 +
>>> > - programs/Makefile | 74
>>> +++++++++++++++++++++++------------------------
>>> > - 2 files changed, 38 insertions(+), 37 deletions(-)
>>> > -
>>> > -diff --git a/Makefile b/Makefile
>>> > -index c1908f0a..f9ce9504 100644
>>> > ---- a/Makefile
>>> > -+++ b/Makefile
>>> > -@@ -29,6 +29,7 @@ VOID = /dev/null
>>> > - # fail on other tested distros (ubuntu, debian) even
>>> > - # without manually specifying the TARGET_SYSTEM.
>>> > - TARGET_SYSTEM ?= $(OS)
>>> > -+export OS
>>> > -
>>> > - ifneq (,$(filter Windows%,$(TARGET_SYSTEM)))
>>> > -   EXT =.exe
>>> > -diff --git a/programs/Makefile b/programs/Makefile
>>> > -index 599fb02f..79b45c83 100644
>>> > ---- a/programs/Makefile
>>> > -+++ b/programs/Makefile
>>> > -@@ -209,37 +209,37 @@ SET_CACHE_DIRECTORY = \
>>> > -
>>> > -
>>> > - .PHONY: all
>>> > --all: zstd
>>> > -+all: zstd$(EXT)
>>> > -
>>> > - .PHONY: allVariants
>>> > --allVariants: zstd zstd-compress zstd-decompress zstd-small
>>> zstd-nolegacy zstd-dictBuilder
>>> > -+allVariants: zstd$(EXT) zstd-compress$(EXT) zstd-decompress$(EXT)
>>> zstd-small$(EXT) zstd-nolegacy$(EXT) zstd-dictBuilder$(EXT)
>>> > -
>>> > - .PHONY: zstd  # must always be run
>>> > --zstd : CPPFLAGS += $(THREAD_CPP) $(ZLIBCPP) $(LZMACPP) $(LZ4CPP)
>>> > --zstd : LDFLAGS += $(THREAD_LD) $(DEBUGFLAGS_LD)
>>> > --zstd : LDLIBS += $(ZLIBLD) $(LZMALD) $(LZ4LD)
>>> > --zstd : CPPFLAGS += -DZSTD_LEGACY_SUPPORT=$(ZSTD_LEGACY_SUPPORT)
>>> > -+zstd$(EXT) : CPPFLAGS += $(THREAD_CPP) $(ZLIBCPP) $(LZMACPP)
>>> $(LZ4CPP)
>>> > -+zstd$(EXT) : LDFLAGS += $(THREAD_LD) $(DEBUGFLAGS_LD)
>>> > -+zstd$(EXT) : LDLIBS += $(ZLIBLD) $(LZMALD) $(LZ4LD)
>>> > -+zstd$(EXT) : CPPFLAGS += -DZSTD_LEGACY_SUPPORT=$(ZSTD_LEGACY_SUPPORT)
>>> > - ifneq (,$(filter Windows%,$(OS)))
>>> > --zstd : $(RES_FILE)
>>> > -+zstd$(EXT) : $(RES_FILE)
>>> > - endif
>>> > -
>>> > - ifndef BUILD_DIR
>>> > - # generate BUILD_DIR from flags
>>> > -
>>> > --zstd:
>>> > -+zstd$(EXT):
>>> > -       $(SET_CACHE_DIRECTORY)
>>> > -
>>> > - else
>>> > - # BUILD_DIR is defined
>>> > -
>>> > - ZSTD_OBJ := $(addprefix $(BUILD_DIR)/, $(ZSTD_ALL_OBJ))
>>> > --$(BUILD_DIR)/zstd : $(ZSTD_OBJ)
>>> > -+$(BUILD_DIR)/zstd$(EXT) : $(ZSTD_OBJ)
>>> > -       @echo "$(THREAD_MSG)"
>>> > -       @echo "$(ZLIB_MSG)"
>>> > -       @echo "$(LZMA_MSG)"
>>> > -       @echo "$(LZ4_MSG)"
>>> > -       @echo LINK $@
>>> > --      $(CC) $(FLAGS) $^ $(LDLIBS) -o $@$(EXT)
>>> > -+      $(CC) $(FLAGS) $^ $(LDLIBS) -o $@
>>> > -
>>> > - ifeq ($(HAVE_HASH),1)
>>> > - SRCBIN_HASH = $(shell cat $(BUILD_DIR)/zstd 2> $(VOID) | $(HASH) |
>>> cut -f 1 -d " ")
>>> > -@@ -249,7 +249,7 @@ else
>>> > - BIN_ISDIFFERENT = 1
>>> > - endif
>>> > -
>>> > --zstd : $(BUILD_DIR)/zstd
>>> > -+zstd$(EXT) : $(BUILD_DIR)/zstd$(EXT)
>>> > -       if [ $(BIN_ISDIFFERENT) -eq 1 ]; then \
>>> > -               cp -f $< $@; \
>>> > -               echo zstd build completed; \
>>> > -@@ -263,46 +263,46 @@ endif  # BUILD_DIR
>>> > - .PHONY: zstd-release
>>> > - zstd-release: DEBUGFLAGS := -DBACKTRACE_ENABLE=0
>>> > - zstd-release: DEBUGFLAGS_LD :=
>>> > --zstd-release: zstd
>>> > -+zstd-release: zstd$(EXT)
>>> > -
>>> > --zstd32 : CPPFLAGS += $(THREAD_CPP)
>>> > --zstd32 : LDFLAGS  += $(THREAD_LD)
>>> > --zstd32 : CPPFLAGS += -DZSTD_LEGACY_SUPPORT=$(ZSTD_LEGACY_SUPPORT)
>>> > -+zstd32$(EXT) : CPPFLAGS += $(THREAD_CPP)
>>> > -+zstd32$(EXT) : LDFLAGS  += $(THREAD_LD)
>>> > -+zstd32$(EXT) : CPPFLAGS +=
>>> -DZSTD_LEGACY_SUPPORT=$(ZSTD_LEGACY_SUPPORT)
>>> > - ifneq (,$(filter Windows%,$(OS)))
>>> > --zstd32 : $(RES32_FILE)
>>> > -+zstd32$(EXT) : $(RES32_FILE)
>>> > - endif
>>> > --zstd32 : $(ZSTDLIB_FULL_SRC) $(ZSTD_CLI_SRC)
>>> > --      $(CC) -m32 $(FLAGS) $^ -o $@$(EXT)
>>> > -+zstd32$(EXT) : $(ZSTDLIB_FULL_SRC) $(ZSTD_CLI_SRC)
>>> > -+      $(CC) -m32 $(FLAGS) $^ -o $@
>>> > -
>>> > - ## zstd-nolegacy: same scope as zstd, with just support of legacy
>>> formats removed
>>> > --zstd-nolegacy : LDFLAGS += $(THREAD_LD) $(ZLIBLD) $(LZMALD) $(LZ4LD)
>>> $(DEBUGFLAGS_LD)
>>> > --zstd-nolegacy : $(ZSTDLIB_CORE_SRC) $(ZDICT_SRC) $(ZSTD_CLI_OBJ)
>>> > --      $(CC) $(FLAGS) $^ -o $@$(EXT) $(LDFLAGS)
>>> > -+zstd-nolegacy$(EXT) : LDFLAGS += $(THREAD_LD) $(ZLIBLD) $(LZMALD)
>>> $(LZ4LD) $(DEBUGFLAGS_LD)
>>> > -+zstd-nolegacy$(EXT) : $(ZSTDLIB_CORE_SRC) $(ZDICT_SRC)
>>> $(ZSTD_CLI_OBJ)
>>> > -+      $(CC) $(FLAGS) $^ -o $@ $(LDFLAGS)
>>> > -
>>> > - .PHONY: zstd-nomt
>>> > - zstd-nomt : THREAD_CPP :=
>>> > - zstd-nomt : THREAD_LD  :=
>>> > - zstd-nomt : THREAD_MSG := - multi-threading disabled
>>> > --zstd-nomt : zstd
>>> > -+zstd-nomt : zstd$(EXT)
>>> > -
>>> > - .PHONY: zstd-nogz
>>> > - zstd-nogz : ZLIBCPP :=
>>> > - zstd-nogz : ZLIBLD  :=
>>> > - zstd-nogz : ZLIB_MSG := - gzip support is disabled
>>> > --zstd-nogz : zstd
>>> > -+zstd-nogz : zstd$(EXT)
>>> > -
>>> > - .PHONY: zstd-noxz
>>> > - zstd-noxz : LZMACPP :=
>>> > - zstd-noxz : LZMALD  :=
>>> > - zstd-noxz : LZMA_MSG := - xz/lzma support is disabled
>>> > --zstd-noxz : zstd
>>> > -+zstd-noxz : zstd$(EXT)
>>> > -
>>> > - ## zstd-dll: zstd executable linked to dynamic library libzstd (must
>>> have same version)
>>> > - .PHONY: zstd-dll
>>> > - zstd-dll : LDFLAGS+= -L$(ZSTDDIR)
>>> > - zstd-dll : LDLIBS += -lzstd
>>> > - zstd-dll : ZSTDLIB_LOCAL_SRC = xxhash.c
>>> > --zstd-dll : zstd
>>> > -+zstd-dll : zstd$(EXT)
>>> > -
>>> > -
>>> > - ## zstd-pgo: zstd executable optimized with PGO.
>>> > -@@ -321,23 +321,23 @@ zstd-pgo :
>>> > -       $(MAKE) zstd MOREFLAGS=-fprofile-use
>>> > -
>>> > - ## zstd-small: minimal target, supporting only zstd compression and
>>> decompression. no bench. no legacy. no other format.
>>> > --zstd-small: CFLAGS = -Os -s
>>> > --zstd-frugal zstd-small: $(ZSTDLIB_CORE_SRC) zstdcli.c util.c
>>> timefn.c fileio.c
>>> > --      $(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT -DZSTD_NOTRACE $^
>>> -o $@$(EXT)
>>> > -+zstd-small$(EXT): CFLAGS = -Os -s
>>> > -+zstd-frugal$(EXT) zstd-small$(EXT): $(ZSTDLIB_CORE_SRC) zstdcli.c
>>> util.c timefn.c fileio.c
>>> > -+      $(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT -DZSTD_NOTRACE $^
>>> -o $@
>>> > -
>>> > --zstd-decompress: $(ZSTDLIB_COMMON_C) $(ZSTDLIB_DECOMPRESS_C)
>>> zstdcli.c util.c timefn.c fileio.c
>>> > --      $(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT -DZSTD_NOCOMPRESS
>>> -DZSTD_NOTRACE $^ -o $@$(EXT)
>>> > -+zstd-decompress$(EXT): $(ZSTDLIB_COMMON_C) $(ZSTDLIB_DECOMPRESS_C)
>>> zstdcli.c util.c timefn.c fileio.c
>>> > -+      $(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT -DZSTD_NOCOMPRESS
>>> -DZSTD_NOTRACE $^ -o $@
>>> > -
>>> > --zstd-compress: $(ZSTDLIB_COMMON_C) $(ZSTDLIB_COMPRESS_C) zstdcli.c
>>> util.c timefn.c fileio.c
>>> > --      $(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT
>>> -DZSTD_NODECOMPRESS -DZSTD_NOTRACE $^ -o $@$(EXT)
>>> > -+zstd-compress$(EXT): $(ZSTDLIB_COMMON_C) $(ZSTDLIB_COMPRESS_C)
>>> zstdcli.c util.c timefn.c fileio.c
>>> > -+      $(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT
>>> -DZSTD_NODECOMPRESS -DZSTD_NOTRACE $^ -o $@
>>> > -
>>> > - ## zstd-dictBuilder: executable supporting dictionary creation and
>>> compression (only)
>>> > --zstd-dictBuilder: CPPFLAGS += -DZSTD_NOBENCH -DZSTD_NODECOMPRESS
>>> -DZSTD_NOTRACE
>>> > --zstd-dictBuilder: $(ZSTDLIB_COMMON_C) $(ZSTDLIB_COMPRESS_C)
>>> $(ZDICT_SRC) zstdcli.c util.c timefn.c fileio.c dibio.c
>>> > --      $(CC) $(FLAGS) $^ -o $@$(EXT)
>>> > -+zstd-dictBuilder$(EXT): CPPFLAGS += -DZSTD_NOBENCH
>>> -DZSTD_NODECOMPRESS -DZSTD_NOTRACE
>>> > -+zstd-dictBuilder$(EXT): $(ZSTDLIB_COMMON_C) $(ZSTDLIB_COMPRESS_C)
>>> $(ZDICT_SRC) zstdcli.c util.c timefn.c fileio.c dibio.c
>>> > -+      $(CC) $(FLAGS) $^ -o $@
>>> > -
>>> > --zstdmt: zstd
>>> > --      ln -sf zstd zstdmt
>>> > -+zstdmt$(EXT): zstd$(EXT)
>>> > -+      ln -sf zstd$(EXT) zstdmt$(EXT)
>>> > -
>>> > - .PHONY: generate_res
>>> > - generate_res: $(RES64_FILE) $(RES32_FILE)
>>> > ---
>>> > -2.31.1
>>> > -
>>> > diff --git a/meta/recipes-extended/zstd/zstd_1.5.0.bb
>>> b/meta/recipes-extended/zstd/zstd_1.5.2.bb
>>> > similarity index 86%
>>> > rename from meta/recipes-extended/zstd/zstd_1.5.0.bb
>>> > rename to meta/recipes-extended/zstd/zstd_1.5.2.bb
>>> > index 51305d0562..71f439ef57 100644
>>> > --- a/meta/recipes-extended/zstd/zstd_1.5.0.bb
>>> > +++ b/meta/recipes-extended/zstd/zstd_1.5.2.bb
>>> > @@ -9,12 +9,9 @@ LICENSE = "BSD-3-Clause & GPLv2"
>>> >  LIC_FILES_CHKSUM =
>>> "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
>>> >
>>> file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
>>> >
>>> > -SRC_URI = "git://
>>> github.com/facebook/zstd.git;branch=release;protocol=https \
>>> > -
>>>  file://0001-Makefile-sort-all-wildcard-file-list-expansions.patch \
>>> > -           file://0001-MinGW-Build-Fixes.patch \
>>> > -           "
>>> > +SRC_URI = "git://
>>> github.com/facebook/zstd.git;branch=release;protocol=https"
>>> >
>>> > -SRCREV = "a488ba114ec17ea1054b9057c26a046fc122b3b6"
>>> > +SRCREV = "e47e674cd09583ff0503f0f6defd6d23d8b718d3"
>>> >  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>>> >
>>> >  CVE_PRODUCT = "zstandard"
>>> > --
>>> > 2.20.1
>>> >
>>> >
>>> >
>>> >
>>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>>
> View/Reply Online (#161053):
>> https://lists.openembedded.org/g/openembedded-core/message/161053
>> Mute This Topic: https://lists.openembedded.org/mt/88718362/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>

--000000000000e1c58605d696a0e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jan 27, 2022 at 12:10 PM Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>I think zstd=
 changelog for 1.5.1 settles the issue:</div><div><br></div><div><a href=3D=
"https://github.com/facebook/zstd/releases/tag/v1.5.1" target=3D"_blank">ht=
tps://github.com/facebook/zstd/releases/tag/v1.5.1</a></div><div></div></di=
v></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah indeed</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">=C2=A0thanks=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><br></div><div>Alex<br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Thu, 27 Jan 2022 at 20:51, Alexander Kanavin via <a href=3D"http://=
lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;al=
ex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"=
_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 27 Jan 2022 at 19:56=
, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.=
khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">quick look shows that size of zstd package reduces quite a bi=
t, I wonder why<br>
<br>
=C2=A0 -4720=C2=A0 =C2=A0KiB zstd<br>
=C2=A0 +2932=C2=A0 =C2=A0KiB zstd<br>
<br>
small is ofcourse better, but I wonder what could reduce it so much<br>
between 1.5.0 and 1.5.2<br></blockquote><div><br></div><div>buildhistory-di=
ff does not reveal anything fishy:</div><div><br></div><div>alex@nereus:~/d=
evelopment/poky/build-64-alt$ buildhistory-diff<br>Changes to packages/core=
2-64-poky-linux/zstd (sysroot):<br>=C2=A0 /usr/lib/libzstd.so.1 changed sym=
link target from libzstd.so.1.5.0 to libzstd.so.1.5.2<br>=C2=A0 /usr/lib/li=
bzstd.so changed symlink target from libzstd.so.1.5.0 to libzstd.so.1.5.2<b=
r>=C2=A0 /usr/lib/libzstd.so.1.5.0 moved to /usr/lib/libzstd.so.1.5.2<br>pa=
ckages/core2-64-poky-linux/zstd/zstd-dbg: PKGSIZE changed from 23736192 to =
16994448 (-28%)<br>packages/core2-64-poky-linux/zstd/zstd-src: PKGSIZE chan=
ged from 2741079 to 3050284 (+11%)<br>packages/core2-64-poky-linux/zstd/zst=
d-staticdev: PKGSIZE changed from 9332966 to 6596796 (-29%)<br>packages/cor=
e2-64-poky-linux/zstd/zstd: PKGSIZE changed from 3279119 to 2407719 (-27%)<=
br>packages/core2-64-poky-linux/zstd/zstd: FILELIST: removed &quot;/usr/lib=
/libzstd.so.1.5.0&quot;, added &quot;/usr/lib/libzstd.so.1.5.2&quot;<br>Cha=
nges to packages/x86_64-linux/zstd-native (sysroot):<br>=C2=A0 /usr/lib/lib=
zstd.so.1 changed symlink target from libzstd.so.1.5.0 to libzstd.so.1.5.2<=
br>=C2=A0 /usr/lib/libzstd.so changed symlink target from libzstd.so.1.5.0 =
to libzstd.so.1.5.2<br>=C2=A0 /usr/lib/libzstd.so.1.5.0 moved to /usr/lib/l=
ibzstd.so.1.5.2</div><div><br></div><div>Alex<br></div><div><br></div><div>=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br></blockquote></div></div></blockquote></div><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
On Thu, Jan 27, 2022 at 2:20 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Drop patches merged upstream.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...rt-all-wildcard-file-list-expansions.patch |=C2=A0 81 -------=
-<br>
&gt;=C2=A0 .../zstd/zstd/0001-MinGW-Build-Fixes.patch=C2=A0 =C2=A0 | 193 --=
----------------<br>
&gt;=C2=A0 .../zstd/{<a href=3D"http://zstd_1.5.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">zstd_1.5.0.bb</a> =3D&gt; <a href=3D"http://zstd_1.5.2.bb" =
rel=3D"noreferrer" target=3D"_blank">zstd_1.5.2.bb</a>}=C2=A0 =C2=A0 =C2=A0=
|=C2=A0 =C2=A07 +-<br>
&gt;=C2=A0 3 files changed, 2 insertions(+), 279 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/zstd/zstd/0001-Makefile=
-sort-all-wildcard-file-list-expansions.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-extended/zstd/zstd/0001-MinGW-Bu=
ild-Fixes.patch<br>
&gt;=C2=A0 rename meta/recipes-extended/zstd/{<a href=3D"http://zstd_1.5.0.=
bb" rel=3D"noreferrer" target=3D"_blank">zstd_1.5.0.bb</a> =3D&gt; <a href=
=3D"http://zstd_1.5.2.bb" rel=3D"noreferrer" target=3D"_blank">zstd_1.5.2.b=
b</a>} (86%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wi=
ldcard-file-list-expansions.patch b/meta/recipes-extended/zstd/zstd/0001-Ma=
kefile-sort-all-wildcard-file-list-expansions.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 3d23648f5b..0000000000<br>
&gt; --- a/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-=
file-list-expansions.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,81 +0,0 @@<br>
&gt; -From 77c7963c7a0f1c455f20520d5c7b1ec9b17a44fb Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; -Date: Wed, 23 Dec 2020 19:14:32 +0100<br>
&gt; -Subject: [PATCH] Makefile: sort all wildcard file list expansions<br>
&gt; -<br>
&gt; -Otherwise the order is non-deterministic and breaks<br>
&gt; -reproducible builds.<br>
&gt; -<br>
&gt; -Upstream-Status: Submitted [<a href=3D"https://github.com/facebook/zs=
td/pull/2895" rel=3D"noreferrer" target=3D"_blank">https://github.com/faceb=
ook/zstd/pull/2895</a>]<br>
&gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; -<br>
&gt; ----<br>
&gt; - programs/Makefile=C2=A0 =C2=A0| 10 +++++-----<br>
&gt; - tests/Makefile=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
&gt; - tests/fuzz/Makefile |=C2=A0 2 +-<br>
&gt; - 3 files changed, 8 insertions(+), 8 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/programs/Makefile b/programs/Makefile<br>
&gt; -index 599fb02f..2c416467 100644<br>
&gt; ---- a/programs/Makefile<br>
&gt; -+++ b/programs/Makefile<br>
&gt; -@@ -74,11 +74,11 @@ ZSTDLEGACY_DIR :=3D $(ZSTDDIR)/legacy<br>
&gt; -<br>
&gt; - vpath %.c $(ZSTDLIB_COMMON) $(ZSTDLIB_COMPRESS) $(ZSTDLIB_DECOMPRESS=
) $(ZDICT_DIR) $(ZSTDLEGACY_DIR)<br>
&gt; -<br>
&gt; --ZSTDLIB_COMMON_C :=3D $(wildcard $(ZSTDLIB_COMMON)/*.c)<br>
&gt; --ZSTDLIB_COMPRESS_C :=3D $(wildcard $(ZSTDLIB_COMPRESS)/*.c)<br>
&gt; --ZSTDLIB_DECOMPRESS_C :=3D $(wildcard $(ZSTDLIB_DECOMPRESS)/*.c)<br>
&gt; -+ZSTDLIB_COMMON_C :=3D $(sort $(wildcard $(ZSTDLIB_COMMON)/*.c))<br>
&gt; -+ZSTDLIB_COMPRESS_C :=3D $(sort $(wildcard $(ZSTDLIB_COMPRESS)/*.c))<=
br>
&gt; -+ZSTDLIB_DECOMPRESS_C :=3D $(sort $(wildcard $(ZSTDLIB_DECOMPRESS)/*.=
c))<br>
&gt; - ZSTDLIB_CORE_SRC :=3D $(ZSTDLIB_DECOMPRESS_C) $(ZSTDLIB_COMMON_C) $(=
ZSTDLIB_COMPRESS_C)<br>
&gt; --ZDICT_SRC :=3D $(wildcard $(ZDICT_DIR)/*.c)<br>
&gt; -+ZDICT_SRC :=3D $(sort $(wildcard $(ZDICT_DIR)/*.c))<br>
&gt; -<br>
&gt; - ZSTD_LEGACY_SUPPORT ?=3D 5<br>
&gt; - ZSTDLEGACY_SRC :=3D<br>
&gt; -@@ -93,7 +93,7 @@ ZSTDLIB_FULL_SRC =3D $(sort $(ZSTDLIB_CORE_SRC) $(Z=
STDLEGACY_SRC) $(ZDICT_SRC))<br>
&gt; - ZSTDLIB_LOCAL_SRC =3D $(notdir $(ZSTDLIB_FULL_SRC))<br>
&gt; - ZSTDLIB_LOCAL_OBJ :=3D $(ZSTDLIB_LOCAL_SRC:.c=3D.o)<br>
&gt; -<br>
&gt; --ZSTD_CLI_SRC :=3D $(wildcard *.c)<br>
&gt; -+ZSTD_CLI_SRC :=3D $(sort $(wildcard *.c))<br>
&gt; - ZSTD_CLI_OBJ :=3D $(ZSTD_CLI_SRC:.c=3D.o)<br>
&gt; -<br>
&gt; - ZSTD_ALL_SRC =3D $(ZSTDLIB_LOCAL_SRC) $(ZSTD_CLI_SRC)<br>
&gt; -diff --git a/tests/Makefile b/tests/Makefile<br>
&gt; -index 85553007..b71cdba8 100644<br>
&gt; ---- a/tests/Makefile<br>
&gt; -+++ b/tests/Makefile<br>
&gt; -@@ -49,7 +49,7 @@ ZSTDDECOMP_FILES :=3D $(ZSTDDIR)/decompress/*.c<br>
&gt; - ZSTD_FILES=C2=A0 :=3D $(ZSTDDECOMP_FILES) $(ZSTDCOMMON_FILES) $(ZSTD=
COMP_FILES)<br>
&gt; - ZDICT_FILES :=3D $(ZSTDDIR)/dictBuilder/*.c<br>
&gt; -<br>
&gt; --ZSTD_F1 :=3D $(wildcard $(ZSTD_FILES))<br>
&gt; -+ZSTD_F1 :=3D $(sort $(wildcard $(ZSTD_FILES)))<br>
&gt; - ZSTD_OBJ1 :=3D $(subst $(ZSTDDIR)/common/,zstdm_,$(ZSTD_F1))<br>
&gt; - ZSTD_OBJ2 :=3D $(subst $(ZSTDDIR)/compress/,zstdc_,$(ZSTD_OBJ1))<br>
&gt; - ZSTD_OBJ3 :=3D $(subst $(ZSTDDIR)/decompress/,zstdd_,$(ZSTD_OBJ2))<b=
r>
&gt; -@@ -202,7 +202,7 @@ bigdict: $(ZSTDMT_OBJECTS) $(PRGDIR)/datagen.c bi=
gdict.c<br>
&gt; - invalidDictionaries : $(ZSTD_OBJECTS) invalidDictionaries.c<br>
&gt; -<br>
&gt; - legacy : CPPFLAGS +=3D -I$(ZSTDDIR)/legacy -DZSTD_LEGACY_SUPPORT=3D4=
<br>
&gt; --legacy : $(ZSTD_FILES) $(wildcard $(ZSTDDIR)/legacy/*.c) legacy.c<br=
>
&gt; -+legacy : $(ZSTD_FILES) $(sort $(wildcard $(ZSTDDIR)/legacy/*.c)) leg=
acy.c<br>
&gt; -<br>
&gt; - decodecorpus : LDLIBS +=3D -lm<br>
&gt; - decodecorpus : $(filter-out zstdc_zstd_compress.o, $(ZSTD_OBJECTS)) =
$(ZDICT_FILES) $(PRGDIR)/util.c $(PRGDIR)/timefn.c decodecorpus.c<br>
&gt; -diff --git a/tests/fuzz/Makefile b/tests/fuzz/Makefile<br>
&gt; -index ccb574b7..b1cb2935 100644<br>
&gt; ---- a/tests/fuzz/Makefile<br>
&gt; -+++ b/tests/fuzz/Makefile<br>
&gt; -@@ -62,7 +62,7 @@ FUZZ_SRC=C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(ZSTDCOMP_SRC) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(ZSTDDICT_SRC) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(ZSTDLEGACY_SRC)<br>
&gt; --FUZZ_SRC :=3D $(wildcard $(FUZZ_SRC))<br>
&gt; -+FUZZ_SRC :=3D $(sort $(wildcard $(FUZZ_SRC)))<br>
&gt; -<br>
&gt; - FUZZ_D_OBJ1 :=3D $(subst $(ZSTDDIR)/common/,d_lib_common_,$(FUZZ_SRC=
))<br>
&gt; - FUZZ_D_OBJ2 :=3D $(subst $(ZSTDDIR)/compress/,d_lib_compress_,$(FUZZ=
_D_OBJ1))<br>
&gt; diff --git a/meta/recipes-extended/zstd/zstd/0001-MinGW-Build-Fixes.pa=
tch b/meta/recipes-extended/zstd/zstd/0001-MinGW-Build-Fixes.patch<br>
&gt; deleted file mode 100644<br>
&gt; index a0e00dca03..0000000000<br>
&gt; --- a/meta/recipes-extended/zstd/zstd/0001-MinGW-Build-Fixes.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,193 +0,0 @@<br>
&gt; -From ab9a34c92eec815ef214470c927ddbe2e950e7e5 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" target=
=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
&gt; -Date: Wed, 26 May 2021 09:15:40 -0500<br>
&gt; -Subject: [PATCH] MinGW Build Fixes<br>
&gt; -<br>
&gt; -Fixes building on MinGW by<br>
&gt; - 1) Exporting the OS variable so that it is visible to sub-make<br>
&gt; -=C2=A0 =C2=A0 invocations<br>
&gt; - 2) Fixing the extension handling so that make correctly identifies w=
hen<br>
&gt; -=C2=A0 =C2=A0 targets need to be rebuilt. Without the correct handlin=
g, make would<br>
&gt; -=C2=A0 =C2=A0 rebuild the executable targets when running `make insta=
ll` because<br>
&gt; -=C2=A0 =C2=A0 it couldn&#39;t find them with the correct extension.<b=
r>
&gt; -<br>
&gt; -Upstream-Status: Submitted [<a href=3D"https://github.com/facebook/zs=
td/pull/2685" rel=3D"noreferrer" target=3D"_blank">https://github.com/faceb=
ook/zstd/pull/2685</a>]<br>
&gt; -Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com=
" target=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt; - programs/Makefile | 74 +++++++++++++++++++++++----------------------=
--<br>
&gt; - 2 files changed, 38 insertions(+), 37 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/Makefile b/Makefile<br>
&gt; -index c1908f0a..f9ce9504 100644<br>
&gt; ---- a/Makefile<br>
&gt; -+++ b/Makefile<br>
&gt; -@@ -29,6 +29,7 @@ VOID =3D /dev/null<br>
&gt; - # fail on other tested distros (ubuntu, debian) even<br>
&gt; - # without manually specifying the TARGET_SYSTEM.<br>
&gt; - TARGET_SYSTEM ?=3D $(OS)<br>
&gt; -+export OS<br>
&gt; -<br>
&gt; - ifneq (,$(filter Windows%,$(TARGET_SYSTEM)))<br>
&gt; -=C2=A0 =C2=A0EXT =3D.exe<br>
&gt; -diff --git a/programs/Makefile b/programs/Makefile<br>
&gt; -index 599fb02f..79b45c83 100644<br>
&gt; ---- a/programs/Makefile<br>
&gt; -+++ b/programs/Makefile<br>
&gt; -@@ -209,37 +209,37 @@ SET_CACHE_DIRECTORY =3D \<br>
&gt; -<br>
&gt; -<br>
&gt; - .PHONY: all<br>
&gt; --all: zstd<br>
&gt; -+all: zstd$(EXT)<br>
&gt; -<br>
&gt; - .PHONY: allVariants<br>
&gt; --allVariants: zstd zstd-compress zstd-decompress zstd-small zstd-nole=
gacy zstd-dictBuilder<br>
&gt; -+allVariants: zstd$(EXT) zstd-compress$(EXT) zstd-decompress$(EXT) zs=
td-small$(EXT) zstd-nolegacy$(EXT) zstd-dictBuilder$(EXT)<br>
&gt; -<br>
&gt; - .PHONY: zstd=C2=A0 # must always be run<br>
&gt; --zstd : CPPFLAGS +=3D $(THREAD_CPP) $(ZLIBCPP) $(LZMACPP) $(LZ4CPP)<b=
r>
&gt; --zstd : LDFLAGS +=3D $(THREAD_LD) $(DEBUGFLAGS_LD)<br>
&gt; --zstd : LDLIBS +=3D $(ZLIBLD) $(LZMALD) $(LZ4LD)<br>
&gt; --zstd : CPPFLAGS +=3D -DZSTD_LEGACY_SUPPORT=3D$(ZSTD_LEGACY_SUPPORT)<=
br>
&gt; -+zstd$(EXT) : CPPFLAGS +=3D $(THREAD_CPP) $(ZLIBCPP) $(LZMACPP) $(LZ4=
CPP)<br>
&gt; -+zstd$(EXT) : LDFLAGS +=3D $(THREAD_LD) $(DEBUGFLAGS_LD)<br>
&gt; -+zstd$(EXT) : LDLIBS +=3D $(ZLIBLD) $(LZMALD) $(LZ4LD)<br>
&gt; -+zstd$(EXT) : CPPFLAGS +=3D -DZSTD_LEGACY_SUPPORT=3D$(ZSTD_LEGACY_SUP=
PORT)<br>
&gt; - ifneq (,$(filter Windows%,$(OS)))<br>
&gt; --zstd : $(RES_FILE)<br>
&gt; -+zstd$(EXT) : $(RES_FILE)<br>
&gt; - endif<br>
&gt; -<br>
&gt; - ifndef BUILD_DIR<br>
&gt; - # generate BUILD_DIR from flags<br>
&gt; -<br>
&gt; --zstd:<br>
&gt; -+zstd$(EXT):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(SET_CACHE_DIRECTORY)<br>
&gt; -<br>
&gt; - else<br>
&gt; - # BUILD_DIR is defined<br>
&gt; -<br>
&gt; - ZSTD_OBJ :=3D $(addprefix $(BUILD_DIR)/, $(ZSTD_ALL_OBJ))<br>
&gt; --$(BUILD_DIR)/zstd : $(ZSTD_OBJ)<br>
&gt; -+$(BUILD_DIR)/zstd$(EXT) : $(ZSTD_OBJ)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;$(THREAD_MSG)&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;$(ZLIB_MSG)&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;$(LZMA_MSG)&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;$(LZ4_MSG)&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo LINK $@<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $(CC) $(FLAGS) $^ $(LDLIBS) -o $@$(EXT)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 $(CC) $(FLAGS) $^ $(LDLIBS) -o $@<br>
&gt; -<br>
&gt; - ifeq ($(HAVE_HASH),1)<br>
&gt; - SRCBIN_HASH =3D $(shell cat $(BUILD_DIR)/zstd 2&gt; $(VOID) | $(HASH=
) | cut -f 1 -d &quot; &quot;)<br>
&gt; -@@ -249,7 +249,7 @@ else<br>
&gt; - BIN_ISDIFFERENT =3D 1<br>
&gt; - endif<br>
&gt; -<br>
&gt; --zstd : $(BUILD_DIR)/zstd<br>
&gt; -+zstd$(EXT) : $(BUILD_DIR)/zstd$(EXT)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $(BIN_ISDIFFERENT) -eq 1 ]; then \<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -f $&lt; $@=
; \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo zstd buil=
d completed; \<br>
&gt; -@@ -263,46 +263,46 @@ endif=C2=A0 # BUILD_DIR<br>
&gt; - .PHONY: zstd-release<br>
&gt; - zstd-release: DEBUGFLAGS :=3D -DBACKTRACE_ENABLE=3D0<br>
&gt; - zstd-release: DEBUGFLAGS_LD :=3D<br>
&gt; --zstd-release: zstd<br>
&gt; -+zstd-release: zstd$(EXT)<br>
&gt; -<br>
&gt; --zstd32 : CPPFLAGS +=3D $(THREAD_CPP)<br>
&gt; --zstd32 : LDFLAGS=C2=A0 +=3D $(THREAD_LD)<br>
&gt; --zstd32 : CPPFLAGS +=3D -DZSTD_LEGACY_SUPPORT=3D$(ZSTD_LEGACY_SUPPORT=
)<br>
&gt; -+zstd32$(EXT) : CPPFLAGS +=3D $(THREAD_CPP)<br>
&gt; -+zstd32$(EXT) : LDFLAGS=C2=A0 +=3D $(THREAD_LD)<br>
&gt; -+zstd32$(EXT) : CPPFLAGS +=3D -DZSTD_LEGACY_SUPPORT=3D$(ZSTD_LEGACY_S=
UPPORT)<br>
&gt; - ifneq (,$(filter Windows%,$(OS)))<br>
&gt; --zstd32 : $(RES32_FILE)<br>
&gt; -+zstd32$(EXT) : $(RES32_FILE)<br>
&gt; - endif<br>
&gt; --zstd32 : $(ZSTDLIB_FULL_SRC) $(ZSTD_CLI_SRC)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $(CC) -m32 $(FLAGS) $^ -o $@$(EXT)<br>
&gt; -+zstd32$(EXT) : $(ZSTDLIB_FULL_SRC) $(ZSTD_CLI_SRC)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 $(CC) -m32 $(FLAGS) $^ -o $@<br>
&gt; -<br>
&gt; - ## zstd-nolegacy: same scope as zstd, with just support of legacy fo=
rmats removed<br>
&gt; --zstd-nolegacy : LDFLAGS +=3D $(THREAD_LD) $(ZLIBLD) $(LZMALD) $(LZ4L=
D) $(DEBUGFLAGS_LD)<br>
&gt; --zstd-nolegacy : $(ZSTDLIB_CORE_SRC) $(ZDICT_SRC) $(ZSTD_CLI_OBJ)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $(CC) $(FLAGS) $^ -o $@$(EXT) $(LDFLAGS)<br>
&gt; -+zstd-nolegacy$(EXT) : LDFLAGS +=3D $(THREAD_LD) $(ZLIBLD) $(LZMALD) =
$(LZ4LD) $(DEBUGFLAGS_LD)<br>
&gt; -+zstd-nolegacy$(EXT) : $(ZSTDLIB_CORE_SRC) $(ZDICT_SRC) $(ZSTD_CLI_OB=
J)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 $(CC) $(FLAGS) $^ -o $@ $(LDFLAGS)<br>
&gt; -<br>
&gt; - .PHONY: zstd-nomt<br>
&gt; - zstd-nomt : THREAD_CPP :=3D<br>
&gt; - zstd-nomt : THREAD_LD=C2=A0 :=3D<br>
&gt; - zstd-nomt : THREAD_MSG :=3D - multi-threading disabled<br>
&gt; --zstd-nomt : zstd<br>
&gt; -+zstd-nomt : zstd$(EXT)<br>
&gt; -<br>
&gt; - .PHONY: zstd-nogz<br>
&gt; - zstd-nogz : ZLIBCPP :=3D<br>
&gt; - zstd-nogz : ZLIBLD=C2=A0 :=3D<br>
&gt; - zstd-nogz : ZLIB_MSG :=3D - gzip support is disabled<br>
&gt; --zstd-nogz : zstd<br>
&gt; -+zstd-nogz : zstd$(EXT)<br>
&gt; -<br>
&gt; - .PHONY: zstd-noxz<br>
&gt; - zstd-noxz : LZMACPP :=3D<br>
&gt; - zstd-noxz : LZMALD=C2=A0 :=3D<br>
&gt; - zstd-noxz : LZMA_MSG :=3D - xz/lzma support is disabled<br>
&gt; --zstd-noxz : zstd<br>
&gt; -+zstd-noxz : zstd$(EXT)<br>
&gt; -<br>
&gt; - ## zstd-dll: zstd executable linked to dynamic library libzstd (must=
 have same version)<br>
&gt; - .PHONY: zstd-dll<br>
&gt; - zstd-dll : LDFLAGS+=3D -L$(ZSTDDIR)<br>
&gt; - zstd-dll : LDLIBS +=3D -lzstd<br>
&gt; - zstd-dll : ZSTDLIB_LOCAL_SRC =3D xxhash.c<br>
&gt; --zstd-dll : zstd<br>
&gt; -+zstd-dll : zstd$(EXT)<br>
&gt; -<br>
&gt; -<br>
&gt; - ## zstd-pgo: zstd executable optimized with PGO.<br>
&gt; -@@ -321,23 +321,23 @@ zstd-pgo :<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0$(MAKE) zstd MOREFLAGS=3D-fprofile-use<br>
&gt; -<br>
&gt; - ## zstd-small: minimal target, supporting only zstd compression and =
decompression. no bench. no legacy. no other format.<br>
&gt; --zstd-small: CFLAGS =3D -Os -s<br>
&gt; --zstd-frugal zstd-small: $(ZSTDLIB_CORE_SRC) zstdcli.c util.c timefn.=
c fileio.c<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT -DZ=
STD_NOTRACE $^ -o $@$(EXT)<br>
&gt; -+zstd-small$(EXT): CFLAGS =3D -Os -s<br>
&gt; -+zstd-frugal$(EXT) zstd-small$(EXT): $(ZSTDLIB_CORE_SRC) zstdcli.c ut=
il.c timefn.c fileio.c<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 $(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT -DZ=
STD_NOTRACE $^ -o $@<br>
&gt; -<br>
&gt; --zstd-decompress: $(ZSTDLIB_COMMON_C) $(ZSTDLIB_DECOMPRESS_C) zstdcli=
.c util.c timefn.c fileio.c<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT -DZ=
STD_NOCOMPRESS -DZSTD_NOTRACE $^ -o $@$(EXT)<br>
&gt; -+zstd-decompress$(EXT): $(ZSTDLIB_COMMON_C) $(ZSTDLIB_DECOMPRESS_C) z=
stdcli.c util.c timefn.c fileio.c<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 $(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT -DZ=
STD_NOCOMPRESS -DZSTD_NOTRACE $^ -o $@<br>
&gt; -<br>
&gt; --zstd-compress: $(ZSTDLIB_COMMON_C) $(ZSTDLIB_COMPRESS_C) zstdcli.c u=
til.c timefn.c fileio.c<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT -DZ=
STD_NODECOMPRESS -DZSTD_NOTRACE $^ -o $@$(EXT)<br>
&gt; -+zstd-compress$(EXT): $(ZSTDLIB_COMMON_C) $(ZSTDLIB_COMPRESS_C) zstdc=
li.c util.c timefn.c fileio.c<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 $(CC) $(FLAGS) -DZSTD_NOBENCH -DZSTD_NODICT -DZ=
STD_NODECOMPRESS -DZSTD_NOTRACE $^ -o $@<br>
&gt; -<br>
&gt; - ## zstd-dictBuilder: executable supporting dictionary creation and c=
ompression (only)<br>
&gt; --zstd-dictBuilder: CPPFLAGS +=3D -DZSTD_NOBENCH -DZSTD_NODECOMPRESS -=
DZSTD_NOTRACE<br>
&gt; --zstd-dictBuilder: $(ZSTDLIB_COMMON_C) $(ZSTDLIB_COMPRESS_C) $(ZDICT_=
SRC) zstdcli.c util.c timefn.c fileio.c dibio.c<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 $(CC) $(FLAGS) $^ -o $@$(EXT)<br>
&gt; -+zstd-dictBuilder$(EXT): CPPFLAGS +=3D -DZSTD_NOBENCH -DZSTD_NODECOMP=
RESS -DZSTD_NOTRACE<br>
&gt; -+zstd-dictBuilder$(EXT): $(ZSTDLIB_COMMON_C) $(ZSTDLIB_COMPRESS_C) $(=
ZDICT_SRC) zstdcli.c util.c timefn.c fileio.c dibio.c<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 $(CC) $(FLAGS) $^ -o $@<br>
&gt; -<br>
&gt; --zstdmt: zstd<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 ln -sf zstd zstdmt<br>
&gt; -+zstdmt$(EXT): zstd$(EXT)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 ln -sf zstd$(EXT) zstdmt$(EXT)<br>
&gt; -<br>
&gt; - .PHONY: generate_res<br>
&gt; - generate_res: $(RES64_FILE) $(RES32_FILE)<br>
&gt; ---<br>
&gt; -2.31.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/zstd/<a href=3D"http://zstd_1.5.0.b=
b" rel=3D"noreferrer" target=3D"_blank">zstd_1.5.0.bb</a> b/meta/recipes-ex=
tended/zstd/<a href=3D"http://zstd_1.5.2.bb" rel=3D"noreferrer" target=3D"_=
blank">zstd_1.5.2.bb</a><br>
&gt; similarity index 86%<br>
&gt; rename from meta/recipes-extended/zstd/<a href=3D"http://zstd_1.5.0.bb=
" rel=3D"noreferrer" target=3D"_blank">zstd_1.5.0.bb</a><br>
&gt; rename to meta/recipes-extended/zstd/<a href=3D"http://zstd_1.5.2.bb" =
rel=3D"noreferrer" target=3D"_blank">zstd_1.5.2.bb</a><br>
&gt; index 51305d0562..71f439ef57 100644<br>
&gt; --- a/meta/recipes-extended/zstd/<a href=3D"http://zstd_1.5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">zstd_1.5.0.bb</a><br>
&gt; +++ b/meta/recipes-extended/zstd/<a href=3D"http://zstd_1.5.2.bb" rel=
=3D"noreferrer" target=3D"_blank">zstd_1.5.2.bb</a><br>
&gt; @@ -9,12 +9,9 @@ LICENSE =3D &quot;BSD-3-Clause &amp; GPLv2&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc7f0b161edbe52f5=
f345a3d1311d0b32 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://COPYING;md5=3D39bba7d2cf0ba1036f2a6e2be52fe3f0&quot;<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/facebook/zstd.gi=
t;branch=3Drelease;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/facebook/zstd.git;branch=3Drelease;protocol=3Dhttps</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Makefile-sort-al=
l-wildcard-file-list-expansions.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-MinGW-Build-Fixe=
s.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/facebook/zstd.gi=
t;branch=3Drelease;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/facebook/zstd.git;branch=3Drelease;protocol=3Dhttps</a>&quot;<br>
&gt;<br>
&gt; -SRCREV =3D &quot;a488ba114ec17ea1054b9057c26a046fc122b3b6&quot;<br>
&gt; +SRCREV =3D &quot;e47e674cd09583ff0503f0f6defd6d23d8b718d3&quot;<br>
&gt;=C2=A0 UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+(\.\d+)+=
)&quot;<br>
&gt;<br>
&gt;=C2=A0 CVE_PRODUCT =3D &quot;zstandard&quot;<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div></div></blockquote></div><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"></blockq=
uote></div></div></blockquote></div><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br></blockquote></div><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
View/Reply Online (#161053): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/161053" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/161053</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88718362/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88718362/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div></div>

--000000000000e1c58605d696a0e8--

