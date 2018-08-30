Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 619C1793EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 16:32:19 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id x7-v6so10907182qtk.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 09:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=37f0BtLOUXqo+PFbld65Khed3yWypXwB21h/4RE7bI0=;
	b=K2043z1mlj+Lvm3CBXyjBlwRxGuJ4g+N5XhqAB/ByK7WvnWUqvMcgjFNuQE3NvU8x/
	CIBm1mBd4rTdkldA/CefSoDKQVS+sgKuORnBVlShtYFKLI6mNv0m4gOZOKa+F3CQjSRz
	14HTXyK2KVzPtSS3hdM+5pSHjGGvwrQdQRvMW5rSU3J1jzsmPS5ey6w5PJOsOdeRtHW5
	D9MdH4UZ2BI4fqW1R5nk01t33H25pRqnTHt6+VUz5vwIk3c7EwjtGqp2R0D/Nn0F/PeN
	23x52kxUrjci2IRwU2w36jZK9S5RYor8N0ZMCrL1OY5gyQP12/6p1YsjC5PvwwkiWsO9
	o5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=37f0BtLOUXqo+PFbld65Khed3yWypXwB21h/4RE7bI0=;
	b=BaRokOnDTnut+iHAcUzvsoq6n9YuCvojlZMvN0nUnZZ6me376s1iqaAbbKiW+4wrUi
	e/HlQN5/OA6JNBN3glZQszK1vEqweUE6h64dFrTmryq3S5uoNPNRatcVn0IfjldxQKfQ
	+8I41+KglLrddGYz3pkANMPvSZ8D+WzjqPuhBA5c7ppKm7skHSnC2EshteiFYy6sH2h9
	8abNk76n2v8wGUhoZRBEaL8tEWCsgLkYkln6SfFzRpgtFXzMsGNXPRy0y+x7pk7tpDAJ
	jVWhYulWoSghaVKm24KbLREJAwUIQaaWSlQu85hAkOFIF1ImVEaMl+6Kvmw+LOGweVpf
	sY6Q==
X-Gm-Message-State: APzg51CNDTrg/CJ+Qq5xM7BLb2nVP2vfFqr6NSAQK4x79NpJyINYNak7
	uZLkEcRXBPDhJ5l4CMDAoQ7LBqhyOq8y3/6enNk=
X-Google-Smtp-Source: ANB0VdYsdjDoDbKQLj8ExycvDIn7scbD/nyB9Io9KWyXwg+ilPTkz0VVAaTwfZXuEGrnKDePshT+Myo3e3Vqzfmq1v8=
X-Received: by 2002:ac8:758d:: with SMTP id
	s13-v6mr12857218qtq.161.1535646740121; 
	Thu, 30 Aug 2018 09:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <1535636519-3244-1-git-send-email-diego.rondini@kynetics.com>
In-Reply-To: <1535636519-3244-1-git-send-email-diego.rondini@kynetics.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Aug 2018 09:31:53 -0700
Message-ID: <CAMKF1soNsf8dHPwArZmzZmhteKSyRjqLkLmZ1=tpbnuE=aRxwA@mail.gmail.com>
To: diego.rondini@kynetics.com
Cc: gregory.vimont@softbankrobotics.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][rocko][sumo][PATCH] tbb: check the version of the cross gcc instead of host gcc
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
X-List-Received-Date: Thu, 30 Aug 2018 16:32:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 30, 2018 at 6:42 AM Diego Rondini
<diego.rondini@kynetics.com> wrote:
>
> From: Gregory Vimont <gregory.vimont@softbankrobotics.com>
>
> When cross compiling on linux with gcc, the host gcc was used instead of
> the cross gcc to set compilation flags according to gcc version.
>

this is ok for release branches. Although if I were to do it today, I Would have
also considered clang, clang -dumversion reports as gcc 4.2.1 and that
clearly wrong information
when you compare generic features so we end up disabling stuff for clang
that otherwise would work fine


