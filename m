Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9989C7FCDD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 15:53:20 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id k3so5349281pgc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 07:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=QVZwW8+1pyKT1UygyLijnHZCi+kdX2sNzD0R5qC35Rk=;
	b=dWkm7x9GmJAaDOmLVXBaDR/HnL6d/1DJNr3H2n3ugNx9rwpvJtMc1/6Y3a6s3BuX2s
	1Nol0okOgBFZJZmtVa+SJ7bawWEC6XgpV44k+u6Bgw/90eZ8htvcHtwRlOwFHEpKwydJ
	tIQD/co+NUxxcVWYK1OZ+1MlJO1T3DgCAcxJwYQn5DdhhsnTwlj3f0v2JvDTwDoiVd/n
	Fih0xlh19tTpwEQodFRS5e8Gd1vOov36pPuYUKNDFGO+BD61+qndto7mV6azYqiHkNfy
	j8WE43Zo2gng1BmMnb/XJJvZ6bHV6lJYG9k5aa5a3EEUHs3uZytMD939brIElo5DNA+5
	sPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=QVZwW8+1pyKT1UygyLijnHZCi+kdX2sNzD0R5qC35Rk=;
	b=G10ZQ0GU/b02NiA+dwZBHsaFXsSRSqnis7a8rNhOhqDdh6CBZQy4L9gjEdleCiqpQn
	UPIYcRQDSFKGWq2IeNeAcfNDvl7gkHY+OtCilAf+9/5qSbmTH2K6Rr9cmuJoUEqS5Lsa
	qqaPVTBVv0Dd3UX+XOwNFDj3P97NNHNCDg/Tb2FGi77qgpiFw27aAOkrH5AmyPsor0j6
	BZn038Q7VmDacCcT2y9r/mU0J8TdP2qD/9pgvAcaZ8K4TgL1H9sAbg4JJY1qnuZFWZLR
	UBFd9IAp5wBLUFUAyO5NPGmemHMweXL8bkdql6ul0MvcJ4o2DgPn53rDKJwgRUpr4Wq5
	Mgxg==
X-Gm-Message-State: APjAAAUPbbM/uEvDWFOyCkM2KiQo0rdssWFJVS0sQ977yOofPo2ZOFxR
	2YhpzWe8ZYM2Yjr9P7uhm0te7ffi
X-Google-Smtp-Source: APXvYqzXHmPXsg7xEJy65IkIbwzub/0nELheH7yBXqPCjKXxCKUhbxaG/wMtS2v3FP4FhUI2PGL6iA==
X-Received: by 2002:a63:2d44:: with SMTP id t65mr21342460pgt.112.1580140401304;
	Mon, 27 Jan 2020 07:53:21 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:511c:e4cf:1545:f778?
	([2601:202:4180:a5c0:511c:e4cf:1545:f778])
	by smtp.gmail.com with ESMTPSA id
	c11sm3114135pfo.170.2020.01.27.07.53.19
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 27 Jan 2020 07:53:20 -0800 (PST)
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20200127141908.84922-1-alex.kanavin@gmail.com>
	<20200127141908.84922-8-alex.kanavin@gmail.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <9e7dbe8d-43f2-494c-02da-65f8bc6194f6@gmail.com>
Date: Mon, 27 Jan 2020 07:53:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200127141908.84922-8-alex.kanavin@gmail.com>
Subject: Re: [PATCH 8/9] valgrind: fix the remaining ptest failures
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
X-List-Received-Date: Mon, 27 Jan 2020 15:53:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 1/27/20 6:19 AM, Alexander Kanavin wrote:
> Particularly, one test is disabled as it is failing everywhere,
> two patches that actually cause failures are dropped and
> some binaries are prevented from being stripped where that is
> expected.
So this will address either
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13666  and
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13520 ?