> Signed-off-by: Gregory Vimont <gregory.vimont@softbankrobotics.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> The reason of the backport is to fix a crash, details here:
> http://lists.openembedded.org/pipermail/openembedded-devel/2018-August/120116.html
> ---
>  meta-oe/recipes-support/tbb/tbb.bb                 |  1 +
>  .../tbb/tbb/0002-linux-Fix-gcc-version-check.patch | 57 ++++++++++++++++++++++
>  2 files changed, 58 insertions(+)
>  create mode 100644 meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch
>
> diff --git a/meta-oe/recipes-support/tbb/tbb.bb b/meta-oe/recipes-support/tbb/tbb.bb
> index bad9481..f870104 100644
> --- a/meta-oe/recipes-support/tbb/tbb.bb
> +++ b/meta-oe/recipes-support/tbb/tbb.bb
> @@ -13,6 +13,7 @@ PV = "${PRDATE}+${SRCPV}"
>  SRC_URI = "git://github.com/01org/tbb;branch=${BRANCH} \
>             file://cross-compile.patch \
>             file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch \
> +           file://0002-linux-Fix-gcc-version-check.patch \
>             file://tbb.pc \
>  "
>
> diff --git a/meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch b/meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch
> new file mode 100644
> index 0000000..9824b61
> --- /dev/null
> +++ b/meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch
> @@ -0,0 +1,57 @@
> +From aee098f1bf0511c6b5544de3170a9e8b51673b60 Mon Sep 17 00:00:00 2001
> +From: Pierre Le Magourou <plemagourou@softbankrobotics.com>
> +Date: Tue, 23 Jan 2018 15:25:50 +0100
> +Subject: [PATCH] linux.gcc: Fix cross compilation error.
> +
> +When cross compiling on linux with gcc, the host gcc was used instead of
> +the cross gcc to set compilation flags according to gcc version.
> +
> +When the cross gcc was in version 5.X and the host gcc in version 7.X,
> +tbb was compiled with the -flifetime-dse=1 flag that does not exist on
> +gcc 5.X.
> +---
> + build/linux.gcc.inc | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/build/linux.gcc.inc b/build/linux.gcc.inc
> +index 5c1889c..a4d6698 100644
> +--- a/build/linux.gcc.inc
> ++++ b/build/linux.gcc.inc
> +@@ -41,29 +41,29 @@ LINK_FLAGS = -Wl,-rpath-link=. -rdynamic
> + C_FLAGS = $(CPLUS_FLAGS)
> +
> + # gcc 4.2 and higher support OpenMP
> +-ifneq (,$(shell gcc -dumpversion | egrep  "^(4\.[2-9]|[5-9])"))
> ++ifneq (,$(shell $(CC) -dumpversion | egrep  "^(4\.[2-9]|[5-9])"))
> +     OPENMP_FLAG = -fopenmp
> + endif
> +
> + # gcc 4.8 and later support RTM intrinsics, but require command line switch to enable them
> +-ifneq (,$(shell gcc -dumpversion | egrep  "^(4\.[8-9]|[5-9])"))
> ++ifneq (,$(shell $(CC) -dumpversion | egrep  "^(4\.[8-9]|[5-9])"))
> +     RTM_KEY = -mrtm
> + endif
> +
> + # gcc 4.0 and later have -Wextra that is used by some our customers.
> +-ifneq (,$(shell gcc -dumpversion | egrep  "^([4-9])"))
> ++ifneq (,$(shell $(CC) -dumpversion | egrep  "^([4-9])"))
> +     TEST_WARNING_KEY += -Wextra
> + endif
> +
> + # gcc 5.0 and later have -Wsuggest-override option
> + # enable it via a pre-included header in order to limit to C++11 and above
> +-ifneq (,$(shell gcc -dumpversion | egrep  "^([5-9])"))
> ++ifneq (,$(shell $(CC) -dumpversion | egrep  "^([5-9])"))
> +     INCLUDE_TEST_HEADERS = -include $(tbb_root)/src/test/harness_preload.h
> + endif
> +
> + # gcc 6.0 and later have -flifetime-dse option that controls
> + # elimination of stores done outside the object lifetime
> +-ifneq (,$(shell gcc -dumpversion | egrep  "^([6-9])"))
> ++ifneq (,$(shell $(CC) -dumpversion | egrep  "^([6-9])"))
> +     # keep pre-contruction stores for zero initialization
> +     DSE_KEY = -flifetime-dse=1
> + endif
> +--
> +2.15.1
> +
> --
> 2.7.4
>