- armin
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...eak_cmsg.stderr.exp-adjust-tmp-paths.patch | 34 +++++++++++++++++++
>  ...rind-adjust-std_list-expected-output.patch | 32 -----------------
>  ...Dereference-pthread_t-before-adding-.patch | 32 -----------------
>  .../valgrind/valgrind_3.15.0.bb               | 23 +++++++++++--
>  4 files changed, 55 insertions(+), 66 deletions(-)
>  create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
>  delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-valgrind-adjust-std_list-expected-output.patch
>  delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
> new file mode 100644
> index 00000000000..d641998d721
> --- /dev/null
> +++ b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
> @@ -0,0 +1,34 @@
> +From f405297d3382cd98391d02f397e2387da1f42879 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Fri, 24 Jan 2020 17:55:39 +0100
> +Subject: [PATCH] none/tests/fdleak_cmsg.stderr.exp: adjust /tmp paths
> +
> +In oe-core, /tmp is linked to /var/volatile/tmp and
> +valgrind output changes accordingly
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + none/tests/fdleak_cmsg.stderr.exp | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/none/tests/fdleak_cmsg.stderr.exp b/none/tests/fdleak_cmsg.stderr.exp
> +index 6e5a797b9..0ede1ab18 100644
> +--- a/none/tests/fdleak_cmsg.stderr.exp
> ++++ b/none/tests/fdleak_cmsg.stderr.exp
> +@@ -25,10 +25,10 @@ Open file descriptor ...: /dev/null
> + 
> + 
> + FILE DESCRIPTORS: 6 open at exit.
> +-Open file descriptor ...: /tmp/data2
> ++Open file descriptor ...: ...
> +    ...
> + 
> +-Open file descriptor ...: /tmp/data1
> ++Open file descriptor ...: ...
> +    ...
> + 
> + Open AF_UNIX socket ...: <unknown>
> +-- 
> +2.17.1
> +
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0002-valgrind-adjust-std_list-expected-output.patch b/meta/recipes-devtools/valgrind/valgrind/0002-valgrind-adjust-std_list-expected-output.patch
> deleted file mode 100644
> index a82972ec1b6..00000000000
> --- a/meta/recipes-devtools/valgrind/valgrind/0002-valgrind-adjust-std_list-expected-output.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 6e1e9265b03cf51d09c028d657fe826d7156a783 Mon Sep 17 00:00:00 2001
> -From: Randy MacLeod <Randy.MacLeod@windriver.com>
> -Date: Mon, 13 May 2019 17:26:26 -0400
> -Subject: [PATCH 2/2] valgrind: adjust std_list expected output
> -
> -The run-ptest script uses a custom --yocto-ptest option
> -to change the summary statistics that valgrind issues
> -to a format that matches what ptest-runner expects.
> -
> -Only this std_list test which checks that strcpy() works
> -properly on Ubuntu-12.04 and later is affected by this change.
> -It's normal output when called with --yocto-ptest is a blank
> -line so adjust the expected output.
> -
> -Upstream-Status: Inappropriate [Yocto specific]
> -
> -Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ----
> - drd/tests/std_list.stderr.exp | 2 --
> - 1 file changed, 2 deletions(-)
> -
> -diff --git a/drd/tests/std_list.stderr.exp b/drd/tests/std_list.stderr.exp
> -index d18786f80..8b1378917 100644
> ---- a/drd/tests/std_list.stderr.exp
> -+++ b/drd/tests/std_list.stderr.exp
> -@@ -1,3 +1 @@
> - 
> --
> --ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
> --- 
> -2.17.0
> -
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch b/meta/recipes-devtools/valgrind/valgrind/0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch
> deleted file mode 100644
> index 05886c743dc..00000000000
> --- a/meta/recipes-devtools/valgrind/valgrind/0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From a6547fc17c120dbd95b852f50b0c4bdee4fedb9a Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 10 Jun 2017 01:20:32 -0700
> -Subject: [PATCH 6/6] pth_detached3.c: Dereference pthread_t before adding
> - offset to it
> -
> -Fixes
> -error: invalid use of undefined type 'struct __pthread'
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - drd/tests/pth_detached3.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/drd/tests/pth_detached3.c b/drd/tests/pth_detached3.c
> -index c02eef1..35d43a6 100644
> ---- a/drd/tests/pth_detached3.c
> -+++ b/drd/tests/pth_detached3.c
> -@@ -21,7 +21,7 @@ int main(int argc, char** argv)
> -   pthread_detach(thread);
> - 
> -   /* Invoke pthread_detach() with an invalid thread ID. */
> --  pthread_detach(thread + 8);
> -+  pthread_detach((pthread_t*)(&thread + 8));
> - 
> -   fprintf(stderr, "Finished.\n");
> - 
> --- 
> -2.13.1
> -
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
> index 6a3834cfdc6..0f86aa44ca6 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
> @@ -29,7 +29,6 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
>             file://0003-correct-include-directive-path-for-config.h.patch \
>             file://0004-pth_atfork1.c-Define-error-API-for-musl.patch \
>             file://0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch \
> -           file://0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch \
>             file://0001-memcheck-arm64-Define-__THROW-if-not-already-defined.patch \
>             file://0002-memcheck-x86-Define-__THROW-if-not-defined.patch \
>             file://0003-tests-seg_override-Replace-__modify_ldt-with-syscall.patch \
> @@ -38,9 +37,9 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
>             file://0001-Make-local-functions-static-to-avoid-assembler-error.patch \
>             file://0001-Return-a-valid-exit_code-from-vg_regtest.patch \
>             file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch \
> -           file://0002-valgrind-adjust-std_list-expected-output.patch \
>             file://0001-adjust-path-filter-for-2-memcheck-tests.patch \
>             file://s390x_vec_op_t.patch \
> +           file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
>             "
>  SRC_URI[md5sum] = "46e5fbdcbc3502a5976a317a0860a975"
>  SRC_URI[sha256sum] = "417c7a9da8f60dd05698b3a7bc6002e4ef996f14c13f0ff96679a16873e78ab1"
> @@ -205,4 +204,24 @@ do_install_ptest() {
>      # handle multilib
>      sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
>      sed -i s:@bindir@:${bindir}:g ${D}${PTEST_PATH}/run-ptest
> +
> +    # This test fails on the host as well, using both 3.15 and git master (as of Jan 24 2020)
> +    # https://bugs.kde.org/show_bug.cgi?id=402833
> +    rm ${D}${PTEST_PATH}/memcheck/tests/overlap.vgtest
> +
> +    # As the binary isn't stripped or debug-splitted, the source file isn't fetched
> +    # via dwarfsrcfiles either, so it needs to be installed manually.
> +    mkdir -p ${D}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/${BP}/none/tests/
> +    install ${S}/none/tests/tls.c ${D}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/${BP}/none/tests/
>  }
> +
> +# avoid stripping some generated binaries otherwise some of the tests will fail
> +# run-strip-reloc.sh, run-strip-strmerge.sh and so on will fail
> +INHIBIT_PACKAGE_STRIP_FILES = "\
> +    ${PKGD}${PTEST_PATH}/none/tests/tls \
> +    ${PKGD}${PTEST_PATH}/none/tests/tls.so \
> +    ${PKGD}${PTEST_PATH}/none/tests/tls2.so \
> +    ${PKGD}${PTEST_PATH}/helgrind/tests/tc09_bad_unlock \
> +    ${PKGD}${PTEST_PATH}/memcheck/tests/manuel1 \
> +    ${PKGD}${PTEST_PATH}/drd/tests/pth_detached3 \
> +"


